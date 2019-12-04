Return-Path: virtio-comment-return-983-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 19DC298603B
	for <virtio-comment@lists.oasis-open.org>; Wed,  4 Dec 2019 05:20:08 +0000 (UTC)
Date: Wed, 4 Dec 2019 00:20:01 -0500 (EST)
From: Yuri Benditovich <ybendito@redhat.com>
Message-ID: <471210655.12237442.1575436801606.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191203152148-mutt-send-email-mst@kernel.org>
References: <20191203183212.1721642-1-yuri.benditovich@daynix.com> <20191203152148-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH] virtio-net: define feature of
 per-packet RSS hash delivery
Content-Type: multipart/alternative; 
	boundary="----=_Part_12237441_1660184818.1575436801605"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

------=_Part_12237441_1660184818.1575436801605
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

----- Original Message -----

> From: "Michael S. Tsirkin" <mst@redhat.com>
> To: "Yuri Benditovich" <yuri.benditovich@daynix.com>
> Cc: virtio-comment@lists.oasis-open.org
> Sent: Tuesday, December 3, 2019 10:25:30 PM
> Subject: [virtio-comment] Re: [PATCH] virtio-net: define feature of
> per-packet RSS hash delivery

> On Tue, Dec 03, 2019 at 08:32:12PM +0200, Yuri Benditovich wrote:
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/66
> > Conditional extending of virtio header structure to deliver
> > packet's hash and hash type used for calculation.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>

> Functionally this looks mostly good. But we need to change the
> way it's documented slightly.

Probably, because the RSS patch is not merged yet.=20

