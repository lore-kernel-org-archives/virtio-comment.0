Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B468BBA4A
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 14:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743605386; cv=none; b=GctaWamQqMC7RT7YxkgIzF04rb0cVKqv8rkSDISexJmTWHhwFTxtkd8hxcw9VtMDvu0q6lJZSiQzeEzi//sR4GmnTxk8Px8iHrC338/jIHDq/8cxADSTXREzU4rUpm+NLhkTSIRz6nex2/3are+UFZw/eMoStXZQwxjqNW1/YUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743605386; c=relaxed/simple;
	bh=dLFs2fceGV2na2XX0x85Ko+OEJAXCH5JvxVFwbZapuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UIGQcUUtCB+ut48OBZVTiWptJLD+b25SsSrhuimpxOaQA29azRgaKOhQCHEAx/R03QPltJHa1GOaQoWwh2tEsY97lesPBsTYCp5Smeyzzbv5lLV/iHJkVGnPdUNRR0MjSj/pv87G6l2Du9NjsCMFVPtfkNEm7/bMikLdWzojDN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LVd7zoe2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LVd7zoe2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743605383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kEV+dE0qGu73khapgtfbasjZuaN14rAqU/D0ReMPric=;
	b=LVd7zoe2OpJcH2hSPfOkMKCpS1XPdQG+rZkz9HqliQtWVg+8ADBo6nY+nHstiKYyjvSebm
	hQdzBHGhyxAL875zTlTPxHjjXEnXP5PTHZiEj9wsBmra5XY8qeECS6FEoHe9+9UbSiaPSi
	tr2JHRNfGdg5e86SKY/e3qD0cL4ELJg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-1dc4uVFSNCuXlDYh7JICDw-1; Wed, 02 Apr 2025 10:49:42 -0400
X-MC-Unique: 1dc4uVFSNCuXlDYh7JICDw-1
X-Mimecast-MFC-AGG-ID: 1dc4uVFSNCuXlDYh7JICDw_1743605381
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso46680335e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 02 Apr 2025 07:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743605381; x=1744210181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEV+dE0qGu73khapgtfbasjZuaN14rAqU/D0ReMPric=;
        b=TAYD6+tDE9vH/pMNzu+Jk+3OWNvLlmm2fdLwnHNwNJA+RFDrWmuBVRq1nbT7fl04Mc
         /TGhJ0gxnweBYqlhpfJVrt+fWn/r4hiYYf3s2n+GJ4eCC1atQeB2qi9jx2c99PPWS00o
         rZhsBME8EEx23MQIWV8wqGcCpAeMVAvSxgbJFFhxK/Rl2RMbwlUt3wkFob0sa1ayzstm
         x0z0NOhe0b445jCznTzMk92tVIo92EeT4dNvypFegQi/s5yTFkOZz13B01PZgtcAEAww
         sQJS5wxSZYizw2MoJElv/Uk+6fPAbNfBbldDw9czqi6+8eNqMMY+1Dvyq1Y8N/6FGUAX
         6+eg==
X-Forwarded-Encrypted: i=1; AJvYcCX9A2gYHF44KEuLVKFmDg79k0cZeEU9AJOQ88GspSr5AeWs2opQPXuji34XsFZ+QVKy3Uo8zO2xv74rl7l2Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxdr0Gntax8iVC9yvA08gb37YmxGR78WxDg9AlhT36/nwATMNcW
	F/tdtoo7x7a4sZUaMOaNPaEhXLZ4N5b3d3Vw5MdlhVYfEeJwdDogRZc1uj/gfap/aBwmETPhLyM
	pwDadFK4Q+ecb/wNaEp2n70QMwjuFGDUtGC8vEZ02YAayyNU4koCawniFG/1d4bRoRXOluzKU
X-Gm-Gg: ASbGnctxJr3oy1/RQH9tR1TjuEp04no+xSHStW98Lt4NHIZjWiTY0NZKIaBq1WfJNfv
	fkWzzHK1ZXY14RYCCRx22i3jVyeNBZO7XQG+QkCkJkVvK8+GXOFrrbS+035DsK7EkqrtbmkZJfC
	2T3+L5AiKbsn+gZT2XiM4OsehHF0EZsZxUwHLzKcqSoco4rkrv3nLC46E8N0ThxhFVHCejpwjZz
	JKVOBpRfgZFIAh0kJsvniAA+JyrCyDPujrWdwI5T0Fewc7z+ysQrto1221iZGWvCglhvJYLzTX5
	LEOnQRh+Xg==
X-Received: by 2002:a05:600c:1909:b0:43d:cc9:b09d with SMTP id 5b1f17b1804b1-43eb5c70c2bmr23613455e9.20.1743605380825;
        Wed, 02 Apr 2025 07:49:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0Or0rLskiv6QANhV8ex+OtVLhbupOBG1+BEHGpao7Y+NzpHZPTn81EgWiVZpH97RsYDsJMA==
X-Received: by 2002:a05:600c:1909:b0:43d:cc9:b09d with SMTP id 5b1f17b1804b1-43eb5c70c2bmr23613305e9.20.1743605380363;
        Wed, 02 Apr 2025 07:49:40 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4498sm17612523f8f.99.2025.04.02.07.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 07:49:39 -0700 (PDT)
