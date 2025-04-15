Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BFB4A1A
	for <virtio-comment@lists.linux.dev>; Tue, 15 Apr 2025 15:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729460; cv=none; b=eHVlpIZf9RmrXH9x1tLWnoMK9613yLBL0CM1U+Y2Lnnc2zdEGmeldWQwIIrLUU1NV3C471F4U4pMAOjEEqYR1MChyJmHnqYK6QHtpmlgC2qmf2UVfbbWAOJlAhDUS+zD8ObcUNl+lU28qitjp3Hvkbix8sa9M6E5X8thsnbfArE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729460; c=relaxed/simple;
	bh=4XfxOjRWVyKp0Ew68XF/LXFp8zl/KKwDGF4LsgFYjrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=BlNOYwiNnkfX5vp6KYSomOK+s0JLqfka5nFKCCCwQfI8V4PmXmUYIkGRTb9UgokZnKZoO+SQYblIDEPCX6NH1dCnY/Nk+2HwzACPhsIqznPwYmKKOYrsDO3/bh6SRHSJH7B3aXuBkdZZ3E+jvyN121F9PSn1JawJ+F/UA21qEFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wo0mxuph; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wo0mxuph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744729456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eQof5E6SAIq78Vus+D1V1fyhel/GR762p0Ls+EOwArU=;
	b=Wo0mxuph3cK9x4u6meG6tZMXw+POY3k6lcJgt4d+AFQvMw5RB1VKNIjxON4t7YOmPI4fGW
	Xre4Ng+k5Cc08kR4M3y+rec47o5H9ddR9Mk8zuURH9kTd8ZjQwPeZKJFgbcpUVZIGQnjEt
	exkSBAJim+KwdE85iUQMC31JpSIO5eI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-wriCkhz-MIqqAmFZS8wORQ-1; Tue, 15 Apr 2025 11:04:14 -0400
X-MC-Unique: wriCkhz-MIqqAmFZS8wORQ-1
X-Mimecast-MFC-AGG-ID: wriCkhz-MIqqAmFZS8wORQ_1744729453
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3913aaf1e32so3287853f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 15 Apr 2025 08:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744729452; x=1745334252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQof5E6SAIq78Vus+D1V1fyhel/GR762p0Ls+EOwArU=;
        b=NxO1bZbyjqrDw/BBs1+p8EWSptoQGdv6tfPz+SqS3VmS+5AzzGVF+uBR1eoWq56pAm
         3jJF63M3zdYdsOh10mBs28GnFYxLX8U6aXHww/kSYCb7ZORf/gqB6FV5dfraR1MBIo6L
         tCcrI9dLPk5cj3dyWVcfyFo/5ozWIlff5buBxt/MgvOHRpEhKfR+ZpUPNpF1Dw7NpWdA
         zwLj7hkQFsH525cZEZ4gjFrSHFjSFiWWfH+L8bCxqxvP9WPQtEQyF9RtyeOG+qF/6juH
         c0tK4LBwTjgz3Wia3aDF7JtEZcNvXLkCXzpC+5venBkSh2VHCQkeJUQW5Q8I+HkrFoq7
         4F0w==
X-Gm-Message-State: AOJu0Yxj3gvvNLX0tSyYoymOxrNX4tSDFTX17xPlRgcDTbqMDcmgijUZ
	jLm3WAWT47TQA0Lusq2IDblSQ+5w9EHxflwsAnZzp5j9ja1oecc1HDDx8H9D3TeWa7caKOtNFSE
	d0SkY07ifEwT99XIyVvr6r91m6T/HJz2SZ6CGfe5AT+LD4UuXn7CZY64PxP67rhS9Whdr06lF
X-Gm-Gg: ASbGncue6HOOj0ULfoQfkkQ6LrDw+B5nXMlpo32fEcr6kDclCwKu8orEwbaNqwjomyk
	suVe4aOKNcp7iH3MVPUN7VVs4ergcNGmvkep08bOijqfs8Bt560GS+Eb48hqGeGexNAPNHuriof
	Kc1w4lpDwiqIF2MYB4G8zyVRLp5Pi5eYqokDSi3kg4vBj2TEfeexKeHBYbtGEXopzwiumRxTv4Z
	oy3C0v6m0e+4+DycjmfQiocqY2NWkGEnQmSzul1icUWNHCCzkTOd6nXcs1X/iZXbXaiMh3rvZAr
	uqHpCQ==
