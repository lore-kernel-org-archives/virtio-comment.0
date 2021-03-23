Return-Path: virtio-comment-return-1784-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 38B649860FA
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Mar 2021 14:11:59 +0000 (UTC)
Date: Tue, 23 Mar 2021 10:11:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20210323100626-mutt-send-email-mst@kernel.org>
References: <20210323131941.2464550-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210323131941.2464550-1-arseny.krasnov@kaspersky.com>
Subject: [virtio-comment] Re: [RFC PATCH v3] virtio-vsock: use C style defines for constants
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Andra Paraschiv <andraprs@amazon.com>, Jeff Vander Stoep <jeffv@google.com>, Alexander Popov <alex.popov@linux.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Mar 23, 2021 at 04:19:37PM +0300, Arseny Krasnov wrote:
> This:
> 1) Replaces enums with C style defines.
> 2) Adds defines for some constants.
> 
> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
> ---
>  virtio-vsock.tex | 54 +++++++++++++++++++++++++-----------------------
>  1 file changed, 28 insertions(+), 26 deletions(-)
> 
> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> index da7e641..5a22051 100644
> --- a/virtio-vsock.tex
> +++ b/virtio-vsock.tex
> @@ -86,23 +86,18 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>  operation constants:
>  
>  \begin{lstlisting}
> -enum {
> -	VIRTIO_VSOCK_OP_INVALID = 0,
> -
> -	/* Connect operations */
> -	VIRTIO_VSOCK_OP_REQUEST = 1,
> -	VIRTIO_VSOCK_OP_RESPONSE = 2,
> -	VIRTIO_VSOCK_OP_RST = 3,
> -	VIRTIO_VSOCK_OP_SHUTDOWN = 4,
> -
> -	/* To send payload */
> -	VIRTIO_VSOCK_OP_RW = 5,
> -
> -	/* Tell the peer our credit info */
> -	VIRTIO_VSOCK_OP_CREDIT_UPDATE = 6,
> -	/* Request the peer to send the credit info to us */
> -	VIRTIO_VSOCK_OP_CREDIT_REQUEST = 7,
> -};
> +#define VIRTIO_VSOCK_OP_INVALID        0
> +/* Connect operations */
> +#define VIRTIO_VSOCK_OP_REQUEST        1
> +#define VIRTIO_VSOCK_OP_RESPONSE       2
> +#define VIRTIO_VSOCK_OP_RST            3
> +#define VIRTIO_VSOCK_OP_SHUTDOWN       4
> +/* To send payload */
> +#define VIRTIO_VSOCK_OP_RW             5
> +/* Tell the peer our credit info */
> +#define VIRTIO_VSOCK_OP_CREDIT_UPDATE  6
> +/* Request the peer to send the credit info to us */
> +#define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
>  \end{lstlisting}
>  
>  \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket Device / Device Operation / Virtqueue Flow Control}
> @@ -140,8 +135,12 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
>  consists of a (cid, port number) tuple. The header fields used for this are
>  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>  
> -Currently only stream sockets are supported. \field{type} is 1 for stream
> -socket types.
> +Currently only stream sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
> +for stream socket types.
> +
> +\begin{lstlisting}
> +#define VIRTIO_VSOCK_TYPE_STREAM 1
> +\end{lstlisting}
>  
>  Stream sockets provide in-order, guaranteed, connection-oriented delivery
>  without message boundaries.
> @@ -222,10 +221,15 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
>  insufficient resources to establish the connection.
>  
>  When a connected socket receives VIRTIO_VSOCK_OP_SHUTDOWN the header
> -\field{flags} field bit 0 indicates that the peer will not receive any more
> -data and bit 1 indicates that the peer will not send any more data.  These
> -hints are permanent once sent and successive packets with bits clear do not
> -reset them.
> +\field{flags} field

> bit VIRTIO_VSOCK_SHUTDOWN_RECEIVE_BIT

some repetition can make things clearer here. E.g.:
VIRTIO_VSOCK_SHUTDOWN_RECEIVE_BIT (bit 0)

also add the word "set".

> indicates that the
> +peer will not receive any more data and bit VIRTIO_VSOCK_SHUTDOWN_SEND_BIT
> +indicates that the peer will not send any more data.  These hints
> are permanent
> +once sent and successive packets with bits clear do not reset them.
> +
> +\begin{lstlisting}
> +#define VIRTIO_VSOCK_SHUTDOWN_RECEIVE_BIT 0
> +#define VIRTIO_VSOCK_SHUTDOWN_SEND_BIT    1

I would call them

#define VIRTIO_VSOCK_SHUTDOWN_F_RECEIVE 0
#define VIRTIO_VSOCK_SHUTDOWN_F_SEND    1

> +\end{lstlisting}
>  
>  The VIRTIO_VSOCK_OP_RST packet aborts the connection process or forcibly
>  disconnects a connected socket.
> @@ -248,9 +252,7 @@ \subsubsection{Device Events}\label{sec:Device Types / Socket Device / Device Op
>  The event buffer is as follows:
>  
>  \begin{lstlisting}
> -enum virtio_vsock_event_id {
> -        VIRTIO_VSOCK_EVENT_TRANSPORT_RESET = 0,
> -};
> +#define VIRTIO_VSOCK_EVENT_TRANSPORT_RESET 0
>  
>  struct virtio_vsock_event {
>          le32 id;
> -- 
> 2.25.1


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

