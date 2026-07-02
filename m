Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2178034D384
	for <virtio-comment@lists.linux.dev>; Thu,  2 Jul 2026 04:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782964815; cv=none; b=uCjliZS6g00QB6B0X6h5KgOH4QY/k0R0S9YVCHc4Wh3yW/hPcDKzavK4qDBmeRlSckRD9yrEeacqkvub/cCRaKFz6tcyugXQmjeSJerhS5Bpq+jeBKUM1zQEumsE2KB60+m83iSVXYan6PdTV0XijgWATQqvONooryLAjLq+hJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782964815; c=relaxed/simple;
	bh=Vb4kKoT3Vf6fnL/V45W/PYX7lHI/m3FKzFpt8lfhd4Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nxLsNqY9/5QS6QRXvzeQrjzE5N6YzwaBmpHr/9FriRWs3JZ/dCqhKELu6uZBq+gTt0bJ1ZW1Fb3FdGGR6q46SqbtQWPSUywKGYm9a1etbyz+VCr8c6oSHUiOoIpNtgFp+VT7flBZhxLWI+rQ0H8sa8EOsQE+iMma6sMv+5bVFR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=qEzroTSS; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="qEzroTSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1782964814; x=1814500814;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VVVLAbIsqw2oovtugoeHYy9a6he3IRStZCQQDbzWOYA=;
  b=qEzroTSS/HijJO7f48ZU4ZVQJAI+F1mC8EiAacRWBhKYBMpbK1F5bcgu
   o/f69jMX4I6tYdZmqiN33onezUExBMogHsLsQLxdRw9UGIi17Qc7PtNIr
   qKeVPBsQuIy5EiGXMoI8Ehoaw4JyFwaQAa7ZO2EODFM8KhmEf1ftv5YRy
   pWEI+eHXCmnOfiiX9cYQofnaQJIc+AyDMRFQjmVJ9f4eSCtDzGBC3K1PU
   Ee4TJgSCuhQO9AeWU5te/SCZr0+FXVVzGvkSKpwUt8PN8DV5K+k7mAHLV
   QM/c56IROvMW3ysQYnHZta7CtRJWW/mKsBBRCV26uiXt8KfFJpz0WwvWc
   Q==;
X-CSE-ConnectionGUID: iKLNre3aRxaAunGU3kPb4g==
X-CSE-MsgGUID: Y1xr2JjxSoW8O3dQxhZ+OQ==
X-IronPort-AV: E=Sophos;i="6.25,143,1779148800"; 
   d="scan'208";a="22691885"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 04:00:11 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:12986]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.22.244:2525] with esmtp (Farcaster)
 id d17ca3ce-d4c6-4c36-8a07-1f4698103869; Thu, 2 Jul 2026 04:00:10 +0000 (UTC)
X-Farcaster-Flow-ID: d17ca3ce-d4c6-4c36-8a07-1f4698103869
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 2 Jul 2026 04:00:10 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 2 Jul 2026 04:00:08 +0000
From: Alexander Graf <graf@amazon.com>
To: <virtio-comment@lists.linux.dev>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH] Add VIRTIO_F_DMB (Device Memory Buffer)
Date: Thu, 2 Jul 2026 04:00:06 +0000
Message-ID: <20260702040006.65669-1-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D045UWA001.ant.amazon.com (10.13.139.83) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A confidential-computing device sits outside the driver's trust domain
and must operate with no mapping to driver memory. VIRTIO_F_ACCESS_PLATFORM
alone does not express this, and neither does a platform restricted-DMA
pool: both still reach driver memory through platform translation. While
a global bounce buffer works for some environments, I want to have dedicated
shared memory buffers for confidential computing *per device*, which
triggered this virtio spec extension.

VIRTIO_F_DMB adds a Device Memory Buffer: a single device-owned shared
memory region that holds the virtqueues (Descriptor, Driver and Device
Areas) and the buffers they reference. Every address the driver places in
a virtqueue becomes an offset into this region rather than a physical or
bus address, so the device is confined to memory the driver has explicitly
published.

The region reuses the existing Shared Memory Regions facility, is located
with the transport-specific enumeration mechanism (so it is available only
on transports that define one), and is identified by the reserved shmid 2.
VIRTIO_F_DMB refines VIRTIO_F_ACCESS_PLATFORM and is negotiated only
together with it.

To provide the confinement guarantee, the device MUST bounds-check every
driver-supplied offset against the region and set DEVICE_NEEDS_RESET on
violation.

Signed-off-by: Alexander Graf <graf@amazon.com>

---

Two items for discussion:

* Feature bit number: this uses bit 44. Bits 41/42 are the virtio-net
  legacy RSC bits and 43 is VIRTIO_F_SUSPEND, so 44 is the first free
  reserved bit. Happy to take whatever the TC prefers to allocate.

* Shared memory region id: DMB needs a well-known shmid so the driver can
  locate the region independent of device type. This draft reserves shmid 2
  and adds a "Reserved Shared Memory Region IDs" registry. However shmid is
  currently a per-device-type namespace, and at least one device type
  (virtio-scmi) documents the entire shmid space as its own. Guidance
  requested on the preferred mechanism: (a) a small transport-reserved shmid
  range with device types adjusted to exclude it, or (b) identifying the DMB
  region by a means other than a fixed shmid. The exact number is not fixed
  pending this decision.

 conformance.tex |   2 +
 content.tex     |  19 +++++++
 shared-mem.tex  | 130 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 151 insertions(+)

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
index 6e6f6c4..077d140 100644
--- a/shared-mem.tex
+++ b/shared-mem.tex
@@ -40,3 +40,133 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
 are used to control the operation of the device, nor to stream
 data.
 
+\subsection{Reserved Shared Memory Region IDs}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Reserved Shared Memory Region IDs}
+
+The interpretation of a \field{shmid} is normally specific to the device
+type.  A small number of \field{shmid} values are instead reserved
+across all device types for facilities that are defined independently of
+the device type.  A shared memory region that is specific to a device
+type MUST NOT use a reserved \field{shmid}; \field{shmid} values that are
+not reserved remain specific to the device type and are unaffected.  The
+reserved values are:
+
+\begin{description}
+\item[2] Device Memory Buffer (see \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}~\nameref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}).
+\end{description}
+
+\subsection{Device Memory Buffer}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Device Memory Buffer}
+
+When VIRTIO_F_DMB (see \ref{sec:Basic Facilities of a Virtio Device / Feature Bits}) is
+negotiated, the device offers a single shared memory region, the
+\emph{Device Memory Buffer}, identified by the reserved \field{shmid} 2
+(see \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Reserved Shared Memory Region IDs}).
+The driver locates the region using the transport-specific shared memory
+region enumeration mechanism, in the same way as any other shared memory
+region.  Because that enumeration is transport-specific, VIRTIO_F_DMB is
+available only on transports that define a shared memory region discovery
+mechanism.
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
+If VIRTIO_F_DMB has been negotiated, the driver MUST locate the Device
+Memory Buffer region using the reserved \field{shmid} 2 and the
+transport-specific shared memory region enumeration mechanism.  A driver
+MUST NOT accept VIRTIO_F_DMB if it cannot locate the shared memory region
+with \field{shmid} 2.
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
+region with \field{shmid} 2.
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
-- 
2.47.1




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

