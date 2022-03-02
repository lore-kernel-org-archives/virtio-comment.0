Return-Path: <sgarzare@redhat.com>
Date: Wed, 2 Mar 2022 17:09:58 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [virtio-comment] [PATCH v5 1/2] virtio-vsock: add description
 for datagram type
Message-ID: <20220302160958.62s34i2n2tccsscz@sgarzare-redhat>
References: <20210528040118.3253836-1-jiang.wang@bytedance.com>
 <20220224221547.2436395-1-beshleman.devbox@gmail.com>
 <20220224221547.2436395-2-beshleman.devbox@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220224221547.2436395-2-beshleman.devbox@gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: beshleman.devbox@gmail.com
Cc: mst@redhat.com, cohuck@redhat.com, virtio-comment@lists.oasis-open.org, cong.wang@bytedance.com, duanxiongchun@bytedance.com, jiang.wang@bytedance.com, virtualization@lists.linux-foundation.org, xieyongji@bytedance.com, chaiwen.cc@bytedance.com, stefanha@redhat.com, asias@redhat.com, arseny.krasnov@kaspersky.com, jhansen@vmware.com, bobby.eshleman@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

Hi Bobby,
Sorry for the delay, but I saw these patches today.
Please, can you keep me in CC?

On Thu, Feb 24, 2022 at 10:15:46PM +0000, beshleman.devbox@gmail.com wrote:
>From: Jiang Wang <jiang.wang@bytedance.com>
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
>Signed-off-by: Bobby Eshleman <bobby.eshleman@bytedance.com>
>---
>
>V2: Addressed the comments for the previous version.
>V3: Add description for the mergeable receive buffer.
>V4: Add a feature bit for stream and reserver a bit for seqpacket.
>    Fix mrg_rxbuf related sentences.
>V5: Rebase onto head (change to more nicely accompany seqpacket changes).
>    Remove statement about no feature bits being set (already made by seqpacket patches).
>    Clarify \field{type} declaration.
>    Use words "sender/receiver" instead of "tx/rx" for clarity, and other prose changes.
>    Directly state that full buffers result in dropped packets.
>    Change verbs to present tense.
>    Clarify if-else pairs (e.g., "If XYZ is negotiated" is followed by "If XYZ
>    is not negotiated" instead of "Otherwise").
>    Mergeable buffer changes are split off into a separate patch.
>
> virtio-vsock.tex | 63 +++++++++++++++++++++++++++++++++++++++++++++++---------
> 1 file changed, 53 insertions(+), 10 deletions(-)
>
>diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>index d79984d..1a66a1b 100644
>--- a/virtio-vsock.tex
>+++ b/virtio-vsock.tex
>@@ -9,11 +9,26 @@ \subsection{Device ID}\label{sec:Device Types / Socket Device / Device ID}
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

We are also adding a new flag (VIRTIO_VSOCK_F_NO_IMPLIED_STREAM) to
provide the possibility to support for example only dgrams.

So I think we should consider the case where we have only DGRAM queues
(and it will be similar to the stream only case so 3 queues).

Maybe we could describe this part better and say that if we have both
STREAM (or SEQPACKET) and DGRAM set we have 5 queues, otherwise
only 3 queues.

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
> If no feature bit is set, only stream socket type is supported.
>@@ -23,6 +38,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> \begin{description}
> \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
>+\item[VIRTIO_VSOCK_F_DGRAM (2)] datagram socket type is supported.
> \end{description}
>
> \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>@@ -109,6 +125,9 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>
> \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket Device / Device Operation / Virtqueue Flow Control}
>
>+Flow control applies to stream sockets; datagram sockets do not have
>+flow control.
>+
> The tx virtqueue carries packets initiated by applications and replies to
> received packets.  The rx virtqueue carries packets initiated by the device and
> replies to previously transmitted packets.
>@@ -142,18 +161,22 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
> consists of a (cid, port number) tuple. The header fields used for this are
> \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>
>-Currently stream and seqpacket sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
>-for stream socket types, and 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types.
>+Currently stream, seqpacket, and dgram sockets are supported. \field{type} is 1 (VIRTIO_VSOCK_TYPE_STREAM)
>+for stream socket types, 2 (VIRTIO_VSOCK_TYPE_SEQPACKET) for seqpacket socket types, and 3 (VIRTIO_VSOCK_TYPE_DGRAM) for dgram socket types.
>
> \begin{lstlisting}
> #define VIRTIO_VSOCK_TYPE_STREAM    1
> #define VIRTIO_VSOCK_TYPE_SEQPACKET 2
>+#define VIRTIO_VSOCK_TYPE_DGRAM     3
> \end{lstlisting}
>
> Stream sockets provide in-order, guaranteed, connection-oriented delivery
> without message boundaries. Seqpacket sockets provide in-order, guaranteed,
> connection-oriented delivery with message and record boundaries.
>
>+Datagram sockets provide unordered, unreliable, connectionless messages
>+with message boundaries and a maximum length.
>+
> \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
> \field{buf_alloc} and \field{fwd_cnt} are used for buffer space management of
> stream sockets. The guest and the device publish how much buffer space is
>@@ -170,7 +193,7 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
> u32 peer_free = peer_buf_alloc - (tx_cnt - peer_fwd_cnt);
> \end{lstlisting}
>
>-If there is insufficient buffer space, the sender waits until virtqueue buffers
>+For stream sockets, if there is insufficient buffer space, the sender waits until virtqueue buffers

