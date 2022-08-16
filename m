Return-Path: <lingshan.zhu@intel.com>
Message-ID: <0b0f00a3-4c5b-e5d1-580b-f0afb4002b04@intel.com>
Date: Tue, 16 Aug 2022 13:55:24 +0800
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH V3 RESEND 2/4] Introduce the commands set
 of the transport vq
References: <20220805095343.486546-1-lingshan.zhu@intel.com>
 <20220805095343.486546-3-lingshan.zhu@intel.com>
 <CACGkMEuYduqSSEVXRK7ThpuKzrC2RcWw8Q6gKD7=3Cf0RSa86Q@mail.gmail.com>
 <6482a483-bccb-26c8-dc4d-cd2d24168009@intel.com>
 <CACGkMEv06sDGDfxtYnij_WhXus26aTK525fBfc4rLQvNjh7APA@mail.gmail.com>
 <aae0a39c-1431-3d64-ce5d-17781795623f@intel.com>
 <20220810084723-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20220810084723-mutt-send-email-mst@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, nrupal.jani@intel.com, "Uminski, Piotr" <Piotr.Uminski@intel.com>, hang.yuan@intel.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>



On 8/10/2022 8:58 PM, Michael S. Tsirkin wrote:
> On Wed, Aug 10, 2022 at 04:49:25PM +0800, Zhu, Lingshan wrote:
>>> I meant having MSI vectors and let the virtqueue refer to the MSI vectors.
>>>
>>> Current design means for a 1024 virtqueues device to store 1024 MSI entries.
>>> With the indirection of the MSI vectors array, the device is free to
>>> have 1 to 1024 MSI entries.
>> I am not sure I get your points, how can the queues decide the MSI entries,
>> it should
>> be the driver and the platform set the vq's MSI. The driver has to
>> decide/control and handle
>> the MSI interrupts.
>>
>> IMHO there are two options:
>> 1)every virtqueue stores its own MSI vector, per-vq MSI vector can get
>> better performance
>> for sure. But if there are limited MSI resources, the driver may decide to
>> share MSI vectors
>> among the vqs(1k queues, 1 to 1024 MSI entries), and there should be proper
>> interrupt handlers in the driver.
>>
>> 2)add a device scope MSI entry(only for vqs, not config interrupt, because
>> we don't want to look into config space every time receive a vq interrupt),
>> all interrupts from the device are through this MSI entry,
>> this is optional, can help save resource. But this is complex, like first
>> set a device scope MSI for all vqs, then set a MSI for vq1, in this case,
>> we need vq1 use its own MSI to send interrupts, shadows the device MSI. This
>> is complex, maybe not worthy, I think the platform(x86, arm) has enough
>> MSI resource and it is just one vector per vq.
> Consider a PCI device with subfunctions for example. It maintains
> MSI-X vectors in an MSI-X table. vq has to select a vector from
> that table. Which one?
> 1- vq can map to a vector number (this is what PCI)
> 2- vq can just imply vector number e.g. if vector number == vq number
> 3- vq can include a copy of vector itself
>
> 3 will force us to come up with a way to mask vectors in the transport,
> not nice.
I am not sure for SIOV SF devices, whether the parent PCI device needs 
to store all
MSI information in its MSI table.

Because these MSI vectors are not for the PCI device to send interrupts, 
they are for
the SFs, this means we even don't need the PCI AIPs.

Every SF's vq should be able to store its own MSI vector. For this 
transport vq,
I think it provides a way to set a vector for the vq, the vector may not 
be a copy of the PCI
vector, nor map to any PCI vectors.

Thanks
>

