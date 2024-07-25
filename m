Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B5D13A414
	for <virtio-comment@lists.linux.dev>; Thu, 25 Jul 2024 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721899695; cv=none; b=YMkUUrTY9mFsLFCtUYkfSG4tfi5KRzyfx2IVFqhKWMCuSxkhUwvhvAJFYXGHnfPJhtprJneqe38FW68ZFHjxD/gJ8dGU96JpD8YPHMUF+4Lc0RLdw8n9oXmBBsqq+sk3okyC2IcJbURS+Ppxi3ARLaOZ2p17IQFiztZmLsUHSas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721899695; c=relaxed/simple;
	bh=MkdmVdkYKrGX2rLRupxGtqjRWK7Wol0D+100hrWGSbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hcRRauecaCsFG0OeSNZZvvfum37G5V+ae8GsYuBCSDOCNuvb31zKFEVA0X+J0ycEom5uwaM7WrZs7LAFjW+cHqUzOxPp2xjHVkt+O8MWWYL+XsEoKswdEwvDe+w9XIAhdlfUsT6aLfCd3mHySBefnRqGc3u8nco7DU75q6QzeQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GyHGINcV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GyHGINcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721899691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oGfNYo9wIFgY3IRtg5yCVErbcwNZvd2XjkXdFkq0aOI=;
	b=GyHGINcVGbJQKNb8OL31zfHRLXtr+g8qZe/JsmVBbgrkWt5McUaGeiU8wKddAjnxX3NPE0
	JpnyHiMSOWAuFmeo0XLf3uXEOr6Q/Ge6ZEPMThJmJHkIfZajrzfN2jL5FA0eSbczXnEnVU
	5WH9HnqPbhe8C37xwxbNtjoqCM5TaOM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-xhtDIGJkM_edZImCEuBQxA-1; Thu, 25 Jul 2024 05:28:10 -0400
X-MC-Unique: xhtDIGJkM_edZImCEuBQxA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42668796626so5585485e9.0
        for <virtio-comment@lists.linux.dev>; Thu, 25 Jul 2024 02:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721899689; x=1722504489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGfNYo9wIFgY3IRtg5yCVErbcwNZvd2XjkXdFkq0aOI=;
        b=QmYCMFxryoBqW/yu2YSM1620u9d1IsUUEAzCEgILPNoyIgXW4mGrnolhGXO+N31da3
         Xsc4Nq4ylJR9JNtpLfGWwebRiKit2Xm3wBUTplxEDWjzOKgwNM9m1Tob5l6qeY38uw7F
         6shLT6pu1WjY7qWwtxGEEQ1ixOE4GNV1CDeh+nOLyYbcTHfhPVGIHUQduq7/cFdNrThw
         +SZ0jc4CH7koHU+SmqOiDiKIvi5m1DxBLoKmkK+CEA+U/StVLfIErcc15mjCU4LLlHcV
         4nssQRjruyK3unSEh+jmOdrGcATI6AffkKMY3l5x4qCuWwC42PKs5mkCFE5HZhzBHjm8
         maVw==
X-Forwarded-Encrypted: i=1; AJvYcCXp6W/1YlmlEVXByf3FJoGccKLhZcRA/H+MzW6xtyaR74YNAf3br5Bga0ATJFyoGvwxksQs+iFne7NjNo5pf3nKctVOLIRPXfPWVDclkqk=
X-Gm-Message-State: AOJu0YzxpspOW2KDcA6w425QV/2ntBaYtAGNPhgZ5zJlNyWl3VR+eM6P
	3zAW1HkiSxw87j9C4PcNUM4s2RBfVE7Gm36f+ubfi/ioIGfls4MUfIyq/qUFGauVFHH6iF5ksYc
	0+gL+769nHh09c8jLbPqd/O8LMMyq3LZhQ2FAm4SaxLO2CTtkqdmqFna1/a+ANR4w
