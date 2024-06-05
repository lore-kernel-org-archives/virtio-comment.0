Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50D7D529
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 05:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717566721; cv=none; b=E4hLW2MuBiaxMjwIxNq4C8BpCtqKK0NLr8kWn9+IGcYV2N2RpRZ1gZrzGIkL/YSMvTRchD80Mbpiaf22Vo2zDy5UAeggEVCZymeOWEW+nQDhmVMa8qUYxC1unfafNCo3b5Kjyf401qkYaQ9d4UVfbWvZTVCopsTy1nEvgt7iEqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717566721; c=relaxed/simple;
	bh=ndQBdX6HDw0FEcldcZu+w07A0DjU8FG/YFg3OnfnhoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hGGcCkt58s7Q2WOTCbnzYhl2iaz+s25CEc34BF4TflRILyWv7iXkY5mQDjRmnnKvziJo+STs2HrefFYiNPuPsSw9zxclq2oj6zt/AcSib5/5ET2XRaZzFFqDujoS3L9WALdUyWf5JZpRcL4xn2+6cJz1uHQbE9UrteIdwWyChpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JG1VIHgi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JG1VIHgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717566718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dlHKgcxUw4ofhwVLFtnIVph5UUM6tjWiPDBVRAtfshM=;
	b=JG1VIHgiE0MM/ls9RhcBPxZJSGPg7zcrmLTMpoyikGUF63Cs8buNntmi5xPUfKKO5sy3bM
	VfLS4Y9qpE1piVKvE6lXkj3BGlyQsfWOguKX3teKqu4yXZMKzlXpeLD4N9MQQGei50yFI3
	ujwWeAtiL0uM9LFQzaLTNpIwq/Tzs+0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-FCZpsuP3P4Of2ByGqKQ5RQ-1; Wed, 05 Jun 2024 01:51:56 -0400
X-MC-Unique: FCZpsuP3P4Of2ByGqKQ5RQ-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2eaab1d55deso22709221fa.3
        for <virtio-comment@lists.linux.dev>; Tue, 04 Jun 2024 22:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717566715; x=1718171515;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dlHKgcxUw4ofhwVLFtnIVph5UUM6tjWiPDBVRAtfshM=;
        b=BfKtW4k7EJUVxpecAqAiyzizZ9pCpSKYOCs8rVlhL2khAsY/KIp0tF+g9FVnk1/6Yi
         177WCzqN80uxOC9MYdfMnlFkI/a270mQqwmibuuo4r36VtJ3gvD5o1a9suGwKo8fRMpi
         NyLr8SybvhGMKlqvJWE9l0/cU0QjXuO9/lC2TgYKoL1WNUnbU30TDACqAQ5ANmPnZhFn
         jZu5BjZjnH0LPKv6lOvswEPTRy0lvXHwJWe0bWkTBFSrJBTqJNxjl3PrOEZpsXO1RL9v
         uk05HkvRnx8vs9+vsLwyVECTlMCmhYuLTSKmW1fj8Vj/FDht8T3u1H5PAEB2qbSzgpcn
         vhYA==
X-Forwarded-Encrypted: i=1; AJvYcCUN+HdWo5NE94XuJem0NKoptXQmC6qqCzsF4CIlHo13A0on9PwqEF0uAwHLTJc2XKGoY7yiToRDouKORFjwumScUxKBNYZmoc7awTy3+Ek=
X-Gm-Message-State: AOJu0YylxzBQUKdbgbZJEpmAzvLRdAiBDq0ai/bnAgSKuejCljN5o3SS
	wBFh9SCATWacuFT0vnkbKrWRsaaw9OOatFgUTrlEabzVFOvSNSjA1uEOlJdIhk2NJSyi6+cAsEU
	wwIv4SmgoVgXM6t/XZWJDCH4LMN40oNHWL4AvjPnbX+2nJ7ZZKqrBi/HCt3p6V3Bb
X-Received: by 2002:a2e:965a:0:b0:2ea:c5de:6fef with SMTP id 38308e7fff4ca-2eac79c7a68mr6712321fa.1.1717566715035;
        Tue, 04 Jun 2024 22:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1v1KheD7QdP8K2anRID7i3OtWVQeHNfRS2SIonGmmM/9wCG1WgfM+sWmHPzyHkB2IhC1Qhw==
X-Received: by 2002:a2e:965a:0:b0:2ea:c5de:6fef with SMTP id 38308e7fff4ca-2eac79c7a68mr6712261fa.1.1717566714472;
        Tue, 04 Jun 2024 22:51:54 -0700 (PDT)
