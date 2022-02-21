Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [PATCH v2 4/4] Add CCW configuration field "indirect_num" to vq_info_block
Date: Mon, 21 Feb 2022 18:01:41 +0100
Message-ID: <86604669.MZiAfaG04C@silver>
In-Reply-To: <2255414.aXzeqRvSCW@silver>
References: <2255414.aXzeqRvSCW@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>

This new CCW configuration field allows to negotiate a more fine
graded maximum lenght of indirect descriptor chains.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 content.tex | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/content.tex b/content.tex
index a3baf4d..d400ea7 100644
--- a/content.tex
+++ b/content.tex
@@ -2599,6 +2599,7 @@ \subsubsection{Configuring a Virtqueue}\label{sec:Virtio Transport Options / Vir
         be16 num;
         be64 driver;
         be64 device;
+        be32 indirect_num;
 };
 \end{lstlisting}
 
@@ -2607,6 +2608,10 @@ \subsubsection{Configuring a Virtqueue}\label{sec:Virtio Transport Options / Vir
 available area and used area for queue \field{index}, respectively. The actual
 virtqueue size (number of allocated buffers) is transmitted in \field{num}.
 
+If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated then \field{indirect_num}
+reflects the maximum length of indirect descriptor tables for queue
+\field{index}.
+
 \devicenormative{\paragraph}{Configuring a Virtqueue}{Virtio Transport Options / Virtio over channel I/O / Device Initialization / Configuring a Virtqueue}
 
 \field{res0} is reserved and MUST be ignored by the device.
-- 
2.30.2




