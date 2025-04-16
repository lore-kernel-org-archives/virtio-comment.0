Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59EE207E0C
	for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 15:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818131; cv=none; b=cHM9s/o4fcRtomrN9wI67UmHFCsWYfQ4gNMLx1zBrTbYnfTOz7l/IXHnmzAjXCGF++6gAmWG83UmODifIUg3241qFfHSCvTMb4vdlkPSb7PLBgM4CDU1Y1ITgkhrsQUPpmtkCdXdkodwXbIyBWrEivZSXBXblknPJVBxw4UauiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818131; c=relaxed/simple;
	bh=qONyVEulnLTlsMsPLF1I8R/bpaWLTzWnqVQJFvuIfG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cAKHFpK5S+lbwmVYfBuvMOhaLGawlnOLiEz+Nxcgka3c1hLu2wYqiM+uRKDrxIknyzK5UvzzmwH5BsGJjCO5fXkNXZlN8vYF9+lhVq9A27k5RZg9GR+qZbGURXRsZInOo9EzMYc8RmJaOwl7DuS96gRidhmbU7sij3RsRoisWE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TV/6rfIZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TV/6rfIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744818127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ix51uoFdjJDee5Zgt1DRBFUs2xYXYweddHDKznUv6FY=;
	b=TV/6rfIZyCE/Zh3zhGvAk8/+bLXSFXwIbE3I5stfPfYycGvwYZjC6PsqoEaWcyCPoTb2A8
	wTPOVb6lFX95BBmRXlPb4dQ2LFlgK3Ff8/idsNIm+aFmX4deKsaLg+4l1BqvrBIYlChLxg
	fsU1Pf302Hs6JDc44lhS4EkxVxEjUr0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-HqQECdcaPimhATRVFEAq7g-1; Wed, 16 Apr 2025 11:42:06 -0400
X-MC-Unique: HqQECdcaPimhATRVFEAq7g-1
X-Mimecast-MFC-AGG-ID: HqQECdcaPimhATRVFEAq7g_1744818125
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-44059976a1fso5239805e9.1
        for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 08:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818125; x=1745422925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ix51uoFdjJDee5Zgt1DRBFUs2xYXYweddHDKznUv6FY=;
        b=KXiKjGhd32VnUgTN5sC9Tqo+RwvGGR6hq6Fcxss42ZvCM6zJTWExAfjuVAQkYFYG9Q
         MSFlXx22od5G0+Ytp29ihDkZEufxm38hDtKG0+a/v0BcAz30geREB/QXArbPwHqJVEL+
         doFwkBUxGn5JsNg2QAtuk8LRGyFkJ9mzghJUhUutIs/4Jgqg1kLfsVhv4sqIcFHXLAmh
         K4WaOhMWioy5Gc3tOUpRu/1p69K0mz9COAaaGT4i5cEBKlHZ82oicebn99mb+iNUqjbT
         a9Rlaush5sXPviSOOEQX8320ZOioJwkIlUWERQAnNNRWbVZp11gfjyeiNa4EZroxbB0P
         YBPA==
X-Gm-Message-State: AOJu0YzTj0FnlhoKqyYYFFBwB0TV67cakyzmpU2j3X/ulvsqgzvStKYg
	O4Wqd5Y1JMHFcvlT6n5c1Bq/mcLtYvk85+hc4BT4EcfNqb0/TgrWaz+ZEGoOCZYLShagCR63jji
	gRNzG+hBkSPa+EOIb99aCw+9hcEWyol4OH3H8lA3COGjZYaZqzEE4D8Bz4Jw3fEPv
X-Gm-Gg: ASbGncvxw+hayN50pRSlh4UjWGQo+Vr0MWTHoJRzIz1XwTv42T9dQ/OUb4pFCX7cTkP
	bVLl9GifI+VSTr1XpzBBSWpluSebtVdVN5UrsNj2NFzTL3l28O/cVNUblKpTKFINzp6/LEniYr0
	Xvgn+XQomnJAlEAuPOXwhJ+UlxMvc+vvT4Vx0dMp9QYMU1kUuRDUemhnCMvDZnyzvJEPepBEibr
	LT1o1aE/nfSvQDMCPW8/ZDS/72qWcinxvinek0eN1onb/MadBGtPLLVi4Fu4KjfmDmamU2tSkvn
	FUd9Ag==
X-Received: by 2002:a05:600c:3151:b0:43b:b756:f0a9 with SMTP id 5b1f17b1804b1-4405d61d03cmr24523765e9.11.1744818124815;
        Wed, 16 Apr 2025 08:42:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXA5bGt28L3dYWF8SYm4gebUdkiNTTqwFBqS9ophu4JpDn6olsZW6/9mBXx426x7sEt7/zgA==
