Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AC61FE471
	for <virtio-comment@lists.linux.dev>; Mon, 10 Aug 2026 05:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786340875; cv=none; b=LUbKyjrZsbLDbun1tsrJdmSBElD6bSPHcLedhi/sJx8ab7Vc9nYjKPJ1ZwNaU7/7mycf0Oe90itGQOb+9XDDXfwokxlMnDbZWLMDvYJJ6RpsWduwn3jJWKQa/fra4lrxwCQx263fNsaJbCtRDdoIOd1mCtisIwq5yq0Yjqp/pjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786340875; c=relaxed/simple;
	bh=m3XER68WPDyHrJcQp99Rj3ZsELc59e3OVLgTWj4zKQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=BJaRBWpj3LPC9v1DaHd8qBUp91hR1YLOAjttEzXlgA7loV79TT30lzqGFSr1fBTDfhHCnObJ7cCLJAFM2q5boWvFH2owE1YZbADX/2wZG2Ao8zSyopAv7wyDNcQH7cqZC4RsR5Xns9T2JPHVA1bGKbL2LdEE/GNdb7L7TCEJNk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YT9btPOp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YT9btPOp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786340872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J/NRLZW1FFWHln8YJkJUw+rbjkrlAdUZTSPwq9RTIps=;
	b=YT9btPOp+YaGMcT9bb+7172UUm7funqrIXORm80FGlC5DsCi/9TmR25tqYaQGmEfvkcCLs
	BrXA3YnbsXMW5YSiCoJyE4WNDEJ4jTPEGIT5WvA3F5zG15gynTIiNs+O6QJBlaB/ljTMut
	bhLbpf26mqjkoaVdF1/WJGHYYQ0ILzc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-6sDkjlrkNnqD7Jz3I50Tew-1; Mon, 10 Aug 2026 01:47:51 -0400
X-MC-Unique: 6sDkjlrkNnqD7Jz3I50Tew-1
X-Mimecast-MFC-AGG-ID: 6sDkjlrkNnqD7Jz3I50Tew_1786340870
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4955d314945so8276045e9.0
        for <virtio-comment@lists.linux.dev>; Sun, 09 Aug 2026 22:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786340870; x=1786945670;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/NRLZW1FFWHln8YJkJUw+rbjkrlAdUZTSPwq9RTIps=;
        b=sbx2K97jITejsT7EJvy0XwRgxnXqNP+LxGcUy+evNVx3N42lYC8j+I0KHGSumUOAQd
         zv+WV7ccY1Mx3TDpuDNKsLQ56L/dZWQ7F1pjhQvzaaYz8rNvRYhlG8nFjDe38WZ1w96w
         k9cIH29SZnj9+bVYP1tPi2HdOa+EbfH+JuvvsO4bssz+xPrbdQLENzMdtj/yYDwjvDwB
         8UgLhktNYWD5xjQgr4krDO/ar3cTf2M51Mwyn3WtH77zuvNIIugSEcj1MLgmgg1g85Cg
         f/kOMqiAU5OQ0oPkA/knQ6bmXbQVvYuEX2Q4JKgTFseR+nfOCixI25qDxUMcGx4daRwJ
         efMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrf/ZOONjaPbUWz4jquT8vIrhBzLlzgO89+juRn0qHSEjUGTu976xNlzDxX1VBpPtrbt4lf/mKPX61KXbWspg==@lists.linux.dev
X-Gm-Message-State: AOJu0YydepBs2YgJUQt34HcjQLHv/Z8IWfQKUJ0WztWQVoTTxyNGQL51
	sE7AlZe0XtnKbpxKnVYXLTg3uXVs8k/iQL776HA/m3hKE1s22E/NOHIgHiatJOaGK1ic+pwtLsv
	XrWolKZCSptC6zZDkZzn3zwvszxi6ImFjDwe9iyB6P1GAQYGO+ACEAmjZfbgzvuOxSOJz
