Return-Path: <virtio-comment-return-3014-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 99B2F98661F
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 May 2022 11:19:44 +0000 (UTC)
MIME-Version: 1.0
References: <20220512080739.1952344-1-alvaro.karsz@solid-run.com> <1652353490.5336473-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1652353490.5336473-1-xuanzhuo@linux.alibaba.com>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Thu, 12 May 2022 14:19:07 +0300
Message-ID: <CAJs=3_Ay=2yYFWYuSetoh0or+8Acb1_Sjw2jG5CQqAwy+B=9uA@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH] Introduction of Virtio Network device
 interrupt coalescing feature
Content-Type: multipart/alternative; boundary="000000000000071a8c05decebc18"
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--000000000000071a8c05decebc18
Content-Type: text/plain; charset="UTF-8"

Hi,

I would like to know what scenarios this function can be used in, what
> problems
> can be solved or what benefits can be obtained?


One example is using ethtool command to configure these parameters on a
VirtIO network compatible device.
You could use the following command on the host to adjust the interrupt
coalescing parameters:

 $ ethtool -C <interface> tx-usecs X  rx-usecs Y  tx-frames Z  rx-frames W

I'm working on a Network compatible device which can coalesce interrupts,
but there is no interface to adjust the usecs and frames parameters.
Having this command would give an interface to change these parameters on
runtime.



On Thu, May 12, 2022 at 2:06 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com>
wrote:

