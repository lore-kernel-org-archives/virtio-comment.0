Return-Path: <jasowang@redhat.com>
Message-ID: <ce2d2581-80a0-835a-65cc-f39bf43a8032@redhat.com>
Date: Wed, 13 Jul 2022 14:04:48 +0800
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH] Introduce virtio virtual device and
 transport vq
References: <20220704074142.80791-1-lingshan.zhu@intel.com>
 <CACGkMEt5E1dEiT6SX7-+dePMzTJjWPrTOwaoFD=3weWNwweO2Q@mail.gmail.com>
 <d69e53d7-501f-9718-1a41-f7a576ff1eb9@intel.com>
 <CACGkMEubpx1mGVp+iPJRuwuTt+od3KHV=q_YGdo3gVbJHNrYiQ@mail.gmail.com>
 <98ee6e86-a4eb-e933-459c-7290401c7ee1@intel.com>
 <573bbde3-5568-a7ca-0c0b-833fedcd5e0d@intel.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <573bbde3-5568-a7ca-0c0b-833fedcd5e0d@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: virtio-comment@lists.oasis-open.org, mst <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, eperezma <eperezma@redhat.com>, Cindy Lu <lulu@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, nrupal.jani@intel.com, "Uminski, Piotr" <Piotr.Uminski@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>


在 2022/7/12 18:39, Zhu, Lingshan 写道:
>>>
>>> struct mgmt_dev_avail_res{}, if min_vdev_vqs == max_vdev_vqs, means 
>>> the management device
>>> only supports creating virtual devices with fixed capabilities, this 
>>> kind of virtual devices
>>> can be pre-created. Like the slab allocator, vendors can pre-create 
>>> the device. Then when the management
>>> device receiving the VDEV_CREATE command,  it can just pick up a 
>>> free virtual device, and return the
>>> virtual device.
>> So the question still remains, how could we discover those pre-created
>> devices? (having something like initial_vfs?)
> I think for the management devices, pre-creation could be pre-allocated
> hw resource. The management device could pre-allocate a certain number of
> "standard" managed devices, when receive a create command, the management
> device can pick a free managed device, assign an UUID to it, then return
> to the management driver. So the driver may not be aware of this 
> pre-creation,
> it just sees the device is created rapidly. Just like the slab system, 
> or a threads pool.


So for "pre-creating" I meant from the driver perspective. What you 
describe here is invisible to driver. So we don't need a dedicate 
feature in this case.

Btw, I think we need a command to support virtqueue reset in the next 
version.

Thanks


>>
>>>
>>> The bit only makes sense for the case when some managed(virtual)
>>> devices are pre-created like initial_vfs in SR-IOV. If we allow
>>> pre-creation, we need commands to discover them.
>>>
>>> I think we need the feature bit VIRTIO_F_TRNSPT_VQ_VDEV, this 
>>> feature bit indicates that the transport
>>> virtqueue is the transport layer for the virtual devices, like PCI 
>>> for a virtio PCI hardware.
>>> So, not only create, we use the transport virtqueue to config the 
>>> device as well.
>>>
>>> And if the virtual devices are pre-created, we can just send the 
>>> create command, and the management device
>>> can find a available device for us, this is also discovery.
>> This seems to conflict with the semantics of pre-created devices.
> same to the above

