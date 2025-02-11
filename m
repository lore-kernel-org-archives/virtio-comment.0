Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395F91F9F73
	for <virtio-comment@lists.linux.dev>; Tue, 11 Feb 2025 11:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739274724; cv=none; b=ib6EvctDRod6w//XBiMK//1Ier0f2HygLpDxMAiLlw/wXQR2dTGnbW3DxqhQpd8U2W/gNsxvqDOJRspF9m0VmG1devoQEIhj2vGwWe7d+ZVN1TT7iKtIHHD95awFCJeD09+OHjsdRvlPaX+FMM7i9GQFdwd9T8IYWrSmnphjmoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739274724; c=relaxed/simple;
	bh=gNk/rvPnjcL8eLaIATfZrp/r6Ebd9oBUNYFPAkC/QB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RgPvzMsE/lviHGoTkw8ta9kVqWrliGvARsitjOuv58cbq9nXdAKTCTBTTxEKd2MLN0DDUM7UxwNTo8pWpAK3CZU2wuhIzaYgG5SKzhEuMTZIkk09bKHXL9d855bjcd/UpjQ8SMlSqwJ47/x06zepM24t4v8Od7ueKIh9PgFI7Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GH5llsjN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GH5llsjN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739274721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wPRbbUryidtm6oYuM9iF+Iam+gU6FJtqy/6JceyAfhs=;
	b=GH5llsjNYemQi0WI6Xv037M39HknIihoPm1whAYR58iMSCLXjBtqEj3LYgcaPzEI8KDZGI
	giKqB2F8d5AUGnLCGprW0HuAbp7UB1DWp/8gI+k4zBISejx6UrZvPb65hhSzr/skgdYcaC
	X75DF8hecH9VDPx10e0ma0IMbGbZhY0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-1N1DqIHwNgq-4MHXvRlnUw-1; Tue, 11 Feb 2025 06:51:59 -0500
X-MC-Unique: 1N1DqIHwNgq-4MHXvRlnUw-1
X-Mimecast-MFC-AGG-ID: 1N1DqIHwNgq-4MHXvRlnUw
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38de1e83c97so667618f8f.1
        for <virtio-comment@lists.linux.dev>; Tue, 11 Feb 2025 03:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739274718; x=1739879518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPRbbUryidtm6oYuM9iF+Iam+gU6FJtqy/6JceyAfhs=;
        b=CgA76i8LBezvzHdZKXeAJbGbdSR5HsgKMBjvd5uE/OEAQpcGPll8XeCsp45KCuLI3N
         sF9y07VKtMboWP/1UFlhlYE87RDKX7E2zkbpvNluDzRtLQtY65WkO4PqxKfHP8S4gxDT
         MBPg/7s44Cukc6RhjXeTq46ALuB44bKvtXOAxiLUd7SSRvCYDvy0mRundzGu1gw0Zsp7
         ttoAhPBuJW0CWfSSxDonkqCnES0vWHDeBSLg/nW/1ykya6fKykrHSmxQpWn43OvAUCd1
         /lqnogIFf6qv1fK/W1yKD4h5TWnp+8xwoKn2Q83yLDIFvrVf1jJA7So3Bf0no6yAEC3e
         FeYg==
X-Gm-Message-State: AOJu0YzqKQ1u8+BL71r4joRr+3xFpKAVVBgpIRg+EXynu09ARniujMIN
	375p6Tkc1Pgaait34gnAory9lYak5TnHyZ/N4ZK42245i/BYZqvujYe/VZWzMsnvz+0Bv3VOERO
	cU2ZQgonGOCANpkcIjOilPxVG357gGWtzmdeLUaAkt2Y1YwMtvb2QPwadmNK0s7s1
