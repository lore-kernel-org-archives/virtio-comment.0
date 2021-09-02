Return-Path: <virtio-comment-return-2265-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 806449865D4
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Sep 2021 10:31:58 +0000 (UTC)
Date: Thu, 2 Sep 2021 12:31:51 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20210902103151.nhsh6q5lqkheqb6e@sirius.home.kraxel.org>
References: <20210826021313.378-3-gurchetansingh@chromium.org>
 <20210830194155.882-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20210830194155.882-1-gurchetansingh@chromium.org>
Subject: [virtio-comment] Re: [RFC PATCH v2 2/2] virtio-gpu: add context init support
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

  Hi,

>  struct virtio_gpu_ctrl_hdr {
>          le32 type;
>          le32 flags;
>          le64 fence_id;
>          le32 ctx_id;
> -        le32 padding;
> +        le32 info;

How about
           u8   ring_idx;
           u8   padding[3];

?

Otherwise this looks all sane to me.

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

