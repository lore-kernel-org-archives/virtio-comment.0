Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15931E25E7
	for <virtio-comment@lists.linux.dev>; Wed, 19 Feb 2025 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739969155; cv=none; b=m4bA/Y0McRPND4HrnzR3rVaJj6rSvELhsGLtQcCFMKcqx1++7hqqQLChv9vSZ7WANtlVytVETX269xU/fvh3+4UvayNEitvY7R9x7NjiXyJ3fUhm9+KAv7I498FbooRfdl2xyxB45sl6h7tHXqEmDWFVFXJrk1Z4ja7R4UyCbR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739969155; c=relaxed/simple;
	bh=T3uX+BdLz6d2H+/edC52q/+GvYsHXzzsfRBaFUiiSEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=o061BK5MQ9CIoE+DVPN6c7yW3JhCsls2KW4r8IxjKy+pB+ZZNH/CIq89Esn8tz7BqkYd1uMEVJ8K3BPPtWIVqFZPpBKyzNF2As5i+PQ74Qr5dt1IWT9GhYouZAQTxQokrxPsjOpSvQVfIdPURSHOoBPAb55RhBBKeaaDwHnj7B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IUjWWgXZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IUjWWgXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739969151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NvgtFH9Atlv1Hq7MpJKSeETUDTbnM7QXz3qSUKDRlRw=;
	b=IUjWWgXZ3VrvWms465y4mlxzcfpog+8bzSIVxcOATDrB2ACpkRDEKgusclwyTW7GW/vsjg
	wI8WNgLjSgMRHiGXTyrezhPB3owlM+scnHzbyhFhpfI4LaFJJkyoZFa9gv1p5xgNeaKs+J
	IrR65EUlAHycQKKD2hU1BFa0wXmJCSc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-JazBdGqfPvO8_rBQbu8xyA-1; Wed, 19 Feb 2025 07:45:50 -0500
X-MC-Unique: JazBdGqfPvO8_rBQbu8xyA-1
X-Mimecast-MFC-AGG-ID: JazBdGqfPvO8_rBQbu8xyA_1739969149
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4393e873962so35756285e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 19 Feb 2025 04:45:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739969148; x=1740573948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvgtFH9Atlv1Hq7MpJKSeETUDTbnM7QXz3qSUKDRlRw=;
        b=vB2FLhHRhSMuNNVOn7HMulIjp2L5EYiFb+u0Z3RQJ6e6CWKe4wMSW+PFPA/q3ERpCd
         k+8kxu2eVYgmkKQxCLum8DSZCRidwS8I/gFuF/7qS8/BXvT31Ci1+k14u7nFZtJmsTG3
         IkSz09p0MdhE4/AT82wSFF60/ibv3E/Ifi4+qnAzRJAiFYuZ+yxYl0pBCi51rVEONNuK
         Q03T2y64oIN2b0KDAgLxtiFpFjqTIq2E68EX9FyvEUdelAEgtkyYV9FQ+8NdmYkZR47N
         iyZ+a4pe0nPSgb+LsOjEEUVTnvjrNc26eu/cobmqyE9Y6valRJ6zQ+yWUGcsB0ssPQh1
         4RRQ==
X-Gm-Message-State: AOJu0Yw25b7xvecasoXuGpaS8oW4LMwVHqd1zmNDePwmxke0oTOa8i5P
	FtH6IVsfn0o4c5nS8uvvJ7zDkzRZQvIc3UKOasMxXT5pvI1YZ0GCdfawDou/yn+xaHxpLYz0Mtv
	sKW3K/9HoQL6FbxQPvK0PCIU92d1AhYbkEA7Ll1Mi14F2GdtwG6KSbFskQMw4UnMa
