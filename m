Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4029143C6B
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 12:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720010080; cv=none; b=J6a9vyYj0xXK5kML6eYsjjKGFnW04r4Rb+eciiCKjPW65GvF7H/d1G5/N6IgJ+31azTHztuIGWw3l7GyahfNSCa2AgGJAp8ZIrkCmiNaGfFbbM4HY8hqpSrwddMAKlKrnUT7sH60HZL3WvvHmPbtyCo8+ypSNBr37zYOhCblnmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720010080; c=relaxed/simple;
	bh=zIydWeru7hkgZRx8Ylt6wjbu8ooQsTBROjaVHG5bY/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gLic1uPLM5j7Ig5k7iyXCnWKv0M9txYBylAUjqN/ZBt89+i9e5lJE+Yrz9OYho/d6/09D2wI9UGBGZCuC7vW1ytKMra1dMUb/PEZSYq1uPCpBOVqd8hCGDUdwLlTfwkC/Bh+aLHYbODbLZB8rhWv2HcLSr429M8XZicZys+PnWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X4JvNASp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X4JvNASp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720010077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6CBNzzXaxxRoCBoRNlWY6lKO+0hb8SJxaLyRTd1cvrE=;
	b=X4JvNASptHTvtoc0Rudmk7IZ6iflWJPrcHRFji03OLnnJ6vgaj/29H7zZzdB94i+voorHS
	9iZ29gDnYP9lBfti8lPWIdnTjLRGxxNGqaFLPuULGa9DJy0RdPmpXd8XCR/u2id2dMWi6G
	+igf/pzLbdRkuZBE+JqnW7gfe58QHKM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-LIIxm4COPcmGcbfGA2B5NQ-1; Wed, 03 Jul 2024 08:34:36 -0400
X-MC-Unique: LIIxm4COPcmGcbfGA2B5NQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3625bef4461so348158f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 03 Jul 2024 05:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720010075; x=1720614875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CBNzzXaxxRoCBoRNlWY6lKO+0hb8SJxaLyRTd1cvrE=;
        b=dq1GHSTZOeFsBJGyePojlX5ypsgKNap8I1iaUdbEMr+5uZh1ZkCzQK/yNnu7PmPFLi
         1VJnMvuqZZRWzewkKDUc+w+seC14MRTG/+yhOEf9J253IdZuJxV6MpIBrpfCtYXFOvdP
         +utiECATOTOgOphGidzvK4x2axlNS099D36S8F2bJ1ZKJ+yaZp4lkT6zM6Jgrjl2WiGx
         AkdSkEGo47hUhpMUsRhRGM4uez/xsG0hXLsP6Lc2TRsc21VJ1B0bwK8GZA8PfhoBETqX
         8kbvZs3UVmVQQhvhEb3tDGcg+KnBSaiaLEAIguV02JgvjUY5HExCq1kMFXWETAIH41Lp
         RgFQ==
X-Gm-Message-State: AOJu0Yxj8wDZxMqkCHP/aI4CXRcB97cqGwQSJbvAm4dMUGUiubhb2msF
	nbXkj2nnuBGJ50VLRXWczBgv1XzbMh4FSXpVAekQdGH+t+iNyGfFfeYBk9XdylZOYs29tO4uDiS
	72oieGAjfqG/n4iXImjcuo1YSweRx8UMJN0+KpNIFYEC5K103tIgbyAQ9QszLY5Wj
X-Received: by 2002:a05:6000:1e85:b0:360:8c88:ab82 with SMTP id ffacd0b85a97d-367947bdd70mr1302439f8f.30.1720010075287;
        Wed, 03 Jul 2024 05:34:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUozQkQIAFwiFchxuPPAsbQ40VH++tlDhqpXFRTijlVkeHsB+Z4+ZuQILHrtkm9daATx+pmg==
X-Received: by 2002:a05:6000:1e85:b0:360:8c88:ab82 with SMTP id ffacd0b85a97d-367947bdd70mr1302414f8f.30.1720010074569;
        Wed, 03 Jul 2024 05:34:34 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f5:eadd:8c31:db01:9d01:7604])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e12d7sm15796097f8f.51.2024.07.03.05.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:34:33 -0700 (PDT)
Date: Wed, 3 Jul 2024 08:34:29 -0400
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
Message-ID: <20240703083151-mutt-send-email-mst@kernel.org>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <20240702073359-mutt-send-email-mst@kernel.org>
 <SI2PR06MB5385E3CEC459963A7D079B56FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240703042525-mutt-send-email-mst@kernel.org>
 <SI2PR06MB53851F07C15BDC46C74079B5FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <SI2PR06MB53851F07C15BDC46C74079B5FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 03, 2024 at 12:14:01PM +0000, Lege Wang wrote:
> hi,
> 
> > > > After reading this and the text, I can't figure out how is this feature
> > > > supposed to work without races.  What if the device uses a buffer while
> > > > the driver notification is in flight to the device?
> > > Hmm, I think it doesn't matter, Only the used buffer enable notification is
> > > transmitted to device successfully, device starts to judge whether it's time
> > > to send used buffer notification to driver according to its internal interrupt
> > policy.
> > 
> > I don't understand what you are saying. If device has some magical
> > interrupt policy why do we need a notification from the driver
> > at all.
> > 
> > Conversely, if device relies on the notification and thinks that an
> > interrupt is not needed (because it did not get the notification yet),
> > while at the same time the driver is blocked waiting for an interrupt,
> > we get a deadlock.
> No, I'm not saying that our interrupt policy is magical?? Let me explain a bit
> more about its simple mechanism here, there're two basic parameters to control
> whether device should send used buffer notification to driver:
>   1. number of used ring entries written since last used buffer notification to driver, 
>     say threshold value is N.
>   2. Max wait time to send a used buffer notification to driver.
> 
> The work flow would look like below:
> 1. driver enables used buffer notification initially when enabling virtio device
> 2. driver is blocked waiting interrupt.
> 3. if the number of used ring entries written by device is equal to or greater than above threshold N,
>   a used buffered notification is sent to driver immediately, or if this condition is not met, but the period
>   specified by max wait time has reached, device will still send one used buffer notification to driver.
>   And device will recount number of used ring entries written by device from zero and start another
>   Max wait time timer.
> 4. driver is waken up by interrupt, after it has processed used ring entries, it'll start to wait for interrupt
>   again and enable used buffer notification.
> 5. go to step 2.
> 
> >From above work flow, I don't think the deadlock you describe would happen.
> 
> Regards,
> Xiaoguang Wang

1. device sends an interrupt
2. device writes a used entry

Will another interrupt be sent, with driver doing nothing at all?



> > 
> > 
> > --
> > MST

