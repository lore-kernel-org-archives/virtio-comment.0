Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F9D484223
	for <virtio-comment@lists.linux.dev>; Tue, 18 Aug 2026 17:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787075328; cv=none; b=J9TLA9cmpPFdnHgWwXiJTpZSu0Fro8KpRR4Pyp7EYcqP+rOvbYbY8XPzWoWEeSn8ctyjBNPzngWO/dw15Owlh24zGA5SC5MLPUBbv9fL70Yd36CoViGNPMRQBVZuO8Fr0ncbW2EFOI98xAefXqgjB6BjTzW3m/w7vC25/hll5Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787075328; c=relaxed/simple;
	bh=5i97yRryBMR1NCfeuHpXk1g2P8UxqGPaX4Ef8tCbtEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SDPSZ00nRXW5XNk0wMwtVxO4nRYwKc44nAJYUY/aeXnRT2WoUfKOnUZbnoWGxFQSp3JdscJAXS4JRi1egoW0Y7tTHhtQ2d7XUTYI+Z1UNEa3W7Dkcrz1+ZyS/hbGXxxDNVC+RH8qA0KTXJsL1CybcHyJpH2fTl059RQOP3sxRTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ml9dY1Ld; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ml9dY1Ld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787075325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UJSAqZIkdxgLLT3vAhhbsZftu6f8muz9yaMCu0BuDfo=;
	b=Ml9dY1LdUr/dCzuaBPaJjpSZE4qUOZ7q+8sssSwOi/mLF1pzxTPS7BSbbKRZ6s7GaqlfHk
	hPZaOiqpzAF8X9ldThzoUvUs+VdDt7+bWnl+k1Pa1n7hBkJvOYbZGirzvkQIYTufvFlg0+
	n3YOL7HCtzCXJJpBR/z0W/49xjwaAWw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-_PDYh1hENJKU-F0xz4u9DA-1; Tue, 18 Aug 2026 13:48:41 -0400
X-MC-Unique: _PDYh1hENJKU-F0xz4u9DA-1
X-Mimecast-MFC-AGG-ID: _PDYh1hENJKU-F0xz4u9DA_1787075320
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4996832e7b4so8307915e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 18 Aug 2026 10:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787075320; x=1787680120;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJSAqZIkdxgLLT3vAhhbsZftu6f8muz9yaMCu0BuDfo=;
        b=ASUr8Ut9953kAfy6zQy4pdQepsgiVrrPtgxnE4ZVhaG3hIP+Vg5I/Tl21TmyxbPSuX
         zdR6DAjsbEaw2BYRiMe3Ai51PJzrPVEwGdp2BH76uY3JUbE8mJ/8e8mB2ypO9DBAGQWi
         fN+PF2sVbaPb2JNECxRaDix4amX1PKgSEdY34su2JXZlGHpXAJCGqdZqbW/i+Fld7LTw
         wdV6TVTPsWlwowIBSQyihWbzkziWtgDbNAqwYeniJ/yZ98yIFnoifSMGH1SM/5jMhT+5
         loCIWZm6/ia5PQkuFGmoYXj15zkQwHq01yp5DuFG6HE3nspStCdQ+ngBmoKACPzRckJa
         C4Ag==
X-Gm-Message-State: AOJu0YzOeGXdk6dwPlQfSYW8wXnfNzjxMPWWVnNMvFzTIPtiNTWNxger
	2Vl0SL6cHAlRDOTONEfvemUzDPvn2umyvH6iUyNRFrfU8XPUmBUmdR88jKuNlNZ+o2A3S4cVW2z
	3pfAKcjrn7QncgwJ/jm8Zf/+mpfKHj5W4k6J6+gghZ7QejSE01rxm+2bwDFWDduvLTMA1
X-Gm-Gg: AR+sD13mD4VX7LTjEaixGJzT+DHVDa3mJ+pGiNb0RTNq9MRI9FqV1cOB/+//5IXC9t8
	AB8X0tN/dVtdAZ0ddN0zrg3o1j/e+qa6v5Q/mMZzC2LdUv4G5OaQR0WQVGYc0I/h8XEfFwFqopM
	MQDMHq5ruyKR+uzsdkhcWI7X9myVmzIAu1e3X3dQJEWa4jJSzLYP5NDGXzfJYCMsKl/e3JLfuIP
	mTC+exjVmCQlMWLt7ItZ7Vr6O09UDb3DnpVLqjP+EYgbkxwjCKXuUphqNe0hGai070RqvzabaHE
	JOSQI+5270yLMc8RN3FUWX1jGiwB2so2JHTV/RZy7AqaJdCS2trzD3dHAtBKayuWfh+9BiByaX4
	JnTG9OQ2GyOIm8X1UcN2ciiWn
