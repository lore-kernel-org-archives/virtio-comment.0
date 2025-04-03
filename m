Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D79241673
	for <virtio-comment@lists.linux.dev>; Thu,  3 Apr 2025 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743667594; cv=none; b=UYDuC+L9ko9kkwnVxeonO2aVj89aPIfGt9lX+hem5xcx3x6VRzPM7UbIWhDN43nt0kQsR2iyYxVmUJUdYNtrtjFl4BUEqZdesrDp5obK6RsYSbasXusxYdLdebv465BdTSde8P+7/LX1ukDu/zhX596uB6pfRS17QKusOPFHHKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743667594; c=relaxed/simple;
	bh=/xFx+Ic+bN3zn2PwhRfL5AJvZA9UH292J+D2YWJnk9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=S9y1i96eKyOxBvFu/6sgtYtyae1ZqYaRd1u+npVw9mx8PlJfsCle/DFEKQj2d5E2gpx7fSAgRUhRRWZgo5I1BsdVAVR8MuhIoQwAn4Yn35HvrMbSIrYXYfHtWUyatQcetUHJ9MVwE7kwXBoJyvAmQjyS61OxKi71odnPk1Of35I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cJEzW0dX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cJEzW0dX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743667591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tVpby5MpTy2H+lhViyS2Up2HMiDcf4EebA6jwD64OOA=;
	b=cJEzW0dXnAYCXj5xdRcz5OlqT6JFLkPmN0PBksUQulH6bGZM/0D3RGX923bCLbPg8o1792
	MAIbjrT25eOLl1VM6OzqYfN5PMXhENXg3IQJBckI6ArZhExYrDOyISKCBYJg9xq1j9qWxa
	a7WAP9N5KsK2P1I1e2lfD8TMQuF0v2k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-_85hzVPQOs-4fBwkL8G4Tw-1; Thu, 03 Apr 2025 04:06:30 -0400
X-MC-Unique: _85hzVPQOs-4fBwkL8G4Tw-1
X-Mimecast-MFC-AGG-ID: _85hzVPQOs-4fBwkL8G4Tw_1743667589
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf327e9a2so4502815e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 03 Apr 2025 01:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743667589; x=1744272389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVpby5MpTy2H+lhViyS2Up2HMiDcf4EebA6jwD64OOA=;
        b=I86iAaM6QTHfk4P/lSfwgLhftIMQldV2CiCQFlzy7jlHf3MsUTHkvlWawi3uN0BeWT
         CeYp9PC0fKr8WjiDJt+RCmPI6k+iUeFwi636jzk5qafgtMOQebPJL6M30M8TvkisMe6z
         D+RAWgP+z8FpgifC/hcLc8UWF126xbK2Ma4ahVPdKKBivrCUxtrx1ebZobKbCfJofl4z
         tUklagYt9f+LD7lJ84ALnTWrgogHLZSDZLYMcjRk7LQ+fmmfCqoOrv7aobEK7McIeleU
         N//yW6snFgoyE8UZxjAUqCJK0BW+WDBGWSvd9HF65W47FIodNCcfcKyBaErq7CXG/KBi
         Tplg==
X-Gm-Message-State: AOJu0YwcG9WsRaJuaBxX3jFny5c6e6PctN86Uob72z/50vamRQO9yeja
	ttxV7uuSLvE5ozXGLkq0vjY8B76+1fXXvzdREraOtxefkvjwghtd9Bd16S5+Pg/+SftIk4pBZAe
	xamWgKKTrpxBgaeTuYV0kKT1yMysvV1H1i0HFYzs/sufbNaUtXvyIUB97zUA2NmZw
X-Gm-Gg: ASbGncuggI61GeP3oRwdiNdTo2sorVZL4fex8kY9zI79jduXtiPU+HbUuQFiR+f+sJT
	R8H4N5DH8ckTe8Z3KClnBRT9kSIBSWS0RsbIqqqAzZqTLlQLF05zbHIv4JvAWuzqqK2Q7njNdqs
	6CodgF4Og3e/T2Q+cg7/xMg4xJR28SpGpwUbZA9u88jzO7o7ViqWRtGKIhyg1Xi0I2iQ9v1ReU7
	79IEfg3dO8hLTUFOTaq1GF74Et3HUZL16FLVfTAWtSqsbiyc7FT8JXT/XBYlfDOQG+EZQgL1dEB
	A7R6fUDjjQ==
X-Received: by 2002:a05:600c:c0d:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-43eb5c18096mr64081725e9.3.1743667589081;
        Thu, 03 Apr 2025 01:06:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSk+3FNI4XoJtk1WbAerEh6w/2rKShN+FbjFoIYMw/3yvtHFubr3pQ9Q3sZAFwZyG4K7h9sQ==
