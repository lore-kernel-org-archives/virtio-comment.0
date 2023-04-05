Return-Path: <virtio-comment-return-5251-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AB9C76188
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 05:30:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 852DE2B06A
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 05:30:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6E4DD9865B2
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Apr 2023 05:30:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5B046983DE1; Wed,  5 Apr 2023 05:30:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 488589865A7
	for <virtio-comment@lists.oasis-open.org>; Wed,  5 Apr 2023 05:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: sHVEa3FVO662rtfNax3JMg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680672619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTJ0WGGUX1F6BDJyBBjUSBeOSf/sDRn2Z+eCN7fTSQQ=;
        b=NjE4o8ZQVrTO5G0witX0uB2iNJiy/d7hny91pOWPgUnm1SMZnlkV6AaGlNI0DvFq/J
         sTbe2Ang4Cpbb3GiMVLf3RyC//aFKMmyOmp0j+tKd+L15kd3yPl48DH8VgBIMewQtX1E
         zCuMN0qgpBwr3MaXtvR0r9opqBDV1lGgz4+nWVVKarQR8TLpEItCWWV3oYYagbmTokr0
         q8ZomxcMPelu7xzRPUbuUchX1x8/AU478LzaxFHd7lSCXxASrt3ndXPew8ozjSah0QxB
         MZ3/YfCNKd6oJKLdjXv4VY2yS8+8xGRaH1sGfTKXhYVJaWGkbx9arh4bYHKnJZwEWxnh
         LoHA==
X-Gm-Message-State: AAQBX9ddqJxP3nDPYgO9bDXqwa9nMX2xOE4ZZHPpK4Mv2wI2m8QeI00N
	zG6gWOP1vx7W6sCEDc52znpYmq7+CFU/R6tkCQsMxr6z2pRP7rc3IvoyUpERZoEv+yOIU63lHzr
	IP6+t7TrEM1NZw4GpbH7qWjuWkQn4R/pKdw==
X-Received: by 2002:a05:6402:182:b0:502:6e48:65ea with SMTP id r2-20020a056402018200b005026e4865eamr801038edv.12.1680672618861;
        Tue, 04 Apr 2023 22:30:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350YcIYeoQHl7DmvMeMxKy81Tjj5plJIMXyDyFQLbqoS4W0+te1itGuE1Y9f+gO9uAA1/jPYYKw==
X-Received: by 2002:a05:6402:182:b0:502:6e48:65ea with SMTP id r2-20020a056402018200b005026e4865eamr801027edv.12.1680672618536;
        Tue, 04 Apr 2023 22:30:18 -0700 (PDT)
Date: Wed, 5 Apr 2023 01:30:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com, sgarzare@redhat.com,
	pasic@linux.ibm.com, virtio-comment@lists.oasis-open.org,
	shahafs@nvidia.com
Message-ID: <20230405012723-mutt-send-email-mst@kernel.org>
References: <20230405010657.612529-1-parav@nvidia.com>
 <20230405010657.612529-4-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230405010657.612529-4-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v12 03/10] content: Rename confusing queue_notify_data
 and vqn names

