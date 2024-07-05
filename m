Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6494149C5A
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 11:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720179003; cv=none; b=Kz0nycjVv5cuSrxTxxsecvc4HLw2C4DL7FXPfVNHQiSOi03iNOpBFEfn3NTJO3Hd4Uz9cSJmRwiEEeTHFCnPoaLipN+SoOYq0khxpw8gLxrstZ7uhtCgolXtwjeTD3zgOEobru/My7wC5AlYeQtHySyPdMuKnKcez1qTObEYXQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720179003; c=relaxed/simple;
	bh=e3ogqUDXabgkX0KJ2ID+fQV37I4O1TD1d4V1KHHRqVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=c7NGUgJUGg4U8cr0UWwvoh/79hh5zJHzINRkQpcTzCuAXeE2RcTsLL6PRPzT2JvouTwe3tqTU9iuHoJ/J4bdMcOe1fUGw+k4OZMxLTHFpkgCb9vMV4OzNiT/gdNLpqyhdhueCNmu/65+1cqLsFmbAKTxQDtV2+MLATT6opnq+ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hm4okdMa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hm4okdMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720179000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wrbWr0CossCrYkobvEDWA3xnI1DSe1TTirARi99etyI=;
	b=Hm4okdMazWpAJvY4eMV4R7b/lR96GFRSbbLwz4nuQgDCkg8n11qnVlMK4/203o1642grBq
	X8xdkaNCVV+M7XDjUK9ScCSGOnnKaF8dBKufFK3cDNFAfMmwjZjOIXH46V2xO+dBosxxjU
	F5b89BX9RcZdOrv6ilD/z1SJmgXr5fo=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-rV8l5he3M8WBrW4leJgVLw-1; Fri, 05 Jul 2024 07:29:58 -0400
X-MC-Unique: rV8l5he3M8WBrW4leJgVLw-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ee864483c2so15060941fa.2
        for <virtio-comment@lists.linux.dev>; Fri, 05 Jul 2024 04:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720178997; x=1720783797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrbWr0CossCrYkobvEDWA3xnI1DSe1TTirARi99etyI=;
        b=EVHeM02OsD3fTbFYp+Jg61QGSHfvAcmwW3gh8/CwxojvAAyE5i2RYWm7MK1+nlPjsP
         oBJVLdFq0YwrflIhJ77rynhyfe5hQ6zz92YzN3Na6rrB71DbK8BajEJ9TcMVittO8jpm
         6fibhNZeB5tCxS1giUYjjzv1NL/mrJlonpfw01aI4NN9ieGEmfl7Gw+2oxt3OVE/LY5n
         9QTGWt/yWj5gSMkfK5nKqjWUXCewXuuSnfRZnBYqo4IEjx1hhrNfghixMTPckar5u/Be
         05E5e/29KSl3ary4x8XhAtBEDpcpOycOrRjo20La4GpbPsSvhw9O3IA8ajHBl/awidIc
         azDA==
X-Gm-Message-State: AOJu0YwFvTP+PVaZel8A6UWPevIci1U58wQvAw6XV2pv8CVHxxv2UAnp
	EGCe7cSqoyw5dLb1CUR3flrKyPyJKe/CYsSXApuVbqMcQ0a0RDlCvOVbhTIKDybVGMJotAMiGCM
	vLUlrrAdsAH5eO8+Qowl/jIIRzx8BJ6jVMebu2XaGimO2Lae6R0cbu/i9RE5z+20V
X-Received: by 2002:a2e:9943:0:b0:2ee:80b2:1ea2 with SMTP id 38308e7fff4ca-2ee8edd324bmr28090851fa.40.1720178997499;
        Fri, 05 Jul 2024 04:29:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9MMMOUFHVflYZl7ZctuLQJTGRJdJDpPGthOaxROTrcdjTt3drEyqwgYoLhRkbY+VYM3KQ+w==
X-Received: by 2002:a2e:9943:0:b0:2ee:80b2:1ea2 with SMTP id 38308e7fff4ca-2ee8edd324bmr28090651fa.40.1720178996821;
        Fri, 05 Jul 2024 04:29:56 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:1b5b:ac5c:b82e:a18c:2c6e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm58705035e9.2.2024.07.05.04.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 04:29:56 -0700 (PDT)
Date: Fri, 5 Jul 2024 07:29:52 -0400
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
Message-ID: <20240705071508-mutt-send-email-mst@kernel.org>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <20240702073359-mutt-send-email-mst@kernel.org>
 <SI2PR06MB5385E3CEC459963A7D079B56FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240703042525-mutt-send-email-mst@kernel.org>
 <SI2PR06MB53851F07C15BDC46C74079B5FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240703083151-mutt-send-email-mst@kernel.org>
 <SI2PR06MB5385F178FF558878062A4D2FFFDE2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240705035349-mutt-send-email-mst@kernel.org>
 <SI2PR06MB53853B30A07F8D1AF94A8DA9FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <SI2PR06MB53853B30A07F8D1AF94A8DA9FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 05, 2024 at 11:12:47AM +0000, Lege Wang wrote:
