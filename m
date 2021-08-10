Return-Path: <virtio-comment-return-2188-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 25E859863ED
	for <virtio-comment@lists.oasis-open.org>; Tue, 10 Aug 2021 11:50:41 +0000 (UTC)
References: <20210810114616.1216243-1-arseny.krasnov@kaspersky.com>
 <20210810114710.1216558-1-arseny.krasnov@kaspersky.com>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <25278c77-51a4-57dd-e67f-80c7e45919a6@kaspersky.com>
Date: Tue, 10 Aug 2021 14:50:14 +0300
MIME-Version: 1.0
In-Reply-To: <20210810114710.1216558-1-arseny.krasnov@kaspersky.com>
Subject: [virtio-comment] Re: [RFC PATCH v7 2/2] virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Colin Ian King <colin.king@canonical.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>
Cc: "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Hello, i'm a little bit confused about record boundaries description here:

is it neccessary to describe what is "message", what is "record" and MSG_EOR

bit from POSIX, because this is virtio spec and it is not related with Linux and POSIX

Thank You

On 10.08.2021 14:47, Arseny Krasnov wrote:
> This adds description of SOCK_SEQPACKET socket type
> support for virtio-vsock.
>
> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
> ---
>  virtio-vsock.tex | 35 ++++++++++++++++++++++++++++++-----
>  1 file changed, 30 insertions(+), 5 deletions(-)
>
> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> index ad57f9d..ca76812 100644
> --- a/virtio-vsock.tex
> +++ b/virtio-vsock.tex
> @@ -16,7 +16,10 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
>  
>  \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>  
> -There are currently no feature bits defined for this device.
> +\begin{description}
> +\item VIRTIO_VSOCK_F_SEQPACKET (1) SOCK_SEQPACKET socket type is
> +    supported.
> +\end{description}
>  
>  \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>  
> @@ -135,15 +138,17 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
>  consists of a (cid, port number) tuple. The header fields used for this are
>  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>  
> -Currently only stream sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
> -for stream socket types.
> +Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
> +for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
>  
>  \begin{lstlisting}
> -#define VIRTIO_VSOCK_TYPE_STREAM 1
> +#define VIRTIO_VSOCK_TYPE_STREAM    1
> +#define VIRTIO_VSOCK_TYPE_SEQPACKET 2
>  \end{lstlisting}
>  
>  Stream sockets provide in-order, guaranteed, connection-oriented delivery
> -without message boundaries.
> +without message boundaries. Seqpacket sockets provide in-order, guaranteed,
> +connection-oriented delivery with message and record boundaries.
>  
>  \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
>  \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
> @@ -244,6 +249,26 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
>  destination) address tuple for a new connection while the other peer is still
>  processing the old connection.
>  
> +\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets}
> +
> +\paragraph{Message boundaries}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets / Message boundaries}
> +
> +To provide message boundaries, last RW packet of each message has VIRTIO_VSOCK_SEQ_EOM
> +bit (bit 0) set in the \field{flags} of packet's header.
> +
> +\begin{lstlisting}
> +#define VIRTIO_VSOCK_SEQ_EOM 1
> +\end{lstlisting}
> +
> +\paragraph{Record boundaries}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets / Record boundaries}
> +
> +To provide record boundaries, last RW packet of each record has VIRTIO_VSOCK_SEQ_EOR
> +bit (bit 1) set in the \field{flags} of packet's header.
> +
> +\begin{lstlisting}
> +#define VIRTIO_VSOCK_SEQ_EOR 2
> +\end{lstlisting}
> +
>  \subsubsection{Device Events}\label{sec:Device Types / Socket Device / Device Operation / Device Events}
>  
>  Certain events are communicated by the device to the driver using the event

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

