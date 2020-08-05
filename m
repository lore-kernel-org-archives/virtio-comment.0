Return-Path: virtio-comment-return-1383-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A28BD985E6F
	for <virtio-comment@lists.oasis-open.org>; Wed,  5 Aug 2020 09:00:31 +0000 (UTC)
Date: Wed, 5 Aug 2020 11:00:18 +0200
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20200805110018.2e011665.cohuck@redhat.com>
In-Reply-To: <20200804154127.245313-1-lvivier@redhat.com>
References: <20200804154127.245313-1-lvivier@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v3] virtio-rng: add a control queue
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Laurent Vivier <lvivier@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Amit Shah <amit@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue,  4 Aug 2020 17:41:27 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> A control queue is needed to send command to ask the device to
> release the request buffers if it cannot provide data.
> 
> Changes:
> 
>   5.4.2 Virtqueues
>   0 requestq
>   1 controlq
>   controlq only exists if VIRTIO_RNG_F_CTRL_VQ set.
> 
>   5.4.3 Feature bits
>   VIRTIO_RNG_F_CTRL_VQ (0)
>   Device has a control queue
> 
>   5.4.5 Device Initialization
>   Identify and initialize the request virtqueue.
>   If the VIRTIO_RNG_F_CTRL_VQ feature bit is negotiated,
>   identify the control virtqueue.
> 
>   5.4.6.3 Control Virtqueue
>   The driver uses the control virtqueue (if VIRTIO_RNG_F_CTRL_VQ is
>   negotiated) to send commands to control the device.
>   All commands are of the following form:
>   struct virtio_rng_ctrl_hdr {
>          u8 cmd;
>   };
> 
>   5.4.6.4 Device Requirements: Control Virtqueue
>   If VIRTIO_RNG_F_CTRL_VQ is negotiated, the device MUST implement the
>   flush command.
>   Any other value of cmd MUST be ignored by the device.
> 
>   5.4.6.5 Request Virtqueue Flushing
>   When the device is not able to provide enough entropy to the driver, the
>   driver may be stuck waiting for the device returning buffers, and cannot
>   be removed to switch to another one. The flush command allows the driver
>   to ask the device to release all the buffers sent to the device. This
>   allows the driver to release resources allocated to receive data from
>   the device.
>   #define VIRTIO_RNG_CMD_FLUSH 0
> 
>   5.4.6.5.1 Device Requirements: Request Virtqueue Flushing
>   When the driver sends a flush request, the device MUST release all
>   outstanding buffers.
> 
> Bug-Link: https://github.com/oasis-tcs/virtio-spec/issues/83
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
> 
> Notes:
>     v3: Add devicenormative references in conformance part
>         Move "Request Virtqueue Flushing" from \paragraph to \subsubsection
>         to be behind "Control Virtqueue" and not behind
>         "Device Requirements: Control Virtqueue"

There are different ways to put the conformance statements (and what
should be a paragraph vs a subsubsection), and your layout seems
reasonable, avoiding nesting too deep.

>     
>     v2: Add devicenormative for the Control Virtqueue
>         Add devicenormative for the Request Virtqueue Flushing
>         Reword paragraph Request Virtqueue Flushing
> 
>  conformance.tex |  2 ++
>  content.tex     | 47 +++++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 47 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


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

