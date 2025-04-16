Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAEA18D65E
	for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805685; cv=none; b=Ezjyx1iQnCygRWny/xcAyl9Fb25owqUwxnHunP8Biepvcf3o0d5XKmTavXKcYumlxDKZW8VKpy9CHAxq4MqTZnIHLgLBAFDVsnpKwpdI3TNaanIEKPubuU5kVNntDfelTc1QbkDi6Ia8/50hpR2zsUG3xxbJj6WDwMXUtDFhwIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805685; c=relaxed/simple;
	bh=LKvXPQsBWEXtZE6wvCG0kjIjB2Mzu3/hVL4TsLSfvh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=c3839zlAsX+6sdRhFOyanIC1V5t3BDgxokEEDF5Hq7ZaPefHSVi0rjZRgNXBpfwxFOXDJ98xSOjWMYcgIQntEizcFfIlC62VkhkVFmEOBtmRAeFECaoYLHDUemdo5LlAl3vPjLyHwD+Jzg75VvAaLlb7FDpVDK5bNkg7D9im774=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RfuZLO9w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RfuZLO9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744805681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o8hmnNfI9M7LUGAbhOhXBtvcUde8XTy1o21TbHH7dMY=;
	b=RfuZLO9w/hL+WanSE5kwBS7IK5jhV7R12O/107Rw+w8e0SEtV/Lrj+sTFpnvXgsuMFdM48
	HhqFCuAPGHChMy/oRfuMb3+BY987U7eCehSblL4cO3aOv6fDppRm9Gi3YytqrleEVGMVSR
	otyqiyPHMQHaBili6wJPW4hqtnjkfFE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-pdIH0ZxpMQyA75lBEnQjMw-1; Wed, 16 Apr 2025 08:14:40 -0400
X-MC-Unique: pdIH0ZxpMQyA75lBEnQjMw-1
X-Mimecast-MFC-AGG-ID: pdIH0ZxpMQyA75lBEnQjMw_1744805679
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d01024089so54182115e9.1
        for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 05:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805679; x=1745410479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8hmnNfI9M7LUGAbhOhXBtvcUde8XTy1o21TbHH7dMY=;
        b=T3XcBpU00xy/dvRpQOz2B3RmXprQdMCnUyrFP7XiPYJAN8iOx17tnqzxtbf5JG7p2U
         HdIGNCydnuUSdAA/xXTuBNW8ZzBsZQKc/zFoelQqumEe1k5n46+XLFATp5M0hEbYmgHD
         QqU9L7TkraPmj2I0KVEynQS2O71KNac0UykbUDSGFJ41UR4eErXiqH5oThjE/GeoJ7vw
         SNTGP7YidCB8Udz/E0yDUs0CVyntbv97H9LUbDJO3men70cw30SgQm+I08CIFKsJqmMc
         rjoX3oTJG/bZS/Z7mMjJLRaDZwoV1rNApLmAm+6+C2fdYNpu+9SPOrsRnuqDaLGObmrD
         nVuA==
X-Gm-Message-State: AOJu0YzWBzKe/ZVVVracYQkhBdRYNsn9XWegZjT7k8WI64SaJVjxRMoO
	hMgcNZNvI8iwpTfxPn0NSdac/tECRgSqy+ZVp/99aA0ILwgMfnTe4pHztXu/9AQn0C21qSVMmuP
	hphyNECEDynkuiPnbfW7ma8ZSzc3adXE8A/XiQCIanrH56no1vNR5ng5tmY0C6r2d
X-Gm-Gg: ASbGncuTWONSbiVVkX2dXfRkBie57U87qxou7GieWT+Qocj/+K7QKM5AwDx/2ChUXPs
	y0kl6TnV8MKffrWgBXzNfjZviKQo0fjf9JPyObN9+ybDhmnl0HIvmyiZ0dAwNzCjmtX/+RlYQZ5
	3hblXiX87Htk/H7/KXa8HBiDwhIZYHQgTs8oPGlV+iK1UGt9cI4RtfJ8zzxqhMJs9blXGPWmBuA
	YPHwF13vOffkujNNc86QkZHLZNRZU7vi9kYzMYPLmBp2exYaBM/7XiwMPwKEa87GMbc05l8aoqy
	PK9dOg==