X-Gm-Gg: AR+sD13k6m0REMR5yXBdIepdc6n2HfJxrsA3BPjfzkbfNgE+7Shkh2dBOlTzeawwUcr
	cJ9RvIcKSwr3IOzeiztQcN5i6ydvcr5nSLSU0mJiZN7TwnrIW3MIDvQPYJsSaRjv046P7PoR8ZA
	q6EBuse/SnvmR6GnKF7Pw8hGKa0hHEuwYP6haYq27DVvVj5Y5zNYxWmdPMWPZkuh1JYouAWNZUQ
	qTAfY63ogowfaGHxWpK6EabxEXccGByC9M4JkpGUxpnQo/PyaNRCFoyNyH2QvrFuX2fe8aKC+iV
	1WzUdJ1fR+tKR/yYWkavtP34W4VCp94q+C7nrHbgm5y6hxcEzYQsuj6QmV9tQQBHiAGKADYu4Pg
	nx0XJ2UWUmY/cVnSkhK9RSQ==
X-Received: by 2002:a05:600c:1912:b0:499:520c:62a7 with SMTP id 5b1f17b1804b1-4996194a23bmr222854775e9.5.1786340869517;
        Sun, 09 Aug 2026 22:47:49 -0700 (PDT)
X-Received: by 2002:a05:600c:1912:b0:499:520c:62a7 with SMTP id 5b1f17b1804b1-4996194a23bmr222854185e9.5.1786340868980;
        Sun, 09 Aug 2026 22:47:48 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-39-98.inter.net.il. [80.230.39.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002150952sm27623383f8f.15.2026.08.09.22.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:47:48 -0700 (PDT)
Date: Mon, 10 Aug 2026 01:47:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Alexander Graf <graf@amazon.com>, virtio-comment@lists.linux.dev,
	Jason Wang <jasowangio@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3] Add VIRTIO_F_DMB (Device Memory Buffer)
