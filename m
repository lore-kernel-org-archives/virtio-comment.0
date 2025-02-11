Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08A16FB9
	for <virtio-comment@lists.linux.dev>; Tue, 11 Feb 2025 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739277232; cv=none; b=DjT0Ich9PgzUJlK9v47iCTAbkyKPjwcKPP3YWFZo0ILWvI+x6Rer1h921K62v3YrKGVqAgF4fqwNZ/ZyC+7UIf4SZzUdz5TXRVEwleMPSqdlalKvpyvJE49hEXayH/FTxdoezxDjpZ1dYcaU+NtpWtA3yiX6XTN+MkzZvChS+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739277232; c=relaxed/simple;
	bh=3x9i7iZGqMR1WJYmfjT5Xn5SXuVmOLddPnfxikwm/0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gMPg4anCJl0ldl1hlwsAg70mIC1HRlTb19mXq6Z6k+GP7S1dmU3krpXQypBXeHFbvVYpYZ1+AzMh9zuWl1XvpFwTbxeJ0x6FqC6rVxJ9V3/b3eBDOsK5EZ86oTzwd2Xbd7f3PoAMfiUooabCPyKEM6bN8CpB7Ci8O+cbpZYSn0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=doo1fGEI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="doo1fGEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739277228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6TWWnRuiydM6uZShcuII67jJX581Wk35wqpGeGCBLc=;
	b=doo1fGEIx2gd5n4PzrvqhpLjbmhVfLDC1CvRDVC7hFa3DnGTmxi7bjEFh2nM7VaD0aN+TZ
	Uw4rg+UY40oKQxIZVJEo7wsdZhrZ2cZRWr6lbQdeV8Gnfbd7FBfvW0Q1+oJGfiy2KqxOs5
	Ax7sjvYBbSUtvFwxVr1t/gdgsZYwaPc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-Dc8RrBCdPQeksOmG1P9mMw-1; Tue, 11 Feb 2025 07:33:47 -0500
X-MC-Unique: Dc8RrBCdPQeksOmG1P9mMw-1
X-Mimecast-MFC-AGG-ID: Dc8RrBCdPQeksOmG1P9mMw
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4394b2c19ccso11324485e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 11 Feb 2025 04:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739277226; x=1739882026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6TWWnRuiydM6uZShcuII67jJX581Wk35wqpGeGCBLc=;
        b=ZFySJqzfPBHEPrOpDZ/gIbx8AmPL2q7/0CVuY6nt64p63x8nBkgUExdxjnBE5Y8Pxf
         jioZhOibb+9GyfSIWTb7owkWoQ0z36CvBc/39nrCXbYyroPu2+KdwpidJF94aQxE769f
         d+/jTUpJDBbMRNtJy+4xQEzdscXa5CUSdrHkSPJI88Hxb5Dwbdr6haVHQnAU1CGNS/mJ
         xNQ6SIJW/1vn9NLHIUMV+50SuT5CHjK5hftrQzlGiqpLaS0sdnmoAKPWle4eZ7ko0gxP
         +ROTsrLD/sP/+LY1abPCrwRHc8eMXzc/7P8Q04sbawp9HyfqvZyBrd60qRzX/HTcvLgL
         9oFQ==
X-Gm-Message-State: AOJu0Yx0UQwRWiR/BETblnjiwfggQ1bJ3HfpL0fxqsDHfOIAzzycZ+eY
	j3PH38suWcp58rpwcQad5+wlG6zR4sJ+bKhEOjLq1JkyZ2712oWhhf3ny5cM9ANtzFSoCeWUom8
	AbL62MwvKruOvrTM7uklCQViGfLW7Dj1tiUMQM34+/vV9rw+LxJNad33KRcpelouA
