Return-Path: virtio-comment-return-1242-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D5A62986036
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 May 2020 22:41:32 +0000 (UTC)
MIME-Version: 1.0
References: <20200507232436.1540-1-gurchetansingh@chromium.org>
 <20200512122220.znxa47meycvkc6j5@sirius.home.kraxel.org> <CAAfnVBkMS-_zQ8Cv5Di71z1bQtT54JUNPYMAyPm8d=G969=MUw@mail.gmail.com>
 <20200513070344.lygzol7xohxzb4y3@sirius.home.kraxel.org> <CAAfnVBkYTDPJMpuX8KrvdJ-FSEwWXpN3J_UjZYjS076fjyk8dg@mail.gmail.com>
 <20200514082449.gg2u6ltixbvmtplp@sirius.home.kraxel.org>
In-Reply-To: <20200514082449.gg2u6ltixbvmtplp@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 14 May 2020 15:41:17 -0700
Message-ID: <CAAfnVB=XaPrHzONdGY2KEvDSXNHBxSJevmGDVmU8btJgOJjruQ@mail.gmail.com>
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset="UTF-8"
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Chia-I Wu <olvaffe@gmail.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, May 14, 2020 at 1:24 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > Cool.  I left out SCANOUT_FLUSH in v3 since AFAICT we'll only have one
> > blob resource per scanout, and that blob resource will encompass the
> > entire window (since we set_scanout when display parameters change).
> > And to update the scanout blob resource, we can just call
> > RESOURCE_FLUSH.
>
> Hmm, right, using the SET_SCANOUT parameters in case of BLOB resources
> should work.

Ok, so removing SCANOUT_FLUSH makes sense.

>
> > Though SCANOUT_FLUSH does make sense if you want multiple blob
> > resources per scanout surface, so if there's a desire for some
> > additional functionality, LMK.
>
> Other way around: one big framebuffer/resource backing multiple
> scanouts.
>
> xorg used to handle multihead setups that way, but these days it is
> rather uncommon.  Typically userspace creates one drm framebuffer
> per drm crtc.  So, yes, I guess we don't have to worry much.
>
> > Also, TRANSFER_BLOB is also another maintenance vs. future proofing
> > tradeoff -- for example, emulated coherent memory[1] (for platforms
> > without the host-visible region or external memory extensions or
> > shared guest) may benefit from such an API.  However, the
> > implementation of that doesn't exist and may not for a while (focusing
> > on true zero copy for now), and the virglrenderer impl of the
> > hypercall will likely just be a stub for now.  So if that's
> > undesirable, LMK.
>
> Implies the linux kernel can't use blob resources for dumb BOs in
> case shared memory isn't available,

v3 only allows VIRTIO_GPU_BLOB_MEM_GUEST for dumb blob resources,
which implies we won't really use TRANSFER_BLOB.

Currently, the path seems to be:

SET_SCANOUT
TRANSFER_TO_HOST_2D --> copies from iovecs to host private resource
RESOURCE_FLUSH_BLOB --> copies from host private resource to framebuffer

A theoretical display update path would be for dumb BOs without shared
mappings would be:

SET_SCANOUT_BLOB
RESOURCE_FLUSH_BLOB --> copies from iovecs to framebuffer

That should work with crosvm, you might want to verify if it's doable with QEMU.

QEMU seems to have multiple dumb display paths --
qemu_spice_display_update, sdl2_2d_update.  One possiblity is to only
use dumb blob resources in virtio-gpu kms when shared guest is
available rather than refactoring that code, or maybe you have
something else in mind?

> same goes for dma-buf imports (inside the guest).

dma-buf import from another virtio driver is very interesting, but
we'll probably need a some import UUID hypercall for that?  Maybe a
bit too expansive for F_RESOURCE_BLOB at this point.

Though TRANSFER_BLOB can be useful.  I can see the following use cases:

- implementing guest kernel dma-buf mmap and synchronization
(begin_cpu_access/end_cpu_access).  Currently, it doesn't work but no
guest user-space relies on it, so no one has noticed/complained.
- emulated coherent memory

It sounds like you think TRANSFER_BLOB is worth the maintenance vs.
future proofing tradeoff, which is fair.  I just want to make sure
we're all on the same page in terms of use cases.

>
> cheers,
>   Gerd
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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

