Return-Path: virtio-comment-return-1243-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 22F51986048
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 May 2020 10:38:55 +0000 (UTC)
Date: Fri, 15 May 2020 12:38:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20200515103848.cabaudxhbjxbxbsg@sirius.home.kraxel.org>
References: <20200507232436.1540-1-gurchetansingh@chromium.org>
 <20200512122220.znxa47meycvkc6j5@sirius.home.kraxel.org>
 <CAAfnVBkMS-_zQ8Cv5Di71z1bQtT54JUNPYMAyPm8d=G969=MUw@mail.gmail.com>
 <20200513070344.lygzol7xohxzb4y3@sirius.home.kraxel.org>
 <CAAfnVBkYTDPJMpuX8KrvdJ-FSEwWXpN3J_UjZYjS076fjyk8dg@mail.gmail.com>
 <20200514082449.gg2u6ltixbvmtplp@sirius.home.kraxel.org>
 <CAAfnVB=XaPrHzONdGY2KEvDSXNHBxSJevmGDVmU8btJgOJjruQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVB=XaPrHzONdGY2KEvDSXNHBxSJevmGDVmU8btJgOJjruQ@mail.gmail.com>
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, Chia-I Wu <olvaffe@gmail.com>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

> v3 only allows VIRTIO_GPU_BLOB_MEM_GUEST for dumb blob resources,
> which implies we won't really use TRANSFER_BLOB.
> 
> Currently, the path seems to be:
> 
> SET_SCANOUT
> TRANSFER_TO_HOST_2D --> copies from iovecs to host private resource
> RESOURCE_FLUSH_BLOB --> copies from host private resource to framebuffer

Yes.

> A theoretical display update path would be for dumb BOs without shared
> mappings would be:
> 
> SET_SCANOUT_BLOB
> RESOURCE_FLUSH_BLOB --> copies from iovecs to framebuffer
> 
> That should work with crosvm, you might want to verify if it's doable with QEMU.

I think qemu can handle it.  With udmabuf qemu can simply mmap() the
resource, create a pixman image, then run with it.  Without udmabuf
it'll be a bit more complicated because we can't offload most work to
pixman then, but should still be doable.  Qemu could also choose to
allow blob resources only in case udmabuf is available to avoid handling
that.  So no blockers here.

> One possiblity is to only use dumb blob resources in virtio-gpu kms
> when shared guest is available rather than refactoring that code,

I think this makes sense.

> > same goes for dma-buf imports (inside the guest).
> 
> dma-buf import from another virtio driver is very interesting, but
> we'll probably need a some import UUID hypercall for that?

No, just dma-buf import from somewhere, say a gpu passed to the guest
via pci pass-through does the rendering to a dma-buf and that dmabuf
gets imported into virtio-gpu for display in a host window.

That'll requires BLOB resources to work, because we have to create a
guest bo (and virtio resource) without knowning what format the guest
wants to use to scanout the thing.

We may likewise allow that only in case shared guest is available.

> Though TRANSFER_BLOB can be useful.  I can see the following use cases:
> 
> - implementing guest kernel dma-buf mmap and synchronization
> (begin_cpu_access/end_cpu_access).  Currently, it doesn't work but no
> guest user-space relies on it, so no one has noticed/complained.
> - emulated coherent memory
> 
> It sounds like you think TRANSFER_BLOB is worth the maintenance vs.
> future proofing tradeoff, which is fair.

We can leave it out for now and see if we'll need it at some point in
the future.  One point of adding blob resources is to allow shared
mappings, so maybe it wouldn't be used. There is also the option to
fallback to traditional resources ...

cheers,
  Gerd


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

