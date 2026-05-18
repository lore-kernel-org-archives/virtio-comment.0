Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717B21DD877
	for <virtio-comment@lists.linux.dev>; Mon, 18 May 2026 00:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779065988; cv=none; b=AtppPj2UX4FSU8DCUlmc81gdswI4Ids/QoFQAgtKLsWVKETleHLLWcJKKiDhHzi1mLmSTRICFPKCBkVNZXB9OCmCTZaNgBSdxQCq2AjXClr4wJbRtXxO2YsnDNhhKRFWSWyQbEAuF93nQ3PEY9X//d3htFTLIxgMvjsLPlZOGrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779065988; c=relaxed/simple;
	bh=lb+krk5RfPzWQ8TZNyMoWwffxPcnjYvZHaaKaJjhTLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SzbSj1IG+IHyLMhpN2c1Ij2rc4DgzIDg/reDy8pdh/qLQWMcceX45S+UpYTUNtgmQ1SKudCVai9UiKHVxDdBfSFeKRppvnJuuWyv3qXYI4GBTYymWRWLTjdyM6i0zWdX9hgFOOUTn9nUJ3quNYhu/3ciLUStscurqP4V+9zXK7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WGePYJjZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WGePYJjZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779065985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6h/yUhaBSO/qW+GMyfB894iQlRWJMhHJnRJLhZB0fXc=;
	b=WGePYJjZXqAMhoaTLMP2VSv/QdFXEqt5Wq0Mw67+RlyJTfyA8kGaVkpIqSR0NYrCKh+FPr
	4BJrROUiFsM83riCQY6Q0AnjTFseJWUxaIYmQRkJ94jMJew1gphlAxXZ6+hHaJeWuEsKc2
	n5bUT0f9IDE2QVpJ5B1DJpp3xgNOTPY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-qu3K9VnzPwmsEgkD-OS_Bg-1; Sun, 17 May 2026 20:59:41 -0400
X-MC-Unique: qu3K9VnzPwmsEgkD-OS_Bg-1
X-Mimecast-MFC-AGG-ID: qu3K9VnzPwmsEgkD-OS_Bg_1779065980
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-45e80183514so53520f8f.3
        for <virtio-comment@lists.linux.dev>; Sun, 17 May 2026 17:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779065980; x=1779670780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6h/yUhaBSO/qW+GMyfB894iQlRWJMhHJnRJLhZB0fXc=;
        b=G4TAubgDoYR+c60dDjZhIthH9a438BaqN403rU22kiT9Z5cVX2Qx/a9uzGrvfWOjjL
         pXBBxMWdh3F6vnYaSA8P6H66a1a6Jo0ZhF4vZBnREY+khspXP8ltbwq8Y0VNc91lycTq
         JjhkfqIwVIPlWckIIZMdvQVY0yOaVrsqFw6lzc3guvnSwRbyi7dtOl0p/3KUzQJ0MtfR
         nefcjAvS1zqI7/N/IbvrpH0/oOCBX7BPfvSBCycGhVNgfviz5M6zv/kvCznUy/qsJrws
         XFWdKNXLZ81puLPUFRGUzPz9zJqzrLmE9BXdx4oyoZdcj0XLIo2wfKlDEWrxdRfl4+x1
         m0Kw==
X-Gm-Message-State: AOJu0YzSyHiR0t79mk4JUmTssPPExU0SdwUIyxIxBefnAZYD3hZOIYj6
	AyD3THas8kk+WyAjoMWUCSbB31vhqMA2SneZkEygI6o+B871G9Ug8Ui9Z5+CbYLAom402ITgAgX
	LF9WOOOEBH2mIhKODyFtjDzYQLjQo/hRPScRof+cvbllRta5/0wOu8pOMa8zFD3A9au+G
X-Gm-Gg: Acq92OENaCAs3NANrw7r4n5GFcYXYBgXnk5Ci/SUTiNAbYjIwZ7HzUMuDAfQigJTHyr
	RgOAqeXy3MBeQZf+oqqiJtqHFCdEAvDl6ceyy3jn2E9DNpZMjK7Bcg+W8eaekK+zQ42P8dRRUJ/
	tvF17UuoSW0eIlel+ww7bIzwJbFvZJbYebSZN6pUyoHhFnfFPXYDEanbetKD219/OXcGt2RHIgn
	AqFH676fHJd+A7GZbIw3H8ksYH5wvwXrT0WFutixeB2VLk/EpkTFi4W4GCq1splhT3U0pNh+mcc
	CaBq/DhjJUaoTIcHOfgMls+h0bhYjNq1aqf5mPA/9ZbN+O4y0n5BPu7zuw9nsu9B3M8l6p6ZvOU
	TCvF2M5/l8XFi4y4AA3aX29pcRZ+PpBs3gL7wHumfAVaxDkQBsHE=
X-Received: by 2002:a5d:5889:0:b0:45e:5b92:1e45 with SMTP id ffacd0b85a97d-45e5c60d55dmr17943336f8f.40.1779065979677;
        Sun, 17 May 2026 17:59:39 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:45e:5b92:1e45 with SMTP id ffacd0b85a97d-45e5c60d55dmr17943315f8f.40.1779065979180;
        Sun, 17 May 2026 17:59:39 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm31454574f8f.20.2026.05.17.17.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 17:59:37 -0700 (PDT)
