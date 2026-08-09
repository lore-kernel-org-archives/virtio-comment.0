Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4770EB640
	for <virtio-comment@lists.linux.dev>; Sun,  9 Aug 2026 21:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786312155; cv=none; b=rA2FGb3YZcJb5p5snp04UL0F+Z6QCy7c7riNwau2mqP6vKlC41DMfHjUvkJnZBv0J7ZQnb8tVaxHCPrmDFjCLdGCzaxdt0k+Adnp/nrQHNwDInGZ0uhD8+JPAYXP0x5f4cFKgfH3k7zhmCohGNVO2Z6trCkG37CptWnMutT+Fds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786312155; c=relaxed/simple;
	bh=AN520lQ83I8RgkvviVDLrppUMt+PzQVguQgbwX45mZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UeIHH+3Al0aV8x0UMIgAb6Zw2DtHGetQpwzFjkGN9ssH+wgwWLoCcTH845/lpbVcwJEGIMdbEqTin0fZ+7MLZVdJw6WT836xcUofdxv9EaVbg5ocewv2cqnPw+5lZ0AZDMkk69PCZFcR6jtZYYlzasyWv+bqG2nc0cMCQuLUoSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LrjLFhOv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LrjLFhOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786312152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mu/ieZT3zvaHsJb2YjuHYc/Yuxmh97hgexXAVA4ihTA=;
	b=LrjLFhOvOsxH2l/ADRiJlqhqMZe9FioERqdxRcCiIr3ziDjQHX1Q4aKFsjk6/PrGmW1Ct8
	APOyC2GYYWIfgJkLPZtIAs0Npg7fwGwfiH62ZJBcrLB0voPAVMiBTQx58qD2z8/na4dokA
	fIuvO9jYIkJLEGOW2peF810F36MxlKU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-s3CA8D7MM9-xpuwtd9N1Aw-1; Sun, 09 Aug 2026 17:49:05 -0400
X-MC-Unique: s3CA8D7MM9-xpuwtd9N1Aw-1
X-Mimecast-MFC-AGG-ID: s3CA8D7MM9-xpuwtd9N1Aw_1786312145
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4955fd77c18so7688915e9.2
        for <virtio-comment@lists.linux.dev>; Sun, 09 Aug 2026 14:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786312144; x=1786916944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mu/ieZT3zvaHsJb2YjuHYc/Yuxmh97hgexXAVA4ihTA=;
        b=gTXichNf1oSGOiv1R7bnFOSHD0toDfFu7z4H96TRUctqy+s9SUQ7lAPGN+hN0PGDaw
         MLEAa0Wn14RsezO4ES6sVnZMPMVsEGRNFz4eQw1W4/fKXKksHxJ6r4pEU8VYxAoSMkah
         AY6O98cCByHWWu4i4OayuOunKqyvH/bgOf4Np/YjxWKMSD7pOcaQZFeZD39iGOTfuuP+
         Q2v4r5dGSevCnXjBtaprkyfb0/Gxq7IxRDwuykeMvm0E28B0O59IdzhvkLWjEaYhSoFq
         46XMywTPpDh9hlBh+3G2flBwt458Pd2HM7mL4zg23N8o17avygccVKTmPXZF1HJeI/k2
         P2uA==
X-Gm-Message-State: AOJu0Ywniz99ZtkRxuZ4p3i0ipWTBXvDZCubuFr2VvldOqY7bOT4N0ix
	tV7Hv+oDKf7pf+wAnUHYNdPV4JpUL/dt9LAnm7J04WkLE97qN7DItcs9e6cGMrAAtUIzH2dfrZf
	YiFHRjK3iA4BNDxnASHdgcZ13PQDf6PtvAo7lrGmDYMllYzOEAc62tR7lUP/iK+CMnQ1P
