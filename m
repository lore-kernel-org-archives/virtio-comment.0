Return-Path: virtio-comment-return-987-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 94281985E4D
	for <virtio-comment@lists.oasis-open.org>; Wed, 11 Dec 2019 16:35:06 +0000 (UTC)
Date: Wed, 11 Dec 2019 11:34:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191211113112-mutt-send-email-mst@kernel.org>
References: <20191203183212.1721642-1-yuri.benditovich@daynix.com>
 <20191203152148-mutt-send-email-mst@kernel.org>
 <471210655.12237442.1575436801606.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
In-Reply-To: <471210655.12237442.1575436801606.JavaMail.zimbra@redhat.com>
Subject: Re: [virtio-comment] Re: [PATCH] virtio-net: define feature of
 per-packet RSS hash delivery
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Yuri Benditovich <ybendito@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Dec 04, 2019 at 12:20:01AM -0500, Yuri Benditovich wrote:
>=20
>=20
> =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81
>=20
>     From: "Michael S. Tsirkin" <mst@redhat.com>
>     To: "Yuri Benditovich" <yuri.benditovich@daynix.com>
>     Cc: virtio-comment@lists.oasis-open.org
>     Sent: Tuesday, December 3, 2019 10:25:30 PM
>     Subject: [virtio-comment] Re: [PATCH] virtio-net: define feature of
>     per-packet RSS hash delivery
>=20
>     On Tue, Dec 03, 2019 at 08:32:12PM +0200, Yuri Benditovich wrote:
>     > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/66
>     > Conditional extending of virtio header structure to deliver
>     > packet's hash and hash type used for calculation.
>     >
>     > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
>=20
>     Functionally this looks mostly good. But we need to change the
>     way it's documented slightly.
>=20
> Probably, because the RSS patch is not merged yet.
>=20
>=20
>     > ---
>     >  content.tex | 24 ++++++++++++++++++++++++
>     >  1 file changed, 24 insertions(+)
>     >
>     > diff --git a/content.tex b/content.tex
>     > index 01be7df..44975e4 100644
>     > --- a/content.tex
>     > +++ b/content.tex
>     > @@ -2811,6 +2811,9 @@ \subsection{Feature bits}\label{sec:Device Ty=
pes /
>     Network Device / Feature bits
>     >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through cont=
rol
>     >      channel.
>     > =20
>     > +\item[VIRTIO_NET_F_HASH_REPORT(58)] Device can report per-packet h=
ash
>     value
>     > +    and a type of calculated hash
>     > +
>     >  \item[VIRTIO_NET_F_RSS(60)] Device supports RSS (receive-side scal=
ing)
>     >      with Toeplitz hash calculation and configurable hash parameter=
s for
>     receive steering
>     > =20
>     > @@ -2844,6 +2847,8 @@ \subsubsection{Feature bit requirements}\labe=
l
>     {sec:Device Types / Network Device
>     >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
>     >  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or
>     VIRTIO_NET_F_HOST_TSO6.
>     >  \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
>     > +\item[VIRTIO_NET_F_HASH_REPORT] Requires VIRTIO_NET_F_RSS.
>     > +
>     >  \end{description}
>     > =20
>     >  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Ty=
pes /
>     Network Device / Feature bits / Legacy Interface: Feature bits}
>     > @@ -3071,6 +3076,8 @@ \subsection{Device Operation}\label{sec:Devic=
e
>     Types / Network Device / Device O
>     >          le16 csum_start;
>     >          le16 csum_offset;
>     >          le16 num_buffers;
>     > +        le32 hash_value; (Only if VIRTIO_NET_F_HASH_REPORT negotia=
ted)
>     > +        le16 hash_type; (Only if VIRTIO_NET_F_HASH_REPORT negotiat=
ed)
>     >  };
>     >  \end{lstlisting}
>     > =20
>     > @@ -3330,6 +3337,15 @@ \subsubsection{Processing of Incoming Packet=
s}\
>     label{sec:Device Types / Network
>     >    set: if so, device has validated the packet checksum.
>     >    In case of multiple encapsulated protocols, one level of checksu=
ms
>     >    has been validated.
>     > +\item If VIRTIO_NET_F_HASH_REPORT was negotiated and a device has
>     calculated
>     > +  a hash for the packet, \field{hash_value} contains calculated ha=
sh
>     value and
>     > +  \field{hash_type} contains exact hash type.
>     > +
>     > +  If the hash was not calculated, \field{hash_type} contains zero.
>     > +
>     > +  For defined hash types and their meaning, see \ref{sec:Device Ty=
pes /
>     Network Device / Device configuration layout / RSS}.
>     > +
>     > +  For the procedure of hash calculation, see \ref{sec:Device Types=
 /
>     Network Device / Device Operation / Control Virtqueue / Receive-side
>     scaling (RSS) / RSS hash types}.
>     >  \end{enumerate}
>     > =20
>     >  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN
>     > @@ -3909,6 +3925,14 @@ \subsubsection{Control Virtqueue}\label{sec:=
Device
>     Types / Network Device / Devi
>     >  \item Else skip IPv6 extension headers and calculate the hash as d=
efined
>     above for IPv6 packet without extension headers
>     >  \end{itemize}
>     > =20
>     > +If VIRTIO_NET_F_HASH_REPORT was negotiated, the device reports
>     calculated hash information in fields of virtio_net_hdr as follows:
>     > +
>     > +Exact hash type is populated in \field{hash_type}
>     > +
>     > +Hash value is populated in \field{hash_value}
>     > +
>     > +If, due to any reason, the device did not calculate the hash, it s=
ets \
>     field{hash_type} to zero.
>     > +
>     >  \drivernormative{\subparagraph}{Setting RSS parameters}{Device Typ=
es /
>     Network Device / Device Operation / Control Virtqueue / Receive-side
>     scaling (RSS) }
>     > =20
>     >  A driver MUST NOT send the VIRTIO_NET_CTRL_MQ_RSS_CONFIG command i=
f the
>     feature VIRTIO_NET_F_RSS has not been negotiated.
>=20
>=20
>     This is understandably a minimal change, but imho messes things up:
>     hash calculation is no longer part of RSS so really should be moved
>     from out of there.
>=20
> Please advise why "hash calculation is no longer part of RSS".

I might be misunderstanding things. It looks like with this
one can enable hash even with a single RX queue.
No?

>=20
>=20
>     So we'd have a chapter for hash calculation, defining hash types
>     etc.
>=20
> A chapter for hash calculation is in previous patch
> https://lists.oasis-open.org/archives/virtio-comment/201911/msg00014.html
>=20

Can't see it there. Do you mean
+\subparagraph{RSS hash types}\label{sec:Device Types / Network Device / De=
vice Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS hash =
types}
?
Sure, what I am saying it needs to be moved from out of RSS then.

>=20
>     Then both RSS and the new chapter refer to that.
>=20
>     Also, I am guessing supported hash types should be valid
>     in config space with the new feature - isn't that right?
>=20
> Yes, of course.

So we need to say this in the spec I think.

> But this is not related to hash delivery.
> Packet hash is calculated according to allowed hash types.
> If hash delivery is negotiated, the device reports the calculated hash ty=
pe
> which is, naturally, one of valid ones.
>=20
>=20
>=20
>     > --
>     > 2.17.2
>=20
>=20
>     This publicly archived list offers a means to provide input to the
>     OASIS Virtual I/O Device (VIRTIO) TC.
>=20
>     In order to verify user consent to the Feedback License terms and
>     to minimize spam in the list archive, subscription is required
>     before posting.
>=20
>     Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>     Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>     List help: virtio-comment-help@lists.oasis-open.org
>     List archive: https://lists.oasis-open.org/archives/virtio-comment/
>     Feedback License: https://www.oasis-open.org/who/ipr/feedback_license=
.pdf
>     List Guidelines: https://www.oasis-open.org/policies-guidelines/
>     mailing-lists
>     Committee: https://www.oasis-open.org/committees/virtio/
>     Join OASIS: https://www.oasis-open.org/join/
>=20
>=20
>=20


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