X-Received: by 2002:a05:600c:3151:b0:43b:b756:f0a9 with SMTP id 5b1f17b1804b1-4405d61d03cmr24523425e9.11.1744818124244;
        Wed, 16 Apr 2025 08:42:04 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c817dsm24394845e9.4.2025.04.16.08.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:42:03 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:42:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH v8 2/4] virtio-rtc: Add initial normative statements
Message-ID: <20250416113450-mutt-send-email-mst@kernel.org>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <20250306095112.1293-3-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250306095112.1293-3-quic_philber@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pdi84zPZERzwKzWDcPrK-9AmLT6PB_XXDRLRRSC8jgQ_1744818125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 06, 2025 at 10:51:10AM +0100, Peter Hilber wrote:
> Add the normative statements for the initial device specification.
> 
> Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> ---
> 
> Notes:
>     v8:
>     
>     - Drop requirement to ignore reserved fields in the device-readable part
>       of the message (Matias Ezequiel Vara Larsen).
>     
>     - Drop requirement about returning same status in response to identical
>       requests (Matias Ezequiel Vara Larsen).
>     
>     - Reword requirements about size mismatches for device
>       read-only/write-only parts of the message (Matias Ezequiel Vara
>       Larsen).
>     
>     - Change word order from "field X" to "the X field" (Matias Ezequiel
>       Vara Larsen).
>     
>     v7:
>     
>     - Remove obsolete requirements for leap second indication.
>     
>     v6:
>     
>     - Update requirements to make leap second status information optional if
>       if the clock smears (or might smear) leap seconds.
>     
>     - Allow indicating VIRTIO_RTC_SMEAR_UNSPECIFIED for
>       VIRTIO_RTC_CLOCK_SMEARED.
>     
>     - Shorten some requirements by omitting redundant information.
>     
>     v5:
>     
>     - Update normative statements to match v5 changes to non-normative
>       statements (patch 1).
>     
>     v4:
>     
>     - Require driver to set unused flags to zero.
>     
>     - Update normative statements to match v4 changes to non-normative
>       statements (patch 1).
>     
>     - Improve formatting.
> 
>  conformance.tex                         |   2 +
>  device-types/rtc/description.tex        | 272 +++++++++++++++++++++++-
>  device-types/rtc/device-conformance.tex |   9 +
>  device-types/rtc/driver-conformance.tex |   9 +
>  4 files changed, 288 insertions(+), 4 deletions(-)
>  create mode 100644 device-types/rtc/device-conformance.tex
>  create mode 100644 device-types/rtc/driver-conformance.tex
> 
> diff --git a/conformance.tex b/conformance.tex
> index d92a2369488e..4ce86a525e84 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -162,6 +162,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \input{device-types/pmem/driver-conformance.tex}
>  \input{device-types/can/driver-conformance.tex}
>  \input{device-types/spi/driver-conformance.tex}
> +\input{device-types/rtc/driver-conformance.tex}
>  
>  \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
>  
> @@ -254,6 +255,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \input{device-types/pmem/device-conformance.tex}
>  \input{device-types/can/device-conformance.tex}
>  \input{device-types/spi/device-conformance.tex}
> +\input{device-types/rtc/device-conformance.tex}
>  
>  \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
>  A conformant implementation MUST be either transitional or
> diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> index 5d8cf91a6991..f2a3907de511 100644
> --- a/device-types/rtc/description.tex
> +++ b/device-types/rtc/description.tex
> @@ -73,7 +73,7 @@ \subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Opera
>  VIRTIO_RTC_S_EOPNOTSUPP indicates that the device could not execute the
>  specific request due to an implementation limitation. The device also
>  returns status VIRTIO_RTC_S_EOPNOTSUPP for requests with unknown values
> -in the fields \field{msg_type} or \field{hw_counter}.
> +in the \field{msg_type} or \field{hw_counter} fields.
>  
>  VIRTIO_RTC_S_ENODEV indicates that the \field{clock_id} field value
>  supplied with the request does not identify a clock.
> @@ -98,6 +98,106 @@ \subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Opera
>  zero-based, dense indices. All fields named \field{clock_id} contain
>  clock identifiers.
>  
> +\drivernormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
> +
> +If the \field{struct virtio_rtc_resp_head} field \field{status} is not
> +VIRTIO_RTC_S_OK, the driver MUST NOT interpret response fields other
> +than \field{status}.
> +
> +The driver MUST set \emph{reserved} fields in the device-readable part
> +of the message to zero.
> +
> +The driver MUST set unnamed bits in \emph{flags} fields in the
> +device-readable part of the message to zero.


