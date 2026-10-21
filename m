Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576745;
	b=PWsfZAD6PSjUgTYZik8R4b68GJ8ufx6sNl9ibOPFAyA/42czjx/q8CLHz37MpQUddDmD
	 N97+rRAMBSSHj5MXTvTUDl9TOJA1ATmxbiPuIDAbUijWkzfX4s1Nqqme14XG7X2m4/Rhm
	 7TCMwlUZskovVnhaLxYHiaee8ywAx8JQIGvstkY82eOG5zA8V+ASCmXQjRscksUm/nLrZ
	 YxmjZAE35hDpmXdtFv6w09DsZpEZhijPZGNzs12yUgqQ9p6ja2d5DpEAIvsx1FFpTdIZO
	 EggWOGzrB5REWfaN68n5kt/1UKnqCv5GufggXF/CWiARv7gl16X4rJJITPlBHtYaE0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576745;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition;
	bh=uPqDr8f9oETbPqLMBMAYYRkW3fLIMGKT6oW3IwzPpaU=;
	b=RMWfkHxkHi8Pp8FqJKuA4AY4MJqZVPsW2EYhoht2+Xzgf4zuvCgZZrIcHNXgrDxbY4B4
	 1leJu3hGMFUx5PJTVW9pFr3NyO3cRe0fNheTDjEXB2qC+veSrAQleYwrR3ZcRMjSmGSBY
	 gb1D+ahGJFbv6b4LSb8iu3PWzh00202BUrmknptKLE15l1xInVl8s/N0RLVMF6rErMo8D
	 9JdMwsgYxCx33Yq68C2VUvTgswzKE5vlJ0a2LqXmCDSwx7lvlgT2yy/tpl/F5BRjExu2T
	 hAZJ1P3HnSeMTB82XvysDECYab7kiTiNVBWgSp4jiFXf8/TQQl1A/VvnXxzmjB0Y2vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cwk+MuhK;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C4E606A319
	for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 09:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C4E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Cwk+MuhK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792576742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uPqDr8f9oETbPqLMBMAYYRkW3fLIMGKT6oW3IwzPpaU=;
	b=Cwk+MuhKUfy3DOZX6p8w0kDU68QnjHRh/WF4VXZ1kj05doFU5xOQzdtCfYaKHE3cvaGj6L
	YtZImj5zQR5EvZhhBQ8J7d85zT9yVwkOPo8KTATqGcHrsQee83W5XGalXS+O7t9E3Ky47W
	It6jBlThrAYN8uMMML+ScGSy/0FYrXU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-Aj18wwXtPvK_9zhijf8dgA-1; Wed, 21 Oct 2026 09:58:58 +0000
X-MC-Unique: Aj18wwXtPvK_9zhijf8dgA-1
X-Mimecast-MFC-AGG-ID: Aj18wwXtPvK_9zhijf8dgA_1792576738
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a019d53f46so5507385e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 02:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576737; x=1793181537;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPqDr8f9oETbPqLMBMAYYRkW3fLIMGKT6oW3IwzPpaU=;
        b=UyTm7t5Mjwzc5aH3RoyBwlPo4bb/Bk/A8ENtDeMgW5kPCi1ei1+bPDlFM4hj27xKQG
         XsRb1DnWUgywKj5Jt7+OrVCeNf90K3sEenWRb7vFZfdAmEM4rLeWKwxKNoeWpFBoBW7F
         amPWn/n9dROrvpYCdbmypxzsjWi4oDcVteGqvxfznHhMYtlh1ZOFNAUly9TgNQSByWEq
         YM/bm+nRS09EZixOcT/MvGUVc/ouD3PdaaUXj9dAmGgjCpUF/Bl8o1Q7RKO9xHm8heUA
         nF0FBoTCYvZbHw4soD6TAxVEYgdnzHvVHKdGEHHU7V+VFkecHIFX03woNfZGrgZ5Iyec
         IIvw==
X-Gm-Message-State: AFq9FYJQkB0i4QvQe/a2vhygcMq7D2r2XTMxNgzZQ4yipjNXXQV/qLGg
	RKs1Sw+Z9ziJ3FJMm0YSfeldMxP11SxCsuibsafNCOxuaoeMrMqEXbYwJZrLDrKS/z5F4DCjJxv
	CoQeSnxxiQIyk1J13apzCY6IDVHHsEhS3fZyLxxmX1/3nn5yUAx59J9/MnyafKS5ZeOte
X-Gm-Gg: AYBFou16uRxEAyM53GWS+BG5GvJ+D6T+ARBlXjM05nqs2Bkbj/oIzdj4etSPpzphuC3
	5RqlA8Zd+SjPWz5QFnhcLk8BrsdX77TxvHNnPclV6sII17dwNyNq4l7mFHEzOE9/kMyCCYRVGWG
	zpIP8YfBcmWZyXo2f+i32tUUB2yBd+HBv8pamprkCp55CmNXgvwh9geCMDD2A/+c+1RE2lj5hFE
	ktzWkPmr56QDsd3KU+A3HV765+2YN70ztJCEN+spEGULSjvptLUx31OuMbRSn5wrBE8HVG/pT8m
	Fx5rR8tjUJtdYYVBy8fYC4Vl9tCB7GWVPq9JvL9NO++Cqc14BYPTFrg8/7Xv3nmZSoCAlD7breQ
	+
X-Received: by 2002:a05:600d:19:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4a1fdd40492mr22110545e9.33.1792576736640;
        Wed, 21 Oct 2026 02:58:56 -0700 (PDT)
X-Received: by 2002:a05:600d:19:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4a1fdd40492mr22109445e9.33.1792576735164;
        Wed, 21 Oct 2026 02:58:55 -0700 (PDT)
Received: from redhat.com ([2a01:e0a:bd0:8c60:8c51:6b89:33a1:62d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ff85a05bsm25936315e9.11.2026.10.21.02.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:58:54 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:58:52 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Cc: virtio-comment@lists.linux.dev,
	Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>,
	Aiswarya Cyriac <aiswarya.cyriac@oss.qualcomm.com>,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2] virtio-usb: Add initial virtio-usb specification
Message-ID: <atiM3BRaZ83j-gFg@redhat.com>
References: <20260611130826.287372-1-vasilii.ianikeev@oss.qualcomm.com>
 <20260924154007.143927-1-igor.skalkin@oss.qualcomm.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20260924154007.143927-1-igor.skalkin@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0PYyFQuMmO49p_iyaGG7q1adLn3hlfS1RgAWvY4Wjwc_1792576738
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I added some minor comments.

On Thu, Sep 24, 2026 at 05:40:07PM +0200, Igor Skalkin wrote:
> This defines the virtio-usb device: a dual-role virtio device capable
> of acting as a USB host controller, a USB device controller, or both
> simultaneously with runtime role switching between the two on ports
> that support it.
> 
> This revision reconciles the specification with protocol details that
> were clarified or extended while integrating and testing a real driver
> (coqos-virtio-usb-driver-linux) and backend
> (coqos-vhost-usb-gadget-driver-linux) against this spec, per the
> "Changes since v1" note below.
> 
> Changes since v1 (RFC):
> 
>  - Virtqueue presentation is now per negotiated role, not always-on:
>    3 virtqueues (commandq/eventq/dataq) for VIRTIO_USB_F_HOST, 3 for
>    VIRTIO_USB_F_DEVICE, and 2 (commandq/eventq) for
>    VIRTIO_USB_F_ROLE_SWITCH, instead of always presenting all 8
>    regardless of negotiated features.
> 
>  - Host role: added a vp_idx field to virtio_usb_request and
>    virtio_usb_host_port_event identifying the physical port
>    (0..ports-1), redefining the existing port/port_id field to
>    identify a leaf device behind that physical port instead (0 for a
>    direct device, or a hub downstream port number). This supports a
>    physical port that is itself a hub with more than one USB device
>    connected behind it, and a device that exposes more than one
>    host-role virtual port.
> 
>  - Device role: split the CONNECTED event into BIND and UNBIND.
>    The new virtio_usb_dev_bind_event carries a max_speed field and an
>    optional udc_name_prefix string. A port (device ID) field was also
>    added to virtio_usb_dev_event and virtio_usb_dev_setup_event, which
>    previously had no way to identify which device role port an event
>    applied to.
> 
>  - Allowed VIRTIO_USB_SPEED_SUPER_PLUS as a valid max_speed value in
>    the Device Bind and Unbind events normative section, where it had
>    been inadvertently omitted.
> 
>  - Clarified that a device role UDC is virtualized as a whole in this
>    version of the specification (single guest per UDC). Sharing a
>    single physical UDC across multiple guests - where each guest owns
>    a distinct function of a composite gadget hosted on that UDC - is
>    a separate approach currently being explored, and is out of scope
>    for this specification.
> 
> Co-Authored-By: Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>
> Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
> ---
>  conformance.tex                         |   12 +-
>  content.tex                             |    1 +
>  device-types/usb/description.tex        | 1478 +++++++++++++++++++++++
>  device-types/usb/device-conformance.tex |   26 +
>  device-types/usb/driver-conformance.tex |   17 +
>  introduction.tex                        |    6 +
>  6 files changed, 1536 insertions(+), 4 deletions(-)
>  create mode 100644 device-types/usb/description.tex
>  create mode 100644 device-types/usb/device-conformance.tex
>  create mode 100644 device-types/usb/driver-conformance.tex
> 
> diff --git a/conformance.tex b/conformance.tex
> index fb16c16..b77c7bf 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -36,8 +36,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / CAN Driver Conformance},
>  \ref{sec:Conformance / Driver Conformance / SPI Controller Driver Conformance},
> -\ref{sec:Conformance / Driver Conformance / Media Driver Conformance} or
> -\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance}.
> +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance},
> +\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance} or
> +\ref{sec:Conformance / Driver Conformance / USB Driver Conformance}.
>  
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>    \end{itemize}
> @@ -67,8 +68,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
>  \ref{sec:Conformance / Device Conformance / CAN Device Conformance},
>  \ref{sec:Conformance / Device Conformance / SPI Controller Device Conformance},
> -\ref{sec:Conformance / Device Conformance / Media Device Conformance} or
> -\ref{sec:Conformance / Device Conformance / RTC Device Conformance}.
> +\ref{sec:Conformance / Device Conformance / Media Device Conformance},
> +\ref{sec:Conformance / Device Conformance / RTC Device Conformance} or
> +\ref{sec:Conformance / Device Conformance / USB Device Conformance}.
>  
>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>    \end{itemize}
> @@ -168,6 +170,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \input{device-types/spi/driver-conformance.tex}
>  \input{device-types/media/driver-conformance.tex}
>  \input{device-types/rtc/driver-conformance.tex}
> +\input{device-types/usb/driver-conformance.tex}
>  
>  \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
>  
> @@ -262,6 +265,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \input{device-types/spi/device-conformance.tex}
>  \input{device-types/media/device-conformance.tex}
>  \input{device-types/rtc/device-conformance.tex}
> +\input{device-types/usb/device-conformance.tex}
>  
>  \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
>  A conformant implementation MUST be either transitional or
> diff --git a/content.tex b/content.tex
> index 5de811f..b9b7c2f 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -835,6 +835,7 @@ \chapter{Device Types}\label{sec:Device Types}
>  \input{device-types/spi/description.tex}
>  \input{device-types/media/description.tex}
>  \input{device-types/rtc/description.tex}
> +\input{device-types/usb/description.tex}
>  
>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  
> diff --git a/device-types/usb/description.tex b/device-types/usb/description.tex
> new file mode 100644
> index 0000000..3f758b4
> --- /dev/null
> +++ b/device-types/usb/description.tex
> @@ -0,0 +1,1478 @@
> +\section{USB Device}\label{sec:Device Types / USB Device}
> +
> +A virtio USB device is a dual role device capable of functioning as a
> +USB host controller, or a USB device controller, or supporting both
> +roles. Additionally, the device supports switching between the USB
> +host role and USB device role.
> +
> +A USB device supports one or more ports. Each port can operate as a
> +USB host controller port, USB device controller port, or a dual-role
> +port that allows role switching, depending on the device's capabilities.
> +
> +This section relies on definitions from USB specification 2.0
> +(\hyperref[intro:USB2]{USB2}) and USB specification 3.2
> +(\hyperref[intro:USB3.2]{USB3.2}).
> +
> +\subsection{Device ID}\label{sec:Device Types / USB Device / Device ID}
> +
> +49
> +
> +\subsection{Virtqueues}\label{sec:Device Types / USB Device / Virtqueues}
> +
> +\begin{description}
> +\item[0] commandq(host)
> +\item[1] eventq(host)
> +\item[2] dataq(host)
> +\item[3] commandq(device)
> +\item[4] eventq(device)
> +\item[5] dataq(device)
> +\item[6] commandq(role-switch)
> +\item[7] eventq(role-switch)
> +\end{description}
> +
> +The device presents a dedicated set of command, event and data queues
> +for each of the USB host role, USB device role, and role-switch
> +mechanism that it actually negotiates: 3 virtqueues (commandq, eventq,
> +dataq) for the host role if VIRTIO_USB_F_HOST is negotiated, 3
> +virtqueues for the device role if VIRTIO_USB_F_DEVICE is negotiated,
> +and 2 virtqueues (commandq, eventq) for role switching if
> +VIRTIO_USB_F_ROLE_SWITCH is negotiated. A device negotiating only one
> +of VIRTIO_USB_F_HOST or VIRTIO_USB_F_DEVICE therefore presents only 3
> +virtqueues in total; a device negotiating both, with role switching,
> +presents all 8.
> +
> +The command queue in the USB host role is used by the driver to send USB
> +command messages to the device. The device replies with responses
> +over the same queue.
> +
> +The event queue in the USB host role is used by the device to send
> +notifications about events to the driver.
> +
> +The data queue in the USB host role is used to submit URBs (USB Request
> +blocks) to the device. The device replies with a response over the
> +same data queue.
> +
> +The command queue in the USB device role is used by the driver to
> +send USB device controller commands to the device. The device replies
> +with a response over the same queue.
> +
> +The event queue in the USB device role is used by the device to
> +deliver USB events such as bind, unbind, suspend, and resume to the
> +driver.
> +
> +The data queue in the USB device role is used by the driver to post
> +transfer buffers for all USB Endpoints --- transmit buffers for IN
> +endpoints, and receive buffers for OUT endpoints.
> +
> +The command queue for USB OTG is used by the driver to send requests

