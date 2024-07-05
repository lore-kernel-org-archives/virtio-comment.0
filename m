Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB30E132103
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 07:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720165735; cv=none; b=XzIHV0fRZwVDIy8HOjPOC9E+Khu5FrE3wLUTsVaHPjAfD752jw1aH6GTvyd/uEKCnXlJrtyHpkgLZIapk1CSyBP8tRP8tq0oDW8L00K+tFZ5pHNUAcini1FoaqekoPraPKixI+McnSP/fejU+Su4iuJUf85tm2k/TzfPxWANRXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720165735; c=relaxed/simple;
	bh=kzsW4cPHhnssaLTuWi6z70214GgnV2JWzj7JYcpRojM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qSqi42ZFrPAxKRukSJwChKZRaOpTfK6DtakVyNHEcUqtvdG1LfPbmTbmswgO/84vs/punY1a4v/8sHnF7BSkAcaZfTQxAysTgnZgaPccX89vYjnqIbYjT2M3CmfLQat4Hokbv2+cSvS2UC9pul9mJ+xfaCd9pZ4DvzKHd90az84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bsvdzP29; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bsvdzP29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720165732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sDxkFAd7vzWRXb6UCO/EToYlk2+spp3nQk+DKp4eiZg=;
	b=bsvdzP29A+nxR7q2RB5lqwkGz+Hp0qBlBmyB9oKjJ/4IB3xbRcpI01CDdfdvEtW2VKvzjp
	Io5ePML0oGTWKGhIKfgl3bvh7Esc3fYT7eBc46YoCfnFWJ9hy3U6/41I2NglKZEbLXCw8t
	aSGk00klG+UCPps4r8tZHzodZSPZGLs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-XbuVROoFP7eNr1wtTIlKFQ-1; Fri, 05 Jul 2024 03:48:50 -0400
X-MC-Unique: XbuVROoFP7eNr1wtTIlKFQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-425739141c2so10093885e9.2
        for <virtio-comment@lists.linux.dev>; Fri, 05 Jul 2024 00:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720165730; x=1720770530;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDxkFAd7vzWRXb6UCO/EToYlk2+spp3nQk+DKp4eiZg=;
        b=RrEc2ZPmSJjlDSEQsiPpIJHta0DZS9D95l1KYzuxVJ4t/vL7YFrvtY8Zub+AeicjUm
         SqBBrmVCFFFiftsQJhiltcJH+HPzAT09FvhImjnRrcgSCZsWCkJUQWkrYaM4l02dMC5m
         VgVSHGJ4Fhu7wMkDZj6lriqZ/B+YhYklofDmJdDxGtwVgXfd9woUFaDGk9BI8vktl6lw
         GjC5hyD7a5zTtk533fG1b5ivRJwh8z6Xz73I0TYPRHaonDai4UOatPOrefWSczAVp3Nm
         OiYsmnTLzCu4YSVB/ARmTkUCPd002lqf3y53PXn39UeXLo4IkiuntE52F8ObbSYdu5sq
         uJHA==
X-Forwarded-Encrypted: i=1; AJvYcCUT91cy3BlxDaH3eFffX274OmsyM06lJ1FNXIDTv7NBmH7e+EP9+oSAH+5T1Su0RIc6NJBWZGBNZKqEpC89oloZiUglU88JnA+F+0VC6jU=
X-Gm-Message-State: AOJu0Yx4JvwK1t4mFjDWf7f8hC8+0NznWmiElGzbowim7aLwMQjJWkS2
	4mDe/3pytXpjkalSwmOFIxpiKqepMHq4xeGrGNw2IY8slKhTdi+BDuSI3kQ4MZt3/FzxJDeLfx3
	8InnDWPo+VnqfDGLYhTEz83k2EfeWeeYJNyoKu4YOiXSXXoJTGf5ZvN8cSOMcROO1
X-Received: by 2002:adf:f250:0:b0:35f:2a02:6038 with SMTP id ffacd0b85a97d-3679dd67a3bmr2667181f8f.47.1720165729832;
        Fri, 05 Jul 2024 00:48:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg9dX8zGHb43LxCJ6CPedAABfh3OwCT3apUM2NWf5iXe33RL2ZJh5rr7qPCqFu6g5lSyjS7w==
X-Received: by 2002:adf:f250:0:b0:35f:2a02:6038 with SMTP id ffacd0b85a97d-3679dd67a3bmr2667165f8f.47.1720165729152;
        Fri, 05 Jul 2024 00:48:49 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:1b5b:ac5c:b82e:a18c:2c6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d00sm20239217f8f.99.2024.07.05.00.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 00:48:48 -0700 (PDT)
