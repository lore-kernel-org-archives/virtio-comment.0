Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304B61459F9
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 07:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720166269; cv=none; b=fPJlUVS0ZT9WXHRZWiQr0TI8mO8Cw9j0l3JRgoNJTsZ41DQcdkkOS6nkM5gDH/XMsnFZlHcV5gRPitCiBwqt2WSO3kG3dbxyWsqwHAldih4extRH0dw6BICPUdVlDidZqJEFbiGd1iOapWJZp+OqdYq39s2446nSNkuLSDCT0zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720166269; c=relaxed/simple;
	bh=nvMDU8M+H/ALjziWoGlTrjfkSEXABTgumzFO+QZ1BDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qoUg4NkiKvbMN/kRxl0KwcDiIvj4FjM7B28c+ZWfmeJOyOw6H/vMmos346UaYXWC/9umssIJyZX/E77/iFn18BBihPontEuhTCyAFCemlopPTNsIflpOo0P5uADHuaM4XAYt53XcxK5ZgzUIK58vap/6kCsz+xbIZQbBRVo9mYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f2p5MyMX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f2p5MyMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720166267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wb96x5/0kNVC9GJ068LLtPu0T94sORB/k8WHwzp4TmU=;
	b=f2p5MyMX02G7HiSrEOu5YaOWNzGtCkFwFXYv2YMu8AblQ1nWuBwqCwIPXAUzb0XN3oqYJj
	A0z+Gj522wfnOAz7x18c8gviY0fwKdzOkcErgL4LxgNOxac4FFUcL0NJmQXJSpmJn8361b
	nTwmSC/qGQ+PycLB1EgMQEvvXH36UrE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-ePaPhKU3PNa4QHuU7K1zbQ-1; Fri, 05 Jul 2024 03:57:43 -0400
X-MC-Unique: ePaPhKU3PNa4QHuU7K1zbQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7251ca4d3dso114722666b.2
        for <virtio-comment@lists.linux.dev>; Fri, 05 Jul 2024 00:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720166262; x=1720771062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wb96x5/0kNVC9GJ068LLtPu0T94sORB/k8WHwzp4TmU=;
        b=QrwH+zM7Q/pHk5v8ZAX77xBXkb6iBFByP7k25tTrtUSNvT9xq7pcjSiGCSbsNXcc0q
         L/6wMYzF1dDu1zbWOHz7NPAUD9oW6driXCUKXkSxQ23z8hn1Uq1CSiOEkwEnNjSvkgpy
         4HqnPMM2EtY6pxZFrwR21BRlskEy5VYmqRDHAfom2mFmiwwqxxP+ZX1oPm5AAZajlAn8
         9JOp4XNXXoR9Yj+v9pVdwz/Ae+ur7mLtZ5rqfY+h1HcsTSSb37tUUA1iepEC4IUJKuWC
         sJ5HCxpenscETRcsSdKVrF8k4iC1BZRtfc5O/aCK1RYwVvdHJEpR7Z+nPn9UEnsoWoCe
         ctgw==
X-Gm-Message-State: AOJu0YxoX9ZHducIwhc2wbi1D590ViEnsPmxpDRpbBJ8DyaZ9QqPTyuU
	pHvaif2fAWNwsLfh60HuJMQpwU12SdgkJmV5vsEbNsdfh8TPUzkWmqDZnYWucoe+Jj7xxGJNMSg
	G4NWZxBWWSWO8C931C6s733ILacD0mZjrd4wGA+JJvfo0CbO4lKORK1egT8zfLadV
X-Received: by 2002:a17:907:724e:b0:a72:aeff:dfed with SMTP id a640c23a62f3a-a77ba70d7fcmr341362366b.53.1720166262372;
        Fri, 05 Jul 2024 00:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbsSXP1GIGu0+hiikEOmWE3KVIYBfnrkXyIkt336qmUkbswDVYzI4Y/xfeX4HVbJI3JwFxEQ==
X-Received: by 2002:a17:907:724e:b0:a72:aeff:dfed with SMTP id a640c23a62f3a-a77ba70d7fcmr341360166b.53.1720166261768;
        Fri, 05 Jul 2024 00:57:41 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:1b5b:ac5c:b82e:a18c:2c6e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf18b15sm665340866b.19.2024.07.05.00.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 00:57:41 -0700 (PDT)
