Return-Path: virtio-comment-return-1258-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 67A9698605F
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 May 2020 22:13:00 +0000 (UTC)
MIME-Version: 1.0
References: <20200513231319.1169-1-gurchetansingh@chromium.org> <20200515104250.zvt3it4bgqp3avdh@sirius.home.kraxel.org>
In-Reply-To: <20200515104250.zvt3it4bgqp3avdh@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 15 May 2020 15:12:43 -0700
Message-ID: <CAAfnVBkZqp0eH=RVHbt4RL=dChKVBaDX3YVPAFDituS0=Ch6kA@mail.gmail.com>
Subject: [virtio-comment] Re: [RFC PATCH v3 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset="UTF-8"
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Chia-I Wu <olvaffe@gmail.com>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, May 15, 2020 at 3:42 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > +\field{blob_mem} can only be VIRTIO_GPU_BLOB_MEM_HOST3D and
> > +VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST if VIRTIO_GPU_F_VIRGL is supported.
> > +VIRTIO_GPU_BLOB_MEM_GUEST is valid regardless whether VIRTIO_GPU_F_VIRGL
> > +is supported or not.
>
> Would it be useful to explicitly announce which VIRTIO_GPU_BLOB_MEM*
> variants are supported instead of having implicit rules?  Using a
> config space field for example?

In 2D mode, I don't think anybody is going to advertise support
VIRTIO_GPU_BLOB_MEM_HOST3D / VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST.  I'm
thinking we can just have various checks in the kernel and write in
the spec, like the current model.

https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/virtio/virtgpu_ioctl.c#L238

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

