Return-Path: virtio-comment-return-1728-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9FEE79860A8
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 Feb 2021 09:32:10 +0000 (UTC)
Date: Wed, 24 Feb 2021 10:32:00 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20210224093200.tpflaqgoap4fe5ax@steredhat>
References: <20210218060715.1075547-1-arseny.krasnov@kaspersky.com>
 <20210218060827.1075863-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210218060827.1075863-1-arseny.krasnov@kaspersky.com>
Subject: Re: [virtio-comment] [RFC PATCH v1 1/1] virtio-vsock: add
 SOCK_SEQPACKET description
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Andra Paraschiv <andraprs@amazon.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Feb 18, 2021 at 09:08:23AM +0300, Arseny Krasnov wrote:
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> virtio-vsock.tex | 40 +++++++++++++++++++++++++++++++++++++---
> 1 file changed, 37 insertions(+), 3 deletions(-)
>
>diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>index da7e641..1ee8f99 100644
>--- a/virtio-vsock.tex
>+++ b/virtio-vsock.tex
>@@ -102,6 +102,11 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
> 	VIRTIO_VSOCK_OP_CREDIT_UPDATE = 6,
> 	/* Request the peer to send the credit info to us */
> 	VIRTIO_VSOCK_OP_CREDIT_REQUEST = 7,
>+
>+	/* Message begin for SOCK_SEQPACKET */
>+	VIRTIO_VSOCK_OP_SEQ_BEGIN = 8,
>+	/* Message end for SOCK_SEQPACKET */
>+	VIRTIO_VSOCK_OP_SEQ_END = 9,
> };
> \end{lstlisting}
>
>@@ -140,11 +145,11 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> consists of a (cid, port number) tuple. The header fields used for this are
> \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>
>-Currently only stream sockets are supported. \field{type} is 1 for stream
>-socket types.
>+Currently stream and seqpacket sockets are supported. \field{type} is 1 for
>+stream socket types. \field{type} is 2 for seqpacket socket types.
>
> Stream sockets provide in-order, guaranteed, connection-oriented delivery
>-without message boundaries.
>+without message boundaries. Seqpacket sockets also provide message boundaries.
>
> \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
> \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
>@@ -240,6 +245,35 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
> destination) address tuple for a new connection while the other peer is still
> processing the old connection.
>
>+\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets}
>+
>+Seqpacket sockets differ from stream sockets only in data transmission way: in
>+stream sockets all data is sent using only VIRTIO_VSOCK_OP_RW packets. In
>+seqpacket sockets, to provide message boundaries, every sequence of
>+VIRTIO_VSOCK_OP_RW packets of each message is headed with
                                              ^
Since this is a spec, I think we should use MUST when something must be 
respected by the peer, for example here we can say "MUST be headed"

>+VIRTIO_VSOCK_OP_SEQ_BEGIN and tailed with VIRTIO_VSOCK_OP_SEQ_END packets.
>+Both VIRTIO_VSOCK_OP_SEQ_BEGIN and VIRTIO_VSOCK_OP_SEQ_END packets carry
                                                                      ^
Same here "MUST carry" and in the rest of the patch.

>+special header in payload:
>+
>+\begin{lstlisting}
>+struct virtio_vsock_seq_hdr {
>+	__le32  msg_cnt;
>+	__le32  msg_len;
>+};
>+\end{lstlisting}
>+
>+\field{msg_cnt} is per socket and incremented by 1 on every send of
>+VIRTIO_VSOCK_OP_SEQ_BEGIN or VIRTIO_VSOCK_OP_SEQ_END. \field{msg_len} contains
>+message length. This header is used to check integrity of each message: message
>+is valid if length of data in VIRTIO_VSOCK_OP_RW packets is equal to
>+\field{msg_len} of prepending VIRTIO_VSOCK_OP_SEQ_BEGIN and \field{msg_cnt} of
>+VIRTIO_VSOCK_OP_SEQ_END differs from \field{msg_cnt} of
>+VIRTIO_VSOCK_OP_SEQ_BEGIN by 1.

If we replace msg_cnt with msg_id, I think we should have the same 
'msg_id' for VIRTIO_VSOCK_OP_SEQ_BEGIN or VIRTIO_VSOCK_OP_SEQ_END. If 
you want to use 'msg_cnt' and you increment it between BEGIN and END, we 
should consider the overflow case.

>+
>+POSIX MSG_EOR flag is supported by special value of \field{flags} in packet's
>+header. If this flag is set for message, then all VIRTIO_VSOCK_OP_RW packets
>+of this message have bit 0 is set to 1 in \field{flags}.

Maybe we need to define what MSG_EOR means.

Thanks,
Stefano

>+
> \subsubsection{Device Events}\label{sec:Device Types / Socket Device / Device Operation / Device Events}
>
> Certain events are communicated by the device to the driver using the event
>-- 
>2.25.1
>
>
>This publicly archived list offers a means to provide input to the
>OASIS Virtual I/O Device (VIRTIO) TC.
>
>In order to verify user consent to the Feedback License terms and
>to minimize spam in the list archive, subscription is required
>before posting.
>
>Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>List help: virtio-comment-help@lists.oasis-open.org
>List archive: https://lists.oasis-open.org/archives/virtio-comment/
>Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>Committee: https://www.oasis-open.org/committees/virtio/
>Join OASIS: https://www.oasis-open.org/join/
>


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

