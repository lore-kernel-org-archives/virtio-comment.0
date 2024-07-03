Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5994F1EB25
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719997277; cv=none; b=nNEawU8+lllcb3nwB19q1y0fIFAcMKA4WqFqXcbtyKJjXglOkGGaZ+skFgD9Fqzb/PnDk5yo2JgLVED0yq5Xg1HaIl8Ff2EE66s/a6oNVFD3Hx8zkSF9t1VJfDu1yENAz6A3JiZkFCST5IydIPSGNdLQzphsLVpckaaLG1s6nTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719997277; c=relaxed/simple;
	bh=VBcYSUzAxASOrDPWRu51JCL8KGbvtqtywsOBU1Hxhdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=A/6RsEoIIgVg5GfEZJpYrqph0qlif57pst5mTUTfpafildYNnQxPInZTjRArqQCdi/RQQ1noEPY8mVkBN79oZQIKQqt42jJ+rIXiXxJJapydBcbQw0/NzdzLZPIfoRJrEjG7C3ZXlNrCcIl7xuAG5lFOxmLcrHZcepdiCTZFNkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fdCsQ6fh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fdCsQ6fh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719997274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkJqsK/S+yW+1X8MtTAiaLd9TfU9J7TyITqo1nqgva0=;
	b=fdCsQ6fhlgrhpEe2r8xKXvrfor+rhTB9+pN7NBdUfoUPYDDZC61axyfi/rfUUmvLjTawyA
	6rs2hVB45BnC95HB3U8zz/y0I2mJtDUCDh/NnMgGnESOzkCtH/zz5KtKrNsJiKwR83idZI
	uC3OO9Zds/7u2B4E1pzNb/5tGZBbzKk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-2XqiNsLGNc653RU4QoQQUQ-1; Wed, 03 Jul 2024 05:01:11 -0400
X-MC-Unique: 2XqiNsLGNc653RU4QoQQUQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a725eed1cfeso349395566b.3
        for <virtio-comment@lists.linux.dev>; Wed, 03 Jul 2024 02:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719997270; x=1720602070;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zkJqsK/S+yW+1X8MtTAiaLd9TfU9J7TyITqo1nqgva0=;
        b=C3oJyX4TFBGUCG4HkPneWBv5/1df4evJ2zeqXI5Lg3llSVXKyni6Eu8MGp3fRrPuBg
         K0WcDDI7SjnGrrH6Dnfn2hzNyqSuZ51SSKqfotIlOJzO+Sg+hnRWNkChD2rJNxt7rGmd
         zns/t0qGfuyXo+Aw0lZWRPxQfcqFeIvqBSinPkJE7amH5jEX9RK6TleodzSFdbVNHkkl
         vOuKz2LmULDu28kM8RfcKTHRMzByUqrlkxecU9awVoUannZtJAg6WdlYVwyvFztNVIHy
         Nu4BBEwdsdP7eJsvQ4yNu4R6pD8dvFYvmdjxCVay/EiYOffOZpHxBgYF6cLm6gfoPmZc
         FvZA==
X-Forwarded-Encrypted: i=1; AJvYcCXeMYVeDGWuYNVI0wN60f/ZR4yYo+eoe5RYWdC22siUJ+XiQCcGnN6aV86n7roPmIVUqt1NQVqdxQ1F/4NawW3vQCmaNFKamz7JFBNgVd8=
X-Gm-Message-State: AOJu0Yw2e5Ec1/DVWep1Lz38vSCCqWwkWR4ckx0KZRyWR1f5fMlZmZ9p
	0JEXZ8TNJawq1SXH5oHZ8cbuYMMjUxQ3Ea0E70UUeu6TeB/Kv4urh1LfnMYQTW+lLzNQgJYpGo8
	QoxhT+RhaCslDVRI9+JUOhNT9UIWSrBy/HhAQ547vICwiwYEepttNsIx1fRh5DUUQ
