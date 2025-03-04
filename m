Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB392202F97
	for <virtio-comment@lists.linux.dev>; Tue,  4 Mar 2025 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084820; cv=none; b=ChQgTqa7TNqbZ8F2ZYaKEd5YyYg3z+5pa7XUU0jPe8LBmWpsmBHJlms2aZkYnk6dSusYvs4k9+Wv1anZVn744G/B0LKYcv5jNolisYERa0zKm6H8l6G5ueHbm/8VALnS+xdEmDbIR/aq3oAKWoF/Hxwo1WaV5s83DrD/OT1lFww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084820; c=relaxed/simple;
	bh=67UcIda515oktNGrODIMqPGsPmqNEmMDaRfZ/y4qn6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uVJv642VNrMBEHZtEQjQOk+tAwI/Xx7ddPW0U2mFauGpDb2BenUGjNG4Uwo8MWEKeFAanNDDicgX5hzHpAIYon/4DyVBJUzlnGwj4O50TAyr1o4e9da9vD2KEvC6jURqxuzVqJ8dlsZ69XtPeeHqE5xrTV+jPo3I373wfqt0TiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GpLEPD0w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GpLEPD0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741084817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XcnTFEVUpSb4mwurctAMvx+v3QemDktjfmNQ23XL9OY=;
	b=GpLEPD0wMx0+Mx55B6h0PfpVUQ1od+U+zryN0DvQ/RMPD+Ip9Atgm8pCrVUHJX2pOaZXS1
	+mBpxd/74mBHus/ioH5FzWmqWu06isdVPoq2R9KQRFxByEyfAXBPVznAfbPZUhXJlzQyyI
	8a9ArriK/LZJXcAQfKVpzXK84r1caLA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-qhw7Tqg1OHyPFEkGo8FoYQ-1; Tue, 04 Mar 2025 05:40:16 -0500
X-MC-Unique: qhw7Tqg1OHyPFEkGo8FoYQ-1
X-Mimecast-MFC-AGG-ID: qhw7Tqg1OHyPFEkGo8FoYQ_1741084815
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-390ddebcbd1so3315844f8f.2
        for <virtio-comment@lists.linux.dev>; Tue, 04 Mar 2025 02:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084815; x=1741689615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcnTFEVUpSb4mwurctAMvx+v3QemDktjfmNQ23XL9OY=;
        b=TGJw083n/dGgqZJkCzEgn1Kq9/OdlL/abG3fShoEb5yql0ybpu5v8xxodZJxni4k6f
         Pbw0w23xv9ktl5n7vxRVg8c8WL29P9nCDnW7/vifceu3iyoqT2M3nIwIIWT2DM+Gx2vC
         r+C3C9sIVnxUo+Sb6HqJukqUSQuN09I5C/vyFB71Gg080h4GVv9WK/X1wEdTXSejRt4Y
         1Hizmw38Q3rrCDgbFGXmCxr5Kq0qhhCwtOPU26n/yzPHG9sNwdm3C0DAZvrcjBy8MGXU
         Jkp7izGJmqkROqF7GfgZpay9ogsmZZWoNApr/XeYqMoohjddq5UZbdl1pmQtBuiJImw3
         f6vA==
X-Forwarded-Encrypted: i=1; AJvYcCXQSwWcwMvy4hFOkhB+9a0hGjgr6G6pmMR+elEQ14pR0VToHUEJCN8qBz6xjuvF/2WoG5xqHmSGp2Tb4/lSMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7AagzYOgmFnfRc4QTWzzsfhbZCTFmqJc4z10Fq4jaKhgdCWId
	bkC89qKJiQB99+UBGcRWQUW4NduJWn2GUvQm1eDgdQDdOsKi9Ig8fJPdbZxgKETkj60xUc9vKGY
	qLv1vEnEJlW0z7QiYBGdpPKMFUNTm7EYlZ7i7Mh60UpUPsrHz/1M/5i+57LqZDcZ0
X-Gm-Gg: ASbGncvNBTvfOzAfrOwrZHv6RkxbgTvAIWflihDRlBKni28Y5BxK9nZ/wF1CChroSoc
	HmDwsm4SEw2Tir2+deUliegXHtIWHpMUtcom47jMsjmd98krFAEVLESDWJxc3khfNV59RIbdnL0
	dTI4aSIgGMaAQYt8vlY2Rp19tLhjfjwr5cwq8vhJtKZPWihyspeTnFSomo7tzU6RsCeONKPL2Cp
	38vvKNStvjw5zYNrSxNhdocu0vpSttv8oG04TdWTO79lGw8BCvVR55k/+0skXBkmDfsPPqgkcLH
	XghGfC9/YQ==
