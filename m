Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2454F1F09B3
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 10:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502715; cv=none; b=Mo5obYXl83/U0VhRja4yvAgaggswomg+k7TLKXW2GMdEYMQpvdoBqIWVPcE5MkanMsWUDIfLJi2OcNr4O2GRBnpD03DVvhAU5nA8rkK+yaPXVKcKJWlb1deEiQTltTALf2bGx3kt/G0uUnpGvohuIX6m2LOjtjhoHXbM6yrYmJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502715; c=relaxed/simple;
	bh=eOwJNQ3vsqjdRnDtDBbQHfLd3DHZ3sWsBrlsMFPxOqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fgmIImxVR6zU2pdF2jVdGKizbcDL3MCISxna3NyPwEus+56wb++KGthWwo73jOROj7FeqNp7LgZPUKIjXtSKZtqJGDbHht1Fc1ZobDkTJLuZMkw053yxRyCnCJheFCzG/6tCHM/oLYWabLh3SEix2x4hJ4G2nK2QVi9A5DKoLrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=adICey+/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="adICey+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743502712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1MFwm15Q+NGtoA0ksx5pKCeLECss2DUaUNyu/c2KBq8=;
	b=adICey+/WLCYaXvB0/EU2+10msJpeiyhNKpgArbXa6h9AdXjwzH+ezAnV8bqOaiuAQCQJI
	l0407YYFguEZZKDmFV/GnEws39XjDM3DWgsGRrWFH1MNhodFdTYIgTY1AMNVMpC55K8XKW
	mCBBFPczqP+0EfljXFrxOYjIOdR+l20=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-iGfCirnaOnOUOGiuE6Dbaw-1; Tue, 01 Apr 2025 06:18:30 -0400
X-MC-Unique: iGfCirnaOnOUOGiuE6Dbaw-1
X-Mimecast-MFC-AGG-ID: iGfCirnaOnOUOGiuE6Dbaw_1743502709
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d22c304adso27558255e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 03:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502709; x=1744107509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MFwm15Q+NGtoA0ksx5pKCeLECss2DUaUNyu/c2KBq8=;
        b=KnzIjqdRDdljGGGW72a+nF6c88NWVjGvKyEVKSjHGcqUIo/g8w6AA4rUSDmrwgL9k2
         czQGMDPlI9Q1sjOoxd6wBerqGjsFvrcZ7EUWlRgHQQik2Og2WpU7Hi88S6UU+ilEGxJ9
         P1tJhoqwtAkWjy/gf09bbvwADO8k0VSOdhTuw+V/Cbgs3ohvXsazoHdheOd3VFkEX9Yv
         6LCGwI35QfFMdTTUz4KKRBcxndvPnZqJOAmnexBhdiOj1EyxZCP/MAElJyDwzUG8cryq
         Dz46rEpvTxDKja3y90h0E1iQisnvw0JMNj2x0aaUjwnQD/hgygrFtrhxV6ceBwFghv5w
         /UBA==
X-Forwarded-Encrypted: i=1; AJvYcCU2PYvRR2RstnnT7Zi5N3Zn4TnSdRtOaSnH8pycgfj3pP4CnpFt3BiyUA03yq0YSV++WgNBGcfW8KOm17m6VQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwoXo36t9WfJRKKxrPeby5RTac7aSChzYBAgOT7nD7ESIo644rj
	TQK3ozlkJStSNaDAYiihNn6pUhN2bAixbdNm+MTUcVLkgmiz2Mbi00KFaLJeQly5jMASg9B4Blx
	KVJHPNeOuitfqVNf1JS+1JhkY3J2tUqgXBFP3GilhbJQoSRDblgD3nTO4waL3afdL
X-Gm-Gg: ASbGncuar1wZ5t7fH4amkM4vBU/FZtbbL+k+GPIrrRU4w574o8GsfDtE8keSCIudJNy
	Yi1j3fChsYCoQyogPdtiKdTvhNh0+VcWQ40o4Repte7VZuUn5DN/9qF8xPNFK3L2WyEM//ZtZjw
	KTHBMY9/GY/ztsmyQ7OUhyhTOvxS7tdKnwdYvMYyMkvijcPwCaHQ/kSh7wBwY5T85QMgP/UIubW
	cNi12lk54slfdNAqrs+zCj7cJvuj4Ttr0cVSxk0Ea3ZJUyZsyifyS8Xca0lPML0shfp0fZ20poW
	ohrLSbLTfw==
X-Received: by 2002:a05:600c:47c7:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-43d91170a61mr98202775e9.11.1743502709104;
        Tue, 01 Apr 2025 03:18:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqIxsMKnFxvv2JywoS4LhoUzdJ0f1+t8Hgl93Cr0MrwDFGoQf/lPS8eRVzP2NMlU6wg5WZZg==
X-Received: by 2002:a05:600c:47c7:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-43d91170a61mr98202615e9.11.1743502708713;
        Tue, 01 Apr 2025 03:18:28 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd774bsm151257225e9.23.2025.04.01.03.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:18:27 -0700 (PDT)