stream and seqpacket

> are returned and checks \field{buf_alloc} and \field{fwd_cnt} again. Sending
> the VIRTIO_VSOCK_OP_CREDIT_REQUEST packet queries how much buffer space is
> available. The reply to this query is a VIRTIO_VSOCK_OP_CREDIT_UPDATE packet.
>@@ -178,22 +201,32 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
> previously receiving a VIRTIO_VSOCK_OP_CREDIT_REQUEST packet. This allows
> communicating updates any time a change in buffer space occurs.
>
>+Unlike stream sockets, dgram sockets do not use VIRTIO_VSOCK_OP_CREDIT_UPDATE
>+or VIRTIO_VSOCK_OP_CREDIT_REQUEST packets. The dgram buffer management is split
>+into two parts: senders and receivers. For senders, the packet is dropped if the
>+virtqueue is full. For receivers, the packet is dropped if there is no space
>+in the receive buffer.
>+
> \drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Buffer Space Management}
>-VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has
>-sufficient free buffer space for the payload.
>+For stream sockets, VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the peer has

stream and seqpacket

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

stream and seqpacket

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

Is this change related?

> receive buffers on the rx virtqueue. Packets are of the following form:
>
> \begin{lstlisting}
>@@ -206,6 +239,8 @@ \subsubsection{Receive and Transmit}\label{sec:Device Types / Socket Device / De
> Virtqueue buffers for outgoing packets are read-only. Virtqueue buffers for
> incoming packets are write-only.
>
>+When transmitting packets to the device, \field{num_buffers} is not used.
>+

Leftover? Perhaps it should go in patch 2.

> \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{Device Types / Socket Device / Device Operation / Receive and Transmit}
>
> The \field{guest_cid} configuration field MUST be used as the source CID when
>@@ -274,6 +309,14 @@ \subsubsection{Seqpacket Sockets}\label{sec:Device Types / Socket Device / Devic
> #define VIRTIO_VSOCK_SEQ_EOR (1 << 1)
> \end{lstlisting}
>
>+\subsubsection{Datagram Sockets}\label{sec:Device Types / Socket Device / Device Operation / Datagram Sockets}
>+
>+Datagram (dgram) sockets are connectionless and unreliable. The sender just sends
>+a message to the peer and hopes it will be delivered. A VIRTIO_VSOCK_OP_RST reply is sent if
>+a receiving socket does not exist on the destination.
>+If the transmission or receiving buffers are full, the packets
>+are dropped.
>+

I'm not sure we should respond with RST if there's no socket bind on
the port.

What happens with UDP if we do a sendto to a closed port?

Thanks,
Stefano

