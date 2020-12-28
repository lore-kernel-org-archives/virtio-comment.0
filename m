Return-Path: virtio-comment-return-1604-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5BB2298630D
	for <virtio-comment@lists.oasis-open.org>; Mon, 28 Dec 2020 12:17:45 +0000 (UTC)
Date: Mon, 28 Dec 2020 07:17:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20201228071317-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB2067CD1555DDB8692FC9FB96C5D91@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB2067CD1555DDB8692FC9FB96C5D91@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: [virtio-comment] Re: [PATCH v2] virtio-net: fix Driver Notification description
 related to VIRTIO_F_NOTIF_CONFIG_DATA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Dec 28, 2020 at 11:22:10AM +0000, Vitaly Mireyno wrote:
> Incorporated comments for the "[PATCH v9] virtio-net: Add support for the flexible driver notification structure".
> Made Driver Notifications description more consistent throughout the document wrt VIRTIO_F_NOTIF_CONFIG_DATA.
> 
> Changes from v1:
>  * Rephrased "Driver Notifications" and "Available Buffer Notifications" sections to avoid repetitions.
> 
> 
> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> ---
>  content.tex | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index 00bc050..4fb6702 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -337,8 +337,12 @@ \section{Driver Notifications} \label{sec:Virtqueues / Driver notifications}
>  notification to the device.
>  
>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
> -this notification involves sending the
> -virtqueue number to the device (method depending on the transport).
> +this notification involves sending to the device the vqn
> +(method depending on the transport).
> +\begin{description}
> +\item [vqn] Either the virtqueue number to be notified or, if VIRTIO_F_NOTIF_CONFIG_DATA
> +      has been negotiated, the queue notification data.
> +\end{description}
>  
>  However, some devices benefit from the ability to find out the
>  amount of available data in the queue without accessing the virtqueue in memory:

This seems a bit confused.

I think it's clearer if we spell out both options:
if not VIRTIO_F_NOTIF_CONFIG_DATA -> vqn is X, if VIRTIO_F_NOTIF_CONFIG_DATA -> vqn is Y

> @@ -349,7 +353,7 @@ \section{Driver Notifications} \label{sec:Virtqueues / Driver notifications}
>  the following information:
>  
>  \begin{description}
> -\item [vqn] VQ number to be notified.
> +\item [vqn]
>  \item [next_off] Offset
>        within the ring where the next available ring entry
>        will be written.

Can we have a description here pls? What does VQN stand for? It's not
english ...


> @@ -1531,8 +1535,7 @@ \subsubsection{Available Buffer Notifications}\label{sec:Virtio Transport Option
>  
>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
>  the driver sends an available buffer notification to the device by writing
> -the 16-bit virtqueue index
> -of this virtqueue to the Queue Notify address.
> +the 16-bit vqn to the Queue Notify address.
>  
>  When VIRTIO_F_NOTIFICATION_DATA has been negotiated,
>  the driver sends an available buffer notification to the device by writing
> @@ -1546,13 +1549,8 @@ \subsubsection{Available Buffer Notifications}\label{sec:Virtio Transport Option
>  for how to calculate the Queue Notify address.
>  
>  \drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Available Buffer Notifications}
> -If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:
> -\begin{itemize}
> -\item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the driver MUST use the
> -\field{queue_notify_data} value instead of the virtqueue index.
> -\item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver MUST set the
> -\field{vqn} field to the \field{queue_notify_data} value.
> -\end{itemize}
> +If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated, the driver MUST use the
> +\field{queue_notify_data} value as a queue notification data.
>  
>  \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Used Buffer Notifications}
>  
> --


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

