Return-Path: virtio-comment-return-1866-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C566E9865EB
	for <virtio-comment@lists.oasis-open.org>; Thu, 27 May 2021 13:21:16 +0000 (UTC)
Date: Thu, 27 May 2021 15:21:06 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20210527132106.ovwbecznb6knrhig@steredhat>
References: <20210526175035.1873294-1-jiang.wang@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210526175035.1873294-1-jiang.wang@bytedance.com>
Subject: Re: [virtio-comment] [RFC v3] virtio-vsock: add description for
 datagram type
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Jiang Wang <jiang.wang@bytedance.com>
Cc: mst@redhat.com, cohuck@redhat.com, virtio-comment@lists.oasis-open.org, virtualization@lists.linux-foundation.org, asias@redhat.com, stefanha@redhat.com, arseny.krasnov@kaspersky.com, cong.wang@bytedance.com, duanxiongchun@bytedance.com, xieyongji@bytedance.com, chaiwen.cc@bytedance.com, jhansen@vmware.com
List-ID: <virtio-comment.lists.oasis-open.org>

Re-send my thoughts on this new series...

On Wed, May 26, 2021 at 05:50:35PM +0000, Jiang Wang wrote:
>From: "jiang.wang" <jiang.wang@bytedance.com>
>
>Add supports for datagram type for virtio-vsock. Datagram
>sockets are connectionless and unreliable. To avoid contention
>with stream and other sockets, add two more virtqueues and
>a new feature bit to identify if those two new queues exist or not.
>
>Also add descriptions for resource management of datagram, which
>does not use the existing credit update mechanism associated with
>stream sockets.
>
>Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
>---
>V2: addressed the comments for the previous version.
>V3: add description for the mergeable receive buffer.
>
>btw: send the same patch again to include virtio-comment@
>
> virtio-vsock.tex | 137 +++++++++++++++++++++++++++++++++++++++++++++++++------
> 1 file changed, 124 insertions(+), 13 deletions(-)
>
>diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>index da7e641..7eb3596 100644
>--- a/virtio-vsock.tex
>+++ b/virtio-vsock.tex
>@@ -9,14 +9,36 @@ \subsection{Device ID}\label{sec:Device Types / Socket Device / Device ID}
>
> \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
> \begin{description}
>-\item[0] rx
>-\item[1] tx
>+\item[0] stream rx
>+\item[1] stream tx
>+\item[2] datagram rx
>+\item[3] datagram tx
>+\item[4] event
>+\end{description}
>+The virtio socket device uses 5 queues if feature bit VIRTIO_VSOCK_F_DRGAM is set. Otherwise, it
>+only uses 3 queues, as the following.
>+
>+\begin{description}
>+\item[0] stream rx
>+\item[1] stream tx
> \item[2] event
> \end{description}
>
>+When behavior differs between stream and datagram rx/tx virtqueues
>+their full names are used. Common behavior is simply described in
>+terms of rx/tx virtqueues and applies to both stream and datagram
>+virtqueues.
>+
> \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>
>-There are currently no feature bits defined for this device.
>+\begin{description}
>+\item[VIRTIO_VSOCK_F_DGRAM (0)] Device has support for datagram socket type.
>+\end{description}

As suggested by Michael here [1] we should add also a feature bit for
stream, and maybe is better to reserve bit 0 for it.

Arseny already sent an implementation of SEQPACKET using bit 1 for
VIRTIO_VSOCK_F_SEQPACKET, so I think we can use bit 2 for DGRAM and bit
3 for MRG_RXBUF.

[1]
https://lists.oasis-open.org/archives/virtio-comment/202104/msg00016.html

