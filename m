Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257F325F7A0
	for <virtio-comment@lists.linux.dev>; Wed, 21 May 2025 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823422; cv=none; b=O7Wc+8hFkZKFSL6u6C0bRu5AxHFyr1Ks6qBmznAT7YF+E1LnYNjVHukIifpr3p/+YDrwk8ikoKjdcwju4YvkFJkxk6rGtnEQ74JJbJD35rlPlxVjbRwBj547WLxIXLfinSwPKUs7eEDwTdIG6IgvECLlDKWuhn8HOZk99lLms9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823422; c=relaxed/simple;
	bh=5xzqT5VXsEcmJf1I1P91iwY61EwUiF/M6OwYucvyjdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RKQTiij8vxc/yxuj5e4pAYse4xrMXt8doFANOfbnivdnsbGRisayPbUb/l36Cx4PMT6W5Gda1YQanPpkOnV3JZ2MKflnSIlCRf293bFWOfjekpg2/4ip8z7q6Hkw/ssA0gdX2rEtsB3xLoTXZVVvonq8Jfa21NJtbKw0dU+MXD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvB13ytG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvB13ytG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747823418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F10MVaAqE5u8o8bMwxEjj0zsBRA/SemZVsqi76rth5M=;
	b=UvB13ytGhbV2iUKcU0ffVVlJcjSlzckFj+CmmNI4EPPkqzMVjlMCpkjR61uhjrBp2HQH3T
	luQmSv5pYO3onHsM0Qorq+CVr0kofXwPR+2xMr9sUmo7DLQ/1ofRhdFln3QerjL0EWyf9X
	aRwN3DSrEraE/J2uYxtQD3amMv6UP8o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-at6fLV_VMnCcbOEXXZLwOg-1; Wed, 21 May 2025 06:30:17 -0400
X-MC-Unique: at6fLV_VMnCcbOEXXZLwOg-1
X-Mimecast-MFC-AGG-ID: at6fLV_VMnCcbOEXXZLwOg_1747823416
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a3660a9096so1792463f8f.2
        for <virtio-comment@lists.linux.dev>; Wed, 21 May 2025 03:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747823416; x=1748428216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F10MVaAqE5u8o8bMwxEjj0zsBRA/SemZVsqi76rth5M=;
        b=YAWAJrUdKNrlwDvFbMj18xx9QFlPbV3otLrfKAEEOhBF6Zh82aHhjQmBjfYzlu6gyW
         4gBwuk56oqH/OnlrPKwsEt/bLLFMLUev6yJM34Thcc+u2UrF9BRTOr/1+hjoZQNjS/ah
         UAHLL/6kTZV5YiWvJRmz9ST0ieYuLxcnsPx0gbTGcKE47Ss/g0KTH6IYuQU/xk8N6yAQ
         JCF3JLQAdbR3qq5datdud4G6k8/hos3OBYlwK1pUYThUfgB78pmMoaTrWaSOH0YYt2PH
         nVycrUSxTKV2kP7kuWozlXqXeE+hE0/S7fHVOWUu2RjRmXxI+2DiXtB/3ie8cU+iHhSq
         miAA==
X-Forwarded-Encrypted: i=1; AJvYcCWdJ2qvtX9XRXTYI/BliY16NRzRLHs6eJ9OkQXjAOm9qXpz52UticIKIefMBhZlBmg6V8Xvof9rWtrvmMet9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/3/HipctkM3y8M6JGoZrw9bBqhzI832Ju2yQkCHMeE1RkhUBf
	UrSEukivKLhLd8FO10A2lBn73MZYJHZEKv3AEOe5C2HtgoTJMfsQVLQC4Be9IJup1BAw0Xs8h+U
	/ZsXEU2ZuszZovk/JBKo7lKK5byH1WRqzWzrLTZlb4ZnQNxQjipLSUf448RWCIX7Ek2EW
X-Gm-Gg: ASbGncujcz9hfjzgSguXRWYUreQzSPPfF/hoocPfqNt3OTQ97xciGR84qX6RYCRJFXi
	FcxD/DLS43GtUvghP9ToIRZmK/TO+Vd+ThhUxttJJrdZRX7vs61EhX0ZtImyFr3dIpVohZiVws7
	FrKM4Xhu7JyYXwU8nVFcRlyUTlcHoCp+BD3p0iRFzL3HNLPXytgtRvinUq6LysCUbSrwlJS1GLZ
	tRq+FyXo2LYVnkma+3hoZlTs62ZUn4VuTNR7EadYy/quHQ/3MwqnCtDgbxRFYMlOBzgFjVhRqn0
	MXwHFw==
X-Received: by 2002:a05:6000:2211:b0:3a3:6c6e:ea33 with SMTP id ffacd0b85a97d-3a36c6eeb2dmr9651512f8f.18.1747823416280;
        Wed, 21 May 2025 03:30:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLRNQhNwI4j2uBNutelSHrM0KdGKUtZZNgkqdktmGQ2qQ+cfX2SKCcq9nzbOD5WEj91nYgSA==
