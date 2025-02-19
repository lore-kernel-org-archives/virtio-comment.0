Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEFA1F9421
	for <virtio-comment@lists.linux.dev>; Wed, 19 Feb 2025 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981329; cv=none; b=XOlpxS3D2iVuMaqB0/oH9RoFKu2yUICCigebtThfknNQOlbBS7XsVdEf01Y5igIk+POCg6sHUFXHO8fx+7Imm1qbizsNQlqgaUGL2MsFZsgUmvC2JMEBa85KxTXGfgD/+l38bvf11N1SIQTf+7dj8AA6R3qkTvSU/hi+1D6w4HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981329; c=relaxed/simple;
	bh=wUKIjW2+61l53M5pG1dYiLxZPXeMtpooUmYGsvx6zRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=mL9Dq7Px16SOy9c56jhj3KuOpVlNrp5bez0evSoGymStpEeYH68yqpsu0jWxYdYetvOQEnxELxAIjivXJMv5Nk+KbZxpFedbLO90S6ipCrslEUU8+rYVikoeysA/uTYl4PVq228CMsslIqMI7ID6divDyjw9qV1UCQB5bCRck8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DYSS9maI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DYSS9maI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739981326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=132diJot4Q+ZCfh3tqvAa/fIaG3tgirIMteqeLH73oY=;
	b=DYSS9maIHutxOOU0hmUx9bTVbbUk2kNux0LK6k+yMMHlachZng+C7G/WJG6NXuQkyj4smA
	jhvJXWQWQ3XFTtgoGIYLy8UeoVkfe5FuYbJbdr/iYnoCPHNLDA5QQp4wfQcvKeOVvOM0rt
	Xyn/xQtNRcD73J3bh0HGeiMn0NBaxHM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-zNxsWAISMbC0r6WwPd67OQ-1; Wed, 19 Feb 2025 11:08:44 -0500
X-MC-Unique: zNxsWAISMbC0r6WwPd67OQ-1
X-Mimecast-MFC-AGG-ID: zNxsWAISMbC0r6WwPd67OQ_1739981323
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4393b6763a3so35219255e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 19 Feb 2025 08:08:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981323; x=1740586123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=132diJot4Q+ZCfh3tqvAa/fIaG3tgirIMteqeLH73oY=;
        b=ePb3+BmqW54plOOPPi/WJ11G7aw+FpHRFxR6AkxDapIQdfAMepUAQEHaH/Qeu6Ljud
         iR/43KNoc5vPpOIhCBprP4vz8K1ex8NTaVpaxgZIZRRg+H1o057xVE6Y9fHGy1I5Zq4g
         3r9VvGEHsOzUFz61ypH0T0PLe/AdxAMywkhrnFSiwaAVw7aevvAPBQtftH6Ix20vGQHj
         nV3xtl5OcICQp/w5WzENB/yjdK0qJDuu8Q9DoXDHjK9XbqB3RiVMryLE3jiSAtuJ4CHq
         RaxPBo/yQUcO3sgM7ss6cTCrVEPU1SmG1wgyRUINoqc3dD4TmCKKavw6WbeUkxe6Igor
         amUw==
X-Gm-Message-State: AOJu0YxjfHPKJDmLbMcpBS1q850p7YYlazavJgOhVmEDmrQ0OUIafeVV
	jDq9nYmP5IrKvQX0lRCaRGH1jpF5F4PQowQ5df8FWfPqnjiZhLlg7WaS3H0fUzqzyG3TB9ymhx3
	cOsGE5aVMSIfnVZJppd7RNY3nZcp5m24kTYBVQphv/lasWi7eB7WNokskSyMYF59P
X-Gm-Gg: ASbGnctcribRfMDyO9OoKjuoIUo1YSRDP8gbGSoV2t95MBdiZ19ncgZiFVuW7Oy4Zw3
	37l/i9n/0v26ygI91JO7tZ2csFTcMGRfTs1Xxq8S3tUfAJ7MEinWUfHI/TwdbK/+FR+DEPxh+lI
	KDe8Cel8wh157W+RNNbirk0y8i4azreDwZrrE/R47+4/YsRLx4a8VI/LMkODmxjW1uP1wdmW2K+
	WNcTfIn0dIMaJ0Hn1HcSXHYN9pphvUCszlhkEAnhEh9up2yH3m6hYNKMky13EXZpEZIottFnG0=
