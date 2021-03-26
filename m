Return-Path: virtio-comment-return-1800-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE2829865E0
	for <virtio-comment@lists.oasis-open.org>; Fri, 26 Mar 2021 09:03:01 +0000 (UTC)
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Date: Fri, 26 Mar 2021 12:02:50 +0300
Message-ID: <20210326090254.1144486-1-arseny.krasnov@kaspersky.com>
In-Reply-To: <20210326090154.1144100-1-arseny.krasnov@kaspersky.com>
References: <20210326090154.1144100-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH v4 2/2] virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Andra Paraschiv <andraprs@amazon.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Alexander Popov <alex.popov@linux.com>
Cc: virtualization@lists.linux-foundation.org, arseny.krasnov@kaspersky.com, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

This adds description of SOCK_SEQPACKET socket type
support for virtio-vsock.

Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
---
 virtio-vsock.tex | 65 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 6 deletions(-)

diff --git a/virtio-vsock.tex b/virtio-vsock.tex
index ad57f9d..c366de7 100644
--- a/virtio-vsock.tex
+++ b/virtio-vsock.tex
@@ -17,6 +17,10 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket =
Device / Virtqueues}
 \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature=
 bits}
=20
 There are currently no feature bits defined for this device.
+\begin{description}
+\item VIRTIO_VSOCK_F_SEQPACKET (0) SOCK_SEQPACKET socket type is
+    supported.
+\end{description}
=20
 \subsection{Device configuration layout}\label{sec:Device Types / Socket D=
evice / Device configuration layout}
=20
@@ -98,6 +102,10 @@ \subsection{Device Operation}\label{sec:Device Types / =
Socket Device / Device Op
 #define VIRTIO_VSOCK_OP_CREDIT_UPDATE  6
 /* Request the peer to send the credit info to us */
 #define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
+/* Message begin for SOCK_SEQPACKET */
+#define VIRTIO_VSOCK_OP_SEQ_BEGIN      8
+/* Message end for SOCK_SEQPACKET */
+#define VIRTIO_VSOCK_OP_SEQ_END        9
 \end{lstlisting}
=20
 \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket Dev=
ice / Device Operation / Virtqueue Flow Control}
@@ -135,15 +143,16 @@ \subsubsection{Addressing}\label{sec:Device Types / S=
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
+without message boundaries. Seqpacket sockets also provide message boundar=
ies.
=20
 \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket De=
vice / Device Operation / Buffer Space Management}
 \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management=
 of
@@ -170,8 +179,10 @@ \subsubsection{Buffer Space Management}\label{sec:Devi=
ce Types / Socket Device /
 communicating updates any time a change in buffer space occurs.
=20
 \drivernormative{\paragraph}{Device Operation: Buffer Space Management}{De=
vice Types / Socket Device / Device Operation / Buffer Space Management}
-VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
-sufficient free buffer space for the payload.
+VIRTIO_VSOCK_OP_RW data packets as well as VIRTIO_VSOCK_OP_SEQ_BEGIN and
+VIRTIO_VSOCK_OP_SEQ_END message boundary packets MUST only be
+transmitted when the peer has sufficient free buffer space for the
+payload.
=20
 All packets associated with a stream flow MUST contain valid information i=
n
 \field{buf_alloc} and \field{fwd_cnt} fields.
@@ -244,6 +255,48 @@ \subsubsection{Stream Sockets}\label{sec:Device Types =
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
+Seqpacket sockets differ from stream sockets only in data transmission way=
: in
+stream sockets all data is sent using only VIRTIO_VSOCK_OP_RW packets. In
+seqpacket sockets, to provide message boundaries, every sequence of
+VIRTIO_VSOCK_OP_RW packets of each message MUST be headed with
+VIRTIO_VSOCK_OP_SEQ_BEGIN and tailed with VIRTIO_VSOCK_OP_SEQ_END packets.
+Both VIRTIO_VSOCK_OP_SEQ_BEGIN and VIRTIO_VSOCK_OP_SEQ_END packets MUST ca=
rry
+special structure in payload:
+
+\begin{lstlisting}
+struct virtio_vsock_seq_hdr {
+=09__le32  msg_id;
+=09__le32  msg_len;
+};
+\end{lstlisting}
+
+This data MUST be placed starting from the first byte of payload and no mo=
re
+data is allowed to be beyond it. Also payload of such packet MUST be trans=
mitted
+without fragmentation. \field{len} of packet header MUST be set to the siz=
e of
+the struct virtio_vsock_seq_hdr.
+
+\field{msg_id} is value to identify message. It MUST be same for pair of
+VIRTIO_VSOCK_OP_SEQ_BEGIN and VIRTIO_VSOCK_OP_SEQ_END of one message, and =
MUST
+differ in next messages. \field{msg_len} contains message length. This hea=
der
+is used to check integrity of each message: message is valid if length of =
data
+in VIRTIO_VSOCK_OP_RW packets is equal to \field{msg_len} of prepending
+VIRTIO_VSOCK_OP_SEQ_BEGIN and \field{msg_id} of VIRTIO_VSOCK_OP_SEQ_END is=
 equal
+to \field{msg_id} of VIRTIO_VSOCK_OP_SEQ_BEGIN.
+
+\paragraph{POSIX MSG_EOR flag}\label{sec:Device Types / Socket Device / De=
vice Operation / Seqpacket Sockets / MSG_EOR flag}
+
+When message is sent using one of POSIX functions: send(), sendto() or sen=
dmsg() and
+MSG_EOR flag is set in \field{flags} parameter of these functions, then al=
l VIRTIO_VSOCK_OP_RW
+packets of this message MUST have \field{flags} field in header set to spe=
cial constanst:
+
+\begin{lstlisting}
+#define VIRTIO_VSOCK_RW_EOR 1
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

