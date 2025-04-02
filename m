Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB79822612
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607228; cv=none; b=K6k3YkeCc3ZZpeSLTL/vzwDIUrVM5SLqtoFJTFf25/NrNjYFoVM3SJWTqQ3ub6n7swZ4BwMPd/tsRKqiCQMUMG2uo7r7ZHPWuCLbgabpzndrrWgTJFU/6loI9DgxbuzRf+aMVCOoYhLSwh6UYNhtgS+WB/1EypOAgS9JkDy+APY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607228; c=relaxed/simple;
	bh=+b92sWod3Pyyl1o4aU9Snn+KxIzAz3pTx5hqfoib3Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=coYTUCnKa7QkirNK8vna/RA3jY92XDQg5upZ3nyjb8EOiAVW/iiCK3RkfPmYriWFHYPMD5dRq1cEd/ix83fBpw1/lcZxyxRR455nMGuUlOGOQEHHzs9vCWXshqZc92FKHsOgPmWkh1xMCM0/YK05C6oPXcIxXxS0m03UhcQWtd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fyI7k3BC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fyI7k3BC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743607225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dCjO/jg476aPhvJWTSZ2R5DfWu0jRUcVuT6vyzuQExs=;
	b=fyI7k3BCcYgqqBygXCGdr5fAk/yLyhsd8AUsWHJQiwcBQKQNPmwWYFHG5XvzQYc1LT7CZH
	iKoXZ9y9yQ4pP08QcTjlzrlmrItOJNKCjEyekdChVSSeYlCJXQz9GDFv2oLx389O6AWMrT
	JBdIyLPj1jYt2EBagowOzLL0ewmbChY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-paARXWkxN6iNQJW23CxMbg-1; Wed, 02 Apr 2025 11:20:24 -0400
X-MC-Unique: paARXWkxN6iNQJW23CxMbg-1
X-Mimecast-MFC-AGG-ID: paARXWkxN6iNQJW23CxMbg_1743607223
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c2da64df9so98610f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 02 Apr 2025 08:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607223; x=1744212023;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCjO/jg476aPhvJWTSZ2R5DfWu0jRUcVuT6vyzuQExs=;
        b=hGayxX9Si1tKSWNTmwPwzt+xaQ5yF8IR6XjEiLU7blVm1hHRWrY0Rw5RxVDo4R72Rk
         g5NnJR6TL0xKnZyedCEc34WBD88Ing1c0ecJtK2gFpDMlJTlOFV6lAjdBLzz3kyqBNIi
         PgP3lXw7zXnXq8RpHxRfZADBvcbJUWUJJGgih3+sF/Gr8dDnUZnV4b734BHRCsWONZ6t
         9j0Q4SZm7tqMJV30w7FqQoTYoLPhO8LZ2MTFWSryH2aH0HgiiziiXG07IEtDdAxGjgMD
         WLSqCTPZDjA916SQdl1QRQifg4bq4uUO0Q8aRxHxyf2bFDpqsP1sfsVSaoKquFHvN6Va
         7mvg==
X-Gm-Message-State: AOJu0Yy5MX0bob5/jct36vpCdzVyNvx1UMWgb8TsJmi+lN7mAfEGdCr5
	n1tn+SjKwCNIlYnYzPabad1CcE8YgJ/18Ss6hbiV082hs38Ix3L2b3HgMrkCfoUtfffDUUzt/N8
	OKdms4OtwpjN0GsKjyogbhMqcpPHd7gS309ayShLuYs/ggkIYiyuZoiX/GqcmGxzT
X-Gm-Gg: ASbGncvy2mcghl/hjEMu7vW7OoDELMxhqYcXnXS5IcgSxl4YrW3l9ZPgr1tkNk3FKTM
	+Zg7mkq2zR9F7F8mdKFNjtNvBNCVLjmB6iftJfVWzVhmLagBgBOvNGFE4jtjgcQthnBXiqIECCe
	GHic5G0PCgkSsDpnQLyOdlpZUAcKzu7tEFbOkjWSRBpRf+phZWsHIJQ3c+uRbRd+WWEHvWeJQeQ
	mxryDLPydeR5UClHwyJJu/UEFix7E876ry+wo30o4LaQcpzGGK6CvZRw7QIMnCWQgbce26oDvOO
	UQLITCnvOQ==
X-Received: by 2002:a5d:64cc:0:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-39c1211de8dmr14470276f8f.51.1743607223244;
        Wed, 02 Apr 2025 08:20:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpHyim0L0aPyGRpaixi2bJsAX4/7cDZgTTVY5gXTNdfdDHVgDUqp1bdyCkhiqSpkJTWrL3WQ==
X-Received: by 2002:a5d:64cc:0:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-39c1211de8dmr14470256f8f.51.1743607222925;
        Wed, 02 Apr 2025 08:20:22 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66a96dsm17010175f8f.44.2025.04.02.08.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:20:22 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:20:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: virtio-comment@lists.linux.dev, hch@infradead.org,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250402111901-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <20250402105137-mutt-send-email-mst@kernel.org>
 <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KmLgYIYfpayE86AuNkt2C-UMYHWr9VCjP8IKTM_O-Ho_1743607223
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Apr 02, 2025 at 04:12:39PM +0100, David Woodhouse wrote:
> On Wed, 2025-04-02 at 10:54 -0400, Michael S. Tsirkin wrote:
> > > +  If a the device transport provides a software IOTLB bounce buffer,
> > > +  addresses within its range are not subject to the requirements of
> > > +  VIRTIO_F_ACCESS_PLATFORM as they are considered to be ``on-device''.
> > 
> > I don't get this part. the system designers currently have a choice
> > whether to have these controlled by VIRTIO_F_ACCESS_PLATFORM or not.
> > with PCI, for example, BAR on the same device is naturally not
> > behind an iommu.
> 
> In the PCI case this *is* a BAR on the same device, and is naturally
> not behind an IOMMU as you say. This is just stating the obvious, for
> clarity.

Then the platform already does this right, and it's better not to
try and override it in the spec.

> For virtio-mmio it also isn't translated by an IOMMU; that was the
> *point* of the `restricted-dma-pool` support.
> 

Clear VIRTIO_F_ACCESS_PLATFORM then?

Generally, it is preferable to keep all features orthogonal if
at all possible.


