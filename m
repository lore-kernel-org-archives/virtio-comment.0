Return-Path: <virtio-comment-return-2202-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9F225986400
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Aug 2021 13:32:05 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
Date: Thu, 12 Aug 2021 15:31:49 +0200
Message-Id: <20210812133150.36146-2-david@redhat.com>
In-Reply-To: <20210812133150.36146-1-david@redhat.com>
References: <20210812133150.36146-1-david@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v1 1/2] virtio-mem: introduce VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>
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
 virtio-mem.tex | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/virtio-mem.tex b/virtio-mem.tex
index 62a1d02..c4dd0d0 100644
--- a/virtio-mem.tex
+++ b/virtio-mem.tex
@@ -46,6 +46,8 @@ \subsection{Feature bits}\label{sec:Device Types / Memory=
 Device / Feature bits}
 \begin{description}
 \item[VIRTIO_MEM_F_ACPI_PXM (0)] The field \field{node_id} in the device
 configuration is valid and corresponds to an ACPI PXM.
+\item[VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE (1)] The driver MUST NOT access
+unplugged memory.
 \end{description}
=20
 \subsection{Device configuration layout}\label{sec:Device Types / Memory D=
evice / Device configuration layout}
@@ -144,11 +146,17 @@ \subsection{Device Initialization}\label{Device Types=
 / Memory Device / Device I
=20
 \drivernormative{\subsubsection}{Device Initialization}{Device Types / Mem=
ory Device / Device Initialization}
=20
+The driver SHOULD accept VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE if it is
+offered and the driver supports it.
+
 The driver SHOULD issue UNPLUG ALL requests until successful if the device
 still has memory plugged and the plugged memory is not in use.
=20
 \devicenormative{\subsubsection}{Device Initialization}{Device Types / Mem=
ory Device / Device Initialization}
=20
+A device MAY fail to operate further if VIRTIO_MEM_F_UNPLUGGED_INACCESSIBL=
E
+is not accepted.
+
 The device MUST NOT change the state of memory blocks during device reset.
=20
 The device MUST NOT change the content of plugged memory blocks during
@@ -220,8 +228,11 @@ \subsection{Device Operation}\label{sec:Device Types /=
 Memory Device / Device Op
 The driver MUST NOT read from unplugged memory blocks outside
 \field{usable_region_size}.
=20
-The driver SHOULD NOT read from unplugged memory blocks inside
-\field{usable_region_size}.
+Without VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, the driver SHOULD NOT read
+memory of unplugged memory blocks inside \field{usable_region_size}.
+
+With VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, the driver MUST NOT read memory =
of
+unplugged memory blocks.
=20
 The driver MUST NOT request to unplug memory blocks while the memory is
 still in use.
@@ -246,10 +257,13 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Memory Device / Device Op
=20
 The device MUST NOT change the content of plugged memory blocks.
=20
-The device MUST allow the CPU to read from unplugged memory blocks inside
-the usable device-managed region. \footnote{To allow for simplified dumpin=
g of
-memory. The CPU is expected to copy such memory to another location before
-starting DMA.}
+Without VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, the device MUST allow the CPU=
 to
+read memory of unplugged memory blocks inside \field{usable_region_size}.
+\footnote{To allow for simplified dumping of memory. The CPU is expected t=
o
+copy such memory to another location before starting DMA.}
+
+With VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, the device MAY allow the CPU to
+read memory of unplugged memory blocks inside \field{usable_region_size}.
=20
 The device MAY allow to read from unplugged memory blocks inside the
 usable device-managed region via DMA.
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

