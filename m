Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C159F155C8F
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 10:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720695568; cv=none; b=n/vcW/L5+05zEfhy7ROChJc/4VEkU4cJ6BqfGPF4Xs5QWjg001C/HMHQfIBMLzGGT7s/CR0qDCbZNH3whaARF88pvLt+iDZtLKi6kcInH5rXsGipa5EsCnQjW/KJEmVX87M31Sh2IzFcFjkXz4Y+3MIte5ufQz10WQshCw9DXRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720695568; c=relaxed/simple;
	bh=/XG7MfVk0gGmtUE353+IU1ebHZLhBWdtlpPfHHs4dIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=G+C6NgBW8TQ2ZYztEUBNqpwSnkLj9+oPo54t2EY19Dc4xP4HYqt7eD1O2m/JH9Oy0UpQGaFYlEVU6Cd/r8VpA7dN5ucDHU2pyvwyOjk283/XQ5JH/GagQlkrIDtzsTwIXVwMlmJxU/Tl0jaamMKY7a7DC0aX7+AIyECsiEq9Iqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z+az6Msl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z+az6Msl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720695565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kMw3EJmC5W5TOk+oyrwu2bV1pvDAzvcLzNLOfQ/Zr+0=;
	b=Z+az6MslFBz1ub0C+R2vZr/+lUHKgNkaSjLmh8GYxE5WQIC/wH5qpZsRlobpt4x8lLWjJl
	xdq38mnGZORMEjAL6TCN/d+Wz65KMfY3oXfbpRhgrXTOeoru8080AcPn4aW3eRvfgvGQoS
	6GTiZGazMnucLWrTeBDkN5TjU0chWRA=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-Mw9q1nPUOfOykoPdnf73Ew-1; Thu, 11 Jul 2024 06:59:22 -0400
X-MC-Unique: Mw9q1nPUOfOykoPdnf73Ew-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52e98693f43so748932e87.3
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 03:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720695561; x=1721300361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMw3EJmC5W5TOk+oyrwu2bV1pvDAzvcLzNLOfQ/Zr+0=;
        b=aNcn8i2pD/YR1KMNrNb9NjhmkjDaOtSF8ZtS+EwAbwERteuwXiLf6WPGeAp9n7qR3j
         FsYF5RczHNJZF1rz0nZg3wUlkMx00cnUSNvsFIiAbvoi9KZQ5E1pGV5QhY7j+Z47eaGw
         6HExSBBIMbtwbTC6TRcRsX5ajqxpDTwFu30GUTB9/CRsMBXp5G4p66YIjjsreZVGV422
         C54/ZkpmjtKWs6Kv2mzEbSMp0pNTRs5bBDRQX2F9BWeL/qi4K4lrhkEsuVUJOp/VS2w1
         tddqRmSQ55/PW5Fd7U32FLSwwbQg8u150EGf+gEOvpI2OpLQ1CHMqJPtZYwdiwTR5VZd
         ltTA==
X-Forwarded-Encrypted: i=1; AJvYcCXRx3DXzct5GTyTZ6s5O/W1jI7eekjvgYCc0nG7a67MHcs8p/HwCG2MBIEIFMJiP7itPhjEPP3BAKeDMaZ/SHegfr4nFv4gews5T5mgyJQ=
X-Gm-Message-State: AOJu0YxU4pBRjU6/Zw2RYukzv5sWxxZ5YS3fpCDCmcnIfcgw7p1SahMV
	ZDKUgXIM6yAePWBc7yhzKUOe32noABC6356G5AjQixFiO/jQNM+jPK4oc5BApSdtgS+NrFlsyOF
	T/dV2fNAuLaF90SXb9uuyCYnOY2qGXr9A+OQX6m3fBcsDOKPtaUCK6ZuwtqcgoTCq
X-Received: by 2002:a05:6512:10cf:b0:52c:d94e:393a with SMTP id 2adb3069b0e04-52eb99d29aemr4892104e87.68.1720695561174;
        Thu, 11 Jul 2024 03:59:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz4l+YZf2DN+NewxacJ8mQK61o7/d8YfbQ/13VG2ModoLm4DPfabZgNI2P/gETux2LNvIY2A==
X-Received: by 2002:a05:6512:10cf:b0:52c:d94e:393a with SMTP id 2adb3069b0e04-52eb99d29aemr4892087e87.68.1720695560470;
        Thu, 11 Jul 2024 03:59:20 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde846dfsm7397392f8f.28.2024.07.11.03.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 03:59:19 -0700 (PDT)