> > ---
> > content.tex | 24 ++++++++++++++++++++++++
> > 1 file changed, 24 insertions(+)
> >
> > diff --git a/content.tex b/content.tex
> > index 01be7df..44975e4 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2811,6 +2811,9 @@ \subsection{Feature bits}\label{sec:Device Types =
/
> > Network Device / Feature bits
> > \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
> > channel.
> >
> > +\item[VIRTIO_NET_F_HASH_REPORT(58)] Device can report per-packet hash
> > value
> > + and a type of calculated hash
> > +
> > \item[VIRTIO_NET_F_RSS(60)] Device supports RSS (receive-side scaling)
> > with Toeplitz hash calculation and configurable hash parameters for rec=
eive
> > steering
> >
> > @@ -2844,6 +2847,8 @@ \subsubsection{Feature bit
> > requirements}\label{sec:Device Types / Network Device
> > \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
> > \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or
> > VIRTIO_NET_F_HOST_TSO6.
> > \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
> > +\item[VIRTIO_NET_F_HASH_REPORT] Requires VIRTIO_NET_F_RSS.
> > +
> > \end{description}
> >
> > \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types /
> > Network Device / Feature bits / Legacy Interface: Feature bits}
> > @@ -3071,6 +3076,8 @@ \subsection{Device Operation}\label{sec:Device Ty=
pes
> > / Network Device / Device O
> > le16 csum_start;
> > le16 csum_offset;
> > le16 num_buffers;
> > + le32 hash_value; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
> > + le16 hash_type; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
> > };
> > \end{lstlisting}
> >
> > @@ -3330,6 +3337,15 @@ \subsubsection{Processing of Incoming
> > Packets}\label{sec:Device Types / Network
> > set: if so, device has validated the packet checksum.
> > In case of multiple encapsulated protocols, one level of checksums
> > has been validated.
> > +\item If VIRTIO_NET_F_HASH_REPORT was negotiated and a device has
> > calculated
> > + a hash for the packet, \field{hash_value} contains calculated hash va=
lue
> > and
> > + \field{hash_type} contains exact hash type.
> > +
> > + If the hash was not calculated, \field{hash_type} contains zero.
> > +
> > + For defined hash types and their meaning, see \ref{sec:Device Types /
> > Network Device / Device configuration layout / RSS}.
> > +
> > + For the procedure of hash calculation, see \ref{sec:Device Types /
> > Network Device / Device Operation / Control Virtqueue / Receive-side
> > scaling (RSS) / RSS hash types}.
> > \end{enumerate}
> >
> > Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN
> > @@ -3909,6 +3925,14 @@ \subsubsection{Control Virtqueue}\label{sec:Devi=
ce
> > Types / Network Device / Devi
> > \item Else skip IPv6 extension headers and calculate the hash as define=
d
> > above for IPv6 packet without extension headers
> > \end{itemize}
> >
> > +If VIRTIO_NET_F_HASH_REPORT was negotiated, the device reports calcula=
ted
> > hash information in fields of virtio_net_hdr as follows:
> > +
> > +Exact hash type is populated in \field{hash_type}
> > +
> > +Hash value is populated in \field{hash_value}
> > +
> > +If, due to any reason, the device did not calculate the hash, it sets
> > \field{hash_type} to zero.
> > +
> > \drivernormative{\subparagraph}{Setting RSS parameters}{Device Types /
> > Network Device / Device Operation / Control Virtqueue / Receive-side
> > scaling (RSS) }
> >
> > A driver MUST NOT send the VIRTIO_NET_CTRL_MQ_RSS_CONFIG command if the
> > feature VIRTIO_NET_F_RSS has not been negotiated.

> This is understandably a minimal change, but imho messes things up:
> hash calculation is no longer part of RSS so really should be moved
> from out of there.
Please advise why "hash calculation is no longer part of RSS".=20

> So we'd have a chapter for hash calculation, defining hash types
> etc.
A chapter for hash calculation is in previous patch=20
https://lists.oasis-open.org/archives/virtio-comment/201911/msg00014.html=
=20

> Then both RSS and the new chapter refer to that.

> Also, I am guessing supported hash types should be valid
> in config space with the new feature - isn't that right?
Yes, of course. But this is not related to hash delivery.=20
Packet hash is calculated according to allowed hash types.=20
If hash delivery is negotiated, the device reports the calculated hash type=
 which is, naturally, one of valid ones.=20

> > --
> > 2.17.2

> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.

> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.

> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/

------=_Part_12237441_1660184818.1575436801605
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: courier new,courier,monaco,monospace=
,sans-serif; font-size: 12pt; color: #000000"><div><br></div><div><br></div=
><hr id=3D"zwchr"><blockquote style=3D"border-left:2px solid #1010FF;margin=
-left:5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;=
text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;=
"><b>From: </b>"Michael S. Tsirkin" &lt;mst@redhat.com&gt;<br><b>To: </b>"Y=
uri Benditovich" &lt;yuri.benditovich@daynix.com&gt;<br><b>Cc: </b>virtio-c=
omment@lists.oasis-open.org<br><b>Sent: </b>Tuesday, December 3, 2019 10:25=
:30 PM<br><b>Subject: </b>[virtio-comment] Re: [PATCH] virtio-net: define f=
eature of per-packet RSS hash delivery<br><div><br></div>On Tue, Dec 03, 20=
19 at 08:32:12PM +0200, Yuri Benditovich wrote:<br>&gt; Fixes: https://gith=
ub.com/oasis-tcs/virtio-spec/issues/66<br>&gt; Conditional extending of vir=
tio header structure to deliver<br>&gt; packet's hash and hash type used fo=
r calculation.<br>&gt; <br>&gt; Signed-off-by: Yuri Benditovich &lt;yuri.be=
nditovich@daynix.com&gt;<br><div><br></div>Functionally this looks mostly g=
ood. But we need to change the<br>way it's documented slightly.<br></blockq=
uote><div>Probably, because the RSS patch is not merged yet.<br></div><div>=
<br></div><blockquote style=3D"border-left:2px solid #1010FF;margin-left:5p=
x;padding-left:5px;color:#000;font-weight:normal;font-style:normal;text-dec=
oration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;">&gt; -=
--<br>&gt; &nbsp;content.tex | 24 ++++++++++++++++++++++++<br>&gt; &nbsp;1 =
file changed, 24 insertions(+)<br>&gt; <br>&gt; diff --git a/content.tex b/=
content.tex<br>&gt; index 01be7df..44975e4 100644<br>&gt; --- a/content.tex=
<br>&gt; +++ b/content.tex<br>&gt; @@ -2811,6 +2811,9 @@ \subsection{Featur=
e bits}\label{sec:Device Types / Network Device / Feature bits<br>&gt; &nbs=
p;\item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control<br>=
&gt; &nbsp; &nbsp; &nbsp;channel.<br>&gt; &nbsp;<br>&gt; +\item[VIRTIO_NET_=
F_HASH_REPORT(58)] Device can report per-packet hash value<br>&gt; + &nbsp;=
 &nbsp;and a type of calculated hash<br>&gt; +<br>&gt; &nbsp;\item[VIRTIO_N=
ET_F_RSS(60)] Device supports RSS (receive-side scaling)<br>&gt; &nbsp; &nb=
sp; &nbsp;with Toeplitz hash calculation and configurable hash parameters f=
or receive steering<br>&gt; &nbsp;<br>&gt; @@ -2844,6 +2847,8 @@ \subsubsec=
tion{Feature bit requirements}\label{sec:Device Types / Network Device<br>&=
gt; &nbsp;\item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.<=
br>&gt; &nbsp;\item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 o=
r VIRTIO_NET_F_HOST_TSO6.<br>&gt; &nbsp;\item[VIRTIO_NET_F_RSS] Requires VI=
RTIO_NET_F_CTRL_VQ.<br>&gt; +\item[VIRTIO_NET_F_HASH_REPORT] Requires VIRTI=
O_NET_F_RSS.<br>&gt; +<br>&gt; &nbsp;\end{description}<br>&gt; &nbsp;<br>&g=
t; &nbsp;\subsubsection{Legacy Interface: Feature bits}\label{sec:Device Ty=
pes / Network Device / Feature bits / Legacy Interface: Feature bits}<br>&g=
t; @@ -3071,6 +3076,8 @@ \subsection{Device Operation}\label{sec:Device Typ=
es / Network Device / Device O<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le=
16 csum_start;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le16 csum_offset;<=
br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le16 num_buffers;<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;le32 hash_value; (Only if VIRTIO_NET_F_HASH_REPORT ne=
gotiated)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;le16 hash_type; (Only if VIR=
TIO_NET_F_HASH_REPORT negotiated)<br>&gt; &nbsp;};<br>&gt; &nbsp;\end{lstli=
sting}<br>&gt; &nbsp;<br>&gt; @@ -3330,6 +3337,15 @@ \subsubsection{Process=
ing of Incoming Packets}\label{sec:Device Types / Network<br>&gt; &nbsp; &n=
bsp;set: if so, device has validated the packet checksum.<br>&gt; &nbsp; &n=
bsp;In case of multiple encapsulated protocols, one level of checksums<br>&=
gt; &nbsp; &nbsp;has been validated.<br>&gt; +\item If VIRTIO_NET_F_HASH_RE=
PORT was negotiated and a device has calculated<br>&gt; + &nbsp;a hash for =
the packet, \field{hash_value} contains calculated hash value and<br>&gt; +=
 &nbsp;\field{hash_type} contains exact hash type.<br>&gt; +<br>&gt; + &nbs=
p;If the hash was not calculated, \field{hash_type} contains zero.<br>&gt; =
+<br>&gt; + &nbsp;For defined hash types and their meaning, see \ref{sec:De=
vice Types / Network Device / Device configuration layout / RSS}.<br>&gt; +=
<br>&gt; + &nbsp;For the procedure of hash calculation, see \ref{sec:Device=
 Types / Network Device / Device Operation / Control Virtqueue / Receive-si=
de scaling (RSS) / RSS hash types}.<br>&gt; &nbsp;\end{enumerate}<br>&gt; &=
nbsp;<br>&gt; &nbsp;Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP =
and ECN<br>&gt; @@ -3909,6 +3925,14 @@ \subsubsection{Control Virtqueue}\la=
bel{sec:Device Types / Network Device / Devi<br>&gt; &nbsp;\item Else skip =
IPv6 extension headers and calculate the hash as defined above for IPv6 pac=
ket without extension headers<br>&gt; &nbsp;\end{itemize}<br>&gt; &nbsp;<br=
>&gt; +If VIRTIO_NET_F_HASH_REPORT was negotiated, the device reports calcu=
lated hash information in fields of virtio_net_hdr as follows:<br>&gt; +<br=
>&gt; +Exact hash type is populated in \field{hash_type}<br>&gt; +<br>&gt; =
+Hash value is populated in \field{hash_value}<br>&gt; +<br>&gt; +If, due t=
o any reason, the device did not calculate the hash, it sets \field{hash_ty=
pe} to zero.<br>&gt; +<br>&gt; &nbsp;\drivernormative{\subparagraph}{Settin=
g RSS parameters}{Device Types / Network Device / Device Operation / Contro=
l Virtqueue / Receive-side scaling (RSS) }<br>&gt; &nbsp;<br>&gt; &nbsp;A d=
river MUST NOT send the VIRTIO_NET_CTRL_MQ_RSS_CONFIG command if the featur=
e VIRTIO_NET_F_RSS has not been negotiated.<br><div><br></div><br>This is u=
nderstandably a minimal change, but imho messes things up:<br>hash calculat=
ion is no longer part of RSS so really should be moved<br>from out of there=
.</blockquote><div>Please advise why "hash calculation is no longer part of=
 RSS".<br></div><div><br></div><blockquote style=3D"border-left:2px solid #=
1010FF;margin-left:5px;padding-left:5px;color:#000;font-weight:normal;font-=
style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;fo=
nt-size:12pt;"><br>So we'd have a chapter for hash calculation, defining ha=
sh types<br>etc.</blockquote><div>A chapter for hash calculation is in prev=
ious patch<br></div><div>https://lists.oasis-open.org/archives/virtio-comme=
nt/201911/msg00014.html</div><blockquote style=3D"border-left:2px solid #10=
10FF;margin-left:5px;padding-left:5px;color:#000;font-weight:normal;font-st=
yle:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font=
-size:12pt;"><br><div><br></div>Then both RSS and the new chapter refer to =
that.<br><div><br></div>Also, I am guessing supported hash types should be =
valid<br>in config space with the new feature - isn't that right?</blockquo=
te><div>Yes, of course. But this is not related to hash delivery.<br></div>=
<div>Packet hash is calculated according to allowed hash types.<br></div><d=
iv>If hash delivery is negotiated, the device reports the calculated hash t=
ype which is, naturally, one of valid ones.<br></div><blockquote style=3D"b=
order-left:2px solid #1010FF;margin-left:5px;padding-left:5px;color:#000;fo=
nt-weight:normal;font-style:normal;text-decoration:none;font-family:Helveti=
ca,Arial,sans-serif;font-size:12pt;"><br><div><br></div>&gt; -- <br>&gt; 2.=
17.2<br><div><br></div><br>This publicly archived list offers a means to pr=
ovide input to the
<br>OASIS Virtual I/O Device (VIRTIO) TC.
<br><br>In order to verify user consent to the Feedback License terms and
<br>to minimize spam in the list archive, subscription is required
<br>before posting.
<br><br>Subscribe: virtio-comment-subscribe@lists.oasis-open.org
<br>Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
<br>List help: virtio-comment-help@lists.oasis-open.org
<br>List archive: https://lists.oasis-open.org/archives/virtio-comment/
<br>Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
<br>List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing=
-lists
<br>Committee: https://www.oasis-open.org/committees/virtio/
<br>Join OASIS: https://www.oasis-open.org/join/<br><div><br></div></blockq=
uote><div><br></div></div></body></html>
------=_Part_12237441_1660184818.1575436801605--

