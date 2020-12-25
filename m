Return-Path: virtio-comment-return-1595-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4FF68986202
	for <virtio-comment@lists.oasis-open.org>; Fri, 25 Dec 2020 06:45:46 +0000 (UTC)
References: <20201218042302.8884-1-jasowang@redhat.com>
 <20201221223338.7b5a21e6.pasic@linux.ibm.com>
 <bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
 <20201222075005.69d1cc6e.pasic@linux.ibm.com>
 <ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
 <20201222131404.61e4a136.cohuck@redhat.com>
 <7da54d5b-0787-c78f-4b35-6a4f7ed2f5bf@redhat.com>
 <20201224055247.5f9ce79c.pasic@linux.ibm.com>
 <67271e1e-96ea-4b28-7449-cdb0641aff72@redhat.com>
 <20201225041811.33dbbd4b.pasic@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <88f1134c-e1ca-e8e7-2fa6-9d6e1ca68d79@redhat.com>
Date: Fri, 25 Dec 2020 14:45:28 +0800
MIME-Version: 1.0
In-Reply-To: <20201225041811.33dbbd4b.pasic@linux.ibm.com>
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/12/25 =E4=B8=8A=E5=8D=8811:18, Halil Pasic wrote:
> On Thu, 24 Dec 2020 13:51:31 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
>> On 2020/12/24 =E4=B8=8B=E5=8D=8812:52, Halil Pasic wrote:
>>> On Tue, 22 Dec 2020 20:51:04 +0800
>>> Jason Wang <jasowang@redhat.com> wrote:
>>>
> [..]
>> Each vhost devices implements its own ioctl:
>>
>> For vhost-net, it's VHOST_NET_SET_BACKEND, passing -1 as socket fd will
>> stop the device.
>> For vhost-vsock, it's VHOST_VSOCK_SET_RUNNING.
>>
>> I don't check SCSI but it should have something similar.
>>
> Thanks!
>
>>> And since we are at virtio-net,
>>
>> The feature is not net specific.
>>
> Nod.
>
>>> I ask myself how are 'new requests' and
>>> 'requests that is (the device) currently processing' defined for the
>>> receive functionality and the rx queue(s).  Remember the latter ('in
>>> flight requests') need to be all completed. I mean 'in-flight' is prett=
y
>>> straight-forward for something like virtio-blk, or even for tx but I ha=
ve
>>> a hard time with rx.
>>
>> I think it should be no difference from the view of virtqueue. It's the
>> requests that have been read from avail ring but not added to the used r=
ing.
>>
>> Actually this ties to the visibility of virtqueue internal state.
>> Usually device maintains a tail pointer (last_avail_idx).=C2=A0 So in th=
e
>> simplest case when no indices wrap and no out-of-order, requests belongs
>> to [last_avail_idx, used_idx) are considered as in-flight.
>>
> I wouldn't call it virtqueue internal state, but I get what you mean. The
> virtio specification is concerned with the device/driver interface. The
> driver does not and can not differentiate between buffers that are
> available but "haven't been read from avail ring", and those that have
> "been read from the avail ring". As you said last_avail_idx is a device
> private thing -- a device internal state.


Exactly.


>
> I tend to say, that from a perspective of the driver, all requests that
> are available, and not yet used, are in-flight. So we have to be very
> careful when wording this requirement, to avoid misunderstandings. I
> don't think the first RFC is good enough. I will think some more about
> this.


Yes, I agree. The problem is that the spec doesn't describe how device=20
work, so if we want to be more accurate, it might require some work not=20
only for stop but also for e.g reset (something like in flight has been=20
used by the spec in that case).


> I'm under the impression that considering virtio console (serial)
> could be useful, as it provides a reliable duplex data transfer. I.e.
> some I/O is not driver initiated, but dropping packets ain't OK. So, the
> data may be in flight without the virtqueue buffer being in flight
> according to our latest definition ([last_avail_idx, used_idx)).


Yes.


> Sorry, I have the feeling I'm spouting out half baked thoughts. Thank you
> for bearing with me.


You're welcome and you comments are very helpful and appreciated.

Thanks


>
>>>>> And IIUC,
>>>>> vhost-VDPA and the vDPA parent are also on the device side. I feel li=
ke
>>>>> I'm missing something essential here.
>>>> Virtio-PCI driver could be a vDPA parent as well in this case. So we
>>>> need stop the virtio-pci device.
>>> I used to think about vdpa like a vehicle to make partial virtio suppor=
t
>>> in HW viable and easy. I.e. when I hear vdpa I have something like this
>>> in mind:
>>> https://www.redhat.com/cms/managed-files/2019-10-02-vdpa-figure5.jpg
>>>
>>> Of course the 'physical nic' from the linked picture can be a nic that
>>> supports both the virtio data plane and the virtio control plane (i.e.
>>> what you are referring to as a virtio-pci device). But do we still expe=
ct
>>> that device to be connected via vdpa?
>>
>> Why not?[1] With the help of vhost-vDPA, we get the wire speed and live
>> migration support for virtio-pci device.
> Indeed.
>
>>
>>> The second question is not strictly on topic, but I'm still curious, wh=
at
>>> do we plan to do with a lower device that does not support virtio contr=
ol
>>> plane?
>>
>> Yes, the vDPA device just need to implement the same semantic not the
>> same interface. You may refer mlx5e vDPA driver in the kernel source.
> Thanks! I will have a look.
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

