Return-Path: virtio-comment-return-649-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E5E1E985AA2
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Feb 2019 13:50:41 +0000 (UTC)
Date: Mon, 25 Feb 2019 08:50:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190225083700-mutt-send-email-mst@kernel.org>
References: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
Subject: [virtio-comment] Re: RFC: virtio-hostmem (+ Continuation of discussion from
 [virtio-dev] Memory sharing device)
To: Frank Yang <lfy@google.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Roman Kiryanov <rkir@google.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Sun, Feb 24, 2019 at 01:18:11PM -0800, Frank Yang wrote:
> virtio-hostmem is a proposed way to share host memory to the guest and
> communicate notifications. One potential use case is to have userspace drivers
> for virtual machines.
> 
> The latest version of the spec proposal can be found at
> 
> https://github.com/741g/virtio-spec/blob/master/virtio-hostmem.tex
> 
> The revision history so far:
> 
> https://github.com/741g/virtio-spec/commit/
> 7c479f79ef6236a064471c5b1b8bc125c887b948 - originally called virtio-user
> https://github.com/741g/virtio-spec/commit/
> 206b9386d76f2ce18000dfc2b218375e423ac8e0 - renamed to virtio-hostmem and
> removed dependence on host callbacks
> https://github.com/741g/virtio-spec/commit/
> e3e5539b08cfbaab22bf644fd4e50c00ec428928 - removed a straggling mention of a
> host callback
> https://github.com/741g/virtio-spec/commit/
> 61c500d5585552658a7c98ef788a625ffe1e201c - Added an example usage of
> virtio-hostmem
> 
> This first RFC email includes replies to comments from mst@redhat.com:
> 
>   > \item Guest allocates into the PCI region via config virtqueue messages.
> 
> Michael: OK so who allocates memory out of the PCI region? 
> Response:
> 
> Allocation will be split by guest address space versus host address space.
> 
> Guest address space: The guest driver determines the offset into the BAR in
> which to allocate the new region. The implementation of the allocator itself
> may live on the host (while guest triggers such allocations via the config
> virtqueue messages), but the ownership of region offsets and sizes will be in
> the guest. This allows for the easy use of existing guest ref-counting
> mechanisms such as last close() calling release() to clean up the memory
> regions in the guest.
> 
> Host address space: The backing of such memory regions is considered completely
> optional. The host may service a guest region with a memory of its choice that
> depends on the usage of the device. The time this servicing happens may be any
> time after the guest communicates the message to create a memory region, but
> before the guest destroys the memory region. In the meantime, some examples of
> how the host may respond to the allocation request:
> 
>   • The host does not back the region at all and a page fault happens.

Then what? Guest dies?
That doesn't sound reasonable, in particular if you want to
allow userspace to map this memory.

>   • The host has already allocated host RAM (from some source; vkMapMemory,
>     malloc(), mmap, etc) memory of some kind and maps a page-aligned host
>     pointer to the guest physical address corresponding to the region.

I'm not sure what does "of some kind" mean here.
Also host and guest might have different ideas about
what does page-aligned mean.

>   • The host has already set up a MMIO region (such as via the MemoryRegion API
>     in QEMU) and maps that MMIO region to the guest physical address, allowing
>     for MMIO callbacks to happen on read/writes to that memory region.

Callbacks are an implementation detail.


What is missing here is description of how device behaves
from guest point of view.
And this will affect how guest behaves.
For example should guest map the memory uncacheable? WB?
MMIO would need uncacheable. RAM would need WB.

If we are following vhost-pci design then the memory should behave as
RAM. It can be faulted in lazily but that is transparent to guest.
Actions trigger through queues, not MMIO.


>   > \item Guest: After a packet of compressed video stream is downloaded to the
> >     buffer, another message, like a doorbell, is sent on the ping virtqueue
> to
> >         consume existing compressed data. The ping message's offset field is
> >         set to the proper offset into the shared-mem object.
> 
> Michael: BTW is this terminology e.g. "download", "ping message" standard
> somewhere?
> Response:
> 
> Conceptually, it has a lot in common with "virtqueue notification" or "doorbell
> register". We should resolve to a more standard terminology; what about
> "notification"?


Virtio uses the terms "available buffer notification" and
"used buffer notification". If this follows vhost-pci design
tnen available buffer notification is sent host to guest,
and used buffer notification is sent guest to host.
Virtio is the reverse.

>   > \item Large bidirectional transfers are possible with zero copy.
> 
> Michael: However just to make sure, sending small amounts of data
> is slower since you get to do all the mmap dance.
> 
> Reponse: Yes it will be very slow if the user chooses to perform mmap for each
> transfer. However, we expect that for users who want to perform frequent
> transfers of small amounts of data, such as for the sensors / codec use cases,
> that the mmap happens once on instance creation with a single message to create
> a memory region, and then every time a transfer hapens, only the notification
> message is needed, while the existing mmap'ed region is reused. We expect the
> regions to remain fairly stable over the use of the instance, in most cases;
> the guest userspace will also mmap() once to get direct access to the host
> memory, then reuse it many times while sending traffic.
> 
>   > \item It is not necessary to use socket datagrams or data streams to
> >     communicate the ping messages; they can be raw structs fresh off the
> >         virtqueue.
> 
> Michael: OK and ping messages are all fixed size? 
> Response:
> 
> Yes, all ping messages are fixed size. 
> 
> Michael: OK I still owe you that write-up about vhost pci.  will try to
> complete
> that early next week. But generally if I got it right that the host
> allocates buffers then what you describe does seem to fit a bit better
> with the vhost pci host/guest interface idea.
> 
> One question that was asked about vhost pci is whether it is in fact
> necessary to share a device between multiple applications.
> Or is it enough to just have one id per device?  
> 
> Response:
> Yes, looking forward! I'm kind of getting some rough idea now of what you may
> be referring to with vhost pci, perhaps if we can use a shared memory channel
> like Chrome to drive vhost or something. I'll wait for the full response before
> designing more into this area though :)
> 
> For now, it's not necessary to share the device between multiple VMs, but it is
> necessary to share between multiple guest processes, so multiple instance ids
> need to be supported for each device id.
> 
> It is also possible to share one instance id across guest processes as well. In
> the codec example, the codec may run in a separate guest process from the guest
> process that consumes the data, so to prevent copies, ideally both would have a
> view of the same host memory.

Especially in this case, this needs some security model enforced by
guest kernel.

> Similar things shows up when running Vulkan or
> gralloc/dmabuf-like mechanisms; in recent versions of gralloc for example, one
> process allocates the memory while other processes share that memory by mapping
> it directly. 

I'm only vaguely familiar with that.
They map is through kernel right?

> However those are between guest processes. For inter-VM communication, I am
> still a bit tentative on this but it shows that instance id's fundamentally
> reflect a host-side context and its resources. Two VMs could map the same host
> memory in principle (though I have not tried it with KVM, I'm not sure if
> things explode if set user memory region happens for the same host memory
> across two VMs), and if it makes sense for them to communicate over that
> memory, then it makes sense for the instance id to be shared across the two VMs
> as well.
> 
> Anyway, thanks for the feedback!
> 
> Best,
> 
> Frank

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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

