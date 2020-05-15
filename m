Return-Path: virtio-comment-return-1244-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9DE8D986048
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 May 2020 10:42:55 +0000 (UTC)
Date: Fri, 15 May 2020 12:42:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20200515104250.zvt3it4bgqp3avdh@sirius.home.kraxel.org>
References: <20200513231319.1169-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200513231319.1169-1-gurchetansingh@chromium.org>
Subject: [virtio-comment] Re: [RFC PATCH v3 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, olvaffe@gmail.com, marcheu@chromium.org
List-ID: <virtio-comment.lists.oasis-open.org>

  Hi,

> +\field{blob_mem} can only be VIRTIO_GPU_BLOB_MEM_HOST3D and
> +VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST if VIRTIO_GPU_F_VIRGL is supported.
> +VIRTIO_GPU_BLOB_MEM_GUEST is valid regardless whether VIRTIO_GPU_F_VIRGL
> +is supported or not.

Would it be useful to explicitly announce which VIRTIO_GPU_BLOB_MEM*
variants are supported instead of having implicit rules?  Using a
config space field for example?

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