Date: Wed, 2 Apr 2025 10:49:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Sergio Lopez Pascual <slp@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v3 0/3] shared-mem: introduce page alignment restrictions
Message-ID: <20250402104725-mutt-send-email-mst@kernel.org>
References: <20250331213711.63398-1-slp@redhat.com>
 <20250402033354-mutt-send-email-mst@kernel.org>
 <CAAiTLFUxqPp4V=gkJ9CWttoP1wSKEtp5WrE9yhePFN2PiMVa5w@mail.gmail.com>
 <CY8PR12MB7195FB85CD0B553F8C262456DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB7195FB85CD0B553F8C262456DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: En55fh2_18HiiqTg2xIfx2K4yQU-Hfrn37r4ZBpsq-A_1743605381
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 02, 2025 at 09:55:20AM +0000, Parav Pandit wrote:
> Hi Sergio,
> 
> > From: Sergio Lopez Pascual <slp@redhat.com>
> > Sent: Wednesday, April 2, 2025 2:48 PM
> > 
> > "Michael S. Tsirkin" <mst@redhat.com> writes:
> > 
> > > On Mon, Mar 31, 2025 at 05:37:08PM -0400, Sergio Lopez wrote:
> > >> There's an incresing number of machines supporting multiple page
> > >> sizes and, on these machines, the host and a guest can be running
> > >> with different pages sizes.
> > >>
> > >> In addition to this, there might be devices that have a required
> > >> and/or preferred page size for mapping memory.
> > >>
> > >> In this series we extend the "Shared Memory Regions" with a
> > >> subsection explaining the posible existence of page alignment
> > >> restrictions when the VIRTIO_F_SHM_PAGE_SIZE feature has been
> > negotiated.
> > >>
> > >> For the device to provide the page size information to the driver, we
> > >> need to extend the PCI and MMIO transports. For the former, we borrow
> > >> 8 bits from the 16 bit padding in virtio_pci_cap to hold a page_shift
> > >> field which can be used to derive the page size by using the
> > >> following
> > >> formula: (page_size = 1 << (page_shift + 12)).
> > >>
> > >> For MMIO, we add a the SHMPageShift register at offset 0x0c4, also
> > >> holding the page_shift value. Since MMIO registers are 32 bit wide,
> > >> we could have asked the device to directly provide page_size instead
> > >> of page_shift, but seems reasonable to be consistent across transports.
> > >>
> > >> An implementation of the changes proposed in this series has been
> > >> published as an RFC to the LKML, to be used as a reference:
> > >>
> > >> https://lore.kernel.org/all/20250214-virtio-shm-page-size-v2-0-aa1619
> > >> e6908b@redhat.com/
> > >
> > >
> > > Can you explain the use a bit more please?
> > >
> > > - looks like this is exposed to userspace?
> > >   but userspace can not be trusted not to violate the spec.
> > >   how can that be sufficient to satisfy MUST requirements?
> > 
> > In the virtio-gpu implementation in the RFC series it's indeed exposed to
> > userspace. This is because gpu drivers are supported by userspace drivers
> > (Mesa), and both have a very close relationship. Probably, that patch should
> > also make the kernel driver reject mappings that doesn't comply with the
> > alignment to ensure it satisfies the MUST requirements.
> > 
> > I'll do that in the non-RFC series.
> > 
> > >   what are these mappings and what are the alignment restrictions,
> > >   in fact?
> > >
> > >
> > > Looking at that patch, I begin to suspect that while the spec patch
> > > talks about device mapping requests, it is actually the other way around:
> > > the restriction is on guest virtual to guest physical mappings?
> > 
> > No. The guest can operate in smaller-than-host mappings (otherwise, running
> > a 4K guest kernel on a 16k host wouldn't be possible).
> > 
> > Shared Memory Regions tend to be used this way:
> > 
> >  1. The guest requests access to certain resource owned by the host. The
> > request can be for the whole resource or part of it. The request  includes the
> > 'offset' within the resource, and the 'size' of the window  it wants to have on
> > it.
> > 
> >  2. The host maps the resource, from 'offset' to 'size' (as received by  the
> > guest), into a certain offset from the host's view of the mapping  backing the
> > Shared Memory Region.
> > 
> >  3. The guest receives an answer indicating the offset (completely  different
> > and independet from the offset that was requested within the  resource in 1)
> > within the Shared Memory Region where the resource has  been mapped.
> > 
> >  4. The guest starts operating on the resource, now available in the  Shared
> > Memory Region at the offset received in 3.
> > 
> > The problem this change in the specification tries to address is that, in step 2,
> > both 'offset' and 'size' must be aligned according to the host's limitations (in a
> > traditional host/guest scenario, this would the host's page size). But the guest
> > has no knowledge of this limitations, so it can't adjust 'offset' and 'size' as
> > needed.
> > 
> > While this example is written thinking of virtual devices, it's certainly possible
> > to implement physical virtio devices that may have a minimum granularity
> > bigger than the host's.
> > 
> > > Does the feature affect other device types besides gpu, and how?
> > 
> > Every device with Shared Memory Regions is affected. The only reason we
> > found the issue in gpu first is because it's the most intense user of SHM
> > regions. The moment we attempted to use it on a 16K page host, the issue
> > was made clear.
> > 
> > For instance, fs is also affected, but only uses SHM regions with DAX, and the
> > latter is barely used due to various constrains.
> > 
> > New devices using SHM, like virtio-media, are sure to hit this issue sooner
> > than later.
> > 
> I understand the issue much better now. Thanks a lot for the detailed explanation.
> Given that all the resource carve out (window access), resource allocation and mapping is done through a channel outside of shared memory,
> and this is not about the page size, but about the resource mapping size,
> 
> I believe this resource mapping size and offset restrictions should be communicated via same communication channel that does this resource mapping plumbing.
> 
> Plumbing this into the shared memory capability does not look right place as it has no knowledge of steps #1 to #4 you walk through.
> Please consider using your existing resource mapping channel to communicate such restrictions.

I think the channel does not matter much. We provide the size why not
the granularity? But the documentation as written is clearly
insufficient, there's no explanation how the field is
used besides some opaque talk about "map" which is never
defined anywhere.

Sent some suggestions already.


> > Thanks,
> > Sergio.
> 

