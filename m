Return-Path: virtio-comment-return-1552-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 470109865DA
	for <virtio-comment@lists.oasis-open.org>; Wed,  9 Dec 2020 13:16:56 +0000 (UTC)
Date: Wed, 9 Dec 2020 08:16:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20201209081031-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB20670DDDBD0D873920276E1CC5CC0@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB20670DDDBD0D873920276E1CC5CC0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: [virtio-comment] Re: [PATCH] virtio-net: fix Driver Notification description related
 to VIRTIO_F_NOTIF_CONFIG_DATA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Ariel Elior <aelior@marvell.com>, Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Dec 09, 2020 at 12:57:08PM +0000, Vitaly Mireyno wrote:
> Incorporated comments for the "[PATCH v9] virtio-net: Add support for the flexible driver notification structure".
> Made Driver Notifications description more consistent throughout the document wrt VIRTIO_F_NOTIF_CONFIG_DATA.
> 
> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>


This is a bit repetitive.

How about we replace "vqn" with "vqid", call it "virt queue identifier"
and explain that it is either hardcoded to the virt queue index or read
from config space.

In config space replace queue_notify_data with queue_identifier.

And maybe VIRTIO_F_NOTIF_CONFIG_DATA -> VIRTIO_F_NOTIF_CONFIG_QUEUE_ID

> ---
>  content.tex | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index 00bc050..9514b2d 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -337,8 +337,9 @@ \section{Driver Notifications} \label{sec:Virtqueues / Driver notifications}
>  notification to the device.
>  
>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
> -this notification involves sending the
> -virtqueue number to the device (method depending on the transport).
> +this notification involves sending to the device either the virtqueue number
> +or, if VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated,
> +the queue notification data (method depending on the transport).
>  
>  However, some devices benefit from the ability to find out the
>  amount of available data in the queue without accessing the virtqueue in memory:
> @@ -349,7 +350,8 @@ \section{Driver Notifications} \label{sec:Virtqueues / Driver notifications}
>  the following information:
>  
>  \begin{description}
> -\item [vqn] VQ number to be notified.
> +\item [vqn] Either the virtqueue number to be notified or, if VIRTIO_F_NOTIF_CONFIG_DATA
> +      has been negotiated, the queue notification data.
>  \item [next_off] Offset
>        within the ring where the next available ring entry
>        will be written.
> @@ -1531,8 +1533,8 @@ \subsubsection{Available Buffer Notifications}\label{sec:Virtio Transport Option
>  
>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
>  the driver sends an available buffer notification to the device by writing
> -the 16-bit virtqueue index
> -of this virtqueue to the Queue Notify address.
> +either the 16-bit virtqueue index of this virtqueue or, if VIRTIO_F_NOTIF_CONFIG_DATA
> +has been negotiated, the 16-bit queue notification data to the Queue Notify address.
>  
>  When VIRTIO_F_NOTIFICATION_DATA has been negotiated,
>  the driver sends an available buffer notification to the device by writing
> @@ -1546,13 +1548,8 @@ \subsubsection{Available Buffer Notifications}\label{sec:Virtio Transport Option
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

