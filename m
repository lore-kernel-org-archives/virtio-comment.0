Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5122C15ECE1
	for <virtio-comment@lists.linux.dev>; Tue,  2 Jul 2024 12:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719921650; cv=none; b=Y8VHYfmQauaQxxr3WchThWJ39scDISFO+fuddG8UWkmlnvx96Dxvrpl3qnfXXdFSOAtZ7dHfKrW6zUejKvI0yTaYQCfcOiHKZmboxJLB62Ra3IK9OqOI3bJKM3xrcImEh4ukkCehzfoEpy/OPRUnfxFR6jr+caGcLLoCVBVra74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719921650; c=relaxed/simple;
	bh=cD/G/tudkWzxDLz4iIamjeMPrRn6BYTV7druuuEuMuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dSpNNOJGMHxBm5rUv+Sud2sYbHAQUjEvR7hg4FJI80FgTOXZ8KExr1KhYts/FaEvuHpwvPdyJkgEe9PzNYB0QbcUyDDY+S/XJX4YXZ2u9h9RJdH5wwmlu1coudoFopWCOxTqLV10drLuMULVF+uIBsmOHN8Bxqic3Ok0lBLBuRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D49zUOWk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D49zUOWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719921647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yFQksdypu+n9GoMNwH6p2SVlklxaIGyrk/XbOvDSRU0=;
	b=D49zUOWkGShTXeA63OxOUV+AaxyQoVqEsoEU/zXCnrY2zg/uiAaw/iqR0RuU0ZuRDL1H5j
	O+I5d9Ph6f3QHAdtXi9q5tc1Cr97Rtu608g/5GJVPlG0JV94Qs9Z4pBy0xsUYL+9uSnxBK
	OkX9KutOV6EQc40u1Mbtf4y8gOGkf7g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-Q3JQKLYcMeu7npmB2vObKA-1; Tue, 02 Jul 2024 08:00:45 -0400
X-MC-Unique: Q3JQKLYcMeu7npmB2vObKA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3678e549a1eso115632f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 02 Jul 2024 05:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719921644; x=1720526444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFQksdypu+n9GoMNwH6p2SVlklxaIGyrk/XbOvDSRU0=;
        b=ZJrHFmZ2R/Js+YQ1/aH2KuJrqAkkNIRypo3pIpkr/8nJJCW1Qv8lSY3pm8NOZbo5/X
         PCJ0xhqvnZGO4GM+F5ox55e83TAi5i29l5p2PTmlA5VDdwU0s8d+peCCOVaB0EACIEok
         fx+VY7Qy4DFJ4c28bTnj0BLYx9MIFXLTcaIB3UIkP2jgPhdiOynBr3ZxmV811/IS8Mc8
         Mh6ZI01ZqNvsLUGUzzecVoD75Gv7VHyxY9EF+Ps/sHI4WcGVWibe8MV9+BZEjDe6+lc0
         SH4nwzCgsQmyrRQoJHE5n1J5LQVIvs1wptP4uPqdXxIpN6YdmGZzogJuVyLChTFJTwQ/
         10pw==
X-Gm-Message-State: AOJu0Yz0k0FPWt8iwgX/r8ceafvXSLBMPJ9nCDcFVELb65C92IUD+PAl
	yFNOLcaRgyze+1cC2IZpt1wOd4j9BgNR8fs8XRw2h+kFOLzoMYkBAo5iRgcJ5QIJVDFuTMl7vvF
	1yH0fYdZ8IdZQslFEq4kGw7509xgHTmHOCwzafEroSs2tSi+WO7wpvcSqsYeWQlIM
X-Received: by 2002:a05:6000:1fa5:b0:363:b3ea:7290 with SMTP id ffacd0b85a97d-36760a7c1d3mr10505852f8f.20.1719921644509;
        Tue, 02 Jul 2024 05:00:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSffJZa5mXi1dIopOMDm+mIIpybqqi0/VDgLbibqNUqcYB66dwhTlaK6Jvv7BPg/wZ87yA6g==
X-Received: by 2002:a05:6000:1fa5:b0:363:b3ea:7290 with SMTP id ffacd0b85a97d-36760a7c1d3mr10505805f8f.20.1719921643751;
        Tue, 02 Jul 2024 05:00:43 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:55d:614d:9fb:6fdd:72a4:f3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af3c272sm199510915e9.8.2024.07.02.05.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 05:00:43 -0700 (PDT)