Received: from redhat.com ([2.55.58.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a4f172062sm6885337a12.90.2024.06.04.22.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 22:51:53 -0700 (PDT)
Date: Wed, 5 Jun 2024 01:51:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: cohuck@redhat.com, jasowang@redhat.com, virtio-comment@lists.linux.dev,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [V4] virtio: introduce SUSPEND bit in device status
Message-ID: <20240605015049-mutt-send-email-mst@kernel.org>
References: <20240604090344.225934-1-lingshan.zhu@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240604090344.225934-1-lingshan.zhu@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jun 04, 2024 at 05:03:44PM +0800, Zhu Lingshan wrote:
> This commit allows the driver to suspend the device by
> introducing a new status bit SUSPEND in device_status.
> 
> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
> which indicating whether the device support SUSPEND.
> 
> This SUSPEND bit is transport-independent.
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>


Pls put [PATCH v4] in the subject. git format-patch has a "-v" flag that
does it.

> ---
>  content.tex | 69 +++++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 59 insertions(+), 10 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index 0a62dce..a47e077 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -36,19 +36,22 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>      this bit.  For example, under Linux, drivers can be loadable modules.
>    \end{note}
>  
> -\item[FAILED (128)] Indicates that something went wrong in the guest,
> -  and it has given up on the device. This could be an internal
> -  error, or the driver didn't like the device for some reason, or
> -  even a fatal error during device operation.
> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> +  drive the device.
>  
>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
>    features it understands, and feature negotiation is complete.
>  
> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> -  drive the device.
> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
> +  device has been suspended by the driver.
>  
>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>    an error from which it can't recover.
> +
> +\item[FAILED (128)] Indicates that something went wrong in the guest,
> +  and it has given up on the device. This could be an internal
> +  error, or the driver didn't like the device for some reason, or
> +  even a fatal error during device operation.
>  \end{description}
>  
>  The \field{device status} field starts out as 0, and is reinitialized to 0 by
> @@ -60,8 +63,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>  initialization sequence specified in
>  \ref{sec:General Initialization And Device Operation / Device
>  Initialization}.
> -The driver MUST NOT clear a
> -\field{device status} bit.  If the driver sets the FAILED bit,
> +The driver MUST NOT clear a \field{device status} bit other than SUSPEND
> +except when setting \field{device status} to 0 as a transport-specific way to
> +initiate a reset. If the driver sets the FAILED bit,
>  the driver MUST later reset the device before attempting to re-initialize.
>  
>  The driver SHOULD NOT rely on completion of operations of a
> @@ -99,10 +103,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>  \begin{description}
>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>  
> -\item[24 to 41] Feature bits reserved for extensions to the queue and
> +\item[24 to 42] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms
>  
> -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
> +\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
>  \end{description}
>  
>  \begin{note}
> @@ -629,6 +633,47 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
>  
>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) before removing exposed buffers.
>  
> +\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
> +
> +When VIRTIO_F_SUSPEND is negotiated, the driver can set the
> +SUSPEND bit in \field{device status} to suspend a device, and can
> +clear the SUSPEND bit to resume a suspended device.
> +
> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> +
> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> +
> +Once the driver sets SUSPEND to \field{device status} of the device:
> +\begin{itemize}
> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
> +If not, the device does not support the SUSPEND feature.
> +\item The driver MUST NOT make any more buffers available to the device.
> +\item The driver MUST NOT access any fields of any virtqueues or kick any virtqueues.
> +\item The driver MUST NOT access Device Configuration Space.
> +\end{itemize}
> +
> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> +
> +The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> +
> +The device MUST ignore all access to its Configuration Space while
> +suspended, except for \field{device status}.
> +
> +A device MUST NOT send any notifications, access any virtqueues, or modify
> +any fields in its configuration space while suspended.
> +
> +If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
> +the device MUST either resume normal operation or set DEVICE_NEEDS_RESET.
> +
> +When the driver sets SUSPEND,
> +the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:
> +
> +\begin{itemize}
> +\item Stop processing more buffers of any virtqueues
> +\item Wait until all buffers that are being processed have been used.
> +\item Send used buffer notifications to the driver.
> +\end{itemize}
> +
>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>  
>  Virtio can use various different buses, thus the standard is split
> @@ -872,6 +917,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>  	handling features reserved for future use.
>  
> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
> +   set SUSPEND to the device.
> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> -- 
> 2.45.1