X-Gm-Gg: ASbGncuA+z1hblwcpXwC2pwislDbXuiJofHVhO4gPpo6vZXMBalZedqpWhn8ZImCeZW
	W53/U+fI+WNF4GnBlmME1/6nvYc5+5Ru/fEDEjDdrYHOxjk0CM7DpnHUF8DwLMadkAJOvgE8jC/
	/c6ryveAwRZpPG1AsS5UvDXSM6r9pExf2/jfbfqs4tEfqDr9/r2VKMh98WrnjuR0An+lfF2DmsD
	NCcE2Kcs7jESu4TJJSlfXoVa61hmMP51nMhKsphC6a7gI+l+buc+O7p9XR5fIqjxJ94AczVKw==
X-Received: by 2002:a05:600c:1e0d:b0:439:48f6:dd6e with SMTP id 5b1f17b1804b1-43948f6de36mr57931635e9.19.1739277226128;
        Tue, 11 Feb 2025 04:33:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzNa/0LGx4hYN8wZYHn9VIHctJCHJ8938h6/KnZQRt09sEIthXr6yg2+TWskzPjfwUzZlTYg==
X-Received: by 2002:a05:600c:1e0d:b0:439:48f6:dd6e with SMTP id 5b1f17b1804b1-43948f6de36mr57931265e9.19.1739277225706;
        Tue, 11 Feb 2025 04:33:45 -0800 (PST)
