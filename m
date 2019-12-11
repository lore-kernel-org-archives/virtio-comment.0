Return-Path: virtio-comment-return-988-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EAA23985EB5
	for <virtio-comment@lists.oasis-open.org>; Wed, 11 Dec 2019 17:42:16 +0000 (UTC)
MIME-Version: 1.0
References: <20191203183212.1721642-1-yuri.benditovich@daynix.com>
 <20191203152148-mutt-send-email-mst@kernel.org> <471210655.12237442.1575436801606.JavaMail.zimbra@redhat.com>
 <20191211113112-mutt-send-email-mst@kernel.org>
In-Reply-To: <20191211113112-mutt-send-email-mst@kernel.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Wed, 11 Dec 2019 19:41:59 +0200
Message-ID: <CAOEp5OdzmRTrZoC78kSoWS4g=XP2DNW-q0Y8jAsAWUDw9_u6Ew@mail.gmail.com>
Subject: Re: [virtio-comment] Re: [PATCH] virtio-net: define feature of
 per-packet RSS hash delivery
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yuri Benditovich <ybendito@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Dec 11, 2019 at 6:35 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Dec 04, 2019 at 12:20:01AM -0500, Yuri Benditovich wrote:
> >
> >
> > =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81
> >
> >     From: "Michael S. Tsirkin" <mst@redhat.com>
> >     To: "Yuri Benditovich" <yuri.benditovich@daynix.com>
> >     Cc: virtio-comment@lists.oasis-open.org
> >     Sent: Tuesday, December 3, 2019 10:25:30 PM
> >     Subject: [virtio-comment] Re: [PATCH] virtio-net: define feature of
> >     per-packet RSS hash delivery
> >
> >     On Tue, Dec 03, 2019 at 08:32:12PM +0200, Yuri Benditovich wrote:
> >     > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/66
> >     > Conditional extending of virtio header structure to deliver
> >     > packet's hash and hash type used for calculation.
> >     >
> >     > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> >
> >     Functionally this looks mostly good. But we need to change the
> >     way it's documented slightly.
> >
> > Probably, because the RSS patch is not merged yet.
> >
> >
> >     > ---
> >     >  content.tex | 24 ++++++++++++++++++++++++
> >     >  1 file changed, 24 insertions(+)
> >     >
> >     > diff --git a/content.tex b/content.tex
> >     > index 01be7df..44975e4 100644
> >     > --- a/content.tex
> >     > +++ b/content.tex
> >     > @@ -2811,6 +2811,9 @@ \subsection{Feature bits}\label{sec:Device =
Types /
> >     Network Device / Feature bits
> >     >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through co=
ntrol
> >     >      channel.
> >     >
> >     > +\item[VIRTIO_NET_F_HASH_REPORT(58)] Device can report per-packet=
 hash
> >     value
> >     > +    and a type of calculated hash
> >     > +
> >     >  \item[VIRTIO_NET_F_RSS(60)] Device supports RSS (receive-side sc=
aling)
> >     >      with Toeplitz hash calculation and configurable hash paramet=
ers for
> >     receive steering
> >     >
> >     > @@ -2844,6 +2847,8 @@ \subsubsection{Feature bit requirements}\la=
bel
> >     {sec:Device Types / Network Device
> >     >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
> >     >  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or
> >     VIRTIO_NET_F_HOST_TSO6.
> >     >  \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
> >     > +\item[VIRTIO_NET_F_HASH_REPORT] Requires VIRTIO_NET_F_RSS.
> >     > +
> >     >  \end{description}
> >     >
> >     >  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device =
Types /
> >     Network Device / Feature bits / Legacy Interface: Feature bits}
> >     > @@ -3071,6 +3076,8 @@ \subsection{Device Operation}\label{sec:Dev=
ice
> >     Types / Network Device / Device O
> >     >          le16 csum_start;
> >     >          le16 csum_offset;
> >     >          le16 num_buffers;
> >     > +        le32 hash_value; (Only if VIRTIO_NET_F_HASH_REPORT negot=
iated)
> >     > +        le16 hash_type; (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
> >     >  };
> >     >  \end{lstlisting}
> >     >
> >     > @@ -3330,6 +3337,15 @@ \subsubsection{Processing of Incoming Pack=
ets}\
> >     label{sec:Device Types / Network
> >     >    set: if so, device has validated the packet checksum.
> >     >    In case of multiple encapsulated protocols, one level of check=
sums
> >     >    has been validated.
> >     > +\item If VIRTIO_NET_F_HASH_REPORT was negotiated and a device ha=
s
> >     calculated
> >     > +  a hash for the packet, \field{hash_value} contains calculated =
hash
> >     value and
> >     > +  \field{hash_type} contains exact hash type.
> >     > +
> >     > +  If the hash was not calculated, \field{hash_type} contains zer=
o.
> >     > +
> >     > +  For defined hash types and their meaning, see \ref{sec:Device =
Types /
> >     Network Device / Device configuration layout / RSS}.
> >     > +
> >     > +  For the procedure of hash calculation, see \ref{sec:Device Typ=
es /
> >     Network Device / Device Operation / Control Virtqueue / Receive-sid=
e
> >     scaling (RSS) / RSS hash types}.
> >     >  \end{enumerate}
> >     >
> >     >  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN
> >     > @@ -3909,6 +3925,14 @@ \subsubsection{Control Virtqueue}\label{se=
c:Device
> >     Types / Network Device / Devi
> >     >  \item Else skip IPv6 extension headers and calculate the hash as=
 defined
> >     above for IPv6 packet without extension headers
> >     >  \end{itemize}
> >     >
> >     > +If VIRTIO_NET_F_HASH_REPORT was negotiated, the device reports
> >     calculated hash information in fields of virtio_net_hdr as follows:
> >     > +
> >     > +Exact hash type is populated in \field{hash_type}
> >     > +
> >     > +Hash value is populated in \field{hash_value}
> >     > +
> >     > +If, due to any reason, the device did not calculate the hash, it=
 sets \
> >     field{hash_type} to zero.
> >     > +
> >     >  \drivernormative{\subparagraph}{Setting RSS parameters}{Device T=
ypes /
> >     Network Device / Device Operation / Control Virtqueue / Receive-sid=
e
> >     scaling (RSS) }
> >     >
> >     >  A driver MUST NOT send the VIRTIO_NET_CTRL_MQ_RSS_CONFIG command=
 if the
> >     feature VIRTIO_NET_F_RSS has not been negotiated.
> >
> >
> >     This is understandably a minimal change, but imho messes things up:
> >     hash calculation is no longer part of RSS so really should be moved
> >     from out of there.
> >
> > Please advise why "hash calculation is no longer part of RSS".
>
> I might be misunderstanding things. It looks like with this
> one can enable hash even with a single RX queue.
> No?

Not exactly.
Hash calculation (even with single queue, which is possible corner
case) requires a key to be configured with
VIRTIO_NET_CTRL_MQ_RSS_CONFIG command.
So, if the device with one queue  is capable to deliver the hash it
indicates VIRTIO_NET_F_RSS and VIRTIO_NET_F_HASH_REPORT.
I will add this.
And probably the device should deny VIRTIO_NET_F_HASH_REPORT without
VIRTIO_NET_F_RSS.

>
> >
> >
> >     So we'd have a chapter for hash calculation, defining hash types
> >     etc.
> >
> > A chapter for hash calculation is in previous patch
> > https://lists.oasis-open.org/archives/virtio-comment/201911/msg00014.ht=
ml
> >
>
> Can't see it there. Do you mean
> +\subparagraph{RSS hash types}\label{sec:Device Types / Network Device / =
Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS has=
h types}
> ?
> Sure, what I am saying it needs to be moved from out of RSS then.
>

I do not see how hash calculation can be moved out of RSS, it requires
the configuration that comes with VIRTIO_NET_CTRL_MQ_RSS_CONFIG.

> >
> >     Then both RSS and the new chapter refer to that.
> >
> >     Also, I am guessing supported hash types should be valid
> >     in config space with the new feature - isn't that right?
> >
> > Yes, of course.
>
> So we need to say this in the spec I think.

OK, I will add this.
To avoid misunderstandings I think it is better to wait until the RSS
patch (mentioned above) is merged.
When approx. we can expect that?

>
> > But this is not related to hash delivery.
> > Packet hash is calculated according to allowed hash types.
> > If hash delivery is negotiated, the device reports the calculated hash =
type
> > which is, naturally, one of valid ones.
> >
> >
> >
> >     > --
> >     > 2.17.2
> >
> >
> >     This publicly archived list offers a means to provide input to the
> >     OASIS Virtual I/O Device (VIRTIO) TC.
> >
> >     In order to verify user consent to the Feedback License terms and
> >     to minimize spam in the list archive, subscription is required
> >     before posting.
> >
> >     Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >     Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >     List help: virtio-comment-help@lists.oasis-open.org
> >     List archive: https://lists.oasis-open.org/archives/virtio-comment/
> >     Feedback License: https://www.oasis-open.org/who/ipr/feedback_licen=
se.pdf
> >     List Guidelines: https://www.oasis-open.org/policies-guidelines/
> >     mailing-lists
> >     Committee: https://www.oasis-open.org/committees/virtio/
> >     Join OASIS: https://www.oasis-open.org/join/
> >
> >
> >
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

