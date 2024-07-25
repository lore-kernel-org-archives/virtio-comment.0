Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F27CF16
	for <virtio-comment@lists.linux.dev>; Thu, 25 Jul 2024 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721904929; cv=none; b=YYQ0qBTTewfEE1xBeQj3cWTQB+U9jOQi5zIlY03Cntfj1XPJVh6fC+yCFsoV1M1Y71xJdLyG4jBung00h1ohUSRpqZWJdPaLQ3KWs+B6RU69IR8xrHD0pkFQh2NSqFbkni4rPXME23ycHRSfCvnF3mS0hs2SbVmtOVOcuFmDUCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721904929; c=relaxed/simple;
	bh=IpYj/1UhYXT9KHhtJegRlvKW2eksXiGC6ZdKx+0Z+nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOaGBcM4Z2FF3MC6quGPd0fm0AxB5d7e60A/tHrGKzLk0y24s9yj7PAAYv5VzkC4VMn4G41wLcZSH8tDMVoQYzIEN5O5vJ2JZaSDaVsEDF6wijZxI7yNTuFmEFg7ZN3NT/78JcvqIpHyEDeQHVHTPd2hDsL3KMRTc7PH8e6n8Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aHUIXeN7; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHUIXeN7"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7a130ae7126so575243a12.0
        for <virtio-comment@lists.linux.dev>; Thu, 25 Jul 2024 03:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721904927; x=1722509727; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C7hNFAU3/pffVvLtLxOkafbymjSDk2+Yj1XgDq70mbI=;
        b=aHUIXeN76aNJuz9BN9dCA04KwUaykASsm8xp6xsqgyh2DKf3woeOxFlzqK1nzd2/lh
         TWdxPu5N6GpdrVeIoa8197Z0vf06RJfB/ZvAm/L107VDKlOz8jfspfdDyAT9e7tzvk2E
         HoHPrFqV2D4AlZBOGt7GgyoriNOjjJrZEkCkD+B5xO9lWGKjq6VzYmTQwKJ6WCODUKLb
         Tebnb1+wuTYXqrNALVLtBCj4azqe/RCD4AUaXm0GeVgWpxEAx2ckjQBYl82Bdafh0O0L
         Va80O6lVP/lwHuKFs48N5m59107mFHqCxLqwVC6ZEKF8gDKGblE0sWJezeSh3zKwKWAF
         e+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721904927; x=1722509727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7hNFAU3/pffVvLtLxOkafbymjSDk2+Yj1XgDq70mbI=;
        b=Mj6FL7ktRhKsGFWh1d3bBKa9E3Ax/Xq3Kr6dzZfnu+ksQT3iOE7cYkxnmRoV8WG0y5
         fjJTRA9l8hnz+cMovAx8fdaXLJauR+rfmCIN2QYoOzhq4YM84TS/C4Q9gpqG9N7wWFZ4
         9LuGWrn9EQgTpnXzX6yKow0+hvZ51IFeN+cPVDY+a7eg/C01U6NX7qF2GlNU0fwsrUsx
         6KAZV/9Q/o4/8+D7nPUHgEPK7F9HpjdBu3Jeciht57TbSetSu5tT+0fy8aTShVMG1xIJ
         fZP/R4OwE3cDOEuZCGcH+FjRGVOHBMvqSB1NJryDbwy1b0aBANRv3Tkx/NbcLgisi/zT
         rwNg==
X-Forwarded-Encrypted: i=1; AJvYcCX3Zz5HYF2i0Euw+yXNGTeGtx6wHeLbi35HdKCqM33b3hBML+a9f1lqf5b7/uDrn1ltJG5p1SDiHxcsoo+JgsRG1YrVO+GOVjKiXWnK1PQ=
X-Gm-Message-State: AOJu0YxXAGr5rmdASvx4bBP7cSdmaRDBgDWSDEHanHBTUhUsb94qGJyd
	Y2harGk1vu326vfsLvLDH82LNSk9NF4WlP0iJ/NGMb/7Fd3kqwEmcifCignY7wM=
X-Google-Smtp-Source: AGHT+IEacN/CS+wFG6QlP5baTLWAJ/ziarNSqnVPySTi3EyDs+LUZ4uSCjXrqR4qHWZgYMDxP8yZJA==
X-Received: by 2002:a05:6a20:841e:b0:1c4:2469:f893 with SMTP id adf61e73a8af0-1c47b430ebdmr1835657637.46.1721904927249;
        Thu, 25 Jul 2024 03:55:27 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8748a1sm894059b3a.150.2024.07.25.03.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 03:55:26 -0700 (PDT)
Date: Thu, 25 Jul 2024 16:25:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240725105524.sucisnw2djjzewed@vireshk-i7>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <20240724104537.5632obtaek7yr4ct@vireshk-i7>
 <20240724065845-mutt-send-email-mst@kernel.org>
 <20240725091544.kmiij443daqnzkja@vireshk-i7>
 <20240725052410-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725052410-mutt-send-email-mst@kernel.org>

On 25-07-24, 05:28, Michael S. Tsirkin wrote:
> On Thu, Jul 25, 2024 at 02:45:44PM +0530, Viresh Kumar wrote:
> > "A transport provides a mechanism for the device to communicate virtqueue
> > configurations and memory location to the driver."
> 
> not really, it's normally the driver that communicates all this.

Ah.

> and configuration is it's own plural I think.

Hmm, Wikipedia [1] and chatgpt say otherwise.

Anyway, "configuration" is fine here.

> > > > The number of virtqueues per pair are governed by the individual
> > > > +device protocol.
> > > 
> > > what is device protocol?
> > 
> > "The number of virtqueues are governed by the device implementation."
> 
> what are you trying to say? that transport does not need to
> specify this?
> basically we can just kill this sentence then?

Hmm, from what I understand the individual device implementation (protocol as
specified in the virtio-specification, for example I2C, SPI, etc.) specify the
exact number of virtqueues that are required for their working. I am not sure
how a transport changes that.

Please suggest how you think this must be written then.

> pls check what we say about device and driver notifications and follow
> that terminology

"A transport provides a mechanism for the device to send the configuration
change notifications and used buffer notifications to the driver."

"A transport provides a mechanism for the driver to send the available buffer
notifications to the device."

-- 
viresh

[1] https://en.wiktionary.org/wiki/configuration
