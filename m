Return-Path: virtio-comment-return-1768-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C6329985E29
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Mar 2021 06:38:18 +0000 (UTC)
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Date: Mon, 22 Mar 2021 09:37:59 +0300
Message-ID: <20210322063804.641923-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH v1] virtio-vsock: use C style defines for constants
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Arseny Krasnov <arseny.krasnov@kaspersky.com>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, Colin Ian King <colin.king@canonical.com>
Cc: virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

This:
1) Replaces enums with C style defines.
2) Adds defines for some constants.

Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
---
 virtio-vsock.tex | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index da7e641..62ab6b3 100644
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
@@ -143,6 +138,10 @@ \subsubsection{Addressing}\label{sec:Device Types / So=
cket Device / Device Opera
 Currently only stream sockets are supported. \field{type} is 1 for stream
 socket types.
=20
+\begin{lstlisting}
+#define VIRTIO_VSOCK_TYPE_STREAM 1
+\end{lstlisting}
+
 Stream sockets provide in-order, guaranteed, connection-oriented delivery
 without message boundaries.
=20
@@ -227,6 +226,11 @@ \subsubsection{Stream Sockets}\label{sec:Device Types =
/ Socket Device / Device O
 hints are permanent once sent and successive packets with bits clear do no=
t
 reset them.
=20
+\begin{lstlisting}
+#define VIRTIO_VSOCK_SHUTDOWN_RECEIVE_BIT 0
+#define VIRTIO_VSOCK_SHUTDOWN_SEND_BIT    1
+\end{lstlisting}
+
 The VIRTIO_VSOCK_OP_RST packet aborts the connection process or forcibly
 disconnects a connected socket.
=20
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

