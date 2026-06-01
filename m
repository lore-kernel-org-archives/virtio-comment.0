Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE50138B131
	for <virtio-comment@lists.linux.dev>; Mon,  1 Jun 2026 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323762; cv=none; b=eHPpAnrZQdZaqqf9CDGeh/zZd9aM8nBopC3DiFG7hn8a4rXUnlZv0BThA0EA/nCjkPcRGahxRxchVJZGIc0ES+JdtONck7jqYEERxvJ5UvQpNNQHqkd9IfJOksX8jhHJvWZZT42FZrfyKzupR+UM6rhGfcCusqp/2Pgd8410tus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323762; c=relaxed/simple;
	bh=qNJEZ4gANrP5v/L73TcqvHBcnnIydXmXJhc68+2WmVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=W7NGgOd6bCDKWHz9JPfeVuiKwG+NQ9kBXzi2cXnCvg08xFHqHRNJMsVGhoVgCgOX9cBvO0uiKYz8duZEniuH5ktprOhyGyweSBlLh/bngxm4fWaDK4tFODMOsZ6yXippaeGNuUUSRpc1iw6pnWtDd+dWyNS/T/R6316DvoNytkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lr4b7ZSl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lr4b7ZSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780323759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nc1FGWRi33B4lX3wfu2SMmxgYqYKjd8FEy58P5ng868=;
	b=Lr4b7ZSlt2HTQVx+sS1peWlH3GEcddyQEETHsu05oVpvvYQ6IAHmeaWOj3f5rfw9Jvk93p
	Vs+64deC1BAxw4v+4BTBGw4dM+nb3ghbCkprOa/OIfmIf8d2ZYWo4lfTSRJYNvJ7yiII48
	p6DFb8Ewu4+c2wOvb4JypQ17VSRFuaE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-meeF8KvBMYqWZIo-VW0QPA-1; Mon, 01 Jun 2026 10:22:38 -0400
X-MC-Unique: meeF8KvBMYqWZIo-VW0QPA-1
X-Mimecast-MFC-AGG-ID: meeF8KvBMYqWZIo-VW0QPA_1780323757
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4909e29e78fso24838225e9.3
        for <virtio-comment@lists.linux.dev>; Mon, 01 Jun 2026 07:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780323757; x=1780928557;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nc1FGWRi33B4lX3wfu2SMmxgYqYKjd8FEy58P5ng868=;
        b=C2Vu9kJ8mENkUfcUQLO2v89XKmdZpix2K0euJpnIzLAm1G91QQDedKFy7TlwCSNDj2
         YRWMCs0ep5dcLTH0+eAWGsZQe8gc80X3nScZ7tIS2WapN3RKwOuHFiTeiqqd8FN+iYv5
         dkNEyjPrHRIDIrSsFknj9cA7XFgkeh0J6T1Gy6zqV0NXZqX+1szvIDKrxq8ugI1LV77c
         ATLFnwwX+wPFMWY2nFnZQa06Pzb8TFeCdhZJl/dpqwsq9t8tvI8CujKcF7KN0YXZGVPm
         pX6az/XTlT89j2jT52YP0zHj7xsSYDt4T1aftTM6PRUgDI4UiJV3LaeVf85KG/GXhh7J
         TDUA==
X-Forwarded-Encrypted: i=1; AFNElJ98KBxLPgfRWbZx6amMUooqVt3XHwhWbOMaZekZ93lKAGw6AF+lLVDywzAbQ9tGRRtuBM+GO9mZ87jr9IkK3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSCFseEgt7VrlwIXsuEoHxlzRa0IryPUqgQGEl8rsImXxuWVUO
	/WlnhdLgSYlyHdllTsld/5ZhR1A9zVQPCpzxSZO2CxMGtcISME7ES4mzR9eUclJFuxQ7RnKUUEJ
	MRNghWD1PUZgb/cNoX/HbLm2Mg8HfjrZtcZNWIB26PzVzTt+rd5a0TcdX68wE0TG1yghG
X-Gm-Gg: Acq92OERyGcHF4vZANzt9QrBOMGIE1iSHNazN6crSIIgkU7/IAz6nJ9JkuzVe/JP//J
	CrAXtvIi2g8fWKdPr3ds5CitqmXZrDFgZPbBM6efnZzeMtEBQRENMuj+SA6N4ym9T1Nh/ZC4U3Q
	F/zLiawJfDGqQCU0E9onUW8Kq31wda9YrMjcrv9kq5wXaRQaqQlbWH45XLTjPm4l+vHrjE+/DtF
	j6U0FIzfPX0D0lVG9oknAeDdC0R0oTM0aSyXcHe40yiWsdMjJb7al6pXTnqmMykN59cVPnXrDrD
	iyw8TcodXu3Y1VmvfvRbVM989BU21ciXfcsHzbOJNJ+NKKYAGmpvEpUZPRHQl9kuwu+qedfFBXP
	l/hfWjFtJs7t57ogRElH0LAnCb/TZqNhiMLARHetHOs2mttZCmmkBFg==
