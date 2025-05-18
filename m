Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6200A3B2A0
	for <virtio-comment@lists.linux.dev>; Sun, 18 May 2025 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747605139; cv=none; b=TWFMIIQb8lQ4q6hbTyVznSIUbsLdrzkMyQWnrnD6rDaFKYqkyGm08uM9eAjC3mTXszKN0qmSmpJz6C/SZ7Y2XU3nA0fBUckOOR11oBaa/n/PiCKAbfPLDnvLtF9F+WKeKVE0dX1LiaPUk6dSOwfKheY/D05/rPLoZombmaSddRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747605139; c=relaxed/simple;
	bh=C6teTCBOGpWWdysz60IPJlSMEklbxhxCjcWzNdkvvDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=L43JvHE4zlRUKuF+Wcq3JJrubeLbgeeSjBBZTW/yrMmezPVjUNAe2GjGvIK/s6d6pgVPTQd6LzXHYhwALvll3YvF1y/Vh/sOzzjsOseD472BrocUAA7fH7g2FUkCItjC+g4DpBXd8uN1OdaUSTYQ8FhTzmbKeY6LKz92b4KOwxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WHCQ/HtZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WHCQ/HtZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747605134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wZSwKe72f2+y6DPlRyatsMbdnqQHC2XciXEA6KRyfow=;
	b=WHCQ/HtZJPAQgLwn6Ro4f+3YOv46EW0q2cF69/7xRGxcymb8vkAhzXf/EMUeIW7CxtK9+E
	CLvJi3TL015LaVsFkMvlGXKacUf0+xb1OihgDgZxKZlpW9izMS43rFNEiN1tpGn3lF3zAg
	RPpqCcau6OPEPNBzjZ7+ZLiIEok6Oxs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-hf0dccr8Pb-9svHamNmC2A-1; Sun, 18 May 2025 17:52:12 -0400
X-MC-Unique: hf0dccr8Pb-9svHamNmC2A-1
X-Mimecast-MFC-AGG-ID: hf0dccr8Pb-9svHamNmC2A_1747605131
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-442dc6f0138so21176975e9.0
        for <virtio-comment@lists.linux.dev>; Sun, 18 May 2025 14:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747605131; x=1748209931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZSwKe72f2+y6DPlRyatsMbdnqQHC2XciXEA6KRyfow=;
        b=IQT0/dy86I5xJxxJYo4qOqUP4TS7SUYhkmPPfAmC3ifTijiBQFJlY7j5AQEeHSAN9u
         9wg5Ogm9oQqvI95GXoyBdGFYLAwNFBzEetguhV2mRbVpJ3PaFYD+DLG1U/IZnFPpLPfR
         H2wPhPk3HnZw61LP+e9jo8fvk9siEq5eVqhnTldzCc3q33VhuzrprYnnz4S9SfGEuGTQ
         jP1/ldvNtmCFznpfbHc1SC1F81rngPPoJRVYD1lChZ8QEmELsChQv9jGwTCpdo6DnTf6
         bhawyZ6Tu0U3G11lshoj5KA8pnJdiaz/l1ZZJIOa2f/6UnnOCC48mxKzFY7uG86ngKKT
         V8iA==
X-Forwarded-Encrypted: i=1; AJvYcCVy8N3L9eJk7LfN3M+lQu7zuNWwGCGDwE9p25GLb46qV6XDeP6LriuiHx5TQb+s3FSJIzoAOAjRGomAEYebgg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd3zod9L/iWRNQD0FVdoGy52MfR1AZue77PK3gIhQpmTAFWjAw
	CnMuOgIDxBs4aKql06NppFiMHoYiouYE8MarDGUEgfY1TwSGu4vanBvnEPkEl6l2QI0UnOkN4t5
	al/hAQE1GoWC4TETkvbzSr3EsR6PBiQ7yiuA0hNwPzZ572ykJCq/sI2B4MQEbyoZL+8wZ
X-Gm-Gg: ASbGncvx328/OMSrLxIchyTeFmMhvJwOFA39YHVOXz+UEAfYbs+9IkI7aHlARqSt0NF
	ZFMuNSH+gj3cGZQ/IOD66Xjn+HXwynWJkN4gDkf5PYULRWUm5vx5faocY4s73FJL02L4lr/L1Uh
	VwMViF7VQENRGm0Our1AE7+U9aAh6Q7TtAwASw265NEG7Pj+lCtGv9X/IRdOxQrjy6bG/HI4Ve6
	J8S0Kcsu7wHAvkVXiqXhoF6Hw4i27TVHEReOdBUwSspUVupPDJLZ0OCig/R5FoVtdC6NDqLl94b
	NHpc4g==
X-Received: by 2002:a5d:51c4:0:b0:3a1:f653:85dc with SMTP id ffacd0b85a97d-3a35c856484mr6257445f8f.58.1747605131501;
        Sun, 18 May 2025 14:52:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOV3c6J68I/4cpAS1JqMaIU35+kF5FPJaqW3aGc6ngl52JV4Ez96YTyqTnQUU2VONCVJs27Q==