What OTG stands for?

> +to the device to get or set the current USB role (Host or Device). The
> +device responds with a reply over the same queue.
> +
> +The event queue for USB OTG is used by the device to deliver OTG
> +events to the driver.
> +
> +\devicenormative{\subsubsection}{Virtqueues}{Device Types / USB Device / Virtqueues}
> +
> +\begin{itemize}
> +  \item The device MUST NOT present USB host related queues (commandq,
> +    eventq and dataq) if VIRTIO_USB_F_HOST is not negotiated.
> +  \item The device MUST NOT present USB device related queues
> +    (commandq, eventq and dataq) if VIRTIO_USB_F_DEVICE is not
> +    negotiated.
> +  \item The device MUST NOT present role-switch related queues
> +    (commandq and eventq) if VIRTIO_USB_F_ROLE_SWITCH is not
> +    negotiated.
> +\end{itemize}
> +
> +\drivernormative{\subsubsection}{Virtqueues}{Device Types / USB Device / Virtqueues}
> +
> +\begin{itemize}
> +  \item The driver MUST NOT use USB host related queues (commandq, eventq and
> +    dataq) if VIRTIO_USB_F_HOST feature is not negotiated (see
> +    \nameref{sec:Device Types / USB Device / Feature bits}).
> +  \item The driver MUST NOT use USB device related queues (commandq, eventq and
> +    dataq) if VIRTIO_USB_F_DEVICE feature is not negotiated (see
> +    \nameref{sec:Device Types / USB Device / Feature bits}).
> +  \item The driver MUST NOT use USB OTG related queues (commandq and eventq)
> +    if VIRTIO_USB_F_ROLE_SWITCH feature is not negotiated (see
> +    \nameref{sec:Device Types / USB Device / Feature bits}).
> +\end{itemize}
> +
> +\subsection{Feature bits}\label{sec:Device Types / USB Device / Feature bits}
> +
> +\begin{description}
> +\item[VIRTIO_USB_F_HOST (0)] Indicates whether the device is
> +capable of operating in the USB host role.
> +\item[VIRTIO_USB_F_DEVICE (1)] Indicates whether the device is
> +capable of operating in the USB device role.
> +\item[VIRTIO_USB_F_ROLE_SWITCH (2)] Indicates whether the device
> +supports dynamic switching between the USB host and device roles,
> +provided both VIRTIO_USB_F_HOST and VIRTIO_USB_F_DEVICE are also
> +supported.
> +\end{description}
> +
> +\devicenormative{\subsubsection}{Feature bit requirements}{Device Types / USB Device / Feature bits / Feature bit requirements}
> +
> +\begin{itemize}
> +  \item The device MUST NOT offer VIRTIO_USB_F_ROLE_SWITCH unless both
> +    VIRTIO_USB_F_HOST and VIRTIO_USB_F_DEVICE are also offered.
> +\end{itemize}
> +
> +
> +\subsection{Device configuration layout}\label{sec:Device Types / USB Device / Device configuration layout}
> +
> +\begin{lstlisting}
> +struct virtio_usb_config {
> +	le32 ports;
> +};
> +\end{lstlisting}
> +
> +A configuration space contains the following fields:
> +
> +\begin{description}
> +\item[\field{ports}] (driver-read-only) Indicates the total number of
> +USB ports supported by the device.
> +\end{description}
> +
> +The \field{port} field used throughout the protocol is a zero-based
> +index in the range 0 to \field{ports} - 1, identifying a physical USB
> +controller port. The virtio device manages the mapping from port index
> +to physical USB connection internally; USB device addresses assigned
> +during enumeration are not visible in the virtio protocol.
> +
> +For the USB host role specifically, a physical USB controller port may
> +itself be a hub with one or more USB devices connected behind it. The
> +\field{vp_idx} field (see
> +\nameref{sec:Device Types / USB Device / Device Operation: Host role / Host Notifications}
> +and \nameref{sec:Device Types / USB Device / Device Operation: Data queues})
> +identifies the physical port in the range 0 to \field{ports} - 1, while
> +the \field{port_id}/\field{port} field in those same structures
> +identifies a specific leaf device behind that physical port (a direct
> +device, or a downstream port of a hub connected to it), rather than the
> +physical port itself.
> +
> +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / USB Device / Device configuration layout}
> +
> +\begin{itemize}
> +\item The device MUST set \field{ports} to a non-zero value.
> +\item The device MUST NOT set \field{ports} to a value greater than
> +  65535, as the port field in device-role command structures
> +  (virtio_usb_dev_cmd_hdr) and data queue request structures
> +  (virtio_usb_request) is 16 bits wide.
> +\end{itemize}
> +
> +\drivernormative{\subsubsection}{Device configuration layout}{Device Types / USB Device / Device configuration layout}
> +
> +\begin{itemize}
> +\item The driver MUST NOT write to the \field{ports} field.
> +\end{itemize}
> +
> +\subsection{Device Initialization}\label{sec:Device Types / USB Device / Device Initialization}
> +
> +\begin{enumerate}
> +\item The driver configures all queues.
> +\item The driver reads the \field{ports} field.
> +\item If VIRTIO_USB_F_ROLE_SWITCH has been negotiated, the driver sends
> +a control request to retrieve the current role of each available port.
> +\item The driver populates event queues with empty buffers based on
> +negotiated features:
> +
> +\begin{itemize}
> +\item The driver populates the USB host role event queue if
> +VIRTIO_USB_F_HOST has been negotiated.
> +\item The driver populates the USB device role event queue if
> +VIRTIO_USB_F_DEVICE has been negotiated.
> +\item The driver populates the role switch event queue if
> +VIRTIO_USB_F_ROLE_SWITCH has been negotiated.
> +\end{itemize}
> +
> +\end{enumerate}
> +
> +\drivernormative{\subsubsection}{Device Initialization}{Device Types / USB Device / Device Initialization}
> +
> +\begin{enumerate}
> +\item The driver MUST populate the USB host role event queue with empty
> +buffers of at least the size of struct virtio_usb_host_port_event if
> +VIRTIO_USB_F_HOST has been negotiated.

