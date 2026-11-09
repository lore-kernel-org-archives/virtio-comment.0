Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.245.243.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234931;
	b=uguxaQwTywzKPiJp4K8hbk4bruO0PABaUV/D5l4DETviNDviiJwInWbxNP93FD6GHuhE
	 slp2DIzspN6MSlSPTk6knSa1MyAw7qHAZuAxhe4bCVuunRDUg+ArLN6yX+OCwZ1HCgtd7
	 ND9sqSCkZAIIjXGu5QJBqGC5rCKn6MkN2EzmAGT059O9xf32B9qUwICVdNOmgdrTnCB39
	 eyOlh1GR1We58hw1HrX8K35KFRVQ7tKRPeXOHBaLdV8+NMEWrPiEH3Bb39kGz0Zd/wsXc
	 02twVxxx9jgxvirFremxQp46nyAQgWlRjMTcsqhpLKxgKHff4UYsPwrbRMA+vkGPsGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234931;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=p3Wacr7/BtQ22IlALKw7CduMthMK96XOWlFZERDfqBI=;
	b=pi0O2XhH06MXZXiz9o0J0MMz23RQAk9jhI5ss/SerJ/E5EcWx9TZjS2BEL7njHmoF17m
	 rU9DNH15BDdf6ioUASnrBAwkhaFgPoGSJCDUkdAnKLHnPKeAQ9Wi2EluIx7gWFu6GT9pn
	 ry7o/MY8kAL4+4Ez9hJ74jL88JeDgH7l92sSDyvw0OMmBpejR7Twjf0r9uzICjJkX20Pm
	 ggil1VKw9JfBBY1CydUmtoFUaGI+BGG9ytJ5U1C91IWPDmDXTiP/kLRL+f2GmoaZdjNOJ
	 WYFTVt8qYHHPAy0ioLRFCnkCqxkn5obMw8iWYahkWkO9e7vbjSzeUTQ5H3L2mSEp+ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.co.uk;
	spf=pass smtp.mailfrom=amazon.co.uk;
	dkim=pass header.d=amazon.co.uk header.i=@amazon.co.uk header.a=rsa-sha256 header.s=amazoncorp2 header.b=dpDK4iNy;
	arc=none smtp.remote-ip=44.245.243.92
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DB6606A326
	for <virtio-comment@lists.linux.dev>; Mon,  9 Nov 2026 14:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80DB6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.co.uk header.i=@amazon.co.uk header.a=rsa-sha256 header.s=amazoncorp2 header.b=dpDK4iNy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1794234930; x=1825770930;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p3Wacr7/BtQ22IlALKw7CduMthMK96XOWlFZERDfqBI=;
  b=dpDK4iNyayGp6I3oO4TAnMf4PHJDRKWlAn7zZOo+c1Xe0eUd12GQwMDF
   O/3M4VU1ITNtLU87cX/yzW2XHiC3sz51LyrFEatnU/1Ab7nbNCmHlIi2h
   bzSgIdWNaNPuqy8KaN5CsRn38i3Vir0/k6tutP+xX4ngQZoT8vgVzJvtL
   lRvyZxmk6EDKy/Hfi0nMqGU6ueRxiGRWMrbtaEnsgVS9zN+pVqU7Rg5V4
   XhkKAS6ke/W1BGCrtt7UhWy8z2IwecpGTfOSmHL21BfHWBdH1OCHs8JhU
   woYoILy1J7JhxzJFothM6C9nt5eZnbG/plRjmJLXVHMhgpuspkpUanpGm
   g==;
X-CSE-ConnectionGUID: JWpn6B3YQQeSN6J/VoNJkQ==
X-CSE-MsgGUID: ZrlrT6B2STi47bT/GS2XKQ==
X-IronPort-AV: E=Sophos;i="6.27,203,1787011200"; 
   d="scan'208";a="33030189"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 14:35:27 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:2960]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.142:2525] with esmtp (Farcaster)
 id 837d955f-fe25-4c9a-bc8e-0c3e3003c620; Mon, 9 Nov 2026 14:35:27 +0000 (UTC)
