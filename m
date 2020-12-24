Return-Path: virtio-comment-return-1591-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A22B986113
	for <virtio-comment@lists.oasis-open.org>; Thu, 24 Dec 2020 05:51:53 +0000 (UTC)
References: <20201218042302.8884-1-jasowang@redhat.com>
 <20201221223338.7b5a21e6.pasic@linux.ibm.com>
 <bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
 <20201222075005.69d1cc6e.pasic@linux.ibm.com>
 <ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
 <20201222131404.61e4a136.cohuck@redhat.com>
 <7da54d5b-0787-c78f-4b35-6a4f7ed2f5bf@redhat.com>
 <20201224055247.5f9ce79c.pasic@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <67271e1e-96ea-4b28-7449-cdb0641aff72@redhat.com>
Date: Thu, 24 Dec 2020 13:51:31 +0800
MIME-Version: 1.0
In-Reply-To: <20201224055247.5f9ce79c.pasic@linux.ibm.com>
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/12/24 =E4=B8=8B=E5=8D=8812:52, Halil Pasic wrote:
> On Tue, 22 Dec 2020 20:51:04 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
>>>>    From Qemu point of view, vhost-vDPA is just another type of vhost
>>>> backend. Qemu needs to stop virtio (vhost) before it can do migration.
>>>> So we require vDPA devices to have the ability of stopping or pausing
>>>> its datapath. If the vDPA device is by chance the virtio-PCI device, i=
t
>>>> needs an interface for receiving stop/resume command from the driver.
>>>>
>>>> So the devce stop/resume command was sent from Qemu to vhost-VDPA, the=
n
>>>> to vDPA parent which could be a virtio-PCI device in this case.
>>> But QEMU implements the _device_, not the driver, doesn't it?
>>
>> The device is implemented with the co-operation between Qemu and
>> vhost-vDPA. During migration qemu need to stop the virtio-net device,
>> then vhost must be stopped as well.
>>
> Sorry for the lazy/stupid question (it's been a while since I last
> understood that code), how does this work with vhost based virtio-net?
>
> I don't see ioctl that stops the old classic vhost (no vdpa). I have
> a fuzzy remembrance that we 'stop' the notifiers (ioeventfd & irqfd) but
> I'm not sure.


Each vhost devices implements its own ioctl:

For vhost-net, it's VHOST_NET_SET_BACKEND, passing -1 as socket fd will=20
stop the device.
For vhost-vsock, it's VHOST_VSOCK_SET_RUNNING.

I don't check SCSI but it should have something similar.


>
> And since we are at virtio-net,


The feature is not net specific.


> I ask myself how are 'new requests' and
> 'requests that is (the device) currently processing' defined for the
> receive functionality and the rx queue(s).  Remember the latter ('in
> flight requests') need to be all completed. I mean 'in-flight' is pretty
> straight-forward for something like virtio-blk, or even for tx but I have
> a hard time with rx.


I think it should be no difference from the view of virtqueue. It's the=20
requests that have been read from avail ring but not added to the used ring=
.

Actually this ties to the visibility of virtqueue internal state.=20
Usually device maintains a tail pointer (last_avail_idx).=C2=A0 So in the=
=20
simplest case when no indices wrap and no out-of-order, requests belongs=20
to [last_avail_idx, used_idx) are considered as in-flight.


>
>>> And IIUC,
>>> vhost-VDPA and the vDPA parent are also on the device side. I feel like
>>> I'm missing something essential here.
>>
>> Virtio-PCI driver could be a vDPA parent as well in this case. So we
>> need stop the virtio-pci device.
> I used to think about vdpa like a vehicle to make partial virtio support
> in HW viable and easy. I.e. when I hear vdpa I have something like this
> in mind:
> https://www.redhat.com/cms/managed-files/2019-10-02-vdpa-figure5.jpg
>
> Of course the 'physical nic' from the linked picture can be a nic that
> supports both the virtio data plane and the virtio control plane (i.e.
> what you are referring to as a virtio-pci device). But do we still expect
> that device to be connected via vdpa?


Why not?[1] With the help of vhost-vDPA, we get the wire speed and live=20
migration support for virtio-pci device.


>
> The second question is not strictly on topic, but I'm still curious, what
> do we plan to do with a lower device that does not support virtio control
> plane?


Yes, the vDPA device just need to implement the same semantic not the=20
same interface. You may refer mlx5e vDPA driver in the kernel source.


> In that case we can't go via DEVICE_STOP. Does that mean, there
> has to be a vendor specific mechanism equivalent to the DEVICE_STOP
> mechanism, or otherwise we are non-migratable?


Exactly.

Thanks

[1] https://lwn.net/Articles/838978/


>
> Regards,
> Halil
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