Date: Tue, 2 Jul 2024 08:00:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xiaoguang Wang <lege.wang@jaguarmicro.com>
Cc: virtio-comment@lists.linux.dev, vattunuru@marvell.com,
	ndabilpuram@marvell.com, parav@nvidia.com, leo.liu@jaguarmicro.com,
	angus.chen@jaguarmicro.com
Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Message-ID: <20240702073359-mutt-send-email-mst@kernel.org>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240701034435.675-1-lege.wang@jaguarmicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for the patch!
Yet something to improve:


On Mon, Jul 01, 2024 at 11:44:35AM +0800, Xiaoguang Wang wrote:
> Currently for the PCI transport, used buffer notification suppression
> informations are located in guest memory, for example, pvirtq_event_suppress
> for packed ring and virtq_avail for split ring, then PCI devices simulated
> by hypervisors, such as QEMU, can vist these suppression informations
> directly before issuing used event, the only overheads may be just proper
> memory barriers, but for some hardware PCI devices offered by
> DPU(Data Processing Unit), DPU would need to submit DMAs to copy guest
> suppression informations to DPU internal memory, then check whether
> used event should be notified by examing this internal memory, which
> is obvious expensive, and this DMA operation is needed every time
> DPU attempts to issue used event, DPU may also choose to add a hardware
> component to polling suppression informations by submit DMAs continuously
> to get newest used event suppression infos, but it's also expensive.
> 
> To help improve this sitiuations, add a new feature:
> VIRTIO_F_USED_EVENT_AUTO_DISABLE. When this feature bit is negotiated,
> devices will place new notification area for used buffer suppression
> notification in PCI bar specfied by virtio_pci_notify_cap, also for better
> used buffer notification coalescing, the device will disable later used
> buffer notifications automatically after sending one used buffer notification
> to driver, and after the driver finishes handling current used buffer event,
> it needs to notify the device to enable used buffer notification again by
> writing above new notification area in PCI bar. Device will receive
> this notification reliably, and device knows that it can issue used event
> now, but it may choose appropriate timing to send used events according to
> its notification coalescing policy , now it also does not need to DMA guest
> memory to obtain notification suppression.
> 
> Signed-off-by: Xiaoguang Wang <lege.wang@jaguarmicro.com>


This proposal raises a lot of questions.
See some of them below.



