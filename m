Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479F212FB2D
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719997748; cv=none; b=Sf0rUILFmfVjS4Oe1GFcf+95kbgIAGd+4iOaZ0JwAp2ZDiAqMFFuZ/7hEkwVkG1cPTFDZOZGEjdGvXg8BWyw9w9ZNWeiSXdFG1Famte6gNbD+I8T9t62CGR1ZNkDnSfNQJToNAjF7rW3wyPFIkKkkEMjEkld5fqvqQfVRHFf9T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719997748; c=relaxed/simple;
	bh=u8uoFhi7BhxHvGtGncvNXsjyELBtc7z8eKm9qEYj78k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=h+TC1F5jZS4vxfn6cHYPCI/oZ5HpXvRZeFyep7yTpRARcBYpseM+5HS+HsBKjg1wKentKlefn1Aj1Xa6w4OXWLLqxD/M+Y25rsIFB+x+EjKTcjkT2KgiISdcbOcVZrhwOcs7MdO04j0RBju59ATKppmpoAixUGWmg9u8FZetQkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HtsINAy+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HtsINAy+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719997744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xqQc81Wfg1LKBxqB7YFjHR2b9WDZUVyVoTlya2acSZg=;
	b=HtsINAy+o8JD3CBqjMyl+gwXUJVpS2vS8Yxgby7m3Que+5kJsgNKxata/SYXoRoYnS6yCp
	tnF1Q7iKbWnMj6qyNwXOFSdjxkyqTpmq2OUBuI2qsqU2DzHUhqx9jzGpFGpPSWa+x/ZXod
	dNCirwMCXqsRNUS2ypS/37vX3un2g/k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-knakuZe3M0KAYjqVUNfhEQ-1; Wed, 03 Jul 2024 05:09:03 -0400
X-MC-Unique: knakuZe3M0KAYjqVUNfhEQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-58c38bcd765so894533a12.1
        for <virtio-comment@lists.linux.dev>; Wed, 03 Jul 2024 02:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719997742; x=1720602542;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xqQc81Wfg1LKBxqB7YFjHR2b9WDZUVyVoTlya2acSZg=;
        b=WT/PkmkGm4wBFsfq956CZzKwD9/MgVLjBBaZiRFbSazjwg91jgZEtnbgX4GES09b7I
         CpgOnUliWFxCz8XA/xYLM7Io6x980LGjoN2X7VpJ+hrGBnWp5fd//rOMm8f1b+3WOWl/
         NXsYa3NTj1MvsrqWkMpRPK9KTdvx7t6xrJZlmVkIYPSinMa8T7OM0lYRTUlP9uUM2uso
         D43DiVJmwHoJKXSKhNDNHCXc8AqAED58LyOCf9/823rLz8KlcmwZUW0CBlRzyNBirhJy
         F5iDR3J5bKGFlL1XOdN/+ilDJyEj773w9HASvmnNRHwbAeCU6RNAsIxUd3Sk16KQjC8y
         Xevw==
X-Forwarded-Encrypted: i=1; AJvYcCV4mSQ5Pg8le3hKrvPb3p8jMv69bpj9GomwBYU8IP5SpKTdVOl9/QlTJOab3WVQPTB51V/RIphe0+bzvBF4RoIm6Fl6sHPmcIBGr3ew54c=
X-Gm-Message-State: AOJu0YxnFr0o45dC3bq9ToFlI39b0shETIcVK4DlBJCgqoNFW7S0Tl9E
	nHzAcyBTgbma+6VI4Jqdtzi3Gjh2Cw968HBmrC89TZ0hft2tzqqfqZlPVpWEOC0fqt8h4KWLzfH
	NPY5W15KxNBzLR1aH1KPurT7h2Ujw2/7bdp4zp5rKlv5w17jR4zMPX426bn0x5EQ0
X-Received: by 2002:a05:6402:40cc:b0:58d:318a:508f with SMTP id 4fb4d7f45d1cf-58d318a530dmr491538a12.30.1719997742197;
        Wed, 03 Jul 2024 02:09:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVf0oaPAfGuTf054KyBehvpXuaBeVChsUGI+RHOW3VAPUX8jG9QrU9A8/njzcci4m0GR/nhQ==
X-Received: by 2002:a05:6402:40cc:b0:58d:318a:508f with SMTP id 4fb4d7f45d1cf-58d318a530dmr491511a12.30.1719997741568;
        Wed, 03 Jul 2024 02:09:01 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:91a8:a47d:5a9:c02f:92f2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58612c8371dsm6771619a12.9.2024.07.03.02.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:09:00 -0700 (PDT)
Date: Wed, 3 Jul 2024 05:08:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Lege Wang <lege.wang@jaguarmicro.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>,
	"ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	"parav@nvidia.com" <parav@nvidia.com>,
	Leo Liu <leo.liu@jaguarmicro.com>,
	Angus Chen <angus.chen@jaguarmicro.com>
Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Message-ID: <20240703050143-mutt-send-email-mst@kernel.org>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <CACGkMEvrHNnjdgC6Ls=YWRPFxpirCFkbf8_VnNsh-VU4NoK3tw@mail.gmail.com>
 <SI2PR06MB53850C468CF18A489A6E1ED4FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <CACGkMEtzcaUAauzpUdwjS6MEzF-suGLRv5+7cX4PeoAaqEP9hg@mail.gmail.com>
 <SI2PR06MB5385A261415EB70720DA5749FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <CACGkMEs46tCCqCcoeJ0nqOn6SRk0qqS72GSwgyt2m5p4BvNnrQ@mail.gmail.com>
 <20240703042922-mutt-send-email-mst@kernel.org>
 <CACGkMEs=ZJdz9=7qNxPMwEk+h3HGTSU3r-R-VfAERXavn_bW_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEs=ZJdz9=7qNxPMwEk+h3HGTSU3r-R-VfAERXavn_bW_A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jul 03, 2024 at 04:47:41PM +0800, Jason Wang wrote:
