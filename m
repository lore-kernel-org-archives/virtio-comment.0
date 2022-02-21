Return-Path: <virtio-comment-return-2760-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 22D3E98635B
	for <virtio-comment@lists.oasis-open.org>; Mon, 21 Feb 2022 16:25:03 +0000 (UTC)
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 21 Feb 2022 17:25:00 +0100
Message-ID: <3784027.ryC8PSGgVn@silver>
In-Reply-To: <2255414.aXzeqRvSCW@silver>
References: <2255414.aXzeqRvSCW@silver>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>

This new feature flag allows to decouple the maximum amount of
descriptors in indirect descriptor tables from the Queue Size.

The new term "Queue Indirect Size" is introduced for this purpose,
which is a bus specific configuration whose negotiation is further
specified with subsequent patches.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 content.tex     | 32 ++++++++++++++++++++++++++++++--
 packed-ring.tex |  2 +-
 split-ring.tex  |  8 ++++++--
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/content.tex b/content.tex
index c6f116c..685525d 100644
--- a/content.tex
+++ b/content.tex
@@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \begin{description}
 \item[0 to 23, and 50 to 127] Feature bits for the specific device type
 
-\item[24 to 40] Feature bits reserved for extensions to the queue and
+\item[24 to 41] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms
 
-\item[41 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
@@ -1051,6 +1051,10 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 present either a value of 0 or a power of 2 in
 \field{queue_size}.
 
+If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the device MUST provide the
+Queue Indirect Size supported by device, which is a transport specific
+configuration. It MUST allow the driver to set a lower value.
+
 \drivernormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
 
 The driver MUST NOT write to \field{device_feature}, \field{num_queues}, \field{config_generation}, \field{queue_notify_off} or \field{queue_notify_data}.
@@ -6847,6 +6851,30 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
   that the driver can reset a queue individually.
   See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}.
 
+  \item[VIRTIO_RING_F_INDIRECT_SIZE(41)] This feature indicates that the
+  Queue Indirect Size, i.e. the maximum amount of descriptors in indirect
+  descriptor tables, is independent from the Queue Size.
+
+  Without this feature, the Queue Size limits the length of the descriptor
+  chain, including indirect descriptor tables as in \ref{sec:Basic Facilities of
+  a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect
+  Descriptors}, i.e. both the maximum amount of slots in the vring and the
+  actual bulk data size transmitted per vring slot.
+
+  With this feature enabled, the Queue Size only limits the maximum amount
+  of slots in the vring, but does not limit the actual bulk data size
+  being transmitted when indirect descriptors are used. Decoupling these
+  two configuration parameters this way not only allows much larger bulk data
+  being transferred per vring slot, but also avoids complicated synchronization
+  mechanisms if the device only supports a very small amount of vring slots. Due
+  to the 16-bit size of a descriptor's "next" field there is still an absolute
+  limit of $2^{16}$ descriptors per indirect descriptor table. However the
+  actual maximum amount supported by either device or driver might be less,
+  and therefore the bus specific Queue Indirect Size value MUST additionally
+  be negotiated if VIRTIO_RING_F_INDIRECT_SIZE was negotiated to subsequently
+  negotiate the actual amount of maximum indirect descriptors supported
+  by both sides.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
diff --git a/packed-ring.tex b/packed-ring.tex
index a9e6c16..e26d112 100644
--- a/packed-ring.tex
+++ b/packed-ring.tex
@@ -195,7 +195,7 @@ \subsection{Scatter-Gather Support}
 The device limits the number of descriptors in a list through a
 transport-specific and/or device-specific value. If not limited,
 the maximum number of descriptors in a list is the virt queue
-size.
+size unless the VIRTIO_RING_F_INDIRECT_SIZE feature has been negotiated.
 
 \subsection{Next Flag: Descriptor Chaining}
 \label{sec:Packed Virtqueues / Next Flag: Descriptor Chaining}
diff --git a/split-ring.tex b/split-ring.tex
index de94038..eaa90c3 100644
--- a/split-ring.tex
+++ b/split-ring.tex
@@ -268,8 +268,12 @@ \subsubsection{Indirect Descriptors}\label{sec:Basic Facilities of a Virtio Devi
 set the VIRTQ_DESC_F_INDIRECT flag within an indirect descriptor (ie. only
 one table per descriptor).
 
-A driver MUST NOT create a descriptor chain longer than the Queue Size of
-the device.
+If VIRTIO_RING_F_INDIRECT_SIZE has not been negotiated, the driver MUST
+NOT create a descriptor chain longer than the Queue Size of the device.
+
+If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the number of
+descriptors per indirect descriptor table MUST NOT exceed the negotiated
+Queue Indirect Size.
 
 A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEXT
 in \field{flags}.
-- 
2.30.2





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