X-Received: by 2002:a05:6000:2481:b0:391:2bcc:11f2 with SMTP id ffacd0b85a97d-39ea51ed3ebmr14791102f8f.1.1744729451194;
        Tue, 15 Apr 2025 08:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmBRCzIB0WGN6mknHQlpL2qhaGw4u06hYuYdTEpWEKlbzMOPwYn082koJQDjr7SXnhN4zmuQ==
X-Received: by 2002:a05:6000:2481:b0:391:2bcc:11f2 with SMTP id ffacd0b85a97d-39ea51ed3ebmr14790657f8f.1.1744729447130;
        Tue, 15 Apr 2025 08:04:07 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963fccsm14381298f8f.3.2025.04.15.08.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 08:04:06 -0700 (PDT)
Date: Tue, 15 Apr 2025 17:04:05 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>
Subject: Re: [PATCH v8 1/4] virtio-rtc: Add initial device specification
Message-ID: <Z/51ZaDcrRdQBsRb@fedora>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <20250306095112.1293-2-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250306095112.1293-2-quic_philber@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0dSAq1XfGb8BTFc38aUKF_FO6mopB_SVbAyNVxMf810_1744729453
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 06, 2025 at 10:51:09AM +0100, Peter Hilber wrote:
> The virtio-rtc device provides information about current time through
> one or more clocks. As such, it is a Real-Time Clock (RTC) device.
> 
> The normative statements for this device follow in the next patch.
> 
> For this device, there is an RFC Linux kernel driver which is being
> upstreamed, and a proprietary device implementation.
> 
> Miscellaneous
> -------------
> 
> The spec does not specify how a driver should interpret clock readings,
> esp. also not how to perform clock synchronization.
> 
> The device uses the "Timer/Clock" device id which is already part of the
> specification. This device id was registered a long time ago and should
> be unused according to the author's information. The name "RTC" was
> determined to be the best for a device which focuses on current time.
> 
> Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> ---
> 
> Notes:
>     v8:
>     
>     - Change word order from "field X" to "the X field" (Matias Ezequiel
>       Vara Larsen).
>     
>     - Split up sentences about implementation-specific definitions (Matias
>       Ezequiel Vara Larsen).
>     
>     v7:
>     
>     - Remove leap second and performance indications from struct
>       virtio_rtc_resp_read_cross. Remove backing definitions.
>     
>     - Add wording change which was previously mistakenly placed in last
>       patch.
>     
>     v6:
>     
>     - Make leap second status information optional if the clock smears (or
>       might smear) leap seconds.
>     
>     - Do not use union for leap second indication.
>     
>     - Improve wording.
>     
>     - Refer to the new POSIX.1-2024 for UTC epoch definition.
>     
>     v5:
>     
>     - Change structure and wording to support adding shared memory like
>       vmclock [8].
>     
>     - Add dedicated clock types for UTC leap second smearing (David
>       Woodhouse).
>     
>     - Extend leap second indications.
>     
>     - Split UTC-TAI offset and fractional offset due to smearing (David
>       Woodhouse).
>     
>     - Remove requirement that TAI offset must not be a whole second while
>       clock is being smeared.
>     
>     - Align bit widths, and some names, with '[RFC PATCH v4] ptp: Add
>       vDSO-style vmclock support' [8].
>     
>     - Replace VIRTIO_RTC_SUBTYPE_ by VIRTIO_RTC_SMEAR_.
>     
>     - For Arm Generic Timer, only support Virtual Count Register (David
>       Woodhouse).
>     
>     - Rename MONO clock to MONOTONIC clock.
>     
>     v4:
>     
>     - Drop distinction of Arm Generic Timer virtual and physical counter [7].
>     
>     - Add requirement that device should assume that driver reads clock from
>       first vCPU (David Woodhouse) [6].
>     
>     - Formatting and wording improvements.
>     
>     v3:
>     
>     - Address comments from Parav Pandit.
>     
>     - Split off normative requirements into a second commit [2].
>     
>     - Merge readq and controlq into requestq [3].
>     
>     - Don't guard cross-timestamping with feature bit [3].
>     
>     - Pad request headers to 64 bit [2].
>     
>     - Rename Virtio status codes to match UNIX error names [2].
>     
>     - Avoid Virtio status code clashes with net controlq ack values.
>     
>     - Reword to refer more to "requests", rather than "messages" [2].
>     
>     - Rephrase some sentences [2].
>     
>     - Use integer data types without "__" prefixes [2].
>     
>     - Reduce clock id width to 16 bits [5].
>     
>     - Make VIRTIO_RTC_FLAG_CROSS_CAP a bit mask rather than a bit index.
>     
>     v2:
>     
>     - Address comments from Cornelia Huck.
>     
>     - Add VIRTIO_RTC_M_CROSS_CAP message [1].
>     
>     - Fix various minor issues and improve wording [1].
>     
>     - Add several clarifications regarding device error statuses.
>     
>     [1] https://lists.oasis-open.org/archives/virtio-comment/202304/msg00523.html
>     [2] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#mffb93800fea11d6dda9e151078abedd6ff1c0f1e
>     [3] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#m94efd0aa9b9c2b96a246b79ef8bfc3bf64ebe791
>     [4] https://lore.kernel.org/lkml/20230630171052.985577-1-peter.hilber@opensynergy.com/T/#m65fa1d715933360498c4e33d7225e4220215a9d6
>     [5] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#mf00ce330228c28556d735eb9597469048c5d8b62
>     [6] https://lore.kernel.org/lkml/d796d9a5-8eda-4528-a6d8-1c4eba24aa1e@opensynergy.com/
>     [7] https://lore.kernel.org/all/20231218064253.9734-2-peter.hilber@opensynergy.com/
>     [8] https://lore.kernel.org/lkml/20240708092924.1473461-1-dwmw2@infradead.org/
> 
>  content.tex                      |   3 +-
>  device-types/rtc/description.tex | 428 +++++++++++++++++++++++++++++++
>  introduction.tex                 |   6 +
>  3 files changed, 436 insertions(+), 1 deletion(-)
>  create mode 100644 device-types/rtc/description.tex
> 
> diff --git a/content.tex b/content.tex
> index 67b1bf3c35ab..b1d93a8aebb4 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -684,7 +684,7 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  16         &   GPU device       \\
>  \hline
> -17         &   Timer/Clock device \\
> +17         &   RTC (Timer/Clock) device \\
>  \hline
>  18         &   Input device \\
>  \hline
> @@ -776,6 +776,7 @@ \chapter{Device Types}\label{sec:Device Types}
>  \input{device-types/pmem/description.tex}
>  \input{device-types/can/description.tex}
>  \input{device-types/spi/description.tex}
> +\input{device-types/rtc/description.tex}
>  
>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  
> diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> new file mode 100644
> index 000000000000..5d8cf91a6991
> --- /dev/null
> +++ b/device-types/rtc/description.tex
> @@ -0,0 +1,428 @@
> +\section{RTC Device}\label{sec:Device Types / RTC Device}
> +
> +The RTC (Real Time Clock) device provides information about current
> +time. The device can provide different clocks, e.g.\ for the UTC or TAI
> +time standards, or for physical time elapsed since some past epoch. The
> +driver can read the clocks with simple or more accurate methods.
> +

