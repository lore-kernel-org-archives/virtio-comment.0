Return-Path: virtio-comment-return-1414-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE295985D39
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Aug 2020 07:00:27 +0000 (UTC)
Date: Wed, 19 Aug 2020 09:00:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20200819070003.j3pzvcdxhv2zs3pm@sirius.home.kraxel.org>
References: <20200814015447.1151-1-gurchetansingh@chromium.org>
 <20200814015447.1151-2-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200814015447.1151-2-gurchetansingh@chromium.org>
Subject: [virtio-comment] Re: [PATCH 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

  Hi,

> +For VIRTIO_GPU_BLOB_MEM_HOST3D and VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST, the
> +virtio-gpu resource MUST be created from the rendering context local object
> +identified by the \field{blob_id}. The actual allocation is done via
> +VIRTIO_GPU_CMD_SUBMIT_3D.

Speaking of VIRTIO_GPU_CMD_SUBMIT_3D:  IIRC I saw the suggestion to
separate out the submit_3d protocol headers somewhere (don't remember
where, so I'm kind of replying here).  I think this is a very good idea
to move them to a separate git repo / project, then have everyone use
that.  The project will be a natural place for the protocol spec and we
also can add a reference to it to the virtio specs.

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