Date: Fri, 5 Jul 2024 03:57:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lege Wang <lege.wang@jaguarmicro.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>,
	"ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	"parav@nvidia.com" <parav@nvidia.com>,
	Leo Liu <leo.liu@jaguarmicro.com>,
	Angus Chen <angus.chen@jaguarmicro.com>
Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Message-ID: <20240705035349-mutt-send-email-mst@kernel.org>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <20240702073359-mutt-send-email-mst@kernel.org>
 <SI2PR06MB5385E3CEC459963A7D079B56FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240703042525-mutt-send-email-mst@kernel.org>
 <SI2PR06MB53851F07C15BDC46C74079B5FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240703083151-mutt-send-email-mst@kernel.org>
 <SI2PR06MB5385F178FF558878062A4D2FFFDE2@SI2PR06MB5385.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <SI2PR06MB5385F178FF558878062A4D2FFFDE2@SI2PR06MB5385.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 04, 2024 at 02:27:20AM +0000, Lege Wang wrote:
> hi,
> 
> > -----Original Message-----
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, July 3, 2024 8:34 PM
> > To: Lege Wang <lege.wang@jaguarmicro.com>
> > Cc: virtio-comment@lists.linux.dev; vattunuru@marvell.com;
> > ndabilpuram@marvell.com; parav@nvidia.com; Leo Liu
> > <leo.liu@jaguarmicro.com>; Angus Chen <angus.chen@jaguarmicro.com>
> > Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used
> > buffer notification suppression mechanism
> > 
> > External Mail: This email originated from OUTSIDE of the organization!
> > Do not click links, open attachments or provide ANY information unless you
> > recognize the sender and know the content is safe.
> > 
> > 
> > On Wed, Jul 03, 2024 at 12:14:01PM +0000, Lege Wang wrote:
> > > hi,
> > >
> > > > > > After reading this and the text, I can't figure out how is this feature
> > > > > > supposed to work without races.  What if the device uses a buffer
> > while
> > > > > > the driver notification is in flight to the device?
> > > > > Hmm, I think it doesn't matter, Only the used buffer enable notification is
> > > > > transmitted to device successfully, device starts to judge whether it's time
> > > > > to send used buffer notification to driver according to its internal
> > interrupt
> > > > policy.
> > > >
> > > > I don't understand what you are saying. If device has some magical
> > > > interrupt policy why do we need a notification from the driver
> > > > at all.
> > > >
> > > > Conversely, if device relies on the notification and thinks that an
> > > > interrupt is not needed (because it did not get the notification yet),
> > > > while at the same time the driver is blocked waiting for an interrupt,
> > > > we get a deadlock.
> > > No, I'm not saying that our interrupt policy is magical?? Let me explain a bit
> > > more about its simple mechanism here, there're two basic parameters to
> > control
> > > whether device should send used buffer notification to driver:
> > >   1. number of used ring entries written since last used buffer notification to
> > driver,
> > >     say threshold value is N.
> > >   2. Max wait time to send a used buffer notification to driver.
> > >
> > > The work flow would look like below:
> > > 1. driver enables used buffer notification initially when enabling virtio device
> > > 2. driver is blocked waiting interrupt.
> > > 3. if the number of used ring entries written by device is equal to or greater
> > than above threshold N,
> > >   a used buffered notification is sent to driver immediately, or if this
> > condition is not met, but the period
> > >   specified by max wait time has reached, device will still send one used
> > buffer notification to driver.
> > >   And device will recount number of used ring entries written by device
> > from zero and start another
> > >   Max wait time timer.
> > > 4. driver is waken up by interrupt, after it has processed used ring entries, it'll
> > start to wait for interrupt
> > >   again and enable used buffer notification.
> > > 5. go to step 2.
> > >
> > > >From above work flow, I don't think the deadlock you describe would
> > happen.
> > >
> > > Regards,
> > > Xiaoguang Wang
> > 
> > 1. device sends an interrupt
> > 2. device writes a used entry
> > 
> > Will another interrupt be sent, with driver doing nothing at all?
> Unless driver enables device's used buffer notification, the device will
> not send an interrupt.
> 
> Regards,
> Xiaoguang Wang

how about this:
1. device sends an interrupt
2. device writes a used entry
2. driver enables interrupt



> > 
> > 
> > 
> > > >
> > > >
> > > > --
> > > > MST

