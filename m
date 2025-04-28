Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED378836
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825317; cv=none; b=H/Gd2Z3ysXmufuEbjKVdDrdmT0igZhXq9NgYiWbybasV/VpuHFHjo3NXVeUHC8y6rlfBpOSI+Hk/7TGoNvAE6KE5/ZUw9fiEWv2dtMA9fS71dcVS47hB9XEZauEbLBQE/PWoI8XZPSXV7yVhY4PyykStptnMEbiP3MEBavwY+cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825317; c=relaxed/simple;
	bh=f9Q4sh4/IoLYhh/kW09S7sAL679lLeR0HBBXnq8cAmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lsP3qQavs8ana+xJU4GY0D550YSfmekkJVo1IWyevDmWi68knBrU2m9a5Woeeum9j12b6gP4Hf4k1ULlnBKwcJC4PTXafo/EK1uJgisnQ9J9y1usQHeL7VVdo0bovRivUHN7QU81nazxAfEl8kx47yL/bjK3VIAN+BTezFgjEYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ad8AmT24; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ad8AmT24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745825313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oLqFLgPBf8L9pCf9YWUd6BaeeQReXrx77xN2CgA4JR4=;
	b=Ad8AmT24diPYSxMz3Mn/AUjEnqCjvULywBgn3ilUyXFfxuzEJpnUKLymA5PUJkSBOMaA8S
	M+MbKaMYU6seEFymf/9pp7GBW189SaP8JctQQJr/Lp1nR6tPbddO8sSDYRj3HC1fi1jLU4
	jnfVpsIkx3azfZKa/e5LHQlcIyeRYp0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-PLhvmwCxMUGaO0IIiS_mEA-1; Mon, 28 Apr 2025 03:28:29 -0400
X-MC-Unique: PLhvmwCxMUGaO0IIiS_mEA-1
X-Mimecast-MFC-AGG-ID: PLhvmwCxMUGaO0IIiS_mEA_1745825306
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912539665cso2113118f8f.1
        for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 00:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745825306; x=1746430106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLqFLgPBf8L9pCf9YWUd6BaeeQReXrx77xN2CgA4JR4=;
        b=ES9kIep+NcGkX0gtOsYtsG4He4qQVSMu6od8kbgPu1JXPwawrGv4KXWpZR7ekLBtzw
         P1K9RW8HRnn9J9OWR31Be9x1O72KWVSS4pcAgE5LnnIFepvYY2hnD2jq99e2htgL7Enh
         MfqWt38ui4J+ts3U7oOVehko6daUoqBNljQgbQejKDUMi9Tq8yxZ4/5jIMZHrbFXhN+m
         AH5iJdpiBy18B8x6rMa7DPxthB2g9knvhLe7+IpiHdihfOEYho9h9cBpPSEeH6Nu06Jx
         5Q9Hy5ZM1tzlndCyYEqI6UsILmipeQwJ+RuXTm6Vj3s23hUj7ZpN4e2KRSkuX5dn/p72
         qhjA==
X-Gm-Message-State: AOJu0YxCqzOo5+chtYmCVhR5rbryg7HC5Xx8BEsZvbB8PFCdtRFkvWr1
	q0ANr/Ol035TC1oFOsBSNRAo0jeXepcRouwhlv/nKz/TCwjBPfsNyNMn4hzhS/lXFKyCzwlQRPe
	V0q/EM2ueJn2iB5fR6lwi/mxdGBqkvT0puSg2d7XSssZ47VxomIdekCRn16SLU8uU
X-Gm-Gg: ASbGnctIbpCfKr7vyw1M3Hfvjus7Ps1cN9VpM9492SdrqcJcYeVwKIoyjYbL2/P6Czf
	1F/PtFdcXF6nV8elz7cJqctCivZTrpUATjqTH//JQIjD1DXwfcfZJBjmw9XDoXLAMT04H/9iSEX
	wOPETPD7nSl+PLsbQMY+1q0JcsZbbGq10AXfLNS6+dwQgDJ7+RFG0x79thKHBVbL6pa+TVMpMtC
	MOfdVuMT4FD8XIsXCS8sIAwGHZSR88+qkHKximwB5s3zVroHYpgl7rozbQQ87uIwtGbU3jHYEEl
	xz2NnA==