This is problematic, it should depend on features negotiated
not on features listed in the spec as we will not
remember to change this and break drivers.
Just add in the description explanation which flags are legal for each request,
then refer to that.


> +
> +The driver MUST NOT interpret \emph{reserved} fields in the
> +device-writable part of the message.
> +
> +The driver MUST NOT interpret unnamed bits in \emph{flags} fields in the
> +device-writable part of the message.

same though a bit less of a problem here.


> +
> +The driver MUST put the request into the device-readable part of the
> +message.
> +
> +The driver MUST allocate enough space for the response in the
> +device-writable part of a requestq message.
> +
> +\devicenormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_OK if the device successfully
> +executed the request.
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to a status other than VIRTIO_RTC_S_OK if the
> +device did not successfully execute the request.
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP if the device could not
> +execute the specific request due to an implementation limitation.
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP for a request with a
> +value of the \field{msg_type} field which is not described in this
> +specification.
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP for a request with a
> +value of the \field{hw_counter} field which is neither described in this
> +specification nor otherwise known to the implementation.
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_ENODEV if the \field{clock_id}
> +field value supplied with the request does not identify a clock.
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_EINVAL if the request values are
> +inconsistent with the specification and if the inconsistence is not
> +described by the requirements which stipulate status
> +VIRTIO_RTC_S_EOPNOTSUPP or VIRTIO_RTC_S_ENODEV.
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_EINVAL if the request specified in
> +the request header through the \field{msg_type} field does not fit into
> +the device read-only part of the actual message.
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_EINVAL if the response specified in
> +the request header through the \field{msg_type} field does not fit into
> +the device write-only part of the actual message, unless the
> +\field{status} field does not fit into the device write-only part.
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST NOT set the
> +\field{status} field if the \field{status} field does not fit into the
> +device write-only part.
> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_EIO if none of the previous
> +requirements in this document stipulated another \field{status}.
> +
> +If the device read-only part of a message M is bigger than the size of
> +the request specified for message M, the device MUST ignore the
> +additional space.
> +
> +If the device write-only part of a message M is bigger than the size of
> +the response specified for message M, the device MUST ignore the
> +additional space.
> +
> +The device MUST set \emph{reserved} fields in the device-writable part
> +of the message to zero.
> +
> +The device MUST set unnamed bits in \emph{flags} fields in the
> +device-writable part of the message to zero.
> +
> +After feature negotiation completion the device MUST NOT change the set
> +of clocks until device reset.
> +
> +The device SHOULD NOT change the set of clocks on a device reset after
> +the first device reset.

really SHUOLD is more appropriate

and first in what sense? here is the text for features:


	If a device has successfully negotiated a set of features 
	at least once (by accepting the FEATURES_OK \field{device 
	status} bit during device initialization), then it SHOULD
	NOT fail re-negotiation of the same set of features after
	a device or system reset.  Failure to do so would interfere
	with resuming from suspend and error recovery.

do something similar and be specific pls.