X-Received: by 2002:a05:6000:2211:b0:3a3:6c6e:ea33 with SMTP id ffacd0b85a97d-3a36c6eeb2dmr9651493f8f.18.1747823415839;
        Wed, 21 May 2025 03:30:15 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a36c6eeaf8sm11790513f8f.48.2025.05.21.03.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 03:30:15 -0700 (PDT)
Date: Wed, 21 May 2025 06:30:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: cohuck@redhat.com, jasowang@redhat.com, virtio-comment@lists.linux.dev,
	Ray.Huang@amd.com
Subject: Re: [PATCH v1] virtio: introduce SUSPEND and RESUME feature
Message-ID: <20250521062613-mutt-send-email-mst@kernel.org>
References: <20250521102049.68666-1-lingshan.zhu@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250521102049.68666-1-lingshan.zhu@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Fipewl3G_hDRqM4B_YdITP-OpWhxNaVwVNCZ9edBzUk_1747823416
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 21, 2025 at 06:20:49PM +0800, Zhu Lingshan wrote:
> This commit allows the driver to suspend the
> device through a new device status bit SUSPEND
> and resume the device running by re-setting
> DRIVER_OK bit in device status.
> 
> This commit re-orders the device status bits.
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>

this looks good. yet something to improve.

> ---
>  content.tex | 72 ++++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 63 insertions(+), 9 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index d3fc6a4..38b4529 100644
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
> +
> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
> +  device has been suspended by the driver.
>  
>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
>    features it understands, and feature negotiation is complete.
>  
> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> -  drive the device.
> -
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
> @@ -99,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>  \begin{description}
>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>  
> -\item[24 to 41] Feature bits reserved for extensions to the queue and
> +\item[24 to 43] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>  
> -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
> +\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
>  \end{description}
>  
>  \begin{note}
> @@ -629,6 +632,52 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
>  
>  Thus a driver MUST ensure a virtqueue isn't live (by device reset) before removing exposed buffers.
>  
> +\section{Device Suspend}\label{sec:General Initialization And Device Operation / Device Suspend}
> +
> +If VIRTIO_F_SUSPEND is negotiated, the driver is eligible to suspend the device by setting the SUSPEND bit in \field{device status} to 1, and the device SHOULD set the DRIVER_OK bit to 0 once it has been suspended.
> +
> +If the device has been suspended, the driver can resume the device running by setting the DRIVER_OK bit in \field{device status} to 1, and the device should set the SUSPEND bit to 0 once it resumes running.
> +
> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> +
> +The driver SHOULD NOT set SUSPEND bit if DRIVER_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> +
> +Once the driver sets SUSPEND bit in \field{device status} to 1:
> +\begin{itemize}
> +\item The driver MUST verify whether the device has been suspended by re-reading \field{device status}, examining whether the SUSPEND bit is set to 1 and the DRIVER_OK bit is set to 0.

should driver poll for DEVICE_NEEDS_RESET here? if yes say so.


> +\item The driver MUST NOT make any more buffers available to the device.
> +\item The driver MUST NOT send notifications for any virtqueues.
> +\item The driver MUST NOT make any changes to Device Configuration Space except for \field{device status} if it is part of the Configuration Space.
> +\end{itemize}
> +
> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> +
> +The device MUST ignore any operations on the SUSPEND bit from the driver if the device has not been completely initialized by the procedures in \ref{sec:General Initialization And Device Operation / Device Initialization}
> +
> +The device MUST ignore any write access to its Configuration Space while
> +suspended, except for \field{device status} if it is part of the Configuration Space.

I am inclined to relax it to SHOULD, even just so the drivers do not get
lazy and do not violate their side of the bargain.

> +
> +A device MUST NOT send any notifications for any virtqueues,
> +access any virtqueues, or modify any fields in
> +its Configuration Space while suspended.
> +
> +If changes occur in the Configuration Space during suspended period,
> +the device MUST NOT send any configuration change notifications.
> +Instead, the device MUST send the notification when it resumes running.
> +
> +When the driver sets SUSPEND, the device MUST either suspend itself or sets DEVICE_NEEDS_RESET if failed to suspend.

or set


pls make it clear: what to set and when.


> +
> +If the device has been suspended and the driver resumes the device running by setting DRIVER_OK to 1, the device MUST either resume normal operation or sets DEVICE_NEEDS_RESET if it fails to resume.
> +

pls make it clear: what to set and when.

> +When the driver sets the SUSPEND bit to 1,
> +the device SHOULD perform the following actions before presenting the SUSPEND bit as 1 and DRIVER_OK bit as 0 in the \field{device status}:
> +
> +\begin{itemize}
> +\item Stop consuming more buffers of any virtqueues.
> +\item Wait until all buffers that are being processed have been used.
> +\item Send used buffer notifications to the driver.
> +\end{itemize}
> +
>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>  
>  Virtio can use various different buses, thus the standard is split
> @@ -872,6 +921,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>  	handling features reserved for future use.
>  
> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
> +   suspend the device by set the SUSPEND bit to 1.
> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
> +
> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> -- 
> 2.49.0