X-Farcaster-Flow-ID: 837d955f-fe25-4c9a-bc8e-0c3e3003c620
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 9 Nov 2026 14:35:27 +0000
Received: from 842f578aa477.amazon.com (10.106.83.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 9 Nov 2026 14:35:25 +0000
From: Jasper Wise <jaspwise@amazon.co.uk>
To: <virtio-comment@lists.linux.dev>
CC: Alexander Graf <graf@amazon.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Matias Ezequiel Vara Larsen
	<mvaralar@redhat.com>, Parav Pandit <parav@nvidia.com>,
	<nh-open-source@amazon.com>
Subject: [PATCH v6] Add VIRTIO_F_DMB (Device Memory Buffer)
Date: Mon, 9 Nov 2026 14:34:51 +0000
Message-ID: <20261109143451.60558-1-jaspwise@amazon.co.uk>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

From: Alexander Graf <graf@amazon.com>

Virtio devices assume R/W access of guest RAM to perform DMA into it to
access its virt queues and data to operate on. This basic assumption
leads to multiple problems:

Confidential Compute - In SEV-SNP or TDX, the host has no direct access
                       to all of guest RAM. We work around DMA access by
                       having the guest limit DMA access to a common
                       shared memory window between guest and host
                       (swiotlb).

Vhost-user - vhost-user backends require access to all guest memory, not
             only the memory they are actually supposed to access. This
             is fine for trusted backends, but if you want to limit
             visibility into guest, you need to do weird stunts like
             bouncing memory in the vmm [1].

To restrict DMA visibility, virtio-iommu allows the guest to open specific
windows into guest memory to the device, but it comes with its own bag
of problems, such as dynamic allocations and complicated device <->
iommu connections that need to be represented reliably.

Instead, introduce a simple mechanism that lets a device communicate
through its own dedicated shared memory region: Device Memory Buffer.
A device that offers Device Memory Buffer exposes a shared memory
region, owned by the device, in which the driver places the virtqueues
and the buffers they reference.

Once VIRTIO_F_DMB is negotiated, an imaginary per-device IOMMU
translates bus address N to position N in the region, for every N from
16 up to the region's length, and translates no other address. That
covers the virtqueues, the buffers, and memory a request refers to, such
as the backing pages a GPU driver attaches to a resource. To process
virtqueues the device reads and writes no guest memory outside the
region. Addresses that are protocol messages about guest memory, such as
balloon page frame numbers, keep the meaning their device type gives
them.

Without VIRTIO_F_DMB, a driver passes physical addresses, or addresses
that the platform IOMMU translates if it negotiated
VIRTIO_F_ACCESS_PLATFORM. VIRTIO_F_DMB is an exception to both for the
addresses it reinterprets.

The device reports the region's shmid in dmb_shm_id on PCI and DMBSHMId
on MMIO, so the shmid does not collide with device-specific or future
transport-specific shared memory regions. The driver locates the region
through the existing Shared Memory Regions facility, VIRTIO_F_DMB needs
a transport that supports SHM.

The region's shmid only has to differ from the device's other regions
and avoid values its device type names; values reserved for future use
stay available. virtio-gpu and virtio-scmi assign a fixed shmid to every
region, so those sections now exempt the Device Memory Buffer from their
rules. A driver reads the region's shmid before negotiation, so the
exemption has to hold from the moment the device offers the feature. The
device designates the region as soon as it offers VIRTIO_F_DMB and keeps
it whether or not the driver accepts.

The device also reports the Device Memory Buffer memory type, in
dmb_mem_type on PCI and DMBMemType on MMIO. The only type defined here is
VIRTIO_DMB_MEM_TYPE_COHERENT, under which driver and device accesses are
mutually visible without cache maintenance. A region is not obliged to be
coherent (virtio-gpu already enumerates four cache behaviours for its own
regions in VIRTIO_GPU_MAP_CACHE_*), so a driver reads the type before it
accepts the feature and declines one it does not know.

[1] https://lore.kernel.org/qemu-devel/20260723-vhost-user-isolated-memory-v1-0-6b97c439eb28@gmail.com/T/#t

Assisted-by: Kiro:claude-opus-5
Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Jasper Wise <jaspwise@amazon.co.uk>
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/248
---

Link: https://lore.kernel.org/virtio-comment/20260702040006.65669-1-graf@amazon.com/ [v1]
Link: https://lore.kernel.org/virtio-comment/20260716215426.46037-1-graf@amazon.com/ [v2]
Link: https://lore.kernel.org/virtio-comment/20260804161202.38619-1-graf@amazon.com/ [v3]
Link: https://lore.kernel.org/virtio-comment/20260817022720.52650-1-graf@amazon.com/ [v4]
Link: https://lore.kernel.org/virtio-comment/20260818060255.6853-1-graf@amazon.com/ [v5]

v1 -> v2:
  - Replace the fixed reserved shmid 2 and its registry with a shmid the
    device reports per transport, as Stefan Hajnoczi suggested on v1
  - Spell out per-transport compatibility for dmb_shm_id and DMBSHMId
  - Set FAILED when the driver cannot find the region, rather than refuse
    to negotiate
  - List VIRTIO_F_DMB under CCW's features reserved for future use

v2 -> v3:
  - Require the region to be memory the driver shares with the device
  - Require coherency; couple VIRTIO_F_DMB to VIRTIO_F_ORDER_PLATFORM,
    replacing v2's sentence on the areas' interaction with it
  - Reserve offset 0 in the region
  - Except the Device Memory Buffer from the shared-region prohibition
  - Allow a device to expose further shared memory regions
  - Move bit 44 into the queue and feature negotiation reserved list
  - Aim two cross-references at the Reserved Feature Bits chapter

v3 -> v4:
  - Decouple VIRTIO_F_DMB from VIRTIO_F_ACCESS_PLATFORM and
    VIRTIO_F_ORDER_PLATFORM
  - Describe the mapping as a per-device IOMMU instead of as offsets into
    the region (Michael)
  - Report the region's memory type in the transport (Michael)
  - Let a device require either VIRTIO_F_DMB or VIRTIO_F_ACCESS_PLATFORM
    (Michael)
  - Require the region's base address to be aligned (Michael)
  - State the property the mapping must have instead of how to map
    (Michael)
  - State the negotiation condition once per normative section (Michael)
  - Rewrite description

v4 -> v5:
  - Carry the imaginary IOMMU through the normative sections instead of
    falling back to addresses into a region (Michael)
  - Leave the region's first 16 bytes unmapped instead of forbidding
    address 0 structure by structure, and state the alignment as 16 bytes
    (Michael)
  - Say bus address space rather than IOVA space (Michael asked for DMA
    address space; neither term appears in the specification, and
    VIRTIO_F_ACCESS_PLATFORM introduces bus address)
  - Exclude notifications rather than IRQ logic, and say that DMB does not
    make a notification an ordering point (Michael)
  - Give the Device Memory Buffer memory type its own subsection and a
    name, VIRTIO_DMB_MEM_TYPE_COHERENT, and justify the field's
    extensibility in the description (Michael)
  - Require what the device reports about coherency rather than what it
    ensures about the driver's mapping (Michael)
  - Keep RFC 2119 keywords out of the descriptive text and give the
    bounds, alignment, rejection, length, FAILED and DEVICE_NEEDS_RESET
    rules a descriptive counterpart (Michael)
  - Drop the shmid and further-regions requirements the transport
    sections already carry (Michael)
  - Drop the sentence leaving the driver's mapping to the platform
    (Michael)
  - Say negotiated rather than active, and apply if rather than apply once
    (Michael)
  - Say cache maintenance operations by either side (Michael)
  - Except VIRTIO_F_DMB from the requirement to pass only physical
    addresses when VIRTIO_F_ACCESS_PLATFORM is not offered
  - Require the region to be long enough to hold the virtqueues

v5 -> v6:
  - Let a device treat an access outside the mapping as an error it
    cannot recover from and set DEVICE_NEEDS_RESET, or ignore it, instead
    of requiring the former
  - State the mapping's extent once, as bus address N at position N for
    every N from 16 up to the region's length, instead of saying both that
    it starts at the first byte and that it skips the first 16 (Matias)
  - Define once when an access lies within the mapping, and use that in
    the driver and the device requirements
  - Check the areas when the driver enables a virtqueue rather than when
    it programs each area's address
  - Say that every virtqueue or buffer address the specification calls
    physical is a bus address into the Device Memory Buffer once
    VIRTIO_F_DMB has been negotiated (Matias)
  - Extend that to memory a request refers to, such as the backing pages
    a GPU driver attaches to a resource, and say that the device reads
    and writes no guest memory outside the Device Memory Buffer
  - Leave the device's own memory, shared memory regions included, out
    of that rule
  - Except virtqueue, buffer and request memory addresses from both halves
    of the VIRTIO_F_ACCESS_PLATFORM driver requirement, not only from the
    one without it
  - Keep protocol addresses, such as balloon page frame numbers, free page
    hints and reports, and memory device plug and unplug ranges, at the
    meaning their device type gives them
  - Designate the Device Memory Buffer when the device offers
    VIRTIO_F_DMB, keep it the same through negotiation, and make
    dmb_shm_id and DMBSHMId valid from then, as dmb_mem_type already is
  - Require the Device Memory Buffer's shmid to differ from the device's
    other regions and from every value its device type names, leaving
    values reserved for future use available, and exclude it from the
    virtio-gpu and virtio-scmi shmid rules (Matias)
  - Except the Device Memory Buffer where the shared memory chapter says a
    shmid's meaning is device-specific and that regions are addressed by
    offset
  - Size the region for the 16 unmapped bytes, the areas' alignment and
    both the split and, if offered, the packed layout at maximum queue
    size, and name those two layouts instead of saying virtqueue layout
  - Drop the rule that had the device judge what the driver's platform
    permits
  - Say that the driver places the virtqueues and the buffers in the
    Device Memory Buffer, rather than that the region holds them
    (Parav)

 conformance.tex                   |   2 +
 content.tex                       |  35 +++-
 device-types/gpu/description.tex  |   6 +-
 device-types/scmi/description.tex |   6 +-
 shared-mem.tex                    | 265 +++++++++++++++++++++++++++++-
 transport-ccw.tex                 |   1 +
 transport-mmio.tex                |  29 ++++
 transport-pci.tex                 |  36 ++++
 8 files changed, 366 insertions(+), 14 deletions(-)

diff --git a/conformance.tex b/conformance.tex
index 9af31e2..cf4259d 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -104,6 +104,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:General Initialization And Device Operation / Device Initialization}
 \item \ref{drivernormative:General Initialization And Device Operation / Device Cleanup}
 \item \ref{drivernormative:Reserved Feature Bits}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts}