X-Gm-Gg: AR+sD13TZlK65fqa5q8a4h88XmDgADpHTCQMKeT4o3HQTrje4lF4Wsqr9WwDvG/81kG
	sfyllBEN6rWzJb+gJ0g7oPxAijh/Csy8Ei0cXbmNIo5F2LmZJWd3kh3uPUZD8XBH15Fw9kSiBV9
	353ucM1aRXur35O7g53ybTAd9mqz/8oyjpYt4zCEJOVws6EVOjC5WnxJKlV7SiviZE5clpcL48L
	irnhWZ9LqTIlUEi6jU2ckRSm5bugwk+opmrC1eSa3buRgUlmzDwZwgn3l6yOpthiPNc2PbwfZY7
	ucCjO5baVqwzMyRThLmhu1Hiz6JTMpt+ew+WjVgtVR3Il4j0o256C3dXZX9CcLqKY7rF0qpmO0U
	G/suXlHfJxl/m0ePezAOn9w==
X-Received: by 2002:a05:600c:6c06:b0:499:7024:9d4a with SMTP id 5b1f17b1804b1-49970249e66mr3486005e9.8.1786312144073;
        Sun, 09 Aug 2026 14:49:04 -0700 (PDT)
X-Received: by 2002:a05:600c:6c06:b0:499:7024:9d4a with SMTP id 5b1f17b1804b1-49970249e66mr3485635e9.8.1786312143202;
        Sun, 09 Aug 2026 14:49:03 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-39-98.inter.net.il. [80.230.39.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220ab11sm29072167f8f.35.2026.08.09.14.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:49:02 -0700 (PDT)
Date: Sun, 9 Aug 2026 17:48:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowangio@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3] Add VIRTIO_F_DMB (Device Memory Buffer)
Message-ID: <20260809113831-mutt-send-email-mst@kernel.org>
References: <20260716215426.46037-1-graf@amazon.com>
 <20260804161202.38619-1-graf@amazon.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260804161202.38619-1-graf@amazon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p9HiGbrAMYy3H_t6wrfu4CFrsaMqEu-Nd-KZ0LMZuXc_1786312145
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2026 at 04:12:02PM +0000, Alexander Graf wrote:
> When a transport uses a shared bounce region for virtqueue memory today,
> that region is global and shared by multiple devices at once. Devices
> then contend over one small region, so a busy device can starve the
> others, and one device's emulation cannot be isolated or torn down on its
> own because its state lives in memory everyone else is using too.
> 
> VIRTIO_F_DMB gives each device its own shared memory region, the Device
> Memory Buffer, that holds that device's virtqueues (Descriptor, Driver
> and Device Areas) and the buffers the descriptors reference. When the
> feature is negotiated, every address the driver places in a virtqueue is
> an offset into that region rather than a physical or bus address, so the
> device only ever touches memory the driver placed there. Because each
> device owns its region, its emulation can run in a separate host process
> and be terminated independently, and devices no longer contend over one
> shared region.
> 
> The device reports the region's shmid through a transport-specific
> mechanism (dmb_shm_id in the PCI common configuration structure, DMBSHMId
> on MMIO), so the shmid does not collide with device-specific or future
> transport-specific shared memory regions. The driver locates the region
> through the existing Shared Memory Regions facility. VIRTIO_F_DMB refines
> VIRTIO_F_ACCESS_PLATFORM and is negotiated only together with it.
> 
> To provide the confinement guarantee, the device bounds-checks every
> driver-supplied offset against the region and sets DEVICE_NEEDS_RESET on
> violation.
> 
> The general requirement on shared memory regions forbids a device to
> expose a region used to control its operation or to stream data, and a
> Device Memory Buffer is used for both, so it is named as that
> requirement's exception.
> 
> The Device Memory Buffer is memory the driver shares with the device on
> platforms that distinguish shared from private mappings, and the device
> provides coherency without cache maintenance by the driver. A device
> that requires the platform's barriers offers VIRTIO_F_ORDER_PLATFORM,
> and a driver accepts VIRTIO_F_DMB only together with it. Offset 0 in
> the region is reserved: a device that predates the feature reads a
> Descriptor Area address of 0 as a queue that is not in use, as the
> legacy QueuePFN register states.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> ---
> 
> Link: https://lore.kernel.org/virtio-comment/20260702040006.65669-1-graf@amazon.com/ [v1]
> Link: https://lore.kernel.org/virtio-comment/20260716215426.46037-1-graf@amazon.com/ [v2]
> 
> v1 -> v2:
>  - Replace the fixed reserved shmid 2 and its registry with a shmid the
>    device reports per transport, as Stefan Hajnoczi suggested on v1.
>  - Spell out per-transport compatibility for dmb_shm_id and DMBSHMId.
>  - Set FAILED when the driver cannot find the region, rather than refuse
>    to negotiate.
>  - List VIRTIO_F_DMB under CCW's features reserved for future use.
> 
> v2 -> v3:
>  - Require the region to be memory the driver shares with the device.
>  - Require coherency; couple VIRTIO_F_DMB to VIRTIO_F_ORDER_PLATFORM,
>    replacing v2's sentence on the areas' interaction with it.
>  - Reserve offset 0 in the region.
>  - Except the Device Memory Buffer from the shared-region prohibition.
>  - Allow a device to expose further shared memory regions.
>  - Move bit 44 into the queue and feature negotiation reserved list.
>  - Aim two cross-references at the Reserved Feature Bits chapter.
> 
> 
>  conformance.tex    |   2 +
>  content.tex        |  28 ++++++-
>  shared-mem.tex     | 199 ++++++++++++++++++++++++++++++++++++++++++++-
>  transport-ccw.tex  |   1 +
>  transport-mmio.tex |  15 ++++
>  transport-pci.tex  |  20 +++++
>  6 files changed, 262 insertions(+), 3 deletions(-)
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
> index 243ce2d..8c5a844 100644
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
> @@ -946,6 +946,15 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>     suspend the device by set the SUSPEND bit to 1.
>     See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>  
> +  \item[VIRTIO_F_DMB(44)] This feature indicates that the device offers a
> +  Device Memory Buffer: a shared memory region, owned by the device,
> +  that holds the virtqueues and the buffers they reference.  When this feature
> +  is negotiated, every address that the driver places in a virtqueue is an
> +  offset into the Device Memory Buffer region rather than a physical address
> +  or a bus address.  The device is thereby confined to memory the driver has
> +  published in that region.
> +  See \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> @@ -982,6 +991,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  
>  A driver SHOULD accept VIRTIO_F_NOTIF_CONFIG_DATA if it is offered.
>  
> +A driver MUST NOT accept VIRTIO_F_DMB unless it also accepts
> +VIRTIO_F_ACCESS_PLATFORM.  If VIRTIO_F_ORDER_PLATFORM is offered, a driver
> +MUST NOT accept VIRTIO_F_DMB unless it also accepts VIRTIO_F_ORDER_PLATFORM.

