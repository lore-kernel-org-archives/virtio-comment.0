Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC971AC8AF
	for <virtio-comment@lists.linux.dev>; Thu, 15 Aug 2024 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723719045; cv=none; b=FkfioVJ8buBuL7YMRrCCfB7PiCKEbavUmzr3DEboIWDeULTMEoCjd13bixJKzKLbP3n4+zfQZHpOB5Q+Z0m6M9OdzaFICJpaULLbJAVt75XndanQlLuIRnnocTFKyfbOMJxiKdVaOUxI6BPOHDhgtrd4mwQEWT5fnx/+x1XUYFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723719045; c=relaxed/simple;
	bh=dyYy6nzMtf2x/MCeHVmdtuKc0n4XFtRyEBsE4Of59xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=T3mOEr2fZ2CNQ0704JCaQmGJx1c/MlQugUJCud4dys79cX4ghH4K0iJ9jLd2dV0G02fKps6TbJQi9Q8/VPEgJ9QQ1ZyMYl773zj9sHiVdFWVjDXJeuK8Z4VExuCmhjQbmjrOuXOuKoPSm/AuzPOX7Ppvul4dvyiviljwPsvlus8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YK7ZVWZL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YK7ZVWZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723719042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwlIeV3Q9Z/7H+HqD1iCcTcen2OEW3tEEUnmfDtuf9Q=;
	b=YK7ZVWZLt2CBjjfmK0QArd85nW0hOkpeqy9WmGyDg+E7BMyKDXarhIMuDk4LyyzIsodCFQ
	41ZPx9/ngZMlaRfc7pu+a1V6qsW1xoPCV3yL779xVETaY3hpmT4c+12dnPRtYwWkdwQhxE
	iczrvecHc49qFO174wfnQkyr9C3mqAM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-T2AyEQCTOZyGyouZm20TRg-1; Thu, 15 Aug 2024 06:50:40 -0400
X-MC-Unique: T2AyEQCTOZyGyouZm20TRg-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52eff10441fso784432e87.3
        for <virtio-comment@lists.linux.dev>; Thu, 15 Aug 2024 03:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723719039; x=1724323839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwlIeV3Q9Z/7H+HqD1iCcTcen2OEW3tEEUnmfDtuf9Q=;
        b=aLG8eyewCpjo01vbz8o74IUTgZahyyQj8WvRxdfZLLNPdNXcjTuDJEVvzTKzd8vuWN
         KWifuJ3DC3xdtvGaukZulVfnGQoqGrE5lfXTDpvLhh6H3o99MvUqS0HGaKpKAhKs4f00
         hME/ycpCq66jh9pLdnqDhS959CAaCYwbEuC28myCwhUo5V4VP0Pt9jkrz8w/vrIzdv5r
         nvvnfO9Dyg5VwQStc1Xk8+Zar2JmasGrdc1Hu+9UnV3/WUW2X5H6pNHWvzS8xyNL7qZy
         yyXRBPMRyWJo/RFFReL1SwIlnecROln/fDay8cyHaRpJ3y+Vfltt9i9O2cvY9rzvqQfJ
         CW/A==
X-Forwarded-Encrypted: i=1; AJvYcCVCfIOvx9W1M0H1soxk/JBVtatx42loLJ+xMoP+QTC5DaVvVe7xGqr7Q30nalSVujHD0Q5CVU508Dj03fxZPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7Sijfk1Fslic1R5MOjCzUMkgY3QtSu+EJ9nHvq+E7CAJRFYhr
	g2BZgUbBX4N32d0gvBO/rJZ4KhrNhT0L5n87o6Q+/jo2+S3yiZX4VaT+k8r+X1xfAP8ydleJKHh
	KQweELNFyvxvPgZaaU0Q/zGVT08+xIBA7NHlYwj1NJwBJtXBs5vbjf+Dnwjjk73PI
X-Received: by 2002:a05:6512:3b20:b0:530:db85:e02a with SMTP id 2adb3069b0e04-532eda6bab3mr3582434e87.22.1723719039027;
        Thu, 15 Aug 2024 03:50:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfyufZAAbgLcLoXYOUyCsLwXOSk19XrVx7GVxmJSnIMVZtADN+yPIHxHRPQIu5CXwIv1uUqQ==
X-Received: by 2002:a05:6512:3b20:b0:530:db85:e02a with SMTP id 2adb3069b0e04-532eda6bab3mr3582410e87.22.1723719038035;
        Thu, 15 Aug 2024 03:50:38 -0700 (PDT)
Received: from redhat.com ([2a02:14f:178:8f0f:2cfe:cb96:98c4:3fd0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396d4b2sm82151266b.220.2024.08.15.03.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 03:50:37 -0700 (PDT)
Date: Thu, 15 Aug 2024 06:50:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: cohuck@redhat.com, jasowang@redhat.com, virtio-comment@lists.linux.dev,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240815064619-mutt-send-email-mst@kernel.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <20240813035358-mutt-send-email-mst@kernel.org>
 <513de01f-92ac-4067-b005-54dfa4fe85f2@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <513de01f-92ac-4067-b005-54dfa4fe85f2@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Aug 15, 2024 at 05:12:23PM +0800, Zhu Lingshan wrote:
> 
> 
> On 8/13/2024 4:01 PM, Michael S. Tsirkin wrote:
> > On Thu, Aug 01, 2024 at 07:35:16PM +0800, Zhu Lingshan wrote:
> >> +\drivernormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> >> +
> >> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> > Actually, it has no effect before DRIVER_OK, no? I would forbid that
> > then.
> There can be two cases:
> 1) debugging the device before DRIVER_OK
> 2) VM migration right after boot, and before DRIVER_OK. So it needs to migrate the device before DRIVER_OK


