Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5692AF00
	for <virtio-comment@lists.linux.dev>; Mon, 17 Aug 2026 11:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965942; cv=none; b=jm5PoLjPBUjMIJK0VCPkFhe7rqUws4biosbkkm1poEhGfx94WP3ZBNdCBAcytBfClJ0XHIrr81X7BIVAB2qkJQVZXRAS9g0Oo0fOnqnt8DaNCdF9GDE2EtLcEMNacGMvTRKigNuGJBE/226WyLTCfLYVF4Y7THifN//7OgVGRPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965942; c=relaxed/simple;
	bh=W9lYygFYqaEVCfjC6rvb3bO+QaFIHyfJxvzdYdPHuoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=e6GR4UnlCniRHuVB6FmfpNVvYvVLdOEtLwAwEtx6uMdPB0ga8h/+/L4bVs3OERsgmbLRmhMBj7+11UKMWGB6R78Pb91vMPmU3hFrDVnRn0mjBmWXeWgsjywQaQhA8WTsh14m/K+8I4DNduY34z5us5gz5URuJd20Ak8q4oVpVTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SRN8f8Pj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SRN8f8Pj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786965939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qLj4aR2o7iW9QjZsyUs62HJOx/Aw8gNax+g3CrFvk+E=;
	b=SRN8f8PjSLBk1XRNnHNojAUyQrm2T5IRqPug21rWRdKxVkyXYzyc/lOcv2AnS7mX7bFxf3
	kSC6AZ3gzaa+pyWbHotZJHNOnI9MROFWkCnZUgYoi1hBuPKuxPRpnCzYqHFpEdaN4GBM2/
	uexK/KvxyjLQ3RFXOD4lkDBbBjw0Ito=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-Prk4bqGENeio1pgECKrYKQ-1; Mon, 17 Aug 2026 07:25:38 -0400
X-MC-Unique: Prk4bqGENeio1pgECKrYKQ-1
X-Mimecast-MFC-AGG-ID: Prk4bqGENeio1pgECKrYKQ_1786965937
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49955a9dbcdso21357105e9.1
        for <virtio-comment@lists.linux.dev>; Mon, 17 Aug 2026 04:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965937; x=1787570737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qLj4aR2o7iW9QjZsyUs62HJOx/Aw8gNax+g3CrFvk+E=;
        b=OSZFzrOWb2Bi/b1+47UxSSq1TKkhYKGSku4R/xih6c9mCNEv5dWzqgzHuJyZtOi+JN
         34iKxlbeTD8VgctQQKKbRcYbQYVJaxyTybpLXR7uSscAY/OgY4pn93RfGgEQmeMHP1pX
         7JsG1z7S0NALfpqLtZLdobNFKZxNOMU1D+tn/w1Z2OhIFPJXowIdTT5V1me3h8h94el2
         tpDhGZAtZ810bzI2uaH2e8EePilg6CcwayIB8W/H9kUQn7dmPIwj36JySnFJX7Gzf2br
         9ofOKdnTg525Af9ncMgbQ66NY835UB+8/se2UQJFDLDDkVjaHWGfjrxShOAOvkVMjt0t
         trAg==
X-Gm-Message-State: AOJu0YyE0VxuLmxX5bFO5An6eAJSK1qK7cG7WNAW7+OHT+ozVs1HxUE4
	0Pc8lWchLZYBFkR7mZNHXpQHQZYReo+iq+iMjvlbta424OFUJbj7rTiZcDOTW5mWhPtAxjWG253
	COMWwbPkJ0aLnqFL1dKvR+pzvyLkbMOZDu0yiC2P7o5qh/VKM6rS5hvRzNeIeXcxavMRfjwUxQG
	Vi
