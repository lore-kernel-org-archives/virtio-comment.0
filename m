Return-Path: <virtio-comment-return-2187-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B20C19863ED
	for <virtio-comment@lists.oasis-open.org>; Tue, 10 Aug 2021 11:47:31 +0000 (UTC)
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Date: Tue, 10 Aug 2021 14:47:06 +0300
Message-ID: <20210810114710.1216558-1-arseny.krasnov@kaspersky.com>
In-Reply-To: <20210810114616.1216243-1-arseny.krasnov@kaspersky.com>
References: <20210810114616.1216243-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH v7 2/2] virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Arseny Krasnov <arseny.krasnov@kaspersky.com>, Colin Ian King <colin.king@canonical.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>
Cc: virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

This adds description of SOCK_SEQPACKET socket type
support for virtio-vsock.

Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
---
 virtio-vsock.tex | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index ad57f9d..ca76812 100644
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
@@ -244,6 +249,26 @@ \subsubsection{Stream Sockets}\label{sec:Device Types =
/ Socket Device / Device O
 destination) address tuple for a new connection while the other peer is st=
ill
 processing the old connection.
=20
+\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device /=
 Device Operation / Seqpacket Sockets}
+
+\paragraph{Message boundaries}\label{sec:Device Types / Socket Device / De=
vice Operation / Seqpacket Sockets / Message boundaries}
+
+To provide message boundaries, last RW packet of each message has VIRTIO_V=
SOCK_SEQ_EOM
+bit (bit 0) set in the \field{flags} of packet's header.
+
+\begin{lstlisting}
+#define VIRTIO_VSOCK_SEQ_EOM 1
+\end{lstlisting}
+
+\paragraph{Record boundaries}\label{sec:Device Types / Socket Device / Dev=
ice Operation / Seqpacket Sockets / Record boundaries}
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