X-Received: by 2002:a5d:51c4:0:b0:3a1:f653:85dc with SMTP id ffacd0b85a97d-3a35c856484mr6257439f8f.58.1747605131132;
        Sun, 18 May 2025 14:52:11 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4a0a5dsm118247395e9.0.2025.05.18.14.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:52:10 -0700 (PDT)
Date: Sun, 18 May 2025 17:52:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: sgarzare@redhat.com, parav@nvidia.com, fupan.lfp@antgroup.com,
	virtio-comment@lists.linux.dev,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Message-ID: <20250518174619-mutt-send-email-mst@kernel.org>
References: <20250412142825.3180245-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250412142825.3180245-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _zWlfr98MwREnxFj_OXEjlbxnR7WghUuheSBJaS_uYs_1747605131
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 12, 2025 at 10:28:25PM +0800, Xuewei Niu wrote:
> This patch brings a new feature, called "multi devices", to the virtio
> vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> "device_order" field to the config for the virtio vsock.
> 
> == Motivition ==
> 
> Vsock is a lightweight and widely used data exchange mechanism between host
> and guest. Currently, the virtio-vsock only supports one device, resulting
> in the inability to enable more than one backend. For instance, two devices
> are required: one to transfer data to the VMM via virtio-vsock, and another
> to a user process via vhost-user-vsock.
> 
> Apart from that, a side gain is that theoretically the performance might be
> improved since each device has its own queue. But it varies depending on
> the implementation.
> 
> == Typical Usages ==
> 
> Assuming there are two virtio-vsock devices on the guest, with CIDs 3 and 4
> respectively. And the device with CID 3 is default.
> 
> Connect to the host using the device with CID 3.
> 
> ```c
> // use default one (no bind)
> fd = socket(AF_VSOCK);
> connect(fd, 2, 1234);
> n = write(fd, buffer);
> 
> // or bind explicitly
> fd = socket(AF_VSOCK);
> bind(fd, 3, -1);
> connect(fd, 2, 1234);
> n = write(fd, buffer);
> ```
> 
> Connect to the host using the device with CID 4.
> 
> ```c
> // must bind explicitly as the device with CID 4 is not default.
> fd = socket(AF_VSOCK);
> bind(fd, 4, -1);
> connect(fd, 2, 1234);
> n = write(fd, buffer);
> ```
> 
> The first version of multi-devices implementation is available at [1].
> 
> v6 -> v7:
> - Addresses minor review comments from Stefano.
> 
> [1] https://lore.kernel.org/virtualization/20240517144607.2595798-1-niuxuewei.nxw@antgroup.com
> 
> Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> ---
>  device-types/vsock/description.tex | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> index 7d91d15..392dc76 100644
> --- a/device-types/vsock/description.tex
> +++ b/device-types/vsock/description.tex
> @@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>  \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
>  \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
>  \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> +\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] multiple devices feature is supported.
>  \end{description}
>  
>  \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> @@ -34,6 +35,12 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>  VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
>  VIRTIO_VSOCK_F_STREAM has also been negotiated.
>  
> +The driver SHOULD ignore devices that do not have
> +VIRTIO_VSOCK_F_MULTI_DEVICES if the feature has been negotiated.
> +
> +The driver SHOULD ignore all subsequent devices if a device without
> +VIRTIO_VSOCK_F_MULTI_DEVICES is present.
> +

all this is really vague. any better way to put it?

what are subsequent devices? if the feature has been negotiated where?
what does ignore mean? you can not know features without interacting
with the device.



>  \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
>  
>  The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
> @@ -52,6 +59,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>  \begin{lstlisting}
>  struct virtio_vsock_config {
>  	le64 guest_cid;
> +	le16 device_order;
>  };
>  \end{lstlisting}
>  
> @@ -77,11 +85,27 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
>  \hline
>  \end{tabular}
>  
> +The \field{device_order} is used to identify the default device.

no explanation what is the default device.
is it just for the cid?

> Up to
> +65,535 devices can be supported due to the size.

can be -> are
drop "due to the size".

> +
> +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> +
> +The device MUST provide a distinct \field{device_order} if
> +VIRTIO_VSOCK_F_MULTI_DEVICES feature has been negotiated.

distinct to what?

> +
> +\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
> +
> +The driver MUST treat the device with the lowest \field{device_order} as
> +the default device.
> +
>  \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
>  
>  \begin{enumerate}
>  \item The guest's cid is read from \field{guest_cid}.
>  
> +\item If VIRTIO_VSOCK_F_MULTI_DEVICES has been negotiated, the device's
> +order will be read from \field{device_order}.
> +
>  \item Buffers are added to the event virtqueue to receive events from the device.
>  
>  \item Buffers are added to the rx virtqueue to start receiving packets.
> @@ -233,8 +257,10 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
>  
>  \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
>  
> -The \field{guest_cid} configuration field MUST be used as the source CID when
> -sending outgoing packets.
> +If the source socket is not bound to any source CID, the driver MUST assign
> +one. If more than one device is present, the driver SHOULD use the default
> +device's \field{guest_cid} configuration. Otherwise, the driver SHOULD use
> +the \field{guest_cid} of the only available device.

why did you drop requirement about outgoing packets?

>  
>  A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
>  unknown \field{type} value.
> -- 
> 2.34.1

