Return-Path: <virtio-comment-return-2282-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D00C39863C7
	for <virtio-comment@lists.oasis-open.org>; Wed, 15 Sep 2021 08:20:53 +0000 (UTC)
Date: Wed, 15 Sep 2021 10:20:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20210915082047.khw5kkcq7uz5r2io@sirius.home.kraxel.org>
References: <20210909012953.431-1-gurchetansingh@chromium.org>
 <20210909012953.431-2-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20210909012953.431-2-gurchetansingh@chromium.org>
Subject: [virtio-comment] Re: [PATCH v1 2/2] virtio-gpu: add context init support
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, olvaffe@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Sep 08, 2021 at 06:29:53PM -0700, Gurchetan Singh wrote:
> This brings explicit context initialization and different types
> to virtio-gpu.
> 
> In the past, VIRTIO_GPU_F_VIRGL meant the virglrenderer support.
> With VIRTIO_GPU_F_VIRGL + VIRTIO_GPU_F_CONTEXT_INIT, this means
> generic 3D virtualization defined by the context type.  It's
> entirely possible the virglrenderer project isn't available on
> the host in this scenario.  The VIRTIO_GPU_F_VIRGL naming
> convention is kept since it's easier to redefine the meaning
> rather than changing header files.
> 
> The context type is associated an particular capset id.  Virgl
> has two capsets due a prior bug, but for other cases the 1:1
> mapping between context type and capset id is valid.
> 
> In addition, fencing needs to be fixed to accomodate multiple
> context types.  In the past, there was one global timeline
> associated witht the OpenGL rendering.  Now, there are multiple
> timelines which can be associated with GL, VK or even display
> contexts.
> 
> v2: Correct number of bits
> v3: le32 info --> {u8 ring_idx + u8 padding[3])
>     Don't require FLAG_FENCE and FLAG_RING_IDX

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


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

