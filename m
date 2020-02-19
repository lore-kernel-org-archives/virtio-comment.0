Return-Path: virtio-comment-return-1070-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0C99B985EAC
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Feb 2020 14:49:45 +0000 (UTC)
Date: Wed, 19 Feb 2020 09:49:37 -0500 (EST)
From: Yuri Benditovich <ybendito@redhat.com>
Message-ID: <1785864968.7261240.1582123777151.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200219092917-mutt-send-email-mst@kernel.org>
References: <20200219075337.23191-1-yuri.benditovich@daynix.com> <20200219075337.23191-2-yuri.benditovich@daynix.com> <20200219040122-mutt-send-email-mst@kernel.org> <1841911156.7222325.1582110433680.JavaMail.zimbra@redhat.com> <20200219092917-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define
 per-packet hash reporting feature
Content-Type: multipart/alternative; 
	boundary="----=_Part_7261239_1035068924.1582123777149"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

------=_Part_7261239_1035068924.1582123777149
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

----- Original Message -----

> From: "Michael S. Tsirkin" <mst@redhat.com>
> To: "Yuri Benditovich" <ybendito@redhat.com>
> Cc: "Yuri Benditovich" <yuri.benditovich@daynix.com>,
> virtio-comment@lists.oasis-open.org
> Sent: Wednesday, February 19, 2020 4:35:49 PM
> Subject: Re: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define
> per-packet hash reporting feature

> On Wed, Feb 19, 2020 at 06:07:13AM -0500, Yuri Benditovich wrote:
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
> > From: "Michael S. Tsirkin" <mst@redhat.com>
> > To: "Yuri Benditovich" <yuri.benditovich@daynix.com>
> > Cc: virtio-comment@lists.oasis-open.org
> > Sent: Wednesday, February 19, 2020 11:12:40 AM
> > Subject: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define per-pac=
ket
> > hash reporting feature
> >
> > On Wed, Feb 19, 2020 at 09:53:37AM +0200, Yuri Benditovich wrote:
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/66
> > > Define respective feature bit for virtio-net.
> > > Extend packet layout to populate hash value and type.
> > > Move the definition of IP/TCP/UDP header fields to
> > > calculate the hash out of RSS section to common network
> > > device section.
> > >
> > > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > > ---
> > > content.tex | 347 ++++++++++++++++++++++++++++++++++-----------------=
-
> > > 1 file changed, 229 insertions(+), 118 deletions(-)
> > >
> > > diff --git a/content.tex b/content.tex
> > > index b91a132..d7d4e42 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -2895,6 +2895,9 @@ \subsection{Feature bits}\label{sec:Device Type=
s /
> > Network Device / Feature bits
> > > \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
> > > channel.
> > >
> > > +\item[VIRTIO_NET_F_HASH_REPORT(57)] Device can report per-packet has=
h
> > > + value and a type of calculated hash.
> > > +
> > > \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \fi=
eld
> > {hdr_len}
> > > value. Device benefits from knowing the exact header length.
> > >
> > > @@ -2995,35 +2998,17 @@ \subsection{Device configuration layout}\labe=
l
> > {sec:Device Types / Network Device
> > > le32 supported_hash_types;
> > > };
> > > \end{lstlisting}
> > > -\label{sec:Device Types / Network Device / Device configuration layo=
ut /
> > RSS}
> > > -Three following fields, \field{rss_max_key_size}, \field
> > {rss_max_indirection_table_length}
> > > -and \field{supported_hash_types} only exist if VIRTIO_NET_F_RSS is s=
et.
> > > +The following field, \field{rss_max_key_size} only exist if
> > VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT is set.
> > > +It specifies the maximal supported length of RSS key in bytes.
> > >
> > > -Field \field{rss_max_key_size} specifies the maximal supported lengt=
h of
> > RSS key in bytes.
> > > +The following field, \field{rss_max_indirection_table_length} only e=
xist
> > if VIRTIO_NET_F_RSS is set.
> > > +It specifies the maximal number of 16-bit entries in RSS indirection
> > table.
> > >
> > > -Field \field{rss_max_indirection_table_length} specifies the maximal
> > number of 16-bit entries in RSS indirection table.
> > > +The next field, \field{supported_hash_types} exists only if the devi=
ce
> > supports hash calculation,
> > > +i.e. if VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT is set.
> > >
> > > -Field \field{supported_hash_types} contains the bitmask of supported=
 RSS
> > hash types.
> > > -
> > > -Hash types applicable for IPv4 packets:
> > > -\begin{lstlisting}
> > > -#define VIRTIO_NET_RSS_HASH_TYPE_IPv4 (1 << 0)
> > > -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4 (1 << 1)
> > > -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4 (1 << 2)
> > > -\end{lstlisting}
> > > -Hash types applicable for IPv6 packets without extension headers
> > > -\begin{lstlisting}
> > > -#define VIRTIO_NET_RSS_HASH_TYPE_IPv6 (1 << 3)
> > > -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6 (1 << 4)
> > > -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6 (1 << 5)
> > > -\end{lstlisting}
> > > -Hash types applicable for IPv6 packets with extension headers
> > > -\begin{lstlisting}
> > > -#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX (1 << 6)
> > > -#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX (1 << 7)
> > > -#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX (1 << 8)
> > > -\end{lstlisting}
> > > -For the exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref
> > {sec:Device Types / Network Device / Device Operation / Control Virtque=
ue /
> > Receive-side scaling (RSS) / RSS hash types}.
> > > +Field \field{supported_hash_types} contains the bitmask of supported
> > hash types.
> > > +See \ref{sec:Device Types / Network Device / Device Operation /
> > Processing of Incoming Packets / Hash calculation for incoming packets =
/
> > Supported/enabled hash types} for details of supported hash types.
> > >
> > > \devicenormative{\subsubsection}{Device configuration layout}{Device
> > Types / Network Device / Device configuration layout}
> > >
> > > @@ -3048,7 +3033,7 @@ \subsection{Device configuration layout}\label
> > {sec:Device Types / Network Device
> > > negotiated.
> > >
> > > The device MUST set \field{rss_max_key_size} to at least 40, if it
> > offers
> > > -VIRTIO_NET_F_RSS.
> > > +VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> > >
> > > The device MUST set \field{rss_max_indirection_table_length} to at le=
ast
> > 128, if it offers
> > > VIRTIO_NET_F_RSS.
> > > @@ -3195,6 +3180,8 @@ \subsection{Device Operation}\label{sec:Device
> > Types / Network Device / Device O
> > > le16 csum_start;
> > > le16 csum_offset;
> > > le16 num_buffers;
> > > + le32 hash_value; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
> > > + le16 hash_type; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
> > > };
> >
> > Just noticed this - it's a bit problematic as it might force
> > compilers to add 2 bytes of padding at the end. Let's add extra 2 bytes
> > of padding explicitly?
> >
> > OK, no problem
> >
> >
> >
> >
> > > \end{lstlisting}
> > >
> > > @@ -3517,6 +3504,12 @@ \subsubsection{Processing of Incoming Packets}=
\
> > label{sec:Device Types / Network
> > >
> > > \end{enumerate}
> > >
> > > +If applicable, the device calculates per-packet hash for incoming
> > packets as
> > > +defined in \ref{sec:Device Types / Network Device / Device Operation=
 /
> > Processing of Incoming Packets / Hash calculation for incoming packets}=
.
> > > +
> > > +If applicable, the device reports hash information for incoming pack=
ets
> > as
> > > +defined in \ref{sec:Device Types / Network Device / Device Operation=
 /
> > Processing of Incoming Packets / Hash reporting for incoming packets}.
> > > +
> > > \devicenormative{\paragraph}{Processing of Incoming Packets}{Device
> > Types / Network Device / Device Operation / Processing of Incoming Pack=
ets}
> > > \label{devicenormative:Device Types / Network Device / Device Operati=
on
> > / Processing of Packets}%old label for latexdiff
> > >
> > > @@ -3619,6 +3612,181 @@ \subsubsection{Processing of Incoming Packets=
}\
> > label{sec:Device Types / Network
> > > If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
> > > VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
> > > rely on the packet checksum being correct.
> > > +
> > > +\paragraph{Hash calculation for incoming packets}
> > > +\label{sec:Device Types / Network Device / Device Operation / Proces=
sing
> > of Incoming Packets / Hash calculation for incoming packets}
> > > +
> > > +A device attempts to calculate a per-packet hash in the following ca=
ses:
> > > +\begin{itemize}
> > > +\item The feature VIRTIO_NET_F_RSS was negotiated. The device uses t=
he
> > hash to determine the receive virtqueue to place incoming packets.
> > > +\item The feature VIRTIO_NET_F_HASH_REPORT was negotiated. The devic=
e
> > reports the hash value and the hash type with the packet.
> > > +\end{itemize}
> > > +
> > > +If the feature VIRTIO_NET_F_RSS was negotiated:
> > > +\begin{itemize}
> > > +\item The device uses \field{hash_types} of the virtio_net_rss_confi=
g
> > structure as 'Enabled hash types' bitmask.
> > > +\item The device uses a key as defined in \field{hash_key_data} and =
\
> > field{hash_key_length} of the virtio_net_rss_config structure (see
> > > +\ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Receive-side scaling (RSS) / Setting RSS parameters}).
> > > +\end{itemize}
> > > +
> > > +If the feature VIRTIO_NET_F_RSS was not negotiated:
> > > +\begin{itemize}
> > > +\item The device uses \field{hash_types} of the virtio_net_hash_conf=
ig
> > structure as 'Enabled hash types' bitmask.
> > > +\item The device uses a key as defined in \field{hash_key_data} and =
\
> > field{hash_key_length} of the virtio_net_hash_config structure (see
> > > +\ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Automatic receive steering in multiqueue mode / Hash
> > calculation}).
> > > +\end{itemize}
> > > +
> > > +Note that if the device offers VIRTIO_NET_F_HASH_REPORT, even if it
> > supports only one pair of virtqueues, it MUST support
> > > +at least one of commands of VIRTIO_NET_CTRL_MQ class to configure
> > reported hash parameters:
> > > +\begin{itemize}
> > > +\item If the device offers VIRTIO_NET_F_RSS, it MUST support
> > VIRTIO_NET_CTRL_MQ_RSS_CONFIG command per
> > > + \ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Receive-side scaling (RSS) / Setting RSS parameters}.
> > > +\item Otherwise the device MUST support VIRTIO_NET_CTRL_MQ_HASH_CONF=
IG
> > command per
> > > + \ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Automatic receive steering in multiqueue mode / Hash
> > calculation}.
> > > +\end{itemize}
> > > +
> > > +\subparagraph{Supported/enabled hash types}
> > > +\label{sec:Device Types / Network Device / Device Operation / Proces=
sing
> > of Incoming Packets / Hash calculation for incoming packets / Supported=
/
> > enabled hash types}
> > > +Hash types applicable for IPv4 packets:
> > > +\begin{lstlisting}
> > > +#define VIRTIO_NET_HASH_TYPE_IPv4 (1 << 0)
> > > +#define VIRTIO_NET_HASH_TYPE_TCPv4 (1 << 1)
> > > +#define VIRTIO_NET_HASH_TYPE_UDPv4 (1 << 2)
> > > +\end{lstlisting}
> > > +Hash types applicable for IPv6 packets without extension headers
> > > +\begin{lstlisting}
> > > +#define VIRTIO_NET_HASH_TYPE_IPv6 (1 << 3)
> > > +#define VIRTIO_NET_HASH_TYPE_TCPv6 (1 << 4)
> > > +#define VIRTIO_NET_HASH_TYPE_UDPv6 (1 << 5)
> > > +\end{lstlisting}
> > > +Hash types applicable for IPv6 packets with extension headers
> > > +\begin{lstlisting}
> > > +#define VIRTIO_NET_HASH_TYPE_IP_EX (1 << 6)
> > > +#define VIRTIO_NET_HASH_TYPE_TCP_EX (1 << 7)
> > > +#define VIRTIO_NET_HASH_TYPE_UDP_EX (1 << 8)
> > > +\end{lstlisting}
> > > +
> > > +\subparagraph{IPv4 packets}
> > > +\label{sec:Device Types / Network Device / Device Operation / Proces=
sing
> > of Incoming Packets / Hash calculation for incoming packets / IPv4 pack=
ets}
> > > +The device calculates the hash on IPv4 packets according to 'Enabled
> > hash types' bitmask as follows:
> > > +\begin{itemize}
> > > +\item If VIRTIO_NET_HASH_TYPE_TCPv4 is set and the packet has
> > > +a TCP header, the hash is calculated over the following fields:
> > > +\begin{itemize}
> > > +\item Source IP address
> > > +\item Destination IP address
> > > +\item Source TCP port
> > > +\item Destination TCP port
> > > +\end{itemize}
> > > +\item Else if VIRTIO_NET_HASH_TYPE_UDPv4 is set and the
> > > +packet has a UDP header, the hash is calculated over the following
> > fields:
> > > +\begin{itemize}
> > > +\item Source IP address
> > > +\item Destination IP address
> > > +\item Source UDP port
> > > +\item Destination UDP port
> > > +\end{itemize}
> > > +\item Else if VIRTIO_NET_HASH_TYPE_IPv4 is set, the hash is
> > > +calculated over the following fields:
> > > +\begin{itemize}
> > > +\item Source IP address
> > > +\item Destination IP address
> > > +\end{itemize}
> > > +\item Else the device does not calculate the hash
> > > +\end{itemize}
> > > +
> > > +\subparagraph{IPv6 packets without extension header}
> > > +\label{sec:Device Types / Network Device / Device Operation / Proces=
sing
> > of Incoming Packets / Hash calculation for incoming packets / IPv6 pack=
ets
> > without extension header}
> > > +The device calculates the hash on IPv6 packets without extension
> > > +headers according to 'Enabled hash types' bitmask as follows:
> > > +\begin{itemize}
> > > +\item If VIRTIO_NET_HASH_TYPE_TCPv6 is set and the packet has
> > > +a TCPv6 header, the hash is calculated over the following fields:
> > > +\begin{itemize}
> > > +\item Source IPv6 address
> > > +\item Destination IPv6 address
> > > +\item Source TCP port
> > > +\item Destination TCP port
> > > +\end{itemize}
> > > +\item Else if VIRTIO_NET_HASH_TYPE_UDPv6 is set and the
> > > +packet has a UDPv6 header, the hash is calculated over the following
> > fields:
> > > +\begin{itemize}
> > > +\item Source IPv6 address
> > > +\item Destination IPv6 address
> > > +\item Source UDP port
> > > +\item Destination UDP port
> > > +\end{itemize}
> > > +\item Else if VIRTIO_NET_HASH_TYPE_IPv6 is set, the hash is
> > > +calculated over the following fields:
> > > +\begin{itemize}
> > > +\item Source IPv6 address
> > > +\item Destination IPv6 address
> > > +\end{itemize}
> > > +\item Else the device does not calculate the hash
> > > +\end{itemize}
> > > +
> > > +\subparagraph{IPv6 packets with extension header}
> > > +\label{sec:Device Types / Network Device / Device Operation / Proces=
sing
> > of Incoming Packets / Hash calculation for incoming packets / IPv6 pack=
ets
> > with extension header}
> > > +The device calculates the hash on IPv6 packets with extension
> > > +headers according to 'Enabled hash types' bitmask as follows:
> > > +\begin{itemize}
> > > +\item If VIRTIO_NET_HASH_TYPE_TCP_EX is set and the packet
> > > +has a TCPv6 header, the hash is calculated over the following fields=
:
> > > +\begin{itemize}
> > > +\item Home address from the home address option in the IPv6 destinat=
ion
> > options header. If the extension header is not present, use the Source =
IPv6
> > address.
> > > +\item IPv6 address that is contained in the Routing-Header-Type-2 fr=
om
> > the associated extension header. If the extension header is not present=
,
> > use the Destination IPv6 address.
> > > +\item Source TCP port
> > > +\item Destination TCP port
> > > +\end{itemize}
> > > +\item Else if VIRTIO_NET_HASH_TYPE_UDP_EX is set and the
> > > +packet has a UDPv6 header, the hash is calculated over the following
> > fields:
> > > +\begin{itemize}
> > > +\item Home address from the home address option in the IPv6 destinat=
ion
> > options header. If the extension header is not present, use the Source =
IPv6
> > address.
> > > +\item IPv6 address that is contained in the Routing-Header-Type-2 fr=
om
> > the associated extension header. If the extension header is not present=
,
> > use the Destination IPv6 address.
> > > +\item Source UDP port
> > > +\item Destination UDP port
> > > +\end{itemize}
> > > +\item Else if VIRTIO_NET_HASH_TYPE_IP_EX is set, the hash is
> > > +calculated over the following fields:
> > > +\begin{itemize}
> > > +\item Home address from the home address option in the IPv6 destinat=
ion
> > options header. If the extension header is not present, use the Source =
IPv6
> > address.
> > > +\item IPv6 address that is contained in the Routing-Header-Type-2 fr=
om
> > the associated extension header. If the extension header is not present=
,
> > use the Destination IPv6 address.
> > > +\end{itemize}
> > > +\item Else skip IPv6 extension headers and calculate the hash as
> > > +defined for an IPv6 packet without extension headers
> > > +(see \ref{sec:Device Types / Network Device / Device Operation /
> > Processing of Incoming Packets / Hash calculation for incoming packets =
/
> > IPv6 packets without extension header}).
> > > +\end{itemize}
> > > +
> > > +\paragraph{Hash reporting for incoming packets}
> > > +\label{sec:Device Types / Network Device / Device Operation / Proces=
sing
> > of Incoming Packets / Hash reporting for incoming packets}
> > > +
> > > +If VIRTIO_NET_F_HASH_REPORT was negotiated and
> > > + the device has calculated the hash for the packet, the device fills=
 \
