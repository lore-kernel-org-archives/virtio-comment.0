Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9C83672AF
	for <virtio-comment@lists.linux.dev>; Tue,  4 Aug 2026 16:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859931; cv=none; b=n2I4Zw9CPDY2g0EhK41+oQJaacKeuZh6zB5VP6/u4RDy9lzBP1TaDjiR8UdWdTP1lIe1QOEr/w5Z6AhdpevwhhE7+0kEHdHUIH0DUdlXZvI0IURa1wrzG1rml+eFkClAEWTX1D/D31lQU4IYJAvAAwyHqAp4zY+XTMHGOInSWjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859931; c=relaxed/simple;
	bh=0VLikIjShqN/JuyIdSA7nR+BeJY8j3HX8WIT40Z0oHc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WYmzEsAQiMkcREXEzJJ6F81VbbZsXPZQAUsJDBFH7sYntCgF0/5uce2vlC8DuqthYJQtb1Le3jL3uubOMxug6/5pv4LkKCZwsmODT++LCv+9+2mWgVXBcRL5IIhBHMGdfyRs44tOJCsuBag0PTq/DJW8dgH7gjvM2F+R4u9l11g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=EWGsSk+4; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="EWGsSk+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785859929; x=1817395929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6O08AuXjc+bk23MxHMw66wuhQA5NT176OhSpP2rRwhE=;
  b=EWGsSk+4xY6DUe1II7a9BdT2SCaxZccQrA6YdA0dSj9MioruJ29ZquwD
   Eeaw7ABZ0/OYnLumsHrYFZ/n4/NywNl4gOvsB1q3CnXCdV0FAu5BHYvNP
   q55iquU31JyyAl5K3z6/16x4BAozv2Zy+jIxGaRfLN5Ad9YaQNZExaI3i
   NrOAn8wzCDpK1q4KYoFpPkFxpxmbGlHmWaCyfFrR83sF6AYWbf5SAveI0
   CbQHzpceFq7lXwGVwLXRqeznbrOXnCtJcpKZihk5trj0NFnVvh0LLDeS9
   Q0qh6+n0iZzMsl30hzi86xqQTYVITwEQgMOBO6k/qImjUG0RfX7euf9UE
   Q==;
X-CSE-ConnectionGUID: v/4kZt5iQO6n8M/DtYjq6Q==
X-CSE-MsgGUID: dfomwSjFTwSxC7W1NUyflg==
X-IronPort-AV: E=Sophos;i="6.25,204,1779148800"; 
   d="scan'208";a="25061827"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 16:12:06 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:16094]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.11:2525] with esmtp (Farcaster)
 id bf06bd32-ad59-4be0-87a3-0b83732da51c; Tue, 4 Aug 2026 16:12:06 +0000 (UTC)
X-Farcaster-Flow-ID: bf06bd32-ad59-4be0-87a3-0b83732da51c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Tue, 4 Aug 2026 16:12:06 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Tue, 4 Aug 2026 16:12:04 +0000
From: Alexander Graf <graf@amazon.com>
To: <virtio-comment@lists.linux.dev>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3] Add VIRTIO_F_DMB (Device Memory Buffer)
Date: Tue, 4 Aug 2026 16:12:02 +0000
Message-ID: <20260804161202.38619-1-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260716215426.46037-1-graf@amazon.com>
References: <20260716215426.46037-1-graf@amazon.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D037UWC002.ant.amazon.com (10.13.139.250) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

When a transport uses a shared bounce region for virtqueue memory today,
that region is global and shared by multiple devices at once. Devices
then contend over one small region, so a busy device can starve the
others, and one device's emulation cannot be isolated or torn down on its
own because its state lives in memory everyone else is using too.

VIRTIO_F_DMB gives each device its own shared memory region, the Device
Memory Buffer, that holds that device's virtqueues (Descriptor, Driver
and Device Areas) and the buffers the descriptors reference. When the
feature is negotiated, every address the driver places in a virtqueue is
an offset into that region rather than a physical or bus address, so the
device only ever touches memory the driver placed there. Because each
device owns its region, its emulation can run in a separate host process
and be terminated independently, and devices no longer contend over one
shared region.

The device reports the region's shmid through a transport-specific
mechanism (dmb_shm_id in the PCI common configuration structure, DMBSHMId
on MMIO), so the shmid does not collide with device-specific or future
transport-specific shared memory regions. The driver locates the region
through the existing Shared Memory Regions facility. VIRTIO_F_DMB refines
VIRTIO_F_ACCESS_PLATFORM and is negotiated only together with it.