X-Received: by 2002:a05:600c:83c8:b0:499:a0a5:e13f with SMTP id 5b1f17b1804b1-499a8c32bd1mr3407375e9.2.1787075320337;
        Tue, 18 Aug 2026 10:48:40 -0700 (PDT)
X-Received: by 2002:a05:600c:83c8:b0:499:a0a5:e13f with SMTP id 5b1f17b1804b1-499a8c32bd1mr3406205e9.2.1787075319618;
        Tue, 18 Aug 2026 10:48:39 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-47-107.inter.net.il. [80.230.47.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996176b95sm201445055e9.10.2026.08.18.10.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 10:48:39 -0700 (PDT)
Date: Tue, 18 Aug 2026 13:48:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Graf (AWS), Alexander" <graf@amazon.de>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"nh-open-source@amazon.com" <nh-open-source@amazon.com>,
	Jason Wang <jasowangio@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4] Add VIRTIO_F_DMB (Device Memory Buffer)
Message-ID: <20260818043631-mutt-send-email-mst@kernel.org>
References: <20260817022720.52650-1-graf@amazon.com>
 <20260817050846-mutt-send-email-mst@kernel.org>
 <bc915862-6c53-4811-825a-b112ca929c09@amazon.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <bc915862-6c53-4811-825a-b112ca929c09@amazon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9SoCUz8RqsxYByerIET-AUpkZ_SlIDY0eZjU23V0Jpc_1787075320
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2026 at 05:48:04AM +0000, Graf (AWS), Alexander wrote:
> 
> On 17.08.26 13:25, Michael S. Tsirkin wrote:
> > On Mon, Aug 17, 2026 at 02:27:20AM +0000, Alexander Graf wrote:
> >> Virtio devices assume R/W access of guest RAM to perform DMA into it to
> >> access its virt queues and data to operate on. This basic assumption
> >> leads to multiple problems:
> >>
> >> Confidential Compute - In SEV-SNP or TDX, the host has no direct access
> >>                         to all of guest RAM. We work around DMA access by
> >>                         having the guest limit DMA access to a common
> >>                         shared memory window between guest and host
> >>                         (swiotlb).
> >>
> >> Vhost-user - vhost-user backends require access to all guest memory, not
> >>               only the memory they are actually supposed to access. This
> >>               is fine for trusted backends, but if you want to limit
> >>               visibility into guest, you need to do weird stunts like
> >>               bouncing memory in the vmm [1].
> >>
> >> To restrict DMA visibility, virtio-iommu allows the guest to open specific
> >> windows into guest memory to the device, but it comes with its own bag
> >> of problems, such as dynamic allocations and complicated device <->
> >> iommu connections that need to be represented reliably.
> >>
> >> Instead, introduce a simple mechanism that lets a device communicate
> >> through its own dedicated shared memory region: Device Memory Buffer.
> >> A device that offers Device Memory Buffer exposes a shared memory
> >> region, owned by the device, that holds the virtqueues and the buffers
> >> they reference.
> >>
> >> Once negotiated, an imaginary per-device IOMMU maps the device's IOVA
> >> space 1:1 onto the region. Every data address is then an address into it,
> >> never a physical or bus address, and the device reaches no other memory
> >> to process virtqueues.
> >>
> >> The device reports the region's shmid in dmb_shm_id on PCI and DMBSHMId
> >> on MMIO, so the shmid does not collide with device-specific or future
> >> transport-specific shared memory regions. The driver locates the region
> >> through the existing Shared Memory Regions facility, VIRTIO_F_DMB needs
> >> a transport that supports SHM.
> >>
> >> The device also reports the region's memory type. The only available
> >> type currently is 0 (cache coherent).
> >>
> >> [1] https://lore.kernel.org/qemu-devel/20260723-vhost-user-isolated-memory-v1-0-6b97c439eb28@gmail.com/T/#t
> >>
> >> Assisted-by: Kiro:claude-opus-5
> >> Signed-off-by: Alexander Graf <graf@amazon.com>
> >> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/248
> > I like the "internal iommu" idea. addresses my concerns nicely!
> 
> 
> Woohoo! :)
> 
> 
> [...]
> 
> >> @@ -946,6 +946,14 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >>      suspend the device by set the SUSPEND bit to 1.
> >>      See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
> >>
> >> +  \item[VIRTIO_F_DMB(44)] This feature indicates that the device offers a
> >> +  Device Memory Buffer: a shared memory region, owned by the device,
> >> +  that holds the virtqueues and the buffers they reference.  When this feature
> >> +  is negotiated, all data DMA operations get routed via a static, imaginary
> >> +  per-device transparent IOMMU which creates a 1:1 mapping of the device's
> >> +  IOVA space
> > DMA address space
> 
> 
> The precedence in the doc is "bus address space". I'll use that one 
> instead to stay consistent.
> 
> [...]
> 
> 
> >> diff --git a/shared-mem.tex b/shared-mem.tex
> >> index 6e6f6c4..405745d 100644
> >> --- a/shared-mem.tex
> >> +++ b/shared-mem.tex
> >> @@ -38,5 +38,161 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
> >>   Device / Shared Memory Regions}
> >>   Shared memory regions MUST NOT expose shared memory regions which
> >>   are used to control the operation of the device, nor to stream
> >> -data.
> >> +data, other than the Device Memory Buffer when VIRTIO_F_DMB has been
> >> +negotiated (see
> >> +\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
> >> +
> >> +\subsection{Device Memory Buffer}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
> >> +
> >> +When VIRTIO_F_DMB (see \ref{sec:Reserved Feature Bits}) is
> >> +negotiated, the device offers a shared memory region, the
> >> +\emph{Device Memory Buffer}, identified by a \field{shmid} that the
> >> +device reports through a transport-specific mechanism (for example
> >> +\field{dmb_shm_id} in the common configuration structure on the PCI
> >> +transport, see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout},
> >> +and \field{DMBSHMId} on the MMIO transport, see
> >> +\ref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout};
> >> +see the transport chapters).
> >> +The driver reads that \field{shmid} and locates the region using the
> >> +transport-specific shared memory region enumeration mechanism, in the
> >> +same way as any other shared memory region.  Because both the
> >> +\field{shmid} report and that enumeration are transport-specific,
> >> +VIRTIO_F_DMB is available only on transports that define a shared memory
> >> +region discovery mechanism.
> >> +
> >> +When VIRTIO_F_DMB is active, all data DMA operations (not IRQ logic) get
> > (excluding notifications)?
> 
> 
> Good catch. Reworded.
> 
> 
> >> +routed via a static, imaginary per-device transparent IOMMU which
> >> +creates a 1:1 mapping of the device's IOVA space
> > DMA address space
> >
> >> and the DMB SHM region.
> >> +The virtio device then performs all data access against the DMB
> >> +region and no longer against the transport bus's DMA address space.
> >> +
> >> +With VIRTIO_F_DMB active,
> >
> > negotiated
> >
> >> address 0 is reserved. Drivers
> > and devices
> >
> >> can
> > internally
> >
> >> use address 0
> >> +for internal semantics, such as "not in use" or "failed allocation".
> >> +
> >> +VIRTIO_F_DMB is independent of VIRTIO_F_ACCESS_PLATFORM.  A device MAY
> >> +offer both, and MAY require one of them, but neither implies the other.
> >> +
> >> +VIRTIO_F_DMB does not change the memory ordering requirements for
> >> +the Descriptor, Driver and Device Areas. Those ordering requirements must
> >> +continue to align between the driver and the device observing the Device
> >> +Memory Buffer. Which barriers the driver emits is governed by
> >> +VIRTIO_F_ORDER_PLATFORM as it is for any other device (see \ref{sec:Reserved Feature Bits}).
> >
> >
> > "as it is for any other device" is confusing and useless.
> 
> 
> Ack on all the above
> 
> 
> >
> >> +
> >> +To allow a driver to understand whether the DMB backing SHM region is cache
> >> +coherent,
> > in the future we'll presumably have more types?
> 
> 
> We discussed this in earlier versions: If you want to build this as a 
> way to use virtio on systems without DMA (which do exist, there are some 
> funky PCI implementations out there), we can define a WC mode for 
> example which then would allow not-super-fast, but still workable I/O in 
> such environments.
> 
> I just don't really want to deal with defining all of the nuances of 
> such a mode right now. IMHO that's best done when we actually cross that 
> bridge and someone can validate that what they put into the spec 
> actually works in real life.


