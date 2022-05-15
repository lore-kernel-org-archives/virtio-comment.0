Return-Path: <virtio-comment-return-3018-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3B6DB9860E2
	for <virtio-comment@lists.oasis-open.org>; Sun, 15 May 2022 14:53:58 +0000 (UTC)
MIME-Version: 1.0
References: <20220512080739.1952344-1-alvaro.karsz@solid-run.com>
 <1652353490.5336473-1-xuanzhuo@linux.alibaba.com> <CAJs=3_Ay=2yYFWYuSetoh0or+8Acb1_Sjw2jG5CQqAwy+B=9uA@mail.gmail.com>
In-Reply-To: <CAJs=3_Ay=2yYFWYuSetoh0or+8Acb1_Sjw2jG5CQqAwy+B=9uA@mail.gmail.com>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Sun, 15 May 2022 17:53:21 +0300
Message-ID: <CAJs=3_BTYnE7Z1C58c-A=HARfiFRDDHrZJGf2_gfteUdiJ3cRg@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH] Introduction of Virtio Network device
 interrupt coalescing feature
Content-Type: text/plain; charset="UTF-8"
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,
Github issue was opened for this patch.
https://github.com/oasis-tcs/virtio-spec/issues/141

On Thu, May 12, 2022 at 2:19 PM Alvaro Karsz <alvaro.karsz@solid-run.com> wrote:
>
> Hi,
>
>> I would like to know what scenarios this function can be used in, what problems
>> can be solved or what benefits can be obtained?
>
>
> One example is using ethtool command to configure these parameters on a VirtIO network compatible device.
> You could use the following command on the host to adjust the interrupt coalescing parameters:
>
>  $ ethtool -C <interface> tx-usecs X  rx-usecs Y  tx-frames Z  rx-frames W
>
> I'm working on a Network compatible device which can coalesce interrupts, but there is no interface to adjust the usecs and frames parameters.
> Having this command would give an interface to change these parameters on runtime.
>
>
>
> On Thu, May 12, 2022 at 2:06 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>>
>> On Thu, 12 May 2022 11:07:39 +0300, Alvaro Karsz <alvaro.karsz@solid-run.com> wrote:
>> > Control a network device interrupt coalescing parameters using the control virtqueue.
>> > A new control class was added: VIRTIO_NET_CTRL_INTR_COAL.
>> >
>> > This class provides 2 commands:
>> > - VIRTIO_NET_CTRL_INTR_COAL_USECS_SET:
>> >   Ask the network device to change the rx-usecs and tx-usecs parameters.
>> >   rx-usecs - Time to delay an RX interrupt after packet arrival in microseconds.
>> >   tx-usecs - Time to delay a TX interrupt after a sending a packet in microseconds.
>> >
>> > - VIRTIO_NET_CTRL_INTR_COAL_FRAMES_SET:
>> >   Ask the network device to change the rx-max-frames and tx-max-frames parameters.
>> >   rx-max-frames - Number of packets to delay an RX interrupt after packet arrival.
>> >   tx-max-frames - Number of packets to delay a TX interrupt after sending a packet.
>> >
>>
>> I would like to know what scenarios this function can be used in, what problems
>> can be solved or what benefits can be obtained?
>>
>> Thanks.
>>
>> >
>> > Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
>> > ---
>> >  content.tex | 41 +++++++++++++++++++++++++++++++++++++++++
>> >  1 file changed, 41 insertions(+)
>> >
>> > diff --git a/content.tex b/content.tex
>> > index 7508dd1..a70cb27 100644
>> > --- a/content.tex
>> > +++ b/content.tex
>> > @@ -3084,6 +3084,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>> >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>> >      channel.
>> >
>> > +\item[VIRTIO_NET_F_INTR_COAL(55)] Device supports interrupt coalescing.
>> > +
>> >  \item[VIRTIO_NET_F_HOST_USO (56)] Device can receive USO packets. Unlike UFO
>> >   (fragmenting the packet) the USO splits large UDP packet
>> >   to several segments when each of these smaller packets has UDP header.
>> > @@ -3129,6 +3131,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>> >  \item[VIRTIO_NET_F_GUEST_ANNOUNCE] Requires VIRTIO_NET_F_CTRL_VQ.
>> >  \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
>> >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
>> > +\item[VIRTIO_NET_F_INTR_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
>> >  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
>> >  \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
>> >  \end{description}
>> > @@ -4464,6 +4467,44 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>> >  (necessarily when not using the legacy interface) little-endian.
>> >
>> >
>> > +\paragraph{Interrupt Coalescing}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Interrupt Coalescing}
>> > +
>> > +If the VIRTIO_NET_F_INTR_COAL feature is negotiated, the driver can
>> > +send control commands for dynamically changing the coalescing parameters.
>> > +
>> > +\begin{lstlisting}
>> > +struct virtio_net_ctrl_coal_usec {
>> > +    le32 tx_usecs;
>> > +    le32 rx_usecs;
>> > +};
>> > +
>> > +struct virtio_net_ctrl_coal_frames {
>> > +    le32 tx_frames_max;
>> > +    le32 rx_frames_max;
>> > +};
>> > +
>> > +#define VIRTIO_NET_CTRL_INTR_COAL 6
>> > + #define VIRTIO_NET_CTRL_INTR_COAL_USECS_SET  0
>> > + #define VIRTIO_NET_CTRL_INTR_COAL_FRAMES_SET 1
>> > +\end{lstlisting}
>> > +
>> > +The class VIRTIO_NET_CTRL_INTR_COAL has 2 commands:
>> > +\begin{itemize}
>> > +\item VIRTIO_NET_CTRL_INTR_COAL_USECS_SET: set the rx-usecs (time to delay an RX interrupt after packet arrival in microseconds) and tx-usecs (time to delay a TX interrupt after a sending a packet in microseconds) parameters.
>> > +\item VIRTIO_NET_CTRL_INTR_COAL_FRAMES_SET: set the rx-max-frames (number of packets to delay an RX interrupt after packet arrival) and tx-max-frames (number of packets to delay a TX interrupt after sending a packet) parameters.
>> > +\end{itemize}
>> > +
>> > +\drivernormative{\subparagraph}{Interrupt Coalescing}{Device Types / Network Device / Device Operation / Control Virtqueue / Interrupt Coalescing}
>> > +
>> > +
>> > +A driver MUST NOT send to the device VIRTIO_NET_CTRL_INTR_COAL commands if the VIRTIO_NET_F_INTR_COAL feature
>> > +has not been negotiated.
>> > +
>> > +\devicenormative{\subparagraph}{Interrupt Coalescing}{Device Types / Network Device / Device Operation / Control Virtqueue / Interrupt Coalescing}
>> > +
>> > +A device SHOULD respond to the VIRTIO_NET_CTRL_INTR_COAL commands with VIRTIO_NET_ERR if was not able to change the parameters.
>> > +
>> > +
>> >  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>> >  Types / Network Device / Legacy Interface: Framing Requirements}
>> >
>> > --
>> > 2.32.0
>> >
>> > This publicly archived list offers a means to provide input to the
>> > OASIS Virtual I/O Device (VIRTIO) TC.
>> >
>> > In order to verify user consent to the Feedback License terms and
>> > to minimize spam in the list archive, subscription is required
>> > before posting.
>> >
>> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>> > List help: virtio-comment-help@lists.oasis-open.org
>> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
>> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>> > Committee: https://www.oasis-open.org/committees/virtio/
>> > Join OASIS: https://www.oasis-open.org/join/
>> >
>
>
>
> --
>
>
> Alvaro Karsz, Software
> +972-50-7696862| https://www.solid-run.com



--

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

