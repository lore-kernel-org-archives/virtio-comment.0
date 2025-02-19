Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9AB1C5F1B
	for <virtio-comment@lists.linux.dev>; Wed, 19 Feb 2025 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739979390; cv=none; b=qaNtGqxxPdAFdg/8GNMd/6qcZoiXxh1yauIwwgpOeLEIH/YzlbU50eINetO5TS02ts7D/PTeqsLiTauDOdsfH/jx1lYAy6OHoQEONB2Alfua9PKdrAvhpcKUcK7zJquUpkMKRukUR82ETRWCM/BvE6tv4eJwE+XhM9QVitIeMLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739979390; c=relaxed/simple;
	bh=LcqSB4noeJDHvIxITtEDu3TOOAPZr/iaYo+tzCjgzlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=D/RsjrUgIA9rDOoCwPpFfzBug/mgKwJ7/TMtPOkvVqHQDsJ3pI7tgoV6S+ihIs1/ADryXFfCBW1k30vtb/+GpmIMDfZAagjffLPWkFE/IGrwjGUCGAlRe9N+aXMVPhK8eASvCI7BxmyOkpsKePjG6Y8FobLkjuZnG4iLZ4CY7so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZJXIc/+f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZJXIc/+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739979386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B4QHLIY3syg/wNHe+NIo1hE7gtbv+d2Uf1kQU9t6LvI=;
	b=ZJXIc/+fQCeF6zBB2oSyvVsUDzi7dyFzwiLopU0oErLNr98Rj6cQ2UXhzLH75ZEDFAgykF
	J1IZowTc4E3MLT1lK5KZMvgAyNGRENUV1X0UykOCYxTX9G1TgWmOu+Y0GgTuLoCBOyvIcS
	JdcScaV5hPewjGDB0qQmmSL97BEkVOc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-Czgy0pIaNBW6iyaMdL5tvg-1; Wed, 19 Feb 2025 10:36:23 -0500
X-MC-Unique: Czgy0pIaNBW6iyaMdL5tvg-1
X-Mimecast-MFC-AGG-ID: Czgy0pIaNBW6iyaMdL5tvg_1739979382
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4399d2a1331so3959145e9.1
        for <virtio-comment@lists.linux.dev>; Wed, 19 Feb 2025 07:36:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739979382; x=1740584182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4QHLIY3syg/wNHe+NIo1hE7gtbv+d2Uf1kQU9t6LvI=;
        b=CiC/nrAN1EDooCLnYDwt65KkCUvMU9jTTb/2Ridssvs4YY02FN8wLHY4vWB5zYkQ9V
         LL/CcccMhG0v3bQRLxZU/d5ElUWl6CHEu6LyPMA0T+pSLeZE3R/Boye15Q8J9oqqBI0Y
         nYStCkaGQlQLyK5Xg3E1qDUitNS/4GzS+RJYVE9k/DwQ4y16x7ZaNs1B4motOXkMB7d6
         bz7ba3gZON2bI5RttbfX/N6I306rSf0DtYela1egB/3areqTjETY6YzCparv/3i188PY
         FqnYp+N29byYQ8/Zy+jp1y68xgKD+mDsH+lQY3d0PwQXdbWvDiNxn0P7jrPaYWyL39pJ
         BUtg==
X-Gm-Message-State: AOJu0YyqQ0C0jEEOBL2U/moVA9ODZvDh+TwMhZGFDLKF1yoF7YKt/b7z
	x0LM9gRCJVFSgw6gWUtHIcN6nWCokeIHbsZ/RATRThRlx6+9Nn5TLR5rfM3TCZD9rL+DcZkmU0J
	/Cio+THpnrPcNBeYXidXEERriby2Kxthix9eiiLQ3nBJiIlOC8QRgQ4QN/TsyRLsz
X-Gm-Gg: ASbGnctaSZV3Eo1jl8JQ06fp873V86jWwiLeaQL2ABk/yu/PRWb9PNEwMbvkaUBEUG5
	2W54Y6QGVKUjKevwu2vWGcVIif/r6Hjju0JFi0uQ8HkePcKHdir4gTFfFjqrwgxlYFP11uDC6MO
	yweBYH5+mci4i4vvRKMI+I0XJqCmPGG0LVSbfNzHlGyXbtDUf5dYNGSqxpU5b0lzwDuZ7uRHoKH
	IBAV/gO75C6p8T6tXDKFZhCPZLEBAvY1f48DPvUqHGmmAocn+WvaSmGPQaqt0KtzRhh5YPBLdk=