Well sure. But taking your example, a system which allows
cacheable mappings will for sure also allow WC?
So a single type is not good, we need like a bitmap.
And once we do, let's just use feature bits?

IOW when/if we define it, we'll just use a separate feature bit.
No?

> 
> >> the device reports the memory type of the DMB region through a
> >> +transport-specific mechanism.  Currently, the following types are defined:
> >> +
> >> +\begin{description}
> >> +\item[0] The region is cache coherent.
> > between the device and the driver?
> >
> >>   A write that the driver performs to
> >> +  the region becomes visible to the device, and a write that the device
> >> +  performs to the region becomes visible to the driver, without any cache
> >> +  maintenance operation
> > operations.
> >
> >> by the driver.
> > by either.
> >
> >
> > But it's still confusing. First, it really depends on how driver
> > mapped the memory.  For example i think I can map any memory
> > uncached and viola it works.
> 
> 
> That depends. On older ARM systems, if you map uncached, the host (which 
> has it marked as cached) would not be able to see it.

I mean with a physical device. Or have host map it uncached.

> On x86 and modern 
> server class ARM systems, mapping uncached would work, yes.
> 


So you see already we apparently support 2 mapping types?


> > Second this also might depend on the ordering flag thinkably?
> > If it does not, say so.
> >
> >   Third there's ordering of this
> > wrt notifications since you excluded them.
> >
> >> +\end{description}
> >
> > It's confusing here. It is not clear what this 0 is unless you just
> > read the patch.
> >
> > Alternatively, if you want to use "Device Buffer memory type" or
> > DMB memory type" or whatever make it
> > very prominent, like a subsection of its own and use consistently
> > not sometimes like this sometimes " the memory type of the DMB region"
> > etc.
> 
> 
> Great idea!
> 
> 
> >
> >> +All other values are reserved.
> >
> >
> >> +
> >> +The region's length is reported by the shared memory region descriptor and
> >> +bounds the amount of virtqueue data that can be in flight at once.
> > no idea what this means and what virtqueue data is
> 
> 
> Clarified
> 
> 
> >
> >> +
> >> +\drivernormative{\subsubsection}{Device Memory Buffer}{Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
> >> +
> >> +The driver MUST NOT accept VIRTIO_F_DMB unless the memory type that the
> >> +device reports through the transport-specific mechanism is a value that this
> >> +specification defines and that the driver supports.
> > i am not sure this will work well for extensions.
> > what if three are several ways to map for example? I would just
> > drop it I think unless you can show e.g. in the commit log
> > some other possible types and how this will be extensible.
> 
> 
> If there are several ways to map, we can make the field become a bitmap 
> with special meaning that 0 means "writeback" :).
> 
> I don't think this will realistically happen. The host will want to tell 
> the guest the best caching mode to use at all times. Anyone with 
> sensible hardware will want writeback. But if we want to keep this 
> generic (which is a sensible idea IMHO), it's good to keep at least the 
> field reserved that allows us to indicate different semantics if we need 
> a different caching mode.


We can simply say guests must check this field is 0
and disable the feature if not 0 if you feel so strongly.
I doubt it will be useful and normally we don't do a thing
like this -we can always add another feature bit. But hey.


> 
> > Also generally we give detailed text without MUST etc in non conformance
> > sections and then with a bit of duplication put conformance parts in
> > a separate coformance sections.
> 
> 
> This is the conformance section, no?

yes

> Or do you mean that we should 
> mention the above as well in the normal section?

so we have a detailed description without MUST etc in regular sections
and conformance sections just repeat the things with MUST/SHOULD etc.

> 
> Let's bounce this spec update once more. I'll also post a new version of 
> the Linux patches.
> 
> 
> Alex

