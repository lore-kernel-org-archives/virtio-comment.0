Return-Path: virtio-comment-return-648-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0A3A6985AA2
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Feb 2019 12:56:28 +0000 (UTC)
Date: Mon, 25 Feb 2019 12:56:06 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190225125605.GB2710@work-vm>
References: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
Subject: Re: [virtio-comment] RFC: virtio-hostmem (+ Continuation of
 discussion from [virtio-dev] Memory sharing device)
To: Frank Yang <lfy@google.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Roman Kiryanov <rkir@google.com>
List-ID: <virtio-comment.lists.oasis-open.org>

* Frank Yang (lfy@google.com) wrote:
> virtio-hostmem is a proposed way to share host memory to the guest and
> communicate notifications. One potential use case is to have userspace
> drivers for virtual machines.
> 
> The latest version of the spec proposal can be found at
> 
> https://github.com/741g/virtio-spec/blob/master/virtio-hostmem.tex
> 
> The revision history so far:
> 
> https://github.com/741g/virtio-spec/commit/7c479f79ef6236a064471c5b1b8bc125c887b948
> - originally called virtio-user
> https://github.com/741g/virtio-spec/commit/206b9386d76f2ce18000dfc2b218375e423ac8e0
> - renamed to virtio-hostmem and removed dependence on host callbacks
> https://github.com/741g/virtio-spec/commit/e3e5539b08cfbaab22bf644fd4e50c00ec428928
> - removed a straggling mention of a host callback
> https://github.com/741g/virtio-spec/commit/61c500d5585552658a7c98ef788a625ffe1e201c
> - Added an example usage of virtio-hostmem
> 
> This first RFC email includes replies to comments from mst@redhat.com:
> 
>   > \item Guest allocates into the PCI region via config virtqueue messages.
> 
> Michael: OK so who allocates memory out of the PCI region?
> Response:
> 
> Allocation will be split by guest address space versus host address space.
> 
> Guest address space: The guest driver determines the offset into the BAR in
> which to allocate the new region. The implementation of the allocator
> itself may live on the host (while guest triggers such allocations via the
> config virtqueue messages), but the ownership of region offsets and sizes
> will be in the guest. This allows for the easy use of existing guest
> ref-counting mechanisms such as last close() calling release() to clean up
> the memory regions in the guest.
> 
> Host address space: The backing of such memory regions is considered
> completely optional. The host may service a guest region with a memory of
> its choice that depends on the usage of the device. The time this servicing
> happens may be any time after the guest communicates the message to create
> a memory region, but before the guest destroys the memory region. In the
> meantime, some examples of how the host may respond to the allocation
> request:
> 
>    - The host does not back the region at all and a page fault happens.

Note that a mapping missing on the host wont necessarily turn into a
page fault in the guest; on qemu for example, if you have a memory
region like this where the guest accesses an area with no mapping, I
think we hit a kvm error.

Dave
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

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