> On Thu, 12 May 2022 11:07:39 +0300, Alvaro Karsz <
> alvaro.karsz@solid-run.com> wrote:
> > Control a network device interrupt coalescing parameters using the
> control virtqueue.
> > A new control class was added: VIRTIO_NET_CTRL_INTR_COAL.
> >
> > This class provides 2 commands:
> > - VIRTIO_NET_CTRL_INTR_COAL_USECS_SET:
> >   Ask the network device to change the rx-usecs and tx-usecs parameters.
> >   rx-usecs - Time to delay an RX interrupt after packet arrival in
> microseconds.
> >   tx-usecs - Time to delay a TX interrupt after a sending a packet in
> microseconds.
> >
> > - VIRTIO_NET_CTRL_INTR_COAL_FRAMES_SET:
> >   Ask the network device to change the rx-max-frames and tx-max-frames
> parameters.
> >   rx-max-frames - Number of packets to delay an RX interrupt after
> packet arrival.
> >   tx-max-frames - Number of packets to delay a TX interrupt after
> sending a packet.
> >
>
> I would like to know what scenarios this function can be used in, what
> problems
> can be solved or what benefits can be obtained?
>
> Thanks.
>
> >
> > Signed-off-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
> > ---
> >  content.tex | 41 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/content.tex b/content.tex
> > index 7508dd1..a70cb27 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -3084,6 +3084,8 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits
> >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
> >      channel.
> >
> > +\item[VIRTIO_NET_F_INTR_COAL(55)] Device supports interrupt coalescing.
> > +
> >  \item[VIRTIO_NET_F_HOST_USO (56)] Device can receive USO packets.
> Unlike UFO
> >   (fragmenting the packet) the USO splits large UDP packet
> >   to several segments when each of these smaller packets has UDP header.
> > @@ -3129,6 +3131,7 @@ \subsubsection{Feature bit
> requirements}\label{sec:Device Types / Network Device
> >  \item[VIRTIO_NET_F_GUEST_ANNOUNCE] Requires VIRTIO_NET_F_CTRL_VQ.
> >  \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
> >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
> > +\item[VIRTIO_NET_F_INTR_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
> >  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or
> VIRTIO_NET_F_HOST_TSO6.
> >  \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
> >  \end{description}
> > @@ -4464,6 +4467,44 @@ \subsubsection{Control
> Virtqueue}\label{sec:Device Types / Network Device / Devi
> >  (necessarily when not using the legacy interface) little-endian.
> >
> >
> > +\paragraph{Interrupt Coalescing}\label{sec:Device Types / Network
> Device / Device Operation / Control Virtqueue / Interrupt Coalescing}
> > +
> > +If the VIRTIO_NET_F_INTR_COAL feature is negotiated, the driver can
> > +send control commands for dynamically changing the coalescing
> parameters.
> > +
> > +\begin{lstlisting}
> > +struct virtio_net_ctrl_coal_usec {
> > +    le32 tx_usecs;
> > +    le32 rx_usecs;
> > +};
> > +
> > +struct virtio_net_ctrl_coal_frames {
> > +    le32 tx_frames_max;
> > +    le32 rx_frames_max;
> > +};
> > +
> > +#define VIRTIO_NET_CTRL_INTR_COAL 6
> > + #define VIRTIO_NET_CTRL_INTR_COAL_USECS_SET  0
> > + #define VIRTIO_NET_CTRL_INTR_COAL_FRAMES_SET 1
> > +\end{lstlisting}
> > +
> > +The class VIRTIO_NET_CTRL_INTR_COAL has 2 commands:
> > +\begin{itemize}
> > +\item VIRTIO_NET_CTRL_INTR_COAL_USECS_SET: set the rx-usecs (time to
> delay an RX interrupt after packet arrival in microseconds) and tx-usecs
> (time to delay a TX interrupt after a sending a packet in microseconds)
> parameters.
> > +\item VIRTIO_NET_CTRL_INTR_COAL_FRAMES_SET: set the rx-max-frames
> (number of packets to delay an RX interrupt after packet arrival) and
> tx-max-frames (number of packets to delay a TX interrupt after sending a
> packet) parameters.
> > +\end{itemize}
> > +
> > +\drivernormative{\subparagraph}{Interrupt Coalescing}{Device Types /
> Network Device / Device Operation / Control Virtqueue / Interrupt
> Coalescing}
> > +
> > +
> > +A driver MUST NOT send to the device VIRTIO_NET_CTRL_INTR_COAL commands
> if the VIRTIO_NET_F_INTR_COAL feature
> > +has not been negotiated.
> > +
> > +\devicenormative{\subparagraph}{Interrupt Coalescing}{Device Types /
> Network Device / Device Operation / Control Virtqueue / Interrupt
> Coalescing}
> > +
> > +A device SHOULD respond to the VIRTIO_NET_CTRL_INTR_COAL commands with
> VIRTIO_NET_ERR if was not able to change the parameters.
> > +
> > +
> >  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
> >  Types / Network Device / Legacy Interface: Framing Requirements}
> >
> > --
> > 2.32.0
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License:
> https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > List Guidelines:
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> >
>


-- 


*Alvaro Karsz, *Software
+972-50-7696862| https://www.solid-run.com

--000000000000071a8c05decebc18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">I would like to know what scenarios this function can be used in=
, what problems<br>can be solved or what benefits can be obtained?</blockqu=
ote><div><br><div>One example is using ethtool command to configure these p=
arameters on a VirtIO network compatible device.</div><div>You could use th=
e following command on the host to adjust the interrupt coalescing paramete=
rs:</div><div><br></div><div>=C2=A0$ ethtool -C &lt;interface&gt; tx-usecs =
X=C2=A0 rx-usecs Y=C2=A0 tx-frames Z=C2=A0 rx-frames W<br></div><div><br></=
div><div>I&#39;m working on a Network compatible device which can coalesce=
=C2=A0interrupts, but there is no interface to adjust the usecs and frames =
parameters.</div><div>Having this command would give an interface to change=
 these parameters on runtime.</div><div><br></div><div><br></div></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, May 12, 2022 at 2:06 PM Xuan Zhuo &lt;<a href=3D"mailto:xuanzhuo@linux.=
alibaba.com">xuanzhuo@linux.alibaba.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Thu, 12 May 2022 11:07:39 +0300, =
Alvaro Karsz &lt;<a href=3D"mailto:alvaro.karsz@solid-run.com" target=3D"_b=
lank">alvaro.karsz@solid-run.com</a>&gt; wrote:<br>
&gt; Control a network device interrupt coalescing parameters using the con=
trol virtqueue.<br>
&gt; A new control class was added: VIRTIO_NET_CTRL_INTR_COAL.<br>
&gt;<br>
&gt; This class provides 2 commands:<br>
&gt; - VIRTIO_NET_CTRL_INTR_COAL_USECS_SET:<br>
&gt;=C2=A0 =C2=A0Ask the network device to change the rx-usecs and tx-usecs=
 parameters.<br>
&gt;=C2=A0 =C2=A0rx-usecs - Time to delay an RX interrupt after packet arri=
val in microseconds.<br>
&gt;=C2=A0 =C2=A0tx-usecs - Time to delay a TX interrupt after a sending a =
packet in microseconds.<br>
&gt;<br>
&gt; - VIRTIO_NET_CTRL_INTR_COAL_FRAMES_SET:<br>
&gt;=C2=A0 =C2=A0Ask the network device to change the rx-max-frames and tx-=
max-frames parameters.<br>
&gt;=C2=A0 =C2=A0rx-max-frames - Number of packets to delay an RX interrupt=
 after packet arrival.<br>
&gt;=C2=A0 =C2=A0tx-max-frames - Number of packets to delay a TX interrupt =
after sending a packet.<br>
&gt;<br>
<br>
I would like to know what scenarios this function can be used in, what prob=
lems<br>
can be solved or what benefits can be obtained?<br>
<br>
Thanks.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Alvaro Karsz &lt;<a href=3D"mailto:alvaro.karsz@solid-r=
un.com" target=3D"_blank">alvaro.karsz@solid-run.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 content.tex | 41 +++++++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 41 insertions(+)<br>
&gt;<br>
&gt; diff --git a/content.tex b/content.tex<br>
&gt; index 7508dd1..a70cb27 100644<br>
&gt; --- a/content.tex<br>
&gt; +++ b/content.tex<br>
&gt; @@ -3084,6 +3084,8 @@ \subsection{Feature bits}\label{sec:Device Types=
 / Network Device / Feature bits<br>
&gt;=C2=A0 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through co=
ntrol<br>
&gt;=C2=A0 =C2=A0 =C2=A0 channel.<br>
&gt;<br>
&gt; +\item[VIRTIO_NET_F_INTR_COAL(55)] Device supports interrupt coalescin=
g.<br>
&gt; +<br>
&gt;=C2=A0 \item[VIRTIO_NET_F_HOST_USO (56)] Device can receive USO packets=
. Unlike UFO<br>
&gt;=C2=A0 =C2=A0(fragmenting the packet) the USO splits large UDP packet<b=
r>
&gt;=C2=A0 =C2=A0to several segments when each of these smaller packets has=
 UDP header.<br>
&gt; @@ -3129,6 +3131,7 @@ \subsubsection{Feature bit requirements}\label{s=
ec:Device Types / Network Device<br>
&gt;=C2=A0 \item[VIRTIO_NET_F_GUEST_ANNOUNCE] Requires VIRTIO_NET_F_CTRL_VQ=
.<br>
&gt;=C2=A0 \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.<br>
&gt;=C2=A0 \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.=
<br>
&gt; +\item[VIRTIO_NET_F_INTR_COAL] Requires VIRTIO_NET_F_CTRL_VQ.<br>
&gt;=C2=A0 \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or V=
IRTIO_NET_F_HOST_TSO6.<br>
&gt;=C2=A0 \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.<br>
&gt;=C2=A0 \end{description}<br>
&gt; @@ -4464,6 +4467,44 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice Types / Network Device / Devi<br>
&gt;=C2=A0 (necessarily when not using the legacy interface) little-endian.=
<br>
&gt;<br>
&gt;<br>
&gt; +\paragraph{Interrupt Coalescing}\label{sec:Device Types / Network Dev=
ice / Device Operation / Control Virtqueue / Interrupt Coalescing}<br>
&gt; +<br>
&gt; +If the VIRTIO_NET_F_INTR_COAL feature is negotiated, the driver can<b=
r>
&gt; +send control commands for dynamically changing the coalescing paramet=
ers.<br>
&gt; +<br>
&gt; +\begin{lstlisting}<br>
&gt; +struct virtio_net_ctrl_coal_usec {<br>
&gt; +=C2=A0 =C2=A0 le32 tx_usecs;<br>
&gt; +=C2=A0 =C2=A0 le32 rx_usecs;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct virtio_net_ctrl_coal_frames {<br>
&gt; +=C2=A0 =C2=A0 le32 tx_frames_max;<br>
&gt; +=C2=A0 =C2=A0 le32 rx_frames_max;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define VIRTIO_NET_CTRL_INTR_COAL 6<br>
&gt; + #define VIRTIO_NET_CTRL_INTR_COAL_USECS_SET=C2=A0 0<br>
&gt; + #define VIRTIO_NET_CTRL_INTR_COAL_FRAMES_SET 1<br>
&gt; +\end{lstlisting}<br>
&gt; +<br>
&gt; +The class VIRTIO_NET_CTRL_INTR_COAL has 2 commands:<br>
&gt; +\begin{itemize}<br>
&gt; +\item VIRTIO_NET_CTRL_INTR_COAL_USECS_SET: set the rx-usecs (time to =
delay an RX interrupt after packet arrival in microseconds) and tx-usecs (t=
ime to delay a TX interrupt after a sending a packet in microseconds) param=
eters.<br>
&gt; +\item VIRTIO_NET_CTRL_INTR_COAL_FRAMES_SET: set the rx-max-frames (nu=
mber of packets to delay an RX interrupt after packet arrival) and tx-max-f=
rames (number of packets to delay a TX interrupt after sending a packet) pa=
rameters.<br>
&gt; +\end{itemize}<br>
&gt; +<br>
&gt; +\drivernormative{\subparagraph}{Interrupt Coalescing}{Device Types / =
Network Device / Device Operation / Control Virtqueue / Interrupt Coalescin=
g}<br>
&gt; +<br>
&gt; +<br>
&gt; +A driver MUST NOT send to the device VIRTIO_NET_CTRL_INTR_COAL comman=
ds if the VIRTIO_NET_F_INTR_COAL feature<br>
&gt; +has not been negotiated.<br>
&gt; +<br>
&gt; +\devicenormative{\subparagraph}{Interrupt Coalescing}{Device Types / =
Network Device / Device Operation / Control Virtqueue / Interrupt Coalescin=
g}<br>
&gt; +<br>
&gt; +A device SHOULD respond to the VIRTIO_NET_CTRL_INTR_COAL commands wit=
h VIRTIO_NET_ERR if was not able to change the parameters.<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 \subsubsection{Legacy Interface: Framing Requirements}\label{sec=
:Device<br>
&gt;=C2=A0 Types / Network Device / Legacy Interface: Framing Requirements}=
<br>
&gt;<br>
&gt; --<br>
&gt; 2.32.0<br>
&gt;<br>
&gt; This publicly archived list offers a means to provide input to the<br>
&gt; OASIS Virtual I/O Device (VIRTIO) TC.<br>
&gt;<br>
&gt; In order to verify user consent to the Feedback License terms and<br>
&gt; to minimize spam in the list archive, subscription is required<br>
&gt; before posting.<br>
&gt;<br>
&gt; Subscribe: <a href=3D"mailto:virtio-comment-subscribe@lists.oasis-open=
.org" target=3D"_blank">virtio-comment-subscribe@lists.oasis-open.org</a><b=
r>
&gt; Unsubscribe: <a href=3D"mailto:virtio-comment-unsubscribe@lists.oasis-=
open.org" target=3D"_blank">virtio-comment-unsubscribe@lists.oasis-open.org=
</a><br>
&gt; List help: <a href=3D"mailto:virtio-comment-help@lists.oasis-open.org"=
 target=3D"_blank">virtio-comment-help@lists.oasis-open.org</a><br>
&gt; List archive: <a href=3D"https://lists.oasis-open.org/archives/virtio-=
comment/" rel=3D"noreferrer" target=3D"_blank">https://lists.oasis-open.org=
/archives/virtio-comment/</a><br>
&gt; Feedback License: <a href=3D"https://www.oasis-open.org/who/ipr/feedba=
ck_license.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open=
.org/who/ipr/feedback_license.pdf</a><br>
&gt; List Guidelines: <a href=3D"https://www.oasis-open.org/policies-guidel=
ines/mailing-lists" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-=
open.org/policies-guidelines/mailing-lists</a><br>
&gt; Committee: <a href=3D"https://www.oasis-open.org/committees/virtio/" r=
el=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/committees/v=
irtio/</a><br>
&gt; Join OASIS: <a href=3D"https://www.oasis-open.org/join/" rel=3D"norefe=
rrer" target=3D"_blank">https://www.oasis-open.org/join/</a><br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr" style=3D"color=
:rgb(136,136,136)"><img src=3D"https://docs.google.com/uc?export=3Ddownload=
&amp;id=3D1KEpexWwt8xEzKfIcWs45f53v833z_qSu&amp;revid=3D0B683Hs8Rop-iakk2MU=
NPaCtsWlBQbEw4VVZDQzJ4OTFubEhFPQ"><br></div><div dir=3D"ltr" style=3D"color=
:rgb(136,136,136)"><br style=3D"color:rgb(117,117,117);font-family:Roboto,R=
obotoDraft,Helvetica,Arial,sans-serif;white-space:nowrap"><span style=3D"fo=
nt-size:12px"><b style=3D"color:rgb(221,75,57)">Alvaro Karsz,=C2=A0</b><fon=
t color=3D"#999999">Software</font></span><br><span style=3D"font-size:12px=
"><font color=3D"#808080">+972-50-7696862</font><span style=3D"color:rgb(22=
1,75,57)">|=C2=A0</span><a href=3D"https://www.solid-run.com/" rel=3D"nofol=
low" style=3D"color:rgb(128,128,128)" target=3D"_blank">https://www.solid-r=
un.com</a></span></div></div></div>

--000000000000071a8c05decebc18--

