Return-Path: <virtio-comment-return-2886-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F54F986281
	for <virtio-comment@lists.oasis-open.org>; Mon,  4 Apr 2022 13:50:03 +0000 (UTC)
From: Laura Loghin <lauralg@amazon.com>
Date: Mon, 4 Apr 2022 16:49:31 +0300
Message-ID: <20220404134931.28697-1-lauralg@amazon.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-vsock: add max payload size config field
Content-Type: text/plain
To: virtio-comment@lists.oasis-open.org
Cc: Laura Loghin <lauralg@amazon.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Added a new field to the vsock device config space that
is limiting the size of the packet payload. This way
the driver is not allowed to allocate huge buffers, and
potentially fill up the entire memory.
Also defined a new feature bit for this, VIRTIO_VSOCK_F_SIZE_MAX,
in order to keep backwards compatibility.

Signed-off-by: Laura Loghin <lauralg@amazon.com>
---
 virtio-vsock.tex | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index d79984d..a6950cc 100644
--- a/virtio-vsock.tex
+++ b/virtio-vsock.tex
@@ -23,6 +23,10 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
 \begin{description}
 \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
 \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
+\item[VIRTIO_VSOCK_F_SIZE_MAX (2)] Maximum size of the packet payload is in
+	\field{data_max_size}. If offered by the device, device advises driver
+	about the value of its maximum payload size. If negotiated, the driver uses
+	\field{data_max_size} as the maximum packet payload size value.
 \end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
@@ -32,6 +36,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
 \begin{lstlisting}
 struct virtio_vsock_config {
 	le64 guest_cid;
+	le32 data_max_size;
 };
 \end{lstlisting}
 
@@ -57,6 +62,35 @@ \subsection{Device configuration layout}\label{sec:Device Types / Socket Device
 \hline
 \end{tabular}
 
+The following driver-read-only field, \field{data_max_size} only exists if
+VIRTIO_VSOCK_F_SIZE_MAX is set. This field specifies the maximum packet payload
+size for the driver to use.
+
+\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
+
+The device MUST set \field{data_max_size} to between 0 and 65536 inclusive, if
+it offers VIRTIO_VSOCK_F_SIZE_MAX.
+
+The device MUST NOT modify \field{data_max_size} once it has been set.
+
+The device MUST NOT pass received packets that exceed \field{data_max_size}
+(plus header length) size after VIRTIO_VSOCK_F_SIZE_MAX has been successfully
+negotiated.
+
+The device MUST forward transmitted packets of up to \field{data_max_size}
+(plus header length) size after VIRTIO_VSOCK_F_SIZE_MAX has been successfully
+negotiated.
+
+\drivernormative{\subsubsection}{Device configuration layout}{Device Types / Socket Device / Device configuration layout}
+
+A driver SHOULD negotiate VIRTIO_VSOCK_F_SIZE_MAX if the device offers it.
+
+If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, it MUST supply receive
+buffers that don't exceed the size \field{data_max_size} (plus header length).
+
+If the driver negotiates VIRTIO_VSOCK_F_SIZE_MAX, it MUST  NOT transmit packets
+of size exceeding the value of \field{data_max_size} (plus header length).
+
 \subsection{Device Initialization}\label{sec:Device Types / Socket Device / Device Initialization}
 
 \begin{enumerate}
-- 
2.17.1




Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in Romania. Registration number J22/2621/2005.


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

