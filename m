Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2612580C8
	for <virtio-comment@lists.linux.dev>; Mon, 10 Feb 2025 16:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205202; cv=none; b=IveIc80imiOaXtcO5mtq5KHGhAhUJ6wLYIWBznfE9E8ipK9yZTwaxRn0G+zyCkhWoTPVHGN1qQyoFPVmdejIVVFAscb60V3ClW0lcBMHB2be7cTlDXDg3QEWoB+cRf2jAczJNXnd1WO2rYgEbK7EJONfztfD3aW9zI0ziuMnCuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205202; c=relaxed/simple;
	bh=L43tUqiy8VIJR4gURgnTT9AL0FeRLE2CBQiZE7hqijs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fm7JlgXzIvPWAzRcuyjVySIg4ZpqKEc69Hv/IeLQzUI4BZLajAdjtU/S2Lm2jVpepvjsxiZhjyIm571EaY98vMs1+kunwO+3BlzG6gqkJYnom0jhpjHTcRVo4t1LhUNGjcFuPjtEa7BpVl5LShxUCsLqfM/V2+lWcEhfxBep+hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pyh2ubFa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pyh2ubFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739205198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jd+QOMUXEBfd627yzZ56zkxQ8G2MYZlfS/22boe8VCI=;
	b=Pyh2ubFa38DAlXSPlJd0cZOOgXlpqHM9bLv5R8DV47ZxezMPrpwg0pnkrlHrI0zqH3yKKb
	gwRZ3zn19YM132+fKEYtO5ynCsa1uKwjsDCFJXGjEI5975x/6Oi2417NVCw665Vn2oVZ8u
	meZ2+IP0AGFx3LMHJAxdQClUDjkIekI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-7IbEjU91P8-26xF15zzqpg-1; Mon, 10 Feb 2025 11:33:17 -0500
X-MC-Unique: 7IbEjU91P8-26xF15zzqpg-1
X-Mimecast-MFC-AGG-ID: 7IbEjU91P8-26xF15zzqpg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4393e89e910so8668195e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 10 Feb 2025 08:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739205196; x=1739809996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jd+QOMUXEBfd627yzZ56zkxQ8G2MYZlfS/22boe8VCI=;
        b=PVzPbgQQVvTXRJmWWKRMMLkp5KBv0OmhSJ5Uvn99YqIo39iCeUTBU23F4JUfVwPuyT
         +D/tzfv3/D4pvsT4r6GbwQXQp49h9wXKBn76hBSwm7Rdqwd11xx8OtRRSXG6Hvkb9Ia4
         3fpbEaV6M8eX5j+RURU9mhGvthgHihar1adp3ydH2teGscrDXOOSJ+KP2kdtmBMFxPoN
         V2ReE8uY8aqzRxCj0dCqxQpLyhnq7s374tuuUXFPf9p305gWka8JTAsqP8j+E/GSI5rh
         69XtAQ7Xpinnrbk1gx9GOy4Fnx/jbK+5NQgBTLvDvqQse7IBmtby+UwVqX/549Rq9GUG
         u9cA==
X-Gm-Message-State: AOJu0YzNvXJqMDqloCAYrFyjKO3XghalxLVtVxn+w2yqUBNGoAEDfMaL
	acVfLvwIljZQcciywg4nCgMKcsmWgGYJOSx+WVUaDINIgsaadbq8q5UhzuRM8iRv1VzkC8W8tp4
	mgW3fiaxfuIr7lNzFM2tLcWOJJP20ExVH1KZLdTjfbKZ+emReMoV7k5c/A15WeyPR
X-Gm-Gg: ASbGnct2Ohq9LrOJcBo8s6siCguK8XItmL9kRFQgm4427dz8sERAfnZuNzqun+tmyvP
	u8/RdogSz8UINthMgElrL4+RkGT+y4Bv4TUX/YF8y2EOF3SIR1KhWddS01ZUIxYKcfW5lWbiuCo
	5Hx1ClwI1DdZTXxU9dOVFgBKrThBfJ2KbHzqR/YWnl89VUZaLXgSFh3qmn/dXIraXU4nayUYJUW
	z8DvUaoJvovccrnjIkRA5BOQrG/Vxj2OOxEi15zp6EGqTpEJjmtceFH2WI7svw9Xw/+afqzheY=
X-Received: by 2002:a05:600c:1e0e:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-439249889a8mr111804525e9.8.1739205195781;
        Mon, 10 Feb 2025 08:33:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGs5aq4sIDJDp1CFDunBB7WJh325UNNXNJo45hjj3igvnwiogvIqVatMubGoJ72Sdl4DphEnw==
