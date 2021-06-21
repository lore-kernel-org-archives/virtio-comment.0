Return-Path: virtio-comment-return-1911-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 589E89861BA
	for <virtio-comment@lists.oasis-open.org>; Mon, 21 Jun 2021 17:12:18 +0000 (UTC)
MIME-Version: 1.0
References: <20210610183935.1000999-1-jiang.wang@bytedance.com> <8c4e38e4-c13e-4c83-8375-df0e2f144020@redhat.com>
In-Reply-To: <8c4e38e4-c13e-4c83-8375-df0e2f144020@redhat.com>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Mon, 21 Jun 2021 10:12:05 -0700
Message-ID: <CAP_N_Z-GtPpnQOPZxDAFieOq3cweKnsXSmudbb6sq7BOMX-M7Q@mail.gmail.com>
Subject: [virtio-comment] Re: [External] Re: [RFC PATCH v1] vsock: add mergeable rx buffer description
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com, virtio-comment@lists.oasis-open.org, virtualization@lists.linux-foundation.org, asias@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Arseny Krasnov <arseny.krasnov@kaspersky.com>, cong.wang@bytedance.com, Xiongchun Duan <duanxiongchun@bytedance.com>, Yongji Xie <xieyongji@bytedance.com>, =?UTF-8?B?5p+056iz?= <chaiwen.cc@bytedance.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jun 10, 2021 at 11:17 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/6/11 =E4=B8=8A=E5=8D=882:39, Jiang Wang =E5=86=99=E9=81=93=
:
> > Mergeable rx buffer is already supported by virtio-net, and
> > it can save memory for big packets. It will also be beneficial
> > for the vsock devices, so add it to the spec.
>
>
> A lot of duplication with the virtio-net mergeable rx buffer description.
>
> I wonder whether we can have a generic feature like VIRTIO_F_MRG_BUFFER
> instead.
>

I think we can try to merge the description of mergeable rx buffer
into one place. But for the feature bits themselves, we still use
two feature bits for virtio-net and virtio-vsock. Each will refer to
the same text section for the explanation. Right now,
I basically copied the text from virtio-net for vsock.

For feature bits, I think there  might be cases that virtio-net enabled
mergeable rx buffer, but virtio-vsock does not. Then it will be easier
to handle with two feature bits.