On Wed, Apr 05, 2023 at 04:06:50AM +0300, Parav Pandit wrote:
> Currently queue_notify_data register indicates the device
> internal queue notification identifier. This register is
> meaningful only when feature bit VIRTIO_F_NOTIF_CONFIG_DATA is
> negotiated.
> 
> However, above register name often get confusing association with
> very similar feature bit VIRTIO_F_NOTIFICATION_DATA.
> 
> When VIRTIO_F_NOTIFICATION_DATA feature bit is negotiated,
> notification really involves sending additional queue progress
> related information (not queue identifier).
> 
> Hence
> 1. to avoid any misunderstanding and association of
> queue_notify_data with similar name VIRTIO_F_NOTIFICATION_DATA,
> 
> and
> 2. to reflect that queue_notify_data is the actual device
> internal vq identifier, rename it to queue_notify_id.
> 
> Reflect vq identifier in the driver notification structure by renaming
> ambiguous vqn to vq_notify_id.
> 
> The driver notification section assumes that queue notification contains
> vq index always. CONFIG_DATA feature bit introduction missed to
> update the driver notification section. Hence, correct it.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> 
> ---
> Some side notes:
> renaming vqn to vqnd is even more confusing because data is really the
> queue identifier.
> 
> And NOTIFICATION_DATA really contains queue progress info (data).
> 
> (vqn - n is number or notification?, notification word in the
> notification structure does not make sense).
> 
> Hence above renaming.
> 
> ---
> changelog:
> v11->v12:
> - new patch
> ---
>  content.tex        | 17 ++++++++++++++---
>  notifications-be.c |  2 +-
>  notifications-le.c |  2 +-
>  transport-pci.tex  | 24 ++++++++++++++----------
>  4 files changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index cd93db2..d5f8026 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -405,8 +405,18 @@ \section{Driver Notifications} \label{sec:Basic Facilities of a Virtio Device /
>  notification to the device.
>  
>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
> -this notification involves sending the
> -virtqueue index to the device (method depending on the transport).
> +this notification involves sending only the 16-bit virtqueue notification
> +identifier (notification method depends on the transport).
> +
> +\begin{itemize}
> +\item When VIRTIO_F_NOTIF_CONFIG_DATA is not negotiated, virtqueue
> +notification identifier is a 16-bit vq index.
> +
> +\item When VIRTIO_F_NOTIF_CONFIG_DATA is negotiated, virtqueue
> +notification identifier is a device supplied virtqueue identifier. A method
> +to supply such virtqueue notification identifier is transport
> +specific.
> +\end{itemize}
>  
>  However, some devices benefit from the ability to find out the
>  amount of available data in the queue without accessing the virtqueue in memory:


VIRTIO_F_NOTIF_CONFIG_DATA is such a narrow usecase, I don't like
burning "vq identifier" on this. How about we just say something
along the lines of:


When VIRTIO_F_NOTIFICATION_DATA has not been negotiated, this
notification involves sending either the virtqueue index or the
virtqueue config data to the device (method depending on the
transport).

And then "the data sent is a device supplied virtqueue config data".



> @@ -417,7 +427,8 @@ \section{Driver Notifications} \label{sec:Basic Facilities of a Virtio Device /
>  the following information:
>  
>  \begin{description}
> -\item [vqn] VQ number to be notified.
> +\item [vq_notify_id] VQ notification identifier of a
> +      corresponding virtqueue.
>  \item [next_off] Offset
>        within the ring where the next available ring entry
>        will be written.
> diff --git a/notifications-be.c b/notifications-be.c
> index 5be947e..0a7cbf1 100644
> --- a/notifications-be.c
> +++ b/notifications-be.c
> @@ -1,5 +1,5 @@
>  be32 {
> -	vqn : 16;
> +	vq_notify_id : 16; /* previously known as vqn */
>  	next_off : 15;
>  	next_wrap : 1;
>  };
> diff --git a/notifications-le.c b/notifications-le.c
> index fe51267..6cca8fb 100644
> --- a/notifications-le.c
> +++ b/notifications-le.c
> @@ -1,5 +1,5 @@
>  le32 {
> -	vqn : 16;
> +	vq_notify_id : 16; /* previously known as vqn */
>  	next_off : 15;
>  	next_wrap : 1;
>  };
> diff --git a/transport-pci.tex b/transport-pci.tex
> index 5d98467..6bbf61c 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -319,7 +319,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>          le64 queue_desc;                /* read-write */
>          le64 queue_driver;              /* read-write */
>          le64 queue_device;              /* read-write */
> -        le16 queue_notify_data;         /* read-only for driver */
> +        le16 queue_notify_id;           /* read-only for driver */
>          le16 queue_reset;               /* read-write */
>  };
>  \end{lstlisting}
> @@ -388,17 +388,21 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  \item[\field{queue_device}]
>          The driver writes the physical address of Device Area here.  See section \ref{sec:Basic Facilities of a Virtio Device / Virtqueues}.
>  
> -\item[\field{queue_notify_data}]
> +\item[\field{queue_notify_id}]
>          This field exists only if VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated.
> -        The driver will use this value to put it in the 'virtqueue number' field
> -        in the available buffer notification structure.
> +        The driver will use this value when driver sends available buffer
> +        notification to the device.
>          See section \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Available Buffer Notifications}.
>          \begin{note}
>          This field provides the device with flexibility to determine how virtqueues
>          will be referred to in available buffer notifications.
> -        In a trivial case the device can set \field{queue_notify_data}=vqn. Some devices
> -        may benefit from providing another value, for example an internal virtqueue
> -        identifier, or an internal offset related to the virtqueue number.
> +        In a trivial case the device can set \field{queue_notify_id} to
> +        vq index. Some devices may benefit from providing another value,
> +        for example an internal virtqueue identifier, or an internal offset
> +        related to the virtqueue index.
> +        \end{note}
> +        \begin{note}
> +        This field is previously known as queue_notify_id.
>          \end{note}
>  
>  \item[\field{queue_reset}]
> @@ -468,7 +472,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  
>  \drivernormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
>  
> -The driver MUST NOT write to \field{device_feature}, \field{num_queues}, \field{config_generation}, \field{queue_notify_off} or \field{queue_notify_data}.
> +The driver MUST NOT write to \field{device_feature}, \field{num_queues}, \field{config_generation}, \field{queue_notify_off} or \field{queue_notify_id}.
>  
>  If VIRTIO_F_RING_PACKED has been negotiated,
>  the driver MUST NOT write the value 0 to \field{queue_size}.
> @@ -1053,9 +1057,9 @@ \subsubsection{Available Buffer Notifications}\label{sec:Virtio Transport Option
>  If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:
>  \begin{itemize}
>  \item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the driver MUST use the
> -\field{queue_notify_data} value instead of the virtqueue index.
> +\field{queue_notify_id} value instead of the virtqueue index.
>  \item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver MUST set the
> -\field{vqn} field to the \field{queue_notify_data} value.
> +\field{vq_notify_id} field to the \field{queue_notify_id} value.
>  \end{itemize}
>  
>  \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Used Buffer Notifications}
> -- 
> 2.26.2


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

