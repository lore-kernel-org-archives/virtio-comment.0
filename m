Return-Path: <arseny.krasnov@kaspersky.com>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: [RFC PATCH v8 2/2] virtio-vsock: SOCK_SEQPACKET description
Date: Mon, 16 Aug 2021 11:56:13 +0300
Message-ID: <20210816085617.4175597-1-arseny.krasnov@kaspersky.com>
In-Reply-To: <20210816085528.4175303-1-arseny.krasnov@kaspersky.com>
References: <20210816085528.4175303-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Arseny Krasnov <arseny.krasnov@kaspersky.com>, Andra Paraschiv <andraprs@amazon.com>, Colin Ian King <colin.king@canonical.com>, Norbert Slusarek <nslusarek@gmx.net>
Cc: virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

This adds description of SOCK_SEQPACKET socket type
support for virtio-vsock.

Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
---
 virtio-vsock.tex | 43 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index ad57f9d..51d785a 100644
--- a/virtio-vsock.tex
+++ b/virtio-vsock.tex
@@ -16,7 +16,10 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket =
Device / Virtqueues}
=20
 \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature=
 bits}
=20
-There are currently no feature bits defined for this device.
+\begin{description}
+\item VIRTIO_VSOCK_F_SEQPACKET (1) SOCK_SEQPACKET socket type is
+    supported.
+\end{description}
=20
 \subsection{Device configuration layout}\label{sec:Device Types / Socket D=
evice / Device configuration layout}
=20
@@ -135,15 +138,17 @@ \subsubsection{Addressing}\label{sec:Device Types / S=
ocket Device / Device Opera
 consists of a (cid, port number) tuple. The header fields used for this ar=
e
 \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
=20
-Currently only stream sockets are supported. \field{type} is 1 (VIRTIO_VSO=
CK_TYPE_STREAM)
-for stream socket types.
+Currently stream and seqpacket sockets are supported. \field{type} is 1 (V=
IRTIO_VSOCK_TYPE_STREAM)
+for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket=
 socket types.
=20
 \begin{lstlisting}
-#define VIRTIO_VSOCK_TYPE_STREAM 1
+#define VIRTIO_VSOCK_TYPE_STREAM    1
+#define VIRTIO_VSOCK_TYPE_SEQPACKET 2
 \end{lstlisting}
=20
 Stream sockets provide in-order, guaranteed, connection-oriented delivery
-without message boundaries.
+without message boundaries. Seqpacket sockets provide in-order, guaranteed=
,
+connection-oriented delivery with message and record boundaries.
=20
 \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket De=
vice / Device Operation / Buffer Space Management}
 \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management=
 of
@@ -244,6 +249,34 @@ \subsubsection{Stream Sockets}\label{sec:Device Types =
/ Socket Device / Device O
 destination) address tuple for a new connection while the other peer is st=
ill
 processing the old connection.
=20
+\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device /=
 Device Operation / Seqpacket Sockets}
+
+\paragraph{Message and record boundaries}\label{sec:Device Types / Socket =
Device / Device Operation / Seqpacket Sockets / Boundaries}
+Two types of boundaries supported: message and record boundaries.
+
+Message is data, sent by single system call. Message boundary means
+that data of single send system call is guaranteed to be read wholly by si=
ngle
+receive system call. If receive buffer is not enough, then out of size dat=
a
+will be dropped.
+
+Record is any number of subsequent messages, where last message is sent wi=
th POSIX
+MSG_EOR flag set. Record boundary means that receiver gets MSG_EOR flag se=
t
+in the corresponding message where sender set it.
+
+To provide message boundaries, last RW packet of each message has VIRTIO_V=
SOCK_SEQ_EOM
+bit (bit 0) set in the \field{flags} of packet's header.
+
+\begin{lstlisting}
+#define VIRTIO_VSOCK_SEQ_EOM 1
+\end{lstlisting}
+
+To provide record boundaries, last RW packet of each record has VIRTIO_VSO=
CK_SEQ_EOR
+bit (bit 1) set in the \field{flags} of packet's header.
+
+\begin{lstlisting}
+#define VIRTIO_VSOCK_SEQ_EOR 2
+\end{lstlisting}
+
 \subsubsection{Device Events}\label{sec:Device Types / Socket Device / Dev=
ice Operation / Device Events}
=20
 Certain events are communicated by the device to the driver using the even=
t
--=20
2.25.1

