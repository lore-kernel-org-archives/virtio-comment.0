Return-Path: virtio-comment-return-1888-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 416BF986362
	for <virtio-comment@lists.oasis-open.org>; Mon,  7 Jun 2021 18:45:36 +0000 (UTC)
MIME-Version: 1.0
References: <20210528040118.3253836-1-jiang.wang@bytedance.com>
In-Reply-To: <20210528040118.3253836-1-jiang.wang@bytedance.com>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Mon, 7 Jun 2021 11:45:23 -0700
Message-ID: <CAP_N_Z849fcA7cTmyYMz2D2wb-0kBC4P27V=vBjQkNNF3Ji27w@mail.gmail.com>
Subject: [virtio-comment] Re: [RFC v4] virtio-vsock: add description for datagram type
Content-Type: text/plain; charset="UTF-8"
To: "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com, virtio-comment@lists.oasis-open.org
Cc: virtualization@lists.linux-foundation.org, asias@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Arseny Krasnov <arseny.krasnov@kaspersky.com>, cong.wang@bytedance.com, Xiongchun Duan <duanxiongchun@bytedance.com>, Yongji Xie <xieyongji@bytedance.com>, =?UTF-8?B?5p+056iz?= <chaiwen.cc@bytedance.com>, Jorgen Hansen <jhansen@vmware.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Any comments? Thanks.

