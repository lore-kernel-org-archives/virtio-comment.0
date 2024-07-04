Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA82B4431
	for <virtio-comment@lists.linux.dev>; Thu,  4 Jul 2024 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720081869; cv=none; b=AY7dAGxrEhqu5CasrXS11BDB/wtIyUf1BRy6Iaz+KqGpF+0b4wbZVysXryuqeM1n+oZkqkCvxsq/Q6z/nEMFEka+0BN3vGkwTZbLPDCsPovfQg+M3reSg1DMqaJ7wT8JP5A0ZRv5Ond9i7Wf4wN8YYExhcZ9TNWRRxxGngVHboE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720081869; c=relaxed/simple;
	bh=/vHIJcstSO3lDo2UNi1Bbmm3PGbRNvK5qr3LkOQ/6N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FA5vDccHAlOc6+nsIYc9rSXBTIiundjSTj7u3I9ENo3B6noitnsIT44LxqfJjgOLcMndZUQK+1v1Dujd/H//7XMXQj7/OL09b2cxWDrQtP8B3aKrqz0u8E4O6wzGcVQcxhzRjknvmfUyo9wqZD+ECMT42OUR8nhN/czu8YnnHjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WgIjhaqx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WgIjhaqx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720081866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJsAGr66C0GtgJkJEjjKuOMo258MORCYOfAeHYDiiiQ=;
	b=WgIjhaqxU0rqmT+AuzPHUdr/+ih90NMRz8BFY9i5kQQhEIitfrLDnynm8fp3G4ItLR7sHK
	rdarl8qFMFoxvMnY37BiP8suyzp1Tluy0x5yHz+78T/g27FPUWrNWDilOfAMCFxWimM1lY
	54XcH0B8bUNOf10TImdHvAWD0zWiDds=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-ujNQKpqcM1-XuHcFVzbrIA-1; Thu, 04 Jul 2024 04:31:03 -0400
X-MC-Unique: ujNQKpqcM1-XuHcFVzbrIA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42566e8a995so2923345e9.0
        for <virtio-comment@lists.linux.dev>; Thu, 04 Jul 2024 01:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720081862; x=1720686662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJsAGr66C0GtgJkJEjjKuOMo258MORCYOfAeHYDiiiQ=;
        b=qmW+PS4jUTSy3Dhef0NjVDrIYuEYpqFnLTUiQKxGWC3YZSZS4nzEsahXWV8/o9tN72
         JfDvt6PKMdlWfPzvyxDbZX+mpWqs3w8EHdGxixVT6QSX7LlWl8BPPmOMmpsv6rrPR2Zf
         well7pu9JOKjsBpZQ0WqM5phJK1EsuDcuPIRSDy3d2ShmwHcJp3lcSOTW5nSXP0mgsHw
         H3xfUldPhNuxE8IxLODvfTyn4epMtG6xf06cxL7HDik/3x7kzKsQLhLhf0zn8ycGoJY0
         meOEnxKOSvSZbkjqc6A14Xo+NOlKvVRxqaRJw0EQtBrihm5BVyJGcrH42h3M3prPRj6N
         WViQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJLQIUhdk504EDtt98W32kSyc6PjWY1HyPzHAaCx1cUki7XDiNPr9PFv5brk1OAj5qx5/1LqbhFrxPkgubdm640HJjJLsb3KgdyZJhCc4=
X-Gm-Message-State: AOJu0Yw2ieHTj9GnpDYNdp8J7y5qBOOqfvmbmDi6k4G3Bn9YrBrx91E7
	7QXicijiSenS/HhXarsPpl5TmZJatQTyss+kWVLltK6pYmWi7getxIODpryAhzxYIx2ZyD+AAbL
	YKUFBB9ndD6e9WhSewQwEmCeamvUnlOTYTdQjtPPLNcTBhtmLtLVHWqiS7G3IcZ9U
X-Received: by 2002:a05:600c:2d8b:b0:425:68f0:621b with SMTP id 5b1f17b1804b1-4264a468a9cmr7082305e9.27.1720081862060;
        Thu, 04 Jul 2024 01:31:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb51PxG/jhd8QZQum8J2RPp3WtH9wkXXzPYo/CYgkwArrUYu5OMS/gApsNlOuF15qs5ENU1Q==
X-Received: by 2002:a05:600c:2d8b:b0:425:68f0:621b with SMTP id 5b1f17b1804b1-4264a468a9cmr7082055e9.27.1720081861489;
        Thu, 04 Jul 2024 01:31:01 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f7:82e2:c2d2:c800:4b76:dc98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a21cc59sm14352265e9.25.2024.07.04.01.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 01:31:00 -0700 (PDT)