Sorry I don't understand. The only effect of SUSPEND as you specified
it is not consuming buffers. Buffers are not consumed before DRIVER_OK,
thus there is no point to set SUSPEND before DRIVER_OK.

> >
> >> +Once the driver sets SUSPEND to \field{device status} of the device:
> >> +\begin{itemize}
> >> +\item The driver MUST re-read \field{device status} to verify whether the SUSPEND bit is set.
> >
> > This is still vague, I commented on this several times.
> > I think what you mean is that until it reads status with
> > SUSPEND as 1, it does not consider SUSPEND set.
> >
> >
> > But, what happens if driver clears SUSPEND before it reads it as set?
> > It would seem that should cancel suspend (which is a useful thing to
> > support)? But this creates a problem as it breaks read/modify/write that
> > some hypervisors assumed to be safe. I guess we need an extra
> > SUSPEND_IN_PROGRESS bit then? A little too much for status, at this
> > stage - maybe we need an extra register for this.
> if the driver reads SUSPEND bit == 0, with the knowledge of its own operations,
> it knows the device is either in a) normal operation 2). suspending in progress
> 
> Cancelling a SUSPEND right after setting SUSPEND is actually a RESUME.
> The ideal case is the driver waits until SUSPEND == 1, then clear it.
> But there are various drivers, not all drivers follow our expectation,
> so there can be a corner case that how the driver know whether
> the device is resumed after clearing the SUSPEND bit or not finish suspending.
> 
> I think adding a new resister can surely fix this issue, however as you
> said, add a new status bit is overkill and where to place this new register
> is a new question.

Place it after existing registers.


> 
> So, to make things easier, how about suspend & resume the device sequentially:
> 
> If the driver has suspended the device by setting the SUSPEND bit to 1, it MUST NOT
> clear the SUSPEND bit before the device presenting the SUSPEND bit set as 1.


I'm worried that it's fragile - one can no longer deduce
the device state by reading the status.

> >
> >
> >> +\item The driver MUST NOT make any more buffers available to the device.
> >> +\item The driver MUST NOT access any virtqueues or send notifications for any virtqueues.
> >> +\item The driver MUST NOT access Device Configuration Space.
> >> +\end{itemize}
> >> +
> >> +\devicenormative{\subsection}{Device Suspend}{General Initialization And Device Operation / Device Suspend}
> >> +
> >> +The device MUST ignore SUSPEND if FEATURES_OK is not set or VIRTIO_F_SUSPEND is not negotiated.
> >> +
> >> +The device MUST ignore all access to its Configuration Space while
> >> +suspended, except for \field{device status} if it is part of the Configuration Space.
> >> +
> >> +A device MUST NOT send any notifications for any virtqeuues,
> >> +access any virtqueues, or modify any fields in
> >> +its Configuration Space while suspended.
> >> +
> >> +If changes occur in the Configuration Space while the SUSPEND bit is set,
> >> +the device MUST NOT send any configuration change notifications.
> >> +Instead, the device MUST send the notification after the SUSPEND bit has been cleared.
> >> +
> >> +When the driver sets SUSPEND, the device MUST either suspend itself or set DEVICE_NEEDS_RESET if failed to suspend.
> >> +
> >> +If SUSPEND is set in \field{device status}, when the driver clears SUSPEND,
> >> +the device MUST either resume normal operation or set DEVICE_NEEDS_RESET.
> >> +
> >> +When the driver sets SUSPEND,
> >> +the device SHOULD perform the following actions before presenting that the SUSPEND bit is set to 1 in the \field{device status}:
> > what does "before presenting" mean? does it return SUSPEND as 0
> > after driver wrote 1 there and before it completed these
> > actions?
> Yes, it should return 0 if the suspending  operation is still in progress,
> It should not change SUSPEND bit value before finish.
> Do you suggest we add:
> The device MUST present SUSPEND bit set to 1 in \field{device status} once it has been suspended
> 
> It says: presenting that the SUSPEND bit is set to 1.
> Not a native speaker, but this looks clear to me.

I don't think this is sufficient, you need to document all assumptions
on both device and driver.


> >
> >> +
> >> +\begin{itemize}
> >> +\item Stop processing more buffers of any virtqueues
> >> +\item Wait until all buffers that are being processed have been used.
> >> +\item Send used buffer notifications to the driver.
> >> +\end{itemize}
> >> +
> >>  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
> >>  
> >>  Virtio can use various different buses, thus the standard is split
> >> @@ -872,6 +923,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
> >>  	handling features reserved for future use.
> >>  
> >> +  \item[VIRTIO_F_SUSPEND(42)] This feature indicates that the driver can
> >> +   trigger suspending the device via the SUSPEND flag
> >> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
> >> +
> >>  \end{description}
> >>  
> >>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> >> -- 
> >> 2.45.2

