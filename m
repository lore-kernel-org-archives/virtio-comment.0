Return-Path: virtio-comment-return-1795-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2AADB9865CD
	for <virtio-comment@lists.oasis-open.org>; Thu, 25 Mar 2021 02:57:42 +0000 (UTC)
References: <20210322034717.35135-1-jasowang@redhat.com>
 <YFnFpcaAg0atjwTt@stefanha-x1.localdomain>
 <48f5695e-9a34-88cd-44a4-a9d31426e6eb@redhat.com>
 <YFsO61ZqKIbx2uV9@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a80fc4ab-d6e1-452a-0727-5bfeb736da8a@redhat.com>
Date: Thu, 25 Mar 2021 10:57:26 +0800
MIME-Version: 1.0
In-Reply-To: <YFsO61ZqKIbx2uV9@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] [PATCH V2 0/2] Introduce VIRTIO_F_QUEUE_STATE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: mst@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, lulu@redhat.com, rob.miller@broadcom.com, pasic@linux.ibm.com, sgarzare@redhat.com, cohuck@redhat.com, jim.harford@broadcom.com
List-ID: <virtio-comment.lists.oasis-open.org>


=E5=9C=A8 2021/3/24 =E4=B8=8B=E5=8D=886:05, Stefan Hajnoczi =E5=86=99=E9=81=
=93:
> On Wed, Mar 24, 2021 at 03:05:30PM +0800, Jason Wang wrote:
>> =E5=9C=A8 2021/3/23 =E4=B8=8B=E5=8D=886:40, Stefan Hajnoczi =E5=86=99=E9=
=81=93:
>>> On Mon, Mar 22, 2021 at 11:47:15AM +0800, Jason Wang wrote:
>>>> This is a new version to support VIRTIO_F_QUEUE_STATE. The feautre
>>>> extends the basic facility to allow the driver to set and get device
>>>> internal virtqueue state. This main motivation is to support live
>>>> migration of virtio devices.
>>> Can you describe the use cases that this interface covers as well as th=
e
>>> steps involved in migrating a device?
>>
>> Yes. I can describe the steps for live migrating virtio-net device. For
>> other devices, we probably need other state.
> Thanks, describing the steps for virtio-net would be great.
>
>>
>>>    Traditionally live migration was
>>> transparent to the VIRTIO driver because it was performed by the
>>> hypervisor.
>>
>> Right, but it could be possible that we may want live migrate between
>> hardware virtio-pci devices. So it's up to the hypversior to save and
>> restore states silently without the notice of guest driver as what we di=
d
>> for vhost.
> This is where I'd like to understand the steps in detail. The set/get
> state functionality introduced in this spec change requires that the
> hypervisor has access to the device's hardware registers - the same
> registers that the guest is also using. I'd like to understand the
> lifecycle and how conflicts between the hypervisor and the guest are
> avoided (unless this is integrated into vDPA/VFIO/SR-IOV in a way that I
> haven't thought of?).


Let's assume virito device is used through vhost-vdpa. In this case,=20
there's actually two virtio devices

1)=C2=A0 The device A that is used by vdpa driver and is connected to vdpa=
=20
bus (vhost-vDPA). Usually it could be a virtio-pci device.
2)=C2=A0 The device B that is emulated by Qemu. It could be virito-pci or=
=20
even virtio-mmio device.

So what guest driver can see is device B, and it can only access the=20
status bit of device B. From the view of Qemu, device A works more like=20
a vhost backend. It means it can stop device A (either via reset or=20
other way like dedicated status bit) without noticing guest (touching=20
the device status bit for device A). When we need to live migrate the VM:

1) Qemu need to stop device B (e.g stop vhost-vDPA)
2) Qemu get virtqueue states from device B
3) The virtqueue state will be passed from source to destinition
4) Qemu recovered the virtqueue states to device C which is the=20
virtio/vDPA device that is on the destination
5) Qemu resume the dev C (e.g start vhost-vDPA)


>
>>
>>> I know you're aware but I think it's worth mentioning that this only
>>> supports stateless devices.
>>
>> Yes, that's why it's a queue state not a device state.
>>
>>
>>>    Even the simple virtio-blk device has state
>>> in QEMU's implementation. If an I/O request fails it can be held by the
>>> device and resumed after live migration instead of failing the request
>>> immediately. The list of held requests needs to be migrated with the
>>> device and is not part of the virtqueue state.
>>
>> Yes, I think we need to extend virtio spec to support save and restore
>> device state. But anyway the virtqueue state is the infrastructure which
>> should be introdouced first.
> Introducing virtqueue state save/load first seems fine, but before
> committing to a spec cange we need an approximate plan for per-device
> state so that it's clear the design can be extended to cover that case
> in the future.


Yes, so as discussed. We might at least requires a API to fetch the=20
inflight descriptors.

Haven't thought it deeply but some possible ways:

1) transport specific way
2) generic method like a control vq command

1) looks simpler but may end up with function duplication, 2) may need=20
some extension on the current virtio-blk.

Actually we had 3), fetchn the information from the management deviec=20
(like PF).


>
>>> I'm concerned that using device reset will not work once this interface
>>> is extended to support device-specific state (e.g. the virtio-blk faile=
d
>>> request list). There could be situations where reset really needs to
>>> reset (e.g. freeing I/O resources) and the device therefore cannot hold
>>> on to state across reset.
>>
>> Good point. So here're some ways:
>>
>>
>> 1) reuse device reset that is done in this patch
>> 2) intorduce a new device status like what has been done in [1]
>> 3) using queue_enable (as what has been done in the virtio-mmio, pci for=
bids
>> to stop a queue currently, we may need to extend that)
>> 4) use device specific way to stop the datapath
>>
>> Reusing device reset looks like a shortcut that might not be easy for
>> stateful device as you said. 2) looks more general. 3) have the issues t=
hat
>> it doesn't forbid the config changed. And 4) is also proposed by you and
>> Michael.
>>
>> My understanding is that there should be no fundamental differences betw=
een
>> 2) and 4). So I tend to respin [1], do you have any other ideas?
> 2 or 4 sound good. I prefer 2 since one standard interface will be less
> work and complexity than multiple device-specific ways of stopping the
> data path.


Yes.


>
> 3 is more flexible but needs to be augmented with a way to pause the
> entire device. It could be added on top of 2 or 4, if necessary, in the
> future.
>
> Stefan


Right, let me try to continue the approach of new status bit to see if=20
it works.

Thanks


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

