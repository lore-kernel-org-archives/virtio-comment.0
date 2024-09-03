Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA991AD259
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725359843; cv=none; b=ejDZwK9CoMNMVEYeEN7plfeK99urSkGY/5HhnkNES2tP88InrFg1IteU/KLlDrq77OTgocUjJfbln2rcGDyUZfjPtlCrROtqKIwpKMDlYnaDQxqxr0eGPW//m9ZYHI7DMD9xN/6XTuZ5wicPZLy1e00aey+fnEQVJYTvJevSS5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725359843; c=relaxed/simple;
	bh=mDwqCVoCMBBSvYLR9Fu29MsoddMbY+VbOlSZMoZvD7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oBwiFg1V6h08JCw+b22dX41DktP1mpOtGkFSUnIOHiKDZWXSlNom5UZWCFzucgBWIhRBSs3B0ZFGALYHTbpgJLScCS7brXtURKYr8KlIeJmhOaemc8EnFk5/nTUGOxYSi5Bjq6lGF/HjByqrvNx3jOQ3EssoPVcvP5G6Og5eALE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GbW+QtTK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GbW+QtTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725359841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9uTTK7Bx1ELqQrR4VY6rBV7J0dJDmiHHJK9ojoiBjTI=;
	b=GbW+QtTKUzfQefeg66BFIfw63XzWJGPEl1reb0ckyLYAEM7pP3p7ZUMelZazGdzR/0JFTU
	RYdIaZVaY1WZCLTZOUzjTXKGD/nyHfFmHVhsT5AjjtWTqbFYY4Wj62je9aYMLwSnlN22lK
	b22sHpXSeYS/WlVpdmDwBuBSIBaAt84=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-5nqUMPPEMA2Q1D_zq-AUng-1; Tue, 03 Sep 2024 06:37:18 -0400
X-MC-Unique: 5nqUMPPEMA2Q1D_zq-AUng-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42c78767b90so28114735e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 03 Sep 2024 03:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725359837; x=1725964637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uTTK7Bx1ELqQrR4VY6rBV7J0dJDmiHHJK9ojoiBjTI=;
        b=FzWSTEAhcN3JQGnazwq3GESXwOor5YcfDn/b/CJ6VKSGD6hg3tl4Jd/waVu3K6Bhiw
         CFTXuvotYoitkJjx4c4ZUFXsH5aM4w7gK3NLeAgxgeLlJ1pBI1b7UiYbePLFBTZupulX
         wNcjnUgAQDTvoFE7MfKw1rZHbj6gUmZE0ySHntees8rdSLEApQOdnKHeA51I2vVus3Rd
         xbAfPSU6BxySHy/41y8wAlLBAHg7N/i7ToBTgFygXMQm3O9uMAfprexa4FE1UsbfRKZE
         9R5Hs8nkxvD24dYwHyCPxihHXkZFHfhkGPoyzAWtTYMs7OYyCR5KGDoRJB73BC4R/cp+
         ewvQ==
X-Forwarded-Encrypted: i=1; AJvYcCULKzCOU0TVU5DXm9d5WW9G5nXpUOTK8cPmDBdEfEurFvywPUaLLnn+qzIoYZLhd0tarbSAEu2m0QFFOgvWoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzK2l/IX1aYesiqcy4l42Ik9BQmpL16PCSNatHX7SfdnDdCRzWR
	sPEJwa7rfpuScDZHVce45haKO6pXwqH5X1+5wGTkdYPM4iXQEoGfhgCOgtPfW2UV4iKZnraTwWV
	1DJAKcSqbcBq8hFkUZivkYZOvhawDjaQCnnrigalLMnfwBOotxAIpdbA10KEtFVO0
X-Received: by 2002:a05:600c:1d17:b0:429:e67f:1249 with SMTP id 5b1f17b1804b1-42c880ec58bmr22074825e9.3.1725359836819;
        Tue, 03 Sep 2024 03:37:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEleFte9FDlnrEGQewCx7wM+lNUJqE364Vl1qnaMXPwlyOelACyKtXOGtrIOQ/y+99kqC1Zrg==
X-Received: by 2002:a05:600c:1d17:b0:429:e67f:1249 with SMTP id 5b1f17b1804b1-42c880ec58bmr22074445e9.3.1725359836002;
        Tue, 03 Sep 2024 03:37:16 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:95c6:9977:c577:f3d1:99e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e273bcsm165705355e9.31.2024.09.03.03.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 03:37:15 -0700 (PDT)
Date: Tue, 3 Sep 2024 06:37:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Zhu Lingshan <lingshan.zhu@amd.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Message-ID: <20240903063625-mutt-send-email-mst@kernel.org>
References: <fbcc2cd6-793b-495e-b036-7baf77e87e33@amd.com>
 <IA0PR12MB87138A02C6F9F6282EAD8236DC862@IA0PR12MB8713.namprd12.prod.outlook.com>
 <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
 <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
 <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240903063424-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 06:35:59AM -0400, Michael S. Tsirkin wrote:
> > > 
> > > But I don't like it that looking at the registers, one does not know the device
> > > state. Hidden state is bad for debuggability.
> > > We have 4 states:
> > > suspending->suspended->resuming->resumed
> > > so we need a register with at least 2 bits.
> > > 
> > > we could steal 2 bits from status but it seems a bit much.
> > >
> > This is why letting the status tell the status and control register to control thing is elegant.
> 
> 
> No argument here.

Or, to be more precise, our status is driver status. If we need
to reflect and control device status, we need something else.

