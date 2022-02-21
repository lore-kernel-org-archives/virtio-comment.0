Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [PATCH v2 2/4] Add PCI configuration field "queue_indirect_size"
Date: Mon, 21 Feb 2022 17:27:10 +0100
Message-ID: <63288314.T0Av8poOHj@silver>
In-Reply-To: <2255414.aXzeqRvSCW@silver>
References: <2255414.aXzeqRvSCW@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>

This new PCI configuration field allows to negotiate a more fine
graded maximum lenght of indirect descriptor chains.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 content.tex | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/content.tex b/content.tex
index 685525d..da57d5d 100644
--- a/content.tex
+++ b/content.tex
@@ -902,6 +902,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
         le64 queue_device;              /* read-write */
         le16 queue_notify_data;         /* read-only for driver */
         le16 queue_reset;               /* read-write */
+        le32 queue_indirect_size;       /* read-write */
 };
 \end{lstlisting}
 
@@ -987,6 +988,17 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
         This field exists only if VIRTIO_F_RING_RESET has been
         negotiated. (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
 
+\item[\field{queue_indirect_size}]
+        This field is used to negotiate the maximum number of descriptors per
+        indirect descriptor table as in \ref{sec:Basic Facilities of a Virtio
+        Device / Virtqueues / The Virtqueue Descriptor Table / Indirect
+        Descriptors} if and only if the VIRTIO_RING_F_INDIRECT_SIZE feature has
+        been negotiated.
+
+        The device specifies its maximum number of descriptors per indirect
+        descriptor table. If the driver requires fewer descriptors, it writes
+        its lower value to inform the device of the reduced resource
+        requirements.
 \end{description}
 
 \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
@@ -1081,6 +1093,12 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 values to different values than those that were used before the queue reset.
 (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
 
+The driver SHOULD write to \field{queue_indirect_size} if its maximum number of
+descriptors per vring slot is lower than that reported by the device.
+
+The driver MUST NOT write a higher value to \field{queue_indirect_size} than the
+one it reads from the device.
+
 \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
 
 The notification location is found using the VIRTIO_PCI_CAP_NOTIFY_CFG
-- 
2.30.2




