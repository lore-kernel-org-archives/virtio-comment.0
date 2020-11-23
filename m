Return-Path: virtio-comment-return-1533-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 46EF59841C7
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Nov 2020 15:40:08 +0000 (UTC)
Date: Mon, 23 Nov 2020 16:39:56 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20201123163956.7e2e41ec.cohuck@redhat.com>
In-Reply-To: <20201120100114-mutt-send-email-mst@kernel.org>
References: <20201120100114-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [felipe@nutanix.com: [PATCH] content: Fix driver/device wording
 on ISR bits]
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 20 Nov 2020 10:01:41 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> Some kind of technical problem seems to prevent this patch from
> getting to list. Forwarding.
> 
> ----- Forwarded message from Felipe Franciosi <felipe@nutanix.com> -----
> 
> Date: Mon, 09 Nov 2020 14:13:18 +0000 (UTC)
> From: Felipe Franciosi <felipe@nutanix.com>
> To: virtio-comment@lists.oasis-open.org
> Cc: mst@redhat.com, Felipe Franciosi <felipe@nutanix.com>
> Subject: [PATCH] content: Fix driver/device wording on ISR bits
> Message-Id: <20201109141256.152571-1-felipe@nutanix.com>
> 
> Section "ISR status capability" incorrectly worded that the bits part of
> the register allows the device to distinguish between interrupt types.
> It is the driver that needs access to that distinction, not the device.
> 
> Signed-off-by: Felipe Franciosi <felipe@nutanix.com>
> ---
>  content.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/content.tex b/content.tex
> index bc26674..3e8effe 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -1040,7 +1040,7 @@ \subsubsection{ISR status capability}\label{sec:Virtio Transport Options / Virti
>  
>  The \field{offset} for the \field{ISR status} has no alignment requirements.
>  
> -The ISR bits allow the device to distinguish between device-specific configuration
> +The ISR bits allow the driver to distinguish between device-specific configuration
>  change interrupts and normal virtqueue interrupts:
>  
>  \begin{tabular}{ |l||l|l|l| }

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

