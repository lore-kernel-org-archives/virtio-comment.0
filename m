Return-Path: <55b04c584638393050bc76467439550d87e24696@lizzy.crudebyte.com>
Message-Id: <55b04c584638393050bc76467439550d87e24696.1639494803.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1639494803.git.qemu_oss@crudebyte.com>
References: <cover.1639494803.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 14 Dec 2021 16:13:17 +0100
Subject: [PATCH 2/2] Add common configuration field "queue_indirect_size"
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

This new common configuration field allows to negotiate a more fine
graded maximum lenght of indirect descriptor chains.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 content.tex    | 25 ++++++++++++++++++++++++-
 split-ring.tex |  3 +++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index 0aa4842..e3cfcae 100644
--- a/content.tex
+++ b/content.tex
@@ -859,6 +859,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
         le64 queue_driver;              /* read-write */
         le64 queue_device;              /* read-write */
         le16 queue_notify_data;         /* read-only for driver */
+        le32 queue_indirect_size;       /* read-write */
 };
 \end{lstlisting}
 
@@ -938,6 +939,16 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
         may benefit from providing another value, for example an internal virtqueue
         identifier, or an internal offset related to the virtqueue number.
         \end{note}
+
+\item[\field{queue_indirect_size}]
+        This field is used to negotiate the maximum amount of descriptors per
+        vring slot as in \ref{sec:Basic Facilities of a Virtio Device /
+        Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors} if
+        and only if the VIRTIO_RING_F_INDIRECT_SIZE feature has been negotiated.
+
+        The device specifies its maximum supported number of descriptors per
+        vring slot. If the driver requires fewer descriptors, it writes its
+        lower value to inform the device of the reduced resource requirements.
 \end{description}
 
 \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
@@ -1003,6 +1014,12 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 
 The driver MUST NOT write a 0 to \field{queue_enable}.
 
+The driver SHOULD write to \field{queue_indirect_size} if its maximum number of
+descriptors per vring slot is lower than that reported by the device.
+
+The driver MUST NOT write a higher value to \field{queue_indirect_size} than the
+one it reads from the device.
+
 \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
 
 The notification location is found using the VIRTIO_PCI_CAP_NOTIFY_CFG
@@ -6712,7 +6729,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
   being transferred per vring slot, but also avoids complicated synchronization
   mechanisms if the device only supports a very small amount of vring slots. Due
   to the 16-bit size of a descriptor's "next" field there is still an absolute
-  limit of $2^{16}$ descriptors per indirect descriptor table.
+  limit of $2^{16}$ descriptors per indirect descriptor table. However the
+  actual maximum amount supported by either device or driver might be less,
+  and therefore the common configuration field "queue_indirect_size" MUST exist
+  if VIRTIO_RING_F_INDIRECT_SIZE was negotiated to subsequently
+  negotiate the actual amount of maximum indirect descriptors supported
+  by both sides, as described in \ref{sec:Virtio Transport Options / Virtio
+  Over PCI Bus / PCI Device Layout / Common configuration structure layout}.
 
 \end{description}
 
diff --git a/split-ring.tex b/split-ring.tex
index ae2aeb8..d8f66c1 100644
--- a/split-ring.tex
+++ b/split-ring.tex
@@ -270,6 +270,9 @@ \subsubsection{Indirect Descriptors}\label{sec:Basic Facilities of a Virtio Devi
 
 A driver MUST NOT create a descriptor chain longer than the Queue Size of
 the device unless VIRTIO_RING_F_INDIRECT_SIZE has been negotiated.
+Furthermore if VIRTIO_RING_F_INDIRECT_SIZE has been negotiated then the number
+of descriptors per vring slot MUST NOT exceed the value negotiated by common
+configuration field "queue_indirect_size".
 
 A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEXT
 in \field{flags}.
-- 
2.20.1