> ---
>  content.tex       | 38 ++++++++++++++++++++++++++++++++++++++
>  transport-pci.tex | 26 +++++++++++++++++++++++++-
>  2 files changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/content.tex b/content.tex
> index 0a62dce..84505da 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -448,6 +448,7 @@ \section{Driver Notifications} \label{sec:Basic Facilities of a Virtio Device /
>  The driver is sometimes required to send an available buffer
>  notification to the device.
>  
> +\subsection{Available Buffer Notifications} \label{sec:Basic Facilities of a Virtio Device / Driver notifications / Available Buffer Notifications}
>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
>  this notification contains either a virtqueue index if
>  VIRTIO_F_NOTIF_CONFIG_DATA is not negotiated or device supplied virtqueue
> @@ -488,6 +489,35 @@ \section{Driver Notifications} \label{sec:Basic Facilities of a Virtio Device /
>  has been negotiated, these notifications would then have
>  identical \field{next_off} and \field{next_wrap} values.
>  
> +\subsection{Used Buffer Event Enable Notifications} \label{sec:Basic Facilities of a Virtio Device / Driver notifications / Used Buffer Event Enable Notifications}
> +This kind of notification is only necessary when VIRTIO_F_USED_EVENT_AUTO_DISABLE has been negotiated.

This is not how you start a section. Some text from commit log
might be helpful here.


> +When this feature bit is negotiated, the device will disable used buffer notification
> +automatically after sending one used buffer notification to the driver, and after the driver
> +finishes handling current used buffer event, it needs to notify the device to enable used
> +buffer notification again.
> +
> +\begin{description}
> +\item [vq_index or vq_notif_config_data] Either virtqueue index or device
> +      supplied queue notification config data corresponding to a virtqueue.
> +\item [used_off] Offset
> +      within the ring where the latest used ring entry the driver has processed.
> +      Without VIRTIO_F_RING_PACKED this refers to the 14 least significant bits of the
> +      offset (in units of descriptor entries) within the descriptor ring where the latest used
> +      ring entry the driver has processed. With VIRTIO_F_RING_PACKED this refers to the offset
> +      (in units of descriptor entries) within the descriptor ring where the latest used ring
> +      entry the driver has processed.
> +\item [used_wrap] Wrap Counter.
> +      With VIRTIO_F_RING_PACKED this is the wrap counter
> +      referring to the latest used descriptor where the driver has processed.
> +      Without VIRTIO_F_RING_PACKED this refers to the most significant bit(bit 14) of the
> +      offset (in units of descriptor entries) within the descriptor ring where the latest used ring
> +      entry the driver has processed..
> +\item [enable_notify] Whether to enable used buffer notification.
> +      The driver may benefit from just informing device the latest used ring entry
> +      it has processed, but not enabling used buffer notification. This field only
> +      occupies one bit, if set to 1, it will enable used buffer notification, otherwise not.

not what?

> +\end{description}
> +


I don't really understand what is this list supposed to mean.
You seem to be defining a bunch of fields which are never used?


Wouldn't a better way to put all this be to say that
the driver sends a copy of notification suppression
info to device?
In case of split - flags  + used_event
In case of packed - struct pvirtq_event_suppress



>  \input{shared-mem.tex}
>  
>  \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Exporting Objects}
> @@ -872,6 +902,14 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>  	handling features reserved for future use.
>  
> +  \item[VIRTIO_F_USED_EVENT_AUTO_DISABLE(42)] This feature indicates that the device
> +  will disable used buffer notification automatically after sending one used buffer notification.
> +  Note: when VIRTIO_F_RING_PACKED has not been negotiated, the maximum queue
> +  size MUST NOT be greater than 16384, when VIRTIO_F_RING_PACKED has been negotiated,
> +  the maximum queue size MUST NOT be greater than 16383.

This is not the place for this kind of note.


> +
> +  See \ref{sec:Basic Facilities of a Virtio Device / Driver notifications / Used Buffer Event Enable Notifications}
> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719..62ba9dc 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -551,6 +551,13 @@ \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options
>          cap.offset + queue_notify_off * notify_off_multiplier
>  \end{lstlisting}
>  
> +If the VIRTIO_F_USED_EVENT_AUTO_DISABLE feature has been negotiated, \field{notify_off_multiplier} is also
> +combined with the \field{queue_notify_off} to derive the Queue Notify address for enabling
> +used buffer notifications within a BAR for a virtqueue,

each term has to be first explained, then used.
you never bother saying what is "Queue Notify address for enabling
used buffer notifications"

> but add a 4 bytes offset:
> +\begin{lstlisting}
> +        cap.offset + queue_notify_off * notify_off_multiplier + 4

quite a hack. why not just a new capability?

> +\end{lstlisting}
> +
>  The \field{cap.offset} and \field{notify_off_multiplier} are taken from the
>  notification capability structure above, and the \field{queue_notify_off} is
>  taken from the common configuration structure.


All this is quite vague and informal.


> @@ -563,7 +570,7 @@ \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options
>  \devicenormative{\paragraph}{Notification capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
>  The device MUST present at least one notification capability.
>  
> -For devices not offering VIRTIO_F_NOTIFICATION_DATA:
> +For devices not offering VIRTIO_F_NOTIFICATION_DATA or VIRTIO_F_USED_EVENT_AUTO_DISABLE:
>  
>  The \field{cap.offset} MUST be 2-byte aligned.
>  
> @@ -596,6 +603,23 @@ \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options
>  cap.length >= queue_notify_off * notify_off_multiplier + 4
>  \end{lstlisting}
>  
> +For devices offering VIRTIO_F_USED_EVENT_AUTO_DISABLE:
> +
> +The device MUST either present \field{notify_off_multiplier} as a
> +number that is a power of 2 that is also a multiple 4,
> +or present \field{notify_off_multiplier} as 0.
> +
> +The \field{cap.offset} MUST be 4-byte aligned.
> +
> +The value \field{cap.length} presented by the device MUST be at least 8
> +and MUST be large enough to support queue notification offsets
> +for all supported queues in all possible configurations.
> +
> +For all queues, the value \field{cap.length} presented by the device MUST satisfy:
> +\begin{lstlisting}
> +cap.length >= queue_notify_off * notify_off_multiplier + 8
> +\end{lstlisting}
> +
>  \subsubsection{ISR status capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
>  
>  The VIRTIO_PCI_CAP_ISR_CFG capability


After reading this and the text, I can't figure out how is this feature
supposed to work without races.  What if the device uses a buffer while
the driver notification is in flight to the device?

> -- 
> 2.34.1