On Thu, May 27, 2021 at 9:01 PM Jiang Wang <jiang.wang@bytedance.com> wrote:
>
> From: "jiang.wang" <jiang.wang@bytedance.com>
>
> Add supports for datagram type for virtio-vsock. Datagram
> sockets are connectionless and unreliable. To avoid contention
> with stream and other sockets, add two more virtqueues and
> a new feature bit to identify if those two new queues exist or not.
>
> Also add descriptions for resource management of datagram, which
> does not use the existing credit update mechanism associated with
> stream sockets.
>
> Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
> ---
>
> V2: addressed the comments for the previous version.
> V3: add description for the mergeable receive buffer.
> V4: add a feature bit for stream and reserver a bit for seqpacket.
> Fix mrg_rxbuf related sentences.
>
>  virtio-vsock.tex | 155 ++++++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 142 insertions(+), 13 deletions(-)
>
> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> index da7e641..bacac3c 100644
> --- a/virtio-vsock.tex
> +++ b/virtio-vsock.tex
> @@ -9,14 +9,41 @@ \subsection{Device ID}\label{sec:Device Types / Socket Device / Device ID}
>
>  \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
>  \begin{description}
> -\item[0] rx
> -\item[1] tx
> +\item[0] stream rx
> +\item[1] stream tx
> +\item[2] datagram rx
> +\item[3] datagram tx
> +\item[4] event
> +\end{description}
> +The virtio socket device uses 5 queues if feature bit VIRTIO_VSOCK_F_DRGAM is set. Otherwise, it
> +only uses 3 queues, as the following.
> +
> +\begin{description}
> +\item[0] stream rx
> +\item[1] stream tx
>  \item[2] event
>  \end{description}
>
> +When behavior differs between stream and datagram rx/tx virtqueues
> +their full names are used. Common behavior is simply described in
> +terms of rx/tx virtqueues and applies to both stream and datagram
> +virtqueues.
> +
>  \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>
> -There are currently no feature bits defined for this device.
> +\begin{description}
> +\item[VIRTIO_VSOCK_F_STREAM (0)] Device has support for stream socket type.
> +\end{description}
> +
> +\begin{description}
> +\item[VIRTIO_VSOCK_F_DGRAM (2)] Device has support for datagram socket type.
> +\end{description}
> +
> +\begin{description}
> +\item[VIRTIO_VSOCK_F_MRG_RXBUF (3)] Driver can merge receive buffers.
> +\end{description}
> +
> +If no feature bits are defined, then assume only VIRTIO_VSOCK_F_STREAM is set.
>
>  \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>
> @@ -64,6 +91,8 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>
>  Packets transmitted or received contain a header before the payload:
>
> +If feature VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, use the following header.
> +
>  \begin{lstlisting}
>  struct virtio_vsock_hdr {
>         le64 src_cid;
> @@ -79,6 +108,15 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>  };
>  \end{lstlisting}
>
> +If feature VIRTIO_VSOCK_F_MRG_RXBUF is negotiated, use the following header.
> +\begin{lstlisting}
> +struct virtio_vsock_hdr_mrg_rxbuf {
> +       struct virtio_vsock_hdr hdr;
> +       le16 num_buffers;
> +};
> +\end{lstlisting}
> +
> +
>  The upper 32 bits of src_cid and dst_cid are reserved and zeroed.
>
>  Most packets simply transfer data but control packets are also used for
> @@ -107,6 +145,9 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>
>  \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket Device / Device Operation / Virtqueue Flow Control}
>
> +Flow control applies to stream sockets; datagram sockets do not have
> +flow control.
> +
>  The tx virtqueue carries packets initiated by applications and replies to
>  received packets.  The rx virtqueue carries packets initiated by the device and
>  replies to previously transmitted packets.
> @@ -140,12 +181,15 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
>  consists of a (cid, port number) tuple. The header fields used for this are
>  \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>
> -Currently only stream sockets are supported. \field{type} is 1 for stream
> -socket types.
> +Currently stream and datagram (dgram) sockets are supported. \field{type} is 1 for stream
> +socket types. \field{type} is 3 for dgram socket types.
>
>  Stream sockets provide in-order, guaranteed, connection-oriented delivery
>  without message boundaries.
>
> +Datagram sockets provide unordered, unreliable, connectionless messages
> +with message boundaries and a maximum length.
> +
>  \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
>  \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
>  stream sockets. The guest and the device publish how much buffer space is
> @@ -162,7 +206,7 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
>  u32 peer_free = peer_buf_alloc - (tx_cnt - peer_fwd_cnt);
>  \end{lstlisting}
>
> -If there is insufficient buffer space, the sender waits until virtqueue buffers
> +For stream sockets, if there is insufficient buffer space, the sender waits until virtqueue buffers
>  are returned and checks \field{buf_alloc} and \field{fwd_cnt} again. Sending
>  the VIRTIO_VSOCK_OP_CREDIT_REQUEST packet queries how much buffer space is
>  available. The reply to this query is a VIRTIO_VSOCK_OP_CREDIT_UPDATE packet.
> @@ -170,24 +214,55 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
>  previously receiving a VIRTIO_VSOCK_OP_CREDIT_REQUEST packet. This allows
>  communicating updates any time a change in buffer space occurs.
>
> +Unlike stream sockets, dgram sockets do not use VIRTIO_VSOCK_OP_CREDIT_UPDATE or
> +VIRTIO_VSOCK_OP_CREDIT_REQUEST packets. The dgram buffer management
> +is split to two parts: tx side and rx side. For the tx side, if the
> +virtqueue is full, the packet will be dropped.
> +For the rx side, dgram also uses the \field{buf_alloc}. If it is full, the packet
> +is dropped by the receiver.
> +
> +\drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Setting Up Receive Buffers}
> +\begin{itemize}
> +\item If VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, the driver SHOULD populate the receive queue(s)
> +      with buffers of at least 1526 bytes for stream sockets and 4096 bytes for datagram sockets.
> +\item If VIRTIO_VSOCK_F_MRG_RXBUF is negotiated, each buffer MUST be at
> +least the size of the struct virtio_vsock_hdr_mgr_rxbuf.
> +\end{itemize}
> +
> +\begin{note}
> +Obviously each buffer can be split across multiple descriptor elements.
> +\end{note}
> +
> +\devicenormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Setting Up Receive Buffers}
> +The device MUST set \field{num_buffers} to the number of descriptors used when
> +transmitting the  packet.
> +
> +The device MUST use only a single descriptor if VIRTIO_VSOCK_F_MRG_RXBUF
> +is not negotiated.
> +
>  \drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
> -VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> -sufficient free buffer space for the payload.
> +For stream sockets, VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> +sufficient free buffer space for the payload. For dgram sockets, VIRTIO_VSOCK_OP_RW data packets
> +MAY be transmitted when the peer rx buffer is full. Then the packet will be dropped by the peer,
> +and driver will not get any notification.
>
>  All packets associated with a stream flow MUST contain valid information in
>  \field{buf_alloc} and \field{fwd_cnt} fields.
>
>  \devicenormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
> -VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> -sufficient free buffer space for the payload.
> +For stream sockets, VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
> +sufficient free buffer space for the payload. For dgram sockets, VIRTIO_VSOCK_OP_RW data packets
> +MAY be transmitted when the peer rx buffer is full. Then the packet will be dropped by the peer,
> +and the device will not get any notification.
>
>  All packets associated with a stream flow MUST contain valid information in
>  \field{buf_alloc} and \field{fwd_cnt} fields.
>
>  \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / Device Operation / Receive and Transmit}
> -The driver queues outgoing packets on the tx virtqueue and incoming packet
> +The driver queues outgoing packets on the tx virtqueue and allocates incoming packet
>  receive buffers on the rx virtqueue. Packets are of the following form:
>
> +If VIRTIO_VSOCK_F_MRG_RXBUF was not negotiated, use the following.
>  \begin{lstlisting}
>  struct virtio_vsock_packet {
>      struct virtio_vsock_hdr hdr;
> @@ -195,24 +270,70 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
>  };
>  \end{lstlisting}
>
> +Otherwise, use the following form:
> +\begin{lstlisting}
> +struct virtio_vsock_packet_mrg_rxbuf {
> +    struct virtio_vsock_hdr_mrg_rxbuf hdr;
> +    u8 data[];
> +};
> +\end{lstlisting}
> +
> +
>  Virtqueue buffers for outgoing packets are read-only. Virtqueue buffers for
>  incoming packets are write-only.
>
> +When transmitting packets to the device, \field{num_buffers} is not used.
> +
> +\begin{enumerate}
> +\item \field{num_buffers} indicates how many descriptors
> +  this packet is spread over (including this one).
> +  This is valid only if VIRTIO_VSOCK_F_MRG_RXBUF was negotiated.
> +  This allows receipt of large packets without having to allocate large
> +  buffers: a packet that does not fit in a single buffer can flow
> +  over to the next buffer, and so on. In this case, there will be
> +  at least \field{num_buffers} used buffers in the virtqueue, and the device
> +  chains them together to form a single packet in a way similar to
> +  how it would store it in a single buffer spread over multiple
> +  descriptors.
> +  The other buffers will not begin with a struct virtio_vsock_hdr.
> +
> +  If VIRTIO_VSOCK_F_MRG_RXBUF was not negotiated, then only one
> +  descriptor is used.
> +
> +\item If
> +  \field{num_buffers} is one, then the entire packet will be
> +  contained within this buffer, immediately following the struct
> +  virtio_vsock_hdr.
> +\end{enumerate}
> +
>  \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
>
>  The \field{guest_cid} configuration field MUST be used as the source CID when
>  sending outgoing packets.
>
> -A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> +For stream and datagram sockets, A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
>  unknown \field{type} value.
>
>  \devicenormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
>
>  The \field{guest_cid} configuration field MUST NOT contain a reserved CID as listed in \ref{sec:Device Types / Socket Device / Device configuration layout}.
>
> -A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
> +For stream and datagram sockets, A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with an
>  unknown \field{type} value.
>
> +If VIRTIO_VSOCK_F_MRG_RXBUF has been negotiated, the device MUST set
> +\field{num_buffers} to indicate the number of buffers
> +the packet (including the header) is spread over.
> +
> +If a receive packet is spread over multiple buffers, the device
> +MUST use all buffers but the last (i.e. the first $\field{num_buffers} -
> +1$ buffers) completely up to the full length of each buffer
> +supplied by the driver.
> +
> +The device MUST use all buffers used by a single receive
> +packet together, such that at least \field{num_buffers} are
> +observed by driver as used.
> +
>  \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device Operation / Stream Sockets}
>
>  Connections are established by sending a VIRTIO_VSOCK_OP_REQUEST packet. If a
> @@ -240,6 +361,14 @@ \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device / Device O
>  destination) address tuple for a new connection while the other peer is still
>  processing the old connection.
>
> +\subsubsection{Datagram Sockets}\label{sec:Device Types / Socket Device / Device Operation / Datagram Sockets}
> +
> +Datagram (dgram) sockets are connectionless and unreliable. The sender just sends
> +a message to the peer and hopes it will be delivered. A VIRTIO_VSOCK_OP_RST reply is sent if
> +a receiving socket does not exist on the destination.
> +If the transmission or receiving buffers are full, the packets
> +are dropped.
> +
>  \subsubsection{Device Events}\label{sec:Device Types / Socket Device / Device Operation / Device Events}
>
>  Certain events are communicated by the device to the driver using the event
> --
> 2.11.0
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

