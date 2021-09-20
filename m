Return-Path: <david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Subject: [PATCH RESEND v2 4/5] virtio-mem: introduce VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
Date: Mon, 20 Sep 2021 15:46:52 +0200
Message-Id: <20210920134653.16412-5-david@redhat.com>
In-Reply-To: <20210920134653.16412-1-david@redhat.com>
References: <20210920134653.16412-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>, Hui Zhu <teawater@gmail.com>, Marek Kedzierski <mkedzier@redhat.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Wei Yang <richard.weiyang@linux.alibaba.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Until now, we allowed a driver to read unplugged memory within the
usable device-managed region: this simplified bring-up of virtio-mem in
Linux quite a bit, especially when it came to physical memory dumping.

When the device is using a memory backend that supports a shared
zeropage, such as virtio-mem in QEMU under Linux on anonymous memory, the
old behavior could be realized easily.

However, when using other memory backends (such as hugetlbfs or shmem)
or architectures, such as s390x, where a shared zeropage either does not
exist or cannot be used, letting the driver read unplugged memory can
result in undesired memory consumption in the hypervisor. The device
wants to make sure that the guest is aware and will not read unplugged
memory, not even in corner cases.

In the meantime, the Linux implementation matured such that it will no
longer access unplugged memory, for example, during kdump, when reading
/proc/kcore, or via (now removed) /dev/kmem.

Similar to VIRTIO_F_ACCESS_PLATFORM, this change will be disruptive and
require driver adaptions -- even if it's just accepting the new feature.
Devices are expected to only set the bit when really required, to keep
existing setups working.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 virtio-mem.tex | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/virtio-mem.tex b/virtio-mem.tex
index 3860b8c..dce035c 100644
--- a/virtio-mem.tex
+++ b/virtio-mem.tex
@@ -46,6 +46,8 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Device / Feature bits}
 \begin{description}
 \item[VIRTIO_MEM_F_ACPI_PXM (0)] The field \field{node_id} in the device
 configuration is valid and corresponds to an ACPI PXM.
+\item[VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE (1)] The driver is not allowed to
+access unplugged memory.
 \end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / Memory Device / Device configuration layout}
@@ -144,11 +146,17 @@ \subsection{Device Initialization}\label{Device Types / Memory Device / Device I
 
 \drivernormative{\subsubsection}{Device Initialization}{Device Types / Memory Device / Device Initialization}
 
+The driver SHOULD accept VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE if it is
+offered and the driver supports it.
+
 The driver SHOULD issue UNPLUG ALL requests until successful if the device
 still has memory plugged and the plugged memory is not in use.
 
 \devicenormative{\subsubsection}{Device Initialization}{Device Types / Memory Device / Device Initialization}
 
+A device MAY fail to operate further if VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
+is not accepted.
+
 The device MUST NOT change the state of memory blocks during device reset.
 
 The device MUST NOT change the content of plugged memory blocks during
@@ -223,9 +231,13 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
 The driver MUST NOT read memory of unplugged memory blocks inside
 \field{usable_region_size} via DMA.
 
-The driver SHOULD NOT read memory of unplugged memory blocks inside
+If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has not been negotiated, the driver
+SHOULD NOT read memory of unplugged memory blocks inside
 \field{usable_region_size} via the CPU.
 
+If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has been negotiated, the driver
+MUST NOT read memory of unplugged memory blocks.
+
 The driver MUST NOT request to unplug memory blocks while the memory is
 still in use.
 
@@ -252,10 +264,11 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
 The device MUST allow the driver to read and write memory of plugged
 memory blocks.
 
-The device MUST allow the driver to read memory of unplugged memory blocks
-inside \field{usable_region_size} via the CPU. \footnote{To allow for simplified
-dumping of memory. The CPU is expected to copy such memory to another location
-before starting DMA.}
+If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has not been negotiated, the device
+MUST allow the driver to read memory of unplugged memory blocks inside
+\field{usable_region_size} via the CPU. \footnote{To allow for simplified
+dumping of memory. The CPU is expected to copy such memory to another
+location before starting DMA.}
 
 The device MAY change the state of memory blocks during system resets.
 
-- 
2.31.1