X-Received: by 2002:a05:600c:1e04:b0:426:6edb:7e14 with SMTP id 5b1f17b1804b1-4280579f013mr9811675e9.35.1721899689349;
        Thu, 25 Jul 2024 02:28:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTH/UQngyy9TDlLPcjZx7GKPpmssO3xSlWrQVJpqqU6ZyMLkt/aGx79fuXkVD4IeFGRzzo/Q==
X-Received: by 2002:a05:600c:1e04:b0:426:6edb:7e14 with SMTP id 5b1f17b1804b1-4280579f013mr9811495e9.35.1721899688712;
        Thu, 25 Jul 2024 02:28:08 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1ec:81aa:776c:8849:e578:516a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f9372a5asm68256905e9.15.2024.07.25.02.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 02:28:08 -0700 (PDT)
Date: Thu, 25 Jul 2024 05:28:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240725052410-mutt-send-email-mst@kernel.org>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <20240724104537.5632obtaek7yr4ct@vireshk-i7>
 <20240724065845-mutt-send-email-mst@kernel.org>
 <20240725091544.kmiij443daqnzkja@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240725091544.kmiij443daqnzkja@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 25, 2024 at 02:45:44PM +0530, Viresh Kumar wrote:
> On 24-07-24, 07:05, Michael S. Tsirkin wrote:
> > I don't know do you keep talking about "pair" everywhere.
> 
> This came from one of the review comments and so I tried to use the same
> language everywhere.
> 
> > Just say "the device and the driver" or "a device and a driver" as
> > apporpriate.  And in many cases it is actually just one of these.
> 
> That's a mistake then. Will fix it.
> 
> > > +This section specifies the mandatory requirements that any transport
> > > +needs to implement.
> > > +
> > > +\section{Transport Requirements}\label{sec:Creating New Transports / Transport Requirements}
> > > +
> > > +A transport provides a mechanism to implement configuration space
> > > +between a pair of device-driver.
> > 
> > configuration space is not "between".
> 
> "... implement configuration space for the device and the driver."

just the device

> > > +A transport provides a mechanism for a pair of device-driver to
> > > +communicate virtqueue configurations and virtqueue memory location.
> > 
> > this is only communicated one way
> 
> "A transport provides a mechanism for the device to communicate virtqueue
> configurations and memory location to the driver."

not really, it's normally the driver that communicates all this.
and configuration is it's own plural I think.

> > > +A transport provides a mechanism for the driver to identify the device
> > > +type.
> > > +
> > > +A transport allows one or more virtqueues for a given device-driver
> > > +pair.
> > 
> > no idea what does virtqueues for a pair mean.
> 
> "A transport allows one or more virtqueues to be implemented for a device and a
> driver."

by the device

> > > The number of virtqueues per pair are governed by the individual
> > > +device protocol.
> > 
> > what is device protocol?
> 
> "The number of virtqueues are governed by the device implementation."

what are you trying to say? that transport does not need to
specify this?
basically we can just kill this sentence then?

> > > +A transport provides a mechanism for the device and driver to notify
> > > +each other, for example regarding availability of a buffer on the
> > > +virtqueue.
> > 
> > notify should be more specific. about vq events?
> > this is only notified one way, not "each other".
> 
> "A transport provides a mechanism for the device to send a virtqueue event to
> the driver, for example regarding availability of a buffer on the virtqueue."

/facepalm
this just messes up terminology completely.
pls check what we say about device and driver notifications and follow
that terminology


> > > +A transport provides a mechanism for the driver to initiate a reset of
> > > +the device.
> > > +
> > > +A transport provides a mechanism for the driver to read or modify the
> > > +device status.
> > 
> > I don't think reading status is strictly required, except for
> > FEATURES_OK bit.
> 
> "A transport provides a mechanism for the driver to read the FEATURES_OK bit."

status bit

> 
> "A transport provides a mechanism for the driver to modify the device status."
> 
> -- 
> viresh

