Return-Path: <david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Subject: [PATCH RESEND v2 5/5] virtio-mem: describe interaction with memory properties
Date: Mon, 20 Sep 2021 15:46:53 +0200
Message-Id: <20210920134653.16412-6-david@redhat.com>
In-Reply-To: <20210920134653.16412-1-david@redhat.com>
References: <20210920134653.16412-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>, Hui Zhu <teawater@gmail.com>, Marek Kedzierski <mkedzier@redhat.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Wei Yang <richard.weiyang@linux.alibaba.com>
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
@@ -32,6 +32,16 @@ \section{Memory Device}\label{sec:Device Types / Memory Device}
 expose plugged memory blocks to the operating system as system RAM,
 available for the page allocator.
 
+Some platforms provide memory properties for system RAM that are usually
+queried and modified using special CPU instructions. Memory properties might
+be implicitly queried or modified on memory access. Memory properties can
+include advanced memory protection, access and change indication, or memory
+usage indication relevant in virtualized environments. \footnote{For example,
+s390x provides storage keys for each 4 KiB page and may, depending on the
+configuration, provide storage attributes for each 4 KiB page.} The device
+provides the exact same properties with the exact same semantics for
+plugged device memory as available for comparable RAM in the same configuration.
+
 \subsection{Device ID}\label{sec:Device Types / Memory Device / Device ID}
 24
 
@@ -47,7 +57,9 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Device / Feature bits}
 \item[VIRTIO_MEM_F_ACPI_PXM (0)] The field \field{node_id} in the device
 configuration is valid and corresponds to an ACPI PXM.
 \item[VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE (1)] The driver is not allowed to
-access unplugged memory.
+access unplugged memory. \footnote{On platforms with memory properties that
+might get modified implicitly on memory access, this feature is expected to
+be offered by the device.}
 \end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / Memory Device / Device configuration layout}
@@ -159,8 +171,8 @@ \subsection{Device Initialization}\label{Device Types / Memory Device / Device I
 
 The device MUST NOT change the state of memory blocks during device reset.
 
-The device MUST NOT change the content of plugged memory blocks during
-device reset.
+The device MUST NOT modify memory or memory properties of plugged memory
+blocks during device reset.
 
 \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Operation}
 
@@ -223,23 +235,24 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
 
 \drivernormative{\subsubsection}{Device Operation}{Device Types / Memory Device / Device Operation}
 
-The driver MUST NOT write memory of unplugged memory blocks.
+The driver MUST NOT write memory or modify memory properties of
+unplugged memory blocks.
 
-The driver MUST NOT read memory of unplugged memory blocks outside
-\field{usable_region_size}.
+The driver MUST NOT read memory or query memory properties of unplugged memory
+blocks outside \field{usable_region_size}.
 
-The driver MUST NOT read memory of unplugged memory blocks inside
-\field{usable_region_size} via DMA.
+The driver MUST NOT read memory or query memory properties of unplugged memory
+blocks inside \field{usable_region_size} via DMA.
 
 If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has not been negotiated, the driver
-SHOULD NOT read memory of unplugged memory blocks inside
-\field{usable_region_size} via the CPU.
+SHOULD NOT read memory or query memory properties of unplugged memory blocks
+inside \field{usable_region_size} via the CPU.
 
 If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has been negotiated, the driver
-MUST NOT read memory of unplugged memory blocks.
+MUST NOT read memory or query memory properties of unplugged memory blocks.
 
-The driver MUST NOT request to unplug memory blocks while the memory is
-still in use.
+The driver MUST NOT request unplug of memory blocks while corresponding memory
+or memory properties are still in use.
 
 The driver SHOULD initialize memory blocks after plugging them, the content
 is undefined.
@@ -257,18 +270,24 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
 
 \devicenormative{\subsubsection}{Device Operation}{Device Types / Memory Device / Device Operation}
 
-The device MAY change the content of unplugged memory blocks at any time.
+The device MUST provide the exact same memory properties with the exact same
+semantics for device memory the platform provides in the same configuration for
+comparable RAM.
 
-The device MUST NOT change the content of plugged memory blocks.
+The device MAY modify memory of unplugged memory blocks or reset memory
+properties of such memory blocks to platform defaults at any time.
 
-The device MUST allow the driver to read and write memory of plugged
-memory blocks.
+The device MUST NOT modify memory or memory properties of plugged memory
+blocks.
+
+The device MUST allow the driver to read and write memory and to query
+and modify memory attributes of plugged memory blocks.
 
 If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has not been negotiated, the device
-MUST allow the driver to read memory of unplugged memory blocks inside
-\field{usable_region_size} via the CPU. \footnote{To allow for simplified
-dumping of memory. The CPU is expected to copy such memory to another
-location before starting DMA.}
+MUST allow the driver to read memory and to query memory properties of
+unplugged memory blocks inside \field{usable_region_size} via the CPU.
+\footnote{To allow for simplified dumping of memory. The CPU is expected to
+copy such memory to another location before starting DMA.}
 
 The device MAY change the state of memory blocks during system resets.
 
-- 
2.31.1

