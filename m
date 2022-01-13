Return-Path: <sgarzare@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v12 3/3] virtio-vsock: SOCK_SEQPACKET description
Date: Thu, 13 Jan 2022 17:52:02 +0100
Message-Id: <20220113165202.250429-4-sgarzare@redhat.com>
In-Reply-To: <20220113165202.250429-1-sgarzare@redhat.com>
References: <20220113165202.250429-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: jasowang@redhat.com, mst@redhat.com, sgarzare@redhat.com, cohuck@redhat.com, stefanha@redhat.com, arseny.krasnov@kaspersky.com
List-ID: <virtio-comment.lists.oasis-open.org>

From: Arseny Krasnov <arseny.krasnov@kaspersky.com>

This adds description of SOCK_SEQPACKET socket type
support for virtio-vsock.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/132
Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
[reworked "Message and record boundaries" paragraph]
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v12:
 - added statement about supporting F_STREAM when F_SEQPACKET is negotiated
   [cohuck, mst]
---
 virtio-vsock.tex | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index 23a1eeb..d79984d 100644
--- a/virtio-vsock.tex
+++ b/virtio-vsock.tex
@@ -17,9 +17,12 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
 \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
 
 If no feature bit is set, only stream socket type is supported.
+If VIRTIO_VSOCK_F_SEQPACKET has been negotiated, the device MAY act
+as if VIRTIO_VSOCK_F_STREAM has also been negotiated.
 
 \begin{description}
 \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
+\item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
 \end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
@@ -139,15 +142,17 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
 consists of a (cid, port number) tuple. The header fields used for this are
 \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
 
-Currently only stream sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
-for stream socket types.
+Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
+for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
 
 \begin{lstlisting}
-#define VIRTIO_VSOCK_TYPE_STREAM 1
+#define VIRTIO_VSOCK_TYPE_STREAM    1
+#define VIRTIO_VSOCK_TYPE_SEQPACKET 2
 \end{lstlisting}
 
 Stream sockets provide in-order, guaranteed, connection-oriented delivery
-without message boundaries.
+without message boundaries. Seqpacket sockets provide in-order, guaranteed,
+connection-oriented delivery with message and record boundaries.
 
 \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
 \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
@@ -248,6 +253,27 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
 destination) address tuple for a new connection while the other peer is still
 processing the old connection.
 
+\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets}
+
+\paragraph{Message and record boundaries}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets / Boundaries}
+Two types of boundaries are supported: message and record boundaries.
+
+A message contains data sent in a single operation. A single message can be
+split into multiple RW packets.
+To provide message boundaries, last RW packet of each message has
+VIRTIO_VSOCK_SEQ_EOM bit (bit 0) set in the \field{flags} of packet's header.
+
+Record is any number of subsequent messages, where last message is sent with POSIX
+MSG_EOR flag set. Record boundary means that receiver gets MSG_EOR flag set
+in the corresponding message where sender set it.
+To provide record boundaries, last RW packet of each record has VIRTIO_VSOCK_SEQ_EOR
+bit (bit 1) set in the \field{flags} of packet's header.
+
+\begin{lstlisting}
+#define VIRTIO_VSOCK_SEQ_EOM (1 << 0)
+#define VIRTIO_VSOCK_SEQ_EOR (1 << 1)
+\end{lstlisting}
+
 \subsubsection{Device Events}\label{sec:Device Types / Socket Device / Device Operation / Device Events}
 
 Certain events are communicated by the device to the driver using the event
-- 
2.31.1