Date: Thu, 4 Jul 2024 04:30:57 -0400
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
Message-ID: <20240704042308-mutt-send-email-mst@kernel.org>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <CACGkMEvrHNnjdgC6Ls=YWRPFxpirCFkbf8_VnNsh-VU4NoK3tw@mail.gmail.com>
 <SI2PR06MB53850C468CF18A489A6E1ED4FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <CACGkMEtzcaUAauzpUdwjS6MEzF-suGLRv5+7cX4PeoAaqEP9hg@mail.gmail.com>
 <SI2PR06MB5385A261415EB70720DA5749FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <CACGkMEs46tCCqCcoeJ0nqOn6SRk0qqS72GSwgyt2m5p4BvNnrQ@mail.gmail.com>
 <20240703042922-mutt-send-email-mst@kernel.org>
 <CACGkMEs=ZJdz9=7qNxPMwEk+h3HGTSU3r-R-VfAERXavn_bW_A@mail.gmail.com>
 <20240703050143-mutt-send-email-mst@kernel.org>
 <CACGkMEtgAD4mPLpf4fLAsVzzUGvbx1+XTxyGLtMSOJzHp-JtGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtgAD4mPLpf4fLAsVzzUGvbx1+XTxyGLtMSOJzHp-JtGA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 04, 2024 at 01:37:44PM +0800, Jason Wang wrote:
> On Wed, Jul 3, 2024 at 5:09 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Jul 03, 2024 at 04:47:41PM +0800, Jason Wang wrote:
> > > On Wed, Jul 3, 2024 at 4:36 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Wed, Jul 03, 2024 at 03:59:11PM +0800, Jason Wang wrote:
> > > > > On Wed, Jul 3, 2024 at 3:37 PM Lege Wang <lege.wang@jaguarmicro.com> wrote:
> > > > > >
> > > > > > hi,
> > > > > >
> > > > > > > > >
> > > > > > > > > 1) With the event index, as long as the used index doesn't pass used
> > > > > > > > > events you don't need to fetch even index every time
> > > > > > > > Yeah, I agree VIRTIO_F_EVENT_IDX could help here, but I think it's a relatively
> > > > > > > > crude mechanism, I have two questions below:
> > > > > > > >   1. Used event notification suppression structure is still located in
> > > > > > > >   host memory(in dpu case), I'm not sure whether used_event would
> > > > > > > >   be allowed to update in the running of one virtio device,
> > > > > > >
> > > > > > > What did you mean by "update" here?
> > > > > > I mean "modify".
> > > > > >
> > > > > > >
> > > > > > > >   If it's allowed,
> > > > > > > >   seems devices still need to fetch newest used_event info timely.
> > > > > > >
> > > > > > > It depends on how you define "timely", I mean unless the used event is
> > > > > > > not crossed, you don't need to fetch it from the main memory?
> > > > > > Yes, I got your point here.
> > > > > > >
> > > > > > > But basically, I meant putting used_event in a cap/register other than
> > > > > > > inventing something completely new.
> > > > > > Sorry, I don't get your point here. What does " cap/register " mean, used_event
> > > > > > Is located in main memory, right?
> > > > >
> > > > > I meant something like this.
> > > > >
> > > > > Introduce a capability to allow the driver to duplicate used_event in
> > > > > the register. And say when the feature is negotiated, the driver MUST
> > > > > update both used_event in the memory and the register.
> > > > >
> > > > > Not saying it can work, but we need to know why it can't work like this.
> > > >
> > > > Well I feel if you are proposing a mechanism it's up to you to
> > > > explain how it works without races.
> > >
> > > I agree, that's why I'm saying "Not saying it can work". But what I
> > > meant is really to find a way to reuse the event index instead of
> > > introducing something completely new.
> > >
> > > > The current notification suppression works because the read
> > > > of the notification by the device flushes out used buffer writes by
> > > > the device.
> > >
> > > You meant read after write is ordered by PCI?
> >
> > pci read responses do not bypass writes, yes.
> >
> > > > If you move it to a separate domain (such as the pci bar of the device)
> > > > this no longer holds.
> > >
> > > Would this be implementation specific details or could it be done by PCI?
> >
> > what do you want done by PCI? Generally if things are in one place
> > they are easier to synchronize, if you spread them around you
> > need to synchronize them.
> 
> I meant the synchronization looks more like an implementation detail
> in the device.  Synchronizing with device internal logic should be
> simpler than with PCI/memory.
> 
> For example, did you mean the synchronization between driver write to
> register (PCI write) and device read from that (internal logic). If
> needed, an implementation needs to serialize those two, then we are
> probably fine.
> 
> Thanks

I mean synchronization between driver write to device and
device write to memory.



What I see working, is something I proposed a long time ago:
notify devices about changes to the notification suppression
area. This adds more overhead
driver notify -> device read -> memory read response
but I think it works.

What I couldn't decide, is whether it's worth sending a notification
when switching from enable to disable with packed ring.



-- 
MST

