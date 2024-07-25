Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B5013A884
	for <virtio-comment@lists.linux.dev>; Thu, 25 Jul 2024 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721898949; cv=none; b=Nr1GHlvVqo4qwxn/bvtsV0buExdlU858PSpv2PHpgC6NUjPaty8Hdg0TBIroUnnK0eC9ymEy/c61XOHkYyKeWdqFE2g6MIzsEqVTGVV7TQTRj7nVQBCFigl2NjRcinQKLD2pnldXkE6UxM2Qdk+DtnRPcRvUd9np4EhoV4xiJWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721898949; c=relaxed/simple;
	bh=awkDJd+tSmDYmbw/rkhR6TpB59SWGohbt4MtDgoW8ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxiV6Fru+SyPTYlKJ21CmtcebQi3sJWuWkC8LVpmCOHug4c+RIE7bEedLfvJCjGx+bOQUiUE0W8DJM/AXjX7dq6IBSYD1+GILK/rSqJICXfIgDF0Aav1o41YJiRAjy8/M5h1I7W2sYCuA63ro265btuZhf5tsz1HTeBvESSK1LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ncx1qWJm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ncx1qWJm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fbc3a9d23bso5002365ad.1
        for <virtio-comment@lists.linux.dev>; Thu, 25 Jul 2024 02:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721898947; x=1722503747; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VWsulasiZQPyTco51lhFto4xnbSoTKpLw0JJUM3MMQ0=;
        b=Ncx1qWJmbjsD2lBR24Wcuj1ITbDJKqPHXGesiMiVbqeAl3ttrzzSqon0Hs4q97jge2
         cSL8I5dpcvRz0JL2E28kcPUyEYxAmw+cnyi/Z808+4xCh1jBAM7l6U6SGMS24ll/HnkL
         N4SrN7nLvBk+nK9SpnNInLEcvM8+SwQHWYxDSH1KTkKXMpR5gX2yP4rgLjBe7wyg2MFw
         J7kR9jG0FJUYZsNlIDiGPx2jCNh+vF4CBzSZMWFTJjzF/XczlTYLPf2j+ZXbMOIZGeYH
         h93eoVIssT1tKF6dfB/8w83sEXojffEA8Y00wvuBvYfY2+1wv8n9++elb1hyS+SvzD6K
         Bd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721898947; x=1722503747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWsulasiZQPyTco51lhFto4xnbSoTKpLw0JJUM3MMQ0=;
        b=wJGWvknmzhdtZn8gqzNRWFRJLABXdPoY/l5NQ8F1xjz0HxXupqZeXlmUrzwEkoSALO
         1ABTcEtIEqxDRDMW6tkP/Qm9vHe2fz7AYiuUbT7ObQujmZYjMHIXu/RWYHRwzuNY7+aD
         14536V8U4FQkYYhdD9eKq/IW+djpdIcrFsOyE2XJl+SFmSToYUiWRAal2rVZ9Qai/zyc
         yPpbyxqMbaph/cjQWGbM6toeZFSb+lLzdI0Y7pW2TqEDtix5WdeL1+7zS+q0BlO0SSmZ
         gdVSA4gickILxPut/EabumpqAOc0XQOCeWZI8Kksc9NWtqf5oN6travw10L8A021Qoy4
         z43g==
X-Forwarded-Encrypted: i=1; AJvYcCWDBHgTkn6GQ7dO6NjP+KmJ9LkeCwN+eKNB42MBaNGUg38lry/fZFx3Qn+gbr1zKjNxX/izLoxMVRuvO1QPT2KwwOmHDwdrJg5ByA4nLik=
X-Gm-Message-State: AOJu0YyIzPmxW99Bk3ZQ9U57GSiFlzri4SgqnxuKBdsXKGuJgbQLzpaw
	zWBNKI45hr0x0dEHRFnyIg2oGJfvb2RKRX4OiOIL1BqMLBmIIABDC3u7rYvo5hY=
X-Google-Smtp-Source: AGHT+IH9qRJx0p9CzcZvWoqMnd340LXiP0LBE7Fh232HViwIaBGAmdjG0HtbeUY6B6lPbQtDBGWEAw==
X-Received: by 2002:a17:903:41c8:b0:1fc:6a81:c5a1 with SMTP id d9443c01a7336-1fed35360demr27487305ad.12.1721898947222;
        Thu, 25 Jul 2024 02:15:47 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c8d1f6sm9532345ad.8.2024.07.25.02.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 02:15:46 -0700 (PDT)
Date: Thu, 25 Jul 2024 14:45:44 +0530
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
Message-ID: <20240725091544.kmiij443daqnzkja@vireshk-i7>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <20240724104537.5632obtaek7yr4ct@vireshk-i7>
 <20240724065845-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724065845-mutt-send-email-mst@kernel.org>

On 24-07-24, 07:05, Michael S. Tsirkin wrote:
> I don't know do you keep talking about "pair" everywhere.

This came from one of the review comments and so I tried to use the same
language everywhere.

> Just say "the device and the driver" or "a device and a driver" as
> apporpriate.  And in many cases it is actually just one of these.

That's a mistake then. Will fix it.

> > +This section specifies the mandatory requirements that any transport
> > +needs to implement.
> > +
> > +\section{Transport Requirements}\label{sec:Creating New Transports / Transport Requirements}
> > +
> > +A transport provides a mechanism to implement configuration space
> > +between a pair of device-driver.
> 
> configuration space is not "between".

"... implement configuration space for the device and the driver."

> > +A transport provides a mechanism for a pair of device-driver to
> > +communicate virtqueue configurations and virtqueue memory location.
> 
> this is only communicated one way

"A transport provides a mechanism for the device to communicate virtqueue
configurations and memory location to the driver."

> > +A transport provides a mechanism for the driver to identify the device
> > +type.
> > +
> > +A transport allows one or more virtqueues for a given device-driver
> > +pair.
> 
> no idea what does virtqueues for a pair mean.

"A transport allows one or more virtqueues to be implemented for a device and a
driver."

> > The number of virtqueues per pair are governed by the individual
> > +device protocol.
> 
> what is device protocol?

"The number of virtqueues are governed by the device implementation."

> > +A transport provides a mechanism for the device and driver to notify
> > +each other, for example regarding availability of a buffer on the
> > +virtqueue.
> 
> notify should be more specific. about vq events?
> this is only notified one way, not "each other".

"A transport provides a mechanism for the device to send a virtqueue event to
the driver, for example regarding availability of a buffer on the virtqueue."

> > +A transport provides a mechanism for the driver to initiate a reset of
> > +the device.
> > +
> > +A transport provides a mechanism for the driver to read or modify the
> > +device status.
> 
> I don't think reading status is strictly required, except for
> FEATURES_OK bit.

"A transport provides a mechanism for the driver to read the FEATURES_OK bit."

"A transport provides a mechanism for the driver to modify the device status."

-- 
viresh
