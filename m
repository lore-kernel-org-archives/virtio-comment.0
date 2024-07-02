Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49BD7462
	for <virtio-comment@lists.linux.dev>; Tue,  2 Jul 2024 01:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719883020; cv=none; b=q7F5LwIJyi6ERrkrqagG5TL9G+5ljGiC6uRmWJke+/0qxy7E0k/nn5mSjArZjsW8+64daeOJMMU5qhGzLt1MhuIIBbtHWbfawxNa0coUKhyZ6x/nobiDxvGHSthXQ3ne2js4Q4RP0zRevS+X7AxI12hxSl90jFHVllVUEjcL4ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719883020; c=relaxed/simple;
	bh=kEXmhU6CZc//jjNVtog5zeGgBjaj1U0ULf8kXgPizYc=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=noB30ZPYSxOm2Mze1GvSBaZSFKZIRVVP/PYi+4dMyVPJpcRxi+feylAHlnjL8W6UKl6aJjAMnl7ofynQ1kNLJ99HOSAFNRjUru+qbtWQRkdAC+0e/g7RdTilpgqobAwUP0EtjvMOK+NdZvlgDGPzq4/dxindAb75FPI6GyR4Pmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Bl3Jiqi+; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Bl3Jiqi+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1719883015; h=Message-ID:Subject:Date:From:To;
	bh=6viEIgyxsegC3xG0VTCsXApJJtIstFf1TUNTTK9TqH0=;
	b=Bl3Jiqi+SHrP9D7e6V1HiLNAJoMW/LvGQOTG8rFrgEJP639g6S+wj1ffowbcORsj/XBCJo0fYc2z/WShWzjk4qfUW3nDPpkgfhSX9mazfr4twVRlNl8feOX7nJae5TFyh82uQrCCYmjFEzOevDmDXhUOBRRemkLE9jO/6zasV8s=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R361e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067110;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0W9gVDah_1719883013;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0W9gVDah_1719883013)
          by smtp.aliyun-inc.com;
          Tue, 02 Jul 2024 09:16:53 +0800
Message-ID: <1719882918.7093904-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer notification suppression mechanism
Date: Tue, 2 Jul 2024 09:15:18 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Xiaoguang Wang <lege.wang@jaguarmicro.com>
Cc: vattunuru@marvell.com,
 ndabilpuram@marvell.com,
 parav@nvidia.com,
 mst@redhat.com,
 leo.liu@jaguarmicro.com,
 angus.chen@jaguarmicro.com,
 Xiaoguang Wang <lege.wang@jaguarmicro.com>,
 virtio-comment@lists.linux.dev
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
In-Reply-To: <20240701034435.675-1-lege.wang@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Mon,  1 Jul 2024 11:44:35 +0800, Xiaoguang Wang <lege.wang@jaguarmicro.com> wrote:
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


How about reuse the doorbells, like other devices?

We can do some refactors for the doorbell? Let it support some new flags.

Thanks.


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
> +\end{description}
> +
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
> +used buffer notifications within a BAR for a virtqueue, but add a 4 bytes offset:
> +\begin{lstlisting}
> +        cap.offset + queue_notify_off * notify_off_multiplier + 4
> +\end{lstlisting}
> +
>  The \field{cap.offset} and \field{notify_off_multiplier} are taken from the
>  notification capability structure above, and the \field{queue_notify_off} is
>  taken from the common configuration structure.
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
> --
> 2.34.1
>
>