X-Received: by 2002:a05:600c:4e08:b0:490:6237:5200 with SMTP id 5b1f17b1804b1-490a293624dmr199682515e9.10.1780323757187;
        Mon, 01 Jun 2026 07:22:37 -0700 (PDT)
X-Received: by 2002:a05:600c:4e08:b0:490:6237:5200 with SMTP id 5b1f17b1804b1-490a293624dmr199681955e9.10.1780323756675;
        Mon, 01 Jun 2026 07:22:36 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0d5dc2sm109707855e9.2.2026.06.01.07.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:22:36 -0700 (PDT)
Date: Mon, 1 Jun 2026 10:22:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Albert Esteve <aesteve@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev,
	dev@lists.cloudhypervisor.org, rust-vmm@lists.opendev.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Alyssa Ross <hi@alyssa.is>, Mark Burton <MBURTON@qti.qualcomm.com>,
	Matti Moell <matti@qti.qualcomm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Dorinda Bassey <dbassey@redhat.com>, Sergio Lopez <slp@redhat.com>,
	Vishwanath Seshagiri <vishs@meta.com>,
	Rob Bradford <rbradford@meta.com>,
	Zhengyu Zhao <zhaozhengyu@bytedance.com>,
	"Jorge E. Moreira" <jemoreira@google.com>
Subject: Re: Where should the vhost-user specification live?
Message-ID: <20260601102216-mutt-send-email-mst@kernel.org>
References: <874ijtz038.fsf@draig.linaro.org>
 <CADSE00+RdBUhFVBDSXtVd1J5SaccqWy+RBxqnxuLKUYcitFMPw@mail.gmail.com>
 <20260601083628-mutt-send-email-mst@kernel.org>
 <CADSE00+kRnEC08LLVu6H065u2KaxBm-KnSN_8y6+964-FLbJMA@mail.gmail.com>
 <20260601090953-mutt-send-email-mst@kernel.org>
 <CAJSP0QV4W=5MJsSGggACv-tqxDtiieKc0YzEn8t-R=RD94KJaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAJSP0QV4W=5MJsSGggACv-tqxDtiieKc0YzEn8t-R=RD94KJaQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Of2GUm9RW8a7224D-o3TVUTlB0Omq71D5EdzH1Ta_lo_1780323757
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jun 01, 2026 at 09:51:40AM -0400, Stefan Hajnoczi wrote:
> On Mon, Jun 1, 2026 at 9:12 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jun 01, 2026 at 03:05:50PM +0200, Albert Esteve wrote:
> > > On Mon, Jun 1, 2026 at 2:39 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Mon, Jun 01, 2026 at 02:32:11PM +0200, Albert Esteve wrote:
> > > > >  But also because, in my opinion, separating
> > > > > the specification would improve development agility by decoupling
> > > > > specification development from QEMU's review and release cycles.
> > > >
> > > > Generally for QEMU this will be less agility, unless I misunderstand
> > > > what is proposed)
> > > >
> > > > Because presumably there will need to be spec releases then?
> > > >
> > > > So
> > > >         new feature -> spec tree -> spec release -> qemu implementation -> qemu release
> > > >
> > > > is surely longer that what we have now.
> > >
> > > I see your point.
> > >
> > > However, we do not really need to introduce a heavy release management
> > > layer. We could just operate it as a living document, where the main
> > > branch is the authoritative source of truth.
> > >
> > > For the workflow, development doesn't have to be strictly sequential
> > > either. A contributor can propose the spec update while working on the
> > > implementation, much like we do for VirtIO updates. Actually, this way
> > > one update/change supports the other.
> > >
> > > I guess my point is that a dedicated repository could lower the
> > > barrier for new changes AND keep QEMU's own development speed mostly
> > > unaffected.
> > >
> > > BR,
> > > Albert
> >
> > Something something submodule? Possibly. If you want to make progress
> > on this, pls think of the process, try it out.
> 
> If I understand correctly, the motivation for moving the spec
> somewhere else is to replace the email patch review process with a git
> forge review process?

wait who said that?

-- 
MST

