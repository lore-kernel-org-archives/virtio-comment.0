Return-Path: virtio-comment-return-1785-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 792959860FC
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Mar 2021 15:48:55 +0000 (UTC)
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Date: Tue, 23 Mar 2021 18:48:36 +0300
Message-ID: <20210323154840.2504509-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH v4] virtio-vsock: use C style defines for constants
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, Colin Ian King <colin.king@canonical.com>, Jeff Vander Stoep <jeffv@google.com>, Alexander Popov <alex.popov@linux.com>
Cc: virtualization@lists.linux-foundation.org, arseny.krasnov@kaspersky.com, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

This:
1) Replaces enums with C style "defines", because
   use of enums is not documented, while "defines"
   are widely used in spec.
2) Adds defines for some constants.

Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

