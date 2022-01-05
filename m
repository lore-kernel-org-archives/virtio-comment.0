Return-Path: <sgarzare@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v10 1/3] virtio-vsock: use C style defines for constants
Date: Wed,  5 Jan 2022 17:35:03 +0100
Message-Id: <20220105163505.192146-2-sgarzare@redhat.com>
In-Reply-To: <20220105163505.192146-1-sgarzare@redhat.com>
References: <20220105163505.192146-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com, stefanha@redhat.com, arseny.krasnov@kaspersky.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

From: Arseny Krasnov <arseny.krasnov@kaspersky.com>

This:
1) Replaces enums with C style "defines", because
   use of enums is not documented, while "defines"
   are widely used in spec.
2) Adds defines for some constants.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 virtio-vsock.tex | 54 +++++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index da7e641..ad57f9d 100644
--- a/virtio-vsock.tex
+++ b/virtio-vsock.tex
@@ -86,23 +86,18 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
 operation constants:
 
 \begin{lstlisting}
-enum {
-	VIRTIO_VSOCK_OP_INVALID = 0,
-
-	/* Connect operations */
-	VIRTIO_VSOCK_OP_REQUEST = 1,
-	VIRTIO_VSOCK_OP_RESPONSE = 2,
-	VIRTIO_VSOCK_OP_RST = 3,
-	VIRTIO_VSOCK_OP_SHUTDOWN = 4,
-
-	/* To send payload */
-	VIRTIO_VSOCK_OP_RW = 5,
-
-	/* Tell the peer our credit info */
-	VIRTIO_VSOCK_OP_CREDIT_UPDATE = 6,
-	/* Request the peer to send the credit info to us */
-	VIRTIO_VSOCK_OP_CREDIT_REQUEST = 7,
-};
+#define VIRTIO_VSOCK_OP_INVALID        0
+/* Connect operations */
+#define VIRTIO_VSOCK_OP_REQUEST        1
+#define VIRTIO_VSOCK_OP_RESPONSE       2
+#define VIRTIO_VSOCK_OP_RST            3
+#define VIRTIO_VSOCK_OP_SHUTDOWN       4
+/* To send payload */
+#define VIRTIO_VSOCK_OP_RW             5
+/* Tell the peer our credit info */
+#define VIRTIO_VSOCK_OP_CREDIT_UPDATE  6
+/* Request the peer to send the credit info to us */
+#define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
 \end{lstlisting}
 
 \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket Device / Device Operation / Virtqueue Flow Control}
@@ -140,8 +135,12 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
 consists of a (cid, port number) tuple. The header fields used for this are
 \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
 
-Currently only stream sockets are supported. \field{type} is 1 for stream
-socket types.
+Currently only stream sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
+for stream socket types.
+
+\begin{lstlisting}
+#define VIRTIO_VSOCK_TYPE_STREAM 1
+\end{lstlisting}
 
 Stream sockets provide in-order, guaranteed, connection-oriented delivery
 without message boundaries.
@@ -222,10 +221,15 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
 insufficient resources to establish the connection.
 
 When a connected socket receives VIRTIO_VSOCK_OP_SHUTDOWN the header
-\field{flags} field bit 0 indicates that the peer will not receive any more
-data and bit 1 indicates that the peer will not send any more data.  These
-hints are permanent once sent and successive packets with bits clear do not
-reset them.
+\field{flags} field bit VIRTIO_VSOCK_SHUTDOWN_F_RECEIVE (bit 0) set indicates
+that the peer will not receive any more data and bit VIRTIO_VSOCK_SHUTDOWN_F_SEND
+(bit 1) set indicates that the peer will not send any more data.  These hints are
+permanent once sent and successive packets with bits clear do not reset them.
+
+\begin{lstlisting}
+#define VIRTIO_VSOCK_SHUTDOWN_F_RECEIVE 0
+#define VIRTIO_VSOCK_SHUTDOWN_F_SEND    1
+\end{lstlisting}
 
 The VIRTIO_VSOCK_OP_RST packet aborts the connection process or forcibly
 disconnects a connected socket.
@@ -248,9 +252,7 @@ \subsubsection{Device Events}\label{sec:Device Types / Socket Device / Device Op
 The event buffer is as follows:
 
 \begin{lstlisting}
-enum virtio_vsock_event_id {
-        VIRTIO_VSOCK_EVENT_TRANSPORT_RESET = 0,
-};
+#define VIRTIO_VSOCK_EVENT_TRANSPORT_RESET 0
 
 struct virtio_vsock_event {
         le32 id;
-- 
2.31.1

