Return-Path: virtio-comment-return-1241-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 23F20985FC6
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 May 2020 08:24:56 +0000 (UTC)
Date: Thu, 14 May 2020 10:24:49 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20200514082449.gg2u6ltixbvmtplp@sirius.home.kraxel.org>
References: <20200507232436.1540-1-gurchetansingh@chromium.org>
 <20200512122220.znxa47meycvkc6j5@sirius.home.kraxel.org>
 <CAAfnVBkMS-_zQ8Cv5Di71z1bQtT54JUNPYMAyPm8d=G969=MUw@mail.gmail.com>
 <20200513070344.lygzol7xohxzb4y3@sirius.home.kraxel.org>
 <CAAfnVBkYTDPJMpuX8KrvdJ-FSEwWXpN3J_UjZYjS076fjyk8dg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVBkYTDPJMpuX8KrvdJ-FSEwWXpN3J_UjZYjS076fjyk8dg@mail.gmail.com>
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, Chia-I Wu <olvaffe@gmail.com>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

  Hi,

> Cool.  I left out SCANOUT_FLUSH in v3 since AFAICT we'll only have one
> blob resource per scanout, and that blob resource will encompass the
> entire window (since we set_scanout when display parameters change).
> And to update the scanout blob resource, we can just call
> RESOURCE_FLUSH.

Hmm, right, using the SET_SCANOUT parameters in case of BLOB resources
should work.

> Though SCANOUT_FLUSH does make sense if you want multiple blob
> resources per scanout surface, so if there's a desire for some
> additional functionality, LMK.

Other way around: one big framebuffer/resource backing multiple
scanouts.

xorg used to handle multihead setups that way, but these days it is
rather uncommon.  Typically userspace creates one drm framebuffer
per drm crtc.  So, yes, I guess we don't have to worry much.

> Also, TRANSFER_BLOB is also another maintenance vs. future proofing
> tradeoff -- for example, emulated coherent memory[1] (for platforms
> without the host-visible region or external memory extensions or
> shared guest) may benefit from such an API.  However, the
> implementation of that doesn't exist and may not for a while (focusing
> on true zero copy for now), and the virglrenderer impl of the
> hypercall will likely just be a stub for now.  So if that's
> undesirable, LMK.

Implies the linux kernel can't use blob resources for dumb BOs in
case shared memory isn't available, same goes for dma-buf imports
(inside the guest).

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

