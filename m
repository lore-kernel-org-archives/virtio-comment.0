Return-Path: virtio-comment-return-1416-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 13DF0985D39
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Aug 2020 07:12:11 +0000 (UTC)
Date: Wed, 19 Aug 2020 09:12:05 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20200819071205.cqw4n3622hi5bltv@sirius.home.kraxel.org>
References: <20200814015447.1151-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200814015447.1151-1-gurchetansingh@chromium.org>
Subject: [virtio-comment] Re: [PATCH 0/2] Blob resources v5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Aug 13, 2020 at 06:54:45PM -0700, Gurchetan Singh wrote:
> New additions to the blob spec.  This is to preserve the possibility
> of a swapper in the kernel.  Based on UUID the patches.
> 
> This doesn't require ATTACH_BACKING / DETACH_BACKING since we're probably
> not going to swap-in/swap-out zero-copy guest memory (especially if comes
> from a guest dedicated heap, which is best for 3D/video apps) in the
> event we do write a swapper.
> 
> Implementation should be on virtio-dev/dri-devel shortly.

Looks good overall, some minor nits (see individual patch replies).

I'll try to get to the code patches ASAP.  Didn't pay much attention to
dri-devel due to -ENOTIME, now busy playing catch-up ...

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

