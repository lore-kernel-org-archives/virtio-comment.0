Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14B124E004
	for <virtio-comment@lists.linux.dev>; Thu,  3 Apr 2025 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686360; cv=none; b=mvTaCJQWEuTSh1yXcUqMkyUV3lzlsTaza2V90s9BCrJQQIoggo8p8scUnGA3g8QrsVscmbWqFnSXbX9MoJYhk9AWBe87phJ8/zSqwNpkqfm8w5huOvGoCXFq5gbRT13UEkMjh1PVownlXfnRtZzz3K2nACpramYWAFCeOwB0ev4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686360; c=relaxed/simple;
	bh=pBM+7JgyDGu4YR8uQCe5TEb+w7KOevzi9OMdtAtdnHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RcHBTayh0ZDrWAtUnSHhIvSFD6ViucJXPRqNbWXQ2EjdnxPqk8VuBN/BGgz33n7Z/JBrpjaMNmD3VJa9wNTYBImgtlvFPa/O3a5CYUUxRnLiXPOMw9z9q138fE9RG1AZnVvdXVZS4PSVmykQDSnCLZidX7Pe0HYKpwjKrl0wbzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WIUve5ZL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WIUve5ZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743686357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BOrAtcAueaZ6B6FDQZAZjfu8K5muW00T7yncBSAZv20=;
	b=WIUve5ZLU5Zttvi7hX7GiYspnZDOFivGXTAaymJS5hL6WqSvOGg5cu1TfruQV+q+RCy8Ux
	WADfemd4ZQ2HjVP/5giE3mtCtB+vnd2sRlgz5yzQg6/x06sUI34yy/qkOiFXIpahjzUa/J
	DGArSsvj/dCi9wxv2JkHEUdvN2yM0ts=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-HuHk0QkRPrKgzLS5bpPG0Q-1; Thu, 03 Apr 2025 09:19:14 -0400
X-MC-Unique: HuHk0QkRPrKgzLS5bpPG0Q-1
X-Mimecast-MFC-AGG-ID: HuHk0QkRPrKgzLS5bpPG0Q_1743686353
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so5105395e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 03 Apr 2025 06:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743686353; x=1744291153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOrAtcAueaZ6B6FDQZAZjfu8K5muW00T7yncBSAZv20=;
        b=Y+MDUGFpkXNjfNDJRk1IRu0eSYEXp06puPmYHNmZ+HcEsQTRrUzEvsfYtXWOaQzx6w
         NOJEv9KKOhwqotk2QEV0qvJxDQP1osYXBg1RtmqpkBd9ZpvNcMcpYZLrHenwc9srTYx/
         ZoxiRWafx4pLzpN2SLqaZLe17xISFx8GLcAP8u48Q6wRyPKo82uqyJsVaW065WsaE1q4
         /0sWJf3DJeWRE6OOE69R1L/BmIGQacabDPc5HnJA5z/ts579ik+uQhD6H9U+tyE6pODG
         g4KG1braS88D1z/NRTZ/r6JWpIlotvwA2472MZW/SG1sASJ2wwzEB0j7Dm+KUS1KI+qd
         ac8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNvrkB9hBWo7YTR5c5SfEM+OEy8scFvYAdZybBESjLkAIFUE78XeTjO170SxEO38zNgLlfXx/yixmCvHQ49w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTi4NAwdqnd2oBnLlXfJMKjmqXKud50Kpa4Nrm6pcYrjSK79fx
	yppsuYNZ/ehn4ukNMwm+G3ySTci/fv68xUrArf+xYzV8h1QMOnuhEw542oD2PljmqXNLh5UsbZ6
	UvcmLKQXsCpbtMC75xZVyghHxplIjqLgG9amVr2CKrl3ZndBIpvx+XCsTl7Qz2d6r
X-Gm-Gg: ASbGnculI2hPgAc4bYdsWzlpgg5ifWEJsleufygg1ciBNxhrt8AHZ+leqXvslTpCcNC
	9f+UBwBCYgUGDx74Lr03lLHGizFeKxKhEsG7plrnzSzyR1Z3imUEYVzcboW3fKmogc+Qs/JvWan
	1SknVNn2s4o+Ax083bDf65r0HwzfpiZ2lu9LdPXdxHih+9m9mAT/13Ef13ocONvy3a91KogjW6V
	is/ZEBAkGJdgF+fl6jGzkSFoNWkrjg9DvH1/V39JNMvBh2ZvC57hBxfduCLk/KU1lQqdaiMoHS+
	Y+3N0EdYvQ==
