Return-Path: <sgarzare@redhat.com>
Date: Wed, 11 Aug 2021 11:29:01 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [virtio-comment] [RFC PATCH v7 2/2] virtio-vsock: SOCK_SEQPACKET
 description
Message-ID: <20210811092901.53lyzvy5nethngo7@steredhat>
References: <20210810114616.1216243-1-arseny.krasnov@kaspersky.com>
 <20210810114710.1216558-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210810114710.1216558-1-arseny.krasnov@kaspersky.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Colin Ian King <colin.king@canonical.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Aug 10, 2021 at 02:47:06PM +0300, Arseny Krasnov wrote:
>This adds description of SOCK_SEQPACKET socket type
>support for virtio-vsock.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> virtio-vsock.tex | 35 ++++++++++++++++++++++++++++++-----
> 1 file changed, 30 insertions(+), 5 deletions(-)
>
>diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>index ad57f9d..ca76812 100644
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
>+without message boundaries. Seqpacket sockets provide in-order, guaranteed,
>+connection-oriented delivery with message and record boundaries.
>
> \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
> \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
>@@ -244,6 +249,26 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
> destination) address tuple for a new connection while the other peer is still
> processing the old connection.
>
>+\subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets}
>+
>+\paragraph{Message boundaries}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets / Message boundaries}
>+
>+To provide message boundaries, last RW packet of each message has VIRTIO_VSOCK_SEQ_EOM
>+bit (bit 0) set in the \field{flags} of packet's header.
>+
>+\begin{lstlisting}
>+#define VIRTIO_VSOCK_SEQ_EOM 1
>+\end{lstlisting}
>+
>+\paragraph{Record boundaries}\label{sec:Device Types / Socket Device / Device Operation / Seqpacket Sockets / Record boundaries}
>+
>+To provide record boundaries, last RW packet of each record has VIRTIO_VSOCK_SEQ_EOR
>+bit (bit 1) set in the \field{flags} of packet's header.
>+
>+\begin{lstlisting}
>+#define VIRTIO_VSOCK_SEQ_EOR 2
>+\end{lstlisting}
>+

Maybe we could have a single section where we talk about the boundaries 
and list the two flags together.

We should also explain what we mean by message boundaries (payload sent 
with a single system call) and record boundaries (payload with MSG_EOR 
flag set).

Thanks,
Stefano

