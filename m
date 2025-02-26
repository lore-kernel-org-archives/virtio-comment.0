Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B333328F3
	for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 16:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740586090; cv=none; b=tFfTJFyZyHtNQ092GSzQhJ3a0MvA7ZxjEKMIVEUK6H7ykZ1CdD9i6901PeJYcLgE7z48b1GLUJ0CYlrLztvxkIvWqNwbgCwSlSOTU364hTbxx7tRe7X3nD5LlZxi1+GY7iv7eHHHBKHazTm+LpV6rldH08943eLoVCpBRMKl7Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740586090; c=relaxed/simple;
	bh=WrB7AxCRQui6bs3eQJi5l8f/yi35vgq23coz/8P7Qi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oRz8+VSpDPdmhhe8D5v7Jy0xUEN0FfAkXHfiVKBgpeZkI45UdeEA+0VY5IyqFvk147nHG6I1Oe2XUzyWO0kcOJlLOMFE+/zuQj65W3An5tOANuD8W2+I3dPwu+JIoE04Kb29DErF4zAXxoTw7PQ6jAKxBnxfey50TI/sETATj8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gokx1eaZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gokx1eaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740586087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gLQlkDjJ5BIbnMjeL+TND42940aTIhVUgabMBd+Da/s=;
	b=Gokx1eaZD6H5BpUYYvYAVMuSxsdqY8BM1otGI6v5mBRodQRh1SM1zdx0pWVwoheVDLq1iX
	as8YIIiULv2+dFTisqzCY83JT61x2iIhtIDq7VwaGttHZGxirQ0XboXpWIlFc4dwOKoL+g
	g6z9hjJe1Gm51+QtTJdoHM7GfVB025w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-s6GZZMp4On-kfrxp4E25Tg-1; Wed, 26 Feb 2025 11:08:06 -0500
X-MC-Unique: s6GZZMp4On-kfrxp4E25Tg-1
X-Mimecast-MFC-AGG-ID: s6GZZMp4On-kfrxp4E25Tg_1740586085
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43947979ce8so21205e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 08:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740586085; x=1741190885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLQlkDjJ5BIbnMjeL+TND42940aTIhVUgabMBd+Da/s=;
        b=Tsr8E/72TLi1erUsAG7bkC8PBSydxdxmm5JO4e4Uzu/WR8wZIavdRBPZD/32orJdQS
         PCipwJoNG7NMPrZZo0GKJSOWZSJbV5DyGW3JKeLt3T9tLCNE2+R9UN/5VfGr9RZN7i7d
         nzIDptbY6lE2mapTEerxdsJch0RKxTTrD/yUciugyfrPwchkxBEIJakJBM2Prbw3GQyP
         PqUt41QakbLVeR1Eeg00vpJUXr4y4oecnuNiDiZLHiLyLrFaW8EJZCyeYDSF0rOxzIiJ
         mxe1wuAOyQLHx6CeB0sM2At6BQJDx/6t/YpvzDU0k2iklXThd063BtmgC85VDyp66sqo
         txJw==
X-Forwarded-Encrypted: i=1; AJvYcCUrSDDAaSXK3wVWvQm7n3vChAyZ3g6kDdF2wSze4VwKLEZOzrLcUIGO2TTygoJC5G78HtLrsrmLmrdXlbb5mA==@lists.linux.dev
X-Gm-Message-State: AOJu0YykndhqBx4UL0Ti6SLiSUysycLVh/M7zokTbKOtkdE/ZpbFd7pZ
	fIZGf8P+IjyT5uO0pPhs+vnC0uXrTCdVlFOe8oaH9U1qaZmKpWutE6PVeZWyziyMWGUYqg6H/NZ
	q7Q3caN3M8CGoMjsaJwYu7KOG+RCvyvdQbK/KunJYofLv0bhrCOa/IomMoGdBFtlZ
X-Gm-Gg: ASbGncu/AhMwXbxprhBIyts4DadSHN5XLyMt7YFbRZG4dj1uU6AhtlrlspCECVJMp+L
	SRH8Hp7/+abZvmuS9R5ArpCXec7h9UVqPX14BjOrzTA/9t2pFtjcsmkGMAGybaNCGBPX8j1aM3L
	cLm64ZRemx+XBAyrIfO7No/gU+tJRyX0PIV61wOh3qlhw6FazzgT2YebcCUVy1BxSqhtHEsWWgk
	oTA2ZR4ccjaycp3k2PUX+PlHqUMvWFLsFza/csNNS6O14vMx0mcjF2SfUK4F4fgzImiAjEaVXcD
	0gM1zkfZog==
X-Received: by 2002:a05:600c:3b08:b0:439:90f5:3942 with SMTP id 5b1f17b1804b1-439ae221b60mr168658755e9.25.1740586084973;
        Wed, 26 Feb 2025 08:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZ38jfF9x/VOhAkOyM6CtaJLP/jouSNrWnM8z1V89LWO60fEapigXnIsa8i6o16Gn6BTtluA==
X-Received: by 2002:a05:600c:3b08:b0:439:90f5:3942 with SMTP id 5b1f17b1804b1-439ae221b60mr168658505e9.25.1740586084666;
        Wed, 26 Feb 2025 08:08:04 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba571274sm26481065e9.31.2025.02.26.08.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:08:04 -0800 (PST)
Date: Wed, 26 Feb 2025 17:08:02 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Rob Clark <robdclark@gmail.com>, Huang Rui <ray.huang@amd.com>,
	Sergio Lopez <slp@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	virtio-comment@lists.linux.dev,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 0/3] VirtIO-GPU spec improvements
Message-ID: <Z788Yrh6qy9dJOVP@fedora>
References: <20240719120638.196052-1-dmitry.osipenko@collabora.com>
 <de02684a-8f36-48ba-b505-85b6d74f5e8b@collabora.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <de02684a-8f36-48ba-b505-85b6d74f5e8b@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Cb0uFyFQ0jC_4pAMsqyTeqWN9R8RzIuvQ_IXeb-SvK8_1740586085
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 26, 2025 at 01:59:06PM +0300, Dmitry Osipenko wrote:
> On 7/19/24 15:06, Dmitry Osipenko wrote:
> > Hi,
> > 
> > This is a repost of v2 to the new virtio-comment mailing list.
> > Michael Tsirkin suggested to repost the patches, here they are.
> > 
> > Dmitry Osipenko (3):
> >   virtio-gpu: Rename GFXSTREAM context capset to GFXSTREAM_VULKAN
> >   virtio-gpu: Document VIRTIO_GPU_CAPSET_DRM
> >   virtio-gpu: Update venus-protocol URL
> > 
> >  device-types/gpu/description.tex | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/182
> 
I think what is missing is to explicitly request a vote as is explained
in 2) at
https://github.com/oasis-tcs/virtio-spec/blob/master/README.md#use-of-github-issues.

Thanks, Matias

