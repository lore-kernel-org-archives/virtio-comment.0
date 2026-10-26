Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792973974;
	b=u20uUqAoyUq63ZPf1w6Sh2oWZ3yRbLPaPjX8DleimqCv5uTa7f3Px5AVxN4kqQc3lvkc
	 oBf0pkQoFKIrvP6Opq/MQcvwkm5ge222N4YnoCEIrZkRtMz9Af5th46+yRydQJgo4OOTY
	 8yz7ICQbFDw5Q/O2ktukwIrKVQzH+n0jWWc0GlYriKnugPo2M/nZyU1DUB3p9R3Q5PfrC
	 G0hTmfXHFhAgRjNY2O4v1ercuNrEnP7sTaI4m7WKQjR81qDNXPH7isKYkrGWa5abT0E94
	 0NDRfy1AgTssYNtImjZcLA4P0hKn/xJ8SNNaK7L1Qg65TsN2mNqOtN3jqtDt1ULlvHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792973974;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=UuDZU2l0/plv8oJ7vGm49nlGR3QZROefBx4Sih+ejb8=;
	b=h/ldqgyGawNX/mcJf5c43ksn7lDCQ2Q/OLK6pF8FD69Z9+bHnV677ggPH2BOM0u4eiWH
	 Ff3Z/xDdmBpOFrh37yq5MDrh535zNQWAD8Z1eOo4Q5iYrf9P1KjuEHqxx9HUHFF8sTLDN
	 22hFTDB1Q6nthr5L9htgi6VAB2ArU5Zfb3965+pXvZMGtNLPT1T9Awe0tn2iUejJIXU8c
	 lwoRQvyoLC2JQjQyvEiFT+Y1pVw/+V+9VBoE9IlAL5BKs9zaHviDOaYidKRfaN6nI9ws7
	 l2jol2KgxrbJd4OnObQzJWg/iT5DggukJUrYO7+fHG9LOg7kNPhWx+W9daQ92xmMDfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="em2UF/9v";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0188606A322
	for <virtio-comment@lists.linux.dev>; Mon, 26 Oct 2026 00:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0188606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=em2UF/9v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792973972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UuDZU2l0/plv8oJ7vGm49nlGR3QZROefBx4Sih+ejb8=;
	b=em2UF/9v5to5P1IKXlqUrLSbiKJK6kCUrgH/JAKK1PzHqo4hkHy5Inp2pkXhhdM1Lm4X91
	2HycP3MHW/r+6GBZFF5XsDX1LZRm5fSJu3fTIRi/wTSzqIWwOJBVFeKu9RONrgKoOjzqVi
	E/6aomhAfragle0ms/OhEUUsl0YxRIE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-664yc9bgPI-xkDX49JrEGg-1; Sun, 25 Oct 2026 20:19:29 -0400
X-MC-Unique: 664yc9bgPI-xkDX49JrEGg-1
X-Mimecast-MFC-AGG-ID: 664yc9bgPI-xkDX49JrEGg_1792973968
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso15011695e9.3
        for <virtio-comment@lists.linux.dev>; Sun, 25 Oct 2026 17:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792973968; x=1793578768;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UuDZU2l0/plv8oJ7vGm49nlGR3QZROefBx4Sih+ejb8=;
        b=kLvv90k2Z1ryDey3dIUvV7Pe9FzGa6yzjORHa3IKJa6D01Q4B4of1dS6cK/VR5dfyl
         jLEFZ20Em8e8obhvA0qtnPdVlgYY51fDo/LA+5VGqrvyMJPv/nnk+KOY1q3OFhXNLPqH
         YDAr8ylEOjA9sRPXwxlsldveg/aho8CiqBVHoD4xLud96tLkqJcenGP9Ile/LqzoAYOI
         6J29QSjbHDqZzNQbLx/pTGMFD1xX7krI8VZ9+NxTFK4P9IR4l/hZj8qVicAAIz7PDNoU
         VqUZbpmPPDBbZ/aOD7MxUk4jCdqembwho9aGgYov1Vvjore76vWz41ckJpaAtViPzmFI
         czbg==
X-Forwarded-Encrypted: i=1; AKwUvBzh48upwqEKrsfR/xINuKxeDcAO0meD2Y+tuHMQO+IRJ3/8/ROG+68akUEeoiwhnOsDi9vmoYI3FzRotm+n+w==@lists.linux.dev
X-Gm-Message-State: AFq9FYLmhQ4Ellvq2YLc8jP6bbwiUyOJw9yQeGZ58YLjwX+QD0/pVLjY
	XM6vgBbMomqI6y3My0GoPQ7qVonFnW/Wx4oVomY30h6PyT746u76rVG3DrfM4e85TsBNYJcrjra
	ChBrqOnoVwGGkxQCREOi7vPe/1BFYvgIJdRTNudAHaMMgqLwGEo1NUJNyt4Nun47301ZG