X-Gm-Gg: ASbGncuOIRkMECUPYb4FbTya9ZvUt8EbQGp7zvid5/k28Sd2YgI0n/1EA67mR/tKTk1
	PvBIs2nxFx2RjQKagBxwDY65O0be8Hky7+8cS8EaTg1/+kghL7+N2Xg8xnvEtSMekL5OSkMCIi/
	Kyj54xGSdrWAXPSUM5cACt8yA6l7Lnn4i73grPfHV8vyeZxPGz1ju38fq5tFVoYm7Nu4P3jolnt
	IIFqE+LBnJDKir46m0IF41vlw/RKC/4fRJKLOOUjo9CxCfapei3V5OWaSJt6HmPNdRts5SCFQ==
X-Received: by 2002:a5d:64c3:0:b0:386:459e:e138 with SMTP id ffacd0b85a97d-38dc934968fmr13610463f8f.36.1739274718374;
        Tue, 11 Feb 2025 03:51:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/leMWMuy5yWWGe0u2njEC796CX+LF8NLqrXxTywYbBAnURo29SSrykUK00V9043mPWgR32g==
X-Received: by 2002:a5d:64c3:0:b0:386:459e:e138 with SMTP id ffacd0b85a97d-38dc934968fmr13610420f8f.36.1739274717839;
        Tue, 11 Feb 2025 03:51:57 -0800 (PST)