It is not virtio_usb_dev_bind_event bigger than virtio_usb_dev_event?

> +\item The driver MUST populate the USB device role event queue with
> +empty buffers of at least the size of struct virtio_usb_dev_event if
> +VIRTIO_USB_F_DEVICE has been negotiated.
> +\item The driver MUST populate the role switch event queue with empty
> +buffers of at least the size of struct virtio_usb_otg_event if
> +VIRTIO_USB_F_ROLE_SWITCH has been negotiated.
> +\item The driver MUST send VIRTIO_USB_CMD_OTG_GET_ROLE for each
> +available port if VIRTIO_USB_F_ROLE_SWITCH has been negotiated, before
> +using any role-dependent functionality.
> +\end{enumerate}
> +
> +\devicenormative{\subsubsection}{Device Initialization}{Device Types / USB Device / Device Initialization}
> +
> +\begin{itemize}
> +\item The device MUST present a valid, non-zero \field{ports} value
> +  in the configuration space before the driver completes initialization.
> +\end{itemize}
> +
> +\subsection{Device Operation: Data queues}\label{sec:Device Types / USB Device / Device Operation: Data queues}
> +
> +Data queues are used to exchange USB data between driver and the device.
> +For the USB host and the USB device roles, all data messages are placed
> +into  their respective role-specific data queues.
> +
> +They use the following common definitions:
> +
> +\begin{lstlisting}
> +enum {
> +	/* USB data transfer direction */
> +	VIRTIO_USB_DIR_OUT = 0,
> +	VIRTIO_USB_DIR_IN,
> +};
> +
> +enum {
> +	/* USB endpoint direction mask */
> +	VIRTIO_USB_EP_DIR_OUT = 0,
> +	VIRTIO_USB_EP_DIR_IN = 0x80,
> +};
> +
> +enum {
> +	/* USB endpoint transfer types; also used as bit positions
> +	 * in the virtio_usb_dev_ep_info.types capability bitmap */
> +	VIRTIO_USB_EP_CONTROL = 0,
> +	VIRTIO_USB_EP_INTERRUPT,
> +	VIRTIO_USB_EP_BULK,
> +	VIRTIO_USB_EP_ISOCHRONOUS,
> +};
> +
> +enum {
> +	/* USB endpoint data transfer flags */
> +	VIRTIO_USB_FLAG_SHORT_NOT_OK = (1 << 0),
> +	VIRTIO_USB_FLAG_ISO_ASAP = (1 << 1),
> +	VIRTIO_USB_FLAG_ZERO_PACKET = (1 << 2),
> +};
> +
> +enum {
> +	/* common status codes */
> +	VIRTIO_USB_S_OK = 0,
> +	VIRTIO_USB_S_ERR_BAD_MSG,
> +	VIRTIO_USB_S_ERR_INTERNAL,
> +	VIRTIO_USB_S_ERR_NO_DEVICE,
> +	VIRTIO_USB_S_ERR_ISO_XFER,
> +	VIRTIO_USB_S_ERR_ISO_BIG,
> +	VIRTIO_USB_S_ERR_DATA_IN,
> +	VIRTIO_USB_S_ERR_DATA_OUT,
> +	VIRTIO_USB_S_ERR_MSG_SIZE,
> +	VIRTIO_USB_S_ERR_OVERFLOW,
> +	VIRTIO_USB_S_ERR_STALL,
> +	VIRTIO_USB_S_ERR_SHORT_PKT,
> +	VIRTIO_USB_S_ERR_CANCELLED,
> +};
> +\end{lstlisting}
> +
> +A data message consists of a request part, a response part and
> +optionally a data buffer which can be either device readable or device
> +writable, based on the direction of USB data transfer.
> +
> +A request part has, or consists of, a header which uses the following
> +layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_request {
> +	le64 tag;
> +	le16 vp_idx; /* USB host role only, reserved otherwise */
> +	le16 port; /* Port ID */
> +	le16 endpoint; /* Endpoint ID */
> +	le16 transfer_type; /* VIRTIO_USB_EP_XXX */
> +	le16 transfer_flags; /* VIRTIO_USB_FLAG_XXX */
> +	le16 padding;
> +	union {
> +		/* transfer_type = VIRTIO_USB_EP_CONTROL */
> +		struct {
> +			u8 setup[8];
> +		} control;
> +		/* transfer_type = VIRTIO_USB_EP_INTERRUPT */
> +		struct {
> +			le32 interval;
> +		} interrupt;
> +		/* transfer_type = VIRTIO_USB_EP_BULK */
> +		struct {
> +			le32 stream_id;
> +		} bulk;
> +		/* transfer_type = VIRTIO_USB_EP_ISOCHRONOUS */
> +		struct {
> +			le32 interval;
> +			le32 start_frame;
> +			le32 number_of_packets;
> +			le32 padding;
> +		} iso;
> +	};
> +};
> +\end{lstlisting}
> +
> +The request header contains the following device-readable fields:
> +
> +\begin{description}
> +\item[\field{tag}] Specifies a unique identifier for the data request,
> +which can be used to cancel it later.
> +\item[\field{vp_idx}] On the USB host role data queue, specifies the
> +physical USB controller port (see
> +\nameref{sec:Device Types / USB Device / Device configuration layout}).
> +Reserved (and ignored by the device) on the USB device role data
> +queue.
> +\item[\field{port}] On the USB host role data queue, specifies the leaf
> +device within \field{vp_idx} that the data is destined for (see
> +\nameref{sec:Device Types / USB Device / Device Operation: Host role / Host Notifications}).
> +On the USB device role data queue, specifies the device ID (see
> +\nameref{sec:Device Types / USB Device / Device configuration layout}).
> +\item[\field{endpoint}] Specifies the endpoint address using the same
> +encoding as USB \field{bEndpointAddress} (USB 2.0
> +(\hyperref[intro:USB2]{USB2}) Table 9-13): bit 7 specifies direction
> +(VIRTIO_USB_EP_DIR_IN = 0x80, VIRTIO_USB_EP_DIR_OUT = 0x00) and
> +bits 3:0 specify the endpoint number (0--15). Bits 15:8 and 6:4
> +are reserved and MUST be set to 0.
> +\item[\field{transfer_type}] Specifies the type of data transfer:
> +
> +\begin{itemize}
> +\item VIRTIO_USB_EP_CONTROL - USB control transfer described in USB 2.0
> +specification (\hyperref[intro:USB2]{USB2}) Section 4.7.1 and Chapter 4.
> +\item VIRTIO_USB_EP_INTERRUPT - USB interrupt transfer described in USB
> +2.0 specification (\hyperref[intro:USB2]{USB2}) Section 4.7.3 and
> +Chapter 4.
> +\item VIRTIO_USB_EP_BULK -  USB bulk transfer described in USB 2.0
> +specification (\hyperref[intro:USB2]{USB2}) Section 4.7.2 and Chapter 4.
> +\item VIRTIO_USB_EP_ISOCHRONOUS - USB isochronous transfer described in
> +USB 2.0 specification (\hyperref[intro:USB2]{USB2}) Section 4.7.4 and
> +Chapter 4.
> +\end{itemize}
> +
> +\item[\field{transfer_flags}] Specifies the flags which could affect the USB data
> +transfer, which could be combination of below:
> +
> +\begin{itemize}
> +\item VIRTIO_USB_FLAG_SHORT_NOT_OK - USB short reads need to be
> +treated as errors.
> +\item VIRTIO_USB_FLAG_ISO_ASAP - Specific to VIRTIO_USB_EP_ISOCHRONOUS
> +transfer type and specifies to use the first expired slot in
> +ISO scheduling.
> +\item VIRTIO_USB_FLAG_ZERO_PACKET - Specific to
> +VIRTIO_USB_EP_ISOCHRONOUS transfer type with data transfer direction

Should not be VIRTIO_USB_EP_BULK rather than VIRTIO_USB_EP_ISOCHRONOUS?

