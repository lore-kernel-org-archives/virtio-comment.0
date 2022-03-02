Return-Path: <sgarzare@redhat.com>
Date: Wed, 2 Mar 2022 17:19:40 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [virtio-comment] [PATCH v5 2/2] virtio-vsock: add mergeable
 buffer feature bit
Message-ID: <20220302161940.j76b6n3q6law2i22@sgarzare-redhat>
References: <20210528040118.3253836-1-jiang.wang@bytedance.com>
 <20220224221547.2436395-1-beshleman.devbox@gmail.com>
 <20220224221547.2436395-3-beshleman.devbox@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220224221547.2436395-3-beshleman.devbox@gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: beshleman.devbox@gmail.com
Cc: mst@redhat.com, cohuck@redhat.com, virtio-comment@lists.oasis-open.org, cong.wang@bytedance.com, duanxiongchun@bytedance.com, jiang.wang@bytedance.com, virtualization@lists.linux-foundation.org, xieyongji@bytedance.com, chaiwen.cc@bytedance.com, stefanha@redhat.com, asias@redhat.com, arseny.krasnov@kaspersky.com, jhansen@vmware.com, bobby.eshleman@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Feb 24, 2022 at 10:15:47PM +0000, beshleman.devbox@gmail.com wrote:
>From: Jiang Wang <jiang.wang@bytedance.com>
>
>Add support for mergeable buffers for virtio-vsock. Mergeable buffers
>allow individual large packets to be spread across multiple buffers
>while still using only a single packet header. This avoids
>artificially restraining packet size to the size of a single
>buffer and offers a performant fragmentation/defragmentation
>scheme.

We need this new functionality because we want to fragment a datagram 
packet over multiple buffers, right?

This reminded me that we don't have a maximum size for now, in this case 
what would it be?

Maybe it would be helpful to define it as Laura is planning to do here:
https://lists.oasis-open.org/archives/virtio-comment/202202/msg00053.html

>
>Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
>Signed-off-by: Bobby Eshleman <bobby.eshleman@bytedance.com>
>---
> virtio-vsock.tex | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 76 insertions(+)
>
>diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>index 1a66a1b..bf44d5d 100644
>--- a/virtio-vsock.tex
>+++ b/virtio-vsock.tex
>@@ -39,6 +39,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> \item[VIRTIO_VSOCK_F_DGRAM (2)] datagram socket type is supported.
>+\item[VIRTIO_VSOCK_F_MRG_RXBUF (3)] driver can merge receive buffers.
> \end{description}
>
> \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>@@ -87,6 +88,8 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>
> Packets transmitted or received contain a header before the payload:
>
>+If feature VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, use the following header.
>+
> \begin{lstlisting}
> struct virtio_vsock_hdr {
> 	le64 src_cid;
>@@ -102,6 +105,15 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
> };
> \end{lstlisting}
>
>+If feature VIRTIO_VSOCK_F_MRG_RXBUF is negotiated, use the following header.
>+\begin{lstlisting}
>+struct virtio_vsock_hdr_mrg_rxbuf {
>+	struct virtio_vsock_hdr hdr;
>+	le16 num_buffers;
>+};
>+\end{lstlisting}
>+
>+
> The upper 32 bits of src_cid and dst_cid are reserved and zeroed.
>
> Most packets simply transfer data but control packets are also used for
>@@ -207,6 +219,25 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
> virtqueue is full. For receivers, the packet is dropped if there is no space
> in the receive buffer.
>
>+\drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Setting Up Receive Buffers}
>+\begin{itemize}
>+\item If VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, the driver SHOULD populate the datagram rx queue
>+      with buffers of at least 4096 bytes.
>+\item If VIRTIO_VSOCK_F_MRG_RXBUF is negotiated, each buffer MUST be at
>+      least the size of the struct virtio_vsock_hdr_mgr_rxbuf.
>+\end{itemize}
>+
>+\begin{note}
>+Each buffer may be split across multiple descriptor elements.
>+\end{note}
>+
>+\devicenormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Setting Up Receive Buffers}
>+The device MUST set \field{num_buffers} to the number of descriptors used when
>+transmitting the packet.
>+
>+The device MUST use only a single descriptor if VIRTIO_VSOCK_F_MRG_RXBUF
>+is not negotiated.
>+
> \drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
> For stream sockets, VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> sufficient free buffer space for the payload. For dgram sockets, VIRTIO_VSOCK_OP_RW data packets
>@@ -229,6 +260,7 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> The driver queues outgoing packets on the tx virtqueue and allocates incoming packet
> receive buffers on the rx virtqueue. Packets are of the following form:
>
>+If VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, use the following.
> \begin{lstlisting}
> struct virtio_vsock_packet {
>     struct virtio_vsock_hdr hdr;
>@@ -236,11 +268,42 @@ \subsubsection{Receive and 
>Transmit}\label{sec:Device Types / Socket Device / De
> };
> \end{lstlisting}
>
>+If VIRTIO_VSOCK_F_MRG_RXBUF is negotiated, use the following form:
>+\begin{lstlisting}
>+struct virtio_vsock_packet_mrg_rxbuf {
>+    struct virtio_vsock_hdr_mrg_rxbuf hdr;
>+    u8 data[];
>+};
>+\end{lstlisting}
>+
>+
> Virtqueue buffers for outgoing packets are read-only. Virtqueue buffers for
> incoming packets are write-only.
>
> When transmitting packets to the device, \field{num_buffers} is not used.
>
>+\begin{enumerate}
>+\item \field{num_buffers} indicates how many descriptors
>+  this packet is spread over (including this one).
>+  This is valid only if VIRTIO_VSOCK_F_MRG_RXBUF is negotiated.
>+  This allows receipt of large packets without having to allocate large
>+  buffers: a packet that does not fit in a single buffer can flow
>+  over to the next buffer, and so on. In this case, there will be
>+  at least \field{num_buffers} used buffers in the virtqueue, and the device
>+  chains them together to form a single packet in a way similar to
>+  how it would store it in a single buffer spread over multiple
>+  descriptors.
>+  The other buffers will not begin with a struct virtio_vsock_hdr.
>+
>+  If VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, then only one
>+  descriptor is used.
>+
>+\item If
>+  \field{num_buffers} is one, then the entire packet will be
>+  contained within this buffer, immediately following the struct
>+  virtio_vsock_hdr.
     ^
Should it be virtio_vsock_hdr_mrg_rxbuf?

>+\end{enumerate}
>+
> \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
>
> The \field{guest_cid} configuration field MUST be used as the source CID when
>@@ -256,6 +319,19 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> unknown \field{type} value.
>
>+If VIRTIO_VSOCK_F_MRG_RXBUF has been negotiated, the device MUST set
>+\field{num_buffers} to indicate the number of buffers
>+the packet (including the header) is spread over.
>+
>+If a receive packet is spread over multiple buffers, the device
>+MUST use all buffers but the last (i.e. the first $\field{num_buffers} -
>+1$ buffers) completely up to the full length of each buffer
>+supplied by the driver.
>+
>+The device MUST use all buffers used by a single receive
>+packet together, such that at least \field{num_buffers} are
>+observed by driver as used.
>+
> \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device Operation / Stream Sockets}
>
> Connections are established by sending a VIRTIO_VSOCK_OP_REQUEST packet. If a
>-- 
>2.11.0
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