> On Wed, Jul 3, 2024 at 4:36 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Jul 03, 2024 at 03:59:11PM +0800, Jason Wang wrote:
> > > On Wed, Jul 3, 2024 at 3:37 PM Lege Wang <lege.wang@jaguarmicro.com> wrote:
> > > >
> > > > hi,
> > > >
> > > > > > >
> > > > > > > 1) With the event index, as long as the used index doesn't pass used
> > > > > > > events you don't need to fetch even index every time
> > > > > > Yeah, I agree VIRTIO_F_EVENT_IDX could help here, but I think it's a relatively
> > > > > > crude mechanism, I have two questions below:
> > > > > >   1. Used event notification suppression structure is still located in
> > > > > >   host memory(in dpu case), I'm not sure whether used_event would
> > > > > >   be allowed to update in the running of one virtio device,
> > > > >
> > > > > What did you mean by "update" here?
> > > > I mean "modify".
> > > >
> > > > >
> > > > > >   If it's allowed,
> > > > > >   seems devices still need to fetch newest used_event info timely.
> > > > >
> > > > > It depends on how you define "timely", I mean unless the used event is
> > > > > not crossed, you don't need to fetch it from the main memory?
> > > > Yes, I got your point here.
> > > > >
> > > > > But basically, I meant putting used_event in a cap/register other than
> > > > > inventing something completely new.
> > > > Sorry, I don't get your point here. What does " cap/register " mean, used_event
> > > > Is located in main memory, right?
> > >
> > > I meant something like this.
> > >
> > > Introduce a capability to allow the driver to duplicate used_event in
> > > the register. And say when the feature is negotiated, the driver MUST
> > > update both used_event in the memory and the register.
> > >
> > > Not saying it can work, but we need to know why it can't work like this.
> >
> > Well I feel if you are proposing a mechanism it's up to you to
> > explain how it works without races.
> 
> I agree, that's why I'm saying "Not saying it can work". But what I
> meant is really to find a way to reuse the event index instead of
> introducing something completely new.
> 
> > The current notification suppression works because the read
> > of the notification by the device flushes out used buffer writes by
> > the device.
> 
> You meant read after write is ordered by PCI?

pci read responses do not bypass writes, yes.

> > If you move it to a separate domain (such as the pci bar of the device)
> > this no longer holds.
> 
> Would this be implementation specific details or could it be done by PCI?

what do you want done by PCI? Generally if things are in one place
they are easier to synchronize, if you spread them around you
need to synchronize them.

> >
> >
> > > >
> > > > >
> > > > > >   2. According to virtio-spec, for example, if used_event is 0, then a device
> > > > > with
> > > > > >   VIRTIO_F_EVENT_IDX would send a used buffer notification to the driver
> > > > > after
> > > > > >   the first buffer is used (and again after the 65536th buffer), should this
> > > > > behavior
> > > > > >   be strictly followed?
> > > > >
> > > > > Used index is best effort, and the driver must handle spurious interrupt.
> > > > OK, I'll discuss this info with my colleague, to see whether it could help.
> > >
> > > Or if you found a bug in the event index, we need to fix it in the spec first.
> >
> > I don't think there's a bug but it's designed to reside in same memory
> > as the used ring.
> 
> Actually, I don't fully understand what Lege said, that's why I'm
> saying "if it's a bug" ...
> 
> >
> > > >
> > > > > > >
> > > > > > > 1) compare disabling via register against memory
> > > > > > > 2) compare auto disable against no auto
> > > > > > I see, but sorry, currently we don't have any performance numbers yet,
> > > > > > but theoretical analysis
> > > > >
> > > > > This might be also helpful, for example, without this proposal x pci
> > > > > transactions per packet, with this proposal y pci transactions per
> > > > > packet.
> > > > I see, later I'll need to see if there's any performance data based on our simulation
> > > > environment to share.
> > >
> > > Great.
> > >
> > > >
> > > > >
> > > > > >  and think it'll help improve performance. Some
> > > > > > popular nic also supports this feature, which disables interrupt after sending
> > > > > > one and needs driver to enable it again. When enabling interrupt again, drivers
> > > > > > can attach some extra information.
> > > > >
> > > > > I'm not saying it doesn't make sense, but t
> > > > >
> > > > > 1) the movitiaton needs to be well explained
> > > > Totally agree.
> > > >
> > > > > 2) we need to know if the existing mechanism can be reused (e.g place
> > > > > used_event in a register)
> > > > That would be better, here the "register" you mentioned is located in a virtio device's
> > > > pci bar?
> > >
> > > Something like this or other place or we can say it could be placed in
> > > a transport specific place.
> >
> > Moving things around changes ordering rules.
> 
> Yes, something needs to be addressed.
> 
> Thanks