> +VIRTIO_USB_DIR_OUT and specifies to finish the USB data transfer with a
> +short packet.
> +\end{itemize}
> +
> +\item[\field{setup}] Specifies setup packet used for
> +VIRTIO_USB_EP_CONTROL transfer_type for the USB host role, in the
> +raw USB wire format defined by USB 2.0
> +(\hyperref[intro:USB2]{USB2}) Table 9-2. The wValue, wIndex, and
> +wLength sub-fields are in little-endian byte order.
> +\item[\field{interval}] Specifies polling interval used for ISO and
> +interrupt endpoints for the USB host role.
> +\item[\field{stream_id}] Specifies stream ID for bulk stream transfer
> +(USB host role).
> +\item[\field{start_frame}] Specifies start frame for
> +VIRTIO_USB_EP_ISOCHRONOUS transfer_type for USB host role, using the
> +same frame number coordinate space as \field{frame_number} returned
> +by VIRTIO_USB_CMD_DEV_GET_FRAME_NUMBER.
> +\item[\field{number_of_packets}] Specifies number of ISO packets in the
> +data request for VIRTIO_USB_EP_ISOCHRONOUS transfer_type for the USB
> +host role.
> +\item[\field{padding}] Reserved. Must be set to 0.
> +\end{description}
> +
> +In the case of isochronous data transfers for the USB host role, the
> +request header is immediately followed by an array of
> +virtio_usb_iso_packet structures in the same buffer, where the number
> +of elements matches the value specified in the
> +\field{number_of_packets} field.
> +
> +virtio_usb_iso_packet has the following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_iso_packet {
> +	le32 offset;
> +	le32 length;
> +};
> +\end{lstlisting}
> +
> +The virtio_usb_iso_packet packet contains the following device-readable
> +fields:
> +
> +\begin{description}
> +\item[\field{offset}] Specifies offset within specified data buffer for
> +the packet.
> +\item[\field{length}] For VIRTIO_USB_DIR_OUT transfers, specifies the
> +number of bytes to send for this packet from the data buffer at the
> +given \field{offset}. For VIRTIO_USB_DIR_IN transfers, specifies the
> +maximum number of bytes that may be received into the buffer at the
> +given \field{offset}. The \field{actual_length} field in the
> +corresponding virtio_usb_iso_status entry indicates the actual bytes
> +transferred.
> +\end{description}
> +
> +The request part may be followed by an additional device-readable data
> +buffer for data transfer to a port in USB host role with data direction
> +VIRTIO_USB_DIR_OUT, or a port in USB device role with data direction
> +VIRTIO_USB_DIR_IN. For isochronous transfers, this data buffer is a
> +separate buffer placed after the iso_packet array.
> +
> +For VIRTIO_USB_EP_CONTROL transfers with VIRTIO_USB_DIR_IN, the data
> +buffer length MUST be at least the wLength value specified in the
> +\field{setup} packet. A device response shorter than wLength is a
> +short transfer and is governed by the VIRTIO_USB_FLAG_SHORT_NOT_OK
> +flag in the usual way.
> +
> +A response part has, or consists of, a common header containing the
> +following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_response {
> +	le32 status; /* VIRTIO_USB_S_XXX */
> +	le32 actual_length;
> +	le32 interval; /* type = VIRTIO_USB_EP_INTERRUPT/ISOCHRONOUS */
> +	le32 start_frame; /* type = VIRTIO_USB_EP_ISOCHRONOUS */
> +};
> +\end{lstlisting}
> +
> +The response contains the following device-writable fields:
> +\begin{description}
> +\item[\field{status}] Indicates status of transfer updated by the
> +device.
> +\item[\field{actual_length}] Indicates actual bytes of data transferred or
> +received.
> +\item[\field{interval}] Indicates the actual polling interval when
> +VIRTIO_USB_FLAG_ISO_ASAP \field{transfer_flags} is specified and
> +\field{transfer_type} is VIRTIO_USB_EP_ISOCHRONOUS in the data
> +request by the driver for USB host role. For
> +VIRTIO_USB_EP_INTERRUPT transfers, indicates the actual polling
> +interval used by the host controller.
> +\item[\field{start_frame}] Indicates the actual start frame when
> +VIRTIO_USB_FLAG_ISO_ASAP \field{transfer_flags} is specified and
> +\field{transfer_type} is VIRTIO_USB_EP_ISOCHRONOUS in the data
> +request by the driver for USB host role. Uses the same frame number
> +coordinate space as \field{frame_number}.
> +\end{description}
> +
> +In the case of isochronous data transfers for the USB host role, the
> +response header is immediately followed by an array of
> +virtio_usb_iso_status structures in the same buffer, where the number
> +of elements matches the value specified in the
> +\field{number_of_packets} field in the request header.
> +
> +virtio_usb_iso_status has the following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_iso_status {
> +	le32 status; /* VIRTIO_USB_S_XXX */
> +	le32 actual_length;
> +};
> +\end{lstlisting}
> +
> +The virtio_usb_iso_status contains the following device-writable fields:
> +
> +\begin{description}
> +\item[\field{status}] Indicates status of the iso packet transfer
> +(VIRTIO_USB_S_XXX).
> +\item[\field{actual_length}] Indicates actual length of data transmitted
> +or received for a specific iso packet.
> +\end{description}
> +
> +The response part may be followed by an additional device-writable data
> +buffer for VIRTIO_USB_DIR_IN data transfer for a port in USB host role,
> +or VIRTIO_USB_DIR_OUT transfer for a port in USB device role. For
> +isochronous transfers, this data buffer is a separate buffer placed
> +after the iso_status array.
> +
> +Note: for the USB device role, IN and OUT directions follow the USB
> +convention of naming endpoints relative to the USB host. A device-role
> +IN endpoint transmits data from the gadget to the USB host; the driver
> +provides the transmit data as a device-readable buffer. A device-role
> +OUT endpoint receives data from the USB host into the gadget; the
> +device writes the received data into a device-writable buffer. This is
> +the inverse of the host-role convention, where VIRTIO_USB_DIR_OUT means
> +the driver is sending and VIRTIO_USB_DIR_IN means the driver is
> +receiving.
> +
> +\paragraph{Status Codes}
> +
> +The following status codes are used by the device to indicate the
> +outcome of an operation. These codes may appear in response structures
> +such as virtio_usb_response and virtio_usb_iso_status,
> +and are applicable to both data transfers and command executions
> +throughout the Virtio USB specification.
> +
> +\begin{itemize}
> +\item VIRTIO_USB_S_OK - The operation completed successfully.
> +
> +\item VIRTIO_USB_S_ERR_BAD_MSG - The request contained invalid or
> +unsupported values. This can include:
> +
> +\begin{itemize}
> +\item Unsupported transfer type.
> +\item Invalid or unsupported periodic transfer interval.
> +\item Attempt to change interval for isochronous transfers.
> +\end{itemize}
> +
> +\item VIRTIO_USB_S_ERR_INTERNAL - An unspecified internal error occurred
> +within the device. This includes USB bus-level errors such as CRC
> +errors, bit-stuffing errors, and no-response timeouts.
> +\item VIRTIO_USB_S_ERR_NO_DEVICE - The USB device was removed or is no
> +longer available.
> +\item VIRTIO_USB_S_ERR_ISO_XFER - This error is specific to USB host
> +role data transfers. It indicates that the VIRTIO_USB_FLAG_ISO_ASAP
> +flag was not set in the request, and the specified \field{start_frame}
> +has already expired for all frames in which the isochronous packets were
> +to be scheduled.
> +\item VIRTIO_USB_S_ERR_ISO_BIG - This error is specific to USB host role
> +data transfers. It indicates that the host controller was unable to
> +schedule the requested number of isochronous packets.
> +\item VIRTIO_USB_S_ERR_DATA_IN - This error is specific to USB host role
> +data transfers. During a data transfer with direction VIRTIO_USB_DIR_IN,
> +the USB host controller received data from an endpoint faster than it
> +could be written to system.
> +\item VIRTIO_USB_S_ERR_DATA_OUT - This error is specific to USB host
> +role data transfers. During a data transfer with direction
> +VIRTIO_USB_DIR_OUT, the USB host controller could not retrieve data from
> +system memory fast enough to maintain the required USB data rate.
> +\item VIRTIO_USB_S_ERR_MSG_SIZE - The message size was invalid. This can
> +occur in the following cases:
> +
> +\begin{itemize}
> +\item The endpoint's maximum packet size is zero or not usable in the
> +current interface alternate setting.
> +\item An isochronous packet exceeds the endpoint's maximum packet size.
> +\item The requested data transfer length is too large.
> +\end{itemize}
> +
> +\item VIRTIO_USB_S_ERR_OVERFLOW - The amount of data returned by the
> +endpoint exceeded either the endpoint's maximum packet size or the
> +remaining buffer size.
> +\item VIRTIO_USB_S_ERR_STALL - The remote USB endpoint returned a STALL
> +handshake PID, indicating a protocol stall condition.
> +
> +\item VIRTIO_USB_S_ERR_SHORT_PKT - The data read from the endpoint did
> +not fill the specified buffer, and the VIRTIO_USB_FLAG_SHORT_NOT_OK
> +flag was set in the transfer flags.
> +\item VIRTIO_USB_S_ERR_CANCELLED - The request was cancelled before
> +completion.
> +\end{itemize}
> +
> +\drivernormative{\subsubsection}{Device Operation: Data queues}{Device Types / USB Device / Device Operation: Data queues}
> +
> +\begin{enumerate}
> +\item The driver MUST set unique \field{tag} for the request.
> +\item The driver MUST initialize the \field{padding} bytes to 0.
> +\item The driver MUST NOT set undefined \field{transfer_flags} and
> +\field{transfer_types}.
> +\end{enumerate}
> +
> +\devicenormative{\subsubsection}{Device Operation: Data queues}{Device Types / USB Device / Device Operation: Data queues}
> +
> +\begin{enumerate}
> +\item The device MAY complete data messages out of order.
> +\item The device MUST eventually complete all data requests that have
> +  not been cancelled.
> +\item If the \field{status} field in the virtio_usb_response is
> +VIRTIO_USB_S_OK, the device MUST set \field{actual_length} of
> +virtio_usb_response to actual bytes of data transferred or
> +received.
> +\item If the \field{status} field in the virtio_usb_iso_status is
> +VIRTIO_USB_S_OK for isochronous data responses for the host role,
> +the device MUST set \field{actual_length} of
> +virtio_usb_iso_status to actual bytes of data transferred or
> +received.
> +\end{enumerate}
> +
> +\subsection{Device Operation: Host role}\label{sec:Device Types / USB Device / Device Operation: Host role}
> +
> +All command messages for the USB host are placed into the host command
> +queue by the driver, and all notifications are placed into the host
> +event queue by the device.
> +
> +The virtio device executes USB transactions on the physical hardware
> +transparently. After receiving VIRTIO_USB_EVT_HOST_PORT_CONNECTED, the
> +driver enables the port and submits USB transfers via the host data
> +queue. Enumeration transfers (SET_ADDRESS, GET_DESCRIPTOR,
> +SET_CONFIGURATION) are submitted as VIRTIO_USB_EP_CONTROL requests on
> +the host data queue alongside all other control, bulk, interrupt, and
> +isochronous transfers. Port management operations such as port power
> +and port reset are managed locally by the driver and do not require
> +virtio commands.
> +
> +The following enumerations define the types of host commands, events,
> +and supported speeds:
> +
> +\begin{lstlisting}
> +enum {
> +	/* host command request types */
> +	VIRTIO_USB_CMD_HOST_CANCEL = 0,
> +};
> +
> +enum {
> +	/* host event types */
> +	VIRTIO_USB_EVT_HOST_PORT_CONNECTED = 0,
> +	VIRTIO_USB_EVT_HOST_PORT_DISCONNECTED,
> +};
> +
> +enum {
> +	/* supported USB speed values */
> +	VIRTIO_USB_SPEED_UNKNOWN = 0,    /* unknown speed */
> +	VIRTIO_USB_SPEED_LOW,            /* usb low speed */
> +	VIRTIO_USB_SPEED_FULL,           /* usb full speed */
> +	VIRTIO_USB_SPEED_HIGH,           /* usb high speed */
> +	VIRTIO_USB_SPEED_WIRELESS,       /* usb wireless (usb 2.5) speed */

Is this constant still in use?

> +	VIRTIO_USB_SPEED_SUPER,          /* usb super speed */
> +	VIRTIO_USB_SPEED_SUPER_PLUS,     /* usb super speed plus */
> +};
> +\end{lstlisting}
> +
> +\paragraph{Host notifications}
> +
> +Host notifications consist of a virtio_usb_host_port_event structure,
> +which use the following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_host_port_event {
> +	le32 code; /* VIRTIO_USB_EVT_HOST_PORT_XXX */
> +	le32 vp_idx;
> +	le32 port_id;

I think in other structures you use port instead of port_id for the same goal.

> +	le32 speed; /* VIRTIO_USB_SPEED_XXX */
> +};
> +\end{lstlisting}
> +
> +The virtio_usb_host_port_event structure has the following
> +device-writable fields:
> +
> +\begin{description}
> +\item[\field{code}] Indicates a host event type:
> +\begin{itemize}
> +\item VIRTIO_USB_EVT_HOST_PORT_CONNECTED - A USB device has been
> +connected to the host controller port.
> +\item VIRTIO_USB_EVT_HOST_PORT_DISCONNECTED - A USB device has been
> +disconnected from the host controller port.
> +\end{itemize}
> +\item[\field{vp_idx}] Indicates the physical USB controller port,
> +ranging from 0 to \field{ports} - 1 (see
> +\nameref{sec:Device Types / USB Device / Device configuration layout}).
> +\item[\field{port_id}] Indicates the leaf device within that physical
> +port that the event applies to: 0 for a direct device connected to the
> +physical port, or the downstream port number of a hub connected to the
> +physical port, for a device connected behind that hub.
> +\item[\field{speed}] Indicates speed of the connected USB device to the
> +host controller port (VIRTIO_USB_SPEED_XXX).
> +\end{description}
> +
> +\devicenormative{\subparagraph}{Host Notifications}{Device Types / USB Device / Device Operation: Host role / Host Notifications}
> +
> +\begin{itemize}
> +\item The device MUST NOT set undefined event code values.
> +\item The device MUST set the \field{speed} field to
> +  VIRTIO_USB_SPEED_UNKNOWN for
> +  VIRTIO_USB_EVT_HOST_PORT_DISCONNECTED events.
> +\end{itemize}
> +
> +\paragraph{Host commands}\label{sec:Device Types / USB Device / Device Operation: Host role / Host commands}
> +
> +Host commands consist of a request part and a response part.
> +
> +A request part has, or consists of, a common header which uses the
> +following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_host_cmd_hdr {
> +	le32 code; /* VIRTIO_USB_CMD_HOST_XXX */
> +	le32 port; /* Port ID */
> +};
> +\end{lstlisting}
> +
> +The request header contains the following device-readable fields:
> +
> +\begin{description}
> +\item[\field{code}] Specifies a host role command request type
> +(VIRTIO_USB_CMD_HOST_XXX).
> +\item[\field{port}] Specifies a destination port ID.
> +\end{description}
> +
> +A response part has, or consists of, a common header which uses the
> +following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_cmd_status {
> +	le32 code; /* VIRTIO_USB_S_XXX */
> +};
> +\end{lstlisting}
> +
> +The response header contains the following device-writable fields:
> +
> +\begin{description}
> +\item[\field{code}] Indicates the command status (VIRTIO_USB_S_XXX).
> +\end{description}
> +
> +\paragraph{Host Cancel command}
> +
> +A special command is used to cancel a previously submitted data
> +request on the host data queue.
> +
> +The request part uses the following structure definition:
> +
> +\begin{lstlisting}
> +struct virtio_usb_host_cmd_cancel {
> +	struct virtio_usb_host_cmd_hdr hdr; /* .code = VIRTIO_USB_CMD_HOST_CANCEL */
> +	le64 tag;
> +};
> +\end{lstlisting}
> +
> +The request contains the following device-readable fields:
> +
> +\begin{description}
> +\item[\field{hdr}] Specifies command header with command code and port ID.
> +\item[\field{tag}] Specifies the unique identifier of the data message to be
> +cancelled.
> +\end{description}
> +
> +The response consists of the virtio_usb_cmd_status structure indicating the
> +result of the cancellation attempt.
> +
> +\devicenormative{\subparagraph}{Host Cancel command}{Device Types / USB Device / Device Operation: Host role / Host Cancel command}
> +
> +If the data request for the specified \field{tag} is not completed
> +in the device, it MUST complete it with a virtio_usb_response
> +with \field{status} VIRTIO_USB_S_ERR_CANCELLED before or after
> +completing the cancel command.
> +If the data request for the specified \field{tag} is not found or has
> +already completed, the device MUST set the cancel response
> +\field{status} to VIRTIO_USB_S_OK.
> +
> +\drivernormative{\subsubsection}{Device Operation: Host role}{Device Types / USB Device / Device Operation: Host role}
> +
> +\begin{itemize}
> +\item The driver MUST NOT submit data requests on the host data queue
> +  for a port that has not received
> +  VIRTIO_USB_EVT_HOST_PORT_CONNECTED, or that has received
> +  VIRTIO_USB_EVT_HOST_PORT_DISCONNECTED.
> +\item For \field{transfer_type} VIRTIO_USB_EP_CONTROL, the driver MUST
> +  set the \field{setup} field to a valid 8-byte USB SETUP packet as
> +  defined in USB 2.0 (\hyperref[intro:USB2]{USB2}) Table 9-2.
> +\item For \field{transfer_type} VIRTIO_USB_EP_ISOCHRONOUS, the driver
> +  MUST set \field{number_of_packets} to match the number of
> +  virtio_usb_iso_packet entries in the request.
> +\end{itemize}
> +
> +\subsection{Device Operation: Device role}\label{sec:Device Types / USB Device / Device Operation: Device role}
> +
> +In this version of the specification, a device role UDC is
> +virtualized as a whole: each virtio-usb device role UDC is exposed to
> +and owned by a single guest. Sharing a single physical UDC across
> +multiple guests - where each guest owns a distinct function of a
> +composite gadget hosted on that UDC - is a separate approach
> +currently being explored, and is out of scope for this
> +specification.
> +
> +All command messages are placed into the device command queue by the
> +driver and all notifications are placed into the device event queue by
> +the device. The following enumeration definitions define the types of
> +device commands and events.
> +
> +\begin{lstlisting}
> +enum {
> +	/* device command types */
> +	VIRTIO_USB_CMD_DEV_GET_ENDPOINT_COUNT = 0,
> +	VIRTIO_USB_CMD_DEV_GET_ENDPOINT_INFO,
> +	VIRTIO_USB_CMD_DEV_PULLUP,
> +	VIRTIO_USB_CMD_DEV_VBUS_DRAW,
> +	VIRTIO_USB_CMD_DEV_EP_ENABLE,
> +	VIRTIO_USB_CMD_DEV_EP_DISABLE,
> +	VIRTIO_USB_CMD_DEV_EP_SET_HALT,
> +	VIRTIO_USB_CMD_DEV_EP_SET_WEDGE,
> +	VIRTIO_USB_CMD_DEV_CANCEL,
> +	VIRTIO_USB_CMD_DEV_GET_FRAME_NUMBER,
> +	VIRTIO_USB_CMD_DEV_SET_SELF_POWERED,
> +};
> +
> +enum {
> +	/* device event types */
> +	VIRTIO_USB_EVT_DEV_BIND = 0,
> +	VIRTIO_USB_EVT_DEV_DISCONNECTED,
> +	VIRTIO_USB_EVT_DEV_SETUP,
> +	VIRTIO_USB_EVT_DEV_RESET,
> +	VIRTIO_USB_EVT_DEV_SUSPEND,
> +	VIRTIO_USB_EVT_DEV_RESUME,
> +	VIRTIO_USB_EVT_DEV_UNBIND,
> +};
> +\end{lstlisting}
> +
> +\paragraph{Device notifications}
> +
> +Generic device notifications consist of a virtio_usb_dev_event
> +structure, which use the following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_dev_event {
> +	le32 code; /* VIRTIO_USB_EVT_DEV_XXX */
> +	le16 port; /* Device ID */
> +	u8 padding[10];
> +};
> +\end{lstlisting}
> +
> +virtio_usb_dev_event structure, which has the following
> +device-writable fields:
> +
> +\begin{description}
> +\item[\field{code}] Indicates the USB device role event type:
> +\begin{itemize}
> +\item VIRTIO_USB_EVT_DEV_DISCONNECTED - The USB gadget got disconnected.
> +\item VIRTIO_USB_EVT_DEV_SETUP - A USB SETUP packet has been received
> +(see \nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Setup event}).
> +\item VIRTIO_USB_EVT_DEV_RESET - The USB bus has reset.
> +\item VIRTIO_USB_EVT_DEV_SUSPEND - The USB gadget has suspended by the
> +USB host.