X-Received: by 2002:a05:600c:450d:b0:434:f0df:9f6 with SMTP id 5b1f17b1804b1-4399cbb7f13mr26228785e9.3.1739981323119;
        Wed, 19 Feb 2025 08:08:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCR3VWXjIOQwTSx1Yl6e+qUPHYuy0MjbMlG+PgmnXeUltt+yt3qkdi8DKZlx7am+L6k9LB/Q==
X-Received: by 2002:a05:600c:450d:b0:434:f0df:9f6 with SMTP id 5b1f17b1804b1-4399cbb7f13mr26228185e9.3.1739981322552;
        Wed, 19 Feb 2025 08:08:42 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a0558e2sm216165995e9.11.2025.02.19.08.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:08:42 -0800 (PST)
Date: Wed, 19 Feb 2025 17:08:35 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Subject: Re: [PATCH v7 3/4] virtio-rtc: Add alarm feature
Message-ID: <Z7YCA1BWmGb+eqwH@fedora>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-4-quic_philber@quicinc.com>
 <Z6s52sYSmuhp8M4/@fedora>
 <3gos5s6jqul2o5bn26t5ie5b44ernrbk7r262kns5gnma5mvpe@ej3aicxv2jav>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3gos5s6jqul2o5bn26t5ie5b44ernrbk7r262kns5gnma5mvpe@ej3aicxv2jav>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gQyf2U85_vwIeOmIqZdujUiYvSFRkhxSdVW9XCMU3tU_1739981323
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2025 at 07:13:47PM +0100, Peter Hilber wrote:
> On Tue, Feb 11, 2025 at 12:51:54PM +0100, Matias Ezequiel Vara Larsen wrote:
> > On Thu, Jan 23, 2025 at 11:16:14AM +0100, Peter Hilber wrote:
> > > Add the VIRTIO_RTC_F_ALARM feature (without normative statements).
> > > 
> > > The intended use case is: A driver needs to react when an alarm time has
> > > been reached, but at alarm time, the driver may be in a sleep state or
> > > powered off. The alarm feature can resume and notify the driver in this
> > > case. Alarms may be retained across device resets (including reset on
> > > boot).
> > > 
> > > Peculiarities
> > > -------------
> > > 
> > > Unlike usual alarm clocks, a virtio-rtc alarm-capable clock may step
> > > autonomously at any time: An alarm may change back from "expired" to
> > > "not expired" before the driver has started processing an alarm
> > > notification.
> > > 
> > > To address the above, and the device resets, define "alarm expiration"
> > > in such a way that the driver always has a chance to react to an alarm,
> > > and make the device always responsible for notifying the driver about an
> > > alarm expiration.
> > > 
> > > The VIRTIO_RTC_REQ_SET_ALARM_ENABLED request is there so that the Linux
> > > ioctls RTC_AIE_ON and RTC_AIE_OFF only need to emit one request.
> > > 
> > > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > > ---
> > > 
> > > Notes:
> > >     v7:
> > >     
> > >     - Change flag numeric value due to removing leap second indication.
> > >     
> > >     v5:
> > >     
> > >     - Reformat.
> > >     
> > >     v4:
> > >     
> > >     - Change requirements so that driver can reset alarm to clean slate, and
> > >       document how driver can achieve this (Cornelia Hell, Jason Wang) [1].
> > >     
> > >     - Require device to support all expressible alarm times.
> > >     
> > >     - Formatting and wording improvements.
> > >     
> > >     [1] https://lore.kernel.org/all/2ae67401-a8f5-4686-9321-cb3105df594d@opensynergy.com/
> > > 
> > >  device-types/rtc/description.tex | 270 ++++++++++++++++++++++++++++++-
> > >  1 file changed, 268 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> > > index 2aefc22cb649..47ad50cd95ca 100644
> > > --- a/device-types/rtc/description.tex
> > > +++ b/device-types/rtc/description.tex
> > > @@ -4,6 +4,7 @@ \section{RTC Device}\label{sec:Device Types / RTC Device}
> > >  time. The device can provide different clocks, e.g.\ for the UTC or TAI
> > >  time standards, or for physical time elapsed since some past epoch. The
> > >  driver can read the clocks with simple or more accurate methods.
> > > +Optionally, the driver can set an alarm.
> > >  
> > >  \subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
> > >  
> > > @@ -13,13 +14,23 @@ \subsection{Virtqueues}\label{sec:Device Types / RTC Device / Virtqueues}
> > >  
> > >  \begin{description}
> > >  \item[0] requestq
> > > +\item[1] alarmq
> > >  \end{description}
> > >  
> > >  The driver enqueues requests to the requestq.
> > >  
> > > +Through the alarmq, the device notifies the driver about alarm
> > > +expirations. The alarmq exists only if VIRTIO_RTC_F_ALARM was
> > > +negotiated.
> > > +
> > >  \subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
> > >  
> > > -No device-specific feature bits are defined yet.
> > > +\begin{description}
> > > +\item[VIRTIO_RTC_F_ALARM (0)] Device supports alarm.
> > > +\end{description}
> > > +
> > > +VIRTIO_RTC_F_ALARM determines whether the device supports setting an
> > > +alarm for some of the clocks.
> > >  
> > >  \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
> > >  
> > > @@ -376,7 +387,8 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
> > >          struct virtio_rtc_resp_head head;
> > >          u8 type;
> > >          u8 leap_second_smearing;
> > > -        u8 reserved[6];
> > > +        u8 flags;
> > 
> > I wonder if you can just define flags in the first patch instead of
> > introduce it here. I think flags field may be used for other purpose in
> > the future but I do not have an strong opinion.
> > 
> 
> Extending the spec by adding new fields in place of reserved array
> members should be unproblematic, so I added the field only when
> introducing a meaningful flag. Actually, other messages could also get
> flags fields in the future (which would only become meaningful if the
> respective features are negotiated).
> 
> So I propose to not change, since otherwise "flags" fields could
> arguably be added all over the place in the first patch.

