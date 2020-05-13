Return-Path: virtio-comment-return-1240-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9DDC9985F69
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 May 2020 23:15:10 +0000 (UTC)
MIME-Version: 1.0
References: <20200507232436.1540-1-gurchetansingh@chromium.org>
 <20200512122220.znxa47meycvkc6j5@sirius.home.kraxel.org> <CAAfnVBkMS-_zQ8Cv5Di71z1bQtT54JUNPYMAyPm8d=G969=MUw@mail.gmail.com>
 <20200513070344.lygzol7xohxzb4y3@sirius.home.kraxel.org>
In-Reply-To: <20200513070344.lygzol7xohxzb4y3@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 13 May 2020 16:14:55 -0700
Message-ID: <CAAfnVBkYTDPJMpuX8KrvdJ-FSEwWXpN3J_UjZYjS076fjyk8dg@mail.gmail.com>
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset="UTF-8"
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Chia-I Wu <olvaffe@gmail.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, May 13, 2020 at 12:03 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > So add a note that this is for future planar format support?
> > > Or do we want add planar formats now?
> >
> > No YUV support for now.  I was mostly thinking about compressed
> > standard formats (AB24, AR24) with a header + data plane
> > (I915_FORMAT_MOD_Y_TILED_CCS etc.).  The modifier can be queried from
> > virglrenderer in the distant future to avoid modifiers in the guest
> > (which is another can of worms).  Will write a note about that.
>
> Ok, good.
>
> > > Also: should resource_id an array too?  So we have the option to store
> > > each plane in a different resource (simliar to drm_framebuffer in the
> > > linux kernel)?
> >
> > It's a cost vs. level of future-proofing tradeoff.
> >
> > Pros:
> > + To mirror the KMS/wayland APIs, a resource_id array +
> > VIRTIO_GPU_CMD_SET_SCANOUT_BLOBS makes sense.
> > Cons
> > - The trend seems to be one buffer.  I've only encountered disjoint
> > YUV images on deprecated platforms, and reviewing the modifiers in
> > <drm_fourcc.h> seem to be one buffer too.
>
> Ok.  I guess it makes sense to stick to one buffer then.  An API which
> isn't used in practice is a maintenance burden we better avoid ...

Cool.  I left out SCANOUT_FLUSH in v3 since AFAICT we'll only have one
blob resource per scanout, and that blob resource will encompass the
entire window (since we set_scanout when display parameters change).
And to update the scanout blob resource, we can just call
RESOURCE_FLUSH.

Though SCANOUT_FLUSH does make sense if you want multiple blob
resources per scanout surface, so if there's a desire for some
additional functionality, LMK.

Also, TRANSFER_BLOB is also another maintenance vs. future proofing
tradeoff -- for example, emulated coherent memory[1] (for platforms
without the host-visible region or external memory extensions or
shared guest) may benefit from such an API.  However, the
implementation of that doesn't exist and may not for a while (focusing
on true zero copy for now), and the virglrenderer impl of the
hypercall will likely just be a stub for now.  So if that's
undesirable, LMK.

[1] https://lists.freedesktop.org/archives/dri-devel/2019-April/215731.htm

>
> take care,
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