X-Gm-Gg: AR+sD13ToZRYibEo3ee0mpnBjVVVPG/dNMV28nc9i1IL/Gw6Up9Oiq0kHHowtrfRYFK
	0MvkNk8s87lTMCi/Y+dO9y0SwR00HkQwHH7qKepVCTzV5vjJkp3CGYiNnOQuoufjICkj0VV2BwJ
	PTe6iN2AsTYIQrp1ogUWQrNG7/gSaVbjJbcqwH2oab/RtsRjEnd9cH3Qo47AT9M7mFkH+ZZfyGJ
	J6N424RmLtWv4ZRVhhFWFusmhRlhrfbUdTLDwOOX4FpZ5JqwCzSFuwH9guNV2uIfgvjm/bO6PxM
	U8eKd+acjJrBu0HRnjRNVsGLK6iWLRq97bmdqb2R7EN8/cbtEKBFlD4BnWpCxXIDFigW
X-Received: by 2002:a05:600c:3b1d:b0:499:79b9:e226 with SMTP id 5b1f17b1804b1-49988057986mr357529395e9.0.1786965936444;
        Mon, 17 Aug 2026 04:25:36 -0700 (PDT)
X-Received: by 2002:a05:600c:3b1d:b0:499:79b9:e226 with SMTP id 5b1f17b1804b1-49988057986mr357527585e9.0.1786965935579;
        Mon, 17 Aug 2026 04:25:35 -0700 (PDT)
