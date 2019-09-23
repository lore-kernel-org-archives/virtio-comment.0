Return-Path: virtio-comment-return-849-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 956B3985A54
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Sep 2019 16:14:30 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Date: Mon, 23 Sep 2019 18:14:14 +0200
Message-Id: <20190923161414.9129-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2] block: Add multiqueue
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

The spec miss that field. Add the field, some description around.

I've followed the network device's multiqueue mentions, and copied /
adapted when needed.

v2: Delete implementation detail about CPUs used.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 content.tex | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/content.tex b/content.tex
index 37a2190..da53922 100644
--- a/content.tex
+++ b/content.tex
@@ -3822,7 +3822,7 @@ \section{Block Device}\label{sec:Device Types / Block Device}
 
 The virtio block device is a simple virtual block device (ie.
 disk). Read and write requests (and other exotic requests) are
-placed in the queue, and serviced (probably out of order) by the
+placed in one of its queues, and serviced (probably out of order) by the
 device except where noted.
 
 \subsection{Device ID}\label{sec:Device Types / Block Device / Device ID}
@@ -3830,9 +3830,14 @@ \subsection{Device ID}\label{sec:Device Types / Block Device / Device ID}
 
 \subsection{Virtqueues}\label{sec:Device Types / Block Device / Virtqueues}
 \begin{description}
-\item[0] requestq
+\item[0] requestq1
+\item[\ldots]
+\item[N] requestqN
 \end{description}
 
+ N=1 if VIRTIO_BLK_F_MQ is not negotiated, otherwise N is set by
+ \field{num_queues}.
+
 \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
 
 \begin{description}
@@ -3857,6 +3862,8 @@ \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
 \item[VIRTIO_BLK_F_CONFIG_WCE (11)] Device can toggle its cache between writeback
     and writethrough modes.
 
+\item[VIRTIO_BLK_F_MQ (12)] Device supports multiqueue.
+
 \item[VIRTIO_BLK_F_DISCARD (13)] Device can support discard command, maximum
     discard sectors size in \field{max_discard_sectors} and maximum discard
     segment number in \field{max_discard_seg}.
@@ -3885,6 +3892,9 @@ \subsection{Device configuration layout}\label{sec:Device Types / Block Device /
 present. The availability of the others all depend on various feature
 bits as indicated above.
 
+The field \field{num_queues} only exists if VIRTIO_BLK_F_MQ is set. This field specifies
+the number of queues.
+
 The parameters in the configuration space of the device \field{max_discard_sectors}
 \field{discard_sector_alignment} are expressed in 512-byte units if the
 VIRTIO_BLK_F_DISCARD feature bit is negotiated. The \field{max_write_zeroes_sectors}
@@ -3913,7 +3923,8 @@ \subsection{Device configuration layout}\label{sec:Device Types / Block Device /
                 le32 opt_io_size;
         } topology;
         u8 writeback;
-        u8 unused0[3];
+        u8 unused0;
+        u16 num_queues;
         le32 max_discard_sectors;
         le32 max_discard_seg;
         le32 discard_sector_alignment;
@@ -3973,6 +3984,10 @@ \subsection{Device Initialization}\label{sec:Device Types / Block Device / Devic
     \field{max_write_zeroes_sectors} and \field{max_write_zeroes_seg} can
     be read to determine the maximum write zeroes sectors and maximum
     number of write zeroes segments for the block driver to use.
+
+\item If the VIRTIO_BLK_F_MQ feature is negotiated, \field{num_queues} field
+    can be read to determine the number of queues.
+
 \end{enumerate}
 
 \drivernormative{\subsubsection}{Device Initialization}{Device Types / Block Device / Device Initialization}
@@ -4024,7 +4039,7 @@ \subsubsection{Legacy Interface: Device Initialization}\label{sec:Device Types /
 
 \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Operation}
 
-The driver queues requests to the virtqueue, and they are used by
+The driver queues requests to the virtqueues, and they are used by
 the device (not necessarily in order). Each request is of form:
 
 \begin{lstlisting}
-- 
2.16.5


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