Use `has been suspended`.

> +\item VIRTIO_USB_EVT_DEV_RESUME - The USB gadget has been resumed by the
> +USB host.
> +\item VIRTIO_USB_EVT_DEV_UNBIND - The USB gadget is unbound from the USB
> +device controller (see
> +\nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Bind and Unbind events}).
> +\end{itemize}
> +\item[\field{port}] Indicates the device ID that the event applies to.
> +\end{description}
> +
> +\devicenormative{\subparagraph}{Device events}{Device Types / USB Device / Device Operation: Device role / Device events}
> +
> +\begin{itemize}
> +\item The device MUST NOT set undefined event code values.
> +\item The device MUST initialize the \field{padding} bytes to 0.
> +\end{itemize}
> +
> +\paragraph{Device Bind and Unbind events}\label{sec:Device Types / USB Device / Device Operation: Device role / Device Bind and Unbind events}
> +
> +VIRTIO_USB_EVT_DEV_BIND indicates that the USB gadget is to be bound to
> +the USB device controller, and is the first event a driver receives
> +for a device role port. VIRTIO_USB_EVT_DEV_UNBIND indicates that the
> +USB gadget is to be unbound from the USB device controller, and is the
> +last event a driver receives for a device role port before it can be
> +rebound with a subsequent VIRTIO_USB_EVT_DEV_BIND event.
> +
> +A special event notification virtio_usb_dev_bind_event, is sent to the
> +USB device role event queue for VIRTIO_USB_EVT_DEV_BIND, using the
> +following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_dev_bind_event {
> +	le32 code; /* VIRTIO_USB_EVT_DEV_BIND */
> +	le16 port; /* Device ID */
> +	u8 max_speed; /* VIRTIO_USB_SPEED_XXX */
> +	u8 udc_name_prefix[64];
> +};
> +\end{lstlisting}
> +
> +virtio_usb_dev_bind_event has the following device-writable fields:
> +
> +\begin{description}
> +\item[\field{code}] Indicates the USB device event type
> +(VIRTIO_USB_EVT_DEV_BIND).
> +\item[\field{port}] Indicates the device ID that the event applies to.
> +\item[\field{max_speed}] Indicates the maximum USB speed
> +(VIRTIO_USB_SPEED_XXX) that the device role port is capable of
> +operating at.
> +\item[\field{udc_name_prefix}] A NUL-terminated string used by the
> +driver as a prefix when naming the guest-side UDC device instance
> +associated with this port. An empty string (a first byte of 0)
> +indicates that the driver should choose a default name.
> +\end{description}
> +
> +\devicenormative{\subparagraph}{Device Bind and Unbind events}{Device Types / USB Device / Device Operation: Device role / Device Bind and Unbind events}
> +
> +\begin{itemize}
> +\item The device MUST NOT set \field{max_speed} to a value other than
> +VIRTIO_USB_SPEED_LOW, VIRTIO_USB_SPEED_FULL, VIRTIO_USB_SPEED_HIGH,
> +VIRTIO_USB_SPEED_SUPER, or VIRTIO_USB_SPEED_SUPER_PLUS.
> +\item The device MUST NUL-terminate \field{udc_name_prefix}, including
> +when it is empty.
> +\end{itemize}
> +
> +\drivernormative{\subparagraph}{Device Bind and Unbind events}{Device Types / USB Device / Device Operation: Device role / Device Bind and Unbind events}
> +
> +\begin{itemize}
> +\item The driver MUST NOT send device role commands for a port before
> +receiving a VIRTIO_USB_EVT_DEV_BIND event for that port, or after
> +receiving a VIRTIO_USB_EVT_DEV_UNBIND event for that port, until a
> +subsequent VIRTIO_USB_EVT_DEV_BIND event is received.
> +\end{itemize}
> +
> +\paragraph{VIRTIO_USB_EVT_DEV_SETUP}
> +
> +A special event notification virtio_usb_dev_setup_event, is sent to the
> +USB device role event queue when a USB SETUP event is received for a USB
> +device controller port.
> +
> +For SET_ADDRESS requests (bRequest = 5), the virtio device programs the
> +USB device controller address transparently. The driver completes the
> +status stage by sending a zero-length data message for Endpoint 0, as
> +required for all zero-wLength SETUP requests.
> +
> +virtio_usb_dev_setup_event has the following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_dev_setup_event {
> +	le32 code; /* VIRTIO_USB_EVT_DEV_SETUP */
> +	le16 port; /* Device ID */
> +	u8 setup[8]; /* setup packet contents */
> +	u8 padding[2];
> +};
> +\end{lstlisting}
> +
> +virtio_usb_dev_setup_event has following device-writable fields:
> +
> +\begin{description}
> +\item[\field{code}] Indicates the USB device event type
> +(VIRTIO_USB_EVT_DEV_SETUP).
> +\item[\field{port}] Indicates the device ID that the event applies to.
> +\item[\field{setup}] Contains the setup packet in the raw USB wire
> +format defined by USB 2.0 (\hyperref[intro:USB2]{USB2}) Table 9-2.
> +The wValue, wIndex, and wLength sub-fields are in little-endian byte
> +order.
> +\end{description}
> +
> +\drivernormative{\subparagraph}{Device Setup event}{Device Types / USB Device / Device Operation: Device role / Device Setup event}
> +
> +\begin{itemize}
> +\item If the setup event is processed successfully, the driver MUST send
> +a data message on the USB device role data queue for the endpoint zero.
> +\item If an error occurs, the driver MUST send a
> +VIRTIO_USB_CMD_DEV_EP_SET_HALT command for endpoint zero to the USB
> +device role command queue.
> +\end{itemize}
> +
> +\devicenormative{\subparagraph}{Device Setup event}{Device Types / USB Device / Device Operation: Device role / Device Setup event}
> +
> +\begin{itemize}
> +\item The device MUST NOT set undefined event code values.
> +\item The device MUST initialize the \field{padding} bytes to 0.
> +\end{itemize}
> +
> +\paragraph{Device Commands}\label{sec:Device Types / USB Device / Device Operation: Device role / Device Commands}
> +
> +A device command request has, or consists of, a common header with the
> +following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_dev_cmd_hdr {
> +	le32 code; /* VIRTIO_USB_CMD_DEV_XXX */
> +	le16 port; /* Port ID */
> +	le16 endpoint; /* Endpoint ID */
> +};
> +\end{lstlisting}
> +
> +The request contains the following device-readable fields:
> +
> +\begin{description}
> +
> +\item[\field{code}]
> +Specifies a USB device role command type (VIRTIO_USB_CMD_DEV_XXX).
> +
> +\item[\field{port}]
> +Specifies the destination port ID.
> +
> +\item[\field{endpoint}]
> +Specifies the target endpoint ID.
> +\end{description}
> +
> +Device role commands fall into two categories:
> +
> +\begin{enumerate}
> +
> +\item Endpoint management commands - These commands are essential for
> +managing USB endpoints.
> +
> +\begin{itemize}
> +\item VIRTIO_USB_CMD_DEV_GET_ENDPOINT_COUNT - Retrieves the number of
> +available USB device controller endpoints.
> +\item VIRTIO_USB_CMD_DEV_GET_ENDPOINT_INFO - Provides detailed
> +information about the endpoints.
> +\item VIRTIO_USB_CMD_DEV_EP_ENABLE - Enables a specified endpoint.
> +\item VIRTIO_USB_CMD_DEV_EP_DISABLE - Disables a specified endpoint.
> +\item VIRTIO_USB_CMD_DEV_EP_SET_HALT - Sets or clears a halt condition on
> +a specific endpoint.
> +\item VIRTIO_USB_CMD_DEV_EP_SET_WEDGE - Wedges an endpoint, preventing
> +further data transfers until the condition is cleared.
> +\end{itemize}
> +
> +\item Device Control Commands - Commands which are needed for managing
> +USB device role functionality.
> +
> +\begin{itemize}
> +\item VIRTIO_USB_CMD_DEV_PULLUP -  Controls the pull-up resistor on the
> +USB device controller.
> +\item VIRTIO_USB_CMD_DEV_GET_FRAME_NUMBER - Retrieves the current frame
> +number from the USB device controller.
> +\item VIRTIO_USB_CMD_DEV_VBUS_DRAW - Sets the amount of current the USB
> +device will draw from the USB bus.
> +\item VIRTIO_USB_CMD_DEV_SET_SELF_POWERED - Configures the USB device
> +controller as self-powered or bus-powered.
> +\item VIRTIO_USB_CMD_DEV_CANCEL - Cancels a previously submitted data
> +request.
> +\end{itemize}
> +\end{enumerate}
> +
> +Device commands which set a value use the following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_dev_cmd_set_value {
> +	struct virtio_usb_dev_cmd_hdr hdr;
> +	le32 value;
> +	le32 padding;
> +};
> +\end{lstlisting}
> +
> +The request contains the following device-readable fields:
> +
> +\begin{description}
> +\item[\field{hdr}] Specifies the command header with command code, port
> +ID and endpoint ID.
> +\item[\field{value}] Specifies value specific to the command.
> +\end{description}
> +
> +\drivernormative{\subparagraph}{Device Commands}{Device Types / USB Device / Device Operation: Device role / Device Commands}
> +
> +The driver MUST initialize the \field{padding} bytes to 0.
> +
> +\paragraph{VIRTIO_USB_CMD_DEV_GET_ENDPOINT_COUNT}
> +
> +This command queries the number of endpoints supported by the USB device
> +controller.
> +
> +The request consists of virtio_usb_dev_cmd_hdr structure. The response
> +consists of the virtio_usb_dev_ep_count with the following layout
> +structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_dev_ep_count {
> +	struct virtio_usb_cmd_status status;
> +	le32 count;
> +};
> +\end{lstlisting}
> +
> +The structure contains the following device-writable fields:
> +
> +\begin{description}
> +\item[\field{status}] Indicates the status of the operation.
> +\item[\field{count}] Indicates the total number of endpoints available
> +on the USB device controller.
> +\end{description}
> +
> +\drivernormative{\subparagraph}{Get Endpoint Count}{Device Types / USB Device / Device Operation: Device role / Get Endpoint Count}
> +
> +The driver MUST NOT send this command before receiving a
> +VIRTIO_USB_EVT_DEV_BIND event from the device role event queue, if
> +only USB device role is supported.
> +
> +\paragraph{VIRTIO_USB_CMD_DEV_GET_ENDPOINT_INFO}
> +
> +This command queries detailed information about the available endpoints
> +supported by the USB device controller.
> +
> +The request consists of virtio_usb_dev_cmd_hdr structure.
> +(see \nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Commands}).
> +
> +The response consists of virtio_usb_cmd_status followed by an array of
> +virtio_usb_dev_ep_info structures. The array contains exactly N
> +elements, where N is the value of the \field{count} field returned by
> +the most recent successful VIRTIO_USB_CMD_DEV_GET_ENDPOINT_COUNT
> +command.
> +
> +virtio_usb_dev_ep_info has the following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_dev_ep_info {
> +	le16 types; /* supported type bit map (1 << VIRTIO_USB_EP_XXX) */
> +	le16 directions; /* supported direction bit map (1 << VIRTIO_USB_DIR_XXX) */
> +	le16 maxpacket_limit;
> +	le16 max_streams;
> +	u8 name[16];
> +};
> +\end{lstlisting}
> +The structure contains the following device-writable fields:
> +
> +\begin{description}
> +\item[\field{types}] Indicates a bit map representing the supported
> +endpoint types. Each bit corresponds to a specific endpoint type,
> +defined by VIRTIO_USB_EP_XXX. These use the same values as the
> +\field{transfer_type} field in virtio_usb_request, as USB endpoint
> +type and transfer type are equivalent (USB 2.0
> +(\hyperref[intro:USB2]{USB2}) Table 9-13, \field{bmAttributes[1:0]}).
> +\item[\field{directions}] Indicates a bit map representing the supported
> +data transfer directions. Each bit corresponds to a specific direction,
> +defined by VIRTIO_USB_DIR_XXX.
> +\item[\field{maxpacket_limit}] Indicates the maximum packet size that
> +the endpoint can handle.
> +\item[\field{max_streams}] Indicates the maximum number of streams that
> +the endpoint can support.
> +\item[\field{name}] Indicates the human-readable name of the USB device
> +controller endpoint.
> +\end{description}
> +
> +\drivernormative{\subparagraph}{Get Endpoint Info}{Device Types / USB Device / Device Operation: Device role / Get Endpoint Info}
> +
> +The driver MUST NOT send this command before getting the available
> +number of endpoints using VIRTIO_USB_CMD_DEV_GET_ENDPOINT_COUNT command.
> +
> +\devicenormative{\subparagraph}{Get Endpoint Info}{Device Types / USB Device / Device Operation: Device role / Get Endpoint Info}
> +
> +\begin{itemize}
> +\item The device MUST NOT set undefined values in \field{types} or
> +  \field{directions}.
> +\item The device MUST return exactly \field{count} virtio_usb_dev_ep_info
> +  entries in the response, where \field{count} is the value from the
> +  most recent successful VIRTIO_USB_CMD_DEV_GET_ENDPOINT_COUNT response
> +  for the same port.
> +\end{itemize}
> +
> +\paragraph{VIRTIO_USB_CMD_DEV_PULLUP}
> +
> +This command enables or disables data line pullup on the USB device
> +controller. The request consists of virtio_usb_dev_cmd_set_value
> +structure
> +(see \nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Commands}).
> +The \field{value} field specifies whether to enable or disable the pullup.
> +
> +The response consists of virtio_usb_cmd_status structure indicating the result.
> +
> +\devicenormative{\subparagraph}{PULLUP command}{Device Types / USB Device / Device Operation: Device role / PULLUP command}
> +
> +\begin{itemize}
> +\item When \field{value} is non-zero, the device MUST assert the USB
> +  data line pullup, making the device visible on the bus.
> +\item When \field{value} is zero, the device MUST deassert the pullup,
> +  disconnecting the device from the bus.
> +\end{itemize}
> +
> +\paragraph{VIRTIO_USB_CMD_DEV_VBUS_DRAW}
> +
> +Sets the amount of current the USB device will draw from the USB bus.
> +The request consists of virtio_usb_dev_cmd_set_value structure
> +(see \nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Commands}).
> +The \field{value} field specifies the current draw in milliamperes.
> +
> +The response consists of virtio_usb_cmd_status structure indicating the
> +result.
> +
> +\devicenormative{\subparagraph}{VBUS Draw command}{Device Types / USB Device / Device Operation: Device role / VBUS Draw command}
> +
> +\begin{itemize}
> +\item The device MUST configure the USB device controller to draw no
> +  more than \field{value} milliamperes from VBUS.
> +\end{itemize}
> +
> +\paragraph{VIRTIO_USB_CMD_DEV_SET_SELF_POWERED}
> +
> +Configures the USB device to indicate it as self-powered or bus-powered.
> +The request consists of virtio_usb_dev_cmd_set_value structure
> +(see \nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Commands}).
> +
> +The \field{value} field specifies the power source:
> +\begin{itemize}
> +\item A non-zero value indicates that the USB device is self-powered.
> +\item A value of zero indicates that the USB device is bus-powered.
> +\end{itemize}
> +
> +The response consists of virtio_usb_cmd_status structure indicating the
> +result.
> +
> +\devicenormative{\subparagraph}{Set Self Powered command}{Device Types / USB Device / Device Operation: Device role / Set Self Powered command}
> +
> +\begin{itemize}
> +\item When \field{value} is non-zero, the device MUST report self-powered
> +  status in the USB GET\_STATUS response.
> +\item When \field{value} is zero, the device MUST report bus-powered
> +  status in the USB GET\_STATUS response.
> +\end{itemize}
> +
> +\paragraph{VIRTIO_USB_CMD_DEV_GET_FRAME_NUMBER}
> +
> +Retrieves the current frame number from the USB device controller.
> +The request consists of virtio_usb_dev_cmd_hdr structure.
> +(see \nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Commands})
> +
> +The response consists of virtio_usb_dev_frame_number which has
> +following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_dev_frame_number {
> +	struct virtio_usb_cmd_status status;
> +	le32 frame_number;
> +};
> +\end{lstlisting}
> +
> +The structure contains the following device-writable fields:
> +
> +\begin{description}
> +\item[\field{status}] Indicates the result of the operation.
> +\item[\field{frame_number}] Indicates the current USB SOF frame number
> +as reported by the USB device controller, using an 11-bit counter
> +(0--2047) that wraps to 0 after reaching 2047.
> +\end{description}
> +
> +\devicenormative{\subparagraph}{Device Get Frame number command}{Device Types / USB Device / Device Operation: Device role / Device Get Frame number command}
> +
> +If the \field{code} of \field{status} field in the
> +virtio_usb_dev_frame_number is VIRTIO_USB_S_OK, the device MUST
> +set \field{frame_number} of virtio_usb_dev_frame_number to
> +current frame number reported by the USB device controller.
> +
> +\paragraph{VIRTIO_USB_CMD_DEV_CANCEL}
> +
> +A special command message is used to cancel a data request which has
> +been sent through the device role data queue.
> +
> +The request part uses the following structure definition:
> +
> +\begin{lstlisting}
> +struct virtio_usb_dev_cmd_cancel {
> +	struct virtio_usb_dev_cmd_hdr hdr; /* .code = VIRTIO_USB_CMD_DEV_CANCEL */
> +	le64 tag;
> +};
> +\end{lstlisting}
> +
> +The request contains the following device-readable fields:
> +
> +\begin{description}
> +\item[\field{hdr}] Specifies the command header with command code, port
> +ID and endpoint ID.
> +\item[\field{tag}] Specifies the unique identifier of the data message
> +to be cancelled.
> +\end{description}
> +
> +The response consists of the virtio_usb_cmd_status structure, which
> +includes the status code indicating the result of the cancellation
> +attempt, success is indicated by VIRTIO_USB_S_OK, and specific error
> +code in case of error.
> +
> +\devicenormative{\subparagraph}{Device Cancel command}{Device Types / USB Device / Device Operation: Device role / Device Cancel command}
> +
> +If the data request for the specified \field{tag} has not yet completed
> +in the device, the device MUST complete it with returning data response
> +virtio_usb_response with field \field{status} set to
> +VIRTIO_USB_S_ERR_CANCELLED, before completing the cancel command.
> +If the data request for the specified \field{tag} is not found or has
> +already completed, the device MUST set the cancel response
> +\field{status} to VIRTIO_USB_S_OK.
> +
> +
> +\paragraph{VIRTIO_USB_CMD_DEV_EP_ENABLE}
> +
> +Enables a specific endpoint in the USB device controller.
> +
> +The request consists of virtio_usb_dev_cmd_hdr followed by the USB
> +endpoint descriptor as defined in USB 2.0
> +(\hyperref[intro:USB2]{USB2}) Table 9-13.
> +
> +The response consists of virtio_usb_cmd_status structure indicating the
> +result of the command.
> +
> +\paragraph{VIRTIO_USB_CMD_DEV_EP_DISABLE}
> +
> +Disables a specific endpoint in the USB device controller.
> +
> +The request consists of virtio_usb_dev_cmd_hdr structure, which
> +identifies the target port and endpoint to be disabled.
> +
> +The response consists of virtio_usb_cmd_status structure, which indicates
> +the result of the command execution.
> +
> +\devicenormative{\subparagraph}{Endpoint Disable}{Device Types / USB Device / Device Operation: Device role / Endpoint Disable}
> +
> +The device MUST complete all pending data messages for the specified
> +endpoint before completing this command.
> +
> +\paragraph{VIRTIO_USB_CMD_DEV_EP_SET_HALT}
> +
> +Sets or clear a halt condition on a specific endpoint in the USB device