X-Gm-Gg: ASbGncs3TbskM/E3uOlzzDCoH61NZvUcvHj9LcES8DqAHWglyCyzzJNlrfTEs2Hm8fH
	PyV7tZR99fvnBHhH7Aah8UyPzUMJm9JUO3/u3LgxjPv4u7QkH8EjNKE4XpBPc2zRGTfOxUAvw96
	1UxSU/GaoqyCw+KinU+YcoLLwxEPqMowWmbYjS4+CfQQstLsyj1dSMACwh/XgQ2Ly656ZxwwoQH
	FKSveUEc8Z+LOlHZ3onWXP0wuIq+FgcEY0M0ZsKNcAI6MpJVtJKZ0xX0/wUK0ObBBUVrW7SJo0=
X-Received: by 2002:a05:600c:1c84:b0:439:8c80:6af2 with SMTP id 5b1f17b1804b1-4398c806da5mr81221595e9.21.1739969148399;
        Wed, 19 Feb 2025 04:45:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSuBNxv+rMLd0pIBDg7HsujhVD9lQ4OhVsWaG8fXtdwAl53m/hsz5Od/nYKaTDP3wXGRwkNg==
X-Received: by 2002:a05:600c:1c84:b0:439:8c80:6af2 with SMTP id 5b1f17b1804b1-4398c806da5mr81220985e9.21.1739969147080;
        Wed, 19 Feb 2025 04:45:47 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43985c50397sm85262955e9.0.2025.02.19.04.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:45:46 -0800 (PST)