Date: Fri, 5 Jul 2024 03:48:44 -0400
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
Message-ID: <20240705034732-mutt-send-email-mst@kernel.org>
References: <SI2PR06MB53850C468CF18A489A6E1ED4FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <CACGkMEtzcaUAauzpUdwjS6MEzF-suGLRv5+7cX4PeoAaqEP9hg@mail.gmail.com>
 <SI2PR06MB5385A261415EB70720DA5749FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <CACGkMEs46tCCqCcoeJ0nqOn6SRk0qqS72GSwgyt2m5p4BvNnrQ@mail.gmail.com>
 <20240703042922-mutt-send-email-mst@kernel.org>
 <CACGkMEs=ZJdz9=7qNxPMwEk+h3HGTSU3r-R-VfAERXavn_bW_A@mail.gmail.com>
 <20240703050143-mutt-send-email-mst@kernel.org>
 <CACGkMEtgAD4mPLpf4fLAsVzzUGvbx1+XTxyGLtMSOJzHp-JtGA@mail.gmail.com>
 <20240704042308-mutt-send-email-mst@kernel.org>
 <CACGkMEunhLoyWD29ycR6cLU6zX2ME8qoNswUhMHhiHuEMtYVRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEunhLoyWD29ycR6cLU6zX2ME8qoNswUhMHhiHuEMtYVRw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jul 05, 2024 at 01:48:36PM +0800, Jason Wang wrote:
> On Thu, Jul 4, 2024 at 4:31 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Jul 04, 2024 at 01:37:44PM +0800, Jason Wang wrote:
> > > On Wed, Jul 3, 2024 at 5:09 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Wed, Jul 03, 2024 at 04:47:41PM +0800, Jason Wang wrote:
> > > > > On Wed, Jul 3, 2024 at 4:36 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Wed, Jul 03, 2024 at 03:59:11PM +0800, Jason Wang wrote:
> > > > > > > On Wed, Jul 3, 2024 at 3:37 PM Lege Wang <lege.wang@jaguarmicro.com> wrote:
> > > > > > > >
> > > > > > > > hi,
> > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > 1) With the event index, as long as the used index doesn't pass used
> > > > > > > > > > > events you don't need to fetch even index every time
> > > > > > > > > > Yeah, I agree VIRTIO_F_EVENT_IDX could help here, but I think it's a relatively
> > > > > > > > > > crude mechanism, I have two questions below:
> > > > > > > > > >   1. Used event notification suppression structure is still located in
> > > > > > > > > >   host memory(in dpu case), I'm not sure whether used_event would
> > > > > > > > > >   be allowed to update in the running of one virtio device,
> > > > > > > > >
> > > > > > > > > What did you mean by "update" here?
> > > > > > > > I mean "modify".
> > > > > > > >
> > > > > > > > >
> > > > > > > > > >   If it's allowed,
> > > > > > > > > >   seems devices still need to fetch newest used_event info timely.
> > > > > > > > >
> > > > > > > > > It depends on how you define "timely", I mean unless the used event is
> > > > > > > > > not crossed, you don't need to fetch it from the main memory?
> > > > > > > > Yes, I got your point here.
> > > > > > > > >
> > > > > > > > > But basically, I meant putting used_event in a cap/register other than
> > > > > > > > > inventing something completely new.
> > > > > > > > Sorry, I don't get your point here. What does " cap/register " mean, used_event
> > > > > > > > Is located in main memory, right?
> > > > > > >
> > > > > > > I meant something like this.
> > > > > > >
> > > > > > > Introduce a capability to allow the driver to duplicate used_event in
> > > > > > > the register. And say when the feature is negotiated, the driver MUST
> > > > > > > update both used_event in the memory and the register.
> > > > > > >
> > > > > > > Not saying it can work, but we need to know why it can't work like this.
> > > > > >
> > > > > > Well I feel if you are proposing a mechanism it's up to you to
> > > > > > explain how it works without races.
> > > > >
> > > > > I agree, that's why I'm saying "Not saying it can work". But what I
> > > > > meant is really to find a way to reuse the event index instead of
> > > > > introducing something completely new.
> > > > >
> > > > > > The current notification suppression works because the read
> > > > > > of the notification by the device flushes out used buffer writes by
> > > > > > the device.
> > > > >
> > > > > You meant read after write is ordered by PCI?
> > > >
> > > > pci read responses do not bypass writes, yes.
> > > >
> > > > > > If you move it to a separate domain (such as the pci bar of the device)
> > > > > > this no longer holds.
> > > > >
> > > > > Would this be implementation specific details or could it be done by PCI?
> > > >
> > > > what do you want done by PCI? Generally if things are in one place
> > > > they are easier to synchronize, if you spread them around you
> > > > need to synchronize them.
> > >
> > > I meant the synchronization looks more like an implementation detail
> > > in the device.  Synchronizing with device internal logic should be
> > > simpler than with PCI/memory.
> > >
> > > For example, did you mean the synchronization between driver write to
> > > register (PCI write) and device read from that (internal logic). If
> > > needed, an implementation needs to serialize those two, then we are
> > > probably fine.
> > >
> > > Thanks
> >
> > I mean synchronization between driver write to device and
> > device write to memory.
> 
> Not sure I get you, I meant put used_event in a register. Driver will
> only write to that and the device will only read from that..

But the ring is in driver memory.


> >
> >
> >
> > What I see working, is something I proposed a long time ago:
> > notify devices about changes to the notification suppression
> > area.
> 
> I think this is something similar to my proposal, but the difference
> is that I propose to carry the notification suppression into the write
> (e.g used event).

Then it becomes racy.

> > This adds more overhead
> > driver notify -> device read -> memory read response
> > but I think it works.
> >
> > What I couldn't decide, is whether it's worth sending a notification
> > when switching from enable to disable with packed ring.
> 
> It needs a feature so for software devices it can choose to not have
> those overheads.
> 
> Thanks

In short, it's not a trivial thing.

> >
> >
> >
> > --
> > MST
> >

