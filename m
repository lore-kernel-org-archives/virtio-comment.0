Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A38518B463
	for <virtio-comment@lists.linux.dev>; Fri,  4 Apr 2025 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755568; cv=none; b=PGHrCia2hSjvjlTYa9skuDh3PUcAN2SNyV5ZUXpuwG0sBq8hso8DHEWzV2rWOr6RUzKARzrByMIv0OkJh9eCmiQGhKM2osn/k2/l5Pdit0l6suR0dg+C8VoqfovnuFc20OCyEm++bIBqqaTkdUBrfuvOePkt3qqVw1UsQPDE2jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755568; c=relaxed/simple;
	bh=8mgiLfeOJH6U7WSgzeIIiX8jgYIFd8sgDdNUQ1WgpFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jeduzg9CTC9L+umVdRhnVPuTuWGgsSptkMPFC2HaEU75GKa01ycVQINkXTPWC/6APv8dwNM6I4fbgBYC6IV3HAKCL++CQk6QgBy07gklV8ubrEa/QwZbAFuzxjPC+6W0L1/ts9qh0C4+jY4J/NzpgE/1ZWQN3xM1QduRxTenrwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EoJdBzYi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EoJdBzYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743755565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1g2+hk0RrD47BYHCyQjMK8prZh3qSBoec7bPqHaAsFs=;
	b=EoJdBzYiYp9MYGehCfR9QjNcbro0K5MXskljZu4rMTZwlfLfyZ8MGu2RH1ysE/iVRE4fnN
	54b0G2d4jVoPhcBvOkRtt+lXIEsC4CcniLSQhZZHFbncGvUf61kTSRPQ+k0tiVbz/FtbwS
	rgfUnWOSc9ecFQJVBDoZKxRWY3HQZBE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-oZF_cjsNMBihkzCJehCplQ-1; Fri, 04 Apr 2025 04:32:44 -0400
X-MC-Unique: oZF_cjsNMBihkzCJehCplQ-1
X-Mimecast-MFC-AGG-ID: oZF_cjsNMBihkzCJehCplQ_1743755563
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so10101395e9.3
        for <virtio-comment@lists.linux.dev>; Fri, 04 Apr 2025 01:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743755563; x=1744360363;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1g2+hk0RrD47BYHCyQjMK8prZh3qSBoec7bPqHaAsFs=;
        b=jxyJ58zZO2CJAc7aqdkNCGGJi4mL6w/bIbut6PvGMYFe4Qg6/JSNndH28o9lOEHlN1
         Q8Z8LvDXyAbogfy6xY9zghXGWkJi9vNtRMp2cMWwbpCRhyU8KN2kUO4KdksUbGJ1pdZJ
         FnYNfCYB/L25SdSaEajFGnhdwwGTIYaHOCEqufG7kQF3ICKRbuwKb4hlFDciiq5IUVg2
         8f41RSbdrIlnG9a+k8ihM4g+/ugXQaD5Zfsk8/wu21USh52jV9vpdC1OstIsXXCQv/qg
         wA+ERN+9bZSsi+PK3eRs/BM3r4JjuCOz6/MnLZgOTDa//6Z+vDTqxZjj1bMUGBieTESf
         VC+A==
X-Forwarded-Encrypted: i=1; AJvYcCWElSY+7v4tebCjXXCxFFxroOvP8lmQEHl66DaS5R3g3gfATLjEMjMjoQjVdO3QF/gdmSz6A7ClXnD1QrcWcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxW3MXyeqGAhs9A2MrP/NXL1SEWSLMUVQEhDtU09LQXi5wsycVr
	h2G9wuNdGPbYTIIVdr5toN/D1iVhnG5czMOfQtH8NLmt4iy0svUH51o1v2QzLaobk72lEMQrDty
	Sk3bkFS//qDooNfB9UHZcBM62BR1vJPS/o0y3tFTPlgEi5ceBC93iAWH5nHug80J7
X-Gm-Gg: ASbGncsFvd/l2/MbfP8e2SZ0RI6foGkfXZecGwNvklPDkDrFttFJf/AeePHhTP9d5LN
	CoaBRhEmYiPsPtSlQhK15+NhuMQzgwRUNN+6oyfn14G2tzPt8WuevrjkDOy+Mwzkg8Ru0flG+/O
	oamS2z/K2Y7MCzmWbsrUveMXyuDlxegx61kSXf0DlqUg0oOPZQfdGNZj8y4k3Wi0rMsHC+WS8Vb
	YJxARUauQj9mqvc7jS0TDNPXZ15PDEXBc2NpoDVm6341kLKOfNFTMc4W2QgzTMEX7Bdh6q5BVBZ
	ubXXKp3sRg==
X-Received: by 2002:a05:600c:4713:b0:43c:e2dd:98ea with SMTP id 5b1f17b1804b1-43ecf9c7731mr16261075e9.22.1743755562665;
        Fri, 04 Apr 2025 01:32:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ0IdRaSckdVORex2b1FgzPZdidXCh6submJTDHordJMQojyupjfXYrJLLNpoFtr3Ssc7f6Q==
X-Received: by 2002:a05:600c:4713:b0:43c:e2dd:98ea with SMTP id 5b1f17b1804b1-43ecf9c7731mr16260785e9.22.1743755562294;
        Fri, 04 Apr 2025 01:32:42 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364d071sm39036635e9.32.2025.04.04.01.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:32:41 -0700 (PDT)
Date: Fri, 4 Apr 2025 04:32:39 -0400
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
Message-ID: <20250404043016-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <Z-43svGzwoUQaYvg@infradead.org>
 <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org>
 <Z-46TDmspmX0BJ2H@infradead.org>
 <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
 <Z-99snVF5ESyJDDs@infradead.org>
 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
 <20250404040838-mutt-send-email-mst@kernel.org>
 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y_WuolgvWKaUKFP9TkkvDbcQQuPVVwv9pKAv41GkOdk_1743755563
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Apr 04, 2025 at 09:16:44AM +0100, David Woodhouse wrote:
> On Fri, 2025-04-04 at 04:09 -0400, Michael S. Tsirkin wrote:
> > On Fri, Apr 04, 2025 at 08:50:47AM +0100, David Woodhouse wrote:
> > > What's annoying is that this should work out of the box *already* with
> > > virtio-mmio and a `restricted-dma-pool` — for systems which aren't
> > > afflicted by UEFI/ACPI/PCI as their discovery mechanisms.
> > 
> > 
> > That specifically would be just a driver bugfix then?
> 
> I actually think it works out of the box and there isn't even a bug to
> fix. Haven't tested yet.
> 
> The sad part is that the system does it all automatically *if* it has
> CONFIG_DMA_RESTRICTED_POOL (e.g. Linux) and the driver never even
> notices that the dma_ops it's using are the swiotlb ops using the
> provided buffer.
> 
> Which is *kind* of nice... except that when on a guest OS which *isn't*
> Linux with CONFIG_DMA_RESTRICTED_POOL, the guest will just ignore the
> `restricted-dma-pool` node and try DMA to system memory anyway, which
> will fail.

I mean, it's easy to misconfigure Linux, this is why we love it ;) Why
is this such a concern?

> That's why my proposal adds the negotiated VIRTIO_F_SWIOTLB feature, so
> that the device side can refuse, if the guest *isn't* agreeing to use
> the bounce buffer in the situations where it must do so.


OTOH then setting this feature and if you make the device force it,
you are breaking guests restricted-dma-pool which worked previously, no?

-- 
MST

