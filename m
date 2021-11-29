Return-Path: <4f5146a4bcbe59a76698e276216ef4a4d2270b61@lizzy.crudebyte.com>
Message-Id: <4f5146a4bcbe59a76698e276216ef4a4d2270b61.1638192251.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1638192251.git.qemu_oss@crudebyte.com>
References: <cover.1638192251.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 29 Nov 2021 14:23:01 +0100
Subject: [PATCH v2 2/2] Add common configuration field "queue_indirect_size"
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

This new common configuration field allows to negotiate a more fine
graded numeric maximum length of indirect descriptor chains.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 content.tex    | 37 ++++++++++++++++++++++++++++++++++++-
 split-ring.tex |  5 +++++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index 34fa23e..25861f3 100644
--- a/content.tex
+++ b/content.tex
@@ -859,6 +859,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
         le64 queue_driver;              /* read-write */
         le64 queue_device;              /* read-write */
         le16 queue_notify_data;         /* read-only for driver */
+        le16 queue_indirect_size;       /* read-write */
 };
 \end{lstlisting}
 
@@ -938,6 +939,34 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
         may benefit from providing another value, for example an internal virtqueue
         identifier, or an internal offset related to the virtqueue number.
         \end{note}
+
+\item[\field{queue_indirect_size}]
+        This field was added in revision 3 and MUST exist if revision 3
+        has been negotiated. This field is used to negotiate the maximum
+        amount of indirect descriptors per indirect descriptor table as in
+        \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / The
+        Virtqueue Descriptor Table / Indirect Descriptors}.
+
+        The device specifies its supported maximum amount here first,
+        subsequently driver may read and then SHOULD write this field to
+        lower the value if driver's maximum amount of indirect descriptors
+        ever being emplaced by driver per vring slot is less than what
+        device supports. However driver MUST NOT increase this value.
+
+        Two different semantics evolve for the value of this field, depending on
+        whether VIRTIO_RING_F_LARGE_INDIRECT_DESC (see section
+        \ref{sec:Reserved Feature Bits}) has been negotiated:
+
+        If VIRTIO_RING_F_LARGE_INDIRECT_DESC has not been negotiated, then the
+        effective maximum amount of indirect descriptors per indirect descriptor
+        table is min(Queue Size, \field{queue_indirect_size}). So in this case
+        this field allows driver to indicate if its supported maximum amount of
+        indirect descriptors is less than Queue Size.
+
+        If VIRTIO_RING_F_LARGE_INDIRECT_DESC has been negotiated, then the
+        effective maximum amount of indirect descriptors per indirect descriptor
+        table is directly and solely reflected by \field{queue_indirect_size}
+        field here.
 \end{description}
 
 \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
@@ -6712,7 +6741,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
   being transferred per vring slot, but also avoids complicated synchronization
   mechanisms if device only supports a very small amount of vring slots. Due to
   the 16-bit size of a descriptor's "next" field there is still an absolute
-  limit of $2^{16}$ descriptors per indirect descriptor table.
+  limit of $2^{16}$ descriptors per indirect descriptor table. However the
+  actual maximum amount supported by either device or driver might be less,
+  and therefore the common configuration field "queue_indirect_size" MUST exist
+  if VIRTIO_RING_F_LARGE_INDIRECT_DESC had been negotiated to subsequently
+  negotiate the actual amount of maximum indirect descriptors supported
+  by both sides, as described in \ref{sec:Virtio Transport Options / Virtio
+  Over PCI Bus / PCI Device Layout / Common configuration structure layout}.
 
 \end{description}
 
diff --git a/split-ring.tex b/split-ring.tex
index 5284635..dff4018 100644
--- a/split-ring.tex
+++ b/split-ring.tex
@@ -270,6 +270,11 @@ \subsubsection{Indirect Descriptors}\label{sec:Basic Facilities of a Virtio Devi
 
 A driver MUST NOT create a descriptor chain longer than the Queue Size of
 the device unless VIRTIO_RING_F_LARGE_INDIRECT_DESC has been negotiated.
+Furthermore if common configuration field "queue_indirect_size" exists
+(since revision 3, see section \ref{sec:Virtio Transport Options / Virtio Over
+PCI Bus / PCI Device Layout / Common configuration structure layout}) then a
+descriptor chain additionally MUST NOT be longer than the value negotiated by
+that common configuration field.
 
 A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEXT
 in \field{flags}.
-- 
2.20.1

