Return-Path: virtio-comment-return-1613-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6F6209863F9
	for <virtio-comment@lists.oasis-open.org>; Wed, 30 Dec 2020 08:04:07 +0000 (UTC)
References: <20201218042302.8884-1-jasowang@redhat.com>
 <20201221223338.7b5a21e6.pasic@linux.ibm.com>
 <bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
 <20201222075005.69d1cc6e.pasic@linux.ibm.com>
 <ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
 <20201222131404.61e4a136.cohuck@redhat.com>
 <7da54d5b-0787-c78f-4b35-6a4f7ed2f5bf@redhat.com>
 <20201222165431.3f49de29.cohuck@redhat.com>
 <3cf88dc9-4053-0f24-854f-6cc6df2aaac4@redhat.com>
 <20201225083835.62efb230.pasic@linux.ibm.com>
 <ae55616a-ceb0-3868-933b-d93a73d717be@redhat.com>
 <20201229142058.7afd8299.pasic@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <80343f69-5509-8675-2251-b8f21c76594d@redhat.com>
Date: Wed, 30 Dec 2020 16:03:53 +0800
MIME-Version: 1.0
In-Reply-To: <20201229142058.7afd8299.pasic@linux.ibm.com>
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/12/29 =E4=B8=8B=E5=8D=889:20, Halil Pasic wrote:
> On Mon, 28 Dec 2020 14:47:21 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
> [..]
>>> Right. The reason why we have to wait for the completion of the channel
>>> program is exactly that. Furthermore if we have to fail setting
>>> FEATURES_OK we fail the channel program, that was supposed to do the
>>> operation with an unit check. So at the point where the set_status() is
>>> done, we already know if it worked or not.
>>
>> The only difference is, for FEATURES_OK, driver know it won't work any
>> more. But for DEVICE_STOPPED, driver know it might work sometime in the
>> future.
>>
> If the channel program fails with a command reject, that that ccw is not
> allowed to cause further side effects. I.e. we can not fail the channel
> program, but then make the operation succeed later.
>
>>> Of course the device can
>>> change it's status any time.
>>>
>>> Since we have a synchronous API setting DEVICE_STOPPED would also have =
to
>>> block until all in-flight requests are completed. But this does not see
>>> to be what you want. I understood that
>>> virtio_add_status(dev, DEVICE_STOPPED) would return immediately, and so=
 would
>>> a subsequent config->get_status(dev) without the DEVICE_STOPPED bit set=
,
>>> if there are still outstanding requests.
>>
>> Yes.
>>
>>
>>> I don't think defining virtio_add_status(dev, FEATURES_OK) (followed by
>>> a readback) as synchronous and virtio_add_status(dev, DEVICE_STOPPED)
>>> (followed by a readback) as asynchronous is a good idea.
>>
>> The main reason is that DEVICE_STOPPED is a one of the possible state.
>> We'd better do this by extending the current device status state
>> machine. Otherwise it would be more complicated (e.g using another
>> interface).
>>
>> It looks to me what you don't like is the driver API design? If yes, how
>> about introduce something like virtio_try_add_status()? The difference
>> is that it doesn't=C2=A0 require a immediate result.
>>
> Yes a new (Linux) driver API operation sounds good -- at least on the
> surface. I would rather call it virtio_add_status_async() than
> virtio_try_add_status() because for me 'try' tells that something may
> or may not work, but the outcome is decided when the function
> returns. E.g. try_lock(l) may or may not succeed the lock l, but when it
> returns you know if it did take l or not.


I agree.


>
> But how would you implement that new operation? I guess it would still
> have to boil down to config->set_status(dev), and to set_status(s),
> being asynchronous when s & DEVICE_STOPPED and synchronous otherwise (and
> in particular FEATURES_OK is added to the status).


Or it could be done via a dedicated config ops like how vp_reset() did.


>
> Ultimately a set_status(b) boils down to a iowrite8(b) for the PCI
> transport, and to a channel program that references a single byte buffer
> with the value of b for Channel IO transport. Making that synchroneaous
> or asynchronous depending on the value of b does not sound right.


