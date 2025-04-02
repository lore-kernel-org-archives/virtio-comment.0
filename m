Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD3B204693
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 07:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577372; cv=none; b=qsX1pvAjkAoYc8ephV3w2JUwJMA1yysuh6QYhJVlcJeu4k2X4CX5ahbqQuzzRNUZUOrBkYMX9L7+GJ/1wgrpcNOr2w+U8H3SS41TdEhvSG9wRjnlq+nRR1m0BerwNnWnH+4efWeIjsHr5nVqvGbpJiyKN0YF+lJ4oe46aPKfeyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577372; c=relaxed/simple;
	bh=/NJHgskf0pdtqyuASbJI3hNuRXO5s86RM6lr+tfZmpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=rKRe2ZWaJ7v8+WUwjvEpaspifLa/rHRfpPrkFxm5HWKBxxRIlj+L8PMaRrn5/4Y7ImgbhXuXcFc3fNMQi+UfUJ5+mWBiakgvXz8WdmME727BH1gpDhA+BWmjV+kKBKtR4HD/kQmuykTuJ/0kgBuHTaWwQGvFl52tS191py/vYaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ehp/Alom; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ehp/Alom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743577369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xc1y3x2DwaDPBzrAvw1ihp3NSdBOwiC9/V8nkv3Z8g4=;
	b=Ehp/AlomYE2vNH86Y0GXwVXaG5khav8pTy2t/ghlcIYPEP/qC19VSKraG47HXEGdn4tz3G
	pGKFjlpP43MfM+hFf73WAbH8SbOZ413bndCdYmTGQmNr2/JlA3tpE5gkQ75zHLSV84BN5g
	hdy+fs5p9jePe3dH0AFW7W6x3KXaDLI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-Iaof9QUoOqSFXUiHq7Clbw-1; Wed, 02 Apr 2025 03:02:48 -0400
X-MC-Unique: Iaof9QUoOqSFXUiHq7Clbw-1
X-Mimecast-MFC-AGG-ID: Iaof9QUoOqSFXUiHq7Clbw_1743577367
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so45809335e9.1
        for <virtio-comment@lists.linux.dev>; Wed, 02 Apr 2025 00:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577366; x=1744182166;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xc1y3x2DwaDPBzrAvw1ihp3NSdBOwiC9/V8nkv3Z8g4=;
        b=sFAagpL4TLrqbfSqnF7inIrTe3PLs6CLV/I6fYV+i/gwq0N6qtsff47fRRQclKFC09
         aYDivs9TxDgm/dd+xZ1UQWpjvBlcCMS1b6KMAd4O17oI3+onxMqty4NAqYU8eWF7sa90
         nw2/hlBtJPA6rO1CfL0h1uBlNxdF2OjgtXw8586uVUHdv2H3sA8s8T3va63//ApW3+8e
         yBaQuzFPSgidSvdrqZEGtWn4rljBGLt2EWf5NmFnX2d1jX/EwzuH7S/tnNBTTPcx8P1W
         DHBNYK1bNxDgbv6/PizqT6koxHGlrHRHSrKtfLDwLY8I2ozE631ZOZjmq0GZdN8SNjb3
         W2iA==
X-Gm-Message-State: AOJu0Yx6FSNmTlpXhMunZz2fYReUkE7XgsrF/SkPnQ4Np18/ABFi4A1F
	HLn+UTM+g3+hjhnrQKkJRIiTG8/w4dCla/8IagzcIvykYSF1Ac5WX2D5OAPJjSFmEqyX3Wyc7i9
	GdzympWVniEKovXSLsz52L7Vw94xtEQeXMVvhgr0NUiXpozHpTspyro1bZFxDAkH9DnFh3GXr
X-Gm-Gg: ASbGncu68NRM6/cMD7u6oJ0F4XA0Zc9HNJio2Wc5qewDjco8r6FP4YETBy+U2JVmFe2
	AQJgaPAcbKnLAciOhPobwU/5QlATKP90IwB8C+DBsWO7GlJ17wd6o1XbJd/rvbl1jjZq8pPMfxH
	ApT9uegZS6iIlb+vOoOwdEOS8vdU9HFyPzdIgRrp4oA+bWOXju1eeogTKOgzWfmCHvaPGb+iW5X
	raxucxitRCdWqTnigEjiWIukl0ycWx+hnfAl+BEZwzU7DpccLJcFzTJc7FE36k+HDj127o9o0Mf
	Dy7BFMeqgg==
X-Received: by 2002:a05:600c:3c82:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-43eb5c966ebmr9988905e9.29.1743577366091;
        Wed, 02 Apr 2025 00:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqZSZjZZ7gRLi5DDsKbJzJiXwkCj1bC2GCya4wXXYbzFsUJaiBrOXmpWIClYg6qUrD6DR3NA==
X-Received: by 2002:a05:600c:3c82:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-43eb5c966ebmr9988605e9.29.1743577365681;
        Wed, 02 Apr 2025 00:02:45 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fc67b3sm11503135e9.6.2025.04.02.00.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:02:44 -0700 (PDT)
Date: Wed, 2 Apr 2025 03:02:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, parav@nvidia.com
Subject: Re: [PATCH 00/13] Backport 1.4 fixes to 1.3
Message-ID: <20250402030215-mutt-send-email-mst@kernel.org>
References: <20250401133543.801184-1-mvaralar@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250401133543.801184-1-mvaralar@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B8bhyCuXs50yr8O7J7WQfv6iiKd-5LhUPeb6jIr9yBc_1743577367
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Apr 01, 2025 at 03:35:00PM +0200, Matias Ezequiel Vara Larsen wrote:
> Backport commits from 1.4 branch into 1.3 in preparation for releasing
> v1.3.
> 
> Haixu Cui (1):
>   content: Rename SPI master to SPI controller
> 
> Martin Kröning (1):
>   virtio_pci_cap64: specify offset_hi, length_hi endianness
> 
> Paolo Abeni (2):
>   virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
>   virtio-net: clarify DATA_VALID semantic for encap protos.
> 
> Parav Pandit (8):
>   conformance: Add missing virtqueue reset conformance references
>   packed-ring: Change host,guest to device,driver
>   description: Avoid splitting the word virtqueue
>   virtio-blk: Fix data type of num_queues field
>   virtio-net: Fix receive buffer size calculation text
>   virtio-net: Clarify the size of the struct virtio_net_hdr for tx
>   virtio-net: Annotate virtio_net_hdr as field
>   gpu: editorial: Fix spelling errors
> 
> Steffen Trumtrar (1):
>   virtio-net: Fix receive buffer size typo


Backport Looks good to me.

>  conformance.tex                  |  2 ++
>  content.tex                      |  2 +-
>  device-types/blk/description.tex |  2 +-
>  device-types/gpu/description.tex |  6 ++--
>  device-types/net/description.tex | 52 +++++++++++++++++++++++---------
>  packed-ring.tex                  |  4 +--
>  transport-pci.tex                |  4 +--
>  7 files changed, 49 insertions(+), 23 deletions(-)
> 
> 
> base-commit: b495841a8e80d12c1130f8868f4128866291142d
> -- 
> 2.42.0

