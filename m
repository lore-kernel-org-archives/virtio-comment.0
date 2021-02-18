Return-Path: arseny.krasnov@kaspersky.com
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: [RFC PATCH v1 1/1] virtio-vsock: add SOCK_SEQPACKET description
Date: Thu, 18 Feb 2021 08:53:33 +0300
Message-ID: <20210218055337.1072144-1-arseny.krasnov@kaspersky.com>
In-Reply-To: <20210218055211.1071722-1-arseny.krasnov@kaspersky.com>
References: <20210218055211.1071722-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Arseny Krasnov <arseny.krasnov@kaspersky.com>, Jorgen Hansen <jhansen@vmware.com>, Colin Ian King <colin.king@canonical.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>
Cc: virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
---
 virtio-vsock.tex | 40 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index da7e641..1ee8f99 100644
--- a/virtio-vsock.tex
+++ b/virtio-vsock.tex
@@ -102,6 +102,11 @@ \subsection{Device Operation}\label{sec:Device Types /=
 Socket Device / Device Op
 	VIRTIO_VSOCK_OP_CREDIT_UPDATE =3D 6,
 	/* Request the peer to send the credit info to us */
 	VIRTIO_VSOCK_OP_CREDIT_REQUEST =3D 7,
+
+	/* Message begin for SOCK_SEQPACKET */
+	VIRTIO_VSOCK_OP_SEQ_BEGIN =3D 8,
+	/* Message end for SOCK_SEQPACKET */
+	VIRTIO_VSOCK_OP_SEQ_END =3D 9,
 };
 \end{lstlisting}
=20
@@ -140,11 +145,11 @@ \subsubsection{Addressing}\label{sec:Device Types / S=
ocket Device / Device Opera
 consists of a (cid, port number) tuple. The header fields used for this ar=
e
 \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
=20
-Currently only stream sockets are supported. \field{type} is 1 for stream
-socket types.
+Currently stream and seqpacket sockets are supported. \field{type} is 1 fo=
r
+stream socket types. \field{type} is 2 for seqpacket socket types.
=20
 Stream sockets provide in-order, guaranteed, connection-oriented delivery
-without message boundaries.
+without message boundaries. Seqpacket sockets also provide message boundar=
ies.
=20
 \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket De=
vice / Device Operation / Buffer Space Management}
 \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management=
 of
@@ -240,6 +245,35 @@ \subsubsection{Stream Sockets}\label{sec:Device Types =
/ Socket Device / Device O
 destination) address tuple for a new connection while the other peer is st=
ill
 processing the old connection.
=20
+\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device /=
 Device Operation / Seqpacket Sockets}
+
+Seqpacket sockets differ from stream sockets only in data transmission way=
: in
+stream sockets all data is sent using only VIRTIO_VSOCK_OP_RW packets. In
+seqpacket sockets, to provide message boundaries, every sequence of
+VIRTIO_VSOCK_OP_RW packets of each message is headed with
+VIRTIO_VSOCK_OP_SEQ_BEGIN and tailed with VIRTIO_VSOCK_OP_SEQ_END packets.
+Both VIRTIO_VSOCK_OP_SEQ_BEGIN and VIRTIO_VSOCK_OP_SEQ_END packets carry
+special header in payload:
+
+\begin{lstlisting}
+struct virtio_vsock_seq_hdr {
+	__le32  msg_cnt;
+	__le32  msg_len;
+};
+\end{lstlisting}
+
+\field{msg_cnt} is per socket and incremented by 1 on every send of
+VIRTIO_VSOCK_OP_SEQ_BEGIN or VIRTIO_VSOCK_OP_SEQ_END. \field{msg_len} cont=
ains
+message length. This header is used to check integrity of each message: me=
ssage
+is valid if length of data in VIRTIO_VSOCK_OP_RW packets is equal to
+\field{msg_len} of prepending VIRTIO_VSOCK_OP_SEQ_BEGIN and \field{msg_cnt=
} of
+VIRTIO_VSOCK_OP_SEQ_END differs from \field{msg_cnt} of
+VIRTIO_VSOCK_OP_SEQ_BEGIN by 1.
+
+POSIX MSG_EOR flag is supported by special value of \field{flags} in packe=
t's
+header. If this flag is set for message, then all VIRTIO_VSOCK_OP_RW packe=
ts
+of this message have bit 0 is set to 1 in \field{flags}.
+
 \subsubsection{Device Events}\label{sec:Device Types / Socket Device / Dev=
ice Operation / Device Events}
=20
 Certain events are communicated by the device to the driver using the even=
t
--=20
2.25.1

