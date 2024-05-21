Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B89844369
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 10:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716289032; cv=none; b=NdZpjiJCs2iNA1PAoSZW7UZFZT8+V3X04GfUWz91/+tzK1aXmIAthNqvToQKZ1kBPe/hpI+bNJZRu5v1ub8cGS+G4Itt3dyEzkFIGvBIiIXeTXiCuaVM429MOwRq6A+OsIC8m8iG3zNJ8pfmSHu+qHMK1b3EdTdbu0FDRantdr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716289032; c=relaxed/simple;
	bh=1J8G/860QAX92Q0X2x5SuPrxChW2B4ZY8q3g5ltCbgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPeOmpIjqRDi3l4co1yXI57/6oF+wl4PEIg6Qlg2BtHrdD+lco76n9payrIS53TBFw1eRKbPMKoIPFSRGYlUPoKRurk/WSJlZFdq1/03hKtNqPcCLTH547gEGoLEZhR9pKawA/7yrpbS27WkW0t9QxRoEwxYofJI6agKzxWhyIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TwjSTnnR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TwjSTnnR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ee5235f5c9so101440425ad.2
        for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 03:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716289030; x=1716893830; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oifNgjW9ezlx4a3OCaH57c5tk1F3SwCBlatkyG3lnRA=;
        b=TwjSTnnRxxDr/ENsX9gcsGNTDI1hZoaw8TG8zSwEvcjwSqn8ztLvQSAp+fpxGDUObt
         F4wI7c9OeDj6a+f4am3oUEoNm6OVcr+ZZAXRuKIIyXCpTXxdFJ/jZRQZrzaG8lKHY/e1
         VIQllTwYsJ7NGovQa25wSTleRrsLL6Z2QYVk0kmIkzS/6bR6B5qsWgx2Yz+qIT+3NvTR
         QxWPh8t8AY66kWLgjGfjyTd2dScp7eApsq74ZIwlsn5NbpG/ZnC7na0yX615FryoSuwG
         IrlAOMvAkpMExFiJbbUxLB9/6mQsDvU5X0Hb7CBXf53OY+mD/dR3ZBBlfw3ghdtoeHb/
         n/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716289030; x=1716893830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oifNgjW9ezlx4a3OCaH57c5tk1F3SwCBlatkyG3lnRA=;
        b=o6rLrtw19zwUabglndTcakGj399QkWyg7IaKcp0yB8+dZzOA4iyVR5yutei3hfX1j1
         Ofj5kcVyAV2F87vqYbsM0XD6rv4L2a8POXy2SssYdCUg4L+B0VbziZArsk52cHjj8/LM
         t0Kf+c4Ahx3hdG6GVVifua2vaj8foi20pkqFJs4s52YTaRvPISqg7rrMcn0XgKJylWE/
         m15MZAJwWbz4ccMzwTAVFE2/y936+k8/1jl+wk8oZiRan/+WjOxyNlZ6qvy/u0dx5bQ1
         zbVmIMauhnEeGP0S+mPEmCE5mclP8UMYSVQdVdHwzXcmCi3nIpn6Fkenm1i3XMcPRzWs
         tVag==
X-Gm-Message-State: AOJu0Yz8IdqCKUbzTZyo/6FF7bko58bujzvnFK91ynFB8lwLGZ2tLbo6
	NY5RoBYfKt+mIFMYpagwtQg3YU3ELiUk8y3u3KEXjho+OHIteFQDnyOJCZOuojC7dFQjP5AB2lb
	A
X-Google-Smtp-Source: AGHT+IE3H6tgeKr1pNOaXtUIZ/O9cRpMounIllonM3ooAUyLpXNAq+GtvFzgNZ1gDYyjMnwDlollkA==
X-Received: by 2002:a17:902:c950:b0:1f3:b56:80b3 with SMTP id d9443c01a7336-1f30b56842fmr28723415ad.54.1716289029555;
        Tue, 21 May 2024 03:57:09 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f30fb5303csm9693195ad.166.2024.05.21.03.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 03:57:09 -0700 (PDT)
Date: Tue, 21 May 2024 16:27:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH V3 Resend] virtio-transport: Clarify requirements
Message-ID: <20240521105706.tbyigihommrasdua@vireshk-i7>
References: <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
 <20240520092332-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520092332-mutt-send-email-mst@kernel.org>

On 20-05-24, 09:27, Michael S. Tsirkin wrote:
> On Mon, May 20, 2024 at 02:59:40PM +0530, Viresh Kumar wrote:
> > diff --git a/content.tex b/content.tex
> > index 0a62dce5f65f..a79993b5ed69 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -631,8 +631,82 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
> >  
> >  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
> >  
> > -Virtio can use various different buses, thus the standard is split
> > -into virtio general and bus-specific sections.

> > +Devices and drivers can use different transport methods to enable
> > +interaction, for example PCI, MMIO, or Channel I/O. The transport
> > +methods define various aspects of the communication between the device
> > +and the driver, like device discovery, exchanging capabilities,
> > +interrupt handling, data transfer, etc. For example, in a host/guest
> > +architecture, the host might expose a device to the guest on a PCI bus,
> > +and the guest will use a PCI-specific driver to interact with it.
> > +
> > +The standard is split into sections describing general virtio
> > +implementation and transport-specific sections.
> > +
> 
> This makes it seem like trasport is distinct from both
> device and driver. Makes no sense to me.

Yeah, looks wrongly worded. I think we can just retain the earlier
statement here:

Virtio can use various different buses, thus the standard is split
into virtio general and bus-specific sections.

> > +\devicenormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
> > +
> > +The device MUST keep any data associated with a device-initiated
> > +transaction accessible to the driver until the driver acknowledges the
> > +transaction to be complete.
> > +
> > +The device MUST NOT access the contents of a virtqueue before the
> > +driver notifies, in a transport defined way, the device that the
> > +virtqueue is ready to be accessed.
> > +
> > +The device MUST NOT access or modify buffers on a virtqueue after it has
> > +notified the driver about their availability.
> > +
> > +The device MUST reset the virtqueues if requested by the driver, in a
> > +transport defined way, if the transport provides such a method.
> > +
> > +\drivernormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
> > +
> > +The driver MUST acknowledge device notifications, as mandated by the
> > +transport.
> > +
> > +The driver MUST NOT access virtqueue contents before the device notifies
> > +about the readiness of the same.
> > +
> > +The driver MUST NOT access buffers, after it has added them to the
> > +virtqueue and notified the device about their availability. The driver
> > +MAY access them after the device has processed them and notified the
> > +driver of their availability, in a transport defined way.
> > +
> > +The driver MAY ask the device to reset the virtqueues if, for example,
> > +the driver times out waiting for a notification from the device for a
> > +previously queued request.
> >  
> 
> This makes no sense in a normative section.

I am okay with wherever you and Cornelia decide to put this.

> Normative statements are for implementations not spec writers.

Hmm.

> If you think of defining lots of new transports
> (questionable)

There is just one in discussion at the moment on the ARM side,
virtio-msg (for communication between the VMs), but nothing is
finalized yet.

> I think a new non-normative section
> along the lines of newdevice.tex will make sense.

-- 
viresh