Received: from redhat.com ([187.15.128.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996100184sm177141745e9.1.2026.08.17.04.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:25:34 -0700 (PDT)
Date: Mon, 17 Aug 2026 07:25:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: virtio-comment@lists.linux.dev, nh-open-source@amazon.com,
	Jason Wang <jasowangio@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4] Add VIRTIO_F_DMB (Device Memory Buffer)
Message-ID: <20260817050846-mutt-send-email-mst@kernel.org>
References: <20260817022720.52650-1-graf@amazon.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260817022720.52650-1-graf@amazon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pF9wn0S4gCK8sLB9uoT6U018hOBSctiqMEr3fCVzEC8_1786965937
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 17, 2026 at 02:27:20AM +0000, Alexander Graf wrote:
> Virtio devices assume R/W access of guest RAM to perform DMA into it to
> access its virt queues and data to operate on. This basic assumption
> leads to multiple problems:
> 
> Confidential Compute - In SEV-SNP or TDX, the host has no direct access
>                        to all of guest RAM. We work around DMA access by
>                        having the guest limit DMA access to a common
>                        shared memory window between guest and host
>                        (swiotlb).
> 
> Vhost-user - vhost-user backends require access to all guest memory, not
>              only the memory they are actually supposed to access. This
>              is fine for trusted backends, but if you want to limit
>              visibility into guest, you need to do weird stunts like
>              bouncing memory in the vmm [1].
> 
> To restrict DMA visibility, virtio-iommu allows the guest to open specific
> windows into guest memory to the device, but it comes with its own bag
> of problems, such as dynamic allocations and complicated device <->
> iommu connections that need to be represented reliably.
> 
> Instead, introduce a simple mechanism that lets a device communicate
> through its own dedicated shared memory region: Device Memory Buffer.
> A device that offers Device Memory Buffer exposes a shared memory
> region, owned by the device, that holds the virtqueues and the buffers
> they reference.
> 
> Once negotiated, an imaginary per-device IOMMU maps the device's IOVA
> space 1:1 onto the region. Every data address is then an address into it,
> never a physical or bus address, and the device reaches no other memory
> to process virtqueues.
> 
> The device reports the region's shmid in dmb_shm_id on PCI and DMBSHMId
> on MMIO, so the shmid does not collide with device-specific or future
> transport-specific shared memory regions. The driver locates the region
> through the existing Shared Memory Regions facility, VIRTIO_F_DMB needs
> a transport that supports SHM.
> 
> The device also reports the region's memory type. The only available
> type currently is 0 (cache coherent).
> 
> [1] https://lore.kernel.org/qemu-devel/20260723-vhost-user-isolated-memory-v1-0-6b97c439eb28@gmail.com/T/#t
> 
> Assisted-by: Kiro:claude-opus-5
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/248

I like the "internal iommu" idea. addresses my concerns nicely!


> ---
> 
> Link: https://lore.kernel.org/virtio-comment/20260702040006.65669-1-graf@amazon.com/ [v1]
> Link: https://lore.kernel.org/virtio-comment/20260716215426.46037-1-graf@amazon.com/ [v2]
> Link: https://lore.kernel.org/virtio-comment/20260804161202.38619-1-graf@amazon.com/ [v3]
> 
> v1 -> v2:
>   - Replace the fixed reserved shmid 2 and its registry with a shmid the
>     device reports per transport, as Stefan Hajnoczi suggested on v1
>   - Spell out per-transport compatibility for dmb_shm_id and DMBSHMId
>   - Set FAILED when the driver cannot find the region, rather than refuse
>     to negotiate
>   - List VIRTIO_F_DMB under CCW's features reserved for future use
> 
> v2 -> v3:
>   - Require the region to be memory the driver shares with the device
>   - Require coherency; couple VIRTIO_F_DMB to VIRTIO_F_ORDER_PLATFORM,
>     replacing v2's sentence on the areas' interaction with it
>   - Reserve offset 0 in the region
>   - Except the Device Memory Buffer from the shared-region prohibition
>   - Allow a device to expose further shared memory regions
>   - Move bit 44 into the queue and feature negotiation reserved list
>   - Aim two cross-references at the Reserved Feature Bits chapter
> 
> v3 -> v4:
>   - Decouple VIRTIO_F_DMB from VIRTIO_F_ACCESS_PLATFORM and
>     VIRTIO_F_ORDER_PLATFORM
>   - Describe the mapping as a per-device IOMMU instead of as offsets into
>     the region (Michael)
>   - Report the region's memory type in the transport (Michael)
>   - Let a device require either VIRTIO_F_DMB or VIRTIO_F_ACCESS_PLATFORM
>     (Michael)
>   - Require the region's base address to be aligned (Michael)
>   - State the property the mapping must have instead of how to map
>     (Michael)
>   - State the negotiation condition once per normative section (Michael)
>   - Rewrite description
> 
>  conformance.tex    |   2 +
>  content.tex        |  20 +++++-
>  shared-mem.tex     | 158 ++++++++++++++++++++++++++++++++++++++++++++-
>  transport-ccw.tex  |   1 +
>  transport-mmio.tex |  27 ++++++++
>  transport-pci.tex  |  33 ++++++++++
>  6 files changed, 238 insertions(+), 3 deletions(-)
> 
> diff --git a/conformance.tex b/conformance.tex
> index 9af31e2..cf4259d 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -104,6 +104,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{drivernormative:General Initialization And Device Operation / Device Initialization}
>  \item \ref{drivernormative:General Initialization And Device Operation / Device Cleanup}
>  \item \ref{drivernormative:Reserved Feature Bits}
> +\item \ref{drivernormative:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}
>  \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts}
> @@ -191,6 +192,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Packed Virtqueues / The Virtqueue Descriptor Table}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Packed Virtqueues / Scatter-Gather Support}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions}
> +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
>  \item \ref{devicenormative:Reserved Feature Bits}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
>  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}
> diff --git a/content.tex b/content.tex
> index 243ce2d..27c299b 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -102,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>  \begin{description}
>  \item[0 to 23, 41, 42 and 50 to 127] Feature bits for the specific device type
>  
> -\item[24 to 40, and 43] Feature bits reserved for extensions to the queue and
> +\item[24 to 40, 43 and 44] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
>  
> -\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
> +\item[45 to 49, and 128 and above] Feature bits reserved for future extensions.
>  \end{description}
>  
>  \begin{note}
> @@ -946,6 +946,14 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>     suspend the device by set the SUSPEND bit to 1.
>     See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>  
> +  \item[VIRTIO_F_DMB(44)] This feature indicates that the device offers a
> +  Device Memory Buffer: a shared memory region, owned by the device,
> +  that holds the virtqueues and the buffers they reference.  When this feature
> +  is negotiated, all data DMA operations get routed via a static, imaginary
> +  per-device transparent IOMMU which creates a 1:1 mapping of the device's
> +  IOVA space

DMA address space

