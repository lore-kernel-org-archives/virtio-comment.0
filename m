Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A67A2063DD
	for <virtio-comment@lists.linux.dev>; Mon, 24 Feb 2025 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740398309; cv=none; b=GwE1bosxQlBt55kE3eKgGhtykiWPM1aabPSqaHsdq8kRq4fxwQUfQl6K4Mz/GAGE1aQxaiwC1ufrfVlp2soq/+FpbhSC4UxPb9EVBRu+S6WF/CASKsgLS3XUBIGG9ntr08zVYKpoIDcp+I8gYib4wH7kki3tFl7oBBoHqomSHZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740398309; c=relaxed/simple;
	bh=tYkCY9H4jEgZuJSWroZ18jU1bSTeyFNJi6VQ1DyAM0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ryjAJiHOblHn9o4GwS22kpXIWMcbexqJgrwtbZFHUr9ynkpANnHEHxPf7mTejhEPtNlSNNx44aI9bYW/TU27LjcAIPfJ//69Z/oKHAI3Jcvzi+Kc8ZZCTc4ukS0L/WwbrwAcsaz2j5qiPhZPrr11mDWWsaKyokdQSu6CNyrg5/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dRRTf1O9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dRRTf1O9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740398306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gepG+xKeKVbRIlARKDsSYIj/4Zxfm4cNdnkl4eatCgs=;
	b=dRRTf1O9M8fsGdBZP5BsbYlrWG4lR7rxd9LDxzpNEVnOK5zvEQCNnW5nvGE06rvAb/n6Ms
	cucsEi7/So99uOmG65A1Y9EHIWndtmHdUB3hgLnqPaf6UslT64Yom2+1fhxPy4f/6fGvY5
	YgQFrZexwb5L+9vBY3U2VyiKvVNfdJo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-lqKQPTBvMO2nO8BLKwIlJQ-1; Mon, 24 Feb 2025 06:58:24 -0500
X-MC-Unique: lqKQPTBvMO2nO8BLKwIlJQ-1
X-Mimecast-MFC-AGG-ID: lqKQPTBvMO2nO8BLKwIlJQ_1740398304
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38f4e3e9c5bso1758799f8f.1
        for <virtio-comment@lists.linux.dev>; Mon, 24 Feb 2025 03:58:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740398304; x=1741003104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gepG+xKeKVbRIlARKDsSYIj/4Zxfm4cNdnkl4eatCgs=;
        b=Q91KGTfOfCmLZJGUqjwgk5kRX1H2UI6ElJTMv/sP1Csra+9xcPgo0pvnIshAsx+9Vv
         SzALioQLnTjSONhfrN/rLobdx6NdeBSk5UJ4/SZX9lzD4pgSp6b5FUBX862OQbtoFChb
         FFwB6EPKxkkq0W5Eb67BB092wV/iD+MsAJRqltifK9EPHZkEAZEezri7Ey7YL3p2NkDa
         9zNv6RefHB7TzRfYOBgnOOYo523P/IL7+x4ZsBX+QuQzniRO7aBfxxjJdIkVGBWKF197
         oFEcupS0EQRIfyGduD99XDePavR26pMYWJSt3oS1EK73+rRXwI6fQOaE7/RfKlq3TKbj
         2ebQ==
X-Gm-Message-State: AOJu0YxOCCrCYHLQLaB//owVlBkgaixiQ+rx3tW3hxRDaLivGcXB84O6
	yuorxVaAaE5Ox2Diqq3QkL8rAUfG8kqDEJCurzGQP6ClZBb+nGmawaT5jtyXuozGN2OpS50KQws
	5ssXH0vZVML4zqYoGd+zinYcUo+xk2yyEFkuuhT/hLyi3y2W28DKCq2ezBHiKBCWL
X-Gm-Gg: ASbGncvfdO0H4ZAJd98G2N9aXKQ2eQ5lzA2cZj3AJsX75Y0Ylqci3amK5bg50w2p1sz
	MACdhNkDuQuFu8YUwsYcQln1CQELXVy2+edJlRuJSf4anAn6e0L5GG+3LsjaPX80aOt6wB2VsJ3
	h4qlKSTOqOKoHrrIw9TyDg5ncbpGI0tRGEPlKVweRWqssBZzqx0o3O6Nw3xiJcuWZmQJPK8aFIi
	d4RsW+zsqSgL4eUNPzIfm403m4O4Ljvt7n8tDqKfWmlSDxmgybLjNhYkV6Pmu/rfTv+SKPZWvkq
	sREqDoM=
X-Received: by 2002:a05:6000:4020:b0:38f:4531:3973 with SMTP id ffacd0b85a97d-38f6e7584cemr9730632f8f.4.1740398303622;
        Mon, 24 Feb 2025 03:58:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKej0lP7sGAt7ub8Oy9pRdbHfUhkmOkoHFwzMboelkoOvxHJKUxE/eOtfP0nD69UZ6p0tY9A==