Can't we avoid to use `can` here and just use present simple?

> +\subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
> +
> +17
> +
> +\subsection{Virtqueues}\label{sec:Device Types / RTC Device / Virtqueues}
> +
> +\begin{description}
> +\item[0] requestq
> +\end{description}
> +
> +The driver enqueues requests to the requestq.
> +
> +\subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
> +
> +No device-specific feature bits are defined yet.
> +
> +\subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
> +
> +There is no configuration data for the device.
> +
> +\subsection{Device Initialization}\label{sec:Device Types / RTC Device / Device Initialization}
> +
> +The device determines the set of clocks. The device can provide zero or
> +more clocks.

I think you can avoid to use `can` here and also in other places.

> +
> +\subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Operation}
> +
> +For the requestq, the driver sends a message with a request, and
> +receives the response in the device-writable part of the message. The
> +requestq uses common request and response headers.
> +
> +\begin{lstlisting}
> +/* common request header */
> +struct virtio_rtc_req_head {
> +        le16 msg_type;
> +        u8 reserved[6];
> +};
> +
> +/* common response header */
> +struct virtio_rtc_resp_head {
> +        u8 status;
> +        u8 reserved[7];
> +};
> +\end{lstlisting}
> +
> +The \field{msg_type} field identifies the message type.
> +
> +The \field{status} field indicates whether the device successfully
> +executed the request. The device sets the \field{status} field to one of
> +the following values:
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_S_OK         0
> +#define VIRTIO_RTC_S_EOPNOTSUPP 2
> +#define VIRTIO_RTC_S_ENODEV     3
> +#define VIRTIO_RTC_S_EINVAL     4
> +#define VIRTIO_RTC_S_EIO        5
> +\end{lstlisting}
> +
> +VIRTIO_RTC_S_OK indicates that the device successfully executed the
> +request.
> +
> +If \field{status} is not VIRTIO_RTC_S_OK, the value of other response
> +fields is undefined.
> +
> +VIRTIO_RTC_S_EOPNOTSUPP indicates that the device could not execute the
> +specific request due to an implementation limitation. The device also
> +returns status VIRTIO_RTC_S_EOPNOTSUPP for requests with unknown values
> +in the fields \field{msg_type} or \field{hw_counter}.
> +
> +VIRTIO_RTC_S_ENODEV indicates that the \field{clock_id} field value
> +supplied with the request does not identify a clock.
> +
> +VIRTIO_RTC_S_EINVAL indicates that
> +
> +\begin{itemize}
> +\item the driver request values are not allowed by the specification or
> +\item the device read-only part of the message, or the device write-only
> +        part of the message, is too small to fit the actual message.
> +\end{itemize}
> +
> +VIRTIO_RTC_S_EIO indicates that the device did not execute the request
> +due to an error which was not caused by invalid input from the driver.