Received: from fedora ([78.243.229.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc33939f3sm13833809f8f.17.2025.02.11.03.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:51:57 -0800 (PST)
Date: Tue, 11 Feb 2025 12:51:54 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Subject: Re: [PATCH v7 3/4] virtio-rtc: Add alarm feature
Message-ID: <Z6s52sYSmuhp8M4/@fedora>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-4-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250123101616.664-4-quic_philber@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JVvoBncKRxXUkaKckxu-jAfn4Kohq8WHtnq1H_qW_XI_1739274718
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 23, 2025 at 11:16:14AM +0100, Peter Hilber wrote:
> Add the VIRTIO_RTC_F_ALARM feature (without normative statements).
> 
> The intended use case is: A driver needs to react when an alarm time has
> been reached, but at alarm time, the driver may be in a sleep state or
> powered off. The alarm feature can resume and notify the driver in this
> case. Alarms may be retained across device resets (including reset on
> boot).
> 
> Peculiarities
> -------------
> 
> Unlike usual alarm clocks, a virtio-rtc alarm-capable clock may step
> autonomously at any time: An alarm may change back from "expired" to
> "not expired" before the driver has started processing an alarm
> notification.
> 
> To address the above, and the device resets, define "alarm expiration"
> in such a way that the driver always has a chance to react to an alarm,
> and make the device always responsible for notifying the driver about an
> alarm expiration.
> 
> The VIRTIO_RTC_REQ_SET_ALARM_ENABLED request is there so that the Linux
> ioctls RTC_AIE_ON and RTC_AIE_OFF only need to emit one request.
> 
> Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> ---
> 
> Notes:
>     v7:
>     
>     - Change flag numeric value due to removing leap second indication.
>     
>     v5:
>     
>     - Reformat.
>     
>     v4:
>     
>     - Change requirements so that driver can reset alarm to clean slate, and
>       document how driver can achieve this (Cornelia Hell, Jason Wang) [1].
>     
>     - Require device to support all expressible alarm times.
>     
>     - Formatting and wording improvements.
>     
>     [1] https://lore.kernel.org/all/2ae67401-a8f5-4686-9321-cb3105df594d@opensynergy.com/
> 
>  device-types/rtc/description.tex | 270 ++++++++++++++++++++++++++++++-
>  1 file changed, 268 insertions(+), 2 deletions(-)
> 
> diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> index 2aefc22cb649..47ad50cd95ca 100644
> --- a/device-types/rtc/description.tex
> +++ b/device-types/rtc/description.tex
> @@ -4,6 +4,7 @@ \section{RTC Device}\label{sec:Device Types / RTC Device}
>  time. The device can provide different clocks, e.g.\ for the UTC or TAI
>  time standards, or for physical time elapsed since some past epoch. The
>  driver can read the clocks with simple or more accurate methods.
> +Optionally, the driver can set an alarm.
>  
>  \subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
>  
> @@ -13,13 +14,23 @@ \subsection{Virtqueues}\label{sec:Device Types / RTC Device / Virtqueues}
>  
>  \begin{description}
>  \item[0] requestq
> +\item[1] alarmq
>  \end{description}
>  
>  The driver enqueues requests to the requestq.
>  
> +Through the alarmq, the device notifies the driver about alarm
> +expirations. The alarmq exists only if VIRTIO_RTC_F_ALARM was
> +negotiated.
> +
>  \subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
>  
> -No device-specific feature bits are defined yet.
> +\begin{description}
> +\item[VIRTIO_RTC_F_ALARM (0)] Device supports alarm.
> +\end{description}
> +
> +VIRTIO_RTC_F_ALARM determines whether the device supports setting an
> +alarm for some of the clocks.
>  
>  \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
>  
> @@ -376,7 +387,8 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
>          struct virtio_rtc_resp_head head;
>          u8 type;
>          u8 leap_second_smearing;
> -        u8 reserved[6];
> +        u8 flags;

I wonder if you can just define flags in the first patch instead of
introduce it here. I think flags field may be used for other purpose in
the future but I do not have an strong opinion.

> +        u8 reserved[5];
>  };
>  \end{lstlisting}
>  
> @@ -387,6 +399,15 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
>  variant} through field \field{leap_second_smearing}. All other clocks
>  set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
>  
> +The \field{flags} field provides the following information:
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_FLAG_ALARM_CAP               (1 << 0)
> +\end{lstlisting}
> +
> +If VIRTIO_RTC_F_ALARM was negotiated, flag VIRTIO_RTC_FLAG_ALARM_CAP
> +indicates that the clock supports an alarm.
> +
>  \item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
>  cross-timestamping for a particular pair of clock and hardware counter.
>  
> @@ -693,3 +714,248 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
>  For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in
>  this specification, the device MUST use the nanosecond as unit for
>  field \field{clock_reading}.
> +
> +\subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
> +
> +Through the optional alarm feature, the driver can set an alarm time. On
> +alarm expiration, the device notifies the driver. On alarm expiration,
> +the device may also wake up the driver, while the driver is in a sleep
> +state, or while the driver is powered off. How this is done is beyond
> +the scope of the specification. The driver can set one alarm time per
> +clock, if the clock supports this.
> +
> +The device may retain alarm times across device resets.\footnote{Drivers
> +        may reset the device on boot or on resume from sleep state. It
> +        can make sense for the device to retain the alarm time then,
> +        similar to other alarm clocks.}
> +
> +The alarm feature, and the associated alarmq for notifications from the
> +device, are available if VIRTIO_RTC_F_ALARM was negotiated. In addition,
> +if the driver previously set an alarm time, even if the device no longer
> +both
> +
> +\begin{itemize}
> +\item is live and
> +\item has negotiated VIRTIO_RTC_F_ALARM,
> +\end{itemize}
> +
> +the device may still execute implementation-specific actions on alarm
> +expiration.
> +
> +An alarm expires
> +
> +\begin{itemize}
> +\item when the associated clock progresses (also: steps) from a time
> +        prior to the alarm time to the alarm time, or to a time after
> +        the alarm time, or
> +
> +\item when the driver sets an alarm time which is not in the future, or
> +
> +\item when the device is reset, if the alarm time is retained and not in
> +        the future.\footnote{The device is always responsible for
> +        detecting alarm expiration events. This avoids that the driver
> +        needs to reason about when it shall poll for alarm expiration.}
> +\end{itemize}
> +
> +When an alarm expires, the driver can disable it. Otherwise, the alarm
> +expires each time when one of the above expiration events occurs, even
> +if it occurred before.\footnote{This avoids that the driver may

When an alarm expires, the device keeps notifying the driver that the
alarm has expired? is that implementation-specific?

> +        miss an alarm when the clock steps backwards after alarm
> +        expiration, but before the driver has resumed operation. This
> +        also facilitates distinct drivers using the same device,
> +        e.g.\ a driver in the bootloader, and a driver in the OS.}
> +
> +On alarm expiration, the device executes the alarm actions. The alarm
> +actions are:
> +
> +\begin{itemize}
> +\item The device notifies the driver through the alarmq. If the device

