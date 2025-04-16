Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AC822F384
	for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 08:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791482; cv=none; b=FCkqhcTwju2hesSIT4DBvSWP9Ag8hN/tgbMdOLfuNyLezy6jbOJ13T1lNzJY8NGR3esFpfNrEymQwMPiVITy/qUXnCUyDqxF6jh21UrVjwglYm21BOV1EhzdAj3/DcdO98ah4pYXyPvgrYCs9ll7FBCJWbCfQtfwBSxK49SnuGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791482; c=relaxed/simple;
	bh=uBa/6/j1T1mRYoCSEbhf5UnHoSinSY2pTCIsYIE8kfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jcCwlYxPadGepmq2SHtQPchDyWBPDMQfms+dtU/sRfLibjjaWwAuF4CzUIWfVzSpYr63VqXNf27k6v2XeCea2hyhshCD4ajMDoLtKLwUYxWsXDbzx2lWqBlngS5gh7dM/9aBK/FHdQGjpodGfJVqN5O82XZevyBZ4PVMGeCSrbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bv9G2M5X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bv9G2M5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744791477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qmzkeGsTlYa7RefCEr/CknJSFADxUMRU3ypL5nyeFI4=;
	b=bv9G2M5X1gIYpajem3AGB33Kernpbv3zOInrL8BZdTz0QGXSjPJSEWkz3g6r/sRG334Vfu
	0HpmHodVvbSTIT8K+STIFEBIS5gYaxdN6de+vSj10KbsQ84KWkqs+1zuu03wnmWsd1O3zO
	x4mqOEzQFNTcDFdZVmd74fOLdkBZTU8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-RaW-oMFYMLqN9WlxUbxRIg-1; Wed, 16 Apr 2025 04:17:39 -0400
X-MC-Unique: RaW-oMFYMLqN9WlxUbxRIg-1
X-Mimecast-MFC-AGG-ID: RaW-oMFYMLqN9WlxUbxRIg_1744791458
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so50317015e9.1
        for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 01:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791458; x=1745396258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmzkeGsTlYa7RefCEr/CknJSFADxUMRU3ypL5nyeFI4=;
        b=doWaOixfra2JdWAlkVMXrtITi2fnfgpUb9UvCi2tB34mgdH6es6g+i9tQEbHUCj2v/
         F81ehWrUdeg6FUiT1uHgIIExtQ/fUGRAx7aVVenJhGYn6bp9CGY4iXFVcjDwwZhKLdP3
         RMuEsbOXQQ/Yx3Xbrv4x3WfcfvQZ9EJkxZDuNiZEEFXzhkxf6DRC5kaiyyBw2/19zQEY
         PadIrGKAFixnnjG4P3IiURCDbqxUsWocOSbSKiiBMhEhYlNvK3hknH0AOAnKCArupIlk
         B83w9TJLdGtNoNzskUWwBXZm3R4lg/Uu401KYz7mjDiQXwaOTV8kfJQEB02imm2gadV3
         +SJg==
X-Gm-Message-State: AOJu0YzoJprHAdIyreA8WSSGYe8WXzmnQLYgWhvLMLJIreA0OeY4WfvJ
	iDgm4vJ8MgRH+mKaVUVk2XNfNzipJkTnnq7qrvlioxEmBybvH9elZNdL2C4k0R4QQktRJdRTwF2
	T5IAZQQQw2FGAkuUplw4x0BRBeS2erDJ9F8h3T0iYw49KaWY32uoClQi4KMxnDkhP
X-Gm-Gg: ASbGncuOl5eGb7WEHvGEogjK/Zn9835AzfDzzpgv5+YmA/Pvn9G5GUNqogvL564UaWm
	tGa61ncWXwjFcw9RuQBmlNK5209FireeRc1azNF0KH1fx3BSGFiNXBw/B2L/uHTPoCpt9IUS9nO
	cpLHNOWWSazibo7lGKFDmIHBk+wtedq2QXDHCoBT6K0iupeu16mv4Bd2EaMHSTxZXHCcD8hqfn3
	NWKiy80NNTw8L3aejc1ftRExqoOptl8oPMpQiTseU0gzekgsldjmbDAFUIzmqMNKfbLAlEvGTRH
	OTLUEQ==
X-Received: by 2002:a05:6000:184e:b0:399:7f43:b3a4 with SMTP id ffacd0b85a97d-39ee5b1665emr971669f8f.24.1744791457601;
        Wed, 16 Apr 2025 01:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECqU3SXIUZAcwdp0v/Qfkbtw41r5jk6Ni0Rzd92sYtmjXgw24mm5P2HZj2gGWuSJPchgXkeg==
X-Received: by 2002:a05:6000:184e:b0:399:7f43:b3a4 with SMTP id ffacd0b85a97d-39ee5b1665emr971635f8f.24.1744791457094;
        Wed, 16 Apr 2025 01:17:37 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c123sm16967542f8f.36.2025.04.16.01.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:17:35 -0700 (PDT)