Date: Sun, 17 May 2026 20:59:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [RFC PATCH] ring: Forbid using descriptors in two chains at once
Message-ID: <20260517204742-mutt-send-email-mst@kernel.org>
References: <69fc1ea7.050a0220.306431.9eeb@mx.google.com>
 <20260507013527-mutt-send-email-mst@kernel.org>
 <adc807b9-2c95-4ddc-8243-0ed2bf5ac651@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <adc807b9-2c95-4ddc-8243-0ed2bf5ac651@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S_-2ScY5G2GAlPXhcoQMwB1YJ7al7DaxeAAkypcwtqA_1779065980
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 17, 2026 at 04:05:28PM -0400, Demi Marie Obenour wrote:
> On 5/7/26 01:50, Michael S. Tsirkin wrote:
> > On Thu, May 07, 2026 at 12:34:19AM -0400, Demi Marie Obenour wrote:
> >> Using the same descriptor in multiple chains at once creates
> >> difficulties.  If the descriptor is device-writeable, this is begging
> >> for data corruption due to conflicting writes from the device.  Even if
> >> the descriptor is device-readable, the mere possibility requires devices
> >> to use more sophisticated internal data structures.
> > 
> > The natural way to index requests is by using the avail ring head,
> > not descriptors, though? I suspect it's about device memory being
> > limited, etc. But pls make it more explicit.
> 
> It's about being able to *not* use scatter-gather I/O, and instead use
> a single I/O request for each descriptor.  io_uring makes this very
> cheap.  However, it requires that the lookup key be (avail ring head,
> descriptor index) rather than just (avail ring head).
> 
> The latter has sufficiently few possibilities one can just use
> a bitmap.  The former isn't.  This means using a memory pool, heap
> allocation, or associative container.
> 
> >> Require descriptors to be used in at most one chain at any given time.
> >> Indirect descriptors can be used if support for huge batches is needed.
> > 
> > does this imply indirect are exempt from this rule? the text
> > you propose makes no such exemptions.
> 
> It means that indirect descriptors can point to huge numbers of
> descriptors, rather than just what fits in the descriptor ring.

Nope, the spec limits the chain size to ring size.


> >> Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
> >> ---
> >> I have not checked whether this will break existing drivers, so I'm
> >> marking this as RFC for now.
> >> ---
> >>  packed-ring.tex | 6 ++++++
> >>  split-ring.tex  | 6 ++++++
> >>  2 files changed, 12 insertions(+)
> >>
> >> diff --git a/packed-ring.tex b/packed-ring.tex
> >> index 3ee55a18d024d4da1a48d522e98ea563b9809b1c..8fd5a770c7ca4e6f60911b2861e00a273a69ea73 100644
> >> --- a/packed-ring.tex
> >> +++ b/packed-ring.tex
> >> @@ -473,6 +473,12 @@ \subsection{Event Suppression Structure Format}\label{sec:Basic
> >>  
> >>  This implies that loops in the descriptor list are forbidden!
> >>  
> >> +Drivers MUST NOT include a descriptor in a chain if the
> >> +descriptor is already part of a previous chain whose processing
> >> +has not completed.  This implies that the total number of
> >> +descriptors submitted to the device, but not yet processed, is
> >> +limited by the queue size.
> > 
> > I do not understand what is this trying to say for the packed ring.
> > How do you include a descriptor in a chain twice - the ring has to
> > wrap around, no?
> 
> I don't think you can.
> 
> > For that matter, I do not think "This implies that loops in the
> > descriptor list are forbidden!" makes sense for packed either -
> > I think we copied it from split by mistake.
> 
> Fair.
> 
> >> +
> >>  The driver MUST place any device-writable descriptor elements after
> >>  any device-readable descriptor elements.
> >>  
> >> diff --git a/split-ring.tex b/split-ring.tex
> >> index de9403882df1e6d20e16ec983ecf0a46d39efa6b..014e279ef1da7653c7051e3a24c6169fe8d51983 100644
> >> --- a/split-ring.tex
> >> +++ b/split-ring.tex
> >> @@ -223,6 +223,12 @@ \subsection{The Virtqueue Descriptor Table}\label{sec:Basic Facilities of a Virt
> >>  Drivers MUST NOT add a descriptor chain longer than $2^{32}$ bytes in total;
> >>  this implies that loops in the descriptor chain are forbidden!
> >>  
> >> +Drivers MUST NOT include a descriptor in a chain if the
> >> +descriptor is already part of a previous chain whose processing
> >> +has not completed.
> > 
> > what specifically is "include a descriptor in a chain"? something to do
> > with making a head available? and what is "whose processing has not
> > completed"? something to do with a head not used?
> > 
> >>  This implies that the total number of
> >> +descriptors submitted to the device, but not yet processed, is
> >> +limited by the queue size.
> >> +
> >>  If VIRTIO_F_IN_ORDER has been negotiated, and when making a
> >>  descriptor with VRING_DESC_F_NEXT set in \field{flags} at offset
> >>  $x$ in the table available to the device, driver MUST set
> > 
> > We can't really introduce new mandatory requirements without
> > a feature bit.
> 
> I'm making the assumption that no existing driver actually violates
> this rule.  That said, another option would be to force any driver
> that does violate it onto a slow path, perhaps by serializing the
> I/O operations.
> 
> As an aside, this is why the spec I am working on for the vhost-user
> device backend has seemingly arbitrary restrictions around MSI-X
> interrupts.  It makes life easier for device authors.
> 
> Finally, I understand if this isn't viable.  It can be worked
> around in devices without *too* much complexity.
> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)

We have two options:
- a new feature bit + if negotiated, driver MUST.
  device can decide if it wants to support drivers without a feature bit
- a recommendation (driver SHOULD)



-- 
MST

