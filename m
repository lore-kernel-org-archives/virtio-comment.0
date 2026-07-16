Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E9734751B
	for <virtio-comment@lists.linux.dev>; Thu, 16 Jul 2026 21:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784238875; cv=none; b=ZdrZjDtnRGWVenAph8IEZUzvISFuklc3WOXH5To+Nrk4pNuSPxJB6FD6eHz89nBgwHJoBl0q0m5scxzBkk9KiJ54BJo8aGIerCatyspmAr2h2iVpElGHsI8L99d4/8lMMEghxH+JJ8Gz2u1PoNcHKLC0mVjnhcoK09PDUrXYQQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784238875; c=relaxed/simple;
	bh=FDZTYdoywvJna5djaEnwmXP0FJoMdXwrmjqgqRIHnGg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LVIz3o32dgGyTDd7MIP/un8FjRZgPC2MQ9e0liXfWxFhOpyPFemgSwOrQwNobNu0EnWnNAihm5P4dsEOOEgkOYrTJE/dtmqXTw0Rya5XslV29Wq9tuupf79ra03PS/Mxf54dXYYVJpbE6MlfS5cx7J7OgZY0xnrA2PpC4Mpi+q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=i6uVSn9c; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="i6uVSn9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1784238873; x=1815774873;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wL+fyYy9a9XbF/iPbfmV3yxtf4D7hBKd8YmLBGJqZQc=;
  b=i6uVSn9cB4WADqqbkCEoqeTvxio6QqtxjdNiX11TP5olLvo8jwnA6l85
   ZEnuOnzSw/XGCc8v+WqMas1BKCGOpVxbDU4qkPw74MZEIkGfDuAC+X82L
   RO19qz/z7kNKYAafGM0mYwVUMU9nfTRo05DAj22GrvH5Njy8WJkYNKOMu
   HEk+CK1Xme7yMGmQHMca6n/88b7SwQ8/WbAxRryRLnmTSbQbrRJuCRyke
   d4Ku4pYmCrT8sTKCAbuqgCCBsN5VmO6211zqNhhmO8+cnWFeqqMOET1ZQ
   K0ExwT5lP5/Uv2YzUw+IUGnAd3qEQv2xqFP+QTPKwcc3gr9IhrNFaSvQ9
   A==;
X-CSE-ConnectionGUID: TZpVNl/nSoyIJHJWHdc2sg==
X-CSE-MsgGUID: bxXiQgxpQAat8KMcR0ZmLA==
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="23597335"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 21:54:30 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:12471]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.177:2525] with esmtp (Farcaster)
 id 8e3c270d-b0d3-4f52-a5b8-1a5230dc95a0; Thu, 16 Jul 2026 21:54:30 +0000 (UTC)
X-Farcaster-Flow-ID: 8e3c270d-b0d3-4f52-a5b8-1a5230dc95a0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 16 Jul 2026 21:54:29 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 16 Jul 2026 21:54:28 +0000
From: Alexander Graf <graf@amazon.com>
To: <virtio-comment@lists.linux.dev>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2] content: Add VIRTIO_F_DMB (Device Memory Buffer)
Date: Thu, 16 Jul 2026 21:54:26 +0000
Message-ID: <20260716215426.46037-1-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D039UWB001.ant.amazon.com (10.13.138.119) To
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

Signed-off-by: Alexander Graf <graf@amazon.com>

---

v2 (changes since the first posting; below the scissors, not applied by git am):
 - Drop the hard-coded reserved shmid 2 and the "Reserved Shared Memory
   Region IDs" registry. The device now reports the DMB shmid through a
   transport-specific mechanism (dmb_shm_id in the PCI common config,
   DMBSHMId MMIO register), per Stefan Hajnoczi's suggestion. This avoids
   colliding with device-specific shmid namespaces (virtio-scmi documents
   the whole space as its own) and with future transport-specific regions.
 - Spell out the per-transport backward compatibility: the PCI common
   configuration length must cover dmb_shm_id, the field and the MMIO
   register are valid only once VIRTIO_F_DMB is negotiated, and the high 8
   bits of dmb_shm_id are zero since the PCI capability id is 8 bits.
 - A device offering VIRTIO_F_DMB may still expose device-specific shared
   memory regions alongside the DMB.
 - CCW: VIRTIO_F_DMB listed under features reserved for future use (no
   shared memory region discovery there).

Remaining item for the TC: feature bit number. This uses 44 (41 and 42 are
the virtio-net legacy RSC bits and 43 is VIRTIO_F_SUSPEND, so 44 is the
first free reserved bit); happy to take whatever the TC allocates.

 conformance.tex    |   2 +
 content.tex        |  19 +++++++
 shared-mem.tex     | 124 +++++++++++++++++++++++++++++++++++++++++++++
 transport-ccw.tex  |   1 +
 transport-mmio.tex |  15 ++++++
 transport-pci.tex  |  20 ++++++++
 6 files changed, 181 insertions(+)

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
index 243ce2d..1311042 100644
--- a/content.tex
+++ b/content.tex
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
@@ -982,6 +991,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
 A driver SHOULD accept VIRTIO_F_NOTIF_CONFIG_DATA if it is offered.
 
+A driver MUST NOT accept VIRTIO_F_DMB unless it also accepts
+VIRTIO_F_ACCESS_PLATFORM.  For the driver requirements that apply once
+VIRTIO_F_DMB has been negotiated, see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
+
 \devicenormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
 
 A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate further
@@ -1011,6 +1025,11 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 and presents a PCI SR-IOV capability structure, otherwise
 it MUST NOT offer VIRTIO_F_SR_IOV.
 
+A device that offers VIRTIO_F_DMB MUST also offer VIRTIO_F_ACCESS_PLATFORM.
+For the device requirements that apply once VIRTIO_F_DMB has been
+negotiated, see
+\ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}.
+
 \section{Legacy Interface: Reserved Feature Bits}\label{sec:Reserved Feature Bits / Legacy Interface: Reserved Feature Bits}
 
 Transitional devices MAY offer the following:
diff --git a/shared-mem.tex b/shared-mem.tex
index 6e6f6c4..7653b95 100644
--- a/shared-mem.tex
+++ b/shared-mem.tex
@@ -40,3 +40,127 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
 are used to control the operation of the device, nor to stream
 data.
 
+\subsection{Device Memory Buffer}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
+
+When VIRTIO_F_DMB (see \ref{sec:Basic Facilities of a Virtio Device / Feature Bits}) is
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
+tables.
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
+The Device Memory Buffer is shared between the driver and the device:
+both read and write it.  Data that the driver places in the region is
+therefore visible to the device and to whatever implements the device.
+VIRTIO_F_DMB does not make the contents of the region confidential; it
+confines the device's access \emph{to} the region, so that memory the
+driver has not placed in the region remains inaccessible to the device.
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
+the Descriptor, Driver and Device Areas or their interaction with
+VIRTIO_F_ORDER_PLATFORM.
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
+\devicenormative{\subsubsection}{Device Memory Buffer}{Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
+
+A device MUST NOT offer VIRTIO_F_DMB unless the transport provides a
+shared memory region discovery mechanism.
+
+A device that offers VIRTIO_F_DMB MUST expose exactly one shared memory
+region for the Device Memory Buffer and MUST report that region's
+\field{shmid} through the transport-specific mechanism.
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
+If VIRTIO_F_DMB has been negotiated, the device MUST NOT access any memory
+outside the Device Memory Buffer region in order to process virtqueues.
+
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
-- 
2.47.1