Sounds good.

> 
> > > +        u8 reserved[5];
> > >  };
> > >  \end{lstlisting}
> > >  
> > > @@ -387,6 +399,15 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
> > >  variant} through field \field{leap_second_smearing}. All other clocks
> > >  set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
> > >  
> > > +The \field{flags} field provides the following information:
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_RTC_FLAG_ALARM_CAP               (1 << 0)
> > > +\end{lstlisting}
> > > +
> > > +If VIRTIO_RTC_F_ALARM was negotiated, flag VIRTIO_RTC_FLAG_ALARM_CAP
> > > +indicates that the clock supports an alarm.
> > > +
> > >  \item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
> > >  cross-timestamping for a particular pair of clock and hardware counter.
> > >  
> > > @@ -693,3 +714,248 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
> > >  For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in
> > >  this specification, the device MUST use the nanosecond as unit for
> > >  field \field{clock_reading}.
> > > +
> > > +\subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
> > > +
> > > +Through the optional alarm feature, the driver can set an alarm time. On
> > > +alarm expiration, the device notifies the driver. On alarm expiration,
> > > +the device may also wake up the driver, while the driver is in a sleep
> > > +state, or while the driver is powered off. How this is done is beyond
> > > +the scope of the specification. The driver can set one alarm time per
> > > +clock, if the clock supports this.
> > > +
> > > +The device may retain alarm times across device resets.\footnote{Drivers
> > > +        may reset the device on boot or on resume from sleep state. It
> > > +        can make sense for the device to retain the alarm time then,
> > > +        similar to other alarm clocks.}
> > > +
> > > +The alarm feature, and the associated alarmq for notifications from the
> > > +device, are available if VIRTIO_RTC_F_ALARM was negotiated. In addition,
> > > +if the driver previously set an alarm time, even if the device no longer
> > > +both
> > > +
> > > +\begin{itemize}
> > > +\item is live and
> > > +\item has negotiated VIRTIO_RTC_F_ALARM,
> > > +\end{itemize}
> > > +
> > > +the device may still execute implementation-specific actions on alarm
> > > +expiration.
> > > +
> > > +An alarm expires
> > > +
> > > +\begin{itemize}
> > > +\item when the associated clock progresses (also: steps) from a time
> > > +        prior to the alarm time to the alarm time, or to a time after
> > > +        the alarm time, or
> > > +
> > > +\item when the driver sets an alarm time which is not in the future, or
> > > +
> > > +\item when the device is reset, if the alarm time is retained and not in
> > > +        the future.\footnote{The device is always responsible for
> > > +        detecting alarm expiration events. This avoids that the driver
> > > +        needs to reason about when it shall poll for alarm expiration.}
> > > +\end{itemize}
> > > +
> > > +When an alarm expires, the driver can disable it. Otherwise, the alarm
> > > +expires each time when one of the above expiration events occurs, even
> > > +if it occurred before.\footnote{This avoids that the driver may
> > 
> > When an alarm expires, the device keeps notifying the driver that the
> > alarm has expired? is that implementation-specific?
> > 
> 
> Devices are not required to retain the alarm across a reset. So whether
> an alarm is retained across a reset is unspecified.
> 
> Apart from this, there is nothing implementation-specific about when the
> device notifies the driver through the alarmq (once after each expiry
> event as per the above enumeration).
> 
> The expiry events avoid that the driver misses an alarm, or that the
> driver needs to implement extra logic to recognize a missed alarm.
> 
> As for "keeps notifying", the notification only happens once after each
> of the expiry events described above. Real-life drivers will likely
> disable the alarm when they first acknowledge the notification,
> preventing any further expiry events. The Linux kernel RTC subsystem
> does this.
> 

I see, thanks for the explanation.

> > > +        miss an alarm when the clock steps backwards after alarm
> > > +        expiration, but before the driver has resumed operation. This
> > > +        also facilitates distinct drivers using the same device,
> > > +        e.g.\ a driver in the bootloader, and a driver in the OS.}
> > > +
> > > +On alarm expiration, the device executes the alarm actions. The alarm
> > > +actions are:
> > > +
> > > +\begin{itemize}
> > > +\item The device notifies the driver through the alarmq. If the device
> > 
> > Do you mean the driver?
> > 
> 
> No. "The device is live" means that the DRIVER_OK status bit is set (and
> the DEVICE_NEEDS_RESET bit is cleared). But the "live" terminology is
> apparently not used much outside of "Driver Requirements: Device
> Initialization".

