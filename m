Return-Path: virtio-comment-return-1896-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 14FC0986621
	for <virtio-comment@lists.oasis-open.org>; Thu, 10 Jun 2021 06:56:19 +0000 (UTC)
Date: Thu, 10 Jun 2021 08:56:10 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20210610065610.tvf2hkzgc4mjgdk6@steredhat>
References: <20210528040118.3253836-1-jiang.wang@bytedance.com>
 <20210608134601.5qs46xdn7bzaob77@steredhat>
 <CAP_N_Z9-C0zgXzRXX_vm37cK6-q1Qv+0CErMkMTHGjMgcTs-6Q@mail.gmail.com>
 <20210609071725.627yqnmkzadwpubp@steredhat>
 <CAP_N_Z-FCkTDupYSFY1q=FsmAzjAtZ1wGj9h+fngPnSSSecwdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z-FCkTDupYSFY1q=FsmAzjAtZ1wGj9h+fngPnSSSecwdw@mail.gmail.com>
Subject: [virtio-comment] Re: [External] Re: [RFC v4] virtio-vsock: add description for
 datagram type
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com, virtio-comment@lists.oasis-open.org, virtualization@lists.linux-foundation.org, asias@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>, Arseny Krasnov <arseny.krasnov@kaspersky.com>, cong.wang@bytedance.com, Xiongchun Duan <duanxiongchun@bytedance.com>, Yongji Xie <xieyongji@bytedance.com>, =?utf-8?B?5p+056iz?= <chaiwen.cc@bytedance.com>, Jorgen Hansen <jhansen@vmware.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jun 09, 2021 at 08:31:27PM -0700, Jiang Wang . wrote:
>On Wed, Jun 9, 2021 at 12:17 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> On Tue, Jun 08, 2021 at 09:22:26PM -0700, Jiang Wang . wrote:
>> >On Tue, Jun 8, 2021 at 6:46 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> >>
>> >> On Fri, May 28, 2021 at 04:01:18AM +0000, Jiang Wang wrote:
>> >> >From: "jiang.wang" <jiang.wang@bytedance.com>
>> >> >
>> >> >Add supports for datagram type for virtio-vsock. Datagram
>> >> >sockets are connectionless and unreliable. To avoid contention
>> >> >with stream and other sockets, add two more virtqueues and
>> >> >a new feature bit to identify if those two new queues exist or not.
>> >> >
>> >> >Also add descriptions for resource management of datagram, which
>> >> >does not use the existing credit update mechanism associated with
>> >> >stream sockets.
>> >> >
>> >> >Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>
>> >> >---
>> >> >
>> >> >V2: addressed the comments for the previous version.
>> >> >V3: add description for the mergeable receive buffer.
>> >> >V4: add a feature bit for stream and reserver a bit for seqpacket.
>> >> >Fix mrg_rxbuf related sentences.
>> >> >
>> >> > virtio-vsock.tex | 155 ++++++++++++++++++++++++++++++++++++++++++++++++++-----
>> >> > 1 file changed, 142 insertions(+), 13 deletions(-)
>> >> >
>> >> >diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>> >> >index da7e641..bacac3c 100644
>> >> >--- a/virtio-vsock.tex
>> >> >+++ b/virtio-vsock.tex
>> >> >@@ -9,14 +9,41 @@ \subsection{Device ID}\label{sec:Device Types / Socket Device / Device ID}
>> >> >
>> >> > \subsection{Virtqueues}\label{sec:Device Types / Socket Device / Virtqueues}
>> >> > \begin{description}
>> >> >-\item[0] rx
>> >> >-\item[1] tx
>> >> >+\item[0] stream rx
>> >> >+\item[1] stream tx
>> >> >+\item[2] datagram rx
>> >> >+\item[3] datagram tx
>> >> >+\item[4] event
>> >>
>> >> Is there a particular reason to always have the event queue as the last
>> >> one?
>> >>
>> >> Maybe it's better to add the datagram queues at the bottom, so the first
>> >> 3 queues are always the same.
>> >>
>> >I am not sure. I think Linux kernel should be fine with what you described.
>> >But I am not sure about QEMU. From the code, I see virtqueue is allocated
>> >as an array, like following,
>> >
>> >+ #ifdef CONFIG_VHOST_VSOCK_DGRAM
>> >+    struct vhost_virtqueue vhost_vqs[4];
>> >+ #else
>> >    struct vhost_virtqueue vhost_vqs[2];
>> >+ #endi
>>
>> I see, also vhost_dev_init() requires an array, so I agree that this is
>> the best approach, sorry for the noise.
>>
>> Just to be sure to check that anything is working if
>> CONFIG_VHOST_VSOCK_DGRAM is defined, but the guest has an old driver
>> that doesn't support DGRAM, and viceversa.
>
>Sure.  I just want to mention that the QEMU should be consistent
>with the device (host). If QEMU enabled CONFIG_VHOST_VSOCK_DGRAM,
>the device also needs to enable a similar option. Than the driver can
>be old or new versions.

