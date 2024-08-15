Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23421AC8AD
	for <virtio-comment@lists.linux.dev>; Thu, 15 Aug 2024 10:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723719183; cv=none; b=ZtHxL5ZW1wTCBUO+BGuOkoGfUvMEjK2eDVC0/fPjR9oe+LghQuejJZjv0TYRC4pW16OM49yx5MOsDju83SScG7y0vZ2jQ91tCAF55fzeV9M0keSk9EFZ+6QgDCgWAAXbaEs4XrkOwkxUrEQWfTKYYuBPG9XI6i2gBmykFfSUszs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723719183; c=relaxed/simple;
	bh=AWj3DV9mzdZdB/3GnHpCojQtQJFRlLQpLch7JDnvtg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=RODI1eCvjN26YalyyWeUUZPQGhX3byBsq9v1jRmoNAkBLHyCOTbZIOYN62P3+JWasFbvdJzHUCEPEphvb/w9mcpDYwEppEZrupwSqp5BNCBCGiVD8VtNulyiVon6hgDpVTNXBVXGdgDD7x6pUqnIRtHkbsiwy52QK04YbhO4/Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SxGQNB8o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SxGQNB8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723719180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ejPUjm1NS6qn3hxqjx14Af6xepbLr/yulhQEnipWZUA=;
	b=SxGQNB8oLJrNYtjmog5FIX2AlO4Ev0W1MysMW7U5Bjlu+Aljsj3sujFDtZtN/+z8e2ZWOY
	pyp2rqMm8mBTp6t1LoXxGGfmjji2hYyQHvGRwR6lbtIXvlKFlGdwc6anYjQcM0PvP4nXLI
	IhfDuPYG8rn0yNsTndVp7VaWS/I4Vr8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-yuqvYJEjMk2OmgyLiGlTDQ-1; Thu, 15 Aug 2024 06:52:59 -0400
X-MC-Unique: yuqvYJEjMk2OmgyLiGlTDQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a7aa7e86b5eso79606566b.2
        for <virtio-comment@lists.linux.dev>; Thu, 15 Aug 2024 03:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723719178; x=1724323978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejPUjm1NS6qn3hxqjx14Af6xepbLr/yulhQEnipWZUA=;
        b=T2VulI4R13E5h5Ig1ohjVigSe/Q4gIZJlteSDICV7or9TD8uTahvhJ1eDwvYkQsr8u
         u01ddyzARgJHWnzAey9nxe4MrVuWBJvLiK2vgM0PgjDUQnoQQKZdDxHHRnQiWF9YN+LR
         B9srJANpE0uTmy5IKLamnVc/8W5OC9ldvHluNyKKjVXgJ+RlTAYe68qEGc2BVGXSUZhC
         JPXW0xvjQ9yqiIW1vI6WP8dJ278Hs02ZvZXl8p4MNKD+Ckhm+si1tKGnxPsTqHCqUidy
         sg1yZ7zCWAFjpti44idwQLRI3d7l7Zg2dEY1i5MvA34pjUQgxgdOF09WFsRX31HwCnQ5
         Sy9g==
X-Forwarded-Encrypted: i=1; AJvYcCW/ZWDdEqB9YDNd4BdXoMLCZiDnRPKDHGDL1CW17gJG53HChp3VISSJO0zr+XvgF4k6WYRcx+SsWJvWetUKku/RAj3R8tBRKeaG0lo9ZBc=
X-Gm-Message-State: AOJu0YxOdFoVRRLnTUhK1qX9iaE8ekVAPsquTQaW3FxNoaGGlYSoddCY
	fKOMdip6sYT78TPW1TwaXjc8+7v8RZ6zJ2Yz/3tbiEotra+T7mZnuwHomwWVpqHjqGqQjxTIvjJ
	PbYi2UJ+WWIMtO8yZ7xfPwTd5dj2PjWdbfQ1vonrrDvO1E6KSrazhG3u4BT4kQ9ET
X-Received: by 2002:a17:907:e6cc:b0:a77:e55a:9e87 with SMTP id a640c23a62f3a-a8367087760mr381620566b.48.1723719177809;
        Thu, 15 Aug 2024 03:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfr2abynMoepnqBI5ibIc3zdHOfTP0rLuW0KQJrgNB+9zxgG5BjNxVNXnnirSdi2uHcXb5hQ==
X-Received: by 2002:a17:907:e6cc:b0:a77:e55a:9e87 with SMTP id a640c23a62f3a-a8367087760mr381618166b.48.1723719177053;
        Thu, 15 Aug 2024 03:52:57 -0700 (PDT)
Received: from redhat.com ([2a02:14f:178:8f0f:2cfe:cb96:98c4:3fd0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c73e6sm84170966b.11.2024.08.15.03.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 03:52:56 -0700 (PDT)
Date: Thu, 15 Aug 2024 06:52:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240815065136-mutt-send-email-mst@kernel.org>
References: <20240801113516.22155-1-lingshan.zhu@amd.com>
 <IA0PR12MB871379BD50370080A9B6849EDC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <50dae8fd-de3f-49cf-9b90-b53f0416133a@amd.com>
 <IA0PR12MB8713E194469A590D09B1BA1ADC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 13, 2024 at 06:55:04AM +0000, Parav Pandit wrote:
> That means, PCI HW needs to return suspend=0, until the device is not suspended.
> In this example, the device cannot build special circuitry to answer suspend=true within 50nsec, or in other words building special circuitry to return suspend=false is too complex for the slow operation.
> 
> If this understanding of burden is clear,
> 
> The proposal is, can you please extend the interface such that,
> 
> 1. driver writes suspend command.
> 2. driver reads suspend_status, and receives not_completed=(false). This is the default value.
> 3. When the device completes suspend, it changes the polarity of suspend_status=true.
> 
> This has two main benefits:
> [A] This will enable software-based devices to write data to slow files and does not have to force VM_EXITs.
> 
> [B] It also enables hw based devices to not build special circuitry to answer within 50nsec, which can get very complicated for tens or hundreds of PCI PFs.

I read this several times, and I don't understand what is proposed.
A special register for suspend/resume? Is this the difference?

-- 
MST

