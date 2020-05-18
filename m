Return-Path: virtio-comment-return-1259-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4D4B2985F11
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 May 2020 07:34:37 +0000 (UTC)
Date: Mon, 18 May 2020 09:34:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20200518073430.nuexgtftn4tx3rts@sirius.home.kraxel.org>
References: <20200507232436.1540-1-gurchetansingh@chromium.org>
 <20200512122220.znxa47meycvkc6j5@sirius.home.kraxel.org>
 <CAAfnVBkMS-_zQ8Cv5Di71z1bQtT54JUNPYMAyPm8d=G969=MUw@mail.gmail.com>
 <20200513070344.lygzol7xohxzb4y3@sirius.home.kraxel.org>
 <CAAfnVBkYTDPJMpuX8KrvdJ-FSEwWXpN3J_UjZYjS076fjyk8dg@mail.gmail.com>
 <20200514082449.gg2u6ltixbvmtplp@sirius.home.kraxel.org>
 <CAAfnVB=XaPrHzONdGY2KEvDSXNHBxSJevmGDVmU8btJgOJjruQ@mail.gmail.com>
 <20200515103848.cabaudxhbjxbxbsg@sirius.home.kraxel.org>
 <CAAfnVBnGhikW3AEJgSDgV9wZUjw54mm6yQNbwe56RDwDKnTHRA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVBnGhikW3AEJgSDgV9wZUjw54mm6yQNbwe56RDwDKnTHRA@mail.gmail.com>
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, Chia-I Wu <olvaffe@gmail.com>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

> > > > same goes for dma-buf imports (inside the guest).
> > >
> > > dma-buf import from another virtio driver is very interesting, but
> > > we'll probably need a some import UUID hypercall for that?
> >
> > No, just dma-buf import from somewhere, say a gpu passed to the guest
> > via pci pass-through does the rendering to a dma-buf and that dmabuf
> > gets imported into virtio-gpu for display in a host window.
> 
> I'm unfamiliar with that use case ... is there a chance the dma-buf is
> compressed/tiled?

Hmm, not fully sure but probably not.  I'd expect gpu drivers would
untile the BO when exporting to another driver because tiling modes
are typically hard-ware specific ...

> If so, we won't be able to query virglrenderer for the modifier and
> may need it in SCANOUT_BLOB unless there's another way to get it
> host-side.

No, there is no other magic way.  Userspace has to tell virtio-gpu what
format the dma-buf data has if it wants virtio-gpu do something with it,
the dma-buf itself is just a blob.

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