Do you mean the driver?

> +        is not live, or no buffers are available in the alarmq, the
> +        device will notify once the device is live and buffers are
> +        available.
> +
> +\item Optionally, the device executes other, implementation-specific,
> +        actions. The device may execute those immediately, regardless of
> +        the device state.
> +\end{itemize}
> +
> +An alarm expiration becomes obsolete
> +
> +\begin{itemize}
> +\item once the clock jumps backwards, before the alarm time, or
> +
> +\item once the driver sets an alarm time, or
> +
> +\item once another alarm expiration event happens.
> +\end{itemize}
> +

This is a minor comment, I think you can use `when` instead of `once` like
in the paragraph before.

> +If an alarm expiration becomes obsolete, it is unspecified which alarm
> +actions the device executes for this alarm expiration, and the device
> +stops executing these alarm actions after a grace period.

What is a grace period? You mean that whatever the device does after
alarm expiration, the device has to STOP doing it after a grace period.
Am I right?

> +
> +The driver-visible settings of an alarm consist of two elements:
> +
> +\begin{itemize}
> +\item \field{driver_alarm_time}, a valid time for the corresponding
> +        clock, and
> +
> +\item \field{alarm_enabled}, a boolean. While \field{alarm_enabled} is
> +        true, \field{driver_alarm_time} is the actual alarm time.
> +        While \field{alarm_enabled} is false, the device will act as if
> +        the alarm time was in the future, so that the alarm will not
> +        expire.
> +\end{itemize}

Is `alarm_enabled` a field that is device implementation specific?