> hi,
> 
> > >
> > > > -----Original Message-----
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Wednesday, July 3, 2024 8:34 PM
> > > > To: Lege Wang <lege.wang@jaguarmicro.com>
> > > > Cc: virtio-comment@lists.linux.dev; vattunuru@marvell.com;
> > > > ndabilpuram@marvell.com; parav@nvidia.com; Leo Liu
> > > > <leo.liu@jaguarmicro.com>; Angus Chen <angus.chen@jaguarmicro.com>
> > > > Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used
> > > > buffer notification suppression mechanism
> > > >
> > > > External Mail: This email originated from OUTSIDE of the organization!
> > > > Do not click links, open attachments or provide ANY information unless you
> > > > recognize the sender and know the content is safe.
> > > >
> > > >
> > > > On Wed, Jul 03, 2024 at 12:14:01PM +0000, Lege Wang wrote:
> > > > > hi,
> > > > >
> > > > > > > > After reading this and the text, I can't figure out how is this feature
> > > > > > > > supposed to work without races.  What if the device uses a buffer
> > > > while
> > > > > > > > the driver notification is in flight to the device?
> > > > > > > Hmm, I think it doesn't matter, Only the used buffer enable notification
> > is
> > > > > > > transmitted to device successfully, device starts to judge whether it's
> > time
> > > > > > > to send used buffer notification to driver according to its internal
> > > > interrupt
> > > > > > policy.
> > > > > >
> > > > > > I don't understand what you are saying. If device has some magical
> > > > > > interrupt policy why do we need a notification from the driver
> > > > > > at all.
> > > > > >
> > > > > > Conversely, if device relies on the notification and thinks that an
> > > > > > interrupt is not needed (because it did not get the notification yet),
> > > > > > while at the same time the driver is blocked waiting for an interrupt,
> > > > > > we get a deadlock.
> > > > > No, I'm not saying that our interrupt policy is magical?? Let me explain a
> > bit
> > > > > more about its simple mechanism here, there're two basic parameters to
> > > > control
> > > > > whether device should send used buffer notification to driver:
> > > > >   1. number of used ring entries written since last used buffer notification
> > to
> > > > driver,
> > > > >     say threshold value is N.
> > > > >   2. Max wait time to send a used buffer notification to driver.
> > > > >
> > > > > The work flow would look like below:
> > > > > 1. driver enables used buffer notification initially when enabling virtio
> > device
> > > > > 2. driver is blocked waiting interrupt.
> > > > > 3. if the number of used ring entries written by device is equal to or
> > greater
> > > > than above threshold N,
> > > > >   a used buffered notification is sent to driver immediately, or if this
> > > > condition is not met, but the period
> > > > >   specified by max wait time has reached, device will still send one used
> > > > buffer notification to driver.
> > > > >   And device will recount number of used ring entries written by device
> > > > from zero and start another
> > > > >   Max wait time timer.
> > > > > 4. driver is waken up by interrupt, after it has processed used ring entries,
> > it'll
> > > > start to wait for interrupt
> > > > >   again and enable used buffer notification.
> > > > > 5. go to step 2.
> > > > >
> > > > > >From above work flow, I don't think the deadlock you describe would
> > > > happen.
> > > > >
> > > > > Regards,
> > > > > Xiaoguang Wang
> > > >
> > > > 1. device sends an interrupt
> > > > 2. device writes a used entry
> > > >
> > > > Will another interrupt be sent, with driver doing nothing at all?
> > > Unless driver enables device's used buffer notification, the device will
> > > not send an interrupt.
> > >
> > > Regards,
> > > Xiaoguang Wang
> > 
> > how about this:
> > 1. device sends an interrupt
> > 2. device writes a used entry
> > 2. driver enables interrupt
> 
> Indeed enabling used buffer notification and sending used buffer notification are matched operations.
> Time-sequence |  driver           |  device
> T1           | enable notification  |
> T2           |                  |  send notification
> T3           |                  |
> T4           | enable notification  |
> T5           |                  |  send notification
> 
> That means once driver enables interrupt, device will ensure that it will send an
> Interrupt if there are used events written. If driver does not enable interrupt at all,
> Device will not send interrupt.
> 
> But yet there is a case to take care, which driver does not handle all used buffer events it received,
> parav explained It would happen before. As I said in this proposal, when driver enables interrupt, it'll
> also send driver's last_used_idx info to device, see below handling:
>   1 driver enable interrupt
>   2 driver submit 5 requests
>   3 all 5 request are completed, device sends interrupt, now device's used_idx is 5.
>   4 driver gets interrupt, and it just handled 3 requests, so last_used_idx is 3.
>   5 driver enables interrupt and attach last_used_idx(3) info.
>   6 device will know that driver does not handle 2 requests and will add these two requests to
>     the number of used ring entries written since last used buffer notification, that means
>     though if there is no new used ring entries written, because of these two outstanding requests,
>     device will still send an interrupt.
> 
> So I still think the deadlock you describe would not happen.
> 
> Regards,
> Xiaoguang Wang

Hmm this is different from event index (which simple triggers when
device is using a buffer at a given index).

We will need to define exactly what is the index sent in the
request and how does device handle it. Here you described
an example, but I don't really know what exactly is expected
generally. So device gets some index, how does it decide whether
to send this immediate notification?


Also looks like this is less "enabling notifications" and more "request
notifications".





> > to
> 
> Regards,
> Xiaoguang Wang
> > 
> > 
> > 
> > > >
> > > >
> > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > MST