X-Received: by 2002:a05:600c:5107:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-4405d616b39mr14918085e9.11.1744805679251;
        Wed, 16 Apr 2025 05:14:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8uLylDLkvTXzdUFSBM2TnrJVJNfIa3HszvTcEpOqvxi0AYeWR/3Ro0bbYECAIsehCI3QTNQ==
X-Received: by 2002:a05:600c:5107:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-4405d616b39mr14917685e9.11.1744805678811;
        Wed, 16 Apr 2025 05:14:38 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b53dee0sm19363215e9.33.2025.04.16.05.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:14:38 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:14:36 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>
Subject: Re: [PATCH v8 4/4] virtio-rtc: Add normative statements for alarm
 feature
Message-ID: <Z/+fLOJwadLkbaYZ@fedora>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <20250306095112.1293-5-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250306095112.1293-5-quic_philber@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oWpr5tlqYuH9WQerSf9aJB4_GSj3GKINKJ_jvZXVSlE_1744805679
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 06, 2025 at 10:51:12AM +0100, Peter Hilber wrote:
> Add the normative statements for the alarm feature added previously.
> 
> Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> ---
> 
> Notes:
>     v8:
>     
>     - Explicitly describe alarm enabled status, where relevant (Matias
>       Ezequiel Vara Larsen).
>     
>     - Simplify requirement about clock readings after alarm (Matias Ezequiel
>       Vara Larsen).
>     
>     - Move requirements to serve alarm expiration events before requirements
>       about stopping to serve (Matias Ezequiel Vara Larsen).
>     
>     - Change word order from "field X" to "the X field" (Matias Ezequiel
>       Vara Larsen).
>     
>     - Change word order from "flag X" to "the X flag" or "X".
>     
>     v7:
>     
>     - Remove inadvertent v6 changes, which should have been part of
>       preceding patches.
>     
>     v4:
>     
>     - Update normative statements to match v4 changes to non-normative
>       statements (patch 3).
>     
>     - Driver should read clock to confirm that alarm has expired.
>     
>     - Formatting and wording improvements.
> 
>  device-types/rtc/description.tex        | 150 ++++++++++++++++++++++++
>  device-types/rtc/device-conformance.tex |   4 +
>  device-types/rtc/driver-conformance.tex |   2 +
>  3 files changed, 156 insertions(+)
> 
> diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> index 93bcf178b042..91afae7c2110 100644
> --- a/device-types/rtc/description.tex
> +++ b/device-types/rtc/description.tex
> @@ -32,6 +32,11 @@ \subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
>  VIRTIO_RTC_F_ALARM determines whether the device supports setting an
>  alarm for some of the clocks.
>  
> +\devicenormative{\subsubsection}{Feature bits}{Device Types / RTC Device / Feature bits}
> +
> +The device SHOULD offer VIRTIO_RTC_F_ALARM if the device can support
> +setting an alarm for any of its clocks.
> +

I think you can remove `can` here.

>  \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
>  
>  There is no configuration data for the device.
> @@ -712,6 +717,11 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
>  specification, the device MUST use the nanosecond as unit for the
>  \field{clock_reading} field.
>  
> +If the device sent an alarm notification for clock C with alarm time A,
> +the device MUST, for all read requests of C which the driver marks as
> +available after the notification, return a \field{clock_reading} which
> +does not precede A (except if C stepped backwards to before A).
> +
>  \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
>  
>  Through the optional alarm feature, the driver can set an alarm time. On
> @@ -819,6 +829,76 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
>  To prevent the above issues, the driver also marks buffers in the alarmq
>  as available only after completing the above steps for all clocks.
>  
> +\devicenormative{\paragraph}{Alarm Operation}{Device Types / RTC Device / Device Operation / Alarm Operation}
> +
> +The device MAY retain both alarm time and alarm enabled status of a
> +clock across a device reset.
> +
> +If the device did not retain alarm time and alarm enabled status of a
> +clock across a device reset, the device MUST initialize alarm time to 0.
> +
> +If the device did not retain alarm time and alarm enabled status of a
> +clock across a device reset, the device MUST disable the alarm.
> +
> +If VIRTIO_RTC_F_ALARM was negotiated, the device MUST support the alarm
> +messages, VIRTIO_RTC_REQ_READ_ALARM, VIRTIO_RTC_REQ_SET_ALARM,
> +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, and VIRTIO_RTC_NOTIF_ALARM, for one or
> +more clocks.
> +
> +If VIRTIO_RTC_F_ALARM was not negotiated, the device MUST NOT support the
> +alarm messages.