> and the Device Memory Buffer region.
> +  See \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> @@ -982,6 +990,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  
>  A driver SHOULD accept VIRTIO_F_NOTIF_CONFIG_DATA if it is offered.
>  
> +For the driver requirements that apply once VIRTIO_F_DMB has been
> +negotiated, see
> +\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
> +
>  \devicenormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>  
>  A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate further
> @@ -1011,6 +1023,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  and presents a PCI SR-IOV capability structure, otherwise
>  it MUST NOT offer VIRTIO_F_SR_IOV.
>  
> +For the device requirements that apply once VIRTIO_F_DMB has been
> +negotiated, see
> +\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
> +
>  \section{Legacy Interface: Reserved Feature Bits}\label{sec:Reserved Feature Bits / Legacy Interface: Reserved Feature Bits}
>  
>  Transitional devices MAY offer the following:
> diff --git a/shared-mem.tex b/shared-mem.tex
> index 6e6f6c4..405745d 100644
> --- a/shared-mem.tex
> +++ b/shared-mem.tex
> @@ -38,5 +38,161 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
>  Device / Shared Memory Regions}
>  Shared memory regions MUST NOT expose shared memory regions which
>  are used to control the operation of the device, nor to stream
> -data.
> +data, other than the Device Memory Buffer when VIRTIO_F_DMB has been
> +negotiated (see
> +\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
> +
> +\subsection{Device Memory Buffer}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
> +
> +When VIRTIO_F_DMB (see \ref{sec:Reserved Feature Bits}) is
> +negotiated, the device offers a shared memory region, the
> +\emph{Device Memory Buffer}, identified by a \field{shmid} that the
> +device reports through a transport-specific mechanism (for example
> +\field{dmb_shm_id} in the common configuration structure on the PCI
> +transport, see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout},
> +and \field{DMBSHMId} on the MMIO transport, see
> +\ref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout};
> +see the transport chapters).
> +The driver reads that \field{shmid} and locates the region using the
> +transport-specific shared memory region enumeration mechanism, in the
> +same way as any other shared memory region.  Because both the
> +\field{shmid} report and that enumeration are transport-specific,
> +VIRTIO_F_DMB is available only on transports that define a shared memory
> +region discovery mechanism.
> +
> +When VIRTIO_F_DMB is active, all data DMA operations (not IRQ logic) get

(excluding notifications)?

> +routed via a static, imaginary per-device transparent IOMMU which
> +creates a 1:1 mapping of the device's IOVA space

DMA address space

> and the DMB SHM region.
> +The virtio device then performs all data access against the DMB
> +region and no longer against the transport bus's DMA address space.
> +
> +With VIRTIO_F_DMB active,


negotiated

> address 0 is reserved. Drivers

and devices

> can 

internally

>use address 0
> +for internal semantics, such as "not in use" or "failed allocation".
> +
> +VIRTIO_F_DMB is independent of VIRTIO_F_ACCESS_PLATFORM.  A device MAY
> +offer both, and MAY require one of them, but neither implies the other.
> +
> +VIRTIO_F_DMB does not change the memory ordering requirements for
> +the Descriptor, Driver and Device Areas. Those ordering requirements must
> +continue to align between the driver and the device observing the Device
> +Memory Buffer. Which barriers the driver emits is governed by
> +VIRTIO_F_ORDER_PLATFORM as it is for any other device (see \ref{sec:Reserved Feature Bits}).



"as it is for any other device" is confusing and useless.

> +
> +To allow a driver to understand whether the DMB backing SHM region is cache
> +coherent,

in the future we'll presumably have more types?

> the device reports the memory type of the DMB region through a
> +transport-specific mechanism.  Currently, the following types are defined:
> +
> +\begin{description}
> +\item[0] The region is cache coherent.

between the device and the driver?

>  A write that the driver performs to
> +  the region becomes visible to the device, and a write that the device
> +  performs to the region becomes visible to the driver, without any cache
> +  maintenance operation

operations.

> by the driver.

by either.


But it's still confusing. First, it really depends on how driver
mapped the memory.  For example i think I can map any memory
uncached and viola it works.


