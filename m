Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C2124167F
	for <virtio-comment@lists.linux.dev>; Thu,  3 Apr 2025 08:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743668049; cv=none; b=gJVILS6os6axc7UUMagp+hKBX5JOgXe8PAI8etAmnefD+TkMDMTzTCA/50pJgcT6+155iz6n4lPUUSxLKWDWCoIECkQ1bbcH5OK6FPipWElbo50tWMR3vLd41vZQEjbUhPQ3GhoedRmYd9BWQUICE/Zkklw47XGkqthKLQwWg/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743668049; c=relaxed/simple;
	bh=8ljqiGcCt0GZtC0zTI0Y+omskizGFKR2m3xQkFkwDCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ESxupj1FNqDw5rzCi4/FpKVyN9zCTkEG3865PCNPh8J4aWEuE1jKp7IcmHZnrz82Ltjbw1jmk/1s1/7jmaFO9lFd5obS02WMtYMwMfg5uzoU+IBruRqwEeT45rJDSk9lhiHCTIkROkSuD9P2DwEOQe214H+QZjjfMq6DvBvd2jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Istdqy2a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Istdqy2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743668046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rzWYYjEiaRBeSb8Vj5o/F0qgZqnmjAeBb2PcLQ2qM0A=;
	b=Istdqy2aql8pku8BsvYLPuALoApc4nA0hBIruC9aLcKMQHCy1AD6vbKoT2O0EdMEt0ZZfC
	43/eNxS+/+3DbkAgN60GF/BqqiY7Gij7hw2u2mbeiUFtiuZ9IJHNDDkLQcRWc0jpOkIQy5
	HcbTR9C62TL+dzKYLuDELpwEV/RJEpA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-RtnKS0SnNW6QP2MtvmPvfw-1; Thu, 03 Apr 2025 04:14:05 -0400
X-MC-Unique: RtnKS0SnNW6QP2MtvmPvfw-1
X-Mimecast-MFC-AGG-ID: RtnKS0SnNW6QP2MtvmPvfw_1743668044
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so3904705e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 03 Apr 2025 01:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743668043; x=1744272843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzWYYjEiaRBeSb8Vj5o/F0qgZqnmjAeBb2PcLQ2qM0A=;
        b=vTcKHHTCxDtd7hPYB5lrQbDjM6HqTPT1LhtMb7rQvp+nvaGHOCpGuiJNZRYyoiV2m0
         5bHDyF9Gq85HChe85BzS5bOkUeUBvIxQzEZb2lSOQ/OQc6AphMGw5opWNP+0lLd3SAdV
         M7+y5qmioOtAWYWuHE/wkGtlPjXtWW5JfhnwDjySSg0+9pC/fD+evmfmCODfS717rb4Z
         PHB/sNQ0hzgQ+WsPdxtqq8uI2ZS7kj+Fecc3u0B7yUfTCuHDwxHTYPHZKY5DKooRGEMx
         /ab78eEbwogNdUixdRqWiQ/fXAXiKbj407UhsoFsIK7/Z6L+TlMoGzhJSiJPVYF/o+n6
         JACQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwsGORDCPHWIhWgV0DY9zIAg1+F6xWaYb2OonizHT94V6MRjYxhN22VB1oO4wXRxQHsOC0CCnTjz6rUrumlA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnA/ZyOPNmKcRwEGRe/FyW/ggLC1QGd/LVENbWy93h2NIkXzrF
	UepHiRFVX1HlvY5GCpEKlZxLUxo5en82nhwUHOG38TFT61oBEkbZ/cAArJRKofnQi3PehH5jEFY
	QloYWWG1K+XXkB4NmcIdOzWodw402mkec87xRePJYi5Hwfi0XbQRBas7vmCeDHmr17E3MEV4c
X-Gm-Gg: ASbGncte4teplSD9iGwK6D/I+25VjkYvLz45wdLTQ/Pm+UroQq9uRNvWsCNLbj+6BeT
	BpqJqTWl2vgJJxfCYQgkd6gQ+UWLZAyyfCfJGWoJLf1kCNCnOfxIS/bjF5iyYHenJ9OB56AJWp5
	1tHQBkelksXJcUbW3xXHn3jIaAPGa3YFnXTCOJWdgFZ3/BFBNaNlz+vCEqJeuXROwSE00rRh575
	7MfBK97jLP1DTQwAnt9O6I+9GvUDaeqI0NGbR4k6QSIlbvE/FsyyJZwyfxNIvzR6lcH9G4gtzNd
	xpQcf7Ichw==
X-Received: by 2002:a05:6000:1788:b0:399:7f43:b3a4 with SMTP id ffacd0b85a97d-39c120e088cmr16478330f8f.24.1743668043526;
        Thu, 03 Apr 2025 01:14:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCqc+UbMw4reOC94Om0ACCo9roOZqNjIluH63XAEl0e6Z4bIUmGEN7/qCnuIYAa0IiNtTjgg==
X-Received: by 2002:a05:6000:1788:b0:399:7f43:b3a4 with SMTP id ffacd0b85a97d-39c120e088cmr16478308f8f.24.1743668043180;
        Thu, 03 Apr 2025 01:14:03 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b9d55sm1070866f8f.42.2025.04.03.01.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:14:02 -0700 (PDT)
Date: Thu, 3 Apr 2025 04:13:59 -0400
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
Message-ID: <20250403040643-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <1966cbf1-a430-480e-a78d-3d6bbcb4ada4@amd.com>
 <20250403033230-mutt-send-email-mst@kernel.org>
 <59be937432fe73b5781ecb04aad501ae5a11be23.camel@infradead.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <59be937432fe73b5781ecb04aad501ae5a11be23.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lTBogPtNP2niBsjXr7aovZcq96RYxhXa-Kig0Dgybko_1743668044
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 03, 2025 at 08:54:45AM +0100, David Woodhouse wrote:
> On Thu, 2025-04-03 at 03:34 -0400, Michael S. Tsirkin wrote:
> > 
> > Indeed I personally do not exactly get why implement a virtual system
> > without an IOMMU when virtio-iommu is available.
> > 
> > I have a feeling it's about lack of windows drivers for virtio-iommu
> > at this point.
> 
> And a pKVM (etc.) implementation of virtio-iommu which would allow the
> *trusted* part of the hypervisor to know which guest memory should be
> shared with the VMM implementing the virtio device models?

Is there a blocker here?

> You'd also end up in a situation where you have a virtio-iommu for some
> devices, and a real two-stage IOMMU (e.g. SMMU or AMD's vIOMMU) for
> other devices. Are guest operating systems going to cope well with
> that?

They should. In particular because systems with multiple IOMMUs already
exist.

> Do the available discovery mechanisms for all the relevant IOMMUs
> even *allow* for that to be expressed?

I think yes. But, it's been a while since I played with this, let me
check what works, what does not, and get back to you on this.

-- 
MST