X-Received: by 2002:a05:600c:c0d:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-43eb5c18096mr64081345e9.3.1743667588692;
        Thu, 03 Apr 2025 01:06:28 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795db7sm14365445e9.25.2025.04.03.01.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:06:28 -0700 (PDT)
Date: Thu, 3 Apr 2025 04:06:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: virtio-comment@lists.linux.dev, hch@infradead.org,
	Claire Chang <tientzu@chromium.org>,
	linux-devicetree <devicetree@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	=?iso-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	graf@amazon.de
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
Message-ID: <20250403040059-mutt-send-email-mst@kernel.org>
References: <20250402105137-mutt-send-email-mst@kernel.org>
 <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>
 <20250402111901-mutt-send-email-mst@kernel.org>
 <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org>
 <20250402114757-mutt-send-email-mst@kernel.org>
 <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>
 <20250402124131-mutt-send-email-mst@kernel.org>
 <eaef09ab218900a53347987a62fee1787283d9ed.camel@infradead.org>
 <20250403032729-mutt-send-email-mst@kernel.org>
 <2f1b06fea126352b153faf44911a7066c83faa82.camel@infradead.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2f1b06fea126352b153faf44911a7066c83faa82.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5bOQuhxtca-TL5-PvIWCX8n4iUB6rJ_EKtma8HppmPA_1743667589
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 03, 2025 at 08:45:22AM +0100, David Woodhouse wrote:
> On Thu, 2025-04-03 at 03:31 -0400, Michael S. Tsirkin wrote:
> > On Wed, Apr 02, 2025 at 06:10:53PM +0100, David Woodhouse wrote:
> > > On Wed, 2025-04-02 at 12:43 -0400, Michael S. Tsirkin wrote:
> > > > 
> > > > yes.
> > > > 
> > > > I know a bit more about PCI, and for PCI I prefer just not saying
> > > > anything. The platform already defines whether it is behind an iommu
> > > > or not, and duplication is not good.
> > > 
> > > Not a hill for me to die on I suppose, but I would personally prefer to
> > > spell it out in words of one syllable or fewer, to make *sure* that
> > > device and driver authors get it right even though it's "obvious".
> > > 
> > > After all, if we could trust them to do their thinking, we would never
> > > have had the awful situation that led to VIRTIO_F_ACCESS_PLATFORM
> > > existing in the first place; the legacy behaviour we get when that bit
> > > *isn't* set would never have happened.
> > 
> > Oh, you are wrong here. It's not implementer's fault.
> > virtio just was not designed with real DMA
> > in mind, and micro-optimizing by bypassing the DMA API
> > was very much intentional.
> 
> That's one point of view, I suppose. In the early days of IOMMUs, and
> DMA ops coming to mainstream platforms, we found a *lot* of device
> drivers that had the same "micro-optimisation" of just handing physical
> addresses directly to devices. We called them 'bugs' though.

Indeed. virtio was developed way after these days though.
We just thought we are being clever.

> And the thing that was different for virtio-pci was that the host side
> had the *same* bug, as I recall, so we had to introduce a feature bit
> to declare/negotiate the "natural" behaviour.
> 
> But we're a long way from the original topic here.


In a sense. But see the cache mode discussion: if this proposed
interface can not be implemented efficiently on actual hardware, it does
begin to look a little bit like repeating the same mistake.

> > > > For mmio it is my understanding that the "restricted" does the same
> > > > already? or is it required in the spec for some reason?
> > > 
> > > No, it's exactly the same. But I still don't trust driver authors to
> > > realise the obvious, or VMM implementations either for that matter.
> > > 
> > > I'm not sure I see the *harm* in spelling out explicitly for the hard-
> > > of-thinking.
> > 
> > I don't want people to make assumptions, like crashing if device is
> > behind an iommu or whatnot.
> 
> Why would that happen? If we explicitly document that "on-device memory
> access don't go through an external IOMMU that sits all the way over
> the other side of the PCI bus between the device and system memory",
> which is what I was trying to say...  it doesn't *matter* if the device
> is behind an IOMMU or not. It doesn't ever *do* any DMA on the PCI bus.


Saying this explicitly in the pci transport like you write here is fine.

> > We can go with something informative.
> > 
> > "It is expected that for most implementations, when using this feature,
> > the behaviour with and without ACCESS_PLATFORM is the same"
> 
> I'd prefer to say nothing. Saying nothing relies on people to do their
> thinking and realise that on-device access doesn't cross the PCI bus.
> This version actually seems to hint that it's a *choice*, and hints
> that it might be OK if the external IOMMU *does* intervene in on-device
> memory accesses.
> 

Nothing is fine, too.

