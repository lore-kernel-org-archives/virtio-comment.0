Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A170121C9E0
	for <virtio-comment@lists.linux.dev>; Mon, 10 Feb 2025 13:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739195565; cv=none; b=lhUVKwlvDxZzLY5aJLn8q6r4v0tBUDnmcIlE3zZT/OSdfkSR+a/B3CFQ0QWD/k/pm2rVNBn/yfPwiRS/s7CJlLWzD9bqLwtLmpisF1uzPEjKrqiLIVeycri2TftqWkvwD4dCSf/Lkc4/a5grsetU4qPaCopBlXqVCgA1O4y97KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739195565; c=relaxed/simple;
	bh=5V/vntQNFmD/XPjdzr7A0+oNDb7voHuhqmkFFRf9gFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=m6WF8vWDJ8ohKfQIBgKxvlpNhE5KkNSn4zWpbXyV39TMoJhWTpcvz2GCdHRt9tTWiPkGYsZ9Vi0zMMcas9ewyOysqwXXjLdslqhHcPar5HztIurhomI+Qsc90QmLvtbbQLsFg+1VjWMTMfJqBKnKyWNeWSzxoZT/eDzg8D9puXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HJt9yXTt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HJt9yXTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739195561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pzW8Ov78GRRIAidnQpxEL4NucoP+yl027Cccdam2QiM=;
	b=HJt9yXTtQ4vZR/4b956OEzUU+T8mj2yHEtiqaI99drSEXHcdm2FKaszSLPRpCGAYUR9iv1
	ER1yHE1EqMB+pV+FWUekPMeF4quwnjwVhu4IN8JM+XFZ7P/X2mf8EWpvknwHlDhsFwa3PQ
	vqAToYNfPl4cEmVD3+bRYOSepHBB8i8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-HBvCF3R4MbCu1m6T9gJJtg-1; Mon, 10 Feb 2025 08:52:40 -0500
X-MC-Unique: HBvCF3R4MbCu1m6T9gJJtg-1
X-Mimecast-MFC-AGG-ID: HBvCF3R4MbCu1m6T9gJJtg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4393182f0a6so8337815e9.1
        for <virtio-comment@lists.linux.dev>; Mon, 10 Feb 2025 05:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739195557; x=1739800357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzW8Ov78GRRIAidnQpxEL4NucoP+yl027Cccdam2QiM=;
        b=k06AsXeywU4cRP/rhm5u0m8nTdHCLCRF3Q+6UmyCYkgH/s4K9xnwciHFOG4pSMDkcm
         5MBSBhoYDw+iZJdNm22V4bNWEZHYj4ZEgkTZEYv+rpOIPJyM8LAfj3hgkbHfCuTUzSoT
         FfghGz4QTuvJqnbdrXccWQ7f7x9HnoTWatoUtLoWn+EROeQfstAHoZAptbB54mVEi+80
         m6ovWDUgbgheIYLKJr/32Ifa+Z2aME0aFYjwKk+KSWcFGeHEFMbRx2gJ1VtSd3vVN01K
         m41lf1xTctcNBupFkMFB1/qnZ22mzmb6UY0dEc5NUjXYcOrMLRuCGrX6XtJoIqPAz/z8
         huQQ==
X-Gm-Message-State: AOJu0Yw0recmXuyaCfs7Q6u05KuiX5Ootjkq2OW1b/6HVPP15jeFBgql
	Z1BpyOgobdC9EFtbNOjdChX27EGJV+gnE0TtP3SPfHy2nXliLnWHrvm4msgx64r9vwS4DWaa26i
	ndePGQuq7jlHkjmmX7iLI4f97nCCJ+WzlTYi3SwPeHp4y5BayLqYoLyd1Ml1j9qPr
X-Gm-Gg: ASbGncvo0wVD0MXXsGxSvxgcQ62wKKLc7zSV2gxONWrXlraw5UDu+S3Qk7mh3S0K4AZ
	1/LcSOTnGunfZoueqTm/nVXrZndNSqG0N3l1Hh24FGs4D2p4et8Qcq7vyxzIuFSWWLyrLH/PMzM
	k5xZo30QEh/wWXx5I9d025zgUpeB0Ql+3m4w5bDQDvuzHGWUmFDpUOGUbWJkdieLiSfMRKnArFj
	r5thur5kEp/lPwNBua6e1Rb9aA65Fv+xL1c0PD+Fanl+7RviA8dumSEIh29CyZSKuelCpYtvdk=
X-Received: by 2002:a05:600c:5351:b0:439:3159:c33d with SMTP id 5b1f17b1804b1-4393159c5abmr69480035e9.13.1739195556578;
        Mon, 10 Feb 2025 05:52:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmO0JYYP5WrRjF4B29ilxnxWipQoiHmamHxzpG3DeUe1sC1f5Xbf0Ek1/0NZn5YEYd5WtiXQ==
X-Received: by 2002:a05:600c:5351:b0:439:3159:c33d with SMTP id 5b1f17b1804b1-4393159c5abmr69479695e9.13.1739195555967;
        Mon, 10 Feb 2025 05:52:35 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43936bcc04fsm71562665e9.20.2025.02.10.05.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 05:52:35 -0800 (PST)
Date: Mon, 10 Feb 2025 14:52:33 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Subject: Re: [PATCH v7 1/4] virtio-rtc: Add initial device specification
Message-ID: <Z6oEocvjwSsPmVxz@fedora>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-2-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250123101616.664-2-quic_philber@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mUmJKCQ1qZr0ep3D9hJv2VZwnDnRSPLaxUgv-MyE6mA_1739195559
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 23, 2025 at 11:16:12AM +0100, Peter Hilber wrote:
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
>  device-types/rtc/description.tex | 426 +++++++++++++++++++++++++++++++
>  introduction.tex                 |   6 +
>  3 files changed, 434 insertions(+), 1 deletion(-)
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
> index 000000000000..aae015690b26
> --- /dev/null
> +++ b/device-types/rtc/description.tex
> @@ -0,0 +1,426 @@
> +\section{RTC Device}\label{sec:Device Types / RTC Device}
> +
> +The RTC (Real Time Clock) device provides information about current
> +time. The device can provide different clocks, e.g.\ for the UTC or TAI
> +time standards, or for physical time elapsed since some past epoch. The
> +driver can read the clocks with simple or more accurate methods.
> +
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
> +\item the device read-only part of the message, or device write-only
> +        part of the message, is too small.
> +\end{itemize}
> +
> +VIRTIO_RTC_S_EIO indicates that the device did not execute the request
> +due to an error which was not caused by invalid input from the driver.
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
> +Implementation-specific definitions of clock types are not recommended
> +and use ids between 0xF0 and 0xFF.

Do you mean that ids between 0xF0 and 0xFF are not recommended?

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
> +recommended and use ids greater than or equal to 0xF0.

Like the question above, It is not clear to me if `ids greater than or
equal to 0xF0` are not recommended.

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
> +recommended and have values between 0xF0 and 0xFE.
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
> +cross-timestamp support is probed. The device sets flag
> +VIRTIO_RTC_FLAG_CROSS_CAP in the \field{flags} field if the clock
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
Should it not be `MUST` here?

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
> 