X-Received: by 2002:a05:600c:358e:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-43999acd24cmr40006545e9.3.1739979382377;
        Wed, 19 Feb 2025 07:36:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh+nPD/Z7oRYiWQxR43LnalEtkqh0GVzi0gdyqxrnMKF9eHtatLYxHyErCsHOCdO59T1+FgQ==
X-Received: by 2002:a05:600c:358e:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-43999acd24cmr40006275e9.3.1739979381985;
        Wed, 19 Feb 2025 07:36:21 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a055859sm217831345e9.10.2025.02.19.07.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 07:36:21 -0800 (PST)
Date: Wed, 19 Feb 2025 16:36:14 +0100
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
Message-ID: <Z7X6bpwsqRymDHZu@fedora>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-5-quic_philber@quicinc.com>
 <Z6tDpi07Pyk+Xjzi@fedora>
 <cyjnfnuijj57k32t2naprt65jsvm4bxc3ehkpdmempp2kgkg5i@kkere6bvir6d>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cyjnfnuijj57k32t2naprt65jsvm4bxc3ehkpdmempp2kgkg5i@kkere6bvir6d>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7uAWtOuCIVooPagu7HP6EU9FI4E7WccQIdSb7qf4T1Q_1739979382
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2025 at 07:14:30PM +0100, Peter Hilber wrote:
> On Tue, Feb 11, 2025 at 01:33:42PM +0100, Matias Ezequiel Vara Larsen wrote:
> > On Thu, Jan 23, 2025 at 11:16:15AM +0100, Peter Hilber wrote:
> > > Add the normative statements for the alarm feature added previously.
> > > 
> > > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > > ---
> > > 
> > > Notes:
> > >     v7:
> > >     
> > >     - Remove inadvertent v6 changes, which should have been part of
> > >       preceding patches.
> > >     
> > >     v4:
> > >     
> > >     - Update normative statements to match v4 changes to non-normative
> > >       statements (patch 3).
> > >     
> > >     - Driver should read clock to confirm that alarm has expired.
> > >     
> > >     - Formatting and wording improvements.
> > > 
> > >  device-types/rtc/description.tex        | 157 ++++++++++++++++++++++++
> > >  device-types/rtc/device-conformance.tex |   4 +
> > >  device-types/rtc/driver-conformance.tex |   2 +
> > >  3 files changed, 163 insertions(+)
> > > 
> > > diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> > > index 47ad50cd95ca..32fed5f8620f 100644
> > > --- a/device-types/rtc/description.tex
> > > +++ b/device-types/rtc/description.tex
> > > @@ -32,6 +32,11 @@ \subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
> > >  VIRTIO_RTC_F_ALARM determines whether the device supports setting an
> > >  alarm for some of the clocks.
> > >  
> > > +\devicenormative{\subsubsection}{Feature bits}{Device Types / RTC Device / Feature bits}
> > > +
> > > +The device SHOULD offer VIRTIO_RTC_F_ALARM if the device can support
> > > +setting an alarm for any of its clocks.
> > 
> > I think you can remove `can`.
> > 
> 
> OK.
> 
> > > +
> > >  \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
> > >  
> > >  There is no configuration data for the device.
> > > @@ -715,6 +720,12 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
> > >  this specification, the device MUST use the nanosecond as unit for
> > >  field \field{clock_reading}.
> > >  
> > > +If VIRTIO_RTC_F_ALARM was negotiated, and the device sent an alarm
> > > +notification N for clock C with alarm time A, the device MUST, for all
> > > +read requests of C which the driver marks as available after the device
> > > +marked N as used, return a \field{clock_reading} which does not precede
> > > +A, unless C stepped backwards to before A.
> > > +
> > 
> > I wonder if there is a simpler way to rewrite this paragraph. It is a
> > bit hard to follow.
> > 
> 
> Like this?
> 
>     If the device sent an alarm notification for clock C with alarm time A,
>     the device MUST, for all read requests of C which the driver marks as
>     available after the notification, return a \field{clock_reading} which
>     does not precede A (except if C stepped backwards to before A).
> 

I think it is better.