I see, thanks.

> 
> Maybe I should write instead "If the device is not operating, or if no
> buffers are available [...]".

I think `live` is fine.

> 
> > > +        is not live, or no buffers are available in the alarmq, the
> > > +        device will notify once the device is live and buffers are
> > > +        available.
> > > +
> > > +\item Optionally, the device executes other, implementation-specific,
> > > +        actions. The device may execute those immediately, regardless of
> > > +        the device state.
> > > +\end{itemize}
> > > +
> > > +An alarm expiration becomes obsolete
> > > +
> > > +\begin{itemize}
> > > +\item once the clock jumps backwards, before the alarm time, or
> > > +
> > > +\item once the driver sets an alarm time, or
> > > +
> > > +\item once another alarm expiration event happens.
> > > +\end{itemize}
> > > +
> > 
> > This is a minor comment, I think you can use `when` instead of `once` like
> > in the paragraph before.
> > 
> 
> OK.
> 
> > > +If an alarm expiration becomes obsolete, it is unspecified which alarm
> > > +actions the device executes for this alarm expiration, and the device
> > > +stops executing these alarm actions after a grace period.
> > 
> > What is a grace period? You mean that whatever the device does after
> > alarm expiration, the device has to STOP doing it after a grace period.
> > Am I right?
> > 
> 
> "[An] alarm expiration becomes obsolete" means that the device should no
> longer act according to the alarm (typically because the driver disabled
> the alarm, or for one of the other reasons listed in the above
> enumeration). In this case, the device must stop the alarm actions as
> soon as possible (within a finite grace period). 
> 
> Maybe I could rephrase like this?
> 
> 	If an alarm expiration becomes obsolete as per the above
> 	conditions, it is unspecified which alarm actions the device
> 	executes for this alarm expiration, and the device stops
> 	executing these alarm actions as soon as possible.
> 

I wonder if we can just drop this and let the device implementation do
decide when an alarm is obsolete and what to do in that situation.

> > > +
> > > +The driver-visible settings of an alarm consist of two elements:
> > > +
> > > +\begin{itemize}
> > > +\item \field{driver_alarm_time}, a valid time for the corresponding
> > > +        clock, and
> > > +
> > > +\item \field{alarm_enabled}, a boolean. While \field{alarm_enabled} is
> > > +        true, \field{driver_alarm_time} is the actual alarm time.
> > > +        While \field{alarm_enabled} is false, the device will act as if
> > > +        the alarm time was in the future, so that the alarm will not
> > > +        expire.
> > > +\end{itemize}
> > 
> > Is `alarm_enabled` a field that is device implementation specific?
> > 
> 
> No. The use of "\field{}" around alarm_enabled is for typographic
> purposes, not because it is supposed to correspond to a particular
> element in the device implementation. It is unspecified how the device
> implements the alarm feature.
> 
> The two elements mentioned above describe the state of the alarm in the
> device which the driver can set and get through the respective requests.
> 
> By overriding driver_alarm_time with an alarm time in an unreachable
> future if alarm_enabled is false, the spec does not need to consider the
> alarm_enabled state in most places. Most non-normative text and most
> requirements just need to refer to "alarm time reached", not to "alarm
> time reached and alarm enabled".

I see, are you suggesting to replace driver_alarm_time and alarm_enabled
occurrences?  

Matias

