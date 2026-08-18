Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9103890EE
	for <virtio-comment@lists.linux.dev>; Tue, 18 Aug 2026 06:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787032984; cv=none; b=gbZKqs9hEqOV7qUUvKE62M32O3i3IvIcgDrbVzzqGyc+WnG31hG0hWaOXW1110lAOiSG4pLbYtiJafd/WB4jK88TVGKJ1JRHfR1U4mJU+0zYQOT7Gjl0odlfZsukHrU2fM1ZjpgLIWJr7kMY7gxTPDGCrxKkbPSGlSN7E6E2ZD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787032984; c=relaxed/simple;
	bh=feKx5KeWfK7MlMA1hrg2ZsDXDXpAEu+opQjKjgDB+zU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sqMO+sUMIi4H15vctjOJpz3THSZzMX5m7AM6DDzEDq6pgZIctJxc83Lox+iGhfJpSIecgUNRl1Tlhwoknxp3FdRwU6rQ9d5xuCKLHS55v/tLArxXhYzObr0JtDdHUqgKzZFPjt9BEvzx8H6lWJO8BVc198F/ngbr1WZMtxkqyjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=PI62umur; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="PI62umur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1787032982; x=1818568982;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I9iwDI3wPVciiWvLieow2u3jsr+u7yV77Ik5SVHOfw4=;
  b=PI62umurzEHlv1xLYFe4xVfppIuxYzPDKcwt8Nc2Y0dLjAe7iuAPnSi/
   nrbZY4jwPbAm+P6BtZBWF6PGdF29ug5WXL65HSuhBVT4V+wchDT/8uUw0
   yboiHJyDAWLNWxTuDAL8syhcJG4iuLPhT1/fnNuS6w/Y4tm3NUWaqB1xj
   ArRDD6+W+tBvJgY3etGGmEKTMOOwwGe/9JnRRJyp4pUiaU7preX4c8Zkz
   S3GKkzzrBffQmnZMvv8sccbGfO3DBhJRc/Uw1AGZ6FRj3hhd1Khq4+LXC
   IIKXgLykVJ/3K6fMyFULKeLHakj/6ZlcbuEFyeZw/lc86/j6WlkQcU5Wk
   Q==;
X-CSE-ConnectionGUID: FUKyUE85Q7KomkiQtAVPKg==
X-CSE-MsgGUID: 2hvgETnlQcOcNWzbTZJsig==
X-IronPort-AV: E=Sophos;i="6.25,230,1779148800"; 
   d="scan'208";a="26041746"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 06:02:59 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:14815]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.183:2525] with esmtp (Farcaster)
 id 662aa70f-33ce-4d0c-86dd-6daca661c7b5; Tue, 18 Aug 2026 06:02:59 +0000 (UTC)
X-Farcaster-Flow-ID: 662aa70f-33ce-4d0c-86dd-6daca661c7b5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Tue, 18 Aug 2026 06:02:58 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Tue, 18 Aug 2026 06:02:57 +0000
From: Alexander Graf <graf@amazon.com>
To: <virtio-comment@lists.linux.dev>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	<nh-open-source@amazon.com>
Subject: [PATCH v5] Add VIRTIO_F_DMB (Device Memory Buffer)
Date: Tue, 18 Aug 2026 06:02:55 +0000
Message-ID: <20260818060255.6853-1-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D035UWA004.ant.amazon.com (10.13.139.109) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

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
region, owned by the device, that holds the virtqueues and the buffers
they reference.

Once negotiated, an imaginary per-device IOMMU maps the device's bus
address space 1:1 onto the region. Every address the driver supplies is
translated into the region and nowhere else, and the device reaches no
other memory to process virtqueues.

A driver that has not negotiated VIRTIO_F_ACCESS_PLATFORM otherwise has to
pass only physical addresses, so VIRTIO_F_DMB is an exception to that.

The device reports the region's shmid in dmb_shm_id on PCI and DMBSHMId
on MMIO, so the shmid does not collide with device-specific or future
transport-specific shared memory regions. The driver locates the region
through the existing Shared Memory Regions facility, VIRTIO_F_DMB needs
a transport that supports SHM.

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
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/248
---

Link: https://lore.kernel.org/virtio-comment/20260702040006.65669-1-graf@amazon.com/ [v1]
Link: https://lore.kernel.org/virtio-comment/20260716215426.46037-1-graf@amazon.com/ [v2]
Link: https://lore.kernel.org/virtio-comment/20260804161202.38619-1-graf@amazon.com/ [v3]
Link: https://lore.kernel.org/virtio-comment/20260817022720.52650-1-graf@amazon.com/ [v4]

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
 conformance.tex    |   2 +
 content.tex        |  24 +++++-
 shared-mem.tex     | 183 ++++++++++++++++++++++++++++++++++++++++++++-
 transport-ccw.tex  |   1 +
 transport-mmio.tex |  27 +++++++
 transport-pci.tex  |  34 +++++++++
 6 files changed, 267 insertions(+), 4 deletions(-)

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
index 243ce2d..6bd6125 100644
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
@@ -946,6 +946,14 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
    suspend the device by set the SUSPEND bit to 1.
    See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
 
