Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7284124061F
	for <virtio-comment@lists.linux.dev>; Thu,  3 Apr 2025 07:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666221; cv=none; b=nvTgT0+v6yjC6Vabsf1A8ARNwW819OleN4zJokPPDngbjAsF7+nfXB7h4FjT57fB50uNiuOYRkZoWJBDRMNKdXx/Sm/iiMJ53/xWmQtppgSuH8QAceyx+2GzDtu+8p3mVDDcoRPGXyD+Hh+VurxzE7ONpHqgybOZmRgCIty+fyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666221; c=relaxed/simple;
	bh=vib5eqL8Yk6nv7cYTs50OyikP7l3XdHYId6taSeO3OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=U5/hQLsAywfeLFnHzQiVw0ft1aIEUPQIrVHg4vJDzQ3J2F4RjZJYkvY8APmN35U1kjgNt5Z5DenyGC92Y3PkLwvadHTe8iB4lB0P+Oz9xhAB6ilTwt4KpgkPBMKwJ1xcnGLZod/kHPOfr86BrQTTqe5JWFzkxSMFP81J8Zch3V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AJwplS2V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AJwplS2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743666218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NuIGPILwX0KGwdKCW254FLXrK5Uw6+p9BSYPzhYokBA=;
	b=AJwplS2VcgKpYT0zc34MVr8tWO9edyornnfd6a2s7qo6VF45XLjCxgEURYsd8IliiaYfJ5
	mtWKYMl9iVCTZZirnLCb+7jiiyL5IfAAI2CM7laUNB2+Q+PlewI388ef6CN0CzRAn6BZvb
	ty5Y5796fYAJJdJehz9W9xKUQxchvaI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-OWH8GP8BMmyF9ix0jpgZcg-1; Thu, 03 Apr 2025 03:43:36 -0400
X-MC-Unique: OWH8GP8BMmyF9ix0jpgZcg-1
X-Mimecast-MFC-AGG-ID: OWH8GP8BMmyF9ix0jpgZcg_1743666216
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39abdadb0f0so346092f8f.0
        for <virtio-comment@lists.linux.dev>; Thu, 03 Apr 2025 00:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743666216; x=1744271016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuIGPILwX0KGwdKCW254FLXrK5Uw6+p9BSYPzhYokBA=;
        b=b3C/kTnNVEeQ3WjJUAat3ftnxv3deHVh/82gsKX/5+6Kky5O46sBlxq3zvx7hA3tGk
         L3AmlFLjTKyJkYypcdCam4cHyJONyH4RuXH+IuJX6hofig4Qv/cFYdMw3h4d46M7qgkj
         29Jr/wLGmZAmi8L94zaG7wvZqwrGFpIU6e4shKxDvDP193cibl9iDSyvTlPwoe1jHOPU
         ZZnOBmNLrvGUYpLlbnl+DoR3h6BRwiOjJV3ukH60agk2HnAsU9OSLcwoVp/sHhUkTikR
         F9sG01yskFB5YY3pUou645xOtDYmAQWumCILOxpdLQJ89oINvCS4ExxLbwH5LyWb9PWp
         fUxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0uEzGCu4Pn8BOCN35+i6ipqTcx7wnj2t//BbpkZTqeHnyWciwLtLur6amn8zqv34kgGZHitt950yBq3G2yw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLWphSdBT4yOikcsBFYI1S1SP8vzeQ46IPTYkekOoI1ylye9aT
	6ifeaROTb9WhgCA5PkBvXtXRBfyrTzvsjAXoS+g9atjBiz9aKn8gwBLOohQu6gPvKPxdn7SU1sg
	/mNSvUJkQEWuRYt9M/I04W9wVCysvVlIWjTu78aCVN0OVsBC8kctrr+unsr3K0lqz
X-Gm-Gg: ASbGnct54qMEq9fdD4f5PXpZDtKxR49iIjZLaZlkJowuJQuWFko6yI90ufkfC8LGL7/
	oXlJs7Fuu/A1VgeFGmYGjjmcgp6HQ5J6D0/tlP0XBXKqXqhSoTvAUqzVBGdRgE5NJ2E/BAfn3uN
	xK0CfkiE2DiJHcwL5NDXBWpebgYjFW2hDMLtw3fNIUXFRX+pXPXl6fyM1FDqk+SjUXcHkzWyQoo
	MzQz6fSCJDsSB0Gf3UFmiWf/kfWeqDGglpGoAw1ddVx8aVXFDtsKRA7/mtCbwH8LOibBvOxQ+fb
	EhAhGCV68g==
X-Received: by 2002:a5d:6d8a:0:b0:38f:3224:65ff with SMTP id ffacd0b85a97d-39c2f8c6303mr1147207f8f.5.1743666215772;
        Thu, 03 Apr 2025 00:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKHA+wdnxQEWeLGPaea4xtTaMDclvnSmU451MGtx5swswXpr4ijH+EFOoCDWUx1yGDtMAEng==
X-Received: by 2002:a5d:6d8a:0:b0:38f:3224:65ff with SMTP id ffacd0b85a97d-39c2f8c6303mr1147183f8f.5.1743666215393;
        Thu, 03 Apr 2025 00:43:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b6321sm1001079f8f.44.2025.04.03.00.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:43:34 -0700 (PDT)
Date: Thu, 3 Apr 2025 03:43:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250403034143-mutt-send-email-mst@kernel.org>
References: <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>
 <20250402111901-mutt-send-email-mst@kernel.org>
 <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org>
 <20250402114757-mutt-send-email-mst@kernel.org>
 <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>
 <20250402124131-mutt-send-email-mst@kernel.org>
 <eaef09ab218900a53347987a62fee1787283d9ed.camel@infradead.org>
 <Z-44wXdyia4RC6Cr@infradead.org>
 <06465bcf4422d088df2a0ce9cdb09767dac83118.camel@infradead.org>
 <Z-47O3vkyIf0mzdw@infradead.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Z-47O3vkyIf0mzdw@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1o1AVtm-Q6oMEYdXHIyALxXLm8vF6tPNvkTS4RfRWsU_1743666216
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 03, 2025 at 12:39:39AM -0700, Christoph Hellwig wrote:
> On Thu, Apr 03, 2025 at 08:37:20AM +0100, David Woodhouse wrote:
> > Hm. I was just trying to point out what seemed obvious, that when a PCI
> > device does 'DMA' to an address region which is actually within one of
> > its *own* BARs,
> 
> PCIe devices can't do DMA to their own BARs by definition, see the route
> to self rule.
> 
> Pretending that they do it by parsing the addresses is bound to fail
> because the addresses seen by the driver and the device can be
> different.
> 
> NVMe got this wrong not just once but twice and is still suffering from
> this misunderstanding.  If you want to enhance a protocol to support
> addressing a local indirection buffer do not treat it as fake DMA
> but rather use explicit addressing for it, or you will be in a world of
> trouble.

Hm. This is what this proposal does, indeed. Can be changed though -
since all accesses are now within the SWIOTLB, they can be treated
as offsets instead.

-- 
MST