`has been negotiated ...` I think there are others below.

> +
> +The device MUST set the VIRTIO_RTC_FLAG_ALARM_CAP flag in \field{struct
> +virtio_rtc_resp_clock_cap.flags} if the respective clock supports alarm
> +messages, and clear the flag otherwise.
> +
> +The device MUST consider it an alarm expiration event when the
> +associated clock progresses (also: steps) from a time prior to the alarm
> +time to the alarm time, or to a time after the alarm time, while the
> +alarm is enabled.
> +
> +The device MUST consider it an alarm expiration event when the
> +driver sets an alarm time which the associated clock has already reached
> +or passed, while also setting the alarm to enabled.
> +
> +The device MUST consider it an alarm expiration event when the driver
> +sets the alarm to enabled, if the clock has already reached or passed
> +the alarm time.
> +
> +If the device retained alarm time and alarm enabled status of a clock
> +across a device reset, and the clock has already reached or passed the
> +alarm time, the device MUST consider this device reset an alarm
> +expiration event, if the alarm is enabled.
> +
> +If an alarm expiration event E happens, the device MUST start serving
> +the alarm expiration event E.
> +
> +If the device is currently serving an alarm expiration event E, the
> +device MUST send a single VIRTIO_RTC_NOTIF_ALARM notification for E, as
> +soon as an alarmq buffer is available for this purpose.
> +
> +While the device is serving an alarm expiration event, the device MAY
> +execute implementation-specific alarm actions.
> +
> +The device MAY ignore the device status when executing
> +implementation-specific alarm actions.
> +
> +The device MAY ignore whether VIRTIO_RTC_F_ALARM was negotiated when
> +executing implementation-specific alarm actions.
> +
> +If the driver successfully requests VIRTIO_RTC_REQ_SET_ALARM, or
> +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, for clock C, the device MUST stop
> +serving any previous alarm expiration event for C before the device
> +marks the message as used.
> +
> +If a clock C steps to a time previous to C's alarm time, the device MUST
> +stop serving any previous alarm expiration event for C, within a grace
> +period.
> +
> +If an alarm expiration event happens for clock C, the device MUST stop
> +serving any previous alarm expiration event for C, within a grace
> +period.
> +
>  \paragraph{Alarm Control Requests}
>  
>  If VIRTIO_RTC_F_ALARM is negotiated,
> @@ -913,6 +993,59 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
>  
>  \end{description}
>  
> +\drivernormative{\subparagraph}{Alarm Control Requests}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
> +
> +For VIRTIO_RTC_REQ_SET_ALARM and for any clock type listed in this
> +specification, the driver MUST use the nanosecond as unit for the
> +\field{alarm_time} field.
> +
> +\devicenormative{\subparagraph}{Alarm Control Requests}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
> +
> +If VIRTIO_RTC_F_ALARM was not negotiated, the device MUST set status
> +VIRTIO_RTC_S_ENODEV for VIRTIO_RTC_REQ_READ_ALARM,
> +VIRTIO_RTC_REQ_SET_ALARM, and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
> +
> +If the clock does not support alarm messages, the device MUST set status
> +VIRTIO_RTC_S_ENODEV for VIRTIO_RTC_REQ_READ_ALARM,
> +VIRTIO_RTC_REQ_SET_ALARM, and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
> +
> +For VIRTIO_RTC_REQ_READ_ALARM, the device MUST set the
> +\field{alarm_time} field to the alarm time.
> +
> +For VIRTIO_RTC_REQ_READ_ALARM, the device MUST set the
> +VIRTIO_RTC_FLAG_ALARM_ENABLED flag in the \field{flags} field if the
> +alarm is enabled, and clear the flag otherwise.
> +
> +For VIRTIO_RTC_REQ_READ_ALARM and for any clock type listed in this
> +specification, the device MUST use the nanosecond as unit for the
> +\field{alarm_time} field.
> +
> +For VIRTIO_RTC_REQ_SET_ALARM, the device MUST accept any
> +\field{alarm_time} value.
> +
> +If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
> +the device MUST set the alarm time to the time represented by the
> +\field{alarm_time} field.
> +
> +If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
> +the device MUST enable the alarm if VIRTIO_RTC_FLAG_ALARM_ENABLED is set
> +in the \field{flags} field.
> +
> +If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
> +the device MUST disable the alarm if VIRTIO_RTC_FLAG_ALARM_ENABLED is
> +cleared in the \field{flags} field.
> +
> +If the device sets status VIRTIO_RTC_S_OK for
> +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST enable the alarm if
> +VIRTIO_RTC_FLAG_ALARM_ENABLED is set in the \field{flags} field.
> +
> +If the device sets status VIRTIO_RTC_S_OK for
> +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST disable the alarm if
> +VIRTIO_RTC_FLAG_ALARM_ENABLED is cleared in the \field{flags} field.
> +
> +If the device sets status VIRTIO_RTC_S_OK for
> +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST retain the alarm time.
> +
>  \paragraph{Alarm Notifications}
>  
>  If the alarmq is present, the driver should make buffers available in
> @@ -948,3 +1081,20 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
>  
>  \field{clock_id} identifies the expired alarm through its associated
>  clock.
> +
> +\drivernormative{\subparagraph}{Alarm Notifications}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
> +
> +If VIRTIO_RTC_F_ALARM was negotiated, the driver SHOULD populate the
> +alarmq with buffers.
> +
> +The driver MUST allocate enough space for any alarmq message in the
> +device-writable part of an alarmq buffer.
> +
> +If the driver receives a VIRTIO_RTC_NOTIF_ALARM notification, the driver
> +SHOULD read the associated clock instead of assuming that the alarm time
> +which the driver set last has been reached.
> +
> +\devicenormative{\subparagraph}{Alarm Notifications}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
> +
> +The device MUST NOT send a VIRTIO_RTC_NOTIF_ALARM notification for a
> +clock which does not support alarm messages.
> diff --git a/device-types/rtc/device-conformance.tex b/device-types/rtc/device-conformance.tex
> index 4303cd450542..705691a7319f 100644
> --- a/device-types/rtc/device-conformance.tex
> +++ b/device-types/rtc/device-conformance.tex
> @@ -3,7 +3,11 @@
>  An RTC device MUST conform to the following normative statements:
>  
>  \begin{itemize}
> +\item \ref{devicenormative:Device Types / RTC Device / Feature bits}
>  \item \ref{devicenormative:Device Types / RTC Device / Device Operation}
>  \item \ref{devicenormative:Device Types / RTC Device / Device Operation / Control Requests}
>  \item \ref{devicenormative:Device Types / RTC Device / Device Operation / Read Requests}
> +\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation}
> +\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
> +\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
>  \end{itemize}
> diff --git a/device-types/rtc/driver-conformance.tex b/device-types/rtc/driver-conformance.tex
> index 689c18d158d0..a87c4cde99c2 100644
> --- a/device-types/rtc/driver-conformance.tex
> +++ b/device-types/rtc/driver-conformance.tex
> @@ -6,4 +6,6 @@
>  \item \ref{drivernormative:Device Types / RTC Device / Device Operation}
>  \item \ref{drivernormative:Device Types / RTC Device / Device Operation / Control Requests}
>  \item \ref{drivernormative:Device Types / RTC Device / Device Operation / Read Requests}
> +\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
> +\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
>  \end{itemize}
> -- 
> 2.43.0
> 

