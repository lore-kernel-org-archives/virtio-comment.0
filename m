Return-Path: virtio-comment-return-1234-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AA05D985E31
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 May 2020 12:24:20 +0000 (UTC)
Date: Tue, 12 May 2020 14:22:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20200512122220.znxa47meycvkc6j5@sirius.home.kraxel.org>
References: <20200507232436.1540-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200507232436.1540-1-gurchetansingh@chromium.org>
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, olvaffe@gmail.com, marcheu@chromium.org
List-ID: <virtio-comment.lists.oasis-open.org>

> +\item[VIRTIO_GPU_CMD_SET_SCANOUT_BLOB] sets scanout parameters for a
> +   blob resource. Request data is
> +  \field{struct virtio_gpu_set_scanout_blob}. Response type is
> +  VIRTIO_GPU_RESP_OK_NODATA. Support is optional and negotiated
> +  using the VIRTIO_GPU_F_RESOURCE_BLOB feature flag.
> +
> +\begin{lstlisting}
> +struct virtio_gpu_set_scanout_blob {
> +       struct virtio_gpu_ctrl_hdr hdr;
> +       struct virtio_gpu_rect r;
> +       le32 scanout_id;
> +       le32 resource_id;
> +       le32 width;
> +       le32 height;
> +       le32 format;
> +       le32 padding;
> +       le32 strides[4];
> +       le32 offsets[4];
> +};
> +\end{lstlisting}
> +
> +The rectangle \field{r} represents the portion of the blob resource being
> +displayed. The rest is the metadata associated with the blob resource. The
> +format MUST be one of \field{enum virtio_gpu_formats}.

So you've changed strides & offsets to arrays, for planar formats.
We don't have any planar formats in virtio_gpu_formats though ...

So add a note that this is for future planar format support?
Or do we want add planar formats now?

Also: should resource_id an array too?  So we have the option to store
each plane in a different resource (simliar to drm_framebuffer in the
linux kernel)?

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