Date: Wed, 19 Feb 2025 13:45:44 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Subject: Re: [PATCH v7 1/4] virtio-rtc: Add initial device specification
Message-ID: <Z7XSeDKWUC3Zb/ln@fedora>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-2-quic_philber@quicinc.com>
 <Z6oEocvjwSsPmVxz@fedora>
 <arwlhmqlfpihjrb3xw6mb357265symbwwcdns4zvm5bzyhhxqp@cf4gqjhwauxz>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <arwlhmqlfpihjrb3xw6mb357265symbwwcdns4zvm5bzyhhxqp@cf4gqjhwauxz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9Z-wXg17fz6_-auMpegEvyIhthh3eff9dQ3CcQmGb6M_1739969149
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2025 at 07:12:39PM +0100, Peter Hilber wrote:
> On Mon, Feb 10, 2025 at 02:52:33PM +0100, Matias Ezequiel Vara Larsen wrote:
> > On Thu, Jan 23, 2025 at 11:16:12AM +0100, Peter Hilber wrote:
> > > The virtio-rtc device provides information about current time through
> > > one or more clocks. As such, it is a Real-Time Clock (RTC) device.
> > > 
> > > The normative statements for this device follow in the next patch.
> > > 
> > > For this device, there is an RFC Linux kernel driver which is being
> > > upstreamed, and a proprietary device implementation.
> > > 
> > > Miscellaneous
> > > -------------
> > > 
> > > The spec does not specify how a driver should interpret clock readings,
> > > esp. also not how to perform clock synchronization.
> > > 
> > > The device uses the "Timer/Clock" device id which is already part of the
> > > specification. This device id was registered a long time ago and should
> > > be unused according to the author's information. The name "RTC" was
> > > determined to be the best for a device which focuses on current time.
> > > 
> > > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > > ---
> > > 
> > > Notes:
> > >     v7:
> > >     
> > >     - Remove leap second and performance indications from struct
> > >       virtio_rtc_resp_read_cross. Remove backing definitions.
> > >     
> > >     - Add wording change which was previously mistakenly placed in last
> > >       patch.
> > >     
> > >     v6:
> > >     
> > >     - Make leap second status information optional if the clock smears (or
> > >       might smear) leap seconds.
> > >     
> > >     - Do not use union for leap second indication.
> > >     
> > >     - Improve wording.
> > >     
> > >     - Refer to the new POSIX.1-2024 for UTC epoch definition.
> > >     
> > >     v5:
> > >     
> > >     - Change structure and wording to support adding shared memory like
> > >       vmclock [8].
> > >     
> > >     - Add dedicated clock types for UTC leap second smearing (David
> > >       Woodhouse).
> > >     
> > >     - Extend leap second indications.
> > >     
> > >     - Split UTC-TAI offset and fractional offset due to smearing (David
> > >       Woodhouse).
> > >     
> > >     - Remove requirement that TAI offset must not be a whole second while
> > >       clock is being smeared.
> > >     
> > >     - Align bit widths, and some names, with '[RFC PATCH v4] ptp: Add
> > >       vDSO-style vmclock support' [8].
> > >     
> > >     - Replace VIRTIO_RTC_SUBTYPE_ by VIRTIO_RTC_SMEAR_.
> > >     
> > >     - For Arm Generic Timer, only support Virtual Count Register (David
> > >       Woodhouse).
> > >     
> > >     - Rename MONO clock to MONOTONIC clock.
> > >     
> > >     v4:
> > >     
> > >     - Drop distinction of Arm Generic Timer virtual and physical counter [7].
> > >     
> > >     - Add requirement that device should assume that driver reads clock from
> > >       first vCPU (David Woodhouse) [6].
> > >     
> > >     - Formatting and wording improvements.
> > >     
> > >     v3:
> > >     
> > >     - Address comments from Parav Pandit.
> > >     
> > >     - Split off normative requirements into a second commit [2].
> > >     
> > >     - Merge readq and controlq into requestq [3].
> > >     
> > >     - Don't guard cross-timestamping with feature bit [3].
> > >     
> > >     - Pad request headers to 64 bit [2].
> > >     
> > >     - Rename Virtio status codes to match UNIX error names [2].
> > >     
> > >     - Avoid Virtio status code clashes with net controlq ack values.
> > >     
> > >     - Reword to refer more to "requests", rather than "messages" [2].
> > >     
> > >     - Rephrase some sentences [2].
> > >     
> > >     - Use integer data types without "__" prefixes [2].
> > >     
> > >     - Reduce clock id width to 16 bits [5].
> > >     
> > >     - Make VIRTIO_RTC_FLAG_CROSS_CAP a bit mask rather than a bit index.
> > >     
> > >     v2:
> > >     
> > >     - Address comments from Cornelia Huck.
> > >     
> > >     - Add VIRTIO_RTC_M_CROSS_CAP message [1].
> > >     
> > >     - Fix various minor issues and improve wording [1].
> > >     
> > >     - Add several clarifications regarding device error statuses.
> > >     
> > >     [1] https://lists.oasis-open.org/archives/virtio-comment/202304/msg00523.html
> > >     [2] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#mffb93800fea11d6dda9e151078abedd6ff1c0f1e
> > >     [3] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#m94efd0aa9b9c2b96a246b79ef8bfc3bf64ebe791
> > >     [4] https://lore.kernel.org/lkml/20230630171052.985577-1-peter.hilber@opensynergy.com/T/#m65fa1d715933360498c4e33d7225e4220215a9d6
> > >     [5] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#mf00ce330228c28556d735eb9597469048c5d8b62
> > >     [6] https://lore.kernel.org/lkml/d796d9a5-8eda-4528-a6d8-1c4eba24aa1e@opensynergy.com/
> > >     [7] https://lore.kernel.org/all/20231218064253.9734-2-peter.hilber@opensynergy.com/
> > >     [8] https://lore.kernel.org/lkml/20240708092924.1473461-1-dwmw2@infradead.org/
> > > 
> > >  content.tex                      |   3 +-
> > >  device-types/rtc/description.tex | 426 +++++++++++++++++++++++++++++++
> > >  introduction.tex                 |   6 +
> > >  3 files changed, 434 insertions(+), 1 deletion(-)
> > >  create mode 100644 device-types/rtc/description.tex
> > > 
> 
> [...]
> 
> > > +
> > > +\paragraph{Clock Types}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions / Clock Types}
> > > +
> > > +The following clock types are defined:
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_RTC_CLOCK_UTC                    0
> > > +#define VIRTIO_RTC_CLOCK_TAI                    1
> > > +#define VIRTIO_RTC_CLOCK_MONOTONIC              2
> > > +#define VIRTIO_RTC_CLOCK_UTC_SMEARED            3
> > > +#define VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED      4
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +
> > > +\item[VIRTIO_RTC_CLOCK_UTC] uses the UTC (Coordinated Universal Time)
> > > +        time standard. This clock uses the time epoch of January 1,
> > > +        1970, 00:00 UTC. This is the same epoch as \emph{Unix time}. The
> > > +        clock's seconds since the epoch are related to UTC time as
> > > +        defined by \hyperref[intro:EPOCH]{EPOCH}.
> > > +
> > > +        This clock observes positive and negative leap seconds as
> > > +        announced by standard bodies. At the start of leap seconds, the
> > > +        clock steps accordingly.
> > > +
> > > +\item[VIRTIO_RTC_CLOCK_TAI] uses the TAI (International Atomic Time)
> > > +        time standard. This clock uses the time epoch of January 1,
> > > +        1970, 00:00 TAI.
> > > +
> > > +\item[VIRTIO_RTC_CLOCK_MONOTONIC] uses monotonic physical time (SI
> > > +        seconds subdivisions) since some unspecified epoch. The epoch is
> > > +        before or during device reset.
> > > +
> > > +\item[VIRTIO_RTC_CLOCK_UTC_SMEARED] deviates from the UTC standard by
> > > +        smearing time in the vicinity of a leap second. This avoids
> > > +        clock steps due to UTC leap seconds. Otherwise, this clock is
> > > +        similar to VIRTIO_RTC_CLOCK_UTC.
> > > +
> > > +\item[VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED] This clock
> > > +
> > > +\begin{itemize}
> > > +\item may deviate from the UTC standard by smearing time in the vicinity
> > > +        of a leap second (similar to VIRTIO_RTC_CLOCK_UTC_SMEARED), or
> > > +
> > > +\item may step at the start of leap seconds like VIRTIO_RTC_CLOCK_UTC.
> > > +\end{itemize}
> > > +
> > > +A clock of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED can change this
> > > +behavior for every leap second.
> > > +
> > > +\end{description}
> > > +
> > > +In the following, \emph{UTC-like clock} designates any clock of type
> > > +VIRTIO_RTC_CLOCK_UTC, VIRTIO_RTC_CLOCK_UTC_SMEARED, or
> > > +VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED.
> > > +
> > > +Additional clock types may be standardized in the future.
> > > +Implementation-specific definitions of clock types are not recommended
> > > +and use ids between 0xF0 and 0xFF.
> > 
> > Do you mean that ids between 0xF0 and 0xFF are not recommended?
> 
> I mean that implementation-specific definitions must use this id range
> (this is defined as a requirement in the patch with the normative
> requirements). Is the following better?
> 
> 	Implementation-specific definitions of clock types are not
> 	recommended. Implementation-specific definitions use ids between
> 	0xF0 and 0xFF.
> 