Just to make sure we're in the same page. I meant e.g in=20
CCW_CMD_WRITE_STATUS, qemu just propagate the request of device stop to=20
device and return success. And it's the device that decide when it can=20
set the DEVICE_STOPPED bit and then the next CCW_CMD_READ_STATUS could=20
read the bit.


>
> Maybe Conny can chime in on this later as well.
>
> [..]
>>>    AFAIK x86 uses normal
>>> memory access instructions. I suppose when a store instruction does not
>>> fail, then the store must happen. Or is that only true for RAM and for
>>> PCI memory not?
>>
>> AFAIK, PCI have non-posted write which can fail but the spec doesn't
>> requires that.
>>
> So for a posted write a PCI device can just silently discard writes it
> does not 'like' (i.e. pretend there was no such transaction in the first
> place)?


I might be wrong, but it's my understanding as well.


>
> [..]
>> So did PCI:
>>
>>   =C2=A0=C2=A0=C2=A0 case VIRTIO_PCI_STATUS:
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(val & VIRTIO_CONFIG_S=
_DRIVER_OK)) {
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vir=
tio_pci_stop_ioeventfd(proxy);
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtio_set_status(vdev, val=
 & 0xFF);
>>
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (val & VIRTIO_CONFIG_S_D=
RIVER_OK) {
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vir=
tio_pci_start_ioeventfd(proxy);
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vdev->status =3D=3D 0) =
{
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vir=
tio_pci_reset(DEVICE(proxy));
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> As you said, it's a implementation property since qemu implements a
>> synchronous virtio_set_status(). But it might not be true for real
>> hardware which may require more time or even hard to drain a queue in
>> short time. That's why PCI spec mandate the driver to poll for the
>> status after writing zero to device status.
>>
> That is a PCI specific thing, and unfortunately my PCI skills are very
> limited.
>
> Please compare
>
> static void vp_reset(struct virtio_device *vdev)
> {
> =09vp_iowrite8(0, &vp_dev->common->device_status);
> [..]
>          while (vp_ioread8(&vp_dev->common->device_status))
>                  msleep(1);
>
> With
> int virtio_finalize_features(struct virtio_device *dev)
> {
> [..]
>          virtio_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
>          status =3D dev->config->get_status(dev);
>          if (!(status & VIRTIO_CONFIG_S_FEATURES_OK)) {
>
> The latter clearly assumes that the first get_status() will
> yield the final outcome, where the former clearly assumes that
> the effect of set_status() may be delayed beyond the first
> subsequent get_status().


I think the reason is that. For PCI, the spec forces the device to=20
either set or clear the FEATURE_OK during write. But for reset, device=20
may choose to delay setting status to 0 after the write.


>
> Btw, if the device were to to fail resetting itself, what would
> you expect to happen? I would expect the device to present a
> status DEVICE_NEEDS_RESET, but that would effectively make
> vp_reset() getting stuck in that loop.


Yes, then it looks like a recursion here.


>   Or does the spec guarantee
> that a reset must work eventually?


My understanding is that the spec implies it must succeed eventually.


>
> [..]
>
>>>> PCI can use new filed. But I wonder how can that help for CCW.
>>> Using a new mechanism to request the device to stop would help with
>>> the synchronous vs asynchronous stuff. I.e. we could keep the FEATURES_=
OK
>>> synchronous, and make REQUEST_STOP asynchronous.
>>
>> Right, but as said before, it looks more like a part of device status
>> state machine, using new mechanism might bring extra complexity and
>> confusion.
>>
>> Looking at CCW implementation of device status, I don't see any blocker
>> for implementing it synchronously if we just wait for the stop of the
>> device and then return?
>>
> I don't see a problem on the qemu side, but I do see a problem on
> the guest side. There is a reason why you want set DEVICE_STOPPED to
> be asynchronous.


So my understanding is that. at least for current kernel virtio drivers,=20
it doesn't need DEVICE_STOPPED since there's no actual use cases. So no=20
need for inventing new helpers.

It would be only need for the vDPA drivers that is used by userspace via=20
vhost-vDPA. In this case, we just provide the mechanism to write and=20
read status, vDPA driver don't need to enforce any policy in the middle=20
(e.g polling or not).

Thanks


>
> Regards,
> Halil
>
> [..]
>


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

