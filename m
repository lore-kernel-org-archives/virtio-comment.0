Return-Path: virtio-comment-return-1191-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CC14A985E1A
	for <virtio-comment@lists.oasis-open.org>; Tue, 28 Apr 2020 10:29:27 +0000 (UTC)
Date: Tue, 28 Apr 2020 12:29:22 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20200428102922.ptoppskbs7xhube7@sirius.home.kraxel.org>
References: <20200422005531.15085-1-gurchetansingh@chromium.org>
 <20200422005531.15085-2-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200422005531.15085-2-gurchetansingh@chromium.org>
Subject: [virtio-comment] Re: [PATCH 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, olvaffe@gmail.com, marcheu@chromium.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Apr 21, 2020 at 05:55:30PM -0700, Gurchetan Singh wrote:
> Blob resources are size-based containers for host, guest, or
> host+guest allocations.  These resources are designed with
> mulit-process 3D support in mind, but also usable in virtio-gpu 2d
> with system memory allocation (also known as dumb allocation, but
> since that's reserved in a DRM/KMS world, went with system).

Thanks for picking this up.

> +Host allocations depend on whether VIRTIO_GPU_F_VIRGL is supported.
> +If VIRTIO_GPU_F_VIRGL is not supported, then:
> +
> +  \begin{itemize*}
> +  \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOSTSYS for host-on=
ly
> +  blob resources
> +  \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOSTSYS_GUEST for
> +  default blob resources
> +  \end{itemize*}
> +
> +For the above above cases, host system memory is allocated by the device=
.
> +
> +If VIRTIO_GPU_F_VIRGL is supported, then:
> +
> +  \begin{itemize*}
> +  \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOST3D for host-onl=
y
> +  blob resources
> +  \item \field{blob_mem} MUST be VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST for
> +  default resources
> +  \end{itemize*}

Do we need separate items (HOSTSYS/HOST3D) for these?  Shouldn't this be
a host implementation detail the guest doesn't need to worry about?

Also: Why HOST3D + HOST3D_GUEST?  Isn't that covered by the use flags
(MAPPABLE) already?

> +If VIRTIO_GPU_F_VIRGL is set, both VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D
> +and VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D may be used to update the
> +resource. There is no restriction on the image/buffer view the driver
> +has on the blob resource.

I don't think VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D is going to work if
the resource has no format attached.  I had a TRANSFER_BLOB command
because of that.

> +VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D, VIRTIO_GPU_CMD_SET_SCANOUT and
> +VIRTIO_GPU_CMD_RESOURCE_FLUSH MAY be used with blob resources as well,
> +subject to the following restrictions:

Same problem with VIRTIO_GPU_CMD_SET_SCANOUT, it expects the resource
has a format attached which isn't the case for blob resources ...

cheers,
  Gerd


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

