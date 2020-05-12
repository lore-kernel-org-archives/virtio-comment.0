Return-Path: virtio-comment-return-1235-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 811AA985E78
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 May 2020 22:25:25 +0000 (UTC)
MIME-Version: 1.0
References: <20200507232436.1540-1-gurchetansingh@chromium.org> <20200512122220.znxa47meycvkc6j5@sirius.home.kraxel.org>
In-Reply-To: <20200512122220.znxa47meycvkc6j5@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 12 May 2020 15:25:10 -0700
Message-ID: <CAAfnVBkMS-_zQ8Cv5Di71z1bQtT54JUNPYMAyPm8d=G969=MUw@mail.gmail.com>
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset="UTF-8"
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Chia-I Wu <olvaffe@gmail.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, May 12, 2020 at 5:24 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > +\item[VIRTIO_GPU_CMD_SET_SCANOUT_BLOB] sets scanout parameters for a
> > +   blob resource. Request data is
> > +  \field{struct virtio_gpu_set_scanout_blob}. Response type is
> > +  VIRTIO_GPU_RESP_OK_NODATA. Support is optional and negotiated
> > +  using the VIRTIO_GPU_F_RESOURCE_BLOB feature flag.
> > +
> > +\begin{lstlisting}
> > +struct virtio_gpu_set_scanout_blob {
> > +       struct virtio_gpu_ctrl_hdr hdr;
> > +       struct virtio_gpu_rect r;
> > +       le32 scanout_id;
> > +       le32 resource_id;
> > +       le32 width;
> > +       le32 height;
> > +       le32 format;
> > +       le32 padding;
> > +       le32 strides[4];
> > +       le32 offsets[4];
> > +};
> > +\end{lstlisting}
> > +
> > +The rectangle \field{r} represents the portion of the blob resource being
> > +displayed. The rest is the metadata associated with the blob resource. The
> > +format MUST be one of \field{enum virtio_gpu_formats}.
>
> So you've changed strides & offsets to arrays, for planar formats.
> We don't have any planar formats in virtio_gpu_formats though ...
>
> So add a note that this is for future planar format support?
> Or do we want add planar formats now?

No YUV support for now.  I was mostly thinking about compressed
standard formats (AB24, AR24) with a header + data plane
(I915_FORMAT_MOD_Y_TILED_CCS etc.).  The modifier can be queried from
virglrenderer in the distant future to avoid modifiers in the guest
(which is another can of worms).  Will write a note about that.

>
> Also: should resource_id an array too?  So we have the option to store
> each plane in a different resource (simliar to drm_framebuffer in the
> linux kernel)?

It's a cost vs. level of future-proofing tradeoff.

Pros:
+ To mirror the KMS/wayland APIs, a resource_id array +
VIRTIO_GPU_CMD_SET_SCANOUT_BLOBS makes sense.
Cons
- The trend seems to be one buffer.  I've only encountered disjoint
YUV images on deprecated platforms, and reviewing the modifiers in
<drm_fourcc.h> seem to be one buffer too.
- We can probably reuse RESOURCE_FLUSH (no need for SCANOUT_FLUSH?) if
we only allow one blob resource per drm framebuffer.  Display update
would be SET_SCANOUT_BLOB (which attaches a format to a resource) +
RESOURCE_FLUSH.  Kind of like VHOST_USER_GPU_DMABUF_SCANOUT +
VHOST_USER_GPU_DMABUF_UPDATE.  With SET_SCANOUT_BLOBS, we'll require
SCANOUT_FLUSH.

No multi-plane blob works for us too -- CrOS doesn't really use the
scanout blob api, as we rely on virtio-wl for display integration.
It's up to you/other virtio-gpu kms consumers.

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

