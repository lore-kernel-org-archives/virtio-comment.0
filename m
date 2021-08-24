Return-Path: <sgarzare@redhat.com>
Date: Tue, 24 Aug 2021 11:35:08 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH v8 2/2] virtio-vsock: SOCK_SEQPACKET description
Message-ID: <20210824093508.6q5bq7necic6ovwf@steredhat>
References: <20210816085528.4175303-1-arseny.krasnov@kaspersky.com>
 <20210816085617.4175597-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210816085617.4175597-1-arseny.krasnov@kaspersky.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Andra Paraschiv <andraprs@amazon.com>, Colin Ian King <colin.king@canonical.com>, Norbert Slusarek <nslusarek@gmx.net>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Aug 16, 2021 at 11:56:13AM +0300, Arseny Krasnov wrote:
>This adds description of SOCK_SEQPACKET socket type
>support for virtio-vsock.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> virtio-vsock.tex | 43 ++++++++++++++++++++++++++++++++++++++-----
> 1 file changed, 38 insertions(+), 5 deletions(-)
>
>diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>index ad57f9d..51d785a 100644
>--- a/virtio-vsock.tex
>+++ b/virtio-vsock.tex
>@@ -16,7 +16,10 @@ \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
>
> \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>
>-There are currently no feature bits defined for this device.
>+\begin{description}
>+\item VIRTIO_VSOCK_F_SEQPACKET (1) SOCK_SEQPACKET socket type is
>+    supported.
>+\end{description}
>
> \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>
>@@ -135,15 +138,17 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> consists of a (cid, port number) tuple. The header fields used for this are
> \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>
>-Currently only stream sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
>-for stream socket types.
>+Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
>+for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
>
> \begin{lstlisting}
>-#define VIRTIO_VSOCK_TYPE_STREAM 1
>+#define VIRTIO_VSOCK_TYPE_STREAM    1
>+#define VIRTIO_VSOCK_TYPE_SEQPACKET 2
> \end{lstlisting}
>
> Stream sockets provide in-order, guaranteed, connection-oriented delivery
>-without message boundaries.
>+without message boundaries. Seqpacket sockets provide in-order, 
>guaranteed,
>+connection-oriented delivery with message and record boundaries.
>
> \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
> \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
>@@ -244,6 +249,34 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
> destination) address tuple for a new connection while the other peer is still
> processing the old connection.
>
>+\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets}
>+
>+\paragraph{Message and record boundaries}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets / Boundaries}
>+Two types of boundaries supported: message and record boundaries.
>+
>+Message is data, sent by single system call. Message boundary means
   ^
Could be "A message contains data sent by a single system call"

>+that data of single send system call is guaranteed to be read wholly by single
>+receive system call. If receive buffer is not enough, then out of size data
>+will be dropped.
>+
>+Record is any number of subsequent messages, where last message is sent with POSIX
>+MSG_EOR flag set. Record boundary means that receiver gets MSG_EOR flag set
>+in the corresponding message where sender set it.
>+
>+To provide message boundaries, last RW packet of each message has VIRTIO_VSOCK_SEQ_EOM
>+bit (bit 0) set in the \field{flags} of packet's header.
>+
>+\begin{lstlisting}
>+#define VIRTIO_VSOCK_SEQ_EOM 1
>+\end{lstlisting}
>+
>+To provide record boundaries, last RW packet of each record has VIRTIO_VSOCK_SEQ_EOR
>+bit (bit 1) set in the \field{flags} of packet's header.
>+
>+\begin{lstlisting}
>+#define VIRTIO_VSOCK_SEQ_EOR 2
>+\end{lstlisting}
>+

For other flags in the specs we use the shift operator, which is 
actually clearer to understand which bit is set, so I guess we could use 
it here too:

#define VIRTIO_VSOCK_SEQ_EOM (1 << 0)
#define VIRTIO_VSOCK_SEQ_EOR (1 << 1)

The rest LGTM.

Thanks,
Stefano

