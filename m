Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A1C25C706
	for <virtio-comment@lists.linux.dev>; Wed, 19 Mar 2025 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742386993; cv=none; b=YEmGo2tnqI/4nP7H/7JeMx/rXPujtNvZnQQs2/ZE5gQ7F3Xr22+lHhYH+RNFB5fB3o/CLnA/0LsQq7nqPwrvBF/z6UYsXRo/4uk5Y3gIIQnUOlYfcFEUfBxFR3xyBNBWwszPtHybLaIsDpXsQt1ukZdhywguYHY1hBCxIVUxWUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742386993; c=relaxed/simple;
	bh=jf3BpppdeXAxju8htAlsyQBnu4lShxzFCAodYcP8NQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=edLgSiPHtn0+P/HECPsNmZzvKdirh6B58Jywbz0jbHtdvYrLtMbSKBgN4ZOl1+hn6s81nbuj1n2LwTuszgsRyCWGAt43n+iXH5u/VEIEzPsstCTriwHgTn2LWfA0JKXCg8YtVQdtW8pANncOocgaHy9JcKWI5WIZ+a6lUom3Auw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HX/LAmDZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HX/LAmDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742386988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S7/zfsG11pHL8CUB2sr0SPLNYppJayiGpwXdsfDO/mA=;
	b=HX/LAmDZ/9PNRpPGJznb4ZQbT8FaMAR6HYY1K8whAU65/CQpZ1S+5+TIwVLBBD1+BlHi8P
	dkxucYHhBGRgv0Ez/3l2vmW7M2eBGHRSKMuCjo9Rcd7z+uebtr7j7Sbkz4VcZM9krf1Aij
	D6N5nZPFnN1v+7UslY0IHAq8Yv9NQnk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-_xFvr-VrPH2cJNGCzW0ZFA-1; Wed, 19 Mar 2025 08:23:07 -0400
X-MC-Unique: _xFvr-VrPH2cJNGCzW0ZFA-1
X-Mimecast-MFC-AGG-ID: _xFvr-VrPH2cJNGCzW0ZFA_1742386986
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-391425471ddso3705909f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 19 Mar 2025 05:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742386986; x=1742991786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7/zfsG11pHL8CUB2sr0SPLNYppJayiGpwXdsfDO/mA=;
        b=sD4T5Xzbl67UVLKrcXKq0O7Hl7w2b0Z6fUUnY2k8h5Q+jyqcYM5i5xbs1vye4C9QMP
         n69H/by1/E3Ihx1PXhFWh9oyiDHT6fzV8w/1l6z4JkzTmf1C3A3qo48zuWdkIz66mmW3
         QGi1oXO9anmPg2qT8riUaPdmsYC4tFJ/LIj8ZZQ9oO5UFIckDGXTXsCFWvimtDdyXP0K
         zJhFrxdwlRhCNKN5YGvLx0rKD/6sBgIYTNmj0anTC9g6XI8L3QpROKOEXEOpsOikzgcz
         fslq59TDINCeBTOcx0cfxr1tS384xIW84K5C2TeLoYu876kPmCCYXC0q3Jdaur6cm7Dn
         LJAA==
X-Forwarded-Encrypted: i=1; AJvYcCVHtaTOawhMTDDlTknjZromiU8MTBGWKBTd9HmtA9Ltft+0TxskYOi62uInMGhFd7fnmAF8toTfN1TLk9sHxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzohurJIWirFsJ7ARgKjEOi720qcKw1hRozZk4wRnCBN5zXwhyT
	TVUObrYrJiyBjgmMwYKi1c3guPEHY6ZocGsLoVF8sN3g4D80Lmliv5D2ofODeuJSj4z2tEUuuV2
	SBvrgYfUPE9he2swnG2OZPIY7U1cplnRGczvTLMTeH6v4OOel+Hh1TaFlc+UjpihU
X-Gm-Gg: ASbGncvrPLGquElTQtoY/rMdixTOydaCGWJXxVWZbGwgifTKe40rkiFS3mhKCV117eC
	pe41sFpkRAT3e+a4ngbVg0w0LEdCQ74BeUBqTBOX7bR9DcfxGzu511ULHLF1fdZSZkLM1PhHE9G
	GJhvD7/tWZOLgoqPKWBK1nYvR1EXuWRu/iLQ+wlve7sxn6f3Wf1NV6/W8eS7M905GeXOr8aEZIE
	hmLAw3k+Y9t0vxkSzxJlf0m7CzIP7MX297Ohd+EWtOJdBYHkmpvK1RNFy1P0/cKV9gEjHMVqnQo
	brjilsndpg==
