Return-Path: virtio-comment-return-1738-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 51ECA986101
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 Mar 2021 08:36:27 +0000 (UTC)
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Date: Mon, 15 Mar 2021 11:35:41 +0300
Message-ID: <20210315083547.2283420-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH v1] virtio-vsock: use enums instead of hardcoded constants
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Arseny Krasnov <arseny.krasnov@kaspersky.com>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Andra Paraschiv <andraprs@amazon.com>
Cc: virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

This replaces constants defined in "bit X set to Y" manner
with enums from Linux kernel uapi headers.
---
 virtio-vsock.tex | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index da7e641..a97a81e 100644
--- a/virtio-vsock.tex
+++ b/virtio-vsock.tex
@@ -140,8 +140,14 @@ \subsubsection{Addressing}\label{sec:Device Types / So=
cket Device / Device Opera
 consists of a (cid, port number) tuple. The header fields used for this ar=
e
 \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
=20
-Currently only stream sockets are supported. \field{type} is 1 for stream
-socket types.
+Currently only stream sockets are supported. \field{type} is one of the
+following constants:
+
+\begin{lstlisting}
+enum virtio_vsock_type {
+=09VIRTIO_VSOCK_TYPE_STREAM =3D 1,
+};
+\end{lstlisting}
=20
 Stream sockets provide in-order, guaranteed, connection-oriented delivery
 without message boundaries.
@@ -221,11 +227,20 @@ \subsubsection{Stream Sockets}\label{sec:Device Types=
 / Socket Device / Device O
 a listening socket does not exist on the destination or the destination ha=
s
 insufficient resources to establish the connection.
=20
-When a connected socket receives VIRTIO_VSOCK_OP_SHUTDOWN the header
-\field{flags} field bit 0 indicates that the peer will not receive any mor=
e
-data and bit 1 indicates that the peer will not send any more data.  These
-hints are permanent once sent and successive packets with bits clear do no=
t
-reset them.
+When a connected socket receives VIRTIO_VSOCK_OP_SHUTDOWN, header \field{f=
lags}
+field is one of the following constants:
+
+\begin{lstlisting}
+enum virtio_vsock_shutdown {
+=09VIRTIO_VSOCK_SHUTDOWN_RCV =3D 1,
+=09VIRTIO_VSOCK_SHUTDOWN_SEND =3D 2,
+};
+\end{lstlisting}
+
+VIRTIO_VSOCK_SHUTDOWN_RCV indicates that the peer will not receive any mor=
e
+data and VIRTIO_VSOCK_SHUTDOWN_SEND indicates that the peer will not send
+any more data.  These hints are permanent once sent and successive packets
+with bits clear do not reset them.
=20
 The VIRTIO_VSOCK_OP_RST packet aborts the connection process or forcibly
 disconnects a connected socket.
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

