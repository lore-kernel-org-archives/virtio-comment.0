Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [PATCH v3 4/4] Add CCW configuration field "indirect_num"
Date: Wed, 16 Mar 2022 14:55:00 +0100
Message-ID: <3040881.qp741xram0@silver>
In-Reply-To: <4735344.EBYxvr1mta@silver>
References: <4735344.EBYxvr1mta@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This new CCW configuration field allows to negotiate a more fine
graded maximum lenght of indirect descriptor chains.

Bump CCW virtio revision to 3 and make the existence of this new
field "indirect_num" dependant on revision 3.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 content.tex | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index 97665a4..ea205d3 100644
--- a/content.tex
+++ b/content.tex
@@ -2520,7 +2520,9 @@ \subsubsection{Setting the Virtio Revision}\label{sec:Virtio Transport Options /
 \hline
 2        & 0      & <empty>   & CCW_CMD_READ_STATUS support \\
 \hline
-3-n      &        &           & reserved for later revisions \\
+3        & 0      & <empty>   & Queue Indirect Size (indirect_num) support \\
+\hline
+4-n      &        &           & reserved for later revisions \\
 \hline
 \end{tabular}
 
@@ -2581,12 +2583,17 @@ \subsubsection{Configuring a Virtqueue}\label{sec:Virtio Transport Options / Vir
 struct vq_config_block {
         be16 index;
         be16 max_num;
+        be32 indirect_num; /* since virtio-ccw rev. 3 */
 };
 \end{lstlisting}
 
 The requested number of buffers for queue \field{index} is returned in
 \field{max_num}.
 
+Since revision 3, \field{indirect_num} exists, which is supposed to reflect the
+Queue Indirect Size (i.e. the maximum length of indirect descriptor tables)
+supported by device for this queue.
+
 Afterwards, CCW_CMD_SET_VQ is issued by the driver to inform the
 device about the location used for its queue. The transmitted
 structure is
@@ -2599,6 +2606,7 @@ \subsubsection{Configuring a Virtqueue}\label{sec:Virtio Transport Options / Vir
         be16 num;
         be64 driver;
         be64 device;
+        be32 indirect_num; /* since virtio-ccw rev. 3 */
 };
 \end{lstlisting}
 
@@ -2607,6 +2615,10 @@ \subsubsection{Configuring a Virtqueue}\label{sec:Virtio Transport Options / Vir
 available area and used area for queue \field{index}, respectively. The actual
 virtqueue size (number of allocated buffers) is transmitted in \field{num}.
 
+Since revision 3, \field{indirect_num} exists, which is supposed to reflect the
+Queue Indirect Size (i.e. the maximum length of indirect descriptor tables)
+supported by driver for this queue.
+
 \devicenormative{\paragraph}{Configuring a Virtqueue}{Virtio Transport Options / Virtio over channel I/O / Device Initialization / Configuring a Virtqueue}
 
 \field{res0} is reserved and MUST be ignored by the device.
-- 
2.30.2