@@ -191,6 +192,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Packed Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Packed Virtqueues / Scatter-Gather Support}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
 \item \ref{devicenormative:Reserved Feature Bits}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}
diff --git a/content.tex b/content.tex
index 243ce2d..3625244 100644
--- a/content.tex
+++ b/content.tex
@@ -102,10 +102,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \begin{description}
 \item[0 to 23, 41, 42 and 50 to 127] Feature bits for the specific device type
 
-\item[24 to 40, and 43] Feature bits reserved for extensions to the queue and
+\item[24 to 40, 43 and 44] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
 
-\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[45 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
@@ -946,6 +946,15 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
    suspend the device by set the SUSPEND bit to 1.
    See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
 
+  \item[VIRTIO_F_DMB(44)] This feature indicates that the device offers a
+  Device Memory Buffer: a shared memory region, owned by the device, in
+  which the driver places the virtqueues and the buffers they reference.
+  When this feature has been negotiated, every device access to a virtqueue,
+  to a buffer, or to memory a request refers to is routed through a static,
+  imaginary, per-device transparent IOMMU which translates a bus address to
+  the same position in the Device Memory Buffer region.
+  See \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
@@ -953,11 +962,15 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 A driver MUST accept VIRTIO_F_VERSION_1 if it is offered.  A driver
 MAY fail to operate further if VIRTIO_F_VERSION_1 is not offered.
 
-A driver SHOULD accept VIRTIO_F_ACCESS_PLATFORM if it is offered, and it MUST
-then either disable the IOMMU or configure the IOMMU to translate bus addresses
-passed to the device into physical addresses in memory.  If
-VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass only physical
-addresses to the device.
+A driver SHOULD accept VIRTIO_F_ACCESS_PLATFORM if it is offered, and it
+MUST then either disable the IOMMU or configure the IOMMU to translate bus
+addresses passed to the device into physical addresses in memory.  If
+VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass only
+physical addresses to the device.  If VIRTIO_F_DMB has been negotiated,
+neither of these applies to the address of a virtqueue part, of a buffer or
+of memory a request refers to, other than a protocol address, which the
+driver MUST instead pass as an address into the Device Memory Buffer (see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
 
 A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered.
 
@@ -982,6 +995,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
 A driver SHOULD accept VIRTIO_F_NOTIF_CONFIG_DATA if it is offered.
 
+For the driver requirements that apply if VIRTIO_F_DMB has been
+negotiated, see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
+
 \devicenormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
 
 A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate further
@@ -1011,6 +1028,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 and presents a PCI SR-IOV capability structure, otherwise
 it MUST NOT offer VIRTIO_F_SR_IOV.
 
+For the device requirements that apply if VIRTIO_F_DMB has been
+negotiated, see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
+
 \section{Legacy Interface: Reserved Feature Bits}\label{sec:Reserved Feature Bits / Legacy Interface: Reserved Feature Bits}
 
 Transitional devices MAY offer the following:
diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index ac3b427..4f60fbd 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -97,8 +97,10 @@ \subsubsection{Events}
 choose to use a fallback, such as 1024x768 at display 0.
 
 The driver SHOULD query all shared memory regions supported by the device.
-If the device supports shared memory, the \field{shmid} of a region MUST
-(see \ref{sec:Basic Facilities of a Virtio Device /
+If the device supports shared memory, the \field{shmid} of a region other
+than the Device Memory Buffer (see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer})
+MUST (see \ref{sec:Basic Facilities of a Virtio Device /
 Shared Memory Regions}~\nameref{sec:Basic Facilities of a Virtio Device /
 Shared Memory Regions}) be one of the following:
 
diff --git a/device-types/scmi/description.tex b/device-types/scmi/description.tex
index c4b8dd0..f266240 100644
--- a/device-types/scmi/description.tex
+++ b/device-types/scmi/description.tex
@@ -247,8 +247,10 @@ \subsubsection{Shared Memory Operation}
 an SCMI statistics shared memory region using a virtio shared memory
 region.
 
-If the device implements a shared memory region, the device MUST assign
-the corresponding shmid as per the following table:
+If the device implements a shared memory region other than the Device
+Memory Buffer (see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}),
+the device MUST assign the corresponding shmid as per the following table:
 
 \begin{tabular}{|l|l|}
 \hline
diff --git a/shared-mem.tex b/shared-mem.tex
index 6e6f6c4..85b1f74 100644
--- a/shared-mem.tex
+++ b/shared-mem.tex
@@ -16,7 +16,8 @@ \section{Shared Memory Regions}\label{sec:Basic Facilities of a Virtio Device /
 
 A device may have multiple shared memory regions associated with
 it.  Each region has a \field{shmid} to identify it, the meaning
-of which is device-specific.
+of which is device-specific, except for the Device Memory Buffer (see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}), whose \field{shmid} the transport reports.
 
 Enumeration and location of shared memory regions is performed
 in a transport-specific way.
@@ -32,11 +33,269 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
 within shared memory and for requests placed in virtqueues that
 refer to shared memory.
 The \field{shmid} may be explicit or may be inferred from the
-context of the reference.
+context of the reference.  The Device Memory Buffer is an exception: the
+driver and the device refer to it by bus address (see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
 
 \devicenormative{\subsection}{Shared Memory Regions}{Basic Facilities of a Virtio
 Device / Shared Memory Regions}
 Shared memory regions MUST NOT expose shared memory regions which
 are used to control the operation of the device, nor to stream
-data.
+data, other than the Device Memory Buffer (see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
 
+\subsection{Device Memory Buffer}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
+
+A device that offers VIRTIO_F_DMB (see \ref{sec:Reserved Feature Bits})
+designates exactly one of its shared memory regions as the \emph{Device
+Memory Buffer}, and reports that region's \field{shmid} through a
+transport-specific
+mechanism: \field{dmb_shm_id} in the common configuration structure on the
+PCI transport (see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}),
+and \field{DMBSHMId} on the MMIO transport (see
+\ref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}).
+The driver reads that \field{shmid} and locates the region using the
+transport-specific shared memory region enumeration mechanism, in the same
+way as any other shared memory region.  Because both the \field{shmid}
+report and that enumeration are transport-specific, VIRTIO_F_DMB is
+available only on transports that define a shared memory region discovery
+mechanism.  The device can expose further shared memory regions alongside
+the Device Memory Buffer; the Device Memory Buffer is the one whose
+\field{shmid} it reports.  The designation holds whether or not the driver
+accepts VIRTIO_F_DMB, so the region and its \field{shmid} are the same
+before and after feature negotiation, and a driver can tell the Device
+Memory Buffer apart from the device's other shared memory regions before
+it decides.  That \field{shmid} differs from the \field{shmid} of every
+other shared memory region the device exposes and avoids every value the
+device type assigns a meaning to, where a value the device type names,
+even as undefined, counts as assigned and a value reserved for future use
+does not.  A GPU device, whose device type names \field{shmid} 0 and 1,
+reports a different value for its Device Memory Buffer even when it
+exposes neither of its own regions, and an SCMI device picks a value its
+device type reserves for future use.  If the driver
+cannot locate the region the feature is unusable, and the driver reports
+that through the FAILED \field{device status} bit instead of proceeding.
+
+Every device access to a virtqueue, to a buffer, or to memory a request
+refers to is routed through a static, imaginary, per-device transparent
+IOMMU which translates bus address $N$ to position $N$ in the Device Memory
+Buffer region.  The mapping covers every $N$ from 16 up to, but not
+including, the region's length, and no other bus address.  The device
+performs those accesses against the region and no longer against the
+transport bus's address space.  A notification is not such an access:
+notifications continue to reach the device and the driver by the means the
+transport defines, and VIRTIO_F_DMB does not route them through the mapping.
+The device's other shared memory regions are not affected either: they are
+the device's own memory, the mapping does not cover them, and the device
+keeps using them as its device type defines, for example the host visible
+memory region of a GPU device.  Memory internal to the device or provided
+by it, such as the host backing of a GPU resource or the persistent memory
+a pmem device exposes, is not affected either: VIRTIO_F_DMB restricts what
+the device reads and writes of guest memory, and memory the device itself
+provides is not guest memory.  Memory a protocol address names stays out
+of the device's reach even where the device provides it, as for the blocks
+a memory device plugs.
+
+The virtqueues, the buffers the driver makes available, the indirect
+descriptor tables and all memory a request refers to lie inside the Device
+Memory Buffer region.  Memory a request refers to is memory outside the
+buffers themselves that the device reads or writes at an address the driver
+supplies in a request, such as the backing pages that a GPU device driver
+attaches to a resource.  Some device types also use addresses as protocol
+messages about guest memory rather than as pointers to data the device
+moves, such as the page frame numbers a balloon device inflates and
+deflates, the free pages a balloon device learns about through free page
+hinting and free page reporting, and a range a memory device plugs or
+unplugs.  Such a \emph{protocol address} keeps the meaning its device type
+gives it, even where it is the address of a buffer: the driver does not
+place the memory it names in the Device Memory Buffer, the mapping does not
+apply to it, and the device does not read or write that memory.  Because
+the virtqueues, the buffers and the memory requests refer to all lie inside
+the region, the region's length limits how much the driver can have
+outstanding at one time.
+The part of the region that the mapping covers is at least large enough to
+hold the Descriptor Area, Driver Area and Device Area of every virtqueue the
+device can expose, at the maximum queue size the device reports for it and
+at the alignment each area requires, laid out as a split virtqueue and, if
+the device offers VIRTIO_F_RING_PACKED, also as a packed virtqueue; the room
+a driver needs beyond that depends on how many buffers it keeps outstanding.
+An address that, together with the length of the structure it refers to,
+does not lie entirely within the part of the region that the mapping covers
+falls outside the mapping.  The device does not access the region or any
+other memory for such an address.  A device can treat it as an error it
+cannot recover from and set the DEVICE_NEEDS_RESET \field{device status}
+bit, or just ignore the access.  Which of the two it does is a device
+choice, so a driver cannot rely on DEVICE_NEEDS_RESET to learn that it
+supplied such an address.
+
+The base address of the Device Memory Buffer region is 16-byte aligned.
+Positions 0 to 15 are part of the region, but no bus address reaches them.
+16 bytes is the largest alignment that a part of a split or a packed
+virtqueue requires (see \ref{sec:Basic Facilities of a Virtio Device / Split Virtqueues} and
+\ref{sec:Packed Virtqueues / Structure Size and Alignment}), so the lowest
+address the mapping does cover already satisfies every part's alignment.
+Address 0 is therefore never a valid address, and both the driver and the
+device can use it in their own bookkeeping to mean something other than a
+location in the region, such as ``not in use'' or ``failed allocation'',
+without ever supplying it to the other side.
+
+VIRTIO_F_DMB is independent of VIRTIO_F_ACCESS_PLATFORM.  A device can offer
+both, and can require one of them, but neither implies the other.  A driver
+that has negotiated VIRTIO_F_DMB supplies addresses into the Device Memory
+Buffer whether or not it has also negotiated VIRTIO_F_ACCESS_PLATFORM (see
+\ref{sec:Reserved Feature Bits}).  Wherever this specification describes the
+address of a virtqueue part, of a buffer or of memory a request refers to as
+a physical address or as guest pages, such as the \field{addr} field of a
+descriptor, \field{queue_desc} on the PCI transport or \field{QueueDescLow}
+on the MMIO transport, that address is instead a bus address that the
+imaginary IOMMU maps into the Device Memory Buffer once VIRTIO_F_DMB has
+been negotiated, unless it is a protocol address.
+
+VIRTIO_F_DMB does not change the memory ordering requirements for the
+Descriptor, Driver and Device Areas, and neither does the Device Memory
+Buffer memory type.  Every access those requirements order falls inside the
+Device Memory Buffer region, so the barriers a split or packed virtqueue
+requires before it exposes a descriptor apply unchanged, and
+VIRTIO_F_ORDER_PLATFORM (see \ref{sec:Reserved Feature Bits}) governs which
+barriers the driver emits.  A notification is not one of those accesses, and
+VIRTIO_F_DMB does not make it one.
+
+\subsubsection{Device Memory Buffer memory type}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer / Device Memory Buffer memory type}
+
+Memory consistency rules for a shared memory region are specified per region
+and per device (see \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions}).
+For the Device Memory Buffer they follow from its memory type, which the
+device reports through a transport-specific mechanism: \field{dmb_mem_type}
+in the common configuration structure on the PCI transport, and
+\field{DMBMemType} on the MMIO transport.  The driver reads the memory type
+before it accepts VIRTIO_F_DMB and declines the feature if it does not
+support the type reported, so a memory type added by a later revision of
+this specification does not change what an existing driver does.  The
+following Device Memory Buffer memory types are defined:
+
+\begin{lstlisting}
+/* Driver and device accesses are mutually visible without cache maintenance */
+#define VIRTIO_DMB_MEM_TYPE_COHERENT 0
+\end{lstlisting}
+
+Any other value is reserved for future use.
+
+VIRTIO_DMB_MEM_TYPE_COHERENT means that a write the driver performs to the
+Device Memory Buffer region becomes visible to the device, and a write the
+device performs to the region becomes visible to the driver, without either
+side performing cache maintenance operations such as a cache flush.  That is
+a property of the memory the device exposes rather than of the mapping the driver establishes
+over it: the driver needs some mapping in any case, and this memory type
+tells it that no cache maintenance is needed to make its own accesses and
+the device's mutually visible.
+
+\drivernormative{\subsubsection}{Device Memory Buffer}{Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
+
+The driver MUST NOT accept VIRTIO_F_DMB unless the Device Memory Buffer
+memory type that the device reports through the transport-specific mechanism
+is a value that this specification defines and that the driver supports.
+
+The requirements in the remainder of this section apply if VIRTIO_F_DMB has
+been negotiated.
+
+The driver MUST read the \field{shmid} that the device reports through the
+transport-specific mechanism and MUST locate that shared memory region using
+the transport-specific shared memory region enumeration mechanism.  If the
+driver cannot locate the region, it MUST set the FAILED
+\field{device status} bit.
+
+The driver MUST place the Descriptor Area, Driver Area and Device Area of
+every virtqueue within the Device Memory Buffer region, and MUST treat every
+address of a virtqueue part, of a buffer or of memory a request refers to
+that it supplies, other than a protocol address, as an address the imaginary
+IOMMU maps into that region, including such an address that this
+specification elsewhere describes as a physical address.  The driver MUST
+choose each area's address such that the address satisfies the alignment
+that the split or packed virtqueue in use requires of that area.
+
+For every buffer that the driver makes available to the device, for every
+indirect descriptor table if VIRTIO_F_INDIRECT_DESC has been negotiated, and
+for all memory a request refers to, the driver MUST place it within the
+Device Memory Buffer region, unless its address is a protocol address.
+
+The driver MUST NOT supply an address of a virtqueue part, of a buffer or of
+memory a request refers to, other than a protocol address, such that an
+access to the structure it refers to does not lie within the mapping (see
+the device requirements below), and MUST NOT make available a buffer that
+does not fit within the mapping unless its address is a protocol address.
+
+\devicenormative{\subsubsection}{Device Memory Buffer}{Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
+
+A device MUST NOT offer VIRTIO_F_DMB unless the transport provides a
+shared memory region discovery mechanism.
+
+A device MAY require that the driver accept VIRTIO_F_DMB, that the driver
+accept VIRTIO_F_ACCESS_PLATFORM, or that the driver accept at least one of
+the two.  A device that requires at least one of the two MUST fail to set
+the FEATURES_OK \field{device status} bit when the driver writes it having
+accepted neither.
+
+A device that offers VIRTIO_F_DMB MUST report the Device Memory Buffer
+memory type through the transport-specific mechanism, and MUST report a
+value that this specification defines.
+
+A device MUST NOT report VIRTIO_DMB_MEM_TYPE_COHERENT unless a write that
+the driver performs to the Device Memory Buffer region becomes visible to
+the device, and a write that the device performs to the region becomes
+visible to the driver, without either side performing cache maintenance
+operations.
+
+A device that offers VIRTIO_F_DMB MUST report as the Device Memory Buffer's
+\field{shmid} a value that no other shared memory region of the device uses
+and to which its device type assigns no meaning, and MUST designate the
+same region, with the same \field{shmid}, whether or not the driver
+accepts VIRTIO_F_DMB.  A value the device type names, including a value it
+names as undefined or invalid, has a meaning assigned; a value the device
+type reserves for future use does not.
+
+A device that offers VIRTIO_F_DMB MUST report a Device Memory Buffer region
+whose base address is 16-byte aligned and whose length exceeds 16 bytes by
+at least enough to hold the Descriptor Area, Driver Area and Device Area of
+every virtqueue it can expose, at the maximum queue size it reports for
+that virtqueue and at the alignment each area requires, laid out as a split
+virtqueue and, if it offers VIRTIO_F_RING_PACKED, also as a packed
+virtqueue.
+
+The remaining requirements in this section apply if VIRTIO_F_DMB has been
+negotiated.
+
+The imaginary IOMMU described in
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
+maps each bus address $N$ from 16 up to, but not including, the length of
+the Device Memory Buffer region to position $N$ in the region, and maps no
+other bus address.  An access of length $L$ at bus address $A$ lies within
+the mapping if the mapping maps $A$, $A + L$ does not exceed $2^{64}$, and the
+mapping maps every bus address from $A$ up to, but not including, $A + L$.
+
+The device MUST interpret every address of a virtqueue part, of a buffer or
+of memory a request refers to that the driver supplies, other than a
+protocol address, as a bus address the imaginary IOMMU maps, including an
+address this specification elsewhere describes as a physical address.
+
+For an access that lies within the mapping, the device MUST perform the
+access at the corresponding positions in the region, and MUST NOT perform
+it anywhere else.  The device MUST NOT perform any part of an access that
+does not lie within the mapping.
+
+A device that treats an access that does not lie within the mapping as an
+error it cannot recover from MUST check, when the driver enables a
+virtqueue, that an access to the whole of its Descriptor Area, Driver Area
+and Device Area lies within the mapping, and MUST perform the same check on
+every other address of a buffer or of memory a request refers to that the
+driver supplies, other than a protocol address, with the length of the
+structure it refers to, before it uses the address.  If the check fails, the
+device MUST set the DEVICE_NEEDS_RESET \field{device status} bit.
+
+The device MUST NOT read or write guest memory outside the Device Memory
+Buffer region in order to process virtqueues, whether or not the driver
+supplied an address for it.  Memory that the device itself provides and
+that no protocol address names, such as one of its shared memory regions
+or a memory range it reports to the driver, is not guest memory for the
+purposes of this requirement.  The device MUST NOT read or write memory
+that a protocol address names, even where its device type would otherwise
+permit it and even where the device itself provides that memory.
diff --git a/transport-ccw.tex b/transport-ccw.tex
index fe6957d..2c277bf 100644
--- a/transport-ccw.tex
+++ b/transport-ccw.tex
@@ -610,6 +610,7 @@ \subsection{Features reserved for future use}\label{sec:Virtio Transport Options
 \item VIRTIO_F_ADMIN_VQ
 \item VIRTIO_F_RING_RESET
 \item Shared memory regions including VIRTIO_PMEM_F_SHMEM_REGION
+\item VIRTIO_F_DMB
 
 \end{itemize}
 
diff --git a/transport-mmio.tex b/transport-mmio.tex
index cddbcc9..a85f8fd 100644
--- a/transport-mmio.tex
+++ b/transport-mmio.tex
@@ -248,6 +248,23 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
     apply to the queue selected by writing to \field{QueueSel}.
   }
   \hline
+  \mmioreg{DMBSHMId}{Device Memory Buffer shared memory ID}{0x0c4}{R}{%
+    Reading from this register returns the \field{shmid} of the shared
+    memory region that is the Device Memory Buffer (see \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
+    This register is valid whenever the device offers VIRTIO_F_DMB, as
+    opposed to after VIRTIO_F_DMB has been negotiated, so that the driver
+    can identify the Device Memory Buffer before it decides whether to
+    accept the feature.
+  }
+  \hline
+  \mmioreg{DMBMemType}{Device Memory Buffer memory type}{0x0c8}{R}{%
+    Reading from this register returns the Device Memory Buffer memory
+    type (see \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer / Device Memory Buffer memory type}).
+    This register is valid whenever the device offers VIRTIO_F_DMB, as
+    opposed to after VIRTIO_F_DMB has been negotiated, because the driver
+    reads it in order to decide whether to accept the feature.
+  }
+  \hline
   \mmioreg{ConfigGeneration}{Configuration atomicity value}{0x0fc}{R}{
     Reading from this register returns a value describing a version of the device-specific configuration space (see \field{Config}).
     The driver can then access the configuration space and, when finished, read \field{ConfigGeneration} again.
@@ -313,6 +330,12 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
 when queue reset has completed.
 (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
 
+If the device offers VIRTIO_F_DMB, \field{DMBSHMId} MUST equal the
+\field{shmid} of a shared memory region that the device exposes through
+\field{SHMSel}, \field{SHMLenLow}, \field{SHMLenHigh}, \field{SHMBaseLow}
+and \field{SHMBaseHigh}, and \field{DMBMemType} MUST report a Device Memory Buffer
+memory type that this specification defines.
+
 \drivernormative{\subsubsection}{MMIO Device Register Layout}{Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}
 The driver MUST NOT access memory locations not described in the
 table \ref{tab:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}
@@ -367,6 +390,12 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
 that were used before the queue reset.
 (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
 
+The driver MUST NOT read \field{DMBSHMId} unless the device offers
+VIRTIO_F_DMB.
+
+The driver MUST NOT read \field{DMBMemType} unless the device offers
+VIRTIO_F_DMB.
+
 \subsection{MMIO-specific Initialization And Device Operation}\label{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation}
 
 \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Device Initialization}
diff --git a/transport-pci.tex b/transport-pci.tex
index 95b08b8..9f5c077 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -325,6 +325,10 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
         /* About the administration virtqueue. */
         le16 admin_queue_index;         /* read-only for driver */
         le16 admin_queue_num;         /* read-only for driver */
+
+        /* About the Device Memory Buffer. */
+        le16 dmb_shm_id;                /* read-only for driver */
+        le16 dmb_mem_type;              /* read-only for driver */
 };
 \end{lstlisting}
 
@@ -428,6 +432,25 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 	The value 0 indicates no supported administration virtqueues.
 	This field is valid only if VIRTIO_F_ADMIN_VQ has been
 	negotiated.
+
+\item[\field{dmb_shm_id}]
+        The device uses this to report the \field{shmid} of the shared
+        memory region that is the Device Memory Buffer (see
+        \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
+        This field is read-only for the driver.  This field is valid
+        whenever the device offers VIRTIO_F_DMB, as opposed to after
+        VIRTIO_F_DMB has been negotiated, so that the driver can identify
+        the Device Memory Buffer before it decides whether to accept the
+        feature.
+
+\item[\field{dmb_mem_type}]
+        The device uses this to report the Device Memory Buffer memory
+        type (see
+        \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer / Device Memory Buffer memory type}).
+        This field is read-only for the driver.  Like
+        \field{dmb_shm_id}, this field is valid whenever the device
+        offers VIRTIO_F_DMB, because the driver reads it in order to
+        decide whether to accept the feature.
 \end{description}
 
 \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
@@ -495,6 +518,13 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 to ensure that indices of valid admin queues fit into
 a 16 bit range beyond all other virtqueues.
 
+If the device offers VIRTIO_F_DMB, the device MUST present the common
+configuration structure with a \field{length} that is large enough to
+include the \field{dmb_mem_type} field, and \field{dmb_shm_id} MUST equal
+the \field{id} of a VIRTIO_PCI_CAP_SHARED_MEMORY_CFG capability that the
+device presents.  Since \field{id} in \field{virtio_pci_cap} is 8 bits,
+the high-order 8 bits of \field{dmb_shm_id} MUST be zero.
+
 \drivernormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
 
 The driver MUST NOT write to \field{device_feature}, \field{num_queues},
@@ -531,6 +561,12 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 The driver MAY configure fewer administration virtqueues than
 supported by the device.
 
+The driver MUST NOT read \field{dmb_shm_id} unless the device offers
+VIRTIO_F_DMB.
+
+The driver MUST NOT read \field{dmb_mem_type} unless the device offers
+VIRTIO_F_DMB.
+
 \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
 
 The notification location is found using the VIRTIO_PCI_CAP_NOTIFY_CFG
-- 
2.50.1

