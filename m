Return-Path: virtio-comment-return-1415-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 00039985D39
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Aug 2020 07:06:36 +0000 (UTC)
Date: Wed, 19 Aug 2020 09:06:32 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20200819070632.s2wzxinadoymd2cs@sirius.home.kraxel.org>
References: <20200814015447.1151-1-gurchetansingh@chromium.org>
 <20200814015447.1151-3-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200814015447.1151-3-gurchetansingh@chromium.org>
Subject: [virtio-comment] Re: [PATCH 2/2] virtio-gpu: add support for mapping/unmapping blob
 resources
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

  Hi,

> +struct virtio_gpu_resource_map_blob {
> +        struct virtio_gpu_ctrl_hdr hdr;
> +        le32 resource_id;
> +        le32 padding;
> +        le64 offset;
> +};

> +struct virtio_gpu_resource_unmap_blob {
> +        struct virtio_gpu_ctrl_hdr hdr;
> +        le32 resource_id;
> +        le32 padding;
> +};

map has an offset but unmap has not.  So in case a resource has multiple
mappings it is not clear which one is going to be unmapped.  So we
should:

  (a) add offset field to unmap, or
  (b) explicitly specify that unmap will unmap all existing mappings, or
  (c) explicitly specify that multiple mappings are not allowed.

My guess is we want (c) ...

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

