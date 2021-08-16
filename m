Return-Path: <arseny.krasnov@kaspersky.com>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: [RFC PATCH v8 1/2] virtio-vsock: use C style defines for constants
Date: Mon, 16 Aug 2021 11:55:57 +0300
Message-ID: <20210816085601.4175478-1-arseny.krasnov@kaspersky.com>
In-Reply-To: <20210816085528.4175303-1-arseny.krasnov@kaspersky.com>
References: <20210816085528.4175303-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Arseny Krasnov <arseny.krasnov@kaspersky.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Andra Paraschiv <andraprs@amazon.com>
Cc: virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

This:
1) Replaces enums with C style "defines", because
   use of enums is not documented, while "defines"
   are widely used in spec.
2) Adds defines for some constants.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
---
 virtio-vsock.tex | 54 +++++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index da7e641..ad57f9d 100644
--- a/virtio-vsock.tex
+++ b/virtio-vsock.tex
@@ -86,23 +86,18 @@ \subsection{Device Operation}\label{sec:Device Types / =
Socket Device / Device Op
 operation constants:
=20
 \begin{lstlisting}
-enum {
-=09VIRTIO_VSOCK_OP_INVALID =3D 0,
-
-=09/* Connect operations */
-=09VIRTIO_VSOCK_OP_REQUEST =3D 1,
-=09VIRTIO_VSOCK_OP_RESPONSE =3D 2,
-=09VIRTIO_VSOCK_OP_RST =3D 3,
-=09VIRTIO_VSOCK_OP_SHUTDOWN =3D 4,
-
-=09/* To send payload */
-=09VIRTIO_VSOCK_OP_RW =3D 5,
-
-=09/* Tell the peer our credit info */
-=09VIRTIO_VSOCK_OP_CREDIT_UPDATE =3D 6,
-=09/* Request the peer to send the credit info to us */
-=09VIRTIO_VSOCK_OP_CREDIT_REQUEST =3D 7,
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
=20
 \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket Dev=
ice / Device Operation / Virtqueue Flow Control}
@@ -140,8 +135,12 @@ \subsubsection{Addressing}\label{sec:Device Types / So=
cket Device / Device Opera
 consists of a (cid, port number) tuple. The header fields used for this ar=
e
 \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
=20
-Currently only stream sockets are supported. \field{type} is 1 for stream
-socket types.
+Currently only stream sockets are supported. \field{type} is 1 (VIRTIO_VSO=
CK_TYPE_STREAM)
+for stream socket types.
+
+\begin{lstlisting}
+#define VIRTIO_VSOCK_TYPE_STREAM 1
+\end{lstlisting}
=20
 Stream sockets provide in-order, guaranteed, connection-oriented delivery
 without message boundaries.
@@ -222,10 +221,15 @@ \subsubsection{Stream Sockets}\label{sec:Device Types=
 / Socket Device / Device O
 insufficient resources to establish the connection.
=20
 When a connected socket receives VIRTIO_VSOCK_OP_SHUTDOWN the header
-\field{flags} field bit 0 indicates that the peer will not receive any mor=
e
-data and bit 1 indicates that the peer will not send any more data.  These
-hints are permanent once sent and successive packets with bits clear do no=
t
-reset them.
+\field{flags} field bit VIRTIO_VSOCK_SHUTDOWN_F_RECEIVE (bit 0) set indica=
tes
+that the peer will not receive any more data and bit VIRTIO_VSOCK_SHUTDOWN=
_F_SEND
+(bit 1) set indicates that the peer will not send any more data.  These hi=
nts are
+permanent once sent and successive packets with bits clear do not reset th=
em.
+
+\begin{lstlisting}
+#define VIRTIO_VSOCK_SHUTDOWN_F_RECEIVE 0
+#define VIRTIO_VSOCK_SHUTDOWN_F_SEND    1
+\end{lstlisting}
=20
 The VIRTIO_VSOCK_OP_RST packet aborts the connection process or forcibly
 disconnects a connected socket.
@@ -248,9 +252,7 @@ \subsubsection{Device Events}\label{sec:Device Types / =
Socket Device / Device Op
 The event buffer is as follows:
=20
 \begin{lstlisting}
-enum virtio_vsock_event_id {
-        VIRTIO_VSOCK_EVENT_TRANSPORT_RESET =3D 0,
-};
+#define VIRTIO_VSOCK_EVENT_TRANSPORT_RESET 0
=20
 struct virtio_vsock_event {
         le32 id;
--=20
2.25.1

