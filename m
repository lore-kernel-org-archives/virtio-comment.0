Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7174619B
	for <virtio-comment@lists.linux.dev>; Tue, 13 Aug 2024 08:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723536134; cv=none; b=f/IM3azMZkAn3TZWBTlULoMxBx8cZhGrgN3y8bHSmfgVkUz4kfM2+dZVab1gWuOjdnWjfzi2Bjj6rMAzy/TYbVAxgjlub3bMqBNHkQkPL1Z2QvkhA7iRFiS7ZbLJRzdfCqAILXyWQiqW8Nx/W/hLwHccRew6fYla6azpjLKjpNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723536134; c=relaxed/simple;
	bh=p67hOZEiXy4s0jx5YQPetO7C+lbwRzq+Z0+yRyFFduo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=u4zUhrMVpMJ7dNqmwSWhbtN8kvoWIq9JN0zvODaruH2604y7S+urkA9dv/qlSVTGIBdOY1D4PohawT6IVYiKH3/S1X6H2Ga6T3Bw3o1Usc7zje5//x3UlYisGD6Ow6LCA61d/JH51FjEd+bRj6Wrkr+skG425c0BEHIEgXQJ0B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GBrKeDdn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GBrKeDdn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723536131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JP98BZRKtGb1J2dHHM8xO1IZwQV4fmiB0pe8IFtiWYs=;
	b=GBrKeDdnfDdC8g8RSWKEO6d/Qq0NwtUdd5lMIHOGIvpicACOIoBPGm5RXBqW/Zx9KHGe/5
	jI5+auvBT6YSJUT10ZL+L7yzG7Ny2s6Oofh+oGNXmiVyJJF4w7KcqwJypiwRGPtBR/36C8
	vSbCgE2G+xATyxFPOPLwJuO9wdGS66Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-iRHpA9mINx-Oz6Zg9ksWXQ-1; Tue, 13 Aug 2024 04:02:07 -0400
X-MC-Unique: iRHpA9mINx-Oz6Zg9ksWXQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a7aa020cef5so328441666b.0
        for <virtio-comment@lists.linux.dev>; Tue, 13 Aug 2024 01:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723536126; x=1724140926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JP98BZRKtGb1J2dHHM8xO1IZwQV4fmiB0pe8IFtiWYs=;
        b=RlOn3nx1pA85HYJ1PpDf6yA8i5EV+RG55KMEtfP9X4CMrIPz2lbTlmyLt8M5uIJ0UM
         cZXjICOi1Zi7MiqhPUyiEdZIF9Mbjb/75j1nMXAaW65rFYQuF+VW8vgbHFR1zHQ+VVw+
         KACprF3VhlRoaJCj1kKeSAhX4+tu8xDuj3iNtRKQgCWVaShFa4ghlileYGazsi4QG8mi
         1IZparMiL94Z9K7W+kiQyrFjL0J5hKo2edNLhI5h1157w6g5hS3x2yg5ZIPjmcaRwtUo
         VkgHuuQNwqNtMieZ+UklWReaYVnFiX1xn1wPH2uv4xwYvf73wvFMePv1t14w1/4xm+Gl
         0a+A==
X-Forwarded-Encrypted: i=1; AJvYcCXjPkWsJt+Ml2zROUIOYjz8OghEevnhsthaAanLvms6oty5r7p9+mwltQC/Es3S0a7vH3gRuqFTUANjV/6KOg7CPhVFyH8Zwpp7g7Ns1lQ=
X-Gm-Message-State: AOJu0YzVlUHGqPiSdDZgOUAuqm1zhfcLdUrhVTu4T9eQKc9pOMWxhKhc
	GLy9QZUqNyTfA4aFQjlnm2wuX7kcvnmMozecRhNJ01JaF4EPvysn+tD7VAi7PYhS/FOskUtLR/M
	QrFd0CjNWQzBxFrs1J0y7DsRrazQ7yhCXsIlNfA5U6rt7x30mLdYoHv2fp9mp7nJG
X-Received: by 2002:a17:907:94ca:b0:a7a:bece:6223 with SMTP id a640c23a62f3a-a80ed1b5a0cmr187417866b.6.1723536126408;
        Tue, 13 Aug 2024 01:02:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEutcghjMrKUUwnFzU3gG3NSoO+LsSCNtiBqVazvVXyvbz2Bnkm7zy55M0VXL2EXWcS3e7o3g==
X-Received: by 2002:a17:907:94ca:b0:a7a:bece:6223 with SMTP id a640c23a62f3a-a80ed1b5a0cmr187410366b.6.1723536124845;
        Tue, 13 Aug 2024 01:02:04 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:346:dcde:9c09:aa95:551d:d374])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f414befdsm47913266b.147.2024.08.13.01.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 01:02:04 -0700 (PDT)
Date: Tue, 13 Aug 2024 04:01:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: cohuck@redhat.com, jasowang@redhat.com, virtio-comment@lists.linux.dev,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240813035358-mutt-send-email-mst@kernel.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240801113516.22155-1-lingshan.zhu@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 01, 2024 at 07:35:16PM +0800, Zhu Lingshan wrote:
> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> +
> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.

Actually, it has no effect before DRIVER_OK, no? I would forbid that
then.

> +Once the driver sets SUSPEND to \field{device status} of the device:
> +\begin{itemize}
> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.


This is still vague, I commented on this several times.
I think what you mean is that until it reads status with
SUSPEND as 1, it does not consider SUSPEND set.


But, what happens if driver clears SUSPEND before it reads it as set?
It would seem that should cancel suspend (which is a useful thing to
support)? But this creates a problem as it breaks read/modify/write that
some hypervisors assumed to be safe. I guess we need an extra
SUSPEND_IN_PROGRESS bit then? A little too much for status, at this
stage - maybe we need an extra register for this.


> +\item The driver MUST NOT make any more buffers available to the device.
> +\item The driver MUST NOT access any virtqueues or send notifications for any virtqueues.
> +\item The driver MUST NOT access Device Configuration Space.
> +\end{itemize}

> +
> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> +
> +The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.

> +
> +The device MUST ignore all access to its Configuration Space while
> +suspended, except for \field{device status} if it is part of the Configuration Space.
> +
> +A device MUST NOT send any notifications for any virtqeuues,
> +access any virtqueues, or modify any fields in
> +its Configuration Space while suspended.
> +
> +If changes occur in the Configuration Space while the SUSPEND bit is set,
> +the device MUST NOT send any configuration change notifications.
> +Instead, the device MUST send the notification after the SUSPEND bit has been cleared.
> +
> +When the driver sets SUSPEND, the device MUST either suspend itself or set DEVICE_NEEDS_RESET if failed to suspend.
> +
> +If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
> +the device MUST either resume normal operation or set DEVICE_NEEDS_RESET.
> +
> +When the driver sets SUSPEND,
> +the device SHOULD perform the following actions before presenting that the SUSPEND bit is set to 1 in the \field{device status}:

what does "before presenting" mean? does it return SUSPEND as 0
after driver wrote 1 there and before it completed these
actions?

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
> @@ -872,6 +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>  	handling features reserved for future use.
>  
> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
> +   trigger suspending the device via the SUSPEND flag
> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> -- 
> 2.45.2