> > field{hash_type} with the type of calculated hash
> > > +and \field{hash_value} with the value of calculated hash.
> > > +
> > > +If VIRTIO_NET_F_HASH_REPORT was negotiated but due to any reason the
> > > +hash was not calculated, the device sets \field{hash_type} to
> > VIRTIO_NET_HASH_REPORT_NONE.
> > > +
> > > +Possible values that the device can report in \field{hash_type} are
> > defined below.
> > > +They correspond to supported hash types defined in
> > > +\ref{sec:Device Types / Network Device / Device Operation / Processi=
ng
> > of Incoming Packets / Hash calculation for incoming packets / Supported=
/
> > enabled hash types}
> > > +as follows:
> > > +
> > > +VIRTIO_NET_HASH_TYPE_XXX =3D 1 << (VIRTIO_NET_HASH_REPORT_XXX - 1)
> >
> >
> > So hash_type is the HASH_REPORT value then? That's quite confusing.
> > Let's rename to hash_report?
> >
> > No problem to rename anything, but I'd like to do it one time.
> > Currently meaningful hash report values are (1..9), 0 for none
> > They correspond to bitmask of 9 bits for enabled/supported.
> > It was possible to use the same definitions for enable/support/report
> > but then reported kind of hash should be 4 bytes.
> > As you anyway suggests padding at the end of the packet, we can do that=
,
> > i.e. add (32 bit hash + 32 bit type)

> We can but it seems like a waste, does it not? padding can be used for
> something later ...

> > Or if we stay with the values as they are now:
> > values 0..9 - VIRTIO_NET_WHAT?

> I thought that's VIRTIO_NET_HASH_REPORT_XXX

OK, this is exactly what is defined=20

> > bits from 0 to 8 - VIRTIO_NET_WHAT?

> and this one VIRTIO_NET_HASH_TYPE_XXX?

OK, this is also exactly what is defined=20

> Generally what you did here is a bit unusual. Mostly we just define
> bit numbers
> #define VIRTIO_SCSI_F_INOUT 0
> #define VIRTIO_SCSI_F_HOTPLUG 1
> #define VIRTIO_SCSI_F_CHANGE 2
> #define VIRTIO_SCSI_F_T10_PI 3

Value 0 of hash_report is "no hash calculated" and it does not=20
participate in support/enable mask. I did not want to=20
use value other than zero for "no hash".=20

So you want bit 0 to be reserved (not used) in enable/support mask=20
and then to have all the VIRTIO_NET_HASH_TYPE_XXX to be=20
exactly 1 << VIRTIO_NET_HASH_REPORT_XXX? Just say...=20

> and just say that bit numbers are from this table, with bit
> 0 corresponding to the value 0, bit 1 to value 1 etc.

> maybe that would have been easier on the eyes - I didn't try,
> I'm not even sure.

> But what you have is correct enough, we can always try to
> improve the wording later.