Use `clears`.

> +controller. The request consists of virtio_usb_dev_cmd_set_value
> +structure
> +(see \nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Commands}).
> +
> +The response consists of virtio_usb_cmd_status structure, which indicates
> +the result of the command execution.
> +
> +\devicenormative{\subparagraph}{Endpoint Set Halt command}{Device Types / USB Device / Device Operation: Device role / Endpoint Set Halt command}
> +
> +\begin{itemize}
> +\item When \field{value} is non-zero, the device MUST set a STALL
> +  condition on the specified endpoint.
> +\item When \field{value} is zero, the device MUST clear the STALL
> +  condition on the specified endpoint.
> +\item The device MUST return VIRTIO_USB_S_ERR_BAD_MSG for isochronous
> +  endpoints.
> +\end{itemize}
> +
> +\paragraph{VIRTIO_USB_CMD_DEV_EP_SET_WEDGE}
> +
> +This command sets the wedge condition on a specific endpoint of the USB
> +device controller. The request consists of virtio_usb_dev_cmd_hdr
> +structure, which identifies the target port and endpoint to be disabled.

I think this last sentence may be a repetition of from
VIRTIO_USB_CMD_DEV_EP_DISABLE.

> +
> +The response consists of virtio_usb_cmd_status structure, which
> +indicates the result of the command execution.
> +
> +\devicenormative{\subparagraph}{Endpoint Set Wedge command}{Device Types / USB Device / Device Operation: Device role / Endpoint Set Wedge command}
> +
> +\begin{itemize}
> +\item The device MUST set a persistent STALL condition on the endpoint
> +  that is not cleared by a ClearFeature(HALT) request from the USB host.
> +\item The device MUST return VIRTIO_USB_S_ERR_BAD_MSG for isochronous
> +  endpoints.
> +\end{itemize}
> +
> +\subsection{Device Operation: Role switch}\label{sec:Device Types / USB Device / Device Operation: Role switch}
> +
> +USB OTG (On-The-Go) is an extension of the USB standard that allows a device to
> +act either as a USB host or as a USB peripheral. The role is determined by the
> +driver using command messages. In turn, if the device changes its role, it
> +notifies the driver through notifications.
> +
> +Throughout this section, "role-switch" and "OTG" are used
> +interchangeably. The virtqueues commandq(role-switch) and
> +eventq(role-switch) carry these operations; their protocol constants
> +use the VIRTIO_USB_CMD_OTG_* and VIRTIO_USB_EVT_OTG_* prefixes.
> +
> +All command messages are placed into the role-switch command queue by the
> +driver and all notifications are placed into the role-switch event queue by
> +the device. The following enumeration definitions define the types of
> +device commands and events.
> +
> +\begin{lstlisting}
> +enum {
> +	/* OTG command message types */
> +	VIRTIO_USB_CMD_OTG_GET_ROLE = 0,
> +	VIRTIO_USB_CMD_OTG_SWITCH_ROLE,
> +};
> +
> +enum {
> +	/* USB roles */
> +	VIRTIO_USB_ROLE_HOST = 0,
> +	VIRTIO_USB_ROLE_DEVICE,
> +};
> +
> +enum {
> +	/* OTG Event Messages */
> +	VIRTIO_USB_EVT_OTG_CHANGE_ROLE = 0,
> +};
> +\end{lstlisting}
> +
> +\paragraph{Role switch commands}
> +
> +Both Role switch commands use the following common request header:
> +
> +\begin{lstlisting}
> +struct virtio_usb_otg_cmd_hdr {
> +	le32 code; /* VIRTIO_USB_CMD_OTG_XXX */
> +	le32 port; /* Port ID */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{code}] Specifies an OTG command message type
> +(VIRTIO_USB_CMD_OTG_XXX_ROLE).
> +\item[\field{port}] Specifies a destination port ID.
> +\end{description}
> +
> +\subparagraph{VIRTIO_USB_CMD_OTG_GET_ROLE}
> +
> +This command queries the current USB role enabled in USB controller.
> +
> +The request consists of virtio_usb_otg_cmd_hdr.
> +
> +The response from the device uses the following layout structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_otg_cmd_role {
> +	struct virtio_usb_cmd_status status;
> +	le32 role; /* VIRTIO_USB_ROLE_XXX */
> +	le32 supported_role; /* supported roles bitmask (VIRTIO_USB_F_XXX) */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +\item[\field{status}] See the virtio_usb_cmd_status type description in
> +  \nameref{sec:Device Types / USB Device / Device Operation: Host role / Host commands}.
> +\item[\field{role}] USB role: USB device or USB Host (VIRTIO_USB_ROLE_XXX).
> +\item[\field{supported_role}] Bitmask indicating the roles supported by the
> +  port, using the same bit positions as \field{VIRTIO_USB_F_HOST},
> +  \field{VIRTIO_USB_F_DEVICE}, and \field{VIRTIO_USB_F_ROLE_SWITCH}.
> +\end{description}
> +
> +\drivernormative{\subparagraph}{Get Role command}{Device Types / USB Device / Device Operation: Role switch / Get Role command}
> +
> +\begin{itemize}
> +\item The driver MUST set the \field{code} field to VIRTIO_USB_CMD_OTG_GET_ROLE.
> +\end{itemize}
> +
> +\devicenormative{\subparagraph}{Get Role command}{Device Types / USB Device / Device Operation: Role switch / Get Role command}
> +
> +\begin{itemize}
> +\item If the request is successfully executed, the device MUST set the \field{status}
> +  field to VIRTIO_USB_S_OK and MUST set the \field{role} field to
> +  VIRTIO_USB_ROLE_HOST or VIRTIO_USB_ROLE_DEVICE.
> +\item If the request fails, the device MUST set the \field{status} field to a
> +  corresponding error code. The driver MUST ignore the \field{role} field

I think this is driver normative.

> +  when \field{status} is not VIRTIO_USB_S_OK.
> +\end{itemize}
> +
> +\subparagraph{VIRTIO_USB_CMD_OTG_SWITCH_ROLE}
> +
> +This command toggles the current USB role of the specified port. If the
> +port is currently in the USB Host role, the device switches it to the USB
> +Device role, and vice versa.
> +
> +The request consists of virtio_usb_otg_cmd_hdr.
> +
> +This command carries no response payload. The device notifies the driver of
> +the completed role change via VIRTIO_USB_EVT_OTG_CHANGE_ROLE on the role
> +switch event queue.
> +
> +\drivernormative{\subparagraph}{Switch Role command}{Device Types / USB Device / Device Operation: Role switch / Switch Role command}
> +
> +\begin{itemize}
> +\item The driver MUST set the \field{code} field to VIRTIO_USB_CMD_OTG_SWITCH_ROLE.
> +\item The driver SHOULD complete or cancel all outstanding transfers on the
> +  current role's data queue before issuing this command.
> +\end{itemize}
> +
> +\devicenormative{\subparagraph}{Switch Role command}{Device Types / USB Device / Device Operation: Role switch / Switch Role command}
> +
> +\begin{itemize}
> +\item If the role switch is successful, the device MUST send
> +  VIRTIO_USB_EVT_OTG_CHANGE_ROLE on the role switch event queue.
> +\item The device MUST NOT send VIRTIO_USB_EVT_OTG_CHANGE_ROLE if the role
> +  switch fails.

This may require the driver to implement some sort of timeout I guess.

> +\end{itemize}
> +
> +\paragraph{Role switch events}
> +
> +The device notifies the driver about role switching events via corresponding
> +virtio queue using the following structure:
> +
> +\begin{lstlisting}
> +struct virtio_usb_otg_event {
> +	le32 code; /* VIRTIO_USB_EVT_OTG_XXX */
> +	le32 port; /* Port ID */
> +};
> +\end{lstlisting}
> +
> +\begin{description}
> +  \item[\field{code}] Specifies an USB role switch event type
> +    (VIRTIO_USB_EVT_OTG_XXX)
> +\item[\field{port}] Indicates the port ID for which the role switch
> +  event occurred.
> +\end{description}
> +
> +\subparagraph{VIRTIO_USB_EVT_OTG_CHANGE_ROLE}
> +
> +The device notifies the driver about a role-switching event by sending a
> +message with the virtio_usb_otg_event structure, with the code field set to
> +VIRTIO_USB_EVT_OTG_CHANGE_ROLE.
> +
> +\devicenormative{\subparagraph}{Role switch events}{Device Types / USB Device / Device Operation: Role switch / Role switch events}
> +
> +\begin{itemize}
> +\item The device MUST NOT set undefined event code values.
> +\item The device MUST send VIRTIO_USB_EVT_OTG_CHANGE_ROLE whenever the
> +  role of a port changes, whether triggered by
> +  VIRTIO_USB_CMD_OTG_SWITCH_ROLE or autonomously.
> +\end{itemize}
> diff --git a/device-types/usb/device-conformance.tex b/device-types/usb/device-conformance.tex
> new file mode 100644
> index 0000000..23d12d6
> --- /dev/null
> +++ b/device-types/usb/device-conformance.tex
> @@ -0,0 +1,26 @@
> +\conformance{\subsection}{USB Device Conformance}\label{sec:Conformance / Device Conformance / USB Device Conformance}
> +
> +A USB device MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{devicenormative:Device Types / USB Device / Device configuration layout}
> +\item \ref{devicenormative:Device Types / USB Device / Device Initialization}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Data queues}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Host role / Host Notifications}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Host role / Host Cancel command}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Device events}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Device Setup event}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Get Endpoint Info}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Device Get Frame number command}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Device Cancel command}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Endpoint Disable}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / PULLUP command}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / VBUS Draw command}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Set Self Powered command}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Endpoint Set Halt command}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Endpoint Set Wedge command}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Role switch / Get Role command}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Role switch / Switch Role command}
> +\item \ref{devicenormative:Device Types / USB Device / Device Operation: Role switch / Role switch events}
> +\end{itemize}
> +

