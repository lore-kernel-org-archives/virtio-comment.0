Return-Path: virtio-comment-return-1236-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 28707985ED0
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 May 2020 07:03:53 +0000 (UTC)
Date: Wed, 13 May 2020 09:03:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20200513070344.lygzol7xohxzb4y3@sirius.home.kraxel.org>
References: <20200507232436.1540-1-gurchetansingh@chromium.org>
 <20200512122220.znxa47meycvkc6j5@sirius.home.kraxel.org>
 <CAAfnVBkMS-_zQ8Cv5Di71z1bQtT54JUNPYMAyPm8d=G969=MUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVBkMS-_zQ8Cv5Di71z1bQtT54JUNPYMAyPm8d=G969=MUw@mail.gmail.com>
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, Chia-I Wu <olvaffe@gmail.com>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

  Hi,

> > So add a note that this is for future planar format support?
> > Or do we want add planar formats now?
> 
> No YUV support for now.  I was mostly thinking about compressed
> standard formats (AB24, AR24) with a header + data plane
> (I915_FORMAT_MOD_Y_TILED_CCS etc.).  The modifier can be queried from
> virglrenderer in the distant future to avoid modifiers in the guest
> (which is another can of worms).  Will write a note about that.

Ok, good.

> > Also: should resource_id an array too?  So we have the option to store
> > each plane in a different resource (simliar to drm_framebuffer in the
> > linux kernel)?
> 
> It's a cost vs. level of future-proofing tradeoff.
> 
> Pros:
> + To mirror the KMS/wayland APIs, a resource_id array +
> VIRTIO_GPU_CMD_SET_SCANOUT_BLOBS makes sense.
> Cons
> - The trend seems to be one buffer.  I've only encountered disjoint
> YUV images on deprecated platforms, and reviewing the modifiers in
> <drm_fourcc.h> seem to be one buffer too.

Ok.  I guess it makes sense to stick to one buffer then.  An API which
isn't used in practice is a maintenance burden we better avoid ...

take care,
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