Date: Wed, 16 Apr 2025 10:17:33 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>
Subject: Re: [PATCH v8 3/4] virtio-rtc: Add alarm feature
Message-ID: <Z/9nnYxbkOcyR131@fedora>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <20250306095112.1293-4-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250306095112.1293-4-quic_philber@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: we7HH40EiV2bnnlf7zyqjxyD0P3NTrhV4yRFWFRHIhs_1744791458
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 06, 2025 at 10:51:11AM +0100, Peter Hilber wrote:
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
>     v8:
>     
>     - Explicitly describe alarm enabled status, where relevant (Matias
>       Ezequiel Vara Larsen).
>     
>     - Change word order from "field X" to "the X field" (Matias Ezequiel
>       Vara Larsen).
>     
>     - Change word order from "flag X" to "the X flag" or "X".
>     
>     - Change "once" to "when" (Matias Ezequiel Vara Larsen).
>     
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
>  device-types/rtc/description.tex | 262 ++++++++++++++++++++++++++++++-
>  1 file changed, 260 insertions(+), 2 deletions(-)
> 
> diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> index f2a3907de511..93bcf178b042 100644
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
> @@ -373,7 +384,8 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
>          struct virtio_rtc_resp_head head;
>          u8 type;
>          u8 leap_second_smearing;
> -        u8 reserved[6];
> +        u8 flags;
> +        u8 reserved[5];
>  };
>  \end{lstlisting}
>  
> @@ -384,6 +396,15 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
>  variant} through the \field{leap_second_smearing} field. All other
>  clocks set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
>  
> +The \field{flags} field provides the following information:
> +
> +\begin{lstlisting}
> +#define VIRTIO_RTC_FLAG_ALARM_CAP               (1 << 0)
> +\end{lstlisting}
> +
> +If VIRTIO_RTC_F_ALARM was negotiated, the VIRTIO_RTC_FLAG_ALARM_CAP flag
> +indicates that the clock supports an alarm.
> +
>  \item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
>  cross-timestamping for a particular pair of clock and hardware counter.
>  
> @@ -690,3 +711,240 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
>  For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in this
>  specification, the device MUST use the nanosecond as unit for the
>  \field{clock_reading} field.
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
> +device, are available if VIRTIO_RTC_F_ALARM was negotiated. 

"If the VIRTIO_xxx has been negotiated, ..."

> In addition,
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

I think you can add the "when" after "expires" and then remove it
afterward.

> +
> +\begin{itemize}
> +\item when the associated clock progresses (also: steps) from a time
> +        prior to the alarm time to the alarm time, or to a time after
> +        the alarm time, while the alarm is enabled, or
> +
> +\item when the driver sets an alarm time which is not in the future,
> +        while also setting the alarm to enabled, or
> +
> +\item when the driver sets the alarm to enabled, and the alarm time is
> +        not in the future, or
> +
> +\item when the device is reset, if the alarm time is retained and not in
> +        the future, and if the alarm is enabled.\footnote{The device is
> +                always responsible for detecting alarm expiration
> +                events. This avoids that the driver needs to reason
> +                about when it shall poll for alarm expiration.}
> +\end{itemize}
> +
> +When an alarm expires, the driver can disable it. Otherwise, the alarm
> +expires each time when one of the above expiration events occurs, even
> +if it occurred before.\footnote{This avoids that the driver may
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
> +        is not live, or no buffers are available in the alarmq, the
> +        device will notify once the device is live and buffers are
> +        available.
> +
> +\item Optionally, the device executes other, implementation-specific,
> +        actions. The device may execute those immediately, regardless of
> +        the device state.
> +\end{itemize}
> +

I think that, on alarm expiration, you can remove the optionally part
and then just talk about alarm expiration thus removing the `alarm
actions` wording.  

> +An alarm \emph{expiration} becomes obsolete
> +
> +\begin{itemize}
> +\item when the driver disables the alarm, or
> +
> +\item when the driver sets an alarm time, or
> +
> +\item when the clock jumps backwards, before the alarm time, or
> +
> +\item when another alarm expiration event happens.
> +\end{itemize}
> +
> +If an alarm expiration becomes obsolete, it is unspecified which alarm
> +actions the device executes for this alarm expiration, and the device
> +stops executing these alarm actions after a grace period.

Can't you leave this paragraph implementation-specific and thus
removing it completely?

> +
> +The device supports all alarm time values which the driver can request
> +through alarm control requests.
> +
> +Initially, the alarm time is the epoch of the clock ($0$), and the alarm
> +is disabled.

I would rewrite it as:

"Every alarm initializes with an alarm time to 0 and disabled."

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
> +\field{clock_id} identifies the alarm through its associated clock. The
> +\field{alarm_time} field returns the alarm time. In the \field{flags}
> +field, VIRTIO_RTC_FLAG_ALARM_ENABLED indicates whether the alarm is
> +enabled.
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
> +\field{clock_id} identifies the alarm through its associated clock. The
> +\field{alarm_time} field sets the alarm time. If
> +VIRTIO_RTC_FLAG_ALARM_ENABLED is set in the \field{flags} field, the
> +device enables the alarm; otherwise, the device disables the alarm.
> +
> +\item[VIRTIO_RTC_REQ_SET_ALARM_ENABLED] enables or disables the alarm.
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
> +VIRTIO_RTC_FLAG_ALARM_ENABLED is set in the \field{flags} field, the
> +device enables the alarm; otherwise, the device disables the alarm.
> +
> +When processing this request, the device retains the alarm time.
> +
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