X-Received: by 2002:a05:6000:22c2:b0:38d:df15:2770 with SMTP id ffacd0b85a97d-3a06d5ec30emr11661381f8f.0.1745825306347;
        Mon, 28 Apr 2025 00:28:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCifDRLaNQCeSc5UFPzlHeD9JDdWIaw1q7qWLeWiRTsJLW++9tU+fXbinNpGhec9tIBe6E9w==
X-Received: by 2002:a05:6000:22c2:b0:38d:df15:2770 with SMTP id ffacd0b85a97d-3a06d5ec30emr11661355f8f.0.1745825306020;
        Mon, 28 Apr 2025 00:28:26 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8cc81sm10371839f8f.19.2025.04.28.00.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 00:28:25 -0700 (PDT)
Date: Mon, 28 Apr 2025 03:28:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Srujana Challa <schalla@marvell.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, mvaralar@redhat.com,
	parav@nvidia.com, sma@napatech.com, sburla@marvell.com,
	ndabilpuram@marvell.com, jerinj@marvell.com, anoobj@marvell.com
Subject: Re: [PATCH RFC v6 0/4] introduce IPsec Service in virtio-crypto
Message-ID: <20250428032726-mutt-send-email-mst@kernel.org>
References: <20250424093046.1927395-1-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250424093046.1927395-1-schalla@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: azpx_XxVsyPLxT8rRcX8sagWLpOROYv4J35ZmHNuP3g_1745825306
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 24, 2025 at 03:00:42PM +0530, Srujana Challa wrote:
> This series enhances virtio-crypto by adding support for IPsec
> services. These patches aim to extend the capabilities of virtio-crypto,
> enabling it to handle IPsec operations efficiently. In addition
> to standard crypto processing, the IPsec protocol processing is
> also offloaded to the Crypto device as lookaside operation.
> 
> It utilizes new virtio basic facilities, including capability and
> resource objects. Below is a summary of the changes introduced:

please do submit a non RFC version before you ask for a vote.
can you explain in a bit more detail how you envision this
interacting with the virtio-net patches you also proposed?


> Patch1:
> This patch introduces the foundational support for IPsec services within
> the virtio-crypto framework, outlining the necessary capabilities for
> IPsec operations.
> 
> Patch2:
> This patch adds resource objects required for programming IPsec Security
> Associations (SAs) for both encryption and decryption processes.
> 
> Patch3:
> This patch includes new opcodes specific to IPsec operations,
> facilitating the handling of IPsec data requests within the
> virtio-crypto driver.
> 
> Patch4:
> This patch specifies the requirements for both the device and the driver
> to support IPsec operations.
> 
> These enhancements are for providing support for IPsec within the
> virtio-crypto device/driver, improving security and performance for
> virtualized environments. We believe these additions will significantly
> benefit users who rely on virtio-crypto for secure data transmission.
> 
> v2:
> - Addressed the review comments from Matias.
> v3:
> - Addressed the review comments from Parav Pandit.
> v4:
> - Introduced COPY_DF, ECN and SA LIFETIME to the SA options.
> - Introduced SA lifetime to the SA resource object data structure.
> - Set cipher and auth key arrays to fixed sizes.
> v5:
> - Addressed minor review comments from Parav Pandit.
> v6:
> - The esn field has been removed from the IPsec SA resource object.
> 
> Srujana Challa (4):
>   virtio-crypto: Add IPsec service operation and Capabilities
>   virtio-crypto: Add resource objects for IPsec outbound and inbound SAs
>   virtio-crypto: Add new IPsec opcodes to data request
>   virtio-crypto: Add device and driver requirements for IPsec operation
> 
>  device-types/crypto/description.tex        | 510 ++++++++++++++++++++-
>  device-types/crypto/device-conformance.tex |   1 +
>  device-types/crypto/driver-conformance.tex |   1 +
>  introduction.tex                           |  12 +
>  4 files changed, 519 insertions(+), 5 deletions(-)
> 
> -- 
> 2.25.1

