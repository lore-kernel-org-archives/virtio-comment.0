Return-Path: <4971f1bee76d664a71d411d8769a23a0d04097e7@lizzy.crudebyte.com>
Message-Id: <4971f1bee76d664a71d411d8769a23a0d04097e7.1639494803.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1639494803.git.qemu_oss@crudebyte.com>
References: <cover.1639494803.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 14 Dec 2021 16:13:10 +0100
Subject: [PATCH 1/2] Add VIRTIO_RING_F_INDIRECT_SIZE
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

This new feature flag allows to decouple the maximum amount of
descriptors in indirect descriptor tables from the Queue Size.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 content.tex    | 21 +++++++++++++++++++++
 split-ring.tex |  2 +-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index 5d112af..0aa4842 100644
--- a/content.tex
+++ b/content.tex
@@ -6693,6 +6693,27 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
   transport specific.
   For more details about driver notifications over PCI see \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Available Buffer Notifications}.
 
+  \item[VIRTIO_RING_F_INDIRECT_SIZE(40)] This feature indicates that the
+  maximum amount of descriptors in indirect descriptor tables is independent
+  from the Queue Size.
+
+  If this feature bit is not negotiated, then a driver MUST NOT create a
+  descriptor chain longer than the Queue Size, which then also applies to
+  indirect descriptor tables as in \ref{sec:Basic Facilities of a Virtio
+  Device / Virtqueues / The Virtqueue Descriptor Table / Indirect
+  Descriptors}. Which means without this feature, the Queue Size limits
+  both the maximum amount of slots in the vring, as well as the actual
+  bulk data size being transmitted per vring slot.
+
+  With this feature enabled, the Queue Size only limits the maximum amount
+  of slots in the vring, but does not limit the actual bulk data size
+  being transmitted when indirect descriptors are used. Decoupling these
+  two configuration parameters this way not only allows much larger bulk data
+  being transferred per vring slot, but also avoids complicated synchronization
+  mechanisms if the device only supports a very small amount of vring slots. Due
+  to the 16-bit size of a descriptor's "next" field there is still an absolute
+  limit of $2^{16}$ descriptors per indirect descriptor table.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
diff --git a/split-ring.tex b/split-ring.tex
index bfef62d..ae2aeb8 100644
--- a/split-ring.tex
+++ b/split-ring.tex
@@ -269,7 +269,7 @@ \subsubsection{Indirect Descriptors}\label{sec:Basic Facilities of a Virtio Devi
 one table per descriptor).
 
 A driver MUST NOT create a descriptor chain longer than the Queue Size of
-the device.
+the device unless VIRTIO_RING_F_INDIRECT_SIZE has been negotiated.
 
 A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEXT
 in \field{flags}.
-- 
2.20.1