X-Received: by 2002:a5d:47aa:0:b0:391:158f:3d59 with SMTP id ffacd0b85a97d-399739c23afmr3000585f8f.15.1742386985766;
        Wed, 19 Mar 2025 05:23:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGgK86kvxk/h1OmWjiizks3ySX1v+JE7WsVC7Xnlom43N/Ch1x0ogaNYFz8B7MlsqDpzZkrw==
X-Received: by 2002:a5d:47aa:0:b0:391:158f:3d59 with SMTP id ffacd0b85a97d-399739c23afmr3000550f8f.15.1742386985355;
        Wed, 19 Mar 2025 05:23:05 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975c6dsm21520894f8f.54.2025.03.19.05.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 05:23:04 -0700 (PDT)
Date: Wed, 19 Mar 2025 08:23:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhang, Julia" <Julia.Zhang@amd.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	"Zhu, Lingshan" <Lingshan.Zhu@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Message-ID: <20250319080936-mutt-send-email-mst@kernel.org>
References: <IA1PR12MB6532B13A9BE99961E6D79722F2D12@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB71950B845BB9E5C10D864F39DCD12@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532DB3DD088B6F11351C645F2D12@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB71956575D93118AF3C425B51DCD12@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532768F74BE1198A9F7D100F2D02@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB7195003C2A8F7C8FE289EEDEDCD02@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532CD94403647007FD05EE8F2D32@IA1PR12MB6532.namprd12.prod.outlook.com>
 <CY8PR12MB71957E86BD3271121B8501DDDCD22@CY8PR12MB7195.namprd12.prod.outlook.com>
 <IA1PR12MB6532627FB0D9567568601700F2D22@IA1PR12MB6532.namprd12.prod.outlook.com>
 <IA1PR12MB653225F6373D8337181B649EF2D92@IA1PR12MB6532.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <IA1PR12MB653225F6373D8337181B649EF2D92@IA1PR12MB6532.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s8oRowGhTkUBEY5hMwEZwTYhaj_bWOi5kwhnrXcXYmE_1742386986
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 19, 2025 at 10:45:14AM +0000, Zhang, Julia wrote:
> >>> Can you explain more details about how to let
> >>> guest discover the way PCI driver discovers in physical world?
> >>>
> >> This is QEMU or VMM level implementation question on how to build the synthetic topology.
> >> In libvirt and other places, there is a way to describe the PCI level BDF etc details.
> >> You might want to check with the right owners on how to achieve or extend it.
> > 
> > Hi MST,
> > As discussed above, Parav suggested to rebuild PCI topology in QEMU
> > level to make virtual PCI topology 100% same as physical PCI topology so
> > that we can get accurate p2pdma_distance from guest directly. Since you
> > are one of the maintainers of QEMU, can you give us some suggestions or
> > explain more details about how to achieve it?
> > 
> > Thanks,
> > Julia
> 
> Hi MST,
> Since Parav thinks I should rebuild PCI topology in QEMU to make it 100% 
> same as physical PCI topology, which I think will be a big change for 
> virtual PCI. Can you give us some suggestions please?
> 
> Thanks,
> Julia

Hi Julia,
I feel the issue is not "100% matching" or the specific interface, but
that the motivation for the patches is not documented sufficiently
clearly.

It is true that many hypervisor vendors have a preference to utilizing native
interfaces, since this reduces the amount of guest code to maintain.
Remember, that guest code has to be implemented for every OS.
Further, duplicating e.g. ACPI information at the device level
means that baremetal and VM guest behaviour use different drivers,
which increases support and testing load.

I also note that the admin command infrastructure was designed with
use-cases where one device describes other devices.

Having said all that, it's not a religious argument, and might be reasonable
e.g. if the infrastructure is reusable to address a lot of other
problems.

Generally, one way to move things forward would be to show an example: 
- a baremetal instance which has the issue
- how is the distance discovered on baremetal
- how would a minimal emulation of baremetal look like
- why is this hard


Hope this helps,
-- 
MST