Date: Tue, 1 Apr 2025 06:18:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Sergio Lopez Pascual <slp@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
Message-ID: <20250401061541-mutt-send-email-mst@kernel.org>
References: <20250331150548.50595-1-slp@redhat.com>
 <20250331150548.50595-2-slp@redhat.com>
 <20250331121538-mutt-send-email-mst@kernel.org>
 <CAAiTLFXdYDSgZnYAgGC-FpMcyOnqBZpiTrHOk=4x_jFiRzkcbg@mail.gmail.com>
 <20250401050828-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195A0BA1C5D6946196D65DCDCAC2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <CAAiTLFX_RmzJfuLaJ+95S+k6Y20o62Hzyxwe+HwHRzkob=NCkA@mail.gmail.com>
 <CY8PR12MB7195B8C5D33157328BA9DA34DCAC2@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB7195B8C5D33157328BA9DA34DCAC2@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R7bMZcOqmqj9BhQ2xeoJk6ljoVjVZSqaSci3o27AiMY_1743502709
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 01, 2025 at 09:37:21AM +0000, Parav Pandit wrote:
> > From: Sergio Lopez Pascual <slp@redhat.com>
> > Sent: Tuesday, April 1, 2025 3:04 PM
> > 
> > Parav Pandit <parav@nvidia.com> writes:
> > 
> > >> From: Michael S. Tsirkin <mst@redhat.com>
> > >> Sent: Tuesday, April 1, 2025 2:45 PM
> > >>
> > >> On Mon, Mar 31, 2025 at 09:40:37AM -0700, Sergio Lopez Pascual wrote:
> > >> > "Michael S. Tsirkin" <mst@redhat.com> writes:
> > >> >
> > >> > > On Mon, Mar 31, 2025 at 11:05:46AM -0400, Sergio Lopez wrote:
> > >> > >> Add a subsection for page alignment restrictions.
> > >> > >>
> > >> > >> Signed-off-by: Sergio Lopez <slp@redhat.com>
> > >> > >> ---
> > >> > >>  shared-mem.tex | 6 ++++++
> > >> > >>  1 file changed, 6 insertions(+)
> > >> > >>
> > >> > >> diff --git a/shared-mem.tex b/shared-mem.tex index
> > >> > >> 6e6f6c4..2021083
> > >> > >> 100644
> > >> > >> --- a/shared-mem.tex
> > >> > >> +++ b/shared-mem.tex
> > >> > >> @@ -34,6 +34,12 @@ \subsection{Addressing within
> > >> > >> regions}\label{sec:Basic Facilities of a Virtio De  The
> > >> > >> \field{shmid} may be explicit or may be inferred from the
> > >> > >> context of the
> > >> reference.
> > >> > >>
> > >> > >> +\subsection{Page alignment restrictions}\label{sec:Basic
> > >> > >> +Facilities of a Virtio Device / Shared Memory Regions / Page
> > >> > >> +alignment restrictions}
> > >> > >> +
> > >> > >> +When requesting the device to map memory into a shared memory
> > >> > >> +region the driver MUST obtain the page size information from
> > >> > >> +the transport and honor the page alignment constrains derived
> > >> > >> +from that
> > >> page size.
> > >> > >> +
> > >> > >
> > >> > > will make existing drivers autmatically incompliant with new devices.
> > >> > >
> > >> > > we generally avoid things like this.
> > >> >
> > >> > This is the reason why in v1 this was gated behind
> > >> > VIRTIO_F_SHM_PAGE_SIZE. But from the discussion on that thread, I
> > >> > understood that, at least for the PCI transport, it was preferred
> > >> > to have the page_shift field unconditionally:
> > >> >
> > >> > https://lore.kernel.org/virtio-
> > >> comment/CY8PR12MB71950314C5683EB7CFF081
> > >> > 5BDCCA2@CY8PR12MB7195.namprd12.prod.outlook.com/
> > >> >
> > >> > Did I misunderstand the conclusions?
> > >> >
> > >> > Sergio.
> > >>
> > >> I think Parav missed this compatibility implication when he said:
> > >>
> > >> 	So to obtain a free information, feature bit is not necessary, this
> > >> can be self-
> > >> 	described in the pci capability itself.
> > >>
> > >> Parav, this is about the MUST requirement referring to honoring
> > >> alignment, not about obtaining the information which indeed can be done
> > without.
> > >>
> > > It can't be MUST requirement as it breaks the driver which will not negotiate
> > this feature bit.
> > > So my understanding is, the device indicates one or multiple alignments it
> > supports and driver can choose which alignment it wants to use to get better
> > performance.
> > 
> > Not exactly. The device indicates its supported page size (just one), which
> > implies the driver needs to honor the alignment restrictions derived from that
> > page size.
> > 
> A device may not know on which OS flavor or which cpu flavor it may run.
> So it is better for the device to expose multiple supported page sizes alignment and driver can choose one configured on the driver side.

I doubt it's a thing though. Device has minimal alignment it can support
and that's it.  What are "multiple page sizes" and why would device
care?


> Keep in mind that often device != host (device can be actual device too).
> 
> When the driver page size is bigger, it can always align to the smaller page size told by the device, no?

What if it's smaller?


> > Just to clarify, this is not a performance improvement. Today, there are
> > devices (i.e. virtio-gpu) that doesn't work when the host (device) is running
> > with on a system with a bigger page size than the guest (driver).
> > 
> > Thanks,
> > Sergio.
> 