X-Received: by 2002:a05:6000:4020:b0:38f:4531:3973 with SMTP id ffacd0b85a97d-38f6e7584cemr9730611f8f.4.1740398303152;
        Mon, 24 Feb 2025 03:58:23 -0800 (PST)
Received: from fedora ([37.174.243.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02d60cbsm103008225e9.14.2025.02.24.03.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 03:58:22 -0800 (PST)
Date: Mon, 24 Feb 2025 12:58:19 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Subject: Re: [PATCH v7 3/4] virtio-rtc: Add alarm feature
Message-ID: <Z7xe22y7NFr6FctY@fedora>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-4-quic_philber@quicinc.com>
 <Z6s52sYSmuhp8M4/@fedora>
 <3gos5s6jqul2o5bn26t5ie5b44ernrbk7r262kns5gnma5mvpe@ej3aicxv2jav>
 <Z7YCA1BWmGb+eqwH@fedora>
 <xu4mpst6krjpeqw2cf5cogdztrpmritjk2phi3jb7ohjilkugs@cx4ymgr2ztny>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <xu4mpst6krjpeqw2cf5cogdztrpmritjk2phi3jb7ohjilkugs@cx4ymgr2ztny>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tFCqmWkaFlZrN7hdWtY3o7F9tchCvwydh0vdw0AWyo0_1740398304
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2025 at 05:51:23PM +0100, Peter Hilber wrote:
> On Wed, Feb 19, 2025 at 05:08:35PM +0100, Matias Ezequiel Vara Larsen wrote:
> > On Thu, Feb 13, 2025 at 07:13:47PM +0100, Peter Hilber wrote:
> > > On Tue, Feb 11, 2025 at 12:51:54PM +0100, Matias Ezequiel Vara Larsen wrote:
> > > > On Thu, Jan 23, 2025 at 11:16:14AM +0100, Peter Hilber wrote:
> > > > > Add the VIRTIO_RTC_F_ALARM feature (without normative statements).
> > > > > 
> > > > > The intended use case is: A driver needs to react when an alarm time has
> > > > > been reached, but at alarm time, the driver may be in a sleep state or
> > > > > powered off. The alarm feature can resume and notify the driver in this
> > > > > case. Alarms may be retained across device resets (including reset on
> > > > > boot).
> > > > > 
> > > > > Peculiarities
> > > > > -------------
> > > > > 
> > > > > Unlike usual alarm clocks, a virtio-rtc alarm-capable clock may step
> > > > > autonomously at any time: An alarm may change back from "expired" to
> > > > > "not expired" before the driver has started processing an alarm
> > > > > notification.
> > > > > 
> > > > > To address the above, and the device resets, define "alarm expiration"
> > > > > in such a way that the driver always has a chance to react to an alarm,
> > > > > and make the device always responsible for notifying the driver about an
> > > > > alarm expiration.
> > > > > 
> > > > > The VIRTIO_RTC_REQ_SET_ALARM_ENABLED request is there so that the Linux
> > > > > ioctls RTC_AIE_ON and RTC_AIE_OFF only need to emit one request.
> > > > > 
> > > > > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > > > > ---
> > > > > 
> > > > > Notes:
> > > > >     v7:
> > > > >     
> > > > >     - Change flag numeric value due to removing leap second indication.
> > > > >     
> > > > >     v5:
> > > > >     
> > > > >     - Reformat.
> > > > >     
> > > > >     v4:
> > > > >     
> > > > >     - Change requirements so that driver can reset alarm to clean slate, and
> > > > >       document how driver can achieve this (Cornelia Hell, Jason Wang) [1].
> > > > >     
> > > > >     - Require device to support all expressible alarm times.
> > > > >     
> > > > >     - Formatting and wording improvements.
> > > > >     
> > > > >     [1] https://lore.kernel.org/all/2ae67401-a8f5-4686-9321-cb3105df594d@opensynergy.com/
> > > > > 
> 
> [...]
> 
> > > > > +An alarm expiration becomes obsolete
> > > > > +
> > > > > +\begin{itemize}
> > > > > +\item once the clock jumps backwards, before the alarm time, or
> > > > > +
> > > > > +\item once the driver sets an alarm time, or
> > > > > +
> > > > > +\item once another alarm expiration event happens.
> > > > > +\end{itemize}
> > > > > +
> > > > 
> > > > This is a minor comment, I think you can use `when` instead of `once` like
> > > > in the paragraph before.
> > > > 
> > > 
> > > OK.
> > > 
> > > > > +If an alarm expiration becomes obsolete, it is unspecified which alarm
> > > > > +actions the device executes for this alarm expiration, and the device
> > > > > +stops executing these alarm actions after a grace period.
> > > > 
> > > > What is a grace period? You mean that whatever the device does after
> > > > alarm expiration, the device has to STOP doing it after a grace period.
> > > > Am I right?
> > > > 
> > > 
> > > "[An] alarm expiration becomes obsolete" means that the device should no
> > > longer act according to the alarm (typically because the driver disabled
> > > the alarm, or for one of the other reasons listed in the above
> > > enumeration). In this case, the device must stop the alarm actions as
> > > soon as possible (within a finite grace period). 
> > > 
> > > Maybe I could rephrase like this?
> > > 
> > > 	If an alarm expiration becomes obsolete as per the above
> > > 	conditions, it is unspecified which alarm actions the device
> > > 	executes for this alarm expiration, and the device stops
> > > 	executing these alarm actions as soon as possible.
> > > 
> > 
I just meant that the paragraph above does not seem precise so I was
thinking that we could just drop it but I am OK to keep it too.

> > I wonder if we can just drop this and let the device implementation do
> > decide when an alarm is obsolete and what to do in that situation.
> > 
> 
> Are you referring to an obsolete alarm expiration, or to an obsolete
> alarm? (As for the alarm, I would say the device should only consider an
> alarm totally obsolete once the driver disables the alarm, acknowledging
> it.)

I am talking about when an alarm expiration becomes obsolete. I agree
regarding when an alarm becomes obsolete.

> 
> As for the alarm expiration obsoletion text above and the related
> requirements in patch 4, I think they are still required for the
> following:
> 
> 1. The requirement to obsolete alarm expirations when the driver sets a
>    new alarm makes it possible to prevent information leakage, as
>    discussed in [2], per the procedure listed elsewhere in this patch:
> 
> 	+Alarms set prior to reset may cause unwanted alarm expiration
> 	+notifications, and information leakage, after the reset. To prevent both
> 	+issues, the driver can do the following after the reset, for each clock
> 	+which supports alarm:
> 	+
> 	+\begin{enumerate}
> 	+\item Send a VIRTIO_RTC_REQ_SET_ALARM message, with \field{alarm_time}
> 	+        set to 0, and \field{flags} set to 0.
> 	+
> 	+\item Wait until the device marks the VIRTIO_RTC_REQ_SET_ALARM message
> 	+        as used, with status VIRTIO_RTC_S_OK.
> 	+\end{enumerate}
> 	+
> 	+To prevent the above issues, the driver also marks buffers in the alarmq
> 	+as available only after completing the above steps for all clocks.
> 
> 2. Without the requirements to obsolete alarm expirations, it might not
>    be clear how long the device needs to remember to send a notification
>    through the alarmq, in case there is no buffer available in the
>    alarmq.
> 
> > > > > +
> > > > > +The driver-visible settings of an alarm consist of two elements:
> > > > > +
> > > > > +\begin{itemize}
> > > > > +\item \field{driver_alarm_time}, a valid time for the corresponding
> > > > > +        clock, and
> > > > > +
> > > > > +\item \field{alarm_enabled}, a boolean. While \field{alarm_enabled} is
> > > > > +        true, \field{driver_alarm_time} is the actual alarm time.
> > > > > +        While \field{alarm_enabled} is false, the device will act as if
> > > > > +        the alarm time was in the future, so that the alarm will not
> > > > > +        expire.
> > > > > +\end{itemize}
> > > > 
> > > > Is `alarm_enabled` a field that is device implementation specific?
> > > > 
> > > 
> > > No. The use of "\field{}" around alarm_enabled is for typographic
> > > purposes, not because it is supposed to correspond to a particular
> > > element in the device implementation. It is unspecified how the device
> > > implements the alarm feature.
> > > 
> > > The two elements mentioned above describe the state of the alarm in the
> > > device which the driver can set and get through the respective requests.
> > > 
> > > By overriding driver_alarm_time with an alarm time in an unreachable
> > > future if alarm_enabled is false, the spec does not need to consider the
> > > alarm_enabled state in most places. Most non-normative text and most
> > > requirements just need to refer to "alarm time reached", not to "alarm
> > > time reached and alarm enabled".
> > 
> > I see, are you suggesting to replace driver_alarm_time and alarm_enabled
> > occurrences?  
> > 
> > Matias
> > 
> 
> In this version, the occurrences have already been replaced in most
> cases, so to speak. alarm_enabled is only introduced towards the bottom
> of the "Alarm Operation" section. Most of the spec ignores
> alarm_enabled, since alarm_enabled == false has the same effect as alarm
> time == unreachable future. But since conflating alarm time and
> alarm_enabled creates confusion, I now think alarm_enabled should just
> be mentioned across all non-normative and normative sections instead.
> 
> (This version specifies that the driver sets driver_alarm_time and
> alarm_enabled. The spec synthesizes the applicable "alarm time" from
> both, for the purposes of specification: 
> 
> 	While alarm_enabled is true, driver_alarm_time is the actual
> 	alarm time. While alarm_enabled is false, the device will act as
> 	if the alarm time was in the future, so that the alarm will not
> 	expire.
> 
> This version does not require the device implementation to actually
> synthesize the "alarm time".)
> 
> But, as said, now I think I should just refer to alarm_enabled
> everywhere, and drop the driver_alarm_time and "alarm time" distinction.

You can do that and see how it looks in the next version. I think the
issue is just the use of the underscore in the name, which made me think
it is a variable. I do not have an strong opinion about it though.

Matias