s/was/is

> +
> +All \field{reserved} fields are written as zero, and their value is
> +ignored.
> +
> +The set of clocks does not change after feature negotiation completion,
> +until device reset. The set of clocks should not change on device reset
> +either (similar to negotiated features). Clock identifiers are
> +zero-based, dense indices. All fields named \field{clock_id} contain
> +clock identifiers.
> +
> +\subsubsection{Common Definitions}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions}
> +
> +This section makes common definitions.
> +
> +\paragraph{Clock Types}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions / Clock Types}
> +
> +The following clock types are defined:
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_CLOCK_UTC                    0
> +#define VIRTIO_RTC_CLOCK_TAI                    1
> +#define VIRTIO_RTC_CLOCK_MONOTONIC              2
> +#define VIRTIO_RTC_CLOCK_UTC_SMEARED            3
> +#define VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED      4
> +\end{lstlisting}
> +
> +\begin{description}
> +
> +\item[VIRTIO_RTC_CLOCK_UTC] uses the UTC (Coordinated Universal Time)
> +        time standard. This clock uses the time epoch of January 1,
> +        1970, 00:00 UTC. This is the same epoch as \emph{Unix time}. The
> +        clock's seconds since the epoch are related to UTC time as
> +        defined by \hyperref[intro:EPOCH]{EPOCH}.
> +
> +        This clock observes positive and negative leap seconds as
> +        announced by standard bodies. At the start of leap seconds, the
> +        clock steps accordingly.
> +
> +\item[VIRTIO_RTC_CLOCK_TAI] uses the TAI (International Atomic Time)
> +        time standard. This clock uses the time epoch of January 1,
> +        1970, 00:00 TAI.
> +
> +\item[VIRTIO_RTC_CLOCK_MONOTONIC] uses monotonic physical time (SI
> +        seconds subdivisions) since some unspecified epoch. The epoch is
> +        before or during device reset.
> +
> +\item[VIRTIO_RTC_CLOCK_UTC_SMEARED] deviates from the UTC standard by
> +        smearing time in the vicinity of a leap second. This avoids
> +        clock steps due to UTC leap seconds. Otherwise, this clock is
> +        similar to VIRTIO_RTC_CLOCK_UTC.
> +
> +\item[VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED] This clock
> +
> +\begin{itemize}
> +\item may deviate from the UTC standard by smearing time in the vicinity
> +        of a leap second (similar to VIRTIO_RTC_CLOCK_UTC_SMEARED), or
> +
> +\item may step at the start of leap seconds like VIRTIO_RTC_CLOCK_UTC.
> +\end{itemize}
> +
> +A clock of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED can change this
> +behavior for every leap second.
> +
> +\end{description}
> +
> +In the following, \emph{UTC-like clock} designates any clock of type
> +VIRTIO_RTC_CLOCK_UTC, VIRTIO_RTC_CLOCK_UTC_SMEARED, or
> +VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED.
> +
> +Additional clock types may be standardized in the future.
> +Implementation-specific definitions of clock types are not recommended.
> +Implementation-specific definitions use ids between 0xF0 and 0xFF.
> +
> +\paragraph{Smearing Variants}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions / Smearing Variants}
> +
> +Leap second \emph{smearing variants} describe the deviation from the UTC
> +standard in the vicinity of a leap second. The following smearing
> +variants are currently defined:
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_SMEAR_UNSPECIFIED    0
> +#define VIRTIO_RTC_SMEAR_NOON_LINEAR    1
> +#define VIRTIO_RTC_SMEAR_UTC_SLS        2
> +\end{lstlisting}
> +
> +\begin{description}
> +
> +        \item[VIRTIO_RTC_SMEAR_UNSPECIFIED] means that it is unspecified
> +                how time is smeared in the vicinity of leap seconds.
> +
> +        \item[VIRTIO_RTC_SMEAR_NOON_LINEAR] specifies a linear smear
> +                from noon prior to the leap second until noon after the
> +                leap second.
> +
> +        \item[VIRTIO_RTC_SMEAR_UTC_SLS] specifies a linear smear as per
> +                the \hyperref[intro:UTC-SLS]{UTC-SLS} proposal.
> +
> +\end{description}
> +
> +Clocks of type VIRTIO_RTC_CLOCK_UTC_SMEARED always behave according to a
> +smearing variant. The smearing variant does not change over the clock's
> +lifetime.
> +
> +For clocks of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED, it is unspecified
> +whether leap seconds are smeared, and how leap seconds are smeared.
> +
> +Additional smearing variants may be standardized in the future.
> +Implementation-specific definitions of smearing variants are not
> +recommended. Implementation-specific definitions use ids greater than or
> +equal to 0xF0.
> +
> +In the following, \emph{leap smearing clock} designates
> +
> +\begin{itemize}
> +
> +\item any clock of type VIRTIO_RTC_CLOCK_UTC_SMEARED
> +
> +\item any clock of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED at any time
> +        when the clock is smearing a leap second.
> +
> +\end{itemize}
> +
> +\paragraph{Hardware Counters}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions / Hardware Counters}
> +
> +The following hardware counter identifiers are specified:
> +
> +\begin{lstlisting}
> +/* Arm Generic Timer Counter-timer Virtual Count Register (CNTVCT_EL0) */
> +#define VIRTIO_RTC_COUNTER_ARM_VCT      0
> +/* x86 Time-Stamp Counter */
> +#define VIRTIO_RTC_COUNTER_X86_TSC      1
> +/* Invalid */
> +#define VIRTIO_RTC_COUNTER_INVALID   0xFF
> +\end{lstlisting}
> +
> +Additional hardware counter identifiers may be standardized in the
> +future. Implementation-specific hardware counter identifiers are not
> +recommended. Implementation-specific hardware counter identifiers have
> +values between 0xF0 and 0xFE.
> +
> +\subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Operation / Control Requests}
> +
> +Through \emph{control requests}, the driver requests information about
> +the device capabilities. The driver enqueues control requests in the
> +requestq.
> +
> +\begin{description}
> +
> +\item[VIRTIO_RTC_REQ_CFG] discovers the number of clocks.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_REQ_CFG 0x1000 /* message type */
> +
> +struct virtio_rtc_req_cfg {
> +        struct virtio_rtc_req_head head;
> +        /* no request params */
> +};
> +
> +struct virtio_rtc_resp_cfg {
> +        struct virtio_rtc_resp_head head;
> +        le16 num_clocks;
> +        u8 reserved[6];
> +};
> +\end{lstlisting}
> +
> +Field \field{num_clocks} contains the number of clocks. A device
> +provides zero or more clocks. Valid clock ids are those smaller than
> +\field{num_clocks}.
> +
> +\item[VIRTIO_RTC_REQ_CLOCK_CAP] discovers the capabilities of the clock
> +identified by the \field{clock_id} field.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_REQ_CLOCK_CAP 0x1001 /* message type */
> +
> +struct virtio_rtc_req_clock_cap {
> +        struct virtio_rtc_req_head head;
> +        le16 clock_id;
> +        u8 reserved[6];
> +};
> +
> +struct virtio_rtc_resp_clock_cap {
> +        struct virtio_rtc_resp_head head;
> +        u8 type;
> +        u8 leap_second_smearing;
> +        u8 reserved[6];
> +};
> +\end{lstlisting}
> +
> +The \field{type} field identifies the clock type. A device provides
> +zero or more clocks for a clock type.
> +
> +Clocks of type VIRTIO_RTC_CLOCK_UTC_SMEARED indicate the \emph{smearing
> +variant} through field \field{leap_second_smearing}. All other clocks
> +set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
> +
> +\item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
> +cross-timestamping for a particular pair of clock and hardware counter.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_REQ_CROSS_CAP 0x1002 /* message type */
> +
> +struct virtio_rtc_req_cross_cap {
> +        struct virtio_rtc_req_head head;
> +        le16 clock_id;
> +        u8 hw_counter;
> +        u8 reserved[5];
> +};
> +
> +
> +struct virtio_rtc_resp_cross_cap {
> +        struct virtio_rtc_resp_head head;
> +#define VIRTIO_RTC_FLAG_CROSS_CAP       (1 << 0)
> +        u8 flags;
> +        u8 reserved[7];
> +};
> +\end{lstlisting}
> +
> +The \field{clock_id} field identifies the clock, and the
> +\field{hw_counter} field identifies the hardware counter, for which
> +cross-timestamp support is probed. The device sets the
> +VIRTIO_RTC_FLAG_CROSS_CAP flag in the \field{flags} field if the clock
> +supports cross-timestamping for the particular clock and hardware
> +counter, and clears the flag otherwise.
> +
> +\end{description}
> +
> +\subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Operation / Read Requests}
> +
> +Through \emph{read requests}, the driver requests clock readings from
> +the device. The driver enqueues read requests in the requestq. The
> +device obtains device-side clock readings and forwards these clock
> +readings to the driver. The driver may enhance and interpret the clock
> +readings through methods which are beyond the scope of this
> +specification.
> +
> +Once DRIVER_OK has been set, the device should support reading every
> +clock, even when a clock may yet have to be aligned to reference time
> +sources.
> +
> +In general,
> +
> +\begin{itemize}
> +\item clocks may jump backwards or forward, and
> +\item the clock frequency may change. Clocks may be \emph{slewed},
> +        i.e.\ clocks may run at a frequency other than their current
> +        best frequency estimate.
> +\end{itemize}
> +
> +As long as a clock does not jump backwards, the driver clock readings
> +through read request responses increase monotonically:
> +
> +\begin{itemize}
> +\item As long as a clock does not jump backwards in-between device-side
> +        clock readings, the driver-side readings for that clock increase
> +        monotonically as well, in the order in which the driver
> +        marks read requests as available.
> +
> +\item The device marks read requests for the same clock as used in
> +        the order in which the messages were marked as available.
> +\end{itemize}
> +
> +For a clock of type VIRTIO_RTC_CLOCK_MONOTONIC, the device always returns
> +monotonically increasing clock readings through read request responses.
> +
> +The unit of all \field{clock_reading} fields is 1
> +nanosecond.\footnote{For time epochs in year 1970 or later, this means
> +that time until at least year 2553 can be represented in the \field{le64
> +clock_reading} fields.}
> +
> +\begin{description}
> +
> +\item[VIRTIO_RTC_REQ_READ] reads the clock identified by the
> +\field{clock_id} field. The device supports this message for every
> +clock.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_REQ_READ 0x0001 /* message type */
> +
> +struct virtio_rtc_req_read {
> +        struct virtio_rtc_req_head head;
> +        le16 clock_id;
> +        u8 reserved[6];
> +};
> +
> +struct virtio_rtc_resp_read {
> +        struct virtio_rtc_resp_head head;
> +        le64 clock_reading;
> +};
> +\end{lstlisting}
> +
> +\field{clock_reading} is a device-side clock reading obtained after the
> +message was marked as available.