Why is that? access platform is for DMA from device of which
there's none here. Both it and order platform are useful to disable
to speed up software configs.



> +For the driver requirements that apply once VIRTIO_F_DMB has been
> +negotiated, see
> +\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
> +
>  \devicenormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
>  
>  A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate further
> @@ -1011,6 +1027,14 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  and presents a PCI SR-IOV capability structure, otherwise
>  it MUST NOT offer VIRTIO_F_SR_IOV.
>  
> +A device that offers VIRTIO_F_DMB MUST also offer VIRTIO_F_ACCESS_PLATFORM.
> +A device that offers VIRTIO_F_DMB MUST also offer VIRTIO_F_ORDER_PLATFORM if
> +the device requires the driver to use memory barriers suitable for devices
> +described by the platform when accessing the Device Memory Buffer region.

This is really vague. On most platforms drivers can map
in any way they want. What is expected here? What barriers to
use will very much depend on that.




In particular, how do you expect this mapped? If cached what forces
the data out of the CPU cache?



> +For the device requirements that apply once VIRTIO_F_DMB has been
> +negotiated, see
> +\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
> +
>  \section{Legacy Interface: Reserved Feature Bits}\label{sec:Reserved Feature Bits / Legacy Interface: Reserved Feature Bits}
>  
>  Transitional devices MAY offer the following:
> diff --git a/shared-mem.tex b/shared-mem.tex
> index 6e6f6c4..3e68f3a 100644
> --- a/shared-mem.tex
> +++ b/shared-mem.tex
> @@ -38,5 +38,202 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
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
> +Unlike an ordinary shared memory region, whose contents are specific to
> +the device type, the Device Memory Buffer holds the structures that the
> +virtio transport would otherwise place in driver memory: the Descriptor
> +Area, the Driver Area and the Device Area of each virtqueue (the concrete
> +structures these areas contain depend on the virtqueue layout in use),
> +together with the data buffers that descriptors refer to and, if
> +VIRTIO_F_INDIRECT_DESC has been negotiated, any indirect descriptor
> +tables.  An ordinary shared memory region is required not to be used to
> +control the operation of the device nor to stream data; the Device Memory
> +Buffer is named as the exception to that requirement (see
> +\ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions}).
> +
> +While VIRTIO_F_DMB is negotiated, the addresses the driver places in a
> +virtqueue are offsets from the start of the Device Memory Buffer region.
> +This applies to the addresses of the Descriptor Area, Driver Area and
> +Device Area that the driver supplies through the transport-specific
> +virtqueue location mechanism, to the \field{addr} field of each
> +descriptor, and, if VIRTIO_F_INDIRECT_DESC has been negotiated, to the
> +address of each indirect descriptor table and to the \field{addr} field
> +of each descriptor within it.  As with other shared memory regions (see
> +\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Addressing within regions }),
> +these references are offsets from the start of the region and are not
> +subject to further platform address translation.
> +
> +Offset 0 is reserved: it is not the address of any structure that the driver
> +places in the region.  A device implementation that predates VIRTIO_F_DMB is
> +told where a virtqueue is by being given the physical address of its Descriptor
> +Area, and takes the absence of an address to mean that the queue is not in use,
> +with the value 0 standing for that absence; the legacy \field{QueuePFN}
> +register on the MMIO transport states the convention outright (see
> +\ref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}).
> +Under VIRTIO_F_DMB the same fields carry offsets, in which 0 names the region's
> +first byte and is as ordinary as any other value, so a driver that placed a
> +Descriptor Area there would hand such a device an address it reads as no
> +address at all.  Reserving the first byte of the region costs the driver at
> +most one alignment unit, because every area has in any case to be aligned as
> +its virtqueue layout requires, and it allows a device to treat an offset of 0
> +as an error rather than as a queue it may ignore.
> +
> +The Device Memory Buffer is shared between the driver and the device:
> +both read and write it.  Data that the driver places in the region is
> +therefore visible to the device and to whatever implements the device.
> +VIRTIO_F_DMB does not make the contents of the region confidential; it
> +confines the device's access \emph{to} the region, so that memory the
> +driver has not placed in the region remains inaccessible to the device.
> +
> +On a platform that distinguishes memory the driver shares with the device
> +from memory that is private to the driver, the Device Memory Buffer region
> +is memory the driver shares with the device.  A region that the driver made
> +private to itself would carry virtqueues the device cannot read and a Device
> +Area the device cannot write.
> +
> +VIRTIO_F_DMB refines VIRTIO_F_ACCESS_PLATFORM.  VIRTIO_F_ACCESS_PLATFORM
> +indicates that device access to memory is limited and/or translated by
> +the platform; VIRTIO_F_DMB is the case in which that limitation takes the
> +form of a single device-associated region and the addresses the driver
> +supplies are offsets into it.  VIRTIO_F_DMB is therefore only defined,
> +and is only negotiated, together with VIRTIO_F_ACCESS_PLATFORM (see the
> +driver and device requirements in
> +\ref{drivernormative:Reserved Feature Bits} and
> +\ref{devicenormative:Reserved Feature Bits}).
> +
> +VIRTIO_F_DMB governs only the placement of the memory the device reads or
> +writes while processing virtqueues.  It does not change the mechanism used
> +to configure virtqueues, to send available buffer or used buffer
> +notifications, or to deliver configuration change notifications: those are
> +conveyed through the transport as usual and are not located within the
> +region.  VIRTIO_F_DMB does not change the memory ordering requirements for
> +the Descriptor, Driver and Device Areas, but it does change where those
> +areas are: in memory the device supplies rather than memory the driver
> +allocates.
> +
> +Those ordering requirements rest on two properties of the memory the areas
> +are in.  The driver and the device observe that memory coherently, so that a
> +write by one becomes visible to the other without any cache maintenance
> +operation by the driver, for which the virtqueue rules give the driver no
> +means.  And unless VIRTIO_F_ORDER_PLATFORM has been negotiated, the barriers
> +the driver uses are only those sufficient for a device that can be assumed to
> +run on identical CPUs in an SMP configuration (see
> +\ref{sec:Reserved Feature Bits}).  When the
> +areas are in driver memory, the driver establishes both properties by
> +allocating that memory itself.  When they are in the Device Memory Buffer,
> +the device supplies the memory, so the device is the party that knows
> +whether either property holds, and the requirements below place both
> +obligations on it.
> +
> +The region's length is reported by the shared memory region descriptor as
> +usual and bounds the amount of virtqueue data that can be in flight at
> +once.  A device can therefore serve a driver whose memory it cannot
> +otherwise access, as in confidential computing.
> +
> +\drivernormative{\subsubsection}{Device Memory Buffer}{Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
> +
> +If VIRTIO_F_DMB has been negotiated, the driver MUST read the
> +\field{shmid} that the device reports through the transport-specific
> +mechanism and MUST locate that shared memory region using the
> +transport-specific shared memory region enumeration mechanism.  If the
> +driver cannot locate the region, it MUST set the FAILED
> +\field{device status} bit.
> +
> +If VIRTIO_F_DMB has been negotiated,



I don't think we need to repeat "If VIRTIO_F_DMB has been negotiated"
every time. Just once + a list.


> the driver MUST place the Descriptor
> +Area, Driver Area and Device Area of every virtqueue within the Device
> +Memory Buffer region, and MUST supply their addresses to the device as
> +offsets from the start of the region.  The driver MUST choose each area's
> +offset such that the region's base address plus the offset satisfies the
> +alignment that the virtqueue layout in use requires of that area.

Hmm.  I would say, just force shmid alignment. No?

> +
> +If VIRTIO_F_DMB has been negotiated, then for every buffer that the driver
> +makes available to the device, and for every indirect descriptor table if
> +VIRTIO_F_INDIRECT_DESC has been negotiated, the driver MUST place it
> +within the Device Memory Buffer region and MUST use its offset from the
> +start of the region as the address written into the descriptor.
> +
> +If VIRTIO_F_DMB has been negotiated, the driver MUST NOT supply an offset
> +that, together with the length of the structure it refers to, lies outside
> +the Device Memory Buffer region, and MUST NOT make available a buffer that
> +does not fit within the region.
> +
> +If VIRTIO_F_DMB has been negotiated, the driver MUST NOT supply an offset of 0
> +as the address of a Descriptor Area, Driver Area or Device Area, as the
> +\field{addr} field of a descriptor, or as the address of an indirect descriptor
> +table.  The first byte of the Device Memory Buffer region is reserved.
> +
> +If VIRTIO_F_DMB has been negotiated, and the platform distinguishes memory
> +that the driver shares with the device from memory that is private to the
> +driver, the driver MUST access the Device Memory Buffer region as memory
> +that is shared with the device.

This is really vague. 


Platforms normally leave this up to drivers, how to map memory.







> +
> +\devicenormative{\subsubsection}{Device Memory Buffer}{Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
> +
> +A device MUST NOT offer VIRTIO_F_DMB unless the transport provides a
> +shared memory region discovery mechanism.
> +
> +A device MUST NOT offer VIRTIO_F_DMB unless the platform permits the driver to
> +access the Device Memory Buffer region as memory that is shared with the
> +device.
> +
> +A device MUST NOT offer VIRTIO_F_DMB unless a write that the driver performs
> +to the Device Memory Buffer region becomes visible to the device, and a write
> +that the device performs to the region becomes visible to the driver, without
> +any cache maintenance operation by the driver.
> +
> +A device that offers VIRTIO_F_DMB MUST expose exactly one shared memory
> +region for the Device Memory Buffer and MUST report that region's
> +\field{shmid} through the transport-specific mechanism.
> +
> +A device that offers VIRTIO_F_DMB MAY expose further shared memory regions in
> +addition to the Device Memory Buffer; the Device Memory Buffer is the one
> +region whose \field{shmid} the device reports through the transport-specific
> +mechanism.
> +
> +If VIRTIO_F_DMB has been negotiated, the device MUST interpret every
> +address supplied by the driver in a virtqueue -- including the Descriptor
> +Area, Driver Area and Device Area addresses, the \field{addr} field of
> +each descriptor, the address of any indirect descriptor table, and the
> +\field{addr} field of each descriptor within an indirect descriptor
> +table -- as an offset from the start of the Device Memory Buffer region,
> +and MUST NOT interpret any such address as a physical or bus address.
> +
> +If VIRTIO_F_DMB has been negotiated, then before accessing any structure
> +that a driver-supplied offset refers to, the device MUST verify that the
> +offset together with the length of that structure lies within the Device
> +Memory Buffer region and does not overflow.  If this verification fails,
> +the device MUST NOT perform the access and MUST set the DEVICE_NEEDS_RESET
> +\field{device status} bit.
> +
> +If VIRTIO_F_DMB has been negotiated, and the driver supplies an offset of 0 as
> +the address of a Descriptor Area, Driver Area or Device Area, the device
> +MUST NOT access that area, and MUST set the DEVICE_NEEDS_RESET
> +\field{device status} bit.  If the driver supplies an offset of 0 as the
> +\field{addr} field of a descriptor or as the address of an indirect descriptor
> +table, the device SHOULD NOT access the structure that offset refers to, and
> +SHOULD set the DEVICE_NEEDS_RESET \field{device status} bit.
> +
> +If VIRTIO_F_DMB has been negotiated, the device MUST NOT access any memory
> +outside the Device Memory Buffer region in order to process virtqueues.
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
> index cddbcc9..bfb349f 100644
> --- a/transport-mmio.tex
> +++ b/transport-mmio.tex
> @@ -248,6 +248,13 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
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
>    \mmioreg{ConfigGeneration}{Configuration atomicity value}{0x0fc}{R}{
>      Reading from this register returns a value describing a version of the device-specific configuration space (see \field{Config}).
>      The driver can then access the configuration space and, when finished, read \field{ConfigGeneration} again.
> @@ -313,6 +320,11 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>  when queue reset has completed.
>  (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
>  
> +If the device offers VIRTIO_F_DMB, \field{DMBSHMId} MUST equal the
> +\field{shmid} of a shared memory region that the device exposes through
> +\field{SHMSel}, \field{SHMLenLow}, \field{SHMLenHigh}, \field{SHMBaseLow}
> +and \field{SHMBaseHigh}.
> +
>  \drivernormative{\subsubsection}{MMIO Device Register Layout}{Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}
>  The driver MUST NOT access memory locations not described in the
>  table \ref{tab:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}
> @@ -367,6 +379,9 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
>  that were used before the queue reset.
>  (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
>  
> +The driver MUST NOT read \field{DMBSHMId} unless VIRTIO_F_DMB has been
> +negotiated.
> +
>  \subsection{MMIO-specific Initialization And Device Operation}\label{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation}
>  
>  \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Device Initialization}
> diff --git a/transport-pci.tex b/transport-pci.tex
> index 95b08b8..c63760a 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -325,6 +325,9 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>          /* About the administration virtqueue. */
>          le16 admin_queue_index;         /* read-only for driver */
>          le16 admin_queue_num;         /* read-only for driver */
> +
> +        /* About the Device Memory Buffer. */
> +        le16 dmb_shm_id;                /* read-only for driver */
>  };
>  \end{lstlisting}
>  
> @@ -428,6 +431,13 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
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
>  \end{description}
>  
>  \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
> @@ -495,6 +505,13 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  to ensure that indices of valid admin queues fit into
>  a 16 bit range beyond all other virtqueues.
>  
> +If the device offers VIRTIO_F_DMB, the device MUST present the common
> +configuration structure with a \field{length} that is large enough to
> +include the \field{dmb_shm_id} field, and \field{dmb_shm_id} MUST equal
> +the \field{id} of a VIRTIO_PCI_CAP_SHARED_MEMORY_CFG capability that the
> +device presents.  Since \field{id} in \field{virtio_pci_cap} is 8 bits,
> +the high-order 8 bits of \field{dmb_shm_id} MUST be zero.
> +
>  \drivernormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
>  
>  The driver MUST NOT write to \field{device_feature}, \field{num_queues},
> @@ -531,6 +548,9 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  The driver MAY configure fewer administration virtqueues than
>  supported by the device.
>  
> +The driver MUST NOT read \field{dmb_shm_id} unless VIRTIO_F_DMB has
> +been negotiated.
> +
>  \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
>  
>  The notification location is found using the VIRTIO_PCI_CAP_NOTIFY_CFG

