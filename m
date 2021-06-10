Return-Path: virtio-comment-return-1899-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DFBE898663F
	for <virtio-comment@lists.oasis-open.org>; Thu, 10 Jun 2021 18:39:47 +0000 (UTC)
From: Jiang Wang <jiang.wang@bytedance.com>
Date: Thu, 10 Jun 2021 18:39:35 +0000
Message-Id: <20210610183935.1000999-1-jiang.wang@bytedance.com>
Subject: [virtio-comment] [RFC PATCH v1] vsock: add mergeable rx buffer description
Content-Type: text/plain; charset="US-ASCII"
To: mst@redhat.com, cohuck@redhat.com, virtio-comment@lists.oasis-open.org
Cc: virtualization@lists.linux-foundation.org, asias@redhat.com, stefanha@redhat.com, sgarzare@redhat.com, arseny.krasnov@kaspersky.com, cong.wang@bytedance.com, duanxiongchun@bytedance.com, xieyongji@bytedance.com, chaiwen.cc@bytedance.com, jasowang@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

Mergeable rx buffer is already supported by virtio-net, and
it can save memory for big packets. It will also be beneficial
for the vsock devices, so add it to the spec.

---
V0 -> V1: I send similar patch with vsock dgram before and 
already got some comments. This version fixed those,such as
use present tense for feature bit etc. Also the feature bit
value is 3, because we expect to have some other featue bits
defined soon.

 virtio-vsock.tex | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index da7e641..d529291 100644
--- a/virtio-vsock.tex
+++ b/virtio-vsock.tex
@@ -16,7 +16,9 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
 
 \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
 
-There are currently no feature bits defined for this device.
+\begin{description}
+\item[VIRTIO_VSOCK_F_MRG_RXBUF (3)] Driver can merge receive buffers.
+\end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
 
@@ -64,6 +66,8 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
 
 Packets transmitted or received contain a header before the payload:
 
+If feature VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, use the following header.
+
 \begin{lstlisting}
 struct virtio_vsock_hdr {
 	le64 src_cid;
@@ -79,6 +83,15 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
 };
 \end{lstlisting}
 
+If feature VIRTIO_VSOCK_F_MRG_RXBUF is negotiated, use the following header.
+\begin{lstlisting}
+struct virtio_vsock_hdr_mrg_rxbuf {
+	struct virtio_vsock_hdr hdr;
+	le16 num_buffers;
+};
+\end{lstlisting}
+
+
 The upper 32 bits of src_cid and dst_cid are reserved and zeroed.
 
 Most packets simply transfer data but control packets are also used for
@@ -170,6 +183,23 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
 previously receiving a VIRTIO_VSOCK_OP_CREDIT_REQUEST packet. This allows
 communicating updates any time a change in buffer space occurs.
 
+\drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Setting Up Receive Buffers}
+\begin{itemize}
+\item If VIRTIO_VSOCK_F_MRG_RXBUF is negotiated, each buffer MUST be at
+least the size of the struct virtio_vsock_hdr_mgr_rxbuf.
+\end{itemize}
+
+\begin{note}
+Obviously each buffer can be split across multiple descriptor elements.
+\end{note}
+
+\devicenormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Setting Up Receive Buffers}
+The device MUST set \field{num_buffers} to the number of descriptors used when
+transmitting the  packet.
+
+The device MUST use only a single descriptor if VIRTIO_VSOCK_F_MRG_RXBUF
+is not negotiated.
+
 \drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
 VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
 sufficient free buffer space for the payload.
@@ -188,6 +218,7 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
 The driver queues outgoing packets on the tx virtqueue and incoming packet
 receive buffers on the rx virtqueue. Packets are of the following form:
 
+If VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, use the following.
 \begin{lstlisting}
 struct virtio_vsock_packet {
     struct virtio_vsock_hdr hdr;
@@ -195,9 +226,41 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
 };
 \end{lstlisting}
 
+Otherwise, use the following form:
+\begin{lstlisting}
+struct virtio_vsock_packet_mrg_rxbuf {
+    struct virtio_vsock_hdr_mrg_rxbuf hdr;
+    u8 data[];
+};
+\end{lstlisting}
+
 Virtqueue buffers for outgoing packets are read-only. Virtqueue buffers for
 incoming packets are write-only.
 
+When transmitting packets to the device, \field{num_buffers} is not used.
+
+\begin{enumerate}
+\item \field{num_buffers} indicates how many descriptors
+  this packet is spread over (including this one). 
+  This is valid only if VIRTIO_VSOCK_F_MRG_RXBUF is negotiated.
+  This allows receipt of large packets without having to allocate large
+  buffers: a packet that does not fit in a single buffer can flow
+  over to the next buffer, and so on. In this case, there will be
+  at least \field{num_buffers} used buffers in the virtqueue, and the device
+  chains them together to form a single packet in a way similar to
+  how it would store it in a single buffer spread over multiple
+  descriptors.
+  The other buffers will not begin with a struct virtio_vsock_hdr.
+
+  If VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, then only one
+  descriptor is used.
+
+\item If
+  \field{num_buffers} is one, then the entire packet will be
+  contained within this buffer, immediately following the struct
+  virtio_vsock_hdr.
+\end{enumerate}
+
 \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
 
 The \field{guest_cid} configuration field MUST be used as the source CID when
@@ -213,6 +276,19 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
 A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
 unknown \field{type} value.
 
+If VIRTIO_VSOCK_F_MRG_RXBUF has been negotiated, the device MUST set
+\field{num_buffers} to indicate the number of buffers
+the packet (including the header) is spread over.
+
+If a receive packet is spread over multiple buffers, the device
+MUST use all buffers but the last (i.e. the first $\field{num_buffers} -
+1$ buffers) completely up to the full length of each buffer
+supplied by the driver.
+
+The device MUST use all buffers used by a single receive
+packet together, such that at least \field{num_buffers} are
+observed by driver as used.
+
 \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device Operation / Stream Sockets}
 
 Connections are established by sending a VIRTIO_VSOCK_OP_REQUEST packet. If a
-- 
2.11.0


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