Received: from fedora ([78.243.229.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d753sm209457585e9.11.2025.02.11.04.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:33:45 -0800 (PST)
Date: Tue, 11 Feb 2025 13:33:42 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Subject: Re: [PATCH v7 4/4] virtio-rtc: Add normative statements for alarm
 feature
Message-ID: <Z6tDpi07Pyk+Xjzi@fedora>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-5-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250123101616.664-5-quic_philber@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 143p17BpfOv1KTtUuuJvbkYS6Y4KTC52Gplm7YGT2KI_1739277226
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 23, 2025 at 11:16:15AM +0100, Peter Hilber wrote:
> Add the normative statements for the alarm feature added previously.
> 
> Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> ---
> 
> Notes:
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
>  device-types/rtc/description.tex        | 157 ++++++++++++++++++++++++
>  device-types/rtc/device-conformance.tex |   4 +
>  device-types/rtc/driver-conformance.tex |   2 +
>  3 files changed, 163 insertions(+)
> 
> diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> index 47ad50cd95ca..32fed5f8620f 100644
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

I think you can remove `can`.

> +
>  \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
>  
>  There is no configuration data for the device.
> @@ -715,6 +720,12 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
>  this specification, the device MUST use the nanosecond as unit for
>  field \field{clock_reading}.
>  
> +If VIRTIO_RTC_F_ALARM was negotiated, and the device sent an alarm
> +notification N for clock C with alarm time A, the device MUST, for all
> +read requests of C which the driver marks as available after the device
> +marked N as used, return a \field{clock_reading} which does not precede
> +A, unless C stepped backwards to before A.
> +

I wonder if there is a simpler way to rewrite this paragraph. It is a
bit hard to follow.

>  \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
>  
>  Through the optional alarm feature, the driver can set an alarm time. On
> @@ -828,6 +839,79 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
>  To prevent the above issues, the driver also marks buffers in the alarmq
>  as available only after completing the above steps for all clocks.
>  
> +\devicenormative{\paragraph}{Alarm Operation}{Device Types / RTC Device / Device Operation / Alarm Operation}
> +
> +The device MAY retain both \field{driver_alarm_time} and
> +\field{alarm_enabled} of a clock across a device reset.
> +
> +If the device did not retain \field{driver_alarm_time} and
> +\field{alarm_enabled} of a clock across a device reset, the device MUST
> +initialize \field{driver_alarm_time} to 0.
> +
> +If the device did not retain \field{driver_alarm_time} and
> +\field{alarm_enabled} of a clock across a device reset, the device MUST
> +initialize \field{alarm_enabled} to false.
> +
> +While \field{alarm_enabled} for a clock is true, the device MUST set the
> +alarm time to \field{driver_alarm_time}.
> +
> +While \field{alarm_enabled} for a clock is false, the device MUST act as
> +if the alarm time was in the future.
> +
> +If VIRTIO_RTC_F_ALARM was negotiated, the device MUST support the alarm
> +messages, VIRTIO_RTC_REQ_READ_ALARM, VIRTIO_RTC_REQ_SET_ALARM,
> +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, and VIRTIO_RTC_NOTIF_ALARM, for one or
> +more clocks.
> +
> +If VIRTIO_RTC_F_ALARM was not negotiated, the device MUST NOT support the
> +alarm messages.
> +
> +The device MUST set flag VIRTIO_RTC_FLAG_ALARM_CAP in \field{struct
> +virtio_rtc_resp_clock_cap.flags} if the respective clock supports alarm
> +messages, and clear the flag otherwise.
> +
> +The device MUST consider it an alarm expiration event when the
> +associated clock progresses (also: steps) from a time prior to the alarm
> +time to the alarm time, or to a time after the alarm time.
> +
> +The device MUST consider it an alarm expiration event when the
> +driver sets an alarm time which the associated clock has already reached
> +or passed.
> +
> +If the device retained \field{driver_alarm_time} and
> +\field{alarm_enabled} of a clock across a device reset, and the clock
> +has already reached or passed the alarm time, the device MUST consider
> +this device reset an alarm expiration event.
> +
> +If an alarm expiration event E happens, the device MUST start serving
> +the alarm expiration event E.
> +
> +If the driver successfully requests VIRTIO_RTC_REQ_SET_ALARM, or
> +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, for clock C, the device MUST stop
> +serving any previous alarm expiration event for C before the device
> +marks the message as used.

What do you mean with serving?

> +
> +If a clock C steps to a time previous to C's alarm time, the device MUST
> +stop serving any previous alarm expiration event for C, within a grace
> +period.
> +
> +If an alarm expiration event happens for clock C, the device MUST stop
> +serving any previous alarm expiration event for C, within a grace
> +period.
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
>  \paragraph{Alarm Control Requests}
>  
>  If VIRTIO_RTC_F_ALARM is negotiated,
> @@ -924,6 +1008,62 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
>  \field{driver_alarm_time}.
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
> +For VIRTIO_RTC_REQ_READ_ALARM, the device MUST set field
> +\field{alarm_time} to \field{driver_alarm_time}.
> +
> +For VIRTIO_RTC_REQ_READ_ALARM, the device MUST set flag
> +VIRTIO_RTC_FLAG_ALARM_ENABLED in field \field{flags} if
> +\field{alarm_enabled} is true, and clear the flag otherwise.
> +
> +For VIRTIO_RTC_REQ_READ_ALARM and for any clock type listed in this
> +specification, the device MUST use the nanosecond as unit for the
> +\field{alarm_time} field.
> +
> +For VIRTIO_RTC_REQ_SET_ALARM, the device MUST accept any
> +\field{alarm_time} value.
> +
> +If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
> +the device MUST set \field{driver_alarm_time} to the time
> +represented by field \field{alarm_time}.
> +
> +If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
> +the device MUST set \field{alarm_enabled} to true if flag
> +VIRTIO_RTC_FLAG_ALARM_ENABLED is set in field \field{flags}.
> +
> +If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
> +the device MUST set \field{alarm_enabled} to false if flag
> +VIRTIO_RTC_FLAG_ALARM_ENABLED is cleared in field \field{flags}.
> +
> +If the device sets status VIRTIO_RTC_S_OK for
> +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST set
> +\field{alarm_enabled} to true if flag VIRTIO_RTC_FLAG_ALARM_ENABLED is
> +set in field \field{flags}.
> +
> +If the device sets status VIRTIO_RTC_S_OK for
> +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST set
> +\field{alarm_enabled} to false if flag VIRTIO_RTC_FLAG_ALARM_ENABLED is
> +cleared in field \field{flags}.
> +
> +If the device sets status VIRTIO_RTC_S_OK for
> +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST retain
> +\field{driver_alarm_time}.
> +
>  \paragraph{Alarm Notifications}
>  
>  If the alarmq is present, the driver should make buffers available in
> @@ -959,3 +1099,20 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
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
> 