Second this also might depend on the ordering flag thinkably?
If it does not, say so.

 Third there's ordering of this
wrt notifications since you excluded them.

> +\end{description}


It's confusing here. It is not clear what this 0 is unless you just
read the patch.

Alternatively, if you want to use "Device Buffer memory type" or
DMB memory type" or whatever make it
very prominent, like a subsection of its own and use consistently
not sometimes like this sometimes " the memory type of the DMB region"
etc.

> +All other values are reserved.



> +
> +The region's length is reported by the shared memory region descriptor and
> +bounds the amount of virtqueue data that can be in flight at once.

no idea what this means and what virtqueue data is

> +
> +\drivernormative{\subsubsection}{Device Memory Buffer}{Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
> +
> +The driver MUST NOT accept VIRTIO_F_DMB unless the memory type that the
> +device reports through the transport-specific mechanism is a value that this
> +specification defines and that the driver supports.

i am not sure this will work well for extensions.
what if three are several ways to map for example? I would just
drop it I think unless you can show e.g. in the commit log
some other possible types and how this will be extensible.

Also generally we give detailed text without MUST etc in non conformance
sections and then with a bit of duplication put conformance parts in
a separate coformance sections.

> +
> +The requirements in the remainder of this section apply once VIRTIO_F_DMB
> +has been negotiated.

if

> +
> +The driver MUST read the \field{shmid} that the device reports through the
> +transport-specific mechanism and MUST locate that shared memory region using
> +the transport-specific shared memory region enumeration mechanism.  If the
> +driver cannot locate the region, it MUST set the FAILED
> +\field{device status} bit.
> +
> +The driver MUST place the Descriptor Area, Driver Area and Device Area of
> +every virtqueue within the Device Memory Buffer region, and MUST treat all
> +addresses as 1:1 IOMMU mapped into the Device Memory Buffer region.
> +The driver MUST choose each area's address such that the address satisfies
> +the alignment that the virtqueue layout in use requires of that area.
> +
> +For every buffer that the driver makes available to the device, and for
> +every indirect descriptor table if VIRTIO_F_INDIRECT_DESC has been
> +negotiated, the driver MUST place it within the Device Memory Buffer region
> +and MUST treat all addresses as 1:1 IOMMU mapped into the Device Memory
> +Buffer region.
> +
> +The driver MUST NOT supply an address that, together with the length of the
> +structure it refers to, lies outside the Device Memory Buffer region, and
> +MUST NOT make available a buffer that does not fit within the region.
> +
> +The driver MUST NOT supply an address of 0 as the address of a Descriptor
> +Area, Driver Area or Device Area, as the \field{addr} field of a descriptor,
> +or as the address of an indirect descriptor table.
> +
> +The driver MUST access the Device Memory Buffer region through a mapping by
> +which a write the driver performs to the region becomes visible to the
> +device, and a write the device performs to the region becomes visible to the
> +driver.
>  How the driver establishes such a mapping is up to the driver and
> +the platform.



what does this mean?


> +\devicenormative{\subsubsection}{Device Memory Buffer}{Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
> +


> +A device MUST NOT offer VIRTIO_F_DMB unless the transport provides a
> +shared memory region discovery mechanism.
> +
> +A device MAY require that the driver accept VIRTIO_F_DMB, that the driver
> +accept VIRTIO_F_ACCESS_PLATFORM, or that the driver accept at least one of
> +the two.  A device that requires at least one of the two MUST fail to set
> +the FEATURES_OK \field{device status} bit when the driver writes it having
> +accepted neither.
> +
> +A device MUST NOT offer VIRTIO_F_DMB unless the platform permits the driver to
> +access the Device Memory Buffer region as memory that is shared with the
> +device.
> +
> +A device that offers VIRTIO_F_DMB MUST report the memory type of the Device
> +Memory Buffer region through the transport-specific mechanism, and MUST
> +report a value that this specification defines.
> +
> +A device that reports memory type 0 MUST ensure that a write that the driver
> +performs to the Device Memory Buffer region becomes visible to the device,
> +and a write that the device performs to the region becomes visible to the
> +driver, without any cache maintenance operation by the driver.
> +
> +A device that offers VIRTIO_F_DMB MUST expose exactly one shared memory
> +region for the Device Memory Buffer and MUST report that region's
> +\field{shmid} through the transport-specific mechanism.


I think this is better in a transport specific section.

> +
> +A device that offers VIRTIO_F_DMB MUST report a Device Memory Buffer region
> +whose base address is aligned to at least the largest alignment that any
> +virtqueue layout requires of an area.


kinda vague. and what is "any virtqueue layout" anyway?

Basically 16 bytes?

> +
> +A device that offers VIRTIO_F_DMB MAY expose

can expose

> further shared memory regions in
> +addition to the Device Memory Buffer;

u call this soemtimes dmb region sometimes just dmb. pls be consistent.

> the Device Memory Buffer is the one
> +region whose \field{shmid} the device reports through the transport-specific
> +mechanism.
> +
> +The remaining requirements in this section apply once VIRTIO_F_DMB has been
> +negotiated.
> +
> +The device MUST interpret every data address as an address into the Device
> +Memory Buffer. It MUST NOT interpret any such address as a physical or bus
> +address.

pls go back to the internal iommu terminology.

> +Before accessing any structure that a driver-supplied address refers to, the
> +device MUST verify that the address together with the length of that
> +structure lies within the Device Memory Buffer region and does not overflow.
> +If this verification fails, the device MUST NOT perform the access and MUST
> +set the DEVICE_NEEDS_RESET \field{device status} bit.


and here

> +
> +If the driver supplies an address of 0 as the address of a Descriptor Area,
> +Driver Area or Device Area, the device MUST NOT access that area, and MUST
> +set the DEVICE_NEEDS_RESET \field{device status} bit.  If the driver
> +supplies an address of 0 as the \field{addr} field of a descriptor or as the
> +address of an indirect descriptor table, the device SHOULD NOT access the
> +structure that address refers to, and SHOULD set the DEVICE_NEEDS_RESET
> +\field{device status} bit.


so just protect fist 16 bytes in the iommu?

> +
> +The device MUST NOT access any memory outside the Device Memory Buffer
> +region in order to process virtqueues.

again, iommu

>  
> diff --git a/transport-ccw.tex b/transport-ccw.tex
> index fe6957d..2c277bf 100644
> --- a/transport-ccw.tex
> +++ b/transport-ccw.tex
> @@ -610,6 +610,7 @@ \subsection{Features reserved for future use}\label{sec:Virtio Transport Options
>  \item VIRTIO_F_ADMIN_VQ
>  \item VIRTIO_F_RING_RESET
>  \item Shared memory regions including VIRTIO_PMEM_F_SHMEM_REGION
> +\item VIRTIO_F_DMB
>  
>  \end{itemize}
>  
> diff --git a/transport-mmio.tex b/transport-mmio.tex
> index cddbcc9..2b0c3fe 100644
> --- a/transport-mmio.tex
> +++ b/transport-mmio.tex
> @@ -248,6 +248,21 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>      apply to the queue selected by writing to \field{QueueSel}.
>    }
>    \hline
> +  \mmioreg{DMBSHMId}{Device Memory Buffer shared memory ID}{0x0c4}{R}{%
> +    If VIRTIO_F_DMB has been negotiated, reading from this register
> +    returns the \field{shmid} of the shared memory region that is the
> +    Device Memory Buffer (see \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
> +    This register is valid only if VIRTIO_F_DMB has been negotiated.
> +  }
> +  \hline
> +  \mmioreg{DMBMemType}{Device Memory Buffer memory type}{0x0c8}{R}{%
> +    Reading from this register returns the memory type of the Device
> +    Memory Buffer region (see \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).


again inconsistent naming

> +    This register is valid whenever the device offers VIRTIO_F_DMB,
> +    because the driver reads it in order to decide whether to accept
> +    the feature.

I would add (as opposed to after the feature has been negotiated)

> +  }
> +  \hline
>    \mmioreg{ConfigGeneration}{Configuration atomicity value}{0x0fc}{R}{
>      Reading from this register returns a value describing a version of the device-specific configuration space (see \field{Config}).
>      The driver can then access the configuration space and, when finished, read \field{ConfigGeneration} again.
> @@ -313,6 +328,12 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>  when queue reset has completed.
>  (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
>  
> +If the device offers VIRTIO_F_DMB, \field{DMBSHMId} MUST equal the
> +\field{shmid} of a shared memory region that the device exposes through
> +\field{SHMSel}, \field{SHMLenLow}, \field{SHMLenHigh}, \field{SHMBaseLow}
> +and \field{SHMBaseHigh}, and \field{DMBMemType} MUST report a memory type
> +that this specification defines.
> +
>  \drivernormative{\subsubsection}{MMIO Device Register Layout}{Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}
>  The driver MUST NOT access memory locations not described in the
>  table \ref{tab:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}
> @@ -367,6 +388,12 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>  that were used before the queue reset.
>  (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
>  
> +The driver MUST NOT read \field{DMBSHMId} unless VIRTIO_F_DMB has been
> +negotiated.
> +
> +The driver MUST NOT read \field{DMBMemType} unless the device offers
> +VIRTIO_F_DMB.
> +
>  \subsection{MMIO-specific Initialization And Device Operation}\label{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation}
>  
>  \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Device Initialization}
> diff --git a/transport-pci.tex b/transport-pci.tex
> index 95b08b8..71c2b64 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -325,6 +325,10 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>          /* About the administration virtqueue. */
>          le16 admin_queue_index;         /* read-only for driver */
>          le16 admin_queue_num;         /* read-only for driver */
> +
> +        /* About the Device Memory Buffer. */
> +        le16 dmb_shm_id;                /* read-only for driver */
> +        le16 dmb_mem_type;              /* read-only for driver */
>  };
>  \end{lstlisting}
>  
> @@ -428,6 +432,22 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  	The value 0 indicates no supported administration virtqueues.
>  	This field is valid only if VIRTIO_F_ADMIN_VQ has been
>  	negotiated.
> +
> +\item[\field{dmb_shm_id}]
> +        The device uses this to report the \field{shmid} of the shared
> +        memory region that is the Device Memory Buffer (see
> +        \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
> +        This field is read-only for the driver.  This field is valid
> +        only if VIRTIO_F_DMB has been negotiated.
> +
> +\item[\field{dmb_mem_type}]
> +        The device uses this to report the memory type of the Device
> +        Memory Buffer region (see
> +        \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
> +        This field is read-only for the driver.  Unlike
> +        \field{dmb_shm_id}, this field is valid whenever the device
> +        offers VIRTIO_F_DMB, because the driver reads it in order to
> +        decide whether to accept the feature.
>  \end{description}
>  
>  \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
> @@ -495,6 +515,13 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  to ensure that indices of valid admin queues fit into
>  a 16 bit range beyond all other virtqueues.
>  
> +If the device offers VIRTIO_F_DMB, the device MUST present the common
> +configuration structure with a \field{length} that is large enough to
> +include the \field{dmb_mem_type} field, and \field{dmb_shm_id} MUST equal
> +the \field{id} of a VIRTIO_PCI_CAP_SHARED_MEMORY_CFG capability that the
> +device presents.  Since \field{id} in \field{virtio_pci_cap} is 8 bits,
> +the high-order 8 bits of \field{dmb_shm_id} MUST be zero.
> +
>  \drivernormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
>  
>  The driver MUST NOT write to \field{device_feature}, \field{num_queues},
> @@ -531,6 +558,12 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  The driver MAY configure fewer administration virtqueues than
>  supported by the device.
>  
> +The driver MUST NOT read \field{dmb_shm_id} unless VIRTIO_F_DMB has
> +been negotiated.
> +
> +The driver MUST NOT read \field{dmb_mem_type} unless the device offers
> +VIRTIO_F_DMB.
> +
>  \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
>  
>  The notification location is found using the VIRTIO_PCI_CAP_NOTIFY_CFG
> -- 
> 2.47.1