> >
> >
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_NET_HASH_REPORT_NONE 0
> > > +#define VIRTIO_NET_HASH_REPORT_IPv4 1
> > > +#define VIRTIO_NET_HASH_REPORT_TCPv4 2
> > > +#define VIRTIO_NET_HASH_REPORT_UDPv4 3
> > > +#define VIRTIO_NET_HASH_REPORT_IPv6 4
> > > +#define VIRTIO_NET_HASH_REPORT_TCPv6 5
> > > +#define VIRTIO_NET_HASH_REPORT_UDPv6 6
> > > +#define VIRTIO_NET_HASH_REPORT_IPv6_EX 7
> > > +#define VIRTIO_NET_HASH_REPORT_TCPv6_EX 8
> > > +#define VIRTIO_NET_HASH_REPORT_UDPv6_EX 9
> > > +\end{lstlisting}
> > > +
> > > \subsubsection{Control Virtqueue}\label{sec:Device Types / Network
> > Device / Device Operation / Control Virtqueue}
> > >
> > > The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
> > > @@ -3896,6 +4064,7 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice
> > Types / Network Device / Devi
> > > #define VIRTIO_NET_CTRL_MQ 4
> > > #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET 0 (for automatic receive
> > steering)
> > > #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG 1 (for configurable
> > receive steering)
> > > + #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG 2 (for configurable hash
> > calculation)
> > > \end{lstlisting}
> > >
> > > If more than one multiqueue mode is negotiated, the resulting device
> > configuration is defined by the last command sent by the driver.
> > > @@ -3961,10 +4130,37 @@ \subsubsection{Control Virtqueue}\label
> > {sec:Device Types / Network Device / Devi
> > > according to the native endian of the guest rather than
> > > (necessarily when not using the legacy interface) little-endian.
> > >
> > > +\subparagraph{Hash calculation}\label{sec:Device Types / Network Dev=
ice
> > / Device Operation / Control Virtqueue / Automatic receive steering in
> > multiqueue mode / Hash calculation}
> > > +If VIRTIO_NET_F_HASH_REPORT was negotiated and the device uses autom=
atic
> > receive steering,
> > > +the device MUST support a command to configure hash calculation
> > parameters.
> > > +
> > > +The driver provides parameters for hash calculation as follows:
> > > +
> > > +\field{class} VIRTIO_NET_CTRL_MQ, \field{command}
> > VIRTIO_NET_CTRL_MQ_HASH_CONFIG.
> > > +
> > > +The \field{command-specific-data} has following format:
> > > +\begin{lstlisting}
> > > +struct virtio_net_hash_config {
> > > + le32 hash_types;
> > > + le16 reserved[4];
> > > + u8 hash_key_length;
> > > + u8 hash_key_data[hash_key_length];
> > > +};
> > > +\end{lstlisting}
> > > +Field \field{hash_types} contains a bitmask of allowed hash types as
> > > +defined in
> > > +\ref{sec:Device Types / Network Device / Device Operation / Processi=
ng
> > of Incoming Packets / Hash calculation for incoming packets / Supported=
/
> > enabled hash types}.
> > > +Initially the device has all hash types disabled and reports only
> > VIRTIO_NET_HASH_REPORT_NONE.
> > > +
> > > +Field \field{reserved} MUST contain zeroes. It is defined to make th=
e
> > structure to match the layout of virtio_net_rss_config structure,
> > > +defined in \ref{sec:Device Types / Network Device / Device Operation=
 /
> > Control Virtqueue / Receive-side scaling (RSS)}.
> > > +
> > > +Fields \field{hash_key_length} and \field{hash_key_data} define the =
key
> > to be used in hash calculation.
> > > +
> > > \paragraph{Receive-side scaling (RSS)}\label{sec:Device Types / Netwo=
rk
> > Device / Device Operation / Control Virtqueue / Receive-side scaling (R=
SS)}
> > > A device offers the feature VIRTIO_NET_F_RSS if it supports RSS recei=
ve
> > steering with Toeplitz hash calculation and configurable parameters.
> > >
> > > -A driver queries RSS capabilities of the device by reading device
> > configuration as defined in \ref{sec:Device Types / Network Device / De=
vice
> > configuration layout / RSS}
> > > +A driver queries RSS capabilities of the device by reading device
> > configuration as defined in \ref{sec:Device Types / Network Device / De=
vice
> > configuration layout}
> > >
> > > \subparagraph{Setting RSS parameters}\label{sec:Device Types / Networ=
k
> > Device / Device Operation / Control Virtqueue / Receive-side scaling (R=
SS)
> > / Setting RSS parameters}
> > >
> > > @@ -3981,7 +4177,8 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice
> > Types / Network Device / Devi
> > > };
> > > \end{lstlisting}
> > > Field \field{hash_types} contains a bitmask of allowed hash types as
> > > -defined in \ref{sec:Device Types / Network Device / Device Operation=
 /
> > Control Virtqueue / Receive-side scaling (RSS) / RSS hash types}.
> > > +defined in
> > > +\ref{sec:Device Types / Network Device / Device Operation / Processi=
ng
> > of Incoming Packets / Hash calculation for incoming packets / Supported=
/
> > enabled hash types}.
> > >
> > > Field \field{indirection_table_mask} is a mask to be applied to
> > > the calculated hash to produce an index in the
> > > @@ -3995,93 +4192,7 @@ \subsubsection{Control Virtqueue}\label{sec:De=
vice
> > Types / Network Device / Devi
> > >
> > > A driver sets \field{max_tx_vq} to inform a device how many transmit
> > virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
> > >
> > > -\subparagraph{RSS hash types}\label{sec:Device Types / Network Devic=
e /
> > Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS
> > hash types}
> > > -
> > > -The device calculates the hash on IPv4 packets according to the
> > > -field \field{hash_types} of the virtio_net_rss_config structure as
> > follows:
> > > -\begin{itemize}
> > > -\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv4 is set and the packet has
> > > -a TCP header, the hash is calculated over the following fields:
> > > -\begin{itemize}
> > > -\item Source IP address
> > > -\item Destination IP address
> > > -\item Source TCP port
> > > -\item Destination TCP port
> > > -\end{itemize}
> > > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set and the
> > > -packet has a UDP header, the hash is calculated over the following
> > fields:
> > > -\begin{itemize}
> > > -\item Source IP address
> > > -\item Destination IP address
> > > -\item Source UDP port
> > > -\item Destination UDP port
> > > -\end{itemize}
> > > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv4 is set, the hash is
> > > -calculated over the following fields:
> > > -\begin{itemize}
> > > -\item Source IP address
> > > -\item Destination IP address
> > > -\end{itemize}
> > > -\item Else the device does not calculate the hash
> > > -\end{itemize}
> > > -
> > > -\label{itm:Device Types / Network Device / Device Operation / Contro=
l
> > Virtqueue / Receive-side scaling (RSS) / RSS hash types/hash on IPv6
> > packets without extension headers}
> > > -The device calculates the hash on IPv6 packets without extension
> > > -headers according to the field \field{hash_types} of the
> > virtio_net_rss_config structure as follows:
> > > -\begin{itemize}
> > > -\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set and the packet has
> > > -a TCPv6 header, the hash is calculated over the following fields:
> > > -\begin{itemize}
> > > -\item Source IPv6 address
> > > -\item Destination IPv6 address
> > > -\item Source TCP port
> > > -\item Destination TCP port
> > > -\end{itemize}
> > > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is set and the
> > > -packet has a UDPv6 header, the hash is calculated over the following
> > fields:
> > > -\begin{itemize}
> > > -\item Source IPv6 address
> > > -\item Destination IPv6 address
> > > -\item Source UDP port
> > > -\item Destination UDP port
> > > -\end{itemize}
> > > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv6 is set, the hash is
> > > -calculated over the following fields:
> > > -\begin{itemize}
> > > -\item Source IPv6 address
> > > -\item Destination IPv6 address
> > > -\end{itemize}
> > > -\item Else the device does not calculate the hash
> > > -\end{itemize}
> > > -
> > > -The device calculates the hash on IPv6 packets with extension
> > > -headers according to the field \field{hash_types} of the
> > virtio_net_rss_config structure as follows:
> > > -\begin{itemize}
> > > -\item If VIRTIO_NET_RSS_HASH_TYPE_TCP_EX is set and the packet
> > > -has a TCPv6 header, the hash is calculated over the following fields=
:
> > > -\begin{itemize}
> > > -\item Home address from the home address option in the IPv6 destinat=
ion
> > options header. If the extension header is not present, use the Source =
IPv6
> > address.
> > > -\item IPv6 address that is contained in the Routing-Header-Type-2 fr=
om
> > the associated extension header. If the extension header is not present=
,
> > use the Destination IPv6 address.
> > > -\item Source TCP port
> > > -\item Destination TCP port
> > > -\end{itemize}
> > > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the
> > > -packet has a UDPv6 header, the hash is calculated over the following
> > fields:
> > > -\begin{itemize}
> > > -\item Home address from the home address option in the IPv6 destinat=
ion
> > options header. If the extension header is not present, use the Source =
IPv6
> > address.
> > > -\item IPv6 address that is contained in the Routing-Header-Type-2 fr=
om
> > the associated extension header. If the extension header is not present=
,
> > use the Destination IPv6 address.
> > > -\item Source UDP port
> > > -\item Destination UDP port
> > > -\end{itemize}
> > > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is
> > > -calculated over the following fields:
> > > -\begin{itemize}
> > > -\item Home address from the home address option in the IPv6 destinat=
ion
> > options header. If the extension header is not present, use the Source =
IPv6
> > address.
> > > -\item IPv6 address that is contained in the Routing-Header-Type-2 fr=
om
> > the associated extension header. If the extension header is not present=
,
> > use the Destination IPv6 address.
> > > -\end{itemize}
> > > -\item Else skip IPv6 extension headers and calculate the hash as
> > > -defined for an IPv6 packet without extension headers (see \ref
> > {itm:Device Types / Network Device / Device Operation / Control Virtque=
ue /
> > Receive-side scaling (RSS) / RSS hash types/hash on IPv6 packets withou=
t
> > extension headers}).
> > > -\end{itemize}
> > > +Fields \field{hash_key_length} and \field{hash_key_data} define the =
key
> > to be used in hash calculation.
> > >
> > > \drivernormative{\subparagraph}{Setting RSS parameters}{Device Types =
/
> > Network Device / Device Operation / Control Virtqueue / Receive-side
> > scaling (RSS) }
> > >
> > > @@ -4093,12 +4204,12 @@ \subsubsection{Control Virtqueue}\label
> > {sec:Device Types / Network Device / Devi
> > >
> > > A driver MUST use \field{indirection_table_mask} values that are less
> > than \field{rss_max_indirection_table_length} reported by a device.
> > >
> > > -A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are n=
ot
> > supported by a device.
> > > +A driver MUST NOT set any VIRTIO_NET_HASH_TYPE_ flags that are not
> > supported by a device.
> > >
> > > \devicenormative{\subparagraph}{RSS processing}{Device Types / Networ=
k
> > Device / Device Operation / Control Virtqueue / Receive-side scaling (R=
SS)
> > / RSS processing}
> > > The device MUST determine the destination queue for a network packet =
as
> > follows:
> > > \begin{itemize}
> > > -\item Calculate the hash of the packet as defined in \ref{sec:Device
> > Types / Network Device / Device Operation / Control Virtqueue /
> > Receive-side scaling (RSS) / RSS hash types}
> > > +\item Calculate the hash of the packet as defined in \ref{sec:Device
> > Types / Network Device / Device Operation / Processing of Incoming Pack=
ets
> > / Hash calculation for incoming packets}.
> > > \item If the device did not calculate the hash for the specific packe=
t,
> > the device directs the packet to the receiveq specified by \field
> > {unclassified_queue} of virtio_net_rss_config structure (value of 0
> > corresponds to receiveq1).
> > > \item Apply \field{indirection_table_mask} to the calculated hash and
> > use the result as the index in the indirection table to get 0-based num=
ber
> > of destination receiveq (value of 0 corresponds to receiveq1).
> > > \end{itemize}
> > > --
> > > 2.17.1
> >
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
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/
> > mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> >
> >
> >

------=_Part_7261239_1035068924.1582123777149
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: courier new,courier,monaco,monospace=
,sans-serif; font-size: 12pt; color: #000000"><div><br></div><div><br></div=
><hr id=3D"zwchr"><blockquote style=3D"border-left:2px solid #1010FF;margin=
-left:5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;=
text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;=
"><b>From: </b>"Michael S. Tsirkin" &lt;mst@redhat.com&gt;<br><b>To: </b>"Y=
uri Benditovich" &lt;ybendito@redhat.com&gt;<br><b>Cc: </b>"Yuri Benditovic=
h" &lt;yuri.benditovich@daynix.com&gt;, virtio-comment@lists.oasis-open.org=
<br><b>Sent: </b>Wednesday, February 19, 2020 4:35:49 PM<br><b>Subject: </b=
>Re: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define per-packet hash=
 reporting feature<br><div><br></div>On Wed, Feb 19, 2020 at 06:07:13AM -05=
00, Yuri Benditovich wrote:<br>&gt; <br>&gt; <br>&gt; =E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81<br>&gt; <br>&gt; &nbsp; &nbsp; From: "Michael S. Tsirkin" &=
lt;mst@redhat.com&gt;<br>&gt; &nbsp; &nbsp; To: "Yuri Benditovich" &lt;yuri=
.benditovich@daynix.com&gt;<br>&gt; &nbsp; &nbsp; Cc: virtio-comment@lists.=
oasis-open.org<br>&gt; &nbsp; &nbsp; Sent: Wednesday, February 19, 2020 11:=
12:40 AM<br>&gt; &nbsp; &nbsp; Subject: [virtio-comment] Re: [PATCH v4 1/1]=
 virtio-net: Define per-packet<br>&gt; &nbsp; &nbsp; hash reporting feature=
<br>&gt; <br>&gt; &nbsp; &nbsp; On Wed, Feb 19, 2020 at 09:53:37AM +0200, Y=
uri Benditovich wrote:<br>&gt; &nbsp; &nbsp; &gt; Fixes: https://github.com=
/oasis-tcs/virtio-spec/issues/66<br>&gt; &nbsp; &nbsp; &gt; Define respecti=
ve feature bit for virtio-net.<br>&gt; &nbsp; &nbsp; &gt; Extend packet lay=
out to populate hash value and type.<br>&gt; &nbsp; &nbsp; &gt; Move the de=
finition of IP/TCP/UDP header fields to<br>&gt; &nbsp; &nbsp; &gt; calculat=
e the hash out of RSS section to common network<br>&gt; &nbsp; &nbsp; &gt; =
device section.<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; &gt; Signe=
d-off-by: Yuri Benditovich &lt;yuri.benditovich@daynix.com&gt;<br>&gt; &nbs=
p; &nbsp; &gt; ---<br>&gt; &nbsp; &nbsp; &gt; &nbsp;content.tex | 347 +++++=
+++++++++++++++++++++++++++++------------------<br>&gt; &nbsp; &nbsp; &gt; =
&nbsp;1 file changed, 229 insertions(+), 118 deletions(-)<br>&gt; &nbsp; &n=
bsp; &gt;<br>&gt; &nbsp; &nbsp; &gt; diff --git a/content.tex b/content.tex=
<br>&gt; &nbsp; &nbsp; &gt; index b91a132..d7d4e42 100644<br>&gt; &nbsp; &n=
bsp; &gt; --- a/content.tex<br>&gt; &nbsp; &nbsp; &gt; +++ b/content.tex<br=
>&gt; &nbsp; &nbsp; &gt; @@ -2895,6 +2895,9 @@ \subsection{Feature bits}\la=
bel{sec:Device Types /<br>&gt; &nbsp; &nbsp; Network Device / Feature bits<=
br>&gt; &nbsp; &nbsp; &gt; &nbsp;\item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set =
MAC address through control<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &nbsp;=
channel.<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; +\ite=
m[VIRTIO_NET_F_HASH_REPORT(57)] Device can report per-packet hash<br>&gt; &=
nbsp; &nbsp; &gt; + &nbsp; &nbsp;value and a type of calculated hash.<br>&g=
t; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &nbsp;\item[VIRTIO_NET_F=
_GUEST_HDRLEN(59)] Driver can provide the exact \field<br>&gt; &nbsp; &nbsp=
; {hdr_len}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &nbsp;value. Device be=
nefits from knowing the exact header length.<br>&gt; &nbsp; &nbsp; &gt; &nb=
sp;<br>&gt; &nbsp; &nbsp; &gt; @@ -2995,35 +2998,17 @@ \subsection{Device c=
onfiguration layout}\label<br>&gt; &nbsp; &nbsp; {sec:Device Types / Networ=
k Device<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le32 =
supported_hash_types;<br>&gt; &nbsp; &nbsp; &gt; &nbsp;};<br>&gt; &nbsp; &n=
bsp; &gt; &nbsp;\end{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; -\label{sec:Dev=
ice Types / Network Device / Device configuration layout /<br>&gt; &nbsp; &=
nbsp; RSS}<br>&gt; &nbsp; &nbsp; &gt; -Three following fields, \field{rss_m=
ax_key_size}, \field<br>&gt; &nbsp; &nbsp; {rss_max_indirection_table_lengt=
h}<br>&gt; &nbsp; &nbsp; &gt; -and \field{supported_hash_types} only exist =
if VIRTIO_NET_F_RSS is set.<br>&gt; &nbsp; &nbsp; &gt; +The following field=
, \field{rss_max_key_size} only exist if<br>&gt; &nbsp; &nbsp; VIRTIO_NET_F=
_RSS or VIRTIO_NET_F_HASH_REPORT is set.<br>&gt; &nbsp; &nbsp; &gt; +It spe=
cifies the maximal supported length of RSS key in bytes.<br>&gt; &nbsp; &nb=
sp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; -Field \field{rss_max_key_size} =
specifies the maximal supported length of<br>&gt; &nbsp; &nbsp; RSS key in =
bytes.<br>&gt; &nbsp; &nbsp; &gt; +The following field, \field{rss_max_indi=
rection_table_length} only exist<br>&gt; &nbsp; &nbsp; if VIRTIO_NET_F_RSS =
is set.<br>&gt; &nbsp; &nbsp; &gt; +It specifies the maximal number of 16-b=
it entries in RSS indirection<br>&gt; &nbsp; &nbsp; table.<br>&gt; &nbsp; &=
nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; -Field \field{rss_max_indirect=
ion_table_length} specifies the maximal<br>&gt; &nbsp; &nbsp; number of 16-=
bit entries in RSS indirection table.<br>&gt; &nbsp; &nbsp; &gt; +The next =
field, \field{supported_hash_types} exists only if the device<br>&gt; &nbsp=
; &nbsp; supports hash calculation,<br>&gt; &nbsp; &nbsp; &gt; +i.e. if VIR=
TIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT is set.<br>&gt; &nbsp; &nbsp; &gt=
; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; -Field \field{supported_hash_types} con=
tains the bitmask of supported RSS<br>&gt; &nbsp; &nbsp; hash types.<br>&gt=
; &nbsp; &nbsp; &gt; -<br>&gt; &nbsp; &nbsp; &gt; -Hash types applicable fo=
r IPv4 packets:<br>&gt; &nbsp; &nbsp; &gt; -\begin{lstlisting}<br>&gt; &nbs=
p; &nbsp; &gt; -#define VIRTIO_NET_RSS_HASH_TYPE_IPv4 &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 0)<br>&gt; &nbsp; &nbsp; &gt; -#defi=
ne VIRTIO_NET_RSS_HASH_TYPE_TCPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 (1 &lt;&lt; 1)<br>&gt; &nbsp; &nbsp; &gt; -#define VIRTIO_NET_RSS_HASH_TYP=
E_UDPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 2)<br>&gt; &n=
bsp; &nbsp; &gt; -\end{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; -Hash types a=
pplicable for IPv6 packets without extension headers<br>&gt; &nbsp; &nbsp; =
&gt; -\begin{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; -#define VIRTIO_NET_RSS=
_HASH_TYPE_IPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt;=
 3)<br>&gt; &nbsp; &nbsp; &gt; -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6 &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 4)<br>&gt; &nbsp; &nbsp; =
&gt; -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6 &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; (1 &lt;&lt; 5)<br>&gt; &nbsp; &nbsp; &gt; -\end{lstlisting}<br>=
&gt; &nbsp; &nbsp; &gt; -Hash types applicable for IPv6 packets with extens=
ion headers<br>&gt; &nbsp; &nbsp; &gt; -\begin{lstlisting}<br>&gt; &nbsp; &=
nbsp; &gt; -#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; (1 &lt;&lt; 6)<br>&gt; &nbsp; &nbsp; &gt; -#define VIRTIO=
_NET_RSS_HASH_TYPE_TCP_EX &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&=
lt; 7)<br>&gt; &nbsp; &nbsp; &gt; -#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 8)<br>&gt; &nbsp; &nbs=
p; &gt; -\end{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; -For the exact meaning=
 of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref<br>&gt; &nbsp; &nbsp; {sec:Dev=
ice Types / Network Device / Device Operation / Control Virtqueue /<br>&gt;=
 &nbsp; &nbsp; Receive-side scaling (RSS) / RSS hash types}.<br>&gt; &nbsp;=
 &nbsp; &gt; +Field \field{supported_hash_types} contains the bitmask of su=
pported<br>&gt; &nbsp; &nbsp; hash types.<br>&gt; &nbsp; &nbsp; &gt; +See \=
ref{sec:Device Types / Network Device / Device Operation /<br>&gt; &nbsp; &=
nbsp; Processing of Incoming Packets / Hash calculation for incoming packet=
s /<br>&gt; &nbsp; &nbsp; Supported/enabled hash types} for details of supp=
orted hash types.<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &=
gt; &nbsp;\devicenormative{\subsubsection}{Device configuration layout}{Dev=
ice<br>&gt; &nbsp; &nbsp; Types / Network Device / Device configuration lay=
out}<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; @@ -3048,=
7 +3033,7 @@ \subsection{Device configuration layout}\label<br>&gt; &nbsp; =
&nbsp; {sec:Device Types / Network Device<br>&gt; &nbsp; &nbsp; &gt; &nbsp;=
negotiated.<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &n=
bsp;The device MUST set \field{rss_max_key_size} to at least 40, if it<br>&=
gt; &nbsp; &nbsp; offers<br>&gt; &nbsp; &nbsp; &gt; -VIRTIO_NET_F_RSS.<br>&=
gt; &nbsp; &nbsp; &gt; +VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.<br>&g=
t; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp;The device MU=
ST set \field{rss_max_indirection_table_length} to at least<br>&gt; &nbsp; =
&nbsp; 128, if it offers<br>&gt; &nbsp; &nbsp; &gt; &nbsp;VIRTIO_NET_F_RSS.=
<br>&gt; &nbsp; &nbsp; &gt; @@ -3195,6 +3180,8 @@ \subsection{Device Operat=
ion}\label{sec:Device<br>&gt; &nbsp; &nbsp; Types / Network Device / Device=
 O<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le16 csum_s=
tart;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le16 csu=
m_offset;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le16=
 num_buffers;<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;le32 =
hash_value; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)<br>&gt; &nbsp; &n=
bsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;le16 hash_type; &nbsp;(Only if VIRTI=
O_NET_F_HASH_REPORT negotiated)<br>&gt; &nbsp; &nbsp; &gt; &nbsp;};<br>&gt;=
 <br>&gt; &nbsp; &nbsp; Just noticed this - it's a bit problematic as it mi=
ght force<br>&gt; &nbsp; &nbsp; compilers to add 2 bytes of padding at the =
end. Let's add extra 2 bytes<br>&gt; &nbsp; &nbsp; of padding explicitly?<b=
r>&gt; <br>&gt; OK, no problem<br>&gt; <br>&gt; <br>&gt; <br>&gt; <br>&gt; =
&nbsp; &nbsp; &gt; &nbsp;\end{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; &nbsp;=
<br>&gt; &nbsp; &nbsp; &gt; @@ -3517,6 +3504,12 @@ \subsubsection{Processin=
g of Incoming Packets}\<br>&gt; &nbsp; &nbsp; label{sec:Device Types / Netw=
ork<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp;\end=
{enumerate}<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; +I=
f applicable, the device calculates per-packet hash for incoming<br>&gt; &n=
bsp; &nbsp; packets as<br>&gt; &nbsp; &nbsp; &gt; +defined in \ref{sec:Devi=
ce Types / Network Device / Device Operation /<br>&gt; &nbsp; &nbsp; Proces=
sing of Incoming Packets / Hash calculation for incoming packets}.<br>&gt; =
&nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; +If applicable, the device =
reports hash information for incoming packets<br>&gt; &nbsp; &nbsp; as<br>&=
gt; &nbsp; &nbsp; &gt; +defined in \ref{sec:Device Types / Network Device /=
 Device Operation /<br>&gt; &nbsp; &nbsp; Processing of Incoming Packets / =
Hash reporting for incoming packets}.<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; =
&nbsp; &nbsp; &gt; &nbsp;\devicenormative{\paragraph}{Processing of Incomin=
g Packets}{Device<br>&gt; &nbsp; &nbsp; Types / Network Device / Device Ope=
ration / Processing of Incoming Packets}<br>&gt; &nbsp; &nbsp; &gt; &nbsp;\=
label{devicenormative:Device Types / Network Device / Device Operation<br>&=
gt; &nbsp; &nbsp; / Processing of Packets}%old label for latexdiff<br>&gt; =
&nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; @@ -3619,6 +3612,181 @=
@ \subsubsection{Processing of Incoming Packets}\<br>&gt; &nbsp; &nbsp; lab=
el{sec:Device Types / Network<br>&gt; &nbsp; &nbsp; &gt; &nbsp;If neither V=
IRTIO_NET_HDR_F_NEEDS_CSUM nor<br>&gt; &nbsp; &nbsp; &gt; &nbsp;VIRTIO_NET_=
HDR_F_DATA_VALID is set, the driver MUST NOT<br>&gt; &nbsp; &nbsp; &gt; &nb=
sp;rely on the packet checksum being correct.<br>&gt; &nbsp; &nbsp; &gt; +<=
br>&gt; &nbsp; &nbsp; &gt; +\paragraph{Hash calculation for incoming packet=
s}<br>&gt; &nbsp; &nbsp; &gt; +\label{sec:Device Types / Network Device / D=
evice Operation / Processing<br>&gt; &nbsp; &nbsp; of Incoming Packets / Ha=
sh calculation for incoming packets}<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &=
nbsp; &nbsp; &gt; +A device attempts to calculate a per-packet hash in the =
following cases:<br>&gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&gt; &nbsp;=
 &nbsp; &gt; +\item The feature VIRTIO_NET_F_RSS was negotiated. The device=
 uses the<br>&gt; &nbsp; &nbsp; hash to determine the receive virtqueue to =
place incoming packets.<br>&gt; &nbsp; &nbsp; &gt; +\item The feature VIRTI=
O_NET_F_HASH_REPORT was negotiated. The device<br>&gt; &nbsp; &nbsp; report=
s the hash value and the hash type with the packet.<br>&gt; &nbsp; &nbsp; &=
gt; +\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; =
+If the feature VIRTIO_NET_F_RSS was negotiated:<br>&gt; &nbsp; &nbsp; &gt;=
 +\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; +\item The device uses \field{=
hash_types} of the virtio_net_rss_config<br>&gt; &nbsp; &nbsp; structure as=
 'Enabled hash types' bitmask.<br>&gt; &nbsp; &nbsp; &gt; +\item The device=
 uses a key as defined in \field{hash_key_data} and \<br>&gt; &nbsp; &nbsp;=
 field{hash_key_length} of the virtio_net_rss_config structure (see<br>&gt;=
 &nbsp; &nbsp; &gt; +\ref{sec:Device Types / Network Device / Device Operat=
ion / Control<br>&gt; &nbsp; &nbsp; Virtqueue / Receive-side scaling (RSS) =
/ Setting RSS parameters}).<br>&gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&g=
t; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; +If the feature VIRTIO_N=
ET_F_RSS was not negotiated:<br>&gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br=
>&gt; &nbsp; &nbsp; &gt; +\item The device uses \field{hash_types} of the v=
irtio_net_hash_config<br>&gt; &nbsp; &nbsp; structure as 'Enabled hash type=
s' bitmask.<br>&gt; &nbsp; &nbsp; &gt; +\item The device uses a key as defi=
ned in \field{hash_key_data} and \<br>&gt; &nbsp; &nbsp; field{hash_key_len=
gth} of the virtio_net_hash_config structure (see<br>&gt; &nbsp; &nbsp; &gt=
; +\ref{sec:Device Types / Network Device / Device Operation / Control<br>&=
gt; &nbsp; &nbsp; Virtqueue / Automatic receive steering in multiqueue mode=
 / Hash<br>&gt; &nbsp; &nbsp; calculation}).<br>&gt; &nbsp; &nbsp; &gt; +\e=
nd{itemize}<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; +Note t=
hat if the device offers VIRTIO_NET_F_HASH_REPORT, even if it<br>&gt; &nbsp=
; &nbsp; supports only one pair of virtqueues, it MUST support<br>&gt; &nbs=
p; &nbsp; &gt; +at least one of commands of VIRTIO_NET_CTRL_MQ class to con=
figure<br>&gt; &nbsp; &nbsp; reported hash parameters:<br>&gt; &nbsp; &nbsp=
; &gt; +\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; +\item If the device off=
ers VIRTIO_NET_F_RSS, it MUST support<br>&gt; &nbsp; &nbsp; VIRTIO_NET_CTRL=
_MQ_RSS_CONFIG command per<br>&gt; &nbsp; &nbsp; &gt; + \ref{sec:Device Typ=
es / Network Device / Device Operation / Control<br>&gt; &nbsp; &nbsp; Virt=
queue / Receive-side scaling (RSS) / Setting RSS parameters}.<br>&gt; &nbsp=
; &nbsp; &gt; +\item Otherwise the device MUST support VIRTIO_NET_CTRL_MQ_H=
ASH_CONFIG<br>&gt; &nbsp; &nbsp; command per<br>&gt; &nbsp; &nbsp; &gt; + \=
ref{sec:Device Types / Network Device / Device Operation / Control<br>&gt; =
&nbsp; &nbsp; Virtqueue / Automatic receive steering in multiqueue mode / H=
ash<br>&gt; &nbsp; &nbsp; calculation}.<br>&gt; &nbsp; &nbsp; &gt; +\end{it=
emize}<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; +\subparagra=
ph{Supported/enabled hash types}<br>&gt; &nbsp; &nbsp; &gt; +\label{sec:Dev=
ice Types / Network Device / Device Operation / Processing<br>&gt; &nbsp; &=
nbsp; of Incoming Packets / Hash calculation for incoming packets / Support=
ed/<br>&gt; &nbsp; &nbsp; enabled hash types}<br>&gt; &nbsp; &nbsp; &gt; +H=
ash types applicable for IPv4 packets:<br>&gt; &nbsp; &nbsp; &gt; +\begin{l=
stlisting}<br>&gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_TYPE_IPv4 &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 0)<br>&gt; &nbsp;=
 &nbsp; &gt; +#define VIRTIO_NET_HASH_TYPE_TCPv4 &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; (1 &lt;&lt; 1)<br>&gt; &nbsp; &nbsp; &gt; +#define VIRTIO_N=
ET_HASH_TYPE_UDPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 2)=
<br>&gt; &nbsp; &nbsp; &gt; +\end{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; +H=
ash types applicable for IPv6 packets without extension headers<br>&gt; &nb=
sp; &nbsp; &gt; +\begin{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; +#define VIR=
TIO_NET_HASH_TYPE_IPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &=
lt;&lt; 3)<br>&gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_TYPE_TCPv6 &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 4)<br>&gt; &nbsp; &nbs=
p; &gt; +#define VIRTIO_NET_HASH_TYPE_UDPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; (1 &lt;&lt; 5)<br>&gt; &nbsp; &nbsp; &gt; +\end{lstlisting}<br>&=
gt; &nbsp; &nbsp; &gt; +Hash types applicable for IPv6 packets with extensi=
on headers<br>&gt; &nbsp; &nbsp; &gt; +\begin{lstlisting}<br>&gt; &nbsp; &n=
bsp; &gt; +#define VIRTIO_NET_HASH_TYPE_IP_EX &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; (1 &lt;&lt; 6)<br>&gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_=
HASH_TYPE_TCP_EX &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 7)<br=
>&gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_TYPE_UDP_EX &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 8)<br>&gt; &nbsp; &nbsp; &gt; +\end=
{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; +\subp=
aragraph{IPv4 packets}<br>&gt; &nbsp; &nbsp; &gt; +\label{sec:Device Types =
/ Network Device / Device Operation / Processing<br>&gt; &nbsp; &nbsp; of I=
ncoming Packets / Hash calculation for incoming packets / IPv4 packets}<br>=
&gt; &nbsp; &nbsp; &gt; +The device calculates the hash on IPv4 packets acc=
ording to 'Enabled<br>&gt; &nbsp; &nbsp; hash types' bitmask as follows:<br=
>&gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; +\item=
 If VIRTIO_NET_HASH_TYPE_TCPv4 is set and the packet has<br>&gt; &nbsp; &nb=
sp; &gt; +a TCP header, the hash is calculated over the following fields:<b=
r>&gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; +\ite=
m Source IP address<br>&gt; &nbsp; &nbsp; &gt; +\item Destination IP addres=
s<br>&gt; &nbsp; &nbsp; &gt; +\item Source TCP port<br>&gt; &nbsp; &nbsp; &=
gt; +\item Destination TCP port<br>&gt; &nbsp; &nbsp; &gt; +\end{itemize}<b=
r>&gt; &nbsp; &nbsp; &gt; +\item Else if VIRTIO_NET_HASH_TYPE_UDPv4 is set =
and the<br>&gt; &nbsp; &nbsp; &gt; +packet has a UDP header, the hash is ca=
lculated over the following<br>&gt; &nbsp; &nbsp; fields:<br>&gt; &nbsp; &n=
bsp; &gt; +\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; +\item Source IP addr=
ess<br>&gt; &nbsp; &nbsp; &gt; +\item Destination IP address<br>&gt; &nbsp;=
 &nbsp; &gt; +\item Source UDP port<br>&gt; &nbsp; &nbsp; &gt; +\item Desti=
nation UDP port<br>&gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &nbsp; &n=
bsp; &gt; +\item Else if VIRTIO_NET_HASH_TYPE_IPv4 is set, the hash is<br>&=
gt; &nbsp; &nbsp; &gt; +calculated over the following fields:<br>&gt; &nbsp=
; &nbsp; &gt; +\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; +\item Source IP =
address<br>&gt; &nbsp; &nbsp; &gt; +\item Destination IP address<br>&gt; &n=
bsp; &nbsp; &gt; +\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; +\item Else the =
device does not calculate the hash<br>&gt; &nbsp; &nbsp; &gt; +\end{itemize=
}<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; +\subparagraph{IP=
v6 packets without extension header}<br>&gt; &nbsp; &nbsp; &gt; +\label{sec=
:Device Types / Network Device / Device Operation / Processing<br>&gt; &nbs=
p; &nbsp; of Incoming Packets / Hash calculation for incoming packets / IPv=
6 packets<br>&gt; &nbsp; &nbsp; without extension header}<br>&gt; &nbsp; &n=
bsp; &gt; +The device calculates the hash on IPv6 packets without extension=
<br>&gt; &nbsp; &nbsp; &gt; +headers according to 'Enabled hash types' bitm=
ask as follows:<br>&gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&gt; &nbsp; =
&nbsp; &gt; +\item If VIRTIO_NET_HASH_TYPE_TCPv6 is set and the packet has<=
br>&gt; &nbsp; &nbsp; &gt; +a TCPv6 header, the hash is calculated over the=
 following fields:<br>&gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&gt; &nbs=
p; &nbsp; &gt; +\item Source IPv6 address<br>&gt; &nbsp; &nbsp; &gt; +\item=
 Destination IPv6 address<br>&gt; &nbsp; &nbsp; &gt; +\item Source TCP port=
<br>&gt; &nbsp; &nbsp; &gt; +\item Destination TCP port<br>&gt; &nbsp; &nbs=
p; &gt; +\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; +\item Else if VIRTIO_NET=
_HASH_TYPE_UDPv6 is set and the<br>&gt; &nbsp; &nbsp; &gt; +packet has a UD=
Pv6 header, the hash is calculated over the following<br>&gt; &nbsp; &nbsp;=
 fields:<br>&gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&gt; &nbsp; &nbsp; =
&gt; +\item Source IPv6 address<br>&gt; &nbsp; &nbsp; &gt; +\item Destinati=
on IPv6 address<br>&gt; &nbsp; &nbsp; &gt; +\item Source UDP port<br>&gt; &=
nbsp; &nbsp; &gt; +\item Destination UDP port<br>&gt; &nbsp; &nbsp; &gt; +\=
end{itemize}<br>&gt; &nbsp; &nbsp; &gt; +\item Else if VIRTIO_NET_HASH_TYPE=
_IPv6 is set, the hash is<br>&gt; &nbsp; &nbsp; &gt; +calculated over the f=
ollowing fields:<br>&gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&gt; &nbsp;=
 &nbsp; &gt; +\item Source IPv6 address<br>&gt; &nbsp; &nbsp; &gt; +\item D=
estination IPv6 address<br>&gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &=
nbsp; &nbsp; &gt; +\item Else the device does not calculate the hash<br>&gt=
; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &n=
bsp; &nbsp; &gt; +\subparagraph{IPv6 packets with extension header}<br>&gt;=
 &nbsp; &nbsp; &gt; +\label{sec:Device Types / Network Device / Device Oper=
ation / Processing<br>&gt; &nbsp; &nbsp; of Incoming Packets / Hash calcula=
tion for incoming packets / IPv6 packets<br>&gt; &nbsp; &nbsp; with extensi=
on header}<br>&gt; &nbsp; &nbsp; &gt; +The device calculates the hash on IP=
v6 packets with extension<br>&gt; &nbsp; &nbsp; &gt; +headers according to =
'Enabled hash types' bitmask as follows:<br>&gt; &nbsp; &nbsp; &gt; +\begin=
{itemize}<br>&gt; &nbsp; &nbsp; &gt; +\item If VIRTIO_NET_HASH_TYPE_TCP_EX =
is set and the packet<br>&gt; &nbsp; &nbsp; &gt; +has a TCPv6 header, the h=
ash is calculated over the following fields:<br>&gt; &nbsp; &nbsp; &gt; +\b=
egin{itemize}<br>&gt; &nbsp; &nbsp; &gt; +\item Home address from the home =
address option in the IPv6 destination<br>&gt; &nbsp; &nbsp; options header=
. If the extension header is not present, use the Source IPv6<br>&gt; &nbsp=
; &nbsp; address.<br>&gt; &nbsp; &nbsp; &gt; +\item IPv6 address that is co=
ntained in the Routing-Header-Type-2 from<br>&gt; &nbsp; &nbsp; the associa=
ted extension header. If the extension header is not present,<br>&gt; &nbsp=
; &nbsp; use the Destination IPv6 address.<br>&gt; &nbsp; &nbsp; &gt; +\ite=
m Source TCP port<br>&gt; &nbsp; &nbsp; &gt; +\item Destination TCP port<br=
>&gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; +\item E=
lse if VIRTIO_NET_HASH_TYPE_UDP_EX is set and the<br>&gt; &nbsp; &nbsp; &gt=
; +packet has a UDPv6 header, the hash is calculated over the following<br>=
&gt; &nbsp; &nbsp; fields:<br>&gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&=
gt; &nbsp; &nbsp; &gt; +\item Home address from the home address option in =
the IPv6 destination<br>&gt; &nbsp; &nbsp; options header. If the extension=
 header is not present, use the Source IPv6<br>&gt; &nbsp; &nbsp; address.<=
br>&gt; &nbsp; &nbsp; &gt; +\item IPv6 address that is contained in the Rou=
ting-Header-Type-2 from<br>&gt; &nbsp; &nbsp; the associated extension head=
er. If the extension header is not present,<br>&gt; &nbsp; &nbsp; use the D=
estination IPv6 address.<br>&gt; &nbsp; &nbsp; &gt; +\item Source UDP port<=
br>&gt; &nbsp; &nbsp; &gt; +\item Destination UDP port<br>&gt; &nbsp; &nbsp=
; &gt; +\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; +\item Else if VIRTIO_NET_=
HASH_TYPE_IP_EX is set, the hash is<br>&gt; &nbsp; &nbsp; &gt; +calculated =
over the following fields:<br>&gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&=
gt; &nbsp; &nbsp; &gt; +\item Home address from the home address option in =
the IPv6 destination<br>&gt; &nbsp; &nbsp; options header. If the extension=
 header is not present, use the Source IPv6<br>&gt; &nbsp; &nbsp; address.<=
br>&gt; &nbsp; &nbsp; &gt; +\item IPv6 address that is contained in the Rou=
ting-Header-Type-2 from<br>&gt; &nbsp; &nbsp; the associated extension head=
er. If the extension header is not present,<br>&gt; &nbsp; &nbsp; use the D=
estination IPv6 address.<br>&gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; =
&nbsp; &nbsp; &gt; +\item Else skip IPv6 extension headers and calculate th=
e hash as<br>&gt; &nbsp; &nbsp; &gt; +defined for an IPv6 packet without ex=
tension headers<br>&gt; &nbsp; &nbsp; &gt; +(see \ref{sec:Device Types / Ne=
twork Device / Device Operation /<br>&gt; &nbsp; &nbsp; Processing of Incom=
ing Packets / Hash calculation for incoming packets /<br>&gt; &nbsp; &nbsp;=
 IPv6 packets without extension header}).<br>&gt; &nbsp; &nbsp; &gt; +\end{=
itemize}<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; +\paragrap=
h{Hash reporting for incoming packets}<br>&gt; &nbsp; &nbsp; &gt; +\label{s=
ec:Device Types / Network Device / Device Operation / Processing<br>&gt; &n=
bsp; &nbsp; of Incoming Packets / Hash reporting for incoming packets}<br>&=
gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; +If VIRTIO_NET_F_HASH_R=
EPORT was negotiated and<br>&gt; &nbsp; &nbsp; &gt; + the device has calcul=
ated the hash for the packet, the device fills \<br>&gt; &nbsp; &nbsp; fiel=
d{hash_type} with the type of calculated hash<br>&gt; &nbsp; &nbsp; &gt; +a=
nd \field{hash_value} with the value of calculated hash.<br>&gt; &nbsp; &nb=
sp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; +If VIRTIO_NET_F_HASH_REPORT was nego=
tiated but due to any reason the<br>&gt; &nbsp; &nbsp; &gt; +hash was not c=
alculated, the device sets \field{hash_type} to<br>&gt; &nbsp; &nbsp; VIRTI=
O_NET_HASH_REPORT_NONE.<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; =
&gt; +Possible values that the device can report in \field{hash_type} are<b=
r>&gt; &nbsp; &nbsp; defined below.<br>&gt; &nbsp; &nbsp; &gt; +They corres=
pond to supported hash types defined in<br>&gt; &nbsp; &nbsp; &gt; +\ref{se=
c:Device Types / Network Device / Device Operation / Processing<br>&gt; &nb=
sp; &nbsp; of Incoming Packets / Hash calculation for incoming packets / Su=
pported/<br>&gt; &nbsp; &nbsp; enabled hash types}<br>&gt; &nbsp; &nbsp; &g=
t; +as follows:<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; +VI=
RTIO_NET_HASH_TYPE_XXX =3D 1 &lt;&lt; (VIRTIO_NET_HASH_REPORT_XXX - 1)<br>&=
gt; <br>&gt; <br>&gt; &nbsp; &nbsp; So hash_type is the HASH_REPORT value t=
hen? That's quite confusing.<br>&gt; &nbsp; &nbsp; Let's rename to hash_rep=
ort?<br>&gt; <br>&gt; No problem to rename anything, but I'd like to do it =
one time.<br>&gt; Currently meaningful hash report values are (1..9), 0 for=
 none<br>&gt; They correspond to bitmask of 9 bits for enabled/supported.<b=
r>&gt; It was possible to use the same definitions for enable/support/repor=
t<br>&gt; but then reported kind of hash should be 4 bytes.<br>&gt; As you =
anyway suggests padding at the end of the packet, we can do that,<br>&gt; i=
.e. add (32 bit hash + 32 bit type)<br><div><br></div>We can but it seems l=
ike a waste, does it not? padding can be used for<br>something later ...<br=
><div><br></div>&gt; Or if we stay with the values as they are now:<br>&gt;=
 values 0..9 - VIRTIO_NET_WHAT?<br><div><br></div>I thought that's VIRTIO_N=
ET_HASH_REPORT_XXX<br></blockquote><div>OK, this is exactly what is defined=
<br></div><div><br></div><blockquote style=3D"border-left:2px solid #1010FF=
;margin-left:5px;padding-left:5px;color:#000;font-weight:normal;font-style:=
normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-siz=
e:12pt;">&gt; bits from 0 to 8 - VIRTIO_NET_WHAT?<br><div><br></div><br>and=
 this one VIRTIO_NET_HASH_TYPE_XXX?<br></blockquote><div><div>OK, this is a=
lso exactly what is defined</div><div><br></div></div><blockquote style=3D"=
border-left:2px solid #1010FF;margin-left:5px;padding-left:5px;color:#000;f=
ont-weight:normal;font-style:normal;text-decoration:none;font-family:Helvet=
ica,Arial,sans-serif;font-size:12pt;"><br><div><br></div>Generally what you=
 did here is a bit unusual. Mostly we just define<br>bit numbers<br>&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#define VIRTIO_SCSI_F_INOUT &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0<br>&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#define VIRTIO_SCSI_F_HOTPLUG &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1<br>&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#define VIRTIO_SCSI_F_CHANGE &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2<br>&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#define VIRTIO_SCSI_F_T10_PI &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3<br></blockquote><div><br>=
</div><div>Value 0 of hash_report is "no hash calculated" and it does not<b=
r></div><div>participate in support/enable mask. I did not want to<br></div=
><div>use value other than zero for "no hash".<br></div><div><br></div><div=
>So you want bit 0 to be reserved (not used) in enable/support mask<br></di=
v><div>and then to have all the VIRTIO_NET_HASH_TYPE_XXX to be<br></div><di=
v>exactly 1 &lt;&lt; VIRTIO_NET_HASH_REPORT_XXX? Just say...<br></div><div>=
<br></div><div><br></div><blockquote style=3D"border-left:2px solid #1010FF=
;margin-left:5px;padding-left:5px;color:#000;font-weight:normal;font-style:=
normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-siz=
e:12pt;">and just say that bit numbers are from this table, with bit<br>0 c=
orresponding to the value 0, bit 1 to value 1 etc.<br><div><br></div><br>ma=
ybe that would have been easier on the eyes - I didn't try,<br>I'm not even=
 sure.<br><div><br></div>But what you have is correct enough, we can always=
 try to<br>improve the wording later.<br><div><br></div><br>&gt; <br>&gt; <=
br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; +\begin{lstlisting}=
<br>&gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_REPORT_NONE &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;0<br>&gt; &nbsp; &nbsp; &gt; +#define VIRTIO=
_NET_HASH_REPORT_IPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1<br>&gt; &n=
bsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_REPORT_TCPv4 &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; 2<br>&gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_REPORT=
_UDPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3<br>&gt; &nbsp; &nbsp; &gt; +#de=
fine VIRTIO_NET_HASH_REPORT_IPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4=
<br>&gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_REPORT_TCPv6 &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; 5<br>&gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_=
HASH_REPORT_UDPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 6<br>&gt; &nbsp; &nbsp=
; &gt; +#define VIRTIO_NET_HASH_REPORT_IPv6_EX &nbsp; &nbsp; &nbsp; &nbsp; =
7<br>&gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_REPORT_TCPv6_EX &nbsp=
; &nbsp; &nbsp; &nbsp;8<br>&gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH=
_REPORT_UDPv6_EX &nbsp; &nbsp; &nbsp; &nbsp;9<br>&gt; &nbsp; &nbsp; &gt; +\=
end{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &nb=
sp;\subsubsection{Control Virtqueue}\label{sec:Device Types / Network<br>&g=
t; &nbsp; &nbsp; Device / Device Operation / Control Virtqueue}<br>&gt; &nb=
sp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp;The driver uses the=
 control virtqueue (if VIRTIO_NET_F_CTRL_VQ is<br>&gt; &nbsp; &nbsp; &gt; @=
@ -3896,6 +4064,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device<br>=
&gt; &nbsp; &nbsp; Types / Network Device / Devi<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp;#define VIRTIO_NET_CTRL_MQ &nbsp; &nbsp;4<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET &nbsp; &nbsp; &nbsp; &nbsp;=
0 (for automatic receive<br>&gt; &nbsp; &nbsp; steering)<br>&gt; &nbsp; &nb=
sp; &gt; &nbsp; #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;1 (for configurable<br>&gt; &nbsp; &nbsp; receive steering)<br=
>&gt; &nbsp; &nbsp; &gt; + #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG &nbsp; &n=
bsp; &nbsp; &nbsp; 2 (for configurable hash<br>&gt; &nbsp; &nbsp; calculati=
on)<br>&gt; &nbsp; &nbsp; &gt; &nbsp;\end{lstlisting}<br>&gt; &nbsp; &nbsp;=
 &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp;If more than one multiqueue m=
ode is negotiated, the resulting device<br>&gt; &nbsp; &nbsp; configuration=
 is defined by the last command sent by the driver.<br>&gt; &nbsp; &nbsp; &=
gt; @@ -3961,10 +4130,37 @@ \subsubsection{Control Virtqueue}\label<br>&gt;=
 &nbsp; &nbsp; {sec:Device Types / Network Device / Devi<br>&gt; &nbsp; &nb=
sp; &gt; &nbsp;according to the native endian of the guest rather than<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp;(necessarily when not using the legacy interfa=
ce) little-endian.<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; =
&gt; +\subparagraph{Hash calculation}\label{sec:Device Types / Network Devi=
ce<br>&gt; &nbsp; &nbsp; / Device Operation / Control Virtqueue / Automatic=
 receive steering in<br>&gt; &nbsp; &nbsp; multiqueue mode / Hash calculati=
on}<br>&gt; &nbsp; &nbsp; &gt; +If VIRTIO_NET_F_HASH_REPORT was negotiated =
and the device uses automatic<br>&gt; &nbsp; &nbsp; receive steering,<br>&g=
t; &nbsp; &nbsp; &gt; +the device MUST support a command to configure hash =
calculation<br>&gt; &nbsp; &nbsp; parameters.<br>&gt; &nbsp; &nbsp; &gt; +<=
br>&gt; &nbsp; &nbsp; &gt; +The driver provides parameters for hash calcula=
tion as follows:<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; +\=
field{class} VIRTIO_NET_CTRL_MQ, \field{command}<br>&gt; &nbsp; &nbsp; VIRT=
IO_NET_CTRL_MQ_HASH_CONFIG.<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nb=
sp; &gt; +The \field{command-specific-data} has following format:<br>&gt; &=
nbsp; &nbsp; &gt; +\begin{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; +struct vi=
rtio_net_hash_config {<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp;le32 hash_=
types;<br>&gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp;le16 reserved[4];<br>&gt; =
&nbsp; &nbsp; &gt; + &nbsp; &nbsp;u8 hash_key_length;<br>&gt; &nbsp; &nbsp;=
 &gt; + &nbsp; &nbsp;u8 hash_key_data[hash_key_length];<br>&gt; &nbsp; &nbs=
p; &gt; +};<br>&gt; &nbsp; &nbsp; &gt; +\end{lstlisting}<br>&gt; &nbsp; &nb=
sp; &gt; +Field \field{hash_types} contains a bitmask of allowed hash types=
 as<br>&gt; &nbsp; &nbsp; &gt; +defined in<br>&gt; &nbsp; &nbsp; &gt; +\ref=
{sec:Device Types / Network Device / Device Operation / Processing<br>&gt; =
&nbsp; &nbsp; of Incoming Packets / Hash calculation for incoming packets /=
 Supported/<br>&gt; &nbsp; &nbsp; enabled hash types}.<br>&gt; &nbsp; &nbsp=
; &gt; +Initially the device has all hash types disabled and reports only<b=
r>&gt; &nbsp; &nbsp; VIRTIO_NET_HASH_REPORT_NONE.<br>&gt; &nbsp; &nbsp; &gt=
; +<br>&gt; &nbsp; &nbsp; &gt; +Field \field{reserved} MUST contain zeroes.=
 It is defined to make the<br>&gt; &nbsp; &nbsp; structure to match the lay=
out of virtio_net_rss_config structure,<br>&gt; &nbsp; &nbsp; &gt; +defined=
 in \ref{sec:Device Types / Network Device / Device Operation /<br>&gt; &nb=
sp; &nbsp; Control Virtqueue / Receive-side scaling (RSS)}.<br>&gt; &nbsp; =
&nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; +Fields \field{hash_key_length} an=
d \field{hash_key_data} define the key<br>&gt; &nbsp; &nbsp; to be used in =
hash calculation.<br>&gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &=
nbsp;\paragraph{Receive-side scaling (RSS)}\label{sec:Device Types / Networ=
k<br>&gt; &nbsp; &nbsp; Device / Device Operation / Control Virtqueue / Rec=
eive-side scaling (RSS)}<br>&gt; &nbsp; &nbsp; &gt; &nbsp;A device offers t=
he feature VIRTIO_NET_F_RSS if it supports RSS receive<br>&gt; &nbsp; &nbsp=
; steering with Toeplitz hash calculation and configurable parameters.<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; -A driver queries =
RSS capabilities of the device by reading device<br>&gt; &nbsp; &nbsp; conf=
iguration as defined in \ref{sec:Device Types / Network Device / Device<br>=
&gt; &nbsp; &nbsp; configuration layout / RSS}<br>&gt; &nbsp; &nbsp; &gt; +=
A driver queries RSS capabilities of the device by reading device<br>&gt; &=
nbsp; &nbsp; configuration as defined in \ref{sec:Device Types / Network De=
vice / Device<br>&gt; &nbsp; &nbsp; configuration layout}<br>&gt; &nbsp; &n=
bsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp;\subparagraph{Setting RSS=
 parameters}\label{sec:Device Types / Network<br>&gt; &nbsp; &nbsp; Device =
/ Device Operation / Control Virtqueue / Receive-side scaling (RSS)<br>&gt;=
 &nbsp; &nbsp; / Setting RSS parameters}<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<=
br>&gt; &nbsp; &nbsp; &gt; @@ -3981,7 +4177,8 @@ \subsubsection{Control Vir=
tqueue}\label{sec:Device<br>&gt; &nbsp; &nbsp; Types / Network Device / Dev=
i<br>&gt; &nbsp; &nbsp; &gt; &nbsp;};<br>&gt; &nbsp; &nbsp; &gt; &nbsp;\end=
{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; &nbsp;Field \field{hash_types} cont=
ains a bitmask of allowed hash types as<br>&gt; &nbsp; &nbsp; &gt; -defined=
 in \ref{sec:Device Types / Network Device / Device Operation /<br>&gt; &nb=
sp; &nbsp; Control Virtqueue / Receive-side scaling (RSS) / RSS hash types}=
.<br>&gt; &nbsp; &nbsp; &gt; +defined in<br>&gt; &nbsp; &nbsp; &gt; +\ref{s=
ec:Device Types / Network Device / Device Operation / Processing<br>&gt; &n=
bsp; &nbsp; of Incoming Packets / Hash calculation for incoming packets / S=
upported/<br>&gt; &nbsp; &nbsp; enabled hash types}.<br>&gt; &nbsp; &nbsp; =
&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp;Field \field{indirection_table=
_mask} is a mask to be applied to<br>&gt; &nbsp; &nbsp; &gt; &nbsp;the calc=
ulated hash to produce an index in the<br>&gt; &nbsp; &nbsp; &gt; @@ -3995,=
93 +4192,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device<br>&gt; &n=
bsp; &nbsp; Types / Network Device / Devi<br>&gt; &nbsp; &nbsp; &gt; &nbsp;=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp;A driver sets \field{max_tx_vq} to inform=
 a device how many transmit<br>&gt; &nbsp; &nbsp; virtqueues it may use (tr=
ansmitq1\ldots transmitq \field{max_tx_vq}).<br>&gt; &nbsp; &nbsp; &gt; &nb=
sp;<br>&gt; &nbsp; &nbsp; &gt; -\subparagraph{RSS hash types}\label{sec:Dev=
ice Types / Network Device /<br>&gt; &nbsp; &nbsp; Device Operation / Contr=
ol Virtqueue / Receive-side scaling (RSS) / RSS<br>&gt; &nbsp; &nbsp; hash =
types}<br>&gt; &nbsp; &nbsp; &gt; -<br>&gt; &nbsp; &nbsp; &gt; -The device =
calculates the hash on IPv4 packets according to the<br>&gt; &nbsp; &nbsp; =
&gt; -field \field{hash_types} of the virtio_net_rss_config structure as<br=
>&gt; &nbsp; &nbsp; follows:<br>&gt; &nbsp; &nbsp; &gt; -\begin{itemize}<br=
>&gt; &nbsp; &nbsp; &gt; -\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv4 is set an=
d the packet has<br>&gt; &nbsp; &nbsp; &gt; -a TCP header, the hash is calc=
ulated over the following fields:<br>&gt; &nbsp; &nbsp; &gt; -\begin{itemiz=
e}<br>&gt; &nbsp; &nbsp; &gt; -\item Source IP address<br>&gt; &nbsp; &nbsp=
; &gt; -\item Destination IP address<br>&gt; &nbsp; &nbsp; &gt; -\item Sour=
ce TCP port<br>&gt; &nbsp; &nbsp; &gt; -\item Destination TCP port<br>&gt; =
&nbsp; &nbsp; &gt; -\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; -\item Else if=
 VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set and the<br>&gt; &nbsp; &nbsp; &gt; -=
packet has a UDP header, the hash is calculated over the following<br>&gt; =
&nbsp; &nbsp; fields:<br>&gt; &nbsp; &nbsp; &gt; -\begin{itemize}<br>&gt; &=
nbsp; &nbsp; &gt; -\item Source IP address<br>&gt; &nbsp; &nbsp; &gt; -\ite=
m Destination IP address<br>&gt; &nbsp; &nbsp; &gt; -\item Source UDP port<=
br>&gt; &nbsp; &nbsp; &gt; -\item Destination UDP port<br>&gt; &nbsp; &nbsp=
; &gt; -\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; -\item Else if VIRTIO_NET_=
RSS_HASH_TYPE_IPv4 is set, the hash is<br>&gt; &nbsp; &nbsp; &gt; -calculat=
ed over the following fields:<br>&gt; &nbsp; &nbsp; &gt; -\begin{itemize}<b=
r>&gt; &nbsp; &nbsp; &gt; -\item Source IP address<br>&gt; &nbsp; &nbsp; &g=
t; -\item Destination IP address<br>&gt; &nbsp; &nbsp; &gt; -\end{itemize}<=
br>&gt; &nbsp; &nbsp; &gt; -\item Else the device does not calculate the ha=
sh<br>&gt; &nbsp; &nbsp; &gt; -\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; -<b=
r>&gt; &nbsp; &nbsp; &gt; -\label{itm:Device Types / Network Device / Devic=
e Operation / Control<br>&gt; &nbsp; &nbsp; Virtqueue / Receive-side scalin=
g (RSS) / RSS hash types/hash on IPv6<br>&gt; &nbsp; &nbsp; packets without=
 extension headers}<br>&gt; &nbsp; &nbsp; &gt; -The device calculates the h=
ash on IPv6 packets without extension<br>&gt; &nbsp; &nbsp; &gt; -headers a=
ccording to the field \field{hash_types} of the<br>&gt; &nbsp; &nbsp; virti=
o_net_rss_config structure as follows:<br>&gt; &nbsp; &nbsp; &gt; -\begin{i=
temize}<br>&gt; &nbsp; &nbsp; &gt; -\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6=
 is set and the packet has<br>&gt; &nbsp; &nbsp; &gt; -a TCPv6 header, the =
hash is calculated over the following fields:<br>&gt; &nbsp; &nbsp; &gt; -\=
begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; -\item Source IPv6 address<br>&gt=
; &nbsp; &nbsp; &gt; -\item Destination IPv6 address<br>&gt; &nbsp; &nbsp; =
&gt; -\item Source TCP port<br>&gt; &nbsp; &nbsp; &gt; -\item Destination T=
CP port<br>&gt; &nbsp; &nbsp; &gt; -\end{itemize}<br>&gt; &nbsp; &nbsp; &gt=
; -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is set and the<br>&gt; &nbs=
p; &nbsp; &gt; -packet has a UDPv6 header, the hash is calculated over the =
following<br>&gt; &nbsp; &nbsp; fields:<br>&gt; &nbsp; &nbsp; &gt; -\begin{=
itemize}<br>&gt; &nbsp; &nbsp; &gt; -\item Source IPv6 address<br>&gt; &nbs=
p; &nbsp; &gt; -\item Destination IPv6 address<br>&gt; &nbsp; &nbsp; &gt; -=
\item Source UDP port<br>&gt; &nbsp; &nbsp; &gt; -\item Destination UDP por=
t<br>&gt; &nbsp; &nbsp; &gt; -\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; -\it=
em Else if VIRTIO_NET_RSS_HASH_TYPE_IPv6 is set, the hash is<br>&gt; &nbsp;=
 &nbsp; &gt; -calculated over the following fields:<br>&gt; &nbsp; &nbsp; &=
gt; -\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; -\item Source IPv6 address<=
br>&gt; &nbsp; &nbsp; &gt; -\item Destination IPv6 address<br>&gt; &nbsp; &=
nbsp; &gt; -\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; -\item Else the device=
 does not calculate the hash<br>&gt; &nbsp; &nbsp; &gt; -\end{itemize}<br>&=
gt; &nbsp; &nbsp; &gt; -<br>&gt; &nbsp; &nbsp; &gt; -The device calculates =
the hash on IPv6 packets with extension<br>&gt; &nbsp; &nbsp; &gt; -headers=
 according to the field \field{hash_types} of the<br>&gt; &nbsp; &nbsp; vir=
tio_net_rss_config structure as follows:<br>&gt; &nbsp; &nbsp; &gt; -\begin=
{itemize}<br>&gt; &nbsp; &nbsp; &gt; -\item If VIRTIO_NET_RSS_HASH_TYPE_TCP=
_EX is set and the packet<br>&gt; &nbsp; &nbsp; &gt; -has a TCPv6 header, t=
he hash is calculated over the following fields:<br>&gt; &nbsp; &nbsp; &gt;=
 -\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; -\item Home address from the h=
ome address option in the IPv6 destination<br>&gt; &nbsp; &nbsp; options he=
ader. If the extension header is not present, use the Source IPv6<br>&gt; &=
nbsp; &nbsp; address.<br>&gt; &nbsp; &nbsp; &gt; -\item IPv6 address that i=
s contained in the Routing-Header-Type-2 from<br>&gt; &nbsp; &nbsp; the ass=
ociated extension header. If the extension header is not present,<br>&gt; &=
nbsp; &nbsp; use the Destination IPv6 address.<br>&gt; &nbsp; &nbsp; &gt; -=
\item Source TCP port<br>&gt; &nbsp; &nbsp; &gt; -\item Destination TCP por=
t<br>&gt; &nbsp; &nbsp; &gt; -\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; -\it=
em Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the<br>&gt; &nbsp; &n=
bsp; &gt; -packet has a UDPv6 header, the hash is calculated over the follo=
wing<br>&gt; &nbsp; &nbsp; fields:<br>&gt; &nbsp; &nbsp; &gt; -\begin{itemi=
ze}<br>&gt; &nbsp; &nbsp; &gt; -\item Home address from the home address op=
tion in the IPv6 destination<br>&gt; &nbsp; &nbsp; options header. If the e=
xtension header is not present, use the Source IPv6<br>&gt; &nbsp; &nbsp; a=
ddress.<br>&gt; &nbsp; &nbsp; &gt; -\item IPv6 address that is contained in=
 the Routing-Header-Type-2 from<br>&gt; &nbsp; &nbsp; the associated extens=
ion header. If the extension header is not present,<br>&gt; &nbsp; &nbsp; u=
se the Destination IPv6 address.<br>&gt; &nbsp; &nbsp; &gt; -\item Source U=
DP port<br>&gt; &nbsp; &nbsp; &gt; -\item Destination UDP port<br>&gt; &nbs=
p; &nbsp; &gt; -\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; -\item Else if VIR=
TIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is<br>&gt; &nbsp; &nbsp; &gt; =
-calculated over the following fields:<br>&gt; &nbsp; &nbsp; &gt; -\begin{i=
temize}<br>&gt; &nbsp; &nbsp; &gt; -\item Home address from the home addres=
s option in the IPv6 destination<br>&gt; &nbsp; &nbsp; options header. If t=
he extension header is not present, use the Source IPv6<br>&gt; &nbsp; &nbs=
p; address.<br>&gt; &nbsp; &nbsp; &gt; -\item IPv6 address that is containe=
d in the Routing-Header-Type-2 from<br>&gt; &nbsp; &nbsp; the associated ex=
tension header. If the extension header is not present,<br>&gt; &nbsp; &nbs=
p; use the Destination IPv6 address.<br>&gt; &nbsp; &nbsp; &gt; -\end{itemi=
ze}<br>&gt; &nbsp; &nbsp; &gt; -\item Else skip IPv6 extension headers and =
calculate the hash as<br>&gt; &nbsp; &nbsp; &gt; -defined for an IPv6 packe=
t without extension headers (see \ref<br>&gt; &nbsp; &nbsp; {itm:Device Typ=
es / Network Device / Device Operation / Control Virtqueue /<br>&gt; &nbsp;=
 &nbsp; Receive-side scaling (RSS) / RSS hash types/hash on IPv6 packets wi=
thout<br>&gt; &nbsp; &nbsp; extension headers}).<br>&gt; &nbsp; &nbsp; &gt;=
 -\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; +Fields \field{hash_key_length} =
and \field{hash_key_data} define the key<br>&gt; &nbsp; &nbsp; to be used i=
n hash calculation.<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp;=
 &gt; &nbsp;\drivernormative{\subparagraph}{Setting RSS parameters}{Device =
Types /<br>&gt; &nbsp; &nbsp; Network Device / Device Operation / Control V=
irtqueue / Receive-side<br>&gt; &nbsp; &nbsp; scaling (RSS) }<br>&gt; &nbsp=
; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; @@ -4093,12 +4204,12 @@ \su=
bsubsection{Control Virtqueue}\label<br>&gt; &nbsp; &nbsp; {sec:Device Type=
s / Network Device / Devi<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; =
&nbsp; &gt; &nbsp;A driver MUST use \field{indirection_table_mask} values t=
hat are less<br>&gt; &nbsp; &nbsp; than \field{rss_max_indirection_table_le=
ngth} reported by a device.<br>&gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp=
; &nbsp; &gt; -A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags th=
at are not<br>&gt; &nbsp; &nbsp; supported by a device.<br>&gt; &nbsp; &nbs=
p; &gt; +A driver MUST NOT set any VIRTIO_NET_HASH_TYPE_ flags that are not=
<br>&gt; &nbsp; &nbsp; supported by a device.<br>&gt; &nbsp; &nbsp; &gt; &n=
bsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp;\devicenormative{\subparagraph}{RSS p=
rocessing}{Device Types / Network<br>&gt; &nbsp; &nbsp; Device / Device Ope=
ration / Control Virtqueue / Receive-side scaling (RSS)<br>&gt; &nbsp; &nbs=
p; / RSS processing}<br>&gt; &nbsp; &nbsp; &gt; &nbsp;The device MUST deter=
mine the destination queue for a network packet as<br>&gt; &nbsp; &nbsp; fo=
llows:<br>&gt; &nbsp; &nbsp; &gt; &nbsp;\begin{itemize}<br>&gt; &nbsp; &nbs=
p; &gt; -\item Calculate the hash of the packet as defined in \ref{sec:Devi=
ce<br>&gt; &nbsp; &nbsp; Types / Network Device / Device Operation / Contro=
l Virtqueue /<br>&gt; &nbsp; &nbsp; Receive-side scaling (RSS) / RSS hash t=
ypes}<br>&gt; &nbsp; &nbsp; &gt; +\item Calculate the hash of the packet as=
 defined in \ref{sec:Device<br>&gt; &nbsp; &nbsp; Types / Network Device / =
Device Operation / Processing of Incoming Packets<br>&gt; &nbsp; &nbsp; / H=
ash calculation for incoming packets}.<br>&gt; &nbsp; &nbsp; &gt; &nbsp;\it=
em If the device did not calculate the hash for the specific packet,<br>&gt=
; &nbsp; &nbsp; the device directs the packet to the receiveq specified by =
\field<br>&gt; &nbsp; &nbsp; {unclassified_queue} of virtio_net_rss_config =
structure (value of 0<br>&gt; &nbsp; &nbsp; corresponds to receiveq1).<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp;\item Apply \field{indirection_table_mask} to =
the calculated hash and<br>&gt; &nbsp; &nbsp; use the result as the index i=
n the indirection table to get 0-based number<br>&gt; &nbsp; &nbsp; of dest=
ination receiveq (value of 0 corresponds to receiveq1).<br>&gt; &nbsp; &nbs=
p; &gt; &nbsp;\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; --<br>&gt; &nbsp; &n=
bsp; &gt; 2.17.1<br>&gt; <br>&gt; <br>&gt; &nbsp; &nbsp; This publicly arch=
ived list offers a means to provide input to the<br>&gt; &nbsp; &nbsp; OASI=
S Virtual I/O Device (VIRTIO) TC.<br>&gt; <br>&gt; &nbsp; &nbsp; In order t=
o verify user consent to the Feedback License terms and<br>&gt; &nbsp; &nbs=
p; to minimize spam in the list archive, subscription is required<br>&gt; &=
nbsp; &nbsp; before posting.<br>&gt; <br>&gt; &nbsp; &nbsp; Subscribe: virt=
io-comment-subscribe@lists.oasis-open.org<br>&gt; &nbsp; &nbsp; Unsubscribe=
: virtio-comment-unsubscribe@lists.oasis-open.org<br>&gt; &nbsp; &nbsp; Lis=
t help: virtio-comment-help@lists.oasis-open.org<br>&gt; &nbsp; &nbsp; List=
 archive: https://lists.oasis-open.org/archives/virtio-comment/<br>&gt; &nb=
sp; &nbsp; Feedback License: https://www.oasis-open.org/who/ipr/feedback_li=
cense.pdf<br>&gt; &nbsp; &nbsp; List Guidelines: https://www.oasis-open.org=
/policies-guidelines/<br>&gt; &nbsp; &nbsp; mailing-lists<br>&gt; &nbsp; &n=
bsp; Committee: https://www.oasis-open.org/committees/virtio/<br>&gt; &nbsp=
; &nbsp; Join OASIS: https://www.oasis-open.org/join/<br>&gt; <br>&gt; <br>=
&gt; <br><div><br></div></blockquote><div><br></div></div></body></html>
------=_Part_7261239_1035068924.1582123777149--

