Return-Path: <virtio-comment-return-2288-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7CFF49861ED
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Sep 2021 13:36:31 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
Date: Mon, 20 Sep 2021 15:36:18 +0200
Message-Id: <20210920133618.16071-6-david@redhat.com>
In-Reply-To: <20210920133618.16071-1-david@redhat.com>
References: <20210920133618.16071-1-david@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2 5/5] virtio-mem: describe interaction with memory properties
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Let's describe how we expect the interaction with memory properties that
might be available on a specific platform for ordinary system RAM.

This is primarily a preparation for s390x support, which provides
storage keys and may provide storage attributes, depending on the system
configuration.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 virtio-mem.tex | 61 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 21 deletions(-)

diff --git a/virtio-mem.tex b/virtio-mem.tex
index dce035c..0a6d558 100644
--- a/virtio-mem.tex
+++ b/virtio-mem.tex
@@ -32,6 +32,16 @@ \section{Memory Device}\label{sec:Device Types / Memory =
Device}
 expose plugged memory blocks to the operating system as system RAM,
 available for the page allocator.
=20
+Some platforms provide memory properties for system RAM that are usually
+queried and modified using special CPU instructions. Memory properties mig=
ht
+be implicitly queried or modified on memory access. Memory properties can
+include advanced memory protection, access and change indication, or memor=
y
+usage indication relevant in virtualized environments. \footnote{For examp=
le,
+s390x provides storage keys for each 4 KiB page and may, depending on the
+configuration, provide storage attributes for each 4 KiB page.} The device
+provides the exact same properties with the exact same semantics for
+plugged device memory as available for comparable RAM in the same configur=
ation.
+
 \subsection{Device ID}\label{sec:Device Types / Memory Device / Device ID}
 24
=20
@@ -47,7 +57,9 @@ \subsection{Feature bits}\label{sec:Device Types / Memory=
 Device / Feature bits}
 \item[VIRTIO_MEM_F_ACPI_PXM (0)] The field \field{node_id} in the device
 configuration is valid and corresponds to an ACPI PXM.
 \item[VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE (1)] The driver is not allowed t=
o
-access unplugged memory.
+access unplugged memory. \footnote{On platforms with memory properties tha=
t
+might get modified implicitly on memory access, this feature is expected t=
o
+be offered by the device.}
 \end{description}
=20
 \subsection{Device configuration layout}\label{sec:Device Types / Memory D=
evice / Device configuration layout}
@@ -159,8 +171,8 @@ \subsection{Device Initialization}\label{Device Types /=
 Memory Device / Device I
=20
 The device MUST NOT change the state of memory blocks during device reset.
=20
-The device MUST NOT change the content of plugged memory blocks during
-device reset.
+The device MUST NOT modify memory or memory properties of plugged memory
+blocks during device reset.
=20
 \subsection{Device Operation}\label{sec:Device Types / Memory Device / Dev=
ice Operation}
=20
@@ -223,23 +235,24 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Memory Device / Device Op
=20
 \drivernormative{\subsubsection}{Device Operation}{Device Types / Memory D=
evice / Device Operation}
=20
-The driver MUST NOT write memory of unplugged memory blocks.
+The driver MUST NOT write memory or modify memory properties of
+unplugged memory blocks.
=20
-The driver MUST NOT read memory of unplugged memory blocks outside
-\field{usable_region_size}.
+The driver MUST NOT read memory or query memory properties of unplugged me=
mory
+blocks outside \field{usable_region_size}.
=20
-The driver MUST NOT read memory of unplugged memory blocks inside
-\field{usable_region_size} via DMA.
+The driver MUST NOT read memory or query memory properties of unplugged me=
mory
+blocks inside \field{usable_region_size} via DMA.
=20
 If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has not been negotiated, the driver
-SHOULD NOT read memory of unplugged memory blocks inside
-\field{usable_region_size} via the CPU.
+SHOULD NOT read memory or query memory properties of unplugged memory bloc=
ks
+inside \field{usable_region_size} via the CPU.
=20
 If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has been negotiated, the driver
-MUST NOT read memory of unplugged memory blocks.
+MUST NOT read memory or query memory properties of unplugged memory blocks=
.
=20
-The driver MUST NOT request to unplug memory blocks while the memory is
-still in use.
+The driver MUST NOT request unplug of memory blocks while corresponding me=
mory
+or memory properties are still in use.
=20
 The driver SHOULD initialize memory blocks after plugging them, the conten=
t
 is undefined.
@@ -257,18 +270,24 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Memory Device / Device Op
=20
 \devicenormative{\subsubsection}{Device Operation}{Device Types / Memory D=
evice / Device Operation}
=20
-The device MAY change the content of unplugged memory blocks at any time.
+The device MUST provide the exact same memory properties with the exact sa=
me
+semantics for device memory the platform provides in the same configuratio=
n for
+comparable RAM.
=20
-The device MUST NOT change the content of plugged memory blocks.
+The device MAY modify memory of unplugged memory blocks or reset memory
+properties of such memory blocks to platform defaults at any time.
=20
-The device MUST allow the driver to read and write memory of plugged
-memory blocks.
+The device MUST NOT modify memory or memory properties of plugged memory
+blocks.
+
+The device MUST allow the driver to read and write memory and to query
+and modify memory attributes of plugged memory blocks.
=20
 If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has not been negotiated, the device
-MUST allow the driver to read memory of unplugged memory blocks inside
-\field{usable_region_size} via the CPU. \footnote{To allow for simplified
-dumping of memory. The CPU is expected to copy such memory to another
-location before starting DMA.}
+MUST allow the driver to read memory and to query memory properties of
+unplugged memory blocks inside \field{usable_region_size} via the CPU.
+\footnote{To allow for simplified dumping of memory. The CPU is expected t=
o
+copy such memory to another location before starting DMA.}
=20
 The device MAY change the state of memory blocks during system resets.
=20
--=20
2.31.1


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