I think there are some devices normatives missing in this list.

> diff --git a/device-types/usb/driver-conformance.tex b/device-types/usb/driver-conformance.tex
> new file mode 100644
> index 0000000..3417520
> --- /dev/null
> +++ b/device-types/usb/driver-conformance.tex
> @@ -0,0 +1,17 @@
> +\conformance{\subsection}{USB Driver Conformance}\label{sec:Conformance / Driver Conformance / USB Driver Conformance}
> +
> +A USB driver MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{drivernormative:Device Types / USB Device / Virtqueues}
> +\item \ref{drivernormative:Device Types / USB Device / Device configuration layout}
> +\item \ref{drivernormative:Device Types / USB Device / Device Initialization}
> +\item \ref{drivernormative:Device Types / USB Device / Device Operation: Data queues}
> +\item \ref{drivernormative:Device Types / USB Device / Device Operation: Host role}
> +\item \ref{drivernormative:Device Types / USB Device / Device Operation: Device role / Device Setup event}
> +\item \ref{drivernormative:Device Types / USB Device / Device Operation: Device role / Device Commands}
> +\item \ref{drivernormative:Device Types / USB Device / Device Operation: Device role / Get Endpoint Count}
> +\item \ref{drivernormative:Device Types / USB Device / Device Operation: Device role / Get Endpoint Info}
> +\item \ref{drivernormative:Device Types / USB Device / Device Operation: Role switch / Get Role command}
> +\item \ref{drivernormative:Device Types / USB Device / Device Operation: Role switch / Switch Role command}
> +\end{itemize}

I think there are some driver normatives missing in this list.

> diff --git a/introduction.tex b/introduction.tex
> index 9a9cbde..02db7cc 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -113,6 +113,12 @@ \section{Normative References}\label{sec:Normative References}
>  	\phantomsection\label{intro:SEC1}\textbf{[SEC1]} &
>      Standards for Efficient Cryptography Group(SECG), ``SEC1: Elliptic Cureve Cryptography'', Version 1.0, September 2000.
>  	\newline\url{https://www.secg.org/sec1-v2.pdf}\\
> +	\phantomsection\label{intro:USB2}\textbf{[USB2]} &
> +	Universal Serial Bus Revision 2.0 Specification,
> +	\newline\url{https://www.usb.org/document-library/usb-20-specification}\\
> +	\phantomsection\label{intro:USB3.2}\textbf{[USB3.2]} &
> +	Universal Serial Bus Revision 3.2 Specification,
> +	\newline\url{https://www.usb.org/document-library/usb-32-revision-11-june-2022}\\
>  
>  	\phantomsection\label{intro:rfc2784}\textbf{[RFC2784]} &
>      Generic Routing Encapsulation. This protocol is only specified for IPv4 and used as either the payload or delivery protocol.
> -- 
> 2.49.0
> 
> 