X-Received: by 2002:a05:600c:1e0e:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-439249889a8mr111804085e9.8.1739205195235;
        Mon, 10 Feb 2025 08:33:15 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394679a3a1sm27589285e9.5.2025.02.10.08.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:33:14 -0800 (PST)
Date: Mon, 10 Feb 2025 17:33:12 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Subject: Re: [PATCH v7 2/4] virtio-rtc: Add initial normative statements
Message-ID: <Z6oqSDDOqhRgt/ZB@fedora>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-3-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250123101616.664-3-quic_philber@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6UGML1v2mgqj4D6oncgmAzsLsQR1Gi8pzivyK0tmOZo_1739205196
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 23, 2025 at 11:16:13AM +0100, Peter Hilber wrote:
> Add the normative statements for the initial device specification.
> 
> Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> ---
> 
> Notes:
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
>  device-types/rtc/description.tex        | 269 ++++++++++++++++++++++++
>  device-types/rtc/device-conformance.tex |   9 +
>  device-types/rtc/driver-conformance.tex |   9 +
>  4 files changed, 289 insertions(+)
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
> index aae015690b26..2aefc22cb649 100644
> --- a/device-types/rtc/description.tex
> +++ b/device-types/rtc/description.tex
> @@ -98,6 +98,111 @@ \subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Opera
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
> +
> +The driver MUST NOT interpret \emph{reserved} fields in the
> +device-writable part of the message.
> +
> +The driver MUST NOT interpret unnamed bits in \emph{flags} fields in the
> +device-writable part of the message.
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
> +\field{status} field to VIRTIO_RTC_S_EINVAL if the device read-only part
> +of the message is too small.

What do you mean with `too small`?

> +
> +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> +\field{status} field to VIRTIO_RTC_S_EINVAL if the device write-only
> +part of the message is too small, unless the \field{status} field does
> +not fit into the device write-only part.
> +

I think we can improve the wording by replacing `too small` with
something else.

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
> +The device MUST NOT interpret \emph{reserved} fields in the
> +device-readable part of the message.

I wonder if last three requirements are needed.

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
> +
> +The device MUST use non-negative integers, which are smaller than the
> +number of clocks, as clock identifiers.
> +
> +For a fixed request value V, the device SHOULD either, for every request
> +with value V, always execute successfully, or, for every request with
> +value V, always set a fixed \field{status} other than VIRTIO_RTC_S_OK.

I am not familiar enough with rtc clocks, what does `request with value
V` mean ?

> +
>  \subsubsection{Common Definitions}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions}
>  
>  This section makes common definitions.
> @@ -313,6 +418,103 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
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
> +VIRTIO_RTC_CLOCK_UTC_SMEARED, the device MUST set field
> +\field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
> +
> +For VIRTIO_RTC_REQ_CLOCK_CAP, and clock type
> +VIRTIO_RTC_CLOCK_UTC_SMEARED, the device MUST set field
> +\field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED,
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
> @@ -424,3 +626,70 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
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

Can't we just say that the device MUST processes the available ring as FIFO
queue?

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

See comment above.

> +
> +The device MUST support VIRTIO_RTC_REQ_READ for every clock.
> +
> +For VIRTIO_RTC_REQ_READ and for any clock type listed in this
> +specification, the device MUST use the nanosecond as unit for field
> +\field{clock_reading}.

In other parts of the document the word `field` is written after the
name of the field. I think we could just put it after the name
everywhere.

> +
> +For read requests, the device MUST obtain the \field{clock_reading}
> +response value after the read request is marked as available.
> +
> +For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set
> +\field{counter_cycles} to a value which approximates the value which the
> +driver would have read from the hardware counter identified by
> +\field{hw_counter} at the time instant when the device read the
> +\field{clock_reading} value.

s/read/reads

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

s/read/reads

> +
> +For any clock C, and VIRTIO_RTC_REQ_READ_CROSS messages \emph{A} and
> +\emph{B} which read C and which specify the same hardware counter
> +\emph{H} through field \field{hw_counter}, \emph{A} being the message
> +which the driver marks as available before \emph{B}, the device MUST set
> +the \field{counter_cycles} value for \emph{B} to a value which \emph{H}
> +shows after the \field{counter_cycles} value of \emph{A}, or the device
> +MUST set the same \field{counter_cycles} value for \emph{A} and
> +\emph{B}.

Can't we just say that the request queue follows a FIFO semantics?

> +
> +For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in
> +this specification, the device MUST use the nanosecond as unit for
> +field \field{clock_reading}.
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
> 