X-Gm-Gg: AYBFou0hMbg7OeqsPsqJY/YjSNx84iKxUSIJIQrzP0nVuHZrz3uEUoZNwcXsNnUgZG5
	1EDPLU07CJnfgscYptAJ5H7x0o4lxIr1hqdYsID6EHE9xriwPLO50SXmrXcp/bfwlJEay1HnKbG
	j50BPtUv+PwAUvjlQSFoa5Dgc3TkYp/d4PviBUIwVuaHP8OuFt5X9xJKGb98Vi4HjndNYgr2MSy
	RjW1omtBTvzPKlwlpZnxw9Gti4Fk016Uz3fbjgSA1N5V9hzoKy5sGr5padCuU6yu1Z3J/fkN8io
	axwiRz8IerD8+jPMIDDi1WoImXFq032Vs6M4qLLvGN9WjQvu1c7d+8e9kfn18GdJM7g=
X-Received: by 2002:a05:600c:8184:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4a35aca6b82mr83802715e9.26.1792973968242;
        Sun, 25 Oct 2026 17:19:28 -0700 (PDT)
X-Received: by 2002:a05:600c:8184:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4a35aca6b82mr83802215e9.26.1792973967640;
        Sun, 25 Oct 2026 17:19:27 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4be6sm11667327f8f.37.2026.10.25.17.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:19:26 -0700 (PDT)
Date: Sun, 25 Oct 2026 20:19:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ruben Hakobyan <hruben@meta.com>
Cc: David Hildenbrand <david@kernel.org>, Breno Leitao <leitao@debian.org>,
	Atish Patra <atishp@meta.com>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH] virtio_balloon: batch large descriptor chains for page
 reporting
Message-ID: <20261025200808-mutt-send-email-mst@kernel.org>
References: <20261023042737-mutt-send-email-mst@kernel.org>
 <20261025235641.601299-1-hruben@meta.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261025235641.601299-1-hruben@meta.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: X6oQvktJ2XtRHzBUSMmqG8Bgbk4FlCWJN3-mCpOcLLI_1792973968
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 25, 2026 at 04:56:41PM -0700, Ruben Hakobyan wrote:
> On Fri, Oct 23, 2026 at 11:04 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > Great patch, thanks!
> >
> > On Fri, Oct 23, 2026 at 01:19:19AM -0700, Ruben Hakobyan wrote:
> > > The virtio_balloon driver reports a scatter-gather list of free pages
> > > to the VMM so it may discard unused pages.
> ...
> >
> > It's not just a question of convenient, is it?
> > Rust is buggy wrt to spec as it allows only U32_MAX.
> > So it is also to make it work.
> > So should we maybe fix Rust to be spec compliant and allow 2^32 too?
> >
> > I think we should definitely recommend U32_MAX in the spec
> > because otherwise it can not fit in the used length.
> >
> 
> Thanks for the review!
> 
> Sounds good to me, I will CC virtio-comment@lists.linux.dev as
> per your recommendation.
> 
> Agreed that Rust-VMM should also be fixed in case 2^32 needs to
> stay the hard limit. I think here for the driver, we can be more
> conservative as long as we stay below 2^32.
> 
> ...
> 
> > > ---
> > > The wording in the spec is a bit ambiguous because it uses "chain
> > > length" for both descriptor counts and the total size of the memory
> > > ranges referenced by the descriptors. My read is that the byte limit
> > > applies to the sum of descriptor lengths, which is also what rust-vmm
> > > checks.
> >
> >
> > quote what you are referring to please, also in the commit log
> > not after ---.
> 
> I will update with quotes in v2, thanks.
> 
> >
> > I would also CC virtio-comment@lists.linux.dev - spec should recommend
> > U32_MAX.
> >
> > >
> > > Another option I considered was to limit reporting capacity based
> > > on the largest possible block. E.g. for 64 KiB pages, the largest
> > > block is 512 MiB, so limit the reporting capacity to 7 to stay
> > > below 4GiB. Although simpler, I found that the time to reclaim
> > > was quite a bit longer.
> >
> >
> >
> > So I was going to apply this actually:
> >
> > https://lore.kernel.org/all/b541ff170218bd5d45b551b5132e7cf2c490d761.1780906288.git.mst@redhat.com/
> >
> > which makes the question completely moot.
> >
> > Does this have any effect on performance?
> >
> > Thanks!
> 
> Thanks for sharing this. Yes, this would also make sure we stay below
> the limit. Regarding performance, I tested this on QEMU and it calls
> virtio_notify() after each completion.

Who, QEMU does?

> Using one chain per entry
> creates more chains, so QEMU can use more CPU time to reclaim the same
> amount of memory.
> 
> If we go with this, I think a QEMU patch to batch notifications
> could reduce the overhead. Alternatively, I think we could create
> larger chains here but make sure they stay within the 2^32 limit,
> and keeping your approach of queuing them all before kicking.
> 
> I am happy to share a patch with my thinking here.
> 
> ...

Oh. It's just the driver being silly and never disabling
callbacks.

pls just add virtqueue_enable_cb_delayed and this will fix it.