I think it is better.

> > 
> > > +
> > > +\paragraph{Smearing Variants}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions / Smearing Variants}
> > > +
> > > +Leap second \emph{smearing variants} describe the deviation from the UTC
> > > +standard in the vicinity of a leap second. The following smearing
> > > +variants are currently defined:
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_RTC_SMEAR_UNSPECIFIED    0
> > > +#define VIRTIO_RTC_SMEAR_NOON_LINEAR    1
> > > +#define VIRTIO_RTC_SMEAR_UTC_SLS        2
> > > +\end{lstlisting}
> > > +
> > > +\begin{description}
> > > +
> > > +        \item[VIRTIO_RTC_SMEAR_UNSPECIFIED] means that it is unspecified
> > > +                how time is smeared in the vicinity of leap seconds.
> > > +
> > > +        \item[VIRTIO_RTC_SMEAR_NOON_LINEAR] specifies a linear smear
> > > +                from noon prior to the leap second until noon after the
> > > +                leap second.
> > > +
> > > +        \item[VIRTIO_RTC_SMEAR_UTC_SLS] specifies a linear smear as per
> > > +                the \hyperref[intro:UTC-SLS]{UTC-SLS} proposal.
> > > +
> > > +\end{description}
> > > +
> > > +Clocks of type VIRTIO_RTC_CLOCK_UTC_SMEARED always behave according to a
> > > +smearing variant. The smearing variant does not change over the clock's
> > > +lifetime.
> > > +
> > > +For clocks of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED, it is unspecified
> > > +whether leap seconds are smeared, and how leap seconds are smeared.
> > > +
> > > +Additional smearing variants may be standardized in the future.
> > > +Implementation-specific definitions of smearing variants are not
> > > +recommended and use ids greater than or equal to 0xF0.
> > 
> > Like the question above, It is not clear to me if `ids greater than or
> > equal to 0xF0` are not recommended.
> > 
> 
> Is the following better?
> 
> 	Implementation-specific definitions of smearing variants are not
> 	recommended. Implementation-specific definitions use ids greater
> 	than or equal to 0xF0.
> 

