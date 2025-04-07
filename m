Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D956B23875A
	for <virtio-comment@lists.linux.dev>; Mon,  7 Apr 2025 12:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744028089; cv=none; b=Db2qtcir8USSUh2LuSjMJsLS3m3H1kH04agWiGFjnocJRXtAfrEVYyyxaXCnbooJ3PUDqEVZa9L/s82TILiChzkYnDfAB5wz25g8QqRCFxs7+h7hKc26DVQ79KaW7Y9skH4ey3DTfH7JfDn1HeV83jYyHT0CZiSO3Lc6Dj4gf/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744028089; c=relaxed/simple;
	bh=SJloMABJ9TFapxZzUuoSPn8M6mfm+kJt9tZS7KDLG1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=a6E/qkVSWmMq8ziMAhkxrqCwWi7pURaSdn8VHjqcr9lITtwhimf+91yD7FHyavYvQDApMtrnc/sSh/MZeN1cOg2/R16G0VXsLALBGGs8eZcw8jOyKj+QqknjDLv+Qb9yEZpm1thD0PAgn70OWVJs1j1gHM+FHJZ7nJG8nESdNCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c6D5FcEJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c6D5FcEJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744028086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hQ0sePM8qDTqbXQLkavIPlwoEXkE0hK7tfvWemHOezo=;
	b=c6D5FcEJNMC3NAEZ6R5jMZ2MZGZVBZTCVePnAr2Bi+uDdJLA2Q8SRDpbcqJ2PEg7403e3I
	WPspHaZkGYfQQEm5dI1NzOeelKftfkd0qtJpv9jG/OLgYR32pfdBq6GfEtBsmGmIrmBo4C
	Bb0G5dt+37qN4r+sIb3aMaaNqnXjdAg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-yTs6uLOjOcKqXIGGvlVf2Q-1; Mon, 07 Apr 2025 08:14:45 -0400
X-MC-Unique: yTs6uLOjOcKqXIGGvlVf2Q-1
X-Mimecast-MFC-AGG-ID: yTs6uLOjOcKqXIGGvlVf2Q_1744028084
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3913aaf1e32so2594295f8f.0
        for <virtio-comment@lists.linux.dev>; Mon, 07 Apr 2025 05:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744028084; x=1744632884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ0sePM8qDTqbXQLkavIPlwoEXkE0hK7tfvWemHOezo=;
        b=H1iPbc0bxeAglUJg4GssrSOAWGJoWths5I1oOR0xLuDHzlMv52atzAg8rbsgJTborK
         FrfR8USY4MK6W3s8l6Goh0gSjupyYJ4w98NRzYEz8ZHg9+Qn28X4gEjR/bozjfd9PdMC
         kginCkJ1CnQfVd1LcJJtC4Bwbes+1BqASwaGH5Zsbm7qU8Dm8H4/2Pe2DmBAp9W3UL2h
         C+WvHRPxs7G+1C3b8usYmXGqQULDz0+0Fu/fPTlkpDbyfZxPg1omxnBhFgfx/kxgoO/h
         BkEi1E9pwL5906Gv/04OyS+L/qN41GN64H/a7DseVn99eOmRG9yogkt1RpLUJ+g7DZzh
         k1vA==
X-Forwarded-Encrypted: i=1; AJvYcCVs8MzPULV/u8fC22cCnOLFbQJ5CPH/01Wj/wMyfq5fyBIa26Y6Oj/8kz8ZduxWtSJwcTOIPiHGG43mb4Uj5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwH6e3Rn2waoueU7MZVy/fwT2RnbSm6WoAviRycgsNxWcOh4qNI
	lEWW9BFLTT1dEbRFYGD0t5sM79heHpxe0iNJBiGJcMvAh0khK3lAeZCZJMAjLFa7faB53hhfRhA
	Mrh3W9Bi4ZkuqC/BN7ScXt+q6q1AwyxOmOIxNqFfzbN2qDb4FhnSjUbU4+3PujsuR
X-Gm-Gg: ASbGncsMfTxMEs4MnngiTEkP4Y80Jjpm+PEgJjYJzJlqlz6dGnWr1ntwYU4TW6y2evh
	P94NB+F5XZYUj+L2rQtPIMfTOOQKN7M1ITdjZQjeMn8AQUOM3VSGJ+mFb7rHlnBgUbm74YcHD78
	KKp5pvYk202B+8TsQ49c3Q7dRBrWPPS2dI2LjpDokA3AIriatVneJWrE29Fhl9TeyZ+/WoiraBT
	o8ybqSadZTyAkbszrXpfbVZVAQpJ7e3WfTUXxwJaA8i/E0GJkc3pkKvHxlZEdCwXaTIpoBcyOgJ
	Bh3vf5MC9g==
X-Received: by 2002:a05:6000:2407:b0:39c:1efb:ee8a with SMTP id ffacd0b85a97d-39d0de67a97mr9877468f8f.38.1744028084306;
        Mon, 07 Apr 2025 05:14:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSEq8KBA9rhmZRWPej572rfLMWFkXKUPOcxbVa6ScLXY4TTA4hiqQZurNAgf4uQ4V5gUn8iQ==
X-Received: by 2002:a05:6000:2407:b0:39c:1efb:ee8a with SMTP id ffacd0b85a97d-39d0de67a97mr9877441f8f.38.1744028083951;
        Mon, 07 Apr 2025 05:14:43 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226a07sm11678907f8f.84.2025.04.07.05.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:14:43 -0700 (PDT)
Date: Mon, 7 Apr 2025 08:14:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, virtio-comment@lists.linux.dev,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250407081110-mutt-send-email-mst@kernel.org>
References: <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
 <20250404040838-mutt-send-email-mst@kernel.org>
 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
 <20250404043016-mutt-send-email-mst@kernel.org>
 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
 <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
 <20250404062409-mutt-send-email-mst@kernel.org>
 <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cSescYwVB24EyU8QktPXYSlROCO8TTCeyaXamdPyGRA_1744028084
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 12:15:52PM +0100, David Woodhouse wrote:
> > What I don't get, is what does the *device* want, exactly?
> 
> The device wants to know that a driver won't try to use it without
> understanding the restriction. Because otherwise the driver will just
> give it system addresses for DMA and be sad, without any coherent
> error/failure report about why.
> 
> (You could ask the same question about what the *device* wants with
> VIRTIO_F_ACCESS_PLATFORM, and the answer is much the same).
> 
> Or maybe not the *device* per se, but the *system integrator* wants to
> know that only operating systems which understand the restriction
> described above, will attempt to drive the device in question.
> 
> We could achieve that by presenting the device with a completely new
> PCI device/vendor ID so that old drivers don't match, or in the DT
> model you could make a new "compatible" string for it. I chose to use a
> VIRTIO_F_ bit for it instead, which seemed natural and allows the
> device model (under the influence of the system integrator) to *choose*
> whether a failure to negotiate such bit is fatal or not.

Let's focus on the mmio part, for simplicity.
So IIUC there's a devicetree attribute restricted dma, that
guests currently simply ignore.
You want to fix it in the guest, but you also want to find a clean way
to detect that it's fixed. Right?

And if so, my question is, why this specific bug especially?
There likely are a ton of bugs, some more catastrophic than just
crashing the guest, like data corruption.
Is it because we were supposed to add it to the virtio spec but
did not?

-- 
MST

