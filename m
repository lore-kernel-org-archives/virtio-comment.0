Return-Path: virtio-comment-return-1786-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6365C986572
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 Mar 2021 07:05:47 +0000 (UTC)
References: <20210322034717.35135-1-jasowang@redhat.com>
 <YFnFpcaAg0atjwTt@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <48f5695e-9a34-88cd-44a4-a9d31426e6eb@redhat.com>
Date: Wed, 24 Mar 2021 15:05:30 +0800
MIME-Version: 1.0
In-Reply-To: <YFnFpcaAg0atjwTt@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] [PATCH V2 0/2] Introduce VIRTIO_F_QUEUE_STATE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: mst@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, lulu@redhat.com, rob.miller@broadcom.com, pasic@linux.ibm.com, sgarzare@redhat.com, cohuck@redhat.com, jim.harford@broadcom.com
List-ID: <virtio-comment.lists.oasis-open.org>


=E5=9C=A8 2021/3/23 =E4=B8=8B=E5=8D=886:40, Stefan Hajnoczi =E5=86=99=E9=81=
=93:
> On Mon, Mar 22, 2021 at 11:47:15AM +0800, Jason Wang wrote:
>> This is a new version to support VIRTIO_F_QUEUE_STATE. The feautre
>> extends the basic facility to allow the driver to set and get device
>> internal virtqueue state. This main motivation is to support live
>> migration of virtio devices.
> Can you describe the use cases that this interface covers as well as the
> steps involved in migrating a device?


Yes. I can describe the steps for live migrating virtio-net device. For=20
other devices, we probably need other state.


>   Traditionally live migration was
> transparent to the VIRTIO driver because it was performed by the
> hypervisor.


Right, but it could be possible that we may want live migrate between=20
hardware virtio-pci devices. So it's up to the hypversior to save and=20
restore states silently without the notice of guest driver as what we=20
did for vhost.


>
> I know you're aware but I think it's worth mentioning that this only
> supports stateless devices.


Yes, that's why it's a queue state not a device state.


>   Even the simple virtio-blk device has state
> in QEMU's implementation. If an I/O request fails it can be held by the
> device and resumed after live migration instead of failing the request
> immediately. The list of held requests needs to be migrated with the
> device and is not part of the virtqueue state.


Yes, I think we need to extend virtio spec to support save and restore=20
device state. But anyway the virtqueue state is the infrastructure which=20
should be introdouced first.


>
> I'm concerned that using device reset will not work once this interface
> is extended to support device-specific state (e.g. the virtio-blk failed
> request list). There could be situations where reset really needs to
> reset (e.g. freeing I/O resources) and the device therefore cannot hold
> on to state across reset.


Good point. So here're some ways:


1) reuse device reset that is done in this patch
2) intorduce a new device status like what has been done in [1]
3) using queue_enable (as what has been done in the virtio-mmio, pci=20
forbids to stop a queue currently, we may need to extend that)
4) use device specific way to stop the datapath

Reusing device reset looks like a shortcut that might not be easy for=20
stateful device as you said. 2) looks more general. 3) have the issues=20
that it doesn't forbid the config changed. And 4) is also proposed by=20
you and Michael.

My understanding is that there should be no fundamental differences=20
between 2) and 4). So I tend to respin [1], do you have any other ideas?

Thanks

[1]=20
https://lists.oasis-open.org/archives/virtio-comment/202012/msg00027.html


>
> Stefan


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