+  \item[VIRTIO_F_DMB(44)] This feature indicates that the device offers a
+  Device Memory Buffer: a shared memory region, owned by the device,
+  that holds the virtqueues and the buffers they reference.  When this feature
+  has been negotiated, every device access to a virtqueue or to a buffer is
+  routed through a static, imaginary, per-device transparent IOMMU which maps
+  the device's bus address space 1:1 onto the Device Memory Buffer region.
+  See \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
@@ -957,7 +965,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 then either disable the IOMMU or configure the IOMMU to translate bus addresses
 passed to the device into physical addresses in memory.  If
 VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass only physical
-addresses to the device.
+addresses to the device, except that if VIRTIO_F_DMB has been negotiated the
+driver MUST instead pass addresses into the Device Memory Buffer (see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
 
 A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered.
 
@@ -982,6 +992,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
 A driver SHOULD accept VIRTIO_F_NOTIF_CONFIG_DATA if it is offered.
 
+For the driver requirements that apply if VIRTIO_F_DMB has been
+negotiated, see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
+
 \devicenormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
 
 A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate further
@@ -1011,6 +1025,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 and presents a PCI SR-IOV capability structure, otherwise
 it MUST NOT offer VIRTIO_F_SR_IOV.
 
+For the device requirements that apply if VIRTIO_F_DMB has been
+negotiated, see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
+
 \section{Legacy Interface: Reserved Feature Bits}\label{sec:Reserved Feature Bits / Legacy Interface: Reserved Feature Bits}
 
 Transitional devices MAY offer the following:
diff --git a/shared-mem.tex b/shared-mem.tex
index 6e6f6c4..4c62c0b 100644
--- a/shared-mem.tex
+++ b/shared-mem.tex
@@ -38,5 +38,186 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
 Device / Shared Memory Regions}
 Shared memory regions MUST NOT expose shared memory regions which
 are used to control the operation of the device, nor to stream
-data.
+data, other than the Device Memory Buffer when VIRTIO_F_DMB has been
+negotiated (see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
 
+\subsection{Device Memory Buffer}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
+
+When VIRTIO_F_DMB (see \ref{sec:Reserved Feature Bits}) has been negotiated,
+the device designates exactly one of its shared memory regions as the
+\emph{Device Memory Buffer}, and reports that region's \field{shmid}
+through a transport-specific
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
+\field{shmid} it reports.  If the driver cannot locate the region the
+feature is unusable, and the driver reports that through the FAILED
+\field{device status} bit instead of proceeding.
+
+Every device access to a virtqueue or to a buffer is routed through a
+static, imaginary, per-device transparent IOMMU which maps the device's bus
+address space 1:1 onto the Device Memory Buffer region.  The mapping starts
+at the region's first byte and is as long as the region: bus address $N$
+resolves to the byte at position $N$ in the region, for every $N$ less than
+the region's length.  The device performs those accesses against the region
+and no longer against the transport bus's address space.  A notification is not such an access: notifications continue
+to reach the device and the driver by the means the transport defines, and
+VIRTIO_F_DMB does not route them through the mapping.
+
+Every virtqueue, every buffer the driver makes available and every indirect
+descriptor table lies inside the Device Memory Buffer region, so the
+region's length limits how much the driver can have outstanding at one time.
+The region is at least large enough to hold the Descriptor Area, Driver Area
+and Device Area of every virtqueue the device exposes; the room a driver
+needs beyond that depends on how many buffers it keeps outstanding.
+An address that, together with the length of the structure it refers to,
+reaches past the end of the region falls outside the mapping, and the device
+rejects it, setting the DEVICE_NEEDS_RESET \field{device status} bit rather
+than reaching memory outside the region.
+
+The base address of the Device Memory Buffer region is 16-byte aligned, and
+the mapping does not cover the region's first 16 bytes.  16 bytes is the
+largest alignment that either virtqueue layout requires of a virtqueue part
+(see \ref{sec:Basic Facilities of a Virtio Device / Split Virtqueues} and
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
+\ref{sec:Reserved Feature Bits}).
+
+VIRTIO_F_DMB does not change the memory ordering requirements for the
+Descriptor, Driver and Device Areas, and neither does the Device Memory
+Buffer memory type.  Every access those requirements order falls inside the
+Device Memory Buffer region, so the barriers a virtqueue layout requires
+before it exposes a descriptor apply unchanged, and VIRTIO_F_ORDER_PLATFORM
+(see \ref{sec:Reserved Feature Bits}) governs which barriers the driver
+emits.  A notification is not one of those accesses, and VIRTIO_F_DMB does
+not make it one.
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
+address it supplies as an address the imaginary IOMMU maps 1:1 into that
+region.  The driver MUST choose each area's address such that the address
+satisfies the alignment that the virtqueue layout in use requires of that
+area.
+
+For every buffer that the driver makes available to the device, and for
+every indirect descriptor table if VIRTIO_F_INDIRECT_DESC has been
+negotiated, the driver MUST place it within the Device Memory Buffer region.
+
+The driver MUST NOT supply an address that, together with the length of the
+structure it refers to, falls outside the part of the Device Memory Buffer
+region that the imaginary IOMMU maps, and MUST NOT make available a buffer
+that does not fit within that part.
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
+A device MUST NOT offer VIRTIO_F_DMB unless the platform permits the driver
+to access the Device Memory Buffer region as memory that is shared with the
+device.
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
+A device that offers VIRTIO_F_DMB MUST report a Device Memory Buffer region
+whose base address is 16-byte aligned and whose length is sufficient to hold
+the Descriptor Area, Driver Area and Device Area of every virtqueue it
+exposes.
+
+The remaining requirements in this section apply if VIRTIO_F_DMB has been
+negotiated.
+
+The imaginary IOMMU described in
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
+maps bus addresses 16 and above, up to the length of the Device Memory
+Buffer region, onto the region at the same position, and maps nothing else.
+For every address the driver supplies, the device MUST perform the access at
+that position in the region, and MUST NOT perform it anywhere else.
+
+The device MUST verify, when the driver programs the address of a Descriptor
+Area, Driver Area or Device Area, that the address together with the length
+of that area falls within that mapping and does not overflow.  For every
+other address the driver supplies, the device MUST perform the same
+verification before it uses the address.  If the verification fails, the
+imaginary IOMMU rejects the access: the device MUST NOT perform it and MUST
+set the DEVICE_NEEDS_RESET \field{device status} bit.
+
+The device MUST NOT reach any memory other than the Device Memory Buffer
+region in order to process virtqueues, whether or not the driver supplied an
+address for it.
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
index cddbcc9..d19bb2f 100644
--- a/transport-mmio.tex
+++ b/transport-mmio.tex
@@ -248,6 +248,21 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
     apply to the queue selected by writing to \field{QueueSel}.
   }
   \hline