I think it is better.

> > > +
> > > +In the following, \emph{leap smearing clock} designates
> > > +
> > > +\begin{itemize}
> > > +
> > > +\item any clock of type VIRTIO_RTC_CLOCK_UTC_SMEARED
> > > +
> > > +\item any clock of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED at any time
> > > +        when the clock is smearing a leap second.
> > > +
> > > +\end{itemize}
> > > +
> > > +\paragraph{Hardware Counters}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions / Hardware Counters}
> > > +
> > > +The following hardware counter identifiers are specified:
> > > +
> > > +\begin{lstlisting}
> > > +/* Arm Generic Timer Counter-timer Virtual Count Register (CNTVCT_EL0) */
> > > +#define VIRTIO_RTC_COUNTER_ARM_VCT      0
> > > +/* x86 Time-Stamp Counter */
> > > +#define VIRTIO_RTC_COUNTER_X86_TSC      1
> > > +/* Invalid */
> > > +#define VIRTIO_RTC_COUNTER_INVALID   0xFF
> > > +\end{lstlisting}
> > > +
> > > +Additional hardware counter identifiers may be standardized in the
> > > +future. Implementation-specific hardware counter identifiers are not
> > > +recommended and have values between 0xF0 and 0xFE.
> > > +
> > > +\subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Operation / Control Requests}
> > > +
> > > +Through \emph{control requests}, the driver requests information about
> > > +the device capabilities. The driver enqueues control requests in the
> > > +requestq.
> > > +
> > > +\begin{description}
> > > +
> > > +\item[VIRTIO_RTC_REQ_CFG] discovers the number of clocks.
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_RTC_REQ_CFG 0x1000 /* message type */
> > > +
> > > +struct virtio_rtc_req_cfg {
> > > +        struct virtio_rtc_req_head head;
> > > +        /* no request params */
> > > +};
> > > +
> > > +struct virtio_rtc_resp_cfg {
> > > +        struct virtio_rtc_resp_head head;
> > > +        le16 num_clocks;
> > > +        u8 reserved[6];
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +Field \field{num_clocks} contains the number of clocks. A device
> > > +provides zero or more clocks. Valid clock ids are those smaller than
> > > +\field{num_clocks}.
> > > +
> > > +\item[VIRTIO_RTC_REQ_CLOCK_CAP] discovers the capabilities of the clock
> > > +identified by the \field{clock_id} field.
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_RTC_REQ_CLOCK_CAP 0x1001 /* message type */
> > > +
> > > +struct virtio_rtc_req_clock_cap {
> > > +        struct virtio_rtc_req_head head;
> > > +        le16 clock_id;
> > > +        u8 reserved[6];
> > > +};
> > > +
> > > +struct virtio_rtc_resp_clock_cap {
> > > +        struct virtio_rtc_resp_head head;
> > > +        u8 type;
> > > +        u8 leap_second_smearing;
> > > +        u8 reserved[6];
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +The \field{type} field identifies the clock type. A device provides
> > > +zero or more clocks for a clock type.
> > > +
> > > +Clocks of type VIRTIO_RTC_CLOCK_UTC_SMEARED indicate the \emph{smearing
> > > +variant} through field \field{leap_second_smearing}. All other clocks
> > > +set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
> > > +
> > > +\item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
> > > +cross-timestamping for a particular pair of clock and hardware counter.
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_RTC_REQ_CROSS_CAP 0x1002 /* message type */
> > > +
> > > +struct virtio_rtc_req_cross_cap {
> > > +        struct virtio_rtc_req_head head;
> > > +        le16 clock_id;
> > > +        u8 hw_counter;
> > > +        u8 reserved[5];
> > > +};
> > > +
> > > +
> > > +struct virtio_rtc_resp_cross_cap {
> > > +        struct virtio_rtc_resp_head head;
> > > +#define VIRTIO_RTC_FLAG_CROSS_CAP       (1 << 0)
> > > +        u8 flags;
> > > +        u8 reserved[7];
> > > +};
> > > +\end{lstlisting}
> > > +
> > > +The \field{clock_id} field identifies the clock, and the
> > > +\field{hw_counter} field identifies the hardware counter, for which
> > > +cross-timestamp support is probed. The device sets flag
> > > +VIRTIO_RTC_FLAG_CROSS_CAP in the \field{flags} field if the clock
> > > +supports cross-timestamping for the particular clock and hardware
> > > +counter, and clears the flag otherwise.
> > > +
> > > +\end{description}
> > > +
> > > +\subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Operation / Read Requests}
> > > +
> > > +Through \emph{read requests}, the driver requests clock readings from
> > > +the device. The driver enqueues read requests in the requestq. The
> > > +device obtains device-side clock readings and forwards these clock
> > > +readings to the driver. The driver may enhance and interpret the clock
> > > +readings through methods which are beyond the scope of this
> > > +specification.
> > > +
> > > +Once DRIVER_OK has been set, the device should support reading every
> > > +clock, even when a clock may yet have to be aligned to reference time
> > > +sources.
> > > +
> > > +In general,
> > > +
> > > +\begin{itemize}
> > > +\item clocks may jump backwards or forward, and
> > > +\item the clock frequency may change. Clocks may be \emph{slewed},
> > > +        i.e.\ clocks may run at a frequency other than their current
> > > +        best frequency estimate.
> > > +\end{itemize}
> > > +
> > > +As long as a clock does not jump backwards, the driver clock readings
> > > +through read request responses increase monotonically:
> > > +
> > > +\begin{itemize}
> > > +\item As long as a clock does not jump backwards in-between device-side
> > > +        clock readings, the driver-side readings for that clock increase
> > > +        monotonically as well, in the order in which the driver
> > > +        marks read requests as available.
> > > +
> > > +\item The device marks read requests for the same clock as used in
> > > +        the order in which the messages were marked as available.
> > > +\end{itemize}
> > > +
> > Should it not be `MUST` here?
> > 
> 
> There are corresponding MUST requirements in the normative statements
> patch. E.g. for the last enumeration item:
> 
> 	For any clock C, the device MUST mark all read requests reading
> 	C as used in the total order in which the driver marked these
> 	messages as available.
> 
> I understood that the prevailing preference is to avoid MUST outside of
> the normative statements.
> 
> 
I see, thanks for the explanation.

Matias