Message-ID: <20260810014140-mutt-send-email-mst@kernel.org>
References: <20260716215426.46037-1-graf@amazon.com>
 <20260804161202.38619-1-graf@amazon.com>
 <20260809113831-mutt-send-email-mst@kernel.org>
 <8c7365fe-8ae8-484f-9da5-34f06cbd2385@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <8c7365fe-8ae8-484f-9da5-34f06cbd2385@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aR_-LDaQjx6oV87522OG3NYlEbz8Yt3q_ZvShy8j_bY_1786340870
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 09, 2026 at 10:09:15PM -0400, Demi Marie Obenour wrote:
> On 8/9/26 17:48, Michael S. Tsirkin wrote:
> > On Tue, Aug 04, 2026 at 04:12:02PM +0000, Alexander Graf wrote:
> >> When a transport uses a shared bounce region for virtqueue memory today,
> >> that region is global and shared by multiple devices at once. Devices
> >> then contend over one small region, so a busy device can starve the
> >> others, and one device's emulation cannot be isolated or torn down on its
> >> own because its state lives in memory everyone else is using too.
> >>
> >> VIRTIO_F_DMB gives each device its own shared memory region, the Device
> >> Memory Buffer, that holds that device's virtqueues (Descriptor, Driver
> >> and Device Areas) and the buffers the descriptors reference. When the
> >> feature is negotiated, every address the driver places in a virtqueue is
> >> an offset into that region rather than a physical or bus address, so the
> >> device only ever touches memory the driver placed there. Because each
> >> device owns its region, its emulation can run in a separate host process
> >> and be terminated independently, and devices no longer contend over one
> >> shared region.
> >>
> >> The device reports the region's shmid through a transport-specific
> >> mechanism (dmb_shm_id in the PCI common configuration structure, DMBSHMId
> >> on MMIO), so the shmid does not collide with device-specific or future
> >> transport-specific shared memory regions. The driver locates the region
> >> through the existing Shared Memory Regions facility. VIRTIO_F_DMB refines
> >> VIRTIO_F_ACCESS_PLATFORM and is negotiated only together with it.
> >>
> >> To provide the confinement guarantee, the device bounds-checks every
> >> driver-supplied offset against the region and sets DEVICE_NEEDS_RESET on
> >> violation.
> >>
> >> The general requirement on shared memory regions forbids a device to
> >> expose a region used to control its operation or to stream data, and a
> >> Device Memory Buffer is used for both, so it is named as that
> >> requirement's exception.
> >>
> >> The Device Memory Buffer is memory the driver shares with the device on
> >> platforms that distinguish shared from private mappings, and the device
> >> provides coherency without cache maintenance by the driver. A device
> >> that requires the platform's barriers offers VIRTIO_F_ORDER_PLATFORM,
> >> and a driver accepts VIRTIO_F_DMB only together with it. Offset 0 in
> >> the region is reserved: a device that predates the feature reads a
> >> Descriptor Area address of 0 as a queue that is not in use, as the
> >> legacy QueuePFN register states.
> >>
> >> Signed-off-by: Alexander Graf <graf@amazon.com>
> >> ---
> >>
> >> Link: https://lore.kernel.org/virtio-comment/20260702040006.65669-1-graf@amazon.com/ [v1]
> >> Link: https://lore.kernel.org/virtio-comment/20260716215426.46037-1-graf@amazon.com/ [v2]
> >>
> >> v1 -> v2:
> >>  - Replace the fixed reserved shmid 2 and its registry with a shmid the
> >>    device reports per transport, as Stefan Hajnoczi suggested on v1.
> >>  - Spell out per-transport compatibility for dmb_shm_id and DMBSHMId.
> >>  - Set FAILED when the driver cannot find the region, rather than refuse
> >>    to negotiate.
> >>  - List VIRTIO_F_DMB under CCW's features reserved for future use.
> >>
> >> v2 -> v3:
> >>  - Require the region to be memory the driver shares with the device.
> >>  - Require coherency; couple VIRTIO_F_DMB to VIRTIO_F_ORDER_PLATFORM,
> >>    replacing v2's sentence on the areas' interaction with it.
> >>  - Reserve offset 0 in the region.
> >>  - Except the Device Memory Buffer from the shared-region prohibition.
> >>  - Allow a device to expose further shared memory regions.
> >>  - Move bit 44 into the queue and feature negotiation reserved list.
> >>  - Aim two cross-references at the Reserved Feature Bits chapter.
> >>
> >>
> >>  conformance.tex    |   2 +
> >>  content.tex        |  28 ++++++-
> >>  shared-mem.tex     | 199 ++++++++++++++++++++++++++++++++++++++++++++-
> >>  transport-ccw.tex  |   1 +
> >>  transport-mmio.tex |  15 ++++
> >>  transport-pci.tex  |  20 +++++
> >>  6 files changed, 262 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/conformance.tex b/conformance.tex
> >> index 9af31e2..cf4259d 100644
> >> --- a/conformance.tex
> >> +++ b/conformance.tex
> >> @@ -104,6 +104,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> >>  \item \ref{drivernormative:General Initialization And Device Operation / Device Initialization}
> >>  \item \ref{drivernormative:General Initialization And Device Operation / Device Cleanup}
> >>  \item \ref{drivernormative:Reserved Feature Bits}
> >> +\item \ref{drivernormative:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
> >>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
> >>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}
> >>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts}
> >> @@ -191,6 +192,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> >>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Packed Virtqueues / The Virtqueue Descriptor Table}
> >>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Packed Virtqueues / Scatter-Gather Support}
> >>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions}
> >> +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
> >>  \item \ref{devicenormative:Reserved Feature Bits}
> >>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
> >>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}
> >> diff --git a/content.tex b/content.tex
> >> index 243ce2d..8c5a844 100644
> >> --- a/content.tex
> >> +++ b/content.tex
> >> @@ -102,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
> >>  \begin{description}
> >>  \item[0 to 23, 41, 42 and 50 to 127] Feature bits for the specific device type
> >>  
> >> -\item[24 to 40, and 43] Feature bits reserved for extensions to the queue and
> >> +\item[24 to 40, 43 and 44] Feature bits reserved for extensions to the queue and
> >>    feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
> >>  
> >> -\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
> >> +\item[45 to 49, and 128 and above] Feature bits reserved for future extensions.
> >>  \end{description}
> >>  
> >>  \begin{note}
> >> @@ -946,6 +946,15 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >>     suspend the device by set the SUSPEND bit to 1.
> >>     See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
> >>  
> >> +  \item[VIRTIO_F_DMB(44)] This feature indicates that the device offers a
> >> +  Device Memory Buffer: a shared memory region, owned by the device,
> >> +  that holds the virtqueues and the buffers they reference.  When this feature
> >> +  is negotiated, every address that the driver places in a virtqueue is an
> >> +  offset into the Device Memory Buffer region rather than a physical address
> >> +  or a bus address.  The device is thereby confined to memory the driver has
> >> +  published in that region.
> >> +  See \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
> >> +
> >>  \end{description}
> >>  
> >>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> >> @@ -982,6 +991,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >>  
> >>  A driver SHOULD accept VIRTIO_F_NOTIF_CONFIG_DATA if it is offered.
> >>  
> >> +A driver MUST NOT accept VIRTIO_F_DMB unless it also accepts
> >> +VIRTIO_F_ACCESS_PLATFORM.  If VIRTIO_F_ORDER_PLATFORM is offered, a driver
> >> +MUST NOT accept VIRTIO_F_DMB unless it also accepts VIRTIO_F_ORDER_PLATFORM.
> > 
> > Why is that? access platform is for DMA from device of which
> > there's none here. Both it and order platform are useful to disable
> > to speed up software configs.
> 
> I agree: combining VIRTIO_F_DMB and VIRTIO_F_ACCESS_PLATFORM shouldn't
> be combined.  I'd treat the combination as an error.