+  \mmioreg{DMBSHMId}{Device Memory Buffer shared memory ID}{0x0c4}{R}{%
+    If VIRTIO_F_DMB has been negotiated, reading from this register
+    returns the \field{shmid} of the shared memory region that is the
+    Device Memory Buffer (see \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
+    This register is valid only if VIRTIO_F_DMB has been negotiated.
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
@@ -313,6 +328,12 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
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
@@ -367,6 +388,12 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
 that were used before the queue reset.
 (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
 
+The driver MUST NOT read \field{DMBSHMId} unless VIRTIO_F_DMB has been
+negotiated.
+
+The driver MUST NOT read \field{DMBMemType} unless the device offers
+VIRTIO_F_DMB.
+
 \subsection{MMIO-specific Initialization And Device Operation}\label{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation}
 
 \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Device Initialization}
diff --git a/transport-pci.tex b/transport-pci.tex
index 95b08b8..d2907b9 100644
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
 
@@ -428,6 +432,23 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 	The value 0 indicates no supported administration virtqueues.
 	This field is valid only if VIRTIO_F_ADMIN_VQ has been
 	negotiated.
+
+\item[\field{dmb_shm_id}]
+        The device uses this to report the \field{shmid} of the shared
+        memory region that is the Device Memory Buffer (see
+        \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
+        This field is read-only for the driver.  This field is valid
+        only if VIRTIO_F_DMB has been negotiated.
+
+\item[\field{dmb_mem_type}]
+        The device uses this to report the Device Memory Buffer memory
+        type (see
+        \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer / Device Memory Buffer memory type}).
+        This field is read-only for the driver.  Unlike
+        \field{dmb_shm_id}, this field is valid whenever the device
+        offers VIRTIO_F_DMB, as opposed to after VIRTIO_F_DMB has been
+        negotiated, because the driver reads it in order to decide
+        whether to accept the feature.
 \end{description}
 
 \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
@@ -495,6 +516,13 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
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
@@ -531,6 +559,12 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 The driver MAY configure fewer administration virtqueues than
 supported by the device.
 
+The driver MUST NOT read \field{dmb_shm_id} unless VIRTIO_F_DMB has
+been negotiated.
+
+The driver MUST NOT read \field{dmb_mem_type} unless the device offers
+VIRTIO_F_DMB.
+
 \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
 
 The notification location is found using the VIRTIO_PCI_CAP_NOTIFY_CFG