> +
> +The device MUST use non-negative integers, which are smaller than the
> +number of clocks, as clock identifiers.
> +
>  \subsubsection{Common Definitions}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions}
>  
>  This section makes common definitions.
> @@ -253,7 +353,7 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
>  };
>  \end{lstlisting}
>  
> -Field \field{num_clocks} contains the number of clocks. A device
> +The \field{num_clocks} field contains the number of clocks. A device
>  provides zero or more clocks. Valid clock ids are those smaller than
>  \field{num_clocks}.
>  
> @@ -281,8 +381,8 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
>  zero or more clocks for a clock type.
>  
>  Clocks of type VIRTIO_RTC_CLOCK_UTC_SMEARED indicate the \emph{smearing
> -variant} through field \field{leap_second_smearing}. All other clocks
> -set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
> +variant} through the \field{leap_second_smearing} field. All other
> +clocks set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
>  
>  \item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
>  cross-timestamping for a particular pair of clock and hardware counter.
> @@ -315,6 +415,103 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
>  
>  \end{description}
>  
> +\drivernormative{\paragraph}{Control Requests}{Device Types / RTC Device / Device Operation / Control Requests}
> +
> +For VIRTIO_RTC_REQ_CROSS_CAP, the driver MUST set \field{hw_counter} to
> +one of the hardware counter identifiers defined in this specification,
> +or to a value between 0xF0 and 0xFE.
> +
> +\devicenormative{\paragraph}{Control Requests}{Device Types / RTC Device / Device Operation / Control Requests}
> +
> +For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the UTC
> +time standard (Coordinated Universal Time).
> +
> +For any clock of type VIRTIO_RTC_CLOCK_UTC_SMEARED or
> +VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED, the device MUST use the UTC time
> +standard, insofar as the following requirements do not say otherwise.
> +
> +For any UTC-like clock, the device MUST use the time epoch of January 1,
> +1970, 00:00 UTC.
> +
> +For any UTC-like clock, the device MUST count seconds since the epoch
> +according to \hyperref[intro:EPOCH]{EPOCH}.
> +
> +For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST apply a
> +positive leap second according to the UTC time standard by
> +instantaneously stepping the clock backwards by 1 s at the start of the
> +leap second.
> +
> +For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST apply a
> +negative leap second according to the UTC time standard by
> +instantaneously stepping the clock forward by 1 s at the start of the
> +leap second.
> +
> +For any leap smearing clock, the device MUST NOT step the clock due to a
> +leap second.
> +
> +For any leap smearing clock, on a positive leap second, the device MUST
> +slow down the clock during part of the day containing the leap second
> +and/or part of the day after the leap second.
> +
> +For any leap smearing clock, on a negative leap second, the device MUST
> +speed up the clock during part of the day containing the leap second
> +and/or part of the day after the leap second.
> +
> +For any clock with smearing variant VIRTIO_RTC_SMEAR_NOON_LINEAR, on a
> +leap second, the device MUST change the frequency of the clock exactly
> +from noon prior to the leap second until noon after the leap second.
> +
> +For any clock with smearing variant VIRTIO_RTC_SMEAR_NOON_LINEAR, while
> +changing the frequency of the clock due to a positive leap second, the
> +device MUST decrease the frequency of the clock by $1/86400$.
> +
> +For any clock with smearing variant VIRTIO_RTC_SMEAR_NOON_LINEAR, while
> +changing the frequency of the clock due to a negative leap second, the
> +device MUST increase the frequency of the clock by $1/86400$.
> +
> +For any clock with smearing variant VIRTIO_RTC_SMEAR_UTC_SLS, on a leap
> +second, the device MUST change the frequency of the clock exactly during
> +the last 1000 seconds of the day with the leap second.
> +
> +For any clock with smearing variant VIRTIO_RTC_SMEAR_UTC_SLS, while
> +changing the frequency of the clock due to a positive leap second, the
> +device MUST decrease the frequency of the clock by 0.1\%.
> +
> +For any clock with smearing variant VIRTIO_RTC_SMEAR_UTC_SLS, while
> +changing the frequency of the clock due to a negative leap second, the
> +device MUST increase the frequency of the clock by 0.1\%.
> +
> +For any clock of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED, the device MAY
> +deviate from the UTC standard with respect to leap second introduction.
> +
> +For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the TAI
> +time standard (International Atomic Time).
> +
> +For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the time
> +epoch of January 1, 1970, 00:00 TAI.
> +
> +For any clock of type VIRTIO_RTC_CLOCK_MONOTONIC, the device MUST use SI
> +seconds subdivisions.
> +
> +For any clock of type VIRTIO_RTC_CLOCK_MONOTONIC, the device MUST use an
> +epoch at a time instant before or during device reset.
> +
> +For VIRTIO_RTC_REQ_CLOCK_CAP, and clock types other than
> +VIRTIO_RTC_CLOCK_UTC_SMEARED, the device MUST set the
> +\field{leap_second_smearing} field to VIRTIO_RTC_SMEAR_UNSPECIFIED.
> +
> +For VIRTIO_RTC_REQ_CLOCK_CAP, and clock type
> +VIRTIO_RTC_CLOCK_UTC_SMEARED, the device MUST set the
> +\field{leap_second_smearing} field to VIRTIO_RTC_SMEAR_UNSPECIFIED,
> +VIRTIO_RTC_SMEAR_NOON_LINEAR, VIRTIO_RTC_SMEAR_UTC_SLS, or to a value
> +greater than or equal to 0xF0.
> +
> +For a VIRTIO_RTC_REQ_CROSS_CAP message M, the device MUST set the
> +VIRTIO_RTC_FLAG_CROSS_CAP flag in the \field{flags} field if the device
> +would respond to a VIRTIO_RTC_REQ_READ_CROSS message with the same
> +\field{hw_counter} and \field{clock_id} values as in M with status
> +VIRTIO_RTC_S_OK, and clear the flag otherwise.
> +
>  \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Operation / Read Requests}
>  
>  Through \emph{read requests}, the driver requests clock readings from
> @@ -426,3 +623,70 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
>  \ref{sec:Device Types / RTC Device / Device Operation / Common Definitions / Hardware Counters}.
>  
>  \end{description}
> +
> +\drivernormative{\paragraph}{Read Requests}{Device Types / RTC Device / Device Operation / Read Requests}
> +
> +For VIRTIO_RTC_REQ_READ_CROSS, the driver MUST set \field{hw_counter} to
> +one of the hardware counter identifiers defined in this specification,
> +or to a value between 0xF0 and 0xFE.
> +
> +\devicenormative{\paragraph}{Read Requests}{Device Types / RTC Device / Device Operation / Read Requests}
> +
> +The device SHOULD continuously support reading of all clocks once
> +DRIVER_OK has been set.
> +
> +For any clock C and read requests \emph{A} and \emph{B} which read C,
> +\emph{A} being the message which the driver marks as available before
> +\emph{B}, the device MUST obtain the \field{clock_reading} value for the
> +message \emph{A} response before the \field{clock_reading} value for the
> +message \emph{B} response, or the device MUST obtain the same
> +\field{clock_reading} value for both \emph{A} and \emph{B}.
> +
> +For any clock C, the device MUST mark all read requests reading C as
> +used in the total order in which the driver marked these messages as
> +available.
> +
> +For any clock C of type VIRTIO_RTC_CLOCK_MONOTONIC and read requests
> +\emph{A} and \emph{B} which read C, \emph{A} being the message which the
> +driver marks as available before \emph{B}, the device MUST set the
> +\field{clock_reading} value for the message \emph{B} response to a value
> +greater than or equal to the \field{clock_reading} value for the message
> +\emph{A} response.
> +
> +The device MUST support VIRTIO_RTC_REQ_READ for every clock.
> +
> +For VIRTIO_RTC_REQ_READ and for any clock type listed in this
> +specification, the device MUST use the nanosecond as unit for the
> +\field{clock_reading} field.
> +
> +For read requests, the device MUST obtain the \field{clock_reading}
> +response value after the read request is marked as available.
> +
> +For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set
> +\field{counter_cycles} to a value which approximates the value which the
> +driver would have read from the hardware counter identified by
> +\field{hw_counter} at the time instant when the device read the
> +\field{clock_reading} value.
> +
> +For VIRTIO_RTC_REQ_READ_CROSS, the device SHOULD assume that the driver
> +reads the hardware counter identified by \field{hw_counter} through the
> +CPU which the driver enumerates as the first.
> +
> +For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set \field{status} to a
> +value other than VIRTIO_RTC_S_OK if the device cannot determine the
> +approximate value which the driver would have read from the hardware
> +counter identified by \field{hw_counter} at the time instant when the
> +device read the \field{clock_reading} value.
> +
> +For any clock C, and VIRTIO_RTC_REQ_READ_CROSS messages \emph{A} and
> +\emph{B} which read C and which specify the same hardware counter
> +\emph{H} through the \field{hw_counter} field, \emph{A} being the
> +message which the driver marks as available before \emph{B}, the device
> +MUST set the \field{counter_cycles} value for \emph{B} to a value which
> +\emph{H} shows after the \field{counter_cycles} value of \emph{A}, or
> +the device MUST set the same \field{counter_cycles} value for \emph{A}
> +and \emph{B}.
> +
> +For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in this
> +specification, the device MUST use the nanosecond as unit for the
> +\field{clock_reading} field.
> diff --git a/device-types/rtc/device-conformance.tex b/device-types/rtc/device-conformance.tex
> new file mode 100644
> index 000000000000..4303cd450542
> --- /dev/null
> +++ b/device-types/rtc/device-conformance.tex
> @@ -0,0 +1,9 @@
> +\conformance{\subsection}{RTC Device Conformance}\label{sec:Conformance / Device Conformance / RTC Device Conformance}
> +
> +An RTC device MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{devicenormative:Device Types / RTC Device / Device Operation}
> +\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Control Requests}
> +\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Read Requests}
> +\end{itemize}
> diff --git a/device-types/rtc/driver-conformance.tex b/device-types/rtc/driver-conformance.tex
> new file mode 100644
> index 000000000000..689c18d158d0
> --- /dev/null
> +++ b/device-types/rtc/driver-conformance.tex
> @@ -0,0 +1,9 @@
> +\conformance{\subsection}{RTC Driver Conformance}\label{sec:Conformance / Driver Conformance / RTC Driver Conformance}
> +
> +An RTC driver MUST conform to the following normative statements:
> +
> +\begin{itemize}
> +\item \ref{drivernormative:Device Types / RTC Device / Device Operation}
> +\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Control Requests}
> +\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Read Requests}
> +\end{itemize}
> -- 
> 2.43.0
> 