X-Received: by 2002:a17:907:7211:b0:a75:115a:25d0 with SMTP id a640c23a62f3a-a75144955e0mr806436966b.50.1719997270321;
        Wed, 03 Jul 2024 02:01:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJf8Cp2gfzkPJwuBqSw4nMjUSp6yKD8AvP0hOIgeZBHLIuXIgTILXqhomBGHqmn9AiAUvK6Q==
X-Received: by 2002:a17:907:7211:b0:a75:115a:25d0 with SMTP id a640c23a62f3a-a75144955e0mr806432966b.50.1719997269551;
        Wed, 03 Jul 2024 02:01:09 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:91a8:a47d:5a9:c02f:92f2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab09028dsm496062766b.179.2024.07.03.02.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:01:08 -0700 (PDT)
Date: Wed, 3 Jul 2024 05:01:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: cohuck@redhat.com, jasowang@redhat.com, virtio-comment@lists.linux.dev,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [RESEND PATCH v6] virtio: introduce SUSPEND bit in device status
Message-ID: <20240703044005-mutt-send-email-mst@kernel.org>
References: <20240703031057.37565-1-lingshan.zhu@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240703031057.37565-1-lingshan.zhu@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 03, 2024 at 11:10:57AM +0800, Zhu Lingshan wrote:
> This commit allows the driver to suspend the device by
> introducing a new status bit SUSPEND in device_status.
> 
> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
> which indicating whether the device support SUSPEND.
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> Signed-off-by: David Stevens <stevensd@chromium.org>

Your signature would normally be last.


> ---
>  content.tex | 71 +++++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 61 insertions(+), 10 deletions(-)

At a high level, I think this is somewhat overspecified.
Generally e.g. if driver is forbidden from accessing
a field, then we do not also add specific requirements for
devices - with no driver doing this, such functionality will
remain untested and unused, and when we finally decide we need
it it's not going to be there.
Similarly for when device is not touching a field - no
reason for driver not to touch it.


> diff --git a/content.tex b/content.tex
> index 0a62dce..8c974d3 100644
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
> @@ -629,6 +633,49 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
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

If it's not set, then what? Device error, have to reset?


> +\item The driver MUST NOT make any more buffers available to the device.
> +\item The driver MUST NOT access any fields of any virtqueues or send notifications for any virtqueues.

what are these "fields"? the area in memory where the vq lives? why is
doing that a problem - you want device to be able to write something
there?

> +\item The driver MUST NOT access Device Configuration Space except for the field \field {device status},
> +if it is implemented in the Config Space.

what is "the Config Space"? device status is never in
a device configuration space, it is part of the common configuration.
so what exactly are you forbidding here?

> +\end{itemize}
> +
> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> +
> +The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.

what does must ignore SUSPEND mean? what do you want the device to do and when?


> +The device MUST ignore all access to its Configuration Space while
> +suspended, except for \field{device status} if it is part of the Configuration Space.

again what does ignore mean? Configuration Space here means
Device Configuration Space?

> +
> +A device MUST NOT send any notifications, access any virtqueues, or modify
> +any fields in its Configuration Space while suspended.

If a tree falls in a forest, and no one is around to hear it, does
it still make a sound?
I think what matters is that if a configuration space changes while
SUSPEND is set, then the device must not send a configuration change
notification, and it must send a configuration change notification
after SUSPEND bit has been cleared.


> +When the driver sets SUSPEND, the device MUST either suspend itself or set DEVICE_NEEDS_RESET if failed to suspend.
> +
> +If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
> +the device MUST either resume normal operation or set DEVICE_NEEDS_RESET.
> +
> +When the driver sets SUSPEND,
> +the device SHOULD perform the following actions before presenting SUSPEND bit in the \field{device status}:

what does "before presenting" mean here? that a driver reading status
will see 0 in this bit?

> +\begin{itemize}
> +\item Stop processing more buffers of any virtqueues
> +\item Wait until all buffers that are being processed have been used.
> +\item Send used buffer notifications to the driver.
> +\end{itemize}

Is there anything here that has not been said before, but as a MUST?
Saying same thing twice once a MUST once a SHOULD is confusing IMHO.


> +
>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>  
>  Virtio can use various different buses, thus the standard is split
> @@ -872,6 +919,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
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

