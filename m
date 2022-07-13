Return-Path: <virtio-comment-return-3227-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1B35F986602
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Jul 2022 08:08:25 +0000 (UTC)
Message-ID: <4e1b2590-05b3-1918-151a-638f93a8b834@intel.com>
Date: Wed, 13 Jul 2022 16:08:18 +0800
MIME-Version: 1.0
References: <20220704074142.80791-1-lingshan.zhu@intel.com>
 <CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3weWNwweO2Q@mail.gmail.com>
 <d69e53d7-501f-9718-1a41-f7a576ff1eb9@intel.com>
 <CACGkMEubpx1mGVp+iPJRuwuTt+od3KHV=q_YGdo3gVbJHNrYiQ@mail.gmail.com>
 <98ee6e86-a4eb-e933-459c-7290401c7ee1@intel.com>
 <573bbde3-5568-a7ca-0c0b-833fedcd5e0d@intel.com>
 <ce2d2581-80a0-835a-65cc-f39bf43a8032@redhat.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <ce2d2581-80a0-835a-65cc-f39bf43a8032@redhat.com>
Subject: Re: [virtio-comment] Re: [PATCH] Introduce virtio virtual device and
 transport vq
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, eperezma <eperezma@redhat.com>, Cindy Lu <lulu@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, nrupal.jani@intel.com, "Uminski, Piotr" <Piotr.Uminski@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>



On 7/13/2022 2:04 PM, Jason Wang wrote:
>
> =E5=9C=A8 2022/7/12 18:39, Zhu, Lingshan wrote:
>>>>
>>>> struct mgmt_dev_avail_res{}, if min_vdev_vqs =3D=3D max_vdev_vqs, mean=
s=20
>>>> the management device
>>>> only supports creating virtual devices with fixed capabilities,=20
>>>> this kind of virtual devices
>>>> can be pre-created. Like the slab allocator, vendors can pre-create=20
>>>> the device. Then when the management
>>>> device receiving the VDEV_CREATE command,=C2=A0 it can just pick up a=
=20
>>>> free virtual device, and return the
>>>> virtual device.
>>> So the question still remains, how could we discover those pre-created
>>> devices? (having something like initial_vfs?)
>> I think for the management devices, pre-creation could be pre-allocated
>> hw resource. The management device could pre-allocate a certain=20
>> number of
>> "standard" managed devices, when receive a create command, the=20
>> management
>> device can pick a free managed device, assign an UUID to it, then return
>> to the management driver. So the driver may not be aware of this=20
>> pre-creation,
>> it just sees the device is created rapidly. Just like the slab=20
>> system, or a threads pool.
>
>
> So for "pre-creating" I meant from the driver perspective. What you=20
> describe here is invisible to driver. So we don't need a dedicate=20
> feature in this case.
Yes, we should not describe "pre-create" here, I only talk about the=20
managed devices with fixed num_queues. This is some kind of "pre-create"=20
in the hw,
pooling the source, not visible to the driver.
>
> Btw, I think we need a command to support virtqueue reset in the next=20
> version.
Do you mean reset vq and re-enable vq of virtio 1.2?
I think we don't need to reset the MSI entry for the queue upon a reset,=20
right?
Because MSI entries are not queue configs and not meaningful to reset it.
But we need to drop all pending MSI, right?

Thanks,
Zhu Lingshan
>
> Thanks
>
>
>>>
>>>>
>>>> The bit only makes sense for the case when some managed(virtual)
>>>> devices are pre-created like initial_vfs in SR-IOV. If we allow
>>>> pre-creation, we need commands to discover them.
>>>>
>>>> I think we need the feature bit VIRTIO_F_TRNSPT_VQ_VDEV, this=20
>>>> feature bit indicates that the transport
>>>> virtqueue is the transport layer for the virtual devices, like PCI=20
>>>> for a virtio PCI hardware.
>>>> So, not only create, we use the transport virtqueue to config the=20
>>>> device as well.
>>>>
>>>> And if the virtual devices are pre-created, we can just send the=20
>>>> create command, and the management device
>>>> can find a available device for us, this is also discovery.
>>> This seems to conflict with the semantics of pre-created devices.
>> same to the above
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