> +
> +The device supports all \field{driver_alarm_time} values which the
> +driver can request through alarm control requests.
> +
> +Initially, \field{driver_alarm_time} is the epoch of the clock ($0$),
> +and \field{alarm_enabled} is false.
> +
> +Alarms set prior to reset may cause unwanted alarm expiration
> +notifications, and information leakage, after the reset. To prevent both
> +issues, the driver can do the following after the reset, for each clock
> +which supports alarm:
> +
> +\begin{enumerate}
> +\item Send a VIRTIO_RTC_REQ_SET_ALARM message, with \field{alarm_time}
> +        set to 0, and \field{flags} set to 0.
> +
> +\item Wait until the device marks the VIRTIO_RTC_REQ_SET_ALARM message
> +        as used, with status VIRTIO_RTC_S_OK.
> +\end{enumerate}
> +
> +To prevent the above issues, the driver also marks buffers in the alarmq
> +as available only after completing the above steps for all clocks.
> +
> +\paragraph{Alarm Control Requests}
> +
> +If VIRTIO_RTC_F_ALARM is negotiated,
> +
> +\begin{itemize}
> +\item the driver can determine if a clock supports an alarm through the
> +        VIRTIO_RTC_FLAG_ALARM_CAP flag in the VIRTIO_RTC_REQ_CLOCK_CAP
> +        response,
> +
> +\item the driver can enqueue the alarm control requests into the
> +        requestq: VIRTIO_RTC_REQ_READ_ALARM, VIRTIO_RTC_REQ_SET_ALARM,
> +        and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
> +\end{itemize}
> +
> +The unit of all \field{alarm_time} fields is 1 nanosecond.
> +
> +\begin{description}
> +\item[VIRTIO_RTC_REQ_READ_ALARM] reads the current alarm.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_REQ_READ_ALARM 0x1003 /* message type */
> +
> +struct virtio_rtc_req_read_alarm {
> +        struct virtio_rtc_req_head head;
> +        le16 clock_id;
> +        u8 reserved[6];
> +};
> +
> +struct virtio_rtc_resp_read_alarm {
> +        struct virtio_rtc_resp_head head;
> +        le64 alarm_time;
> +#define VIRTIO_RTC_FLAG_ALARM_ENABLED   (1 << 0)
> +        u8 flags;
> +        u8 reserved[7];
> +};
> +\end{lstlisting}
> +
> +\field{clock_id} identifies the alarm through its associated clock.
> +Field \field{alarm_time} returns \field{driver_alarm_time}. In field
> +\field{flags}, flag VIRTIO_RTC_FLAG_ALARM_ENABLED indicates whether
> +\field{alarm_enabled} is true.
> +
> +\item[VIRTIO_RTC_REQ_SET_ALARM] sets the alarm.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_REQ_SET_ALARM 0x1004 /* message type */
> +
> +struct virtio_rtc_req_set_alarm {
> +        struct virtio_rtc_req_head head;
> +        le64 alarm_time;
> +        le16 clock_id;
> +        /* flag: VIRTIO_RTC_FLAG_ALARM_ENABLED */
> +        u8 flags;
> +        u8 reserved[5];
> +};
> +
> +struct virtio_rtc_resp_set_alarm {
> +        struct virtio_rtc_resp_head head;
> +        /* no response params */
> +};
> +\end{lstlisting}
> +
> +\field{clock_id} identifies the alarm through its associated clock.
> +Field \field{alarm_time} sets \field{driver_alarm_time}. If flag
> +VIRTIO_RTC_FLAG_ALARM_ENABLED is set in field \field{flags}, the device
> +sets \field{alarm_enabled} to true; otherwise, the device sets
> +\field{alarm_enabled} to false.
> +
> +\item[VIRTIO_RTC_REQ_SET_ALARM_ENABLED] sets \field{alarm_enabled}.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_REQ_SET_ALARM_ENABLED 0x1005 /* message type */
> +
> +struct virtio_rtc_req_set_alarm_enabled {
> +        struct virtio_rtc_req_head head;
> +        le16 clock_id;
> +        /* flag: VIRTIO_RTC_FLAG_ALARM_ENABLED */
> +        u8 flags;
> +        u8 reserved[5];
> +};
> +
> +struct virtio_rtc_resp_set_alarm_enabled {
> +        struct virtio_rtc_resp_head head;
> +        /* no response params */
> +};
> +\end{lstlisting}
> +
> +\field{clock_id} identifies the alarm through its associated clock. If
> +flag VIRTIO_RTC_FLAG_ALARM_ENABLED is set in field \field{flags}, the
> +device sets \field{alarm_enabled} to true; otherwise, the device sets
> +\field{alarm_enabled} to false.
> +
> +When processing this request, the device retains
> +\field{driver_alarm_time}.
> +\end{description}
> +
> +\paragraph{Alarm Notifications}
> +
> +If the alarmq is present, the driver should make buffers available in
> +the alarmq, which the device uses for alarm notification messages. All
> +alarmq fields are device-writable. The alarmq uses a common notification
> +header.
> +
> +\begin{lstlisting}
> +/* common notification header */
> +struct virtio_rtc_notif_head {
> +        le16 msg_type;
> +        u8 reserved[6];
> +};
> +\end{lstlisting}
> +
> +The \field{msg_type} field identifies the message type.
> +
> +\begin{description}
> +\item[VIRTIO_RTC_NOTIF_ALARM] notifies the driver about an alarm
> +        expiration.
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_NOTIF_ALARM 0x2000 /* message type */
> +
> +struct virtio_rtc_notif_alarm {
> +        struct virtio_rtc_notif_head head;
> +        le16 clock_id;
> +        u8 reserved[6];
> +};
> +\end{lstlisting}
> +
> +\end{description}
> +
> +\field{clock_id} identifies the expired alarm through its associated
> +clock.
> -- 
> 2.43.0
> 
> 