Date: Thu, 11 Jul 2024 06:59:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
Message-ID: <20240711065106-mutt-send-email-mst@kernel.org>
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <8734ogcp5b.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <8734ogcp5b.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 11, 2024 at 10:24:16AM +0200, Cornelia Huck wrote:
> On Thu, Jul 11 2024, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > The virtio documentation currently doesn't define any generic
> > requirements that are applicable to all transports. They can be useful
> > while adding support for a new transport.
> >
> > This commit tries to define the same under a new Appendix section.
> >
> > Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> > V6->V7:
> > - Remove parts that talk about accessing content of the virtqueue.
> >
> > V5->V6:
> > - Move the changes to a new appendix section.
> > - Clarify the requirements a bit more based on review comments.
> >
> > V4->V5:
> > - s/The transport/A transport/
> > - s/MUST provide/provides/
> > - Added some text for transport requirements.
> >
> > V3->V4:
> > - Remove the normative sections and use direct speech.
> > - Change wording at few places.
> >
> > V2->V3:
> > - Minor fixes.
> > - Added Reviewed by from Alex.
> >
> > V1->V2:
> > - Lot of changes after discussions with Alex and Cornelia.
> > - Almost a rewrite of the first commit.
> > - Add Transport normative sections.
> >
> >  main.tex         |  2 ++
> >  newtransport.tex | 72 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 74 insertions(+)
> >  create mode 100644 newtransport.tex
> >
> > diff --git a/main.tex b/main.tex
> > index b1913d65e964..6d337217a3d1 100644
> > --- a/main.tex
> > +++ b/main.tex
> > @@ -42,6 +42,8 @@
> >  
> >  \input{newdevice.tex}
> >  
> > +\input{newtransport.tex}
> > +
> >  % acknowledgements
> >  \input{acknowledgements.tex} 
> >  
> > diff --git a/newtransport.tex b/newtransport.tex
> > new file mode 100644
> > index 000000000000..2abd76e5b037
> > --- /dev/null
> > +++ b/newtransport.tex
> > @@ -0,0 +1,72 @@
> > +\chapter{Creating New Transports}\label{sec:Creating New Transports}
> > +
> > +Devices and drivers can use different transport methods to enable
> > +interaction, for example PCI, MMIO, or Channel I/O. The transport
> > +methods define various aspects of the communication between the device
> > +and the driver, like device discovery, exchanging capabilities,
> > +interrupt handling, data transfer, etc. For example, in a host/guest
> > +architecture, the host might expose a device to the guest on a PCI bus,
> > +and the guest will use a PCI-specific driver to interact with it.
> > +
> > +There are some mechanisms that any transport is required to implement,
> > +and some requirements that devices and drivers are required to follow.
> > +
> > +\section{Transport Requirements}\label{sec:Creating New Transports / Transport Requirements}
> > +
> > +A transport provides a mechanism for the driver to discover the device.
> > +
> > +A transport provides a mechanism for the driver to identify the device
> > +type.
> > +
> > +A transport provides a mechanism for communicating virtqueue
> > +configurations between the device and the driver.
> > +
> > +A transport allows multiple virtqueues per device. The number of
> > +virtqueues for a pair of device-driver are governed by the individual
> > +device protocol.
> 
> Maybe "for a given device/driver pair"?
> 
> > +
> > +A transport provides a mechanism that the device and the driver use to
> > +access memory for implementing virtqueues.

Hmm not really.
At the moment virtqueues are all in driver memory, what transport
provides is a mechanism for device to locate this memory.


> > +
> > +A transport provides a mechanism for the device to notify the driver and
> > +a mechanism for the driver to notify the device, for example regarding
> > +availability of a buffer on the virtqueue.
> > +
> > +A transport provides a mechanism for the driver to initiate a reset of
> > +the device.
> > +
> > +A transport provides a mechanism to reset an individual virtqueue.
> 
> Is that more of a requirement or a strong suggestion, given that not all
> existing transports provide this?

I think this should be "a transport can provide" in all instances where
the feature is optional. Given it's usually tied to a feature bit,
also mention that.

> > +
> > +A transport provides a mechanism for the driver to read the device
> > +status. A transport provides a mechanism for the driver to change the
> > +device status.
> > +
> > +A transport provides a mechanism to implement configuration space
> > +between the device and the driver.

so far so good.

> > +\section{Device Requirements}\label{sec:Creating New Transports / Device Requirements}
> > +
> > +The device keeps any data associated with a device-initiated transaction
> > +accessible to the driver until the driver acknowledges the transaction
> > +to be complete.

what are transactions? how does driver acknowledge the transaction to
be complete? Sounds like something Currently spec mentions transactions in the
context of i2c (and in passing, iommu) - maybe put this inside
that device description?

> > +The device resets itself if requested by the driver, in a transport
> > +defined way, if the transport provides such a method.
> > +
> > +The device resets an individual virtqueue if requested by the driver,
> > +in a transport defined way, if the transport provides such a method.
> > +
> > +\section{Driver Requirements}\label{sec:Creating New Transports / Driver Requirements}
> > +
> > +The driver acknowledges device notifications, as mandated by the
> > +transport.
> > +
> > +The driver accesses queued buffers after the device has processed them
> > +and notified the driver of their availability. This mechanism is
> > +transport defined.
> > +
> > +The driver asks the device to reset itself if, for example, the driver
> > +times out waiting for a notification from the device for a previously
> > +queued request.
> > +
> > +The driver asks the device to reset an individual virtqueue.

These two sections are weird.
What is said here that isn't already said in other sections?


> 
> This sentence is a bit weird, like the driver would randomly decide to
> reset a virtqueue :) Can we qualify this a bit?