Okay, but we should allow to run an old QEMU (without DGRAM) with a new 
kernel (with DGRAM support built it) and viceversa.
The features bit are used to guarantee compatibility and to enable and 
disable features at runtime depending on what the device or driver 
supports.

>
>> >
>> >so I assume the virtqueues for tx/rx should be
>> >continuous? I can try to put the new queues at the end and see if it
>> >works or not.
>> >
>> >btw, my qemu change is here:
>> >https://github.com/Jiang1155/qemu/commit/6307aa7a0c347905a31f3ca6577923e2f6dd9d84
>> >
>> >> >+\end{description}
>> >> >+The virtio socket device uses 5 queues if feature bit VIRTIO_VSOCK_F_DRGAM is set. Otherwise, it
>> >> >+only uses 3 queues, as the following.
>> >> >+
>> >> >+\begin{description}
>> >> >+\item[0] stream rx
>> >> >+\item[1] stream tx
>> >> > \item[2] event
>> >> > \end{description}
>> >> >
>> >> >+When behavior differs between stream and datagram rx/tx virtqueues
>> >> >+their full names are used. Common behavior is simply described in
>> >> >+terms of rx/tx virtqueues and applies to both stream and datagram
>> >> >+virtqueues.
>> >> >+
>> >> > \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
>> >> >
>> >> >-There are currently no feature bits defined for this device.
>> >> >+\begin{description}
>> >> >+\item[VIRTIO_VSOCK_F_STREAM (0)] Device has support for stream socket type.
>> >> >+\end{description}
>> >> >+
>> >> >+\begin{description}
>> >> >+\item[VIRTIO_VSOCK_F_DGRAM (2)] Device has support for datagram socket
>> >> >type.
>> >> >+\end{description}
>> >> >+
>> >> >+\begin{description}
>> >> >+\item[VIRTIO_VSOCK_F_MRG_RXBUF (3)] Driver can merge receive buffers.
>> >> >+\end{description}
>> >> >+
>> >> >+If no feature bits are defined, then assume only VIRTIO_VSOCK_F_STREAM
>> >> >is set.
>> >>
>> >> I'd say more like socket streams are supported, without reference to the
>> >> feature bit, something like: "If no feature bits are defined, then
>> >> assume device only supports stream socket type."
>> >>
>> >OK.
>> >
>> >> >
>> >> > \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
>> >> >
>> >> >@@ -64,6 +91,8 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>> >> >
>> >> > Packets transmitted or received contain a header before the payload:
>> >> >
>> >> >+If feature VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, use the following header.
>> >> >+
>> >> > \begin{lstlisting}
>> >> > struct virtio_vsock_hdr {
>> >> >       le64 src_cid;
>> >> >@@ -79,6 +108,15 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>> >> > };
>> >> > \end{lstlisting}
>> >> >
>> >> >+If feature VIRTIO_VSOCK_F_MRG_RXBUF is negotiated, use the following header.
>> >> >+\begin{lstlisting}
>> >> >+struct virtio_vsock_hdr_mrg_rxbuf {
>> >> >+      struct virtio_vsock_hdr hdr;
>> >> >+      le16 num_buffers;
>> >> >+};
>> >> >+\end{lstlisting}
>> >> >+
>> >> >+
>> >> > The upper 32 bits of src_cid and dst_cid are reserved and zeroed.
>> >> >
>> >> > Most packets simply transfer data but control packets are also used for
>> >> >@@ -107,6 +145,9 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>> >> >
>> >> > \subsubsection{Virtqueue Flow Control}\label{sec:Device Types / Socket Device / Device Operation / Virtqueue Flow Control}
>> >> >
>> >> >+Flow control applies to stream sockets; datagram sockets do not have
>> >> >+flow control.
>> >> >+
>> >> > The tx virtqueue carries packets initiated by applications and replies to
>> >> > received packets.  The rx virtqueue carries packets initiated by the device and
>> >> > replies to previously transmitted packets.
>> >> >@@ -140,12 +181,15 @@ \subsubsection{Addressing}\label{sec:Device Types / Socket Device / Device Opera
>> >> > consists of a (cid, port number) tuple. The header fields used for this are
>> >> > \field{src_cid}, \field{src_port}, \field{dst_cid}, and \field{dst_port}.
>> >> >
>> >> >-Currently only stream sockets are supported. \field{type} is 1 for
>> >> >stream
>> >> >-socket types.
>> >> >+Currently stream and datagram (dgram) sockets are supported. \field{type} is 1 for stream
>> >> >+socket types. \field{type} is 3 for dgram socket types.
>> >>
>> >> When Arseny's change will merged, we can define and use
>> >> VIRTIO_VSOCK_TYPE_DGRAM,.
>> >
>> >Sure.
>> >> >
>> >> > Stream sockets provide in-order, guaranteed, connection-oriented
>> >> > delivery
>> >> > without message boundaries.
>> >> >
>> >> >+Datagram sockets provide unordered, unreliable, connectionless
>> >> >messages
>> >> >+with message boundaries and a maximum length.
>> >> >+
>> >> > \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device / Device Operation / Buffer Space Management}
>> >> > \field{buf_alloc} and \field{fwd_cnt} are used for buffer space
>> >> > management of
>> >> > stream sockets. The guest and the device publish how much buffer space is
>> >> >@@ -162,7 +206,7 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
>> >> > u32 peer_free = peer_buf_alloc - (tx_cnt - peer_fwd_cnt);
>> >> > \end{lstlisting}
>> >> >
>> >> >-If there is insufficient buffer space, the sender waits until virtqueue buffers
>> >> >+For stream sockets, if there is insufficient buffer space, the sender waits until virtqueue buffers
>> >> > are returned and checks \field{buf_alloc} and \field{fwd_cnt} again. Sending
>> >> > the VIRTIO_VSOCK_OP_CREDIT_REQUEST packet queries how much buffer space is
>> >> > available. The reply to this query is a VIRTIO_VSOCK_OP_CREDIT_UPDATE packet.
>> >> >@@ -170,24 +214,55 @@ \subsubsection{Buffer Space Management}\label{sec:Device Types / Socket Device /
>> >> > previously receiving a VIRTIO_VSOCK_OP_CREDIT_REQUEST packet. This allows
>> >> > communicating updates any time a change in buffer space occurs.
>> >> >
>> >> >+Unlike stream sockets, dgram sockets do not use VIRTIO_VSOCK_OP_CREDIT_UPDATE or
>> >> >+VIRTIO_VSOCK_OP_CREDIT_REQUEST packets. The dgram buffer management
>> >> >+is split to two parts: tx side and rx side. For the tx side, if the
>> >>
>> >> Maybe better to use sender and receiver, since we use tx and rx to
>> >> identify the queues.
>> >
>> >OK.
>> >
>> >> >+virtqueue is full, the packet will be dropped.
>> >> >+For the rx side, dgram also uses the \field{buf_alloc}. If it is full, the packet
>> >> >+is dropped by the receiver.
>> >>
>> >> This sentence is a bit unclear.
>> >> `buf_alloc` for stream socket is used to inform the other peer about the
>> >> receive buffer space. In this case we are using the local information,
>> >> so there is no need to refer to `buf_alloc`. We can write something
>> >> like: "The packet is dropped by the receiver if there is no space in the
>> >> receive buffer".
>> >
>> >OK.
>> >
>> >> >+
>> >> >+\drivernormative{\paragraph}{Device Operation: Buffer Space Management}{Device Types / Socket Device / Device Operation / Setting Up Receive Buffers}
>> >> >+\begin{itemize}
>> >> >+\item If VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, the driver SHOULD populate the receive queue(s)
>> >> >+      with buffers of at least 1526 bytes for stream sockets and 4096
>> >> >bytes for datagram sockets.
>> >>
>> >> Where does 1526 come from?
>> >
>> >No specific reason. Any recommendations?
>> >
>> >> We're adding a requirement for socket streams that wasn't there until
>> >> now.
>> >
>> >This is only when mergeable rxbuf bit is used. I think before this, the stream
>> >rx buf should be at least bigger than the pkt header. We just did not put that
>> >into the spec.
>>
>> Mmm, I'm confused now. The statement says "If VIRTIO_VSOCK_F_MRG_RXBUF
>> is not negotiated"
>>     ^
>My bad. You are right, this is a new requirement for stream sockets.
>Not a typo.  Maybe remove the part for stream sockets? Something
>like following:
>
>If VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, the driver SHOULD
>populate the receive queue(s)
>with buffers of  at least 4096 bytes for datagram sockets.

Make sense to me. Maybe we can replase s/receive queue(s)/datagram rx 
queue/.

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