Nope. Just let the decision to devices. Again, there needs to be a
reason for such restrictions.  In fact, access platform is mostly "dma
is limited by a viommu". Since with dmb does not need a viommu to be
secure, it is in fact reasonable to have a device that offers both as
ways to be secure, accepts either VIRTIO_F_DMB or
VIRTIO_F_ACCESS_PLATFORM but fails if none negotiated.


> >> +For the driver requirements that apply once VIRTIO_F_DMB has been
> >> +negotiated, see
> >> +\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
> >> +
> >>  \devicenormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> >>  
> >>  A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate further
> >> @@ -1011,6 +1027,14 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> >>  and presents a PCI SR-IOV capability structure, otherwise
> >>  it MUST NOT offer VIRTIO_F_SR_IOV.
> >>  
> >> +A device that offers VIRTIO_F_DMB MUST also offer VIRTIO_F_ACCESS_PLATFORM.
> >> +A device that offers VIRTIO_F_DMB MUST also offer VIRTIO_F_ORDER_PLATFORM if
> >> +the device requires the driver to use memory barriers suitable for devices
> >> +described by the platform when accessing the Device Memory Buffer region.
> > 
> > This is really vague. On most platforms drivers can map
> > in any way they want. What is expected here? What barriers to
> > use will very much depend on that.
> > 
> > In particular, how do you expect this mapped? If cached what forces
> > the data out of the CPU cache?
> 
> My understanding is that VIRTIO_F_DMB is only a good choice for
> untrusted devices implemented in software.  Both the original use-case
> (protected VMs on Android) and my use-case (Spectrum VMs using untrusted
> virtio-vhost-user devices) fall into this category.  In this case,
> the DMB is just ordinary RAM, so VIRTIO_F_ORDER_PLATFORM isn't needed.
> 
> On the other hand, hardware devices shouldn't implement VIRTIO_F_DMB.
> This would require the CPU to read data over PCIe, which is slow.

The device can be on a quick bus with cache snooping.


> Instead, the driver should use a bounce buffer in system RAM, which
> provides the same level of security (assuming hardware DMA protection
> of some sort).

This is none of spec's business.

> I'd be fine with making VIRTIO_F_DMB and VIRTIO_F_ORDER_PLATFORM
> mutually exclusive.  Forbid devices from offering both, and require
> drivers to refuse to use a device that does.  Reconsider once a
> sensible use-case appears.


We should not deal with policy and use-cases. Just provide building
blocks.

> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)