> > >  \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
> > >  
> > >  Through the optional alarm feature, the driver can set an alarm time. On
> > > @@ -828,6 +839,79 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
> > >  To prevent the above issues, the driver also marks buffers in the alarmq
> > >  as available only after completing the above steps for all clocks.
> > >  
> > > +\devicenormative{\paragraph}{Alarm Operation}{Device Types / RTC Device / Device Operation / Alarm Operation}
> > > +
> > > +The device MAY retain both \field{driver_alarm_time} and
> > > +\field{alarm_enabled} of a clock across a device reset.
> > > +
> > > +If the device did not retain \field{driver_alarm_time} and
> > > +\field{alarm_enabled} of a clock across a device reset, the device MUST
> > > +initialize \field{driver_alarm_time} to 0.
> > > +
> > > +If the device did not retain \field{driver_alarm_time} and
> > > +\field{alarm_enabled} of a clock across a device reset, the device MUST
> > > +initialize \field{alarm_enabled} to false.
> > > +
> > > +While \field{alarm_enabled} for a clock is true, the device MUST set the
> > > +alarm time to \field{driver_alarm_time}.
> > > +
> > > +While \field{alarm_enabled} for a clock is false, the device MUST act as
> > > +if the alarm time was in the future.
> > > +
> > > +If VIRTIO_RTC_F_ALARM was negotiated, the device MUST support the alarm
> > > +messages, VIRTIO_RTC_REQ_READ_ALARM, VIRTIO_RTC_REQ_SET_ALARM,
> > > +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, and VIRTIO_RTC_NOTIF_ALARM, for one or
> > > +more clocks.
> > > +
> > > +If VIRTIO_RTC_F_ALARM was not negotiated, the device MUST NOT support the
> > > +alarm messages.
> > > +
> > > +The device MUST set flag VIRTIO_RTC_FLAG_ALARM_CAP in \field{struct
> > > +virtio_rtc_resp_clock_cap.flags} if the respective clock supports alarm
> > > +messages, and clear the flag otherwise.
> > > +
> > > +The device MUST consider it an alarm expiration event when the
> > > +associated clock progresses (also: steps) from a time prior to the alarm
> > > +time to the alarm time, or to a time after the alarm time.
> > > +
> > > +The device MUST consider it an alarm expiration event when the
> > > +driver sets an alarm time which the associated clock has already reached
> > > +or passed.
> > > +
> > > +If the device retained \field{driver_alarm_time} and
> > > +\field{alarm_enabled} of a clock across a device reset, and the clock
> > > +has already reached or passed the alarm time, the device MUST consider
> > > +this device reset an alarm expiration event.
> > > +
> > > +If an alarm expiration event E happens, the device MUST start serving
> > > +the alarm expiration event E.
> > > +
> > > +If the driver successfully requests VIRTIO_RTC_REQ_SET_ALARM, or
> > > +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, for clock C, the device MUST stop
> > > +serving any previous alarm expiration event for C before the device
> > > +marks the message as used.
> > 
> > What do you mean with serving?
> > 
> 
> "Serving an alarm expiration event" means 
> 
> - executing the corresponding alarm actions, and/or 
> 
> - waiting for alarmq notification to become possible.
> 
> That execution is defined in the third and fourth requirement quoted
> below. Maybe these requirements should be moved above the others. Would
> that suffice to clarify?
> 

Oh I see, thanks.

> 
> Thanks for the review,
> 
> Peter
> 
> > > +
> > > +If a clock C steps to a time previous to C's alarm time, the device MUST
> > > +stop serving any previous alarm expiration event for C, within a grace
> > > +period.
> > > +
> > > +If an alarm expiration event happens for clock C, the device MUST stop
> > > +serving any previous alarm expiration event for C, within a grace
> > > +period.
> > > +
> > > +If the device is currently serving an alarm expiration event E, the
> > > +device MUST send a single VIRTIO_RTC_NOTIF_ALARM notification for E, as
> > > +soon as an alarmq buffer is available for this purpose.
> > > +
> > > +While the device is serving an alarm expiration event, the device MAY
> > > +execute implementation-specific alarm actions.
> > > +
> > > +The device MAY ignore the device status when executing
> > > +implementation-specific alarm actions.
> > > +
> > > +The device MAY ignore whether VIRTIO_RTC_F_ALARM was negotiated when
> > > +executing implementation-specific alarm actions.
> 

I wonder if these last three requirements are needed or we can just drop
them.

Matias

