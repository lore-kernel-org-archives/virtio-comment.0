Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [PATCH v3 3/4] Add MMIO configuration register "QueueIndirectNum"
Date: Wed, 16 Mar 2022 14:52:48 +0100
Message-ID: <2793595.GjldddfLdn@silver>
In-Reply-To: <4735344.EBYxvr1mta@silver>
References: <4735344.EBYxvr1mta@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This new MMIO configuration register allows to negotiate a more fine
graded maximum lenght of indirect descriptor chains.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 content.tex | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 5162e2b..97665a4 100644
--- a/content.tex
+++ b/content.tex
@@ -2225,8 +2225,9 @@ \subsection{Legacy interface}\label{sec:Virtio Transport Options / Virtio Over M
   \hline
   \mmioreg{QueueSel}{Virtual queue index}{0x030}{W}{%
     Writing to this register selects the virtual queue that the
-    following operations on the \field{QueueNumMax}, \field{QueueNum}, \field{QueueAlign}
-    and \field{QueuePFN} registers apply to. The index
+    following operations on the \field{QueueNumMax}, \field{QueueNum},
+    \field{QueueAlign}, \field{QueuePFN} and \field{QueueIndirectNum} registers
+    apply to. The index
     number of the first queue is zero (0x0). 
 .
   }
@@ -2282,6 +2283,19 @@ \subsection{Legacy interface}\label{sec:Virtio Transport Options / Virtio Over M
     Also see \ref{sec:General Initialization And Device Operation / Device Initialization}~\nameref{sec:General Initialization And Device Operation / Device Initialization}.
   }
   \hline
+  \mmioreg{QueueIndirectNum}{Virtual queue indirect size}{0x074}{RW}{%
+    This register is used to negotiate the maximum number of descriptors per
+    indirect descriptor table as in \ref{sec:Basic Facilities of a Virtio
+    Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
+    if and only if the VIRTIO_RING_F_INDIRECT_SIZE feature has been negotiated.
+
+    The device specifies its maximum number of descriptors per indirect
+    descriptor table. If the driver requires fewer descriptors, it writes
+    its lower value to inform the device of the reduced resource requirements.
+
+    This applies to the queue selected by writing to \field{QueueSel}.
+  }
+  \hline
   \mmioreg{Config}{Configuration space}{0x100+}{RW}{}
   \hline
 \end{longtable}
@@ -2314,6 +2328,10 @@ \subsection{Legacy interface}\label{sec:Virtio Transport Options / Virtio Over M
 \item Notify the device about the queue size by writing the size to
    \field{QueueNum}.
 
+\item If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, read the maximum
+   length of indirect descriptor tables by reading \field{QueueIndirectNum}.
+   Write to lower this value if necessary.
+
 \item Notify the device about the used alignment by writing its value
    in bytes to \field{QueueAlign}.
 
-- 
2.30.2




