Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5979C1487F6
	for <virtio-comment@lists.linux.dev>; Tue, 21 Jan 2025 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737468044; cv=none; b=EVn389mXKTruWCkNyFc8/O/K+nt7NwUelugGnQFRhjUS9Z5X+QAtCO97OOMKCFq1zdpPczLeT32e91Nqrl2CIUw0/woiOg99H9CfRyjtHqRSMpyPvxfu1dAChQ11HTA8COAYJhFD7qJuhvhSBTZrkpnyoHyRZ2+9pGr8yMTcEiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737468044; c=relaxed/simple;
	bh=ofPO9JB2nifp9FsBHVJzCQ75s01cxKqZgfL9hDKjoek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kajsqZbCdUgZJhQMif9C1J2Yz2Xufj8+TCEde73vjHrSgrn+DTDI15OnNJps+5TvdX/PcIwzLccSRw5icegxd8eG57V9ZBXxuUKN7x+YMSrqe+ilTUAPa95GHJdZfp7olh0AHYwUMc5+5A1YSf68g6VM6KM7QnTBp9jYEyUV66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VWFgYDT/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VWFgYDT/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737468041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=atTmut+hsjo3+1iOFM6+80qhzbs+LV7XzkZ67rWqsoY=;
	b=VWFgYDT//QDf4ge0nYG4KJEYOefesCn1Z7ONPWodiyMyy8pwFBP1G8KsuY7JwseOxBf5GR
	WFsG/2igV/pUpNbGbv09dh+O24uaA3jOLgkdp0dF1QfMXC9jP/W7b3qp+yTKDbRkEmRMnO
	bF05KW7JtnIHiEN/LqjJDvKKfEI2MSA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-pxS2ElQqPLem9yLR-7sSEA-1; Tue, 21 Jan 2025 09:00:39 -0500
X-MC-Unique: pxS2ElQqPLem9yLR-7sSEA-1
X-Mimecast-MFC-AGG-ID: pxS2ElQqPLem9yLR-7sSEA
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-436248d1240so28025905e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 21 Jan 2025 06:00:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737468038; x=1738072838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atTmut+hsjo3+1iOFM6+80qhzbs+LV7XzkZ67rWqsoY=;
        b=fWMsxmCf+ATDetNkKZMGPKnNGmIRAY+cgCadflfUPByiO8W2wpbwBBjewIvYS4Gdvj
         ZFjYQTwmKLDGOcaOPXt+eXyo1xF7Dz3MZCsaEwL8A3YUdSn1Y8Y8e6p7jmd+kES2Jbef
         +xZxv3gnb6mTeYKky/9imQCoPRMMYh6EjBxdG0GCIWFsw/ZGMlQQVeVAjGnGbfwuH5Dl
         Lwuj8Gfetv04oR32JFjdiz+xhSG1eANRUGeH38jYma88y8GfX9uoU9NjJyH0lmucpPUL
         RG2YTtQqx4KhyEahih1xYTI59pH5gvt08t56NybwArsC7RcjtqyuRGzo3QqN0n6tF8bU
         XP9g==
X-Gm-Message-State: AOJu0YxDNJKyC+LAtK3wtRypcR1nq1Jw1XhBylXYmgZR61p/BLmLHgTa
	xoe1TiygPin4WUjWgdKvOfJmUKgZArtOnSDBLqPcvc9w/9uVird1gytXdkDkyNhQc52Dtik+bHn
	fK8PUQK1NG9kPjHuAX/FtzgEA7Hp6nHRbv04WMl876T9UStKOL+tUB/qMWgCYO0nV
X-Gm-Gg: ASbGnctJ+pbgP8kCigxBDyPNZzHg/w5Ijg2p4guFjFb/xzcrrXepNDHGZIxLCloGhKF
	vsRERAjG1tJMaECEBSb9JzuhjcY30La/sFs0wqyMyn7qmqQhZy/V0dGBrMLIti223XMQjUgCk5s
	K1Hf1tQfRd0oQeiDgFaKWz06/RiOula5aVqcZ5QxVTFeJA4cRMN3JGyJq/BmCn2+iTnveKh6ixR
	iwWDWtdZe5nIfK4+9nyL0JsmliOBnfUKHRMOF2R9KgewfJ+wMaKsBhzdkXvVDuw
X-Received: by 2002:a05:600c:1c93:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-43891429c77mr143788835e9.24.1737468038278;
        Tue, 21 Jan 2025 06:00:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiw7T4yaDPEXscBFhUfbz7w9ZLTPM83EpNuLv4JByIoNGHIodkQz9dF495xsACI5aVXY2m9A==
X-Received: by 2002:a05:600c:1c93:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-43891429c77mr143788255e9.24.1737468037625;
        Tue, 21 Jan 2025 06:00:37 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438904086cfsm184644205e9.4.2025.01.21.06.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 06:00:37 -0800 (PST)
Date: Tue, 21 Jan 2025 15:00:35 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Julia Zhang <julia.zhang@amd.com>
Cc: virtio-comment@lists.linux.dev, "Michael S . Tsirkin" <mst@redhat.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>,
	Zhu Lingshan <lingshan.zhu@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH] virtio-gpu: get p2pdma distance
Message-ID: <Z4+og7rL0h5JGYCd@fedora>
References: <20250114101612.88304-1-julia.zhang@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250114101612.88304-1-julia.zhang@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5PY87hKK4N0BwMpA08DliYaOa6qHRU0tLVxkBFUiTPI_1737468038
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 14, 2025 at 06:16:13PM +0800, Julia Zhang wrote:
> PCI peer-to-peer DMA transaction may be used in guest for some scenes.
> For example, dGPU prime feature will let virtio-iGPU access to
> passthrough dGPU buffer.
> 
> To support P2P DMA transaction in guest, virtio-gpu needs to check the
> compatibility which is represented by p2pdma_distance. This defines a
> command VIRTIO_GPU_CMD_P2PDMA_DISTANCE to allow guest send virtual pci
> notation of two devices to host and get host physical p2pdma_distance
> of these two PCI devices.
> 
> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> ---
> Hi all,
> 
> We are trying to implement dGPU prime feature in guest which will let
> virtio-iGPU read rendered data of passthrough dGPU. Before that,
> virtio gpu driver needs to get p2pdma_distance to check if P2P DMA
> transaction is possible or not.
> 
> To implement getting p2pdma_distance, QEMU needs to handle the command
> from guest with virtual pci notations of two PCI devices and send it to
> host kernel and return host physical distance back to guest.
> 
> So this defines the new command follow the suggestion in
> https://lore.kernel.org/all/20241207105537.542441-4-julia.zhang@amd.com/
> 
> Regards,
> Julia
> ---
>  device-types/gpu/description.tex | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