>+
>+\begin{description}
>+\item[VIRTIO_VSOCK_F_MRG_RXBUF (1)] Driver can merge receive buffers.
>+\end{description}
>+
>
> \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>
>@@ -64,6 +86,8 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>
> Packets transmitted or received contain a header before the payload:
>
>+If feature VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, use the following header.
>+
> \begin{lstlisting}
> struct virtio_vsock_hdr {
> 	le64 src_cid;
>@@ -79,6 +103,15 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
> };
> \end{lstlisting}
>
>+If feature VIRTIO_VSOCK_F_MRG_RXBUF is negotianted, use the following header.
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
>@@ -107,6 +140,9 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>
> \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket Device / Device Operation / Virtqueue Flow Control}
>
>+Flow control applies to stream sockets; datagram sockets do not have
>+flow control.
>+
> The tx virtqueue carries packets initiated by applications and replies to
> received packets.  The rx virtqueue carries packets initiated by the device and
> replies to previously transmitted packets.
>@@ -140,12 +176,15 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> consists of a (cid, port number) tuple. The header fields used for this are
> \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>
>-Currently only stream sockets are supported. \field{type} is 1 for stream
>-socket types.
>+Currently stream and datagram (dgram) sockets are supported. \field{type} is 1 for stream
>+socket types. \field{type} is 3 for dgram socket types.
>
> Stream sockets provide in-order, guaranteed, connection-oriented delivery
> without message boundaries.
>
>+Datagram sockets provide unordered, unreliable, connectionless messages
>+with message boundaries and a maximum length.
>+
> \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
> \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
> stream sockets. The guest and the device publish how much buffer space is
>@@ -162,7 +201,7 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
> u32 peer_free = peer_buf_alloc - (tx_cnt - peer_fwd_cnt);
> \end{lstlisting}
>
>-If there is insufficient buffer space, the sender waits until virtqueue buffers
>+For stream sockets, if there is insufficient buffer space, the sender waits until virtqueue buffers
> are returned and checks \field{buf_alloc} and \field{fwd_cnt} again. Sending
> the VIRTIO_VSOCK_OP_CREDIT_REQUEST packet queries how much buffer space is
> available. The reply to this query is a VIRTIO_VSOCK_OP_CREDIT_UPDATE packet.
>@@ -170,22 +209,52 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
> previously receiving a VIRTIO_VSOCK_OP_CREDIT_REQUEST packet. This allows
> communicating updates any time a change in buffer space occurs.
>
>+Unlike stream sockets, dgram sockets do not use VIRTIO_VSOCK_OP_CREDIT_UPDATE or
>+VIRTIO_VSOCK_OP_CREDIT_REQUEST packets. The dgram buffer management
>+is split to two parts: tx side and rx side. For the tx side, if the
>+virtqueue is full, the packet will be dropped.
>+For the rx side, dgram also uses the \field{buf_alloc}. If it is full, the packet
>+is dropped by the receiver.
>+
>+\drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Setting Up Receive Buffers}
>+\begin{itemize}
>+\item If VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, the driver SHOULD populate the receive queue(s)
>+      with buffers of at least 1526 bytes for stream sockets and 4096 bytes for datagram sockets.
>+\item If VIRTIO_VSOCK_F_MRG_RXBUF is negotiated, each buffer MUST be at
>+least the size of the struct virtio_vsock_hdr.
                                ^
                                Should it be virtio_vsock_hdr_mrg_rxbuf?

>+\end{itemize}
>+
>+\begin{note}
>+Obviously each buffer can be split across multiple descriptor elements.
>+\end{note}
>+
>+\devicenormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Setting Up Receive Buffers}
>+The device MUST set \field{num_buffers} to the number of descriptors used when
>+transmitting the  packet.
>+
>+The device MUST use only a single descriptor if VIRTIO_VSOCK_F_MRG_RXBUF
>+is not negotiated.
>+
> \drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
>-VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
>-sufficient free buffer space for the payload.
>+For stream sockets, VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
>+sufficient free buffer space for the payload. For dgram sockets, VIRTIO_VSOCK_OP_RW data packets
>+MAY be transmitted when the peer rx buffer is full. Then the packet will be dropped by the peer,
>+and driver will not get any notification.
>
> All packets associated with a stream flow MUST contain valid information in
> \field{buf_alloc} and \field{fwd_cnt} fields.
>
> \devicenormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
>-VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
>-sufficient free buffer space for the payload.
>+For stream sockets, VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
>+sufficient free buffer space for the payload. For dgram sockets, VIRTIO_VSOCK_OP_RW data packets
>+MAY be transmitted when the peer rx buffer is full. Then the packet will be dropped by the peer,
>+and the device will not get any notification.
>
> All packets associated with a stream flow MUST contain valid information in
> \field{buf_alloc} and \field{fwd_cnt} fields.
>
> \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / Device Operation / Receive and Transmit}
>-The driver queues outgoing packets on the tx virtqueue and incoming packet
>+The driver queues outgoing packets on the tx virtqueue and allocates incoming packet
> receive buffers on the rx virtqueue. Packets are of the following form:
>
> \begin{lstlisting}
>@@ -198,21 +267,55 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> Virtqueue buffers for outgoing packets are read-only. Virtqueue buffers for
> incoming packets are write-only.
>
>+When transmitting packets to the device, \field{num_buffers} is not used.

Should we add a new `struct virtio_vsock_packet` description used when
VIRTIO_VSOCK_F_MRG_RXBUF is negotiated?


>+
>+\begin{enumerate}
>+\item \field{num_buffers} indicates how many descriptors
>+  this packet is spread over (including this one): this will
>+  always be 1 if VIRTIO_VSOCK_F_MRG_RXBUF was not negotiated.

If VIRTIO_VSOCK_F_MRG_RXBUF was not negotiated, we use only
virtio_vsock_hdr where there isn't `num_buffers`, so it is not clear to
me this statement.

Thanks,
Stefano


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