s/was/is

> +
> +\item[VIRTIO_RTC_REQ_READ_CROSS] returns a cross-timestamp for the clock
> +identified by the \field{clock_id} field.\footnote{Cross-timestamping
> +is similar to the ptp_kvm mechanism in the Linux kernel.} This message
> +may yield better performance than using VIRTIO_RTC_REQ_READ.
> +
> +The driver can determine whether the device supports
> +VIRTIO_RTC_REQ_READ_CROSS for a specific clock and \field{hw_counter}
> +through VIRTIO_RTC_REQ_CROSS_CAP.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_REQ_READ_CROSS 0x0002 /* message type */
> +
> +struct virtio_rtc_req_read_cross {
> +        struct virtio_rtc_req_head head;
> +        le16 clock_id;
> +        u8 hw_counter;
> +        u8 reserved[5];
> +};
> +
> +struct virtio_rtc_resp_read_cross {
> +        struct virtio_rtc_resp_head head;
> +        le64 clock_reading;
> +        le64 counter_cycles;
> +};
> +\end{lstlisting}
> +
> +The \field{hw_counter} field specifies the hardware counter for which
> +the driver requests a cross-timestamp.
> +
> +Cross-timestamping returns a \field{clock_reading}, and an associated
> +hardware counter value, \field{counter_cycles}. The
> +\field{counter_cycles} field is the approximate or precise value which
> +the driver would have read at the \field{clock_reading} time instant
> +from the hardware counter identified by \field{hw_counter}. How the
> +device determines the value which the driver would have seen is beyond
> +the scope of this specification. In case hardware counter reads differ
> +among CPUs used by the driver, the device should assume that the driver
> +reads the hardware counter from the CPU which the driver enumerates as
> +the first.
> +
> +The hardware counter identifiers are defined in
> +\ref{sec:Device Types / RTC Device / Device Operation / Common Definitions / Hardware Counters}.
> +
> +\end{description}
> diff --git a/introduction.tex b/introduction.tex
> index e60298a4d78b..34f9485bc393 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -168,6 +168,12 @@ \section{Normative References}\label{sec:Normative References}
>      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP
>      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
>          \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
> +	\phantomsection\label{intro:EPOCH}\textbf{[EPOCH]} &
> +    POSIX.1-2024, Base Definitions, Seconds Since the Epoch
> +	\newline\url{https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap04.html#tag_04_19}\\
> +	\phantomsection\label{intro:UTC-SLS}\textbf{[UTC-SLS]} &
> +    UTC with Smoothed Leap Seconds (UTC-SLS)
> +	\newline\url{https://www.cl.cam.ac.uk/~mgk25/time/utc-sls/}\\
>  \end{longtable}
>  
>  \section{Non-Normative References}
> -- 
> 2.43.0
> 