> >
> > ---
> > V0 -> V1: I send similar patch with vsock dgram before and
> > already got some comments. This version fixed those,such as
> > use present tense for feature bit etc. Also the feature bit
> > value is 3, because we expect to have some other featue bits
> > defined soon.
> >
> >   virtio-vsock.tex | 78 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++++-
> >   1 file changed, 77 insertions(+), 1 deletion(-)
> >
> > diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> > index da7e641..d529291 100644
> > --- a/virtio-vsock.tex
> > +++ b/virtio-vsock.tex
> > @@ -16,7 +16,9 @@ \subsection{Virtqueues}\label{sec:Device Types / Sock=
et Device / Virtqueues}
> >
> >   \subsection{Feature bits}\label{sec:Device Types / Socket Device / Fe=
ature bits}
> >
> > -There are currently no feature bits defined for this device.
> > +\begin{description}
> > +\item[VIRTIO_VSOCK_F_MRG_RXBUF (3)] Driver can merge receive buffers.
> > +\end{description}
> >
> >   \subsection{Device configuration layout}\label{sec:Device Types / Soc=
ket Device / Device configuration layout}
> >
> > @@ -64,6 +66,8 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Socket Device / Device Op
> >
> >   Packets transmitted or received contain a header before the payload:
> >
> > +If feature VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, use the followi=
ng header.
> > +
> >   \begin{lstlisting}
> >   struct virtio_vsock_hdr {
> >       le64 src_cid;
> > @@ -79,6 +83,15 @@ \subsection{Device Operation}\label{sec:Device Types=
 / Socket Device / Device Op
> >   };
> >   \end{lstlisting}
> >
> > +If feature VIRTIO_VSOCK_F_MRG_RXBUF is negotiated, use the following h=
eader.
> > +\begin{lstlisting}
> > +struct virtio_vsock_hdr_mrg_rxbuf {
> > +     struct virtio_vsock_hdr hdr;
> > +     le16 num_buffers;
> > +};
> > +\end{lstlisting}
> > +
> > +
> >   The upper 32 bits of src_cid and dst_cid are reserved and zeroed.
> >
> >   Most packets simply transfer data but control packets are also used f=
or
> > @@ -170,6 +183,23 @@ \subsubsection{Buffer Space Management}\label{sec:=
Device Types / Socket Device /
> >   previously receiving a VIRTIO_VSOCK_OP_CREDIT_REQUEST packet. This al=
lows
> >   communicating updates any time a change in buffer space occurs.
> >
> > +\drivernormative{\paragraph}{Device Operation: Buffer Space Management=
}{Device Types / Socket Device / Device Operation / Setting Up Receive Buff=
ers}
> > +\begin{itemize}
> > +\item If VIRTIO_VSOCK_F_MRG_RXBUF is negotiated, each buffer MUST be a=
t
> > +least the size of the struct virtio_vsock_hdr_mgr_rxbuf.
> > +\end{itemize}
> > +
> > +\begin{note}
> > +Obviously each buffer can be split across multiple descriptor elements=
.
> > +\end{note}
> > +
> > +\devicenormative{\paragraph}{Device Operation: Buffer Space Management=
}{Device Types / Socket Device / Device Operation / Setting Up Receive Buff=
ers}
> > +The device MUST set \field{num_buffers} to the number of descriptors u=
sed when
> > +transmitting the  packet.
>
>
> Interesting, does this mean it works for tx? Virtio-net had:
>
> "The driver MUST set num_buffers to zero."
>
Nope, I did not mean to support tx. This is for the device side, the
driver set is
the same as what you mentioned.

>
> > +
> > +The device MUST use only a single descriptor if VIRTIO_VSOCK_F_MRG_RXB=
UF
> > +is not negotiated.
>
>
> Though virtio-net using something similar. But I think we need to
> clarify, what we really need is "a single buffer" not "a single descripto=
r".
>
OK, will do.

> > +
> >   \drivernormative{\paragraph}{Device Operation: Buffer Space Managemen=
t}{Device Types / Socket Device / Device Operation / Buffer Space Managemen=
t}
> >   VIRTIO_VSOCK_OP_RW data packets MUST only be transmitted when the pee=
r has
> >   sufficient free buffer space for the payload.
> > @@ -188,6 +218,7 @@ \subsubsection{Receive and Transmit}\label{sec:Devi=
ce Types / Socket Device / De
> >   The driver queues outgoing packets on the tx virtqueue and incoming p=
acket
> >   receive buffers on the rx virtqueue. Packets are of the following for=
m:
> >
> > +If VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, use the following.
> >   \begin{lstlisting}
> >   struct virtio_vsock_packet {
> >       struct virtio_vsock_hdr hdr;
> > @@ -195,9 +226,41 @@ \subsubsection{Receive and Transmit}\label{sec:Dev=
ice Types / Socket Device / De
> >   };
> >   \end{lstlisting}
> >
> > +Otherwise, use the following form:
> > +\begin{lstlisting}
> > +struct virtio_vsock_packet_mrg_rxbuf {
> > +    struct virtio_vsock_hdr_mrg_rxbuf hdr;
> > +    u8 data[];
> > +};
> > +\end{lstlisting}
> > +
> >   Virtqueue buffers for outgoing packets are read-only. Virtqueue buffe=
rs for
> >   incoming packets are write-only.
> >
> > +When transmitting packets to the device, \field{num_buffers} is not us=
ed.
> > +
> > +\begin{enumerate}
> > +\item \field{num_buffers} indicates how many descriptors
>
>
> Similarly, I think what we want here is "buffers" instead of "descriptors=
".

Sure. Thanks.

> Thanks
>
>
> > +  this packet is spread over (including this one).
> > +  This is valid only if VIRTIO_VSOCK_F_MRG_RXBUF is negotiated.
> > +  This allows receipt of large packets without having to allocate larg=
e
> > +  buffers: a packet that does not fit in a single buffer can flow
> > +  over to the next buffer, and so on. In this case, there will be
> > +  at least \field{num_buffers} used buffers in the virtqueue, and the =
device
> > +  chains them together to form a single packet in a way similar to
> > +  how it would store it in a single buffer spread over multiple
> > +  descriptors.
> > +  The other buffers will not begin with a struct virtio_vsock_hdr.
> > +
> > +  If VIRTIO_VSOCK_F_MRG_RXBUF is not negotiated, then only one
> > +  descriptor is used.
> > +
> > +\item If
> > +  \field{num_buffers} is one, then the entire packet will be
> > +  contained within this buffer, immediately following the struct
> > +  virtio_vsock_hdr.
> > +\end{enumerate}
> > +
> >   \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{=
Device Types / Socket Device / Device Operation / Receive and Transmit}
> >
> >   The \field{guest_cid} configuration field MUST be used as the source =
CID when
> > @@ -213,6 +276,19 @@ \subsubsection{Receive and Transmit}\label{sec:Dev=
ice Types / Socket Device / De
> >   A VIRTIO_VSOCK_OP_RST reply MUST be sent if a packet is received with=
 an
> >   unknown \field{type} value.
> >
> > +If VIRTIO_VSOCK_F_MRG_RXBUF has been negotiated, the device MUST set
> > +\field{num_buffers} to indicate the number of buffers
> > +the packet (including the header) is spread over.
> > +
> > +If a receive packet is spread over multiple buffers, the device
> > +MUST use all buffers but the last (i.e. the first $\field{num_buffers}=
 -
> > +1$ buffers) completely up to the full length of each buffer
> > +supplied by the driver.
> > +
> > +The device MUST use all buffers used by a single receive
> > +packet together, such that at least \field{num_buffers} are
> > +observed by driver as used.
> > +
> >   \subsubsection{Stream Sockets}\label{sec:Device Types / Socket Device=
 / Device Operation / Stream Sockets}
> >
> >   Connections are established by sending a VIRTIO_VSOCK_OP_REQUEST pack=
et. If a
>

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