X-Received: by 2002:a5d:59a3:0:b0:391:cd7:82f9 with SMTP id ffacd0b85a97d-3910cd7835cmr5122196f8f.27.1741084815329;
        Tue, 04 Mar 2025 02:40:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8aBjb5dMUbkC9IihXs9a69tMAxIWN5JPoR7hBlbQfQ2jQzi+mMvPTDkfGtWmnSRZFeCcLWQ==
X-Received: by 2002:a5d:59a3:0:b0:391:cd7:82f9 with SMTP id ffacd0b85a97d-3910cd7835cmr5122175f8f.27.1741084814988;
        Tue, 04 Mar 2025 02:40:14 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1514:ea00:6409:9e94:fe6f:3eb6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795962sm17756472f8f.13.2025.03.04.02.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:40:14 -0800 (PST)
Date: Tue, 4 Mar 2025 05:40:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Sergio Lopez <slp@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH 1/3] shared-mem: introduce page alignment restrictions
Message-ID: <20250304053756-mutt-send-email-mst@kernel.org>
References: <20250217115227.4961-1-slp@redhat.com>
 <20250217115227.4961-2-slp@redhat.com>
 <CY8PR12MB7195A2AFBB7530874D228954DCC12@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB7195A2AFBB7530874D228954DCC12@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SNQV8UkOXm7upZ87ShppFWbq7ssoKVqzdnJlFMMhpv4_1741084815
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 23, 2025 at 05:21:00AM +0000, Parav Pandit wrote:
> 
> > From: Sergio Lopez <slp@redhat.com>
> > Sent: Monday, February 17, 2025 5:22 PM
> > 
> > Add a subsection for page alignment restrictions and introduce the
> > VIRTIO_F_SHM_PAGE_SIZE feature bit.
> > 
> > Signed-off-by: Sergio Lopez <slp@redhat.com>
> > ---
> >  content.tex    | 3 +++
> >  shared-mem.tex | 7 +++++++
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/content.tex b/content.tex
> > index c17ffa6..575065d 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -872,6 +872,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> > Feature Bits}
> >  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
> > for
> >  	handling features reserved for future use.
> > 
> > +  \item[VIRTIO_F_SHM_PAGE_SIZE(42)] This feature indicates that the
> > + device  transport provides information about the supported page size.
> > +
> 
> Please extend the description around "Feature Bits" section to increase 24 to 41 -> 24 to 42.
> 
> >  \end{description}
> > 
> >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits} diff
> > --git a/shared-mem.tex b/shared-mem.tex index 6e6f6c4..dd90cb7 100644
> > --- a/shared-mem.tex
> > +++ b/shared-mem.tex
> > @@ -34,6 +34,13 @@ \subsection{Addressing within regions}\label{sec:Basic
> > Facilities of a Virtio De  The \field{shmid} may be explicit or may be inferred
> > from the  context of the reference.
> > 
> > +\subsection{Page alignment restrictions}\label{sec:Basic Facilities of
> > +a Virtio Device / Shared Memory Regions / Page alignment restrictions}
> > +
> > +If VIRTIO_F_SHM_PAGE_SIZE has been negotiated, when requesting the
> > +device to map memory into a shared memory region, the driver MUST
> > +obtain the page size information from the transport and honor the page
> > +alignment constrains derived from that page size.
> > +
> A device requirement is also needed to indicate that pci capability field is only valid after/when the feature is negotiated.
> 
> >  \devicenormative{\subsection}{Shared Memory Regions}{Basic Facilities of a
> > Virtio  Device / Shared Memory Regions}  Shared memory regions MUST NOT
> > expose shared memory regions which
> > --
> > 2.48.1
> > 
> 1. Shared memory cap is already defined as VIRTIO_PCI_CAP_SHARED_MEMORY_CFG.
> This capability should be extended instead of polluting generic structure field of padding.
> 
> If its done in generic way like proposed, you need to call out that page_size field is only valid for VIRTIO_PCI_CAP_SHARED_MEMORY_CFG.
> 
> Overall extending pci cap structure is not good idea even though it may appear as small change for below reasons.
> 
> 1. PCI spec already ran out of total bytes that can be stored in the capability section. Extending it will not help.
> A virtio level extended capability is not good either due to below guidance from PCI-SIG.
> 
> 2. PCI spec highly discouraged putting vendor specific bits like this in the capability section.
> Citation: "It is strongly recommended that PCI Express devices place no registers in Configuration Space other than those in
> headers or Capability structures architected by applicable PCI specifications."
> 
> So, you should consider discovering the shared memory page size and more such fields using device administration commands.
> 
> It may sound overkill to use administration commands for 8-bits of page size,
> but as more generic and device specific things evolve, it is likely useful vehicle where you don't have to search hard to squeeze things in some existing structure like pci capability.

Or just in config space, really.


> I skipped reviewing patch 2 and 3, and would like to understand your thoughts for above considerations.

There's actually a demand from embedded folks to allow the capabilities
in a fixed offset in a BAR instead of in config space.