To provide the confinement guarantee, the device bounds-checks every
driver-supplied offset against the region and sets DEVICE_NEEDS_RESET on
violation.

The general requirement on shared memory regions forbids a device to
expose a region used to control its operation or to stream data, and a
Device Memory Buffer is used for both, so it is named as that
requirement's exception.

The Device Memory Buffer is memory the driver shares with the device on
platforms that distinguish shared from private mappings, and the device
provides coherency without cache maintenance by the driver. A device
that requires the platform's barriers offers VIRTIO_F_ORDER_PLATFORM,
and a driver accepts VIRTIO_F_DMB only together with it. Offset 0 in
the region is reserved: a device that predates the feature reads a
Descriptor Area address of 0 as a queue that is not in use, as the
legacy QueuePFN register states.

Signed-off-by: Alexander Graf <graf@amazon.com>
---

Link: https://lore.kernel.org/virtio-comment/20260702040006.65669-1-graf@amazon.com/ [v1]
Link: https://lore.kernel.org/virtio-comment/20260716215426.46037-1-graf@amazon.com/ [v2]

v1 -> v2:
 - Replace the fixed reserved shmid 2 and its registry with a shmid the
   device reports per transport, as Stefan Hajnoczi suggested on v1.
 - Spell out per-transport compatibility for dmb_shm_id and DMBSHMId.
 - Set FAILED when the driver cannot find the region, rather than refuse
   to negotiate.
 - List VIRTIO_F_DMB under CCW's features reserved for future use.

v2 -> v3:
 - Require the region to be memory the driver shares with the device.
 - Require coherency; couple VIRTIO_F_DMB to VIRTIO_F_ORDER_PLATFORM,
   replacing v2's sentence on the areas' interaction with it.
 - Reserve offset 0 in the region.
 - Except the Device Memory Buffer from the shared-region prohibition.
 - Allow a device to expose further shared memory regions.
 - Move bit 44 into the queue and feature negotiation reserved list.
 - Aim two cross-references at the Reserved Feature Bits chapter.


 conformance.tex    |   2 +
 content.tex        |  28 ++++++-
 shared-mem.tex     | 199 ++++++++++++++++++++++++++++++++++++++++++++-
 transport-ccw.tex  |   1 +
 transport-mmio.tex |  15 ++++
 transport-pci.tex  |  20 +++++
 6 files changed, 262 insertions(+), 3 deletions(-)

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
index 243ce2d..8c5a844 100644
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
+  Device Memory Buffer: a shared memory region, owned by the device,
+  that holds the virtqueues and the buffers they reference.  When this feature
+  is negotiated, every address that the driver places in a virtqueue is an
+  offset into the Device Memory Buffer region rather than a physical address
+  or a bus address.  The device is thereby confined to memory the driver has
+  published in that region.
+  See \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
@@ -982,6 +991,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
 A driver SHOULD accept VIRTIO_F_NOTIF_CONFIG_DATA if it is offered.
 
+A driver MUST NOT accept VIRTIO_F_DMB unless it also accepts
+VIRTIO_F_ACCESS_PLATFORM.  If VIRTIO_F_ORDER_PLATFORM is offered, a driver
+MUST NOT accept VIRTIO_F_DMB unless it also accepts VIRTIO_F_ORDER_PLATFORM.
+For the driver requirements that apply once VIRTIO_F_DMB has been
+negotiated, see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
+
 \devicenormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
 
 A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate further
@@ -1011,6 +1027,14 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 and presents a PCI SR-IOV capability structure, otherwise
 it MUST NOT offer VIRTIO_F_SR_IOV.
 
+A device that offers VIRTIO_F_DMB MUST also offer VIRTIO_F_ACCESS_PLATFORM.
+A device that offers VIRTIO_F_DMB MUST also offer VIRTIO_F_ORDER_PLATFORM if
+the device requires the driver to use memory barriers suitable for devices
+described by the platform when accessing the Device Memory Buffer region.
+For the device requirements that apply once VIRTIO_F_DMB has been
+negotiated, see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
+
 \section{Legacy Interface: Reserved Feature Bits}\label{sec:Reserved Feature Bits / Legacy Interface: Reserved Feature Bits}
 
 Transitional devices MAY offer the following:
diff --git a/shared-mem.tex b/shared-mem.tex
index 6e6f6c4..3e68f3a 100644
--- a/shared-mem.tex
+++ b/shared-mem.tex
@@ -38,5 +38,202 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
 Device / Shared Memory Regions}
 Shared memory regions MUST NOT expose shared memory regions which
 are used to control the operation of the device, nor to stream
-data.
+data, other than the Device Memory Buffer when VIRTIO_F_DMB has been
+negotiated (see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
+
+\subsection{Device Memory Buffer}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
+
+When VIRTIO_F_DMB (see \ref{sec:Reserved Feature Bits}) is
+negotiated, the device offers a shared memory region, the
+\emph{Device Memory Buffer}, identified by a \field{shmid} that the
+device reports through a transport-specific mechanism (for example
+\field{dmb_shm_id} in the common configuration structure on the PCI
+transport, see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout},
+and \field{DMBSHMId} on the MMIO transport, see
+\ref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout};
+see the transport chapters).
+The driver reads that \field{shmid} and locates the region using the
+transport-specific shared memory region enumeration mechanism, in the
+same way as any other shared memory region.  Because both the
+\field{shmid} report and that enumeration are transport-specific,
+VIRTIO_F_DMB is available only on transports that define a shared memory
+region discovery mechanism.
+
+Unlike an ordinary shared memory region, whose contents are specific to
+the device type, the Device Memory Buffer holds the structures that the
+virtio transport would otherwise place in driver memory: the Descriptor
+Area, the Driver Area and the Device Area of each virtqueue (the concrete
+structures these areas contain depend on the virtqueue layout in use),
+together with the data buffers that descriptors refer to and, if
+VIRTIO_F_INDIRECT_DESC has been negotiated, any indirect descriptor
+tables.  An ordinary shared memory region is required not to be used to
+control the operation of the device nor to stream data; the Device Memory
+Buffer is named as the exception to that requirement (see
+\ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions}).
+
+While VIRTIO_F_DMB is negotiated, the addresses the driver places in a
+virtqueue are offsets from the start of the Device Memory Buffer region.
+This applies to the addresses of the Descriptor Area, Driver Area and
+Device Area that the driver supplies through the transport-specific
+virtqueue location mechanism, to the \field{addr} field of each
+descriptor, and, if VIRTIO_F_INDIRECT_DESC has been negotiated, to the
+address of each indirect descriptor table and to the \field{addr} field
+of each descriptor within it.  As with other shared memory regions (see
+\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Addressing within regions }),
+these references are offsets from the start of the region and are not
+subject to further platform address translation.
+
+Offset 0 is reserved: it is not the address of any structure that the driver
+places in the region.  A device implementation that predates VIRTIO_F_DMB is
+told where a virtqueue is by being given the physical address of its Descriptor
+Area, and takes the absence of an address to mean that the queue is not in use,
+with the value 0 standing for that absence; the legacy \field{QueuePFN}
+register on the MMIO transport states the convention outright (see
+\ref{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}).
+Under VIRTIO_F_DMB the same fields carry offsets, in which 0 names the region's
+first byte and is as ordinary as any other value, so a driver that placed a
+Descriptor Area there would hand such a device an address it reads as no
+address at all.  Reserving the first byte of the region costs the driver at
+most one alignment unit, because every area has in any case to be aligned as
+its virtqueue layout requires, and it allows a device to treat an offset of 0
+as an error rather than as a queue it may ignore.
+
+The Device Memory Buffer is shared between the driver and the device:
+both read and write it.  Data that the driver places in the region is
+therefore visible to the device and to whatever implements the device.
+VIRTIO_F_DMB does not make the contents of the region confidential; it
+confines the device's access \emph{to} the region, so that memory the
+driver has not placed in the region remains inaccessible to the device.
+
+On a platform that distinguishes memory the driver shares with the device
+from memory that is private to the driver, the Device Memory Buffer region
+is memory the driver shares with the device.  A region that the driver made
+private to itself would carry virtqueues the device cannot read and a Device
+Area the device cannot write.
+
+VIRTIO_F_DMB refines VIRTIO_F_ACCESS_PLATFORM.  VIRTIO_F_ACCESS_PLATFORM
+indicates that device access to memory is limited and/or translated by
+the platform; VIRTIO_F_DMB is the case in which that limitation takes the
+form of a single device-associated region and the addresses the driver
+supplies are offsets into it.  VIRTIO_F_DMB is therefore only defined,
+and is only negotiated, together with VIRTIO_F_ACCESS_PLATFORM (see the
+driver and device requirements in
+\ref{drivernormative:Reserved Feature Bits} and
+\ref{devicenormative:Reserved Feature Bits}).
+
+VIRTIO_F_DMB governs only the placement of the memory the device reads or
+writes while processing virtqueues.  It does not change the mechanism used
+to configure virtqueues, to send available buffer or used buffer
+notifications, or to deliver configuration change notifications: those are
+conveyed through the transport as usual and are not located within the
+region.  VIRTIO_F_DMB does not change the memory ordering requirements for
+the Descriptor, Driver and Device Areas, but it does change where those
+areas are: in memory the device supplies rather than memory the driver
+allocates.
+
+Those ordering requirements rest on two properties of the memory the areas
+are in.  The driver and the device observe that memory coherently, so that a
+write by one becomes visible to the other without any cache maintenance
+operation by the driver, for which the virtqueue rules give the driver no
+means.  And unless VIRTIO_F_ORDER_PLATFORM has been negotiated, the barriers
+the driver uses are only those sufficient for a device that can be assumed to
+run on identical CPUs in an SMP configuration (see
+\ref{sec:Reserved Feature Bits}).  When the
+areas are in driver memory, the driver establishes both properties by
+allocating that memory itself.  When they are in the Device Memory Buffer,
+the device supplies the memory, so the device is the party that knows
+whether either property holds, and the requirements below place both
+obligations on it.
+
+The region's length is reported by the shared memory region descriptor as
+usual and bounds the amount of virtqueue data that can be in flight at
+once.  A device can therefore serve a driver whose memory it cannot
+otherwise access, as in confidential computing.
+
+\drivernormative{\subsubsection}{Device Memory Buffer}{Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
+
+If VIRTIO_F_DMB has been negotiated, the driver MUST read the
+\field{shmid} that the device reports through the transport-specific
+mechanism and MUST locate that shared memory region using the
+transport-specific shared memory region enumeration mechanism.  If the
+driver cannot locate the region, it MUST set the FAILED
+\field{device status} bit.
+
+If VIRTIO_F_DMB has been negotiated, the driver MUST place the Descriptor
+Area, Driver Area and Device Area of every virtqueue within the Device
+Memory Buffer region, and MUST supply their addresses to the device as
+offsets from the start of the region.  The driver MUST choose each area's
+offset such that the region's base address plus the offset satisfies the
+alignment that the virtqueue layout in use requires of that area.
+
+If VIRTIO_F_DMB has been negotiated, then for every buffer that the driver
+makes available to the device, and for every indirect descriptor table if
+VIRTIO_F_INDIRECT_DESC has been negotiated, the driver MUST place it
+within the Device Memory Buffer region and MUST use its offset from the
+start of the region as the address written into the descriptor.
+
+If VIRTIO_F_DMB has been negotiated, the driver MUST NOT supply an offset
+that, together with the length of the structure it refers to, lies outside
+the Device Memory Buffer region, and MUST NOT make available a buffer that
+does not fit within the region.
+
+If VIRTIO_F_DMB has been negotiated, the driver MUST NOT supply an offset of 0
+as the address of a Descriptor Area, Driver Area or Device Area, as the
+\field{addr} field of a descriptor, or as the address of an indirect descriptor
+table.  The first byte of the Device Memory Buffer region is reserved.
+
+If VIRTIO_F_DMB has been negotiated, and the platform distinguishes memory
+that the driver shares with the device from memory that is private to the
+driver, the driver MUST access the Device Memory Buffer region as memory
+that is shared with the device.
+
+\devicenormative{\subsubsection}{Device Memory Buffer}{Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
+
+A device MUST NOT offer VIRTIO_F_DMB unless the transport provides a
+shared memory region discovery mechanism.
+
+A device MUST NOT offer VIRTIO_F_DMB unless the platform permits the driver to
+access the Device Memory Buffer region as memory that is shared with the
+device.
+
+A device MUST NOT offer VIRTIO_F_DMB unless a write that the driver performs
+to the Device Memory Buffer region becomes visible to the device, and a write
+that the device performs to the region becomes visible to the driver, without
+any cache maintenance operation by the driver.
+
+A device that offers VIRTIO_F_DMB MUST expose exactly one shared memory
+region for the Device Memory Buffer and MUST report that region's
+\field{shmid} through the transport-specific mechanism.
+
+A device that offers VIRTIO_F_DMB MAY expose further shared memory regions in
+addition to the Device Memory Buffer; the Device Memory Buffer is the one
+region whose \field{shmid} the device reports through the transport-specific
+mechanism.
+
+If VIRTIO_F_DMB has been negotiated, the device MUST interpret every
+address supplied by the driver in a virtqueue -- including the Descriptor
+Area, Driver Area and Device Area addresses, the \field{addr} field of
+each descriptor, the address of any indirect descriptor table, and the
+\field{addr} field of each descriptor within an indirect descriptor
+table -- as an offset from the start of the Device Memory Buffer region,
+and MUST NOT interpret any such address as a physical or bus address.
+
+If VIRTIO_F_DMB has been negotiated, then before accessing any structure
+that a driver-supplied offset refers to, the device MUST verify that the
+offset together with the length of that structure lies within the Device
+Memory Buffer region and does not overflow.  If this verification fails,
+the device MUST NOT perform the access and MUST set the DEVICE_NEEDS_RESET
+\field{device status} bit.
+
+If VIRTIO_F_DMB has been negotiated, and the driver supplies an offset of 0 as
+the address of a Descriptor Area, Driver Area or Device Area, the device
+MUST NOT access that area, and MUST set the DEVICE_NEEDS_RESET
+\field{device status} bit.  If the driver supplies an offset of 0 as the
+\field{addr} field of a descriptor or as the address of an indirect descriptor
+table, the device SHOULD NOT access the structure that offset refers to, and
+SHOULD set the DEVICE_NEEDS_RESET \field{device status} bit.
+
+If VIRTIO_F_DMB has been negotiated, the device MUST NOT access any memory
+outside the Device Memory Buffer region in order to process virtqueues.
 
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
index cddbcc9..bfb349f 100644
--- a/transport-mmio.tex
+++ b/transport-mmio.tex
@@ -248,6 +248,13 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
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
   \mmioreg{ConfigGeneration}{Configuration atomicity value}{0x0fc}{R}{
     Reading from this register returns a value describing a version of the device-specific configuration space (see \field{Config}).
     The driver can then access the configuration space and, when finished, read \field{ConfigGeneration} again.
@@ -313,6 +320,11 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
 when queue reset has completed.
 (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
 
+If the device offers VIRTIO_F_DMB, \field{DMBSHMId} MUST equal the
+\field{shmid} of a shared memory region that the device exposes through
+\field{SHMSel}, \field{SHMLenLow}, \field{SHMLenHigh}, \field{SHMBaseLow}
+and \field{SHMBaseHigh}.
+
 \drivernormative{\subsubsection}{MMIO Device Register Layout}{Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}
 The driver MUST NOT access memory locations not described in the
 table \ref{tab:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}
@@ -367,6 +379,9 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
 that were used before the queue reset.
 (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
 
+The driver MUST NOT read \field{DMBSHMId} unless VIRTIO_F_DMB has been
+negotiated.
+
 \subsection{MMIO-specific Initialization And Device Operation}\label{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation}
 
 \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Device Initialization}
diff --git a/transport-pci.tex b/transport-pci.tex
index 95b08b8..c63760a 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -325,6 +325,9 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
         /* About the administration virtqueue. */
         le16 admin_queue_index;         /* read-only for driver */
         le16 admin_queue_num;         /* read-only for driver */
+
+        /* About the Device Memory Buffer. */
+        le16 dmb_shm_id;                /* read-only for driver */
 };
 \end{lstlisting}
 
@@ -428,6 +431,13 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
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
 \end{description}
 
 \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
@@ -495,6 +505,13 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 to ensure that indices of valid admin queues fit into
 a 16 bit range beyond all other virtqueues.
 
+If the device offers VIRTIO_F_DMB, the device MUST present the common
+configuration structure with a \field{length} that is large enough to
+include the \field{dmb_shm_id} field, and \field{dmb_shm_id} MUST equal
+the \field{id} of a VIRTIO_PCI_CAP_SHARED_MEMORY_CFG capability that the
+device presents.  Since \field{id} in \field{virtio_pci_cap} is 8 bits,
+the high-order 8 bits of \field{dmb_shm_id} MUST be zero.
+
 \drivernormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
 
 The driver MUST NOT write to \field{device_feature}, \field{num_queues},
@@ -531,6 +548,9 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 The driver MAY configure fewer administration virtqueues than
 supported by the device.
 
+The driver MUST NOT read \field{dmb_shm_id} unless VIRTIO_F_DMB has
+been negotiated.
+
 \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
 
 The notification location is found using the VIRTIO_PCI_CAP_NOTIFY_CFG