X-Received: by 2002:a05:600c:1e23:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43db61cebecmr203918835e9.7.1743686353440;
        Thu, 03 Apr 2025 06:19:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOQLbOwbt2ShKubtPKsLg6pCCONvIrC6z6dAjAq2IICAmhZBxQVjYeR7rxMt8jt3FmipcKTQ==
X-Received: by 2002:a05:600c:1e23:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43db61cebecmr203918435e9.7.1743686353075;
        Thu, 03 Apr 2025 06:19:13 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16f1a73sm21744465e9.24.2025.04.03.06.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:19:12 -0700 (PDT)
Date: Thu, 3 Apr 2025 09:19:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>, virtio-comment@lists.linux.dev,
	hch@infradead.org, Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250403091001-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <1966cbf1-a430-480e-a78d-3d6bbcb4ada4@amd.com>
 <20250403033230-mutt-send-email-mst@kernel.org>
 <59be937432fe73b5781ecb04aad501ae5a11be23.camel@infradead.org>
 <20250403040643-mutt-send-email-mst@kernel.org>
 <0261dfd09a5c548c1a0f56c89c7302e9701b630d.camel@infradead.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <0261dfd09a5c548c1a0f56c89c7302e9701b630d.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UqYFvGD0bIARTA2XVWrN9uYTapPOMM5NLs6NMAJ1uko_1743686353
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 03, 2025 at 09:22:57AM +0100, David Woodhouse wrote:
> On Thu, 2025-04-03 at 04:13 -0400, Michael S. Tsirkin wrote:
> > On Thu, Apr 03, 2025 at 08:54:45AM +0100, David Woodhouse wrote:
> > > On Thu, 2025-04-03 at 03:34 -0400, Michael S. Tsirkin wrote:
> > > > 
> > > > Indeed I personally do not exactly get why implement a virtual system
> > > > without an IOMMU when virtio-iommu is available.
> > > > 
> > > > I have a feeling it's about lack of windows drivers for virtio-iommu
> > > > at this point.
> > > 
> > > And a pKVM (etc.) implementation of virtio-iommu which would allow the
> > > *trusted* part of the hypervisor to know which guest memory should be
> > > shared with the VMM implementing the virtio device models?
> > 
> > Is there a blocker here?
> 
> Only the amount of complexity in what should be a minimal Trusted
> Compute Base. (And ideally subject to formal methods of proving its
> correctness too.)

Shrug. Does not have to be complex. Could be a "simple mode" for
virtio-iommu where it just accepts one buffer. No?

> And frankly, if we were going to accept a virtio-iommu in the TCB why
> not just implement enough virtqueue knowledge to build something where
> the trusted part just snoops on the *actual* e.g. virtio-net device to
> know which buffers the VMM was *invited* to access, and facilitate
> that?

Because it's awful? Buffers are a datapath thing. Stay away from there.

> We looked at doing that. It's awful.

Indeed.

> > > You'd also end up in a situation where you have a virtio-iommu for some
> > > devices, and a real two-stage IOMMU (e.g. SMMU or AMD's vIOMMU) for
> > > other devices. Are guest operating systems going to cope well with
> > > that?
> > 
> > They should. In particular because systems with multiple IOMMUs already
> > exist.
> > 
> > > Do the available discovery mechanisms for all the relevant IOMMUs
> > > even *allow* for that to be expressed?
> > 
> > I think yes. But, it's been a while since I played with this, let me
> > check what works, what does not, and get back to you on this.
> 
> Even if it could work in theory, I'll be astonished if it actually
> works in practice across a wide set of operating systems, and if it
> *ever* works for Windows.

Well it used to work. I won't have time to play with it until sometime
next week, if it's relevant.  If I poke at my windows system, I see 

> Compared with the simple option of presenting a device which
> conceptually doesn't even *do* DMA, which is confined to its own
> modular device driver... 

I'm not (yet) nacking this hack, though I already heartily dislike the
fact that it is mostly a PV-only thing since it can not be offloaded to
a real device efficiently *and* requires copies to move data
between devices. But, let's see if more issues surface.


-- 
MST

