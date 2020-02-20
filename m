Return-Path: virtio-comment-return-1073-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 55F51985EF2
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Feb 2020 06:13:45 +0000 (UTC)
Date: Thu, 20 Feb 2020 01:13:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200220010754-mutt-send-email-mst@kernel.org>
References: <20200219075337.23191-1-yuri.benditovich@daynix.com>
 <20200219075337.23191-2-yuri.benditovich@daynix.com>
 <20200219040122-mutt-send-email-mst@kernel.org>
 <1841911156.7222325.1582110433680.JavaMail.zimbra@redhat.com>
 <20200219092917-mutt-send-email-mst@kernel.org>
 <1785864968.7261240.1582123777151.JavaMail.zimbra@redhat.com>
 <20200219095236-mutt-send-email-mst@kernel.org>
 <575584881.7345661.1582175341197.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
In-Reply-To: <575584881.7345661.1582175341197.JavaMail.zimbra@redhat.com>
Subject: Re: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define
 per-packet hash reporting feature
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Yuri Benditovich <ybendito@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Feb 20, 2020 at 12:09:01AM -0500, Yuri Benditovich wrote:
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
>     To: "Yuri Benditovich" <ybendito@redhat.com>
>     Cc: "Yuri Benditovich" <yuri.benditovich@daynix.com>,
>     virtio-comment@lists.oasis-open.org
>     Sent: Wednesday, February 19, 2020 4:56:04 PM
>     Subject: Re: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define
>     per-packet hash reporting feature
>=20
>     On Wed, Feb 19, 2020 at 09:49:37AM -0500, Yuri Benditovich wrote:
>     >
>     >
>     >
>     =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81
>     >
>     >     From: "Michael S. Tsirkin" <mst@redhat.com>
>     >     To: "Yuri Benditovich" <ybendito@redhat.com>
>     >     Cc: "Yuri Benditovich" <yuri.benditovich@daynix.com>,
>     >     virtio-comment@lists.oasis-open.org
>     >     Sent: Wednesday, February 19, 2020 4:35:49 PM
>     >     Subject: Re: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: De=
fine
>     >     per-packet hash reporting feature
>     >
>     >     On Wed, Feb 19, 2020 at 06:07:13AM -0500, Yuri Benditovich wrot=
e:
>     >     >
>     >     >
>     >     >
>     >   =20
>     =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81
>     >     >
>     >     >     From: "Michael S. Tsirkin" <mst@redhat.com>
>     >     >     To: "Yuri Benditovich" <yuri.benditovich@daynix.com>
>     >     >     Cc: virtio-comment@lists.oasis-open.org
>     >     >     Sent: Wednesday, February 19, 2020 11:12:40 AM
>     >     >     Subject: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: =
Define
>     >     per-packet
>     >     >     hash reporting feature
>     >     >
>     >     >     On Wed, Feb 19, 2020 at 09:53:37AM +0200, Yuri Benditovic=
h
>     wrote:
>     >     >     > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/=
66
>     >     >     > Define respective feature bit for virtio-net.
>     >     >     > Extend packet layout to populate hash value and type.
>     >     >     > Move the definition of IP/TCP/UDP header fields to
>     >     >     > calculate the hash out of RSS section to common network
>     >     >     > device section.
>     >     >     >
>     >     >     > Signed-off-by: Yuri Benditovich <yuri.benditovich@dayni=
x.com>
>     >     >     > ---
>     >     >     >  content.tex | 347
>     >     ++++++++++++++++++++++++++++++++++------------------
>     >     >     >  1 file changed, 229 insertions(+), 118 deletions(-)
>     >     >     >
>     >     >     > diff --git a/content.tex b/content.tex
>     >     >     > index b91a132..d7d4e42 100644
>     >     >     > --- a/content.tex
>     >     >     > +++ b/content.tex
>     >     >     > @@ -2895,6 +2895,9 @@ \subsection{Feature bits}\label
>     {sec:Device
>     >     Types /
>     >     >     Network Device / Feature bits
>     >     >     >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address
>     through
>     >     control
>     >     >     >      channel.
>     >     >     > =20
>     >     >     > +\item[VIRTIO_NET_F_HASH_REPORT(57)] Device can report
>     per-packet
>     >     hash
>     >     >     > +    value and a type of calculated hash.
>     >     >     > +
>     >     >     >  \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provid=
e the
>     exact
>     >     \field
>     >     >     {hdr_len}
>     >     >     >      value. Device benefits from knowing the exact head=
er
>     length.
>     >     >     > =20
>     >     >     > @@ -2995,35 +2998,17 @@ \subsection{Device configuratio=
n
>     layout}\
>     >     label
>     >     >     {sec:Device Types / Network Device
>     >     >     >          le32 supported_hash_types;
>     >     >     >  };
>     >     >     >  \end{lstlisting}
>     >     >     > -\label{sec:Device Types / Network Device / Device
>     configuration
>     >     layout /
>     >     >     RSS}
>     >     >     > -Three following fields, \field{rss_max_key_size}, \fie=
ld
>     >     >     {rss_max_indirection_table_length}
>     >     >     > -and \field{supported_hash_types} only exist if
>     VIRTIO_NET_F_RSS is
>     >     set.
>     >     >     > +The following field, \field{rss_max_key_size} only exi=
st if
>     >     >     VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT is set.
>     >     >     > +It specifies the maximal supported length of RSS key i=
n
>     bytes.
>     >     >     > =20
>     >     >     > -Field \field{rss_max_key_size} specifies the maximal
>     supported
>     >     length of
>     >     >     RSS key in bytes.
>     >     >     > +The following field, \field
>     {rss_max_indirection_table_length} only
>     >     exist
>     >     >     if VIRTIO_NET_F_RSS is set.
>     >     >     > +It specifies the maximal number of 16-bit entries in R=
SS
>     >     indirection
>     >     >     table.
>     >     >     > =20
>     >     >     > -Field \field{rss_max_indirection_table_length} specifi=
es the
>     >     maximal
>     >     >     number of 16-bit entries in RSS indirection table.
>     >     >     > +The next field, \field{supported_hash_types} exists on=
ly if
>     the
>     >     device
>     >     >     supports hash calculation,
>     >     >     > +i.e. if VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT i=
s set.
>     >     >     > =20
>     >     >     > -Field \field{supported_hash_types} contains the bitmas=
k of
>     >     supported RSS
>     >     >     hash types.
>     >     >     > -
>     >     >     > -Hash types applicable for IPv4 packets:
>     >     >     > -\begin{lstlisting}
>     >     >     > -#define VIRTIO_NET_RSS_HASH_TYPE_IPv4              (1 =
<< 0)
>     >     >     > -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4             (1 =
<< 1)
>     >     >     > -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4             (1 =
<< 2)
>     >     >     > -\end{lstlisting}
>     >     >     > -Hash types applicable for IPv6 packets without extensi=
on
>     headers
>     >     >     > -\begin{lstlisting}
>     >     >     > -#define VIRTIO_NET_RSS_HASH_TYPE_IPv6              (1 =
<< 3)
>     >     >     > -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6             (1 =
<< 4)
>     >     >     > -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6             (1 =
<< 5)
>     >     >     > -\end{lstlisting}
>     >     >     > -Hash types applicable for IPv6 packets with extension
>     headers
>     >     >     > -\begin{lstlisting}
>     >     >     > -#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX             (1 =
<< 6)
>     >     >     > -#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX            (1 =
<< 7)
>     >     >     > -#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX            (1 =
<< 8)
>     >     >     > -\end{lstlisting}
>     >     >     > -For the exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ fla=
gs see
>     \ref
>     >     >     {sec:Device Types / Network Device / Device Operation / C=
ontrol
>     >     Virtqueue /
>     >     >     Receive-side scaling (RSS) / RSS hash types}.
>     >     >     > +Field \field{supported_hash_types} contains the bitmas=
k of
>     >     supported
>     >     >     hash types.
>     >     >     > +See \ref{sec:Device Types / Network Device / Device
>     Operation /
>     >     >     Processing of Incoming Packets / Hash calculation for inc=
oming
>     >     packets /
>     >     >     Supported/enabled hash types} for details of supported ha=
sh
>     types.
>     >     >     > =20
>     >     >     >  \devicenormative{\subsubsection}{Device configuration
>     layout}
>     >     {Device
>     >     >     Types / Network Device / Device configuration layout}
>     >     >     > =20
>     >     >     > @@ -3048,7 +3033,7 @@ \subsection{Device configuration
>     layout}\
>     >     label
>     >     >     {sec:Device Types / Network Device
>     >     >     >  negotiated.
>     >     >     > =20
>     >     >     >  The device MUST set \field{rss_max_key_size} to at lea=
st 40,
>     if it
>     >     >     offers
>     >     >     > -VIRTIO_NET_F_RSS.
>     >     >     > +VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
>     >     >     > =20
>     >     >     >  The device MUST set \field{rss_max_indirection_table_l=
ength}
>     to at
>     >     least
>     >     >     128, if it offers
>     >     >     >  VIRTIO_NET_F_RSS.
>     >     >     > @@ -3195,6 +3180,8 @@ \subsection{Device Operation}\lab=
el
>     >     {sec:Device
>     >     >     Types / Network Device / Device O
>     >     >     >          le16 csum_start;
>     >     >     >          le16 csum_offset;
>     >     >     >          le16 num_buffers;
>     >     >     > +        le32 hash_value; (Only if VIRTIO_NET_F_HASH_RE=
PORT
>     >     negotiated)
>     >     >     > +        le16 hash_type;  (Only if VIRTIO_NET_F_HASH_RE=
PORT
>     >     negotiated)
>     >     >     >  };
>     >     >
>     >     >     Just noticed this - it's a bit problematic as it might fo=
rce
>     >     >     compilers to add 2 bytes of padding at the end. Let's add=
 extra
>     2
>     >     bytes
>     >     >     of padding explicitly?
>     >     >
>     >     > OK, no problem
>     >     >
>     >     >
>     >     >
>     >     >
>     >     >     >  \end{lstlisting}
>     >     >     > =20
>     >     >     > @@ -3517,6 +3504,12 @@ \subsubsection{Processing of Inc=
oming
>     >     Packets}\
>     >     >     label{sec:Device Types / Network
>     >     >     > =20
>     >     >     >  \end{enumerate}
>     >     >     > =20
>     >     >     > +If applicable, the device calculates per-packet hash f=
or
>     incoming
>     >     >     packets as
>     >     >     > +defined in \ref{sec:Device Types / Network Device / De=
vice
>     >     Operation /
>     >     >     Processing of Incoming Packets / Hash calculation for inc=
oming
>     >     packets}.
>     >     >     > +
>     >     >     > +If applicable, the device reports hash information for
>     incoming
>     >     packets
>     >     >     as
>     >     >     > +defined in \ref{sec:Device Types / Network Device / De=
vice
>     >     Operation /
>     >     >     Processing of Incoming Packets / Hash reporting for incom=
ing
>     >     packets}.
>     >     >     > +
>     >     >     >  \devicenormative{\paragraph}{Processing of Incoming Pa=
ckets}
>     >     {Device
>     >     >     Types / Network Device / Device Operation / Processing of
>     Incoming
>     >     Packets}
>     >     >     >  \label{devicenormative:Device Types / Network Device /
>     Device
>     >     Operation
>     >     >     / Processing of Packets}%old label for latexdiff
>     >     >     > =20
>     >     >     > @@ -3619,6 +3612,181 @@ \subsubsection{Processing of In=
coming
>     >     Packets}\
>     >     >     label{sec:Device Types / Network
>     >     >     >  If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
>     >     >     >  VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NO=
T
>     >     >     >  rely on the packet checksum being correct.
>     >     >     > +
>     >     >     > +\paragraph{Hash calculation for incoming packets}
>     >     >     > +\label{sec:Device Types / Network Device / Device Oper=
ation
>     /
>     >     Processing
>     >     >     of Incoming Packets / Hash calculation for incoming packe=
ts}
>     >     >     > +
>     >     >     > +A device attempts to calculate a per-packet hash in th=
e
>     following
>     >     cases:
>     >     >     > +\begin{itemize}
>     >     >     > +\item The feature VIRTIO_NET_F_RSS was negotiated. The
>     device uses
>     >     the
>     >     >     hash to determine the receive virtqueue to place incoming
>     packets.
>     >     >     > +\item The feature VIRTIO_NET_F_HASH_REPORT was negotia=
ted.
>     The
>     >     device
>     >     >     reports the hash value and the hash type with the packet.
>     >     >     > +\end{itemize}
>     >     >     > +
>     >     >     > +If the feature VIRTIO_NET_F_RSS was negotiated:
>     >     >     > +\begin{itemize}
>     >     >     > +\item The device uses \field{hash_types} of the
>     >     virtio_net_rss_config
>     >     >     structure as 'Enabled hash types' bitmask.
>     >     >     > +\item The device uses a key as defined in \field
>     {hash_key_data}
>     >     and \
>     >     >     field{hash_key_length} of the virtio_net_rss_config struc=
ture
>     (see
>     >     >     > +\ref{sec:Device Types / Network Device / Device Operat=
ion /
>     >     Control
>     >     >     Virtqueue / Receive-side scaling (RSS) / Setting RSS
>     parameters}).
>     >     >     > +\end{itemize}
>     >     >     > +
>     >     >     > +If the feature VIRTIO_NET_F_RSS was not negotiated:
>     >     >     > +\begin{itemize}
>     >     >     > +\item The device uses \field{hash_types} of the
>     >     virtio_net_hash_config
>     >     >     structure as 'Enabled hash types' bitmask.
>     >     >     > +\item The device uses a key as defined in \field
>     {hash_key_data}
>     >     and \
>     >     >     field{hash_key_length} of the virtio_net_hash_config stru=
cture
>     (see
>     >     >     > +\ref{sec:Device Types / Network Device / Device Operat=
ion /
>     >     Control
>     >     >     Virtqueue / Automatic receive steering in multiqueue mode=
 /
>     Hash
>     >     >     calculation}).
>     >     >     > +\end{itemize}
>     >     >     > +
>     >     >     > +Note that if the device offers VIRTIO_NET_F_HASH_REPOR=
T,
>     even if
>     >     it
>     >     >     supports only one pair of virtqueues, it MUST support
>     >     >     > +at least one of commands of VIRTIO_NET_CTRL_MQ class t=
o
>     configure
>     >     >     reported hash parameters:
>     >     >     > +\begin{itemize}
>     >     >     > +\item If the device offers VIRTIO_NET_F_RSS, it MUST s=
upport
>     >     >     VIRTIO_NET_CTRL_MQ_RSS_CONFIG command per
>     >     >     > + \ref{sec:Device Types / Network Device / Device Opera=
tion /
>     >     Control
>     >     >     Virtqueue / Receive-side scaling (RSS) / Setting RSS
>     parameters}.
>     >     >     > +\item Otherwise the device MUST support
>     >     VIRTIO_NET_CTRL_MQ_HASH_CONFIG
>     >     >     command per
>     >     >     > + \ref{sec:Device Types / Network Device / Device Opera=
tion /
>     >     Control
>     >     >     Virtqueue / Automatic receive steering in multiqueue mode=
 /
>     Hash
>     >     >     calculation}.
>     >     >     > +\end{itemize}
>     >     >     > +
>     >     >     > +\subparagraph{Supported/enabled hash types}
>     >     >     > +\label{sec:Device Types / Network Device / Device Oper=
ation
>     /
>     >     Processing
>     >     >     of Incoming Packets / Hash calculation for incoming packe=
ts /
>     >     Supported/
>     >     >     enabled hash types}
>     >     >     > +Hash types applicable for IPv4 packets:
>     >     >     > +\begin{lstlisting}
>     >     >     > +#define VIRTIO_NET_HASH_TYPE_IPv4              (1 << 0=
)
>     >     >     > +#define VIRTIO_NET_HASH_TYPE_TCPv4             (1 << 1=
)
>     >     >     > +#define VIRTIO_NET_HASH_TYPE_UDPv4             (1 << 2=
)
>     >     >     > +\end{lstlisting}
>     >     >     > +Hash types applicable for IPv6 packets without extensi=
on
>     headers
>     >     >     > +\begin{lstlisting}
>     >     >     > +#define VIRTIO_NET_HASH_TYPE_IPv6              (1 << 3=
)
>     >     >     > +#define VIRTIO_NET_HASH_TYPE_TCPv6             (1 << 4=
)
>     >     >     > +#define VIRTIO_NET_HASH_TYPE_UDPv6             (1 << 5=
)
>     >     >     > +\end{lstlisting}
>     >     >     > +Hash types applicable for IPv6 packets with extension
>     headers
>     >     >     > +\begin{lstlisting}
>     >     >     > +#define VIRTIO_NET_HASH_TYPE_IP_EX             (1 << 6=
)
>     >     >     > +#define VIRTIO_NET_HASH_TYPE_TCP_EX            (1 << 7=
)
>     >     >     > +#define VIRTIO_NET_HASH_TYPE_UDP_EX            (1 << 8=
)
>     >     >     > +\end{lstlisting}
>     >     >     > +
>     >     >     > +\subparagraph{IPv4 packets}
>     >     >     > +\label{sec:Device Types / Network Device / Device Oper=
ation
>     /
>     >     Processing
>     >     >     of Incoming Packets / Hash calculation for incoming packe=
ts /
>     IPv4
>     >     packets}
>     >     >     > +The device calculates the hash on IPv4 packets accordi=
ng to
>     >     'Enabled
>     >     >     hash types' bitmask as follows:
>     >     >     > +\begin{itemize}
>     >     >     > +\item If VIRTIO_NET_HASH_TYPE_TCPv4 is set and the pac=
ket
>     has
>     >     >     > +a TCP header, the hash is calculated over the followin=
g
>     fields:
>     >     >     > +\begin{itemize}
>     >     >     > +\item Source IP address
>     >     >     > +\item Destination IP address
>     >     >     > +\item Source TCP port
>     >     >     > +\item Destination TCP port
>     >     >     > +\end{itemize}
>     >     >     > +\item Else if VIRTIO_NET_HASH_TYPE_UDPv4 is set and th=
e
>     >     >     > +packet has a UDP header, the hash is calculated over t=
he
>     following
>     >     >     fields:
>     >     >     > +\begin{itemize}
>     >     >     > +\item Source IP address
>     >     >     > +\item Destination IP address
>     >     >     > +\item Source UDP port
>     >     >     > +\item Destination UDP port
>     >     >     > +\end{itemize}
>     >     >     > +\item Else if VIRTIO_NET_HASH_TYPE_IPv4 is set, the ha=
sh is
>     >     >     > +calculated over the following fields:
>     >     >     > +\begin{itemize}
>     >     >     > +\item Source IP address
>     >     >     > +\item Destination IP address
>     >     >     > +\end{itemize}
>     >     >     > +\item Else the device does not calculate the hash
>     >     >     > +\end{itemize}
>     >     >     > +
>     >     >     > +\subparagraph{IPv6 packets without extension header}
>     >     >     > +\label{sec:Device Types / Network Device / Device Oper=
ation
>     /
>     >     Processing
>     >     >     of Incoming Packets / Hash calculation for incoming packe=
ts /
>     IPv6
>     >     packets
>     >     >     without extension header}
>     >     >     > +The device calculates the hash on IPv6 packets without
>     extension
>     >     >     > +headers according to 'Enabled hash types' bitmask as
>     follows:
>     >     >     > +\begin{itemize}
>     >     >     > +\item If VIRTIO_NET_HASH_TYPE_TCPv6 is set and the pac=
ket
>     has
>     >     >     > +a TCPv6 header, the hash is calculated over the follow=
ing
>     fields:
>     >     >     > +\begin{itemize}
>     >     >     > +\item Source IPv6 address
>     >     >     > +\item Destination IPv6 address
>     >     >     > +\item Source TCP port
>     >     >     > +\item Destination TCP port
>     >     >     > +\end{itemize}
>     >     >     > +\item Else if VIRTIO_NET_HASH_TYPE_UDPv6 is set and th=
e
>     >     >     > +packet has a UDPv6 header, the hash is calculated over=
 the
>     >     following
>     >     >     fields:
>     >     >     > +\begin{itemize}
>     >     >     > +\item Source IPv6 address
>     >     >     > +\item Destination IPv6 address
>     >     >     > +\item Source UDP port
>     >     >     > +\item Destination UDP port
>     >     >     > +\end{itemize}
>     >     >     > +\item Else if VIRTIO_NET_HASH_TYPE_IPv6 is set, the ha=
sh is
>     >     >     > +calculated over the following fields:
>     >     >     > +\begin{itemize}
>     >     >     > +\item Source IPv6 address
>     >     >     > +\item Destination IPv6 address
>     >     >     > +\end{itemize}
>     >     >     > +\item Else the device does not calculate the hash
>     >     >     > +\end{itemize}
>     >     >     > +
>     >     >     > +\subparagraph{IPv6 packets with extension header}
>     >     >     > +\label{sec:Device Types / Network Device / Device Oper=
ation
>     /
>     >     Processing
>     >     >     of Incoming Packets / Hash calculation for incoming packe=
ts /
>     IPv6
>     >     packets
>     >     >     with extension header}
>     >     >     > +The device calculates the hash on IPv6 packets with
>     extension
>     >     >     > +headers according to 'Enabled hash types' bitmask as
>     follows:
>     >     >     > +\begin{itemize}
>     >     >     > +\item If VIRTIO_NET_HASH_TYPE_TCP_EX is set and the pa=
cket
>     >     >     > +has a TCPv6 header, the hash is calculated over the
>     following
>     >     fields:
>     >     >     > +\begin{itemize}
>     >     >     > +\item Home address from the home address option in the=
 IPv6
>     >     destination
>     >     >     options header. If the extension header is not present, u=
se the
>     >     Source IPv6
>     >     >     address.
>     >     >     > +\item IPv6 address that is contained in the
>     Routing-Header-Type-2
>     >     from
>     >     >     the associated extension header. If the extension header =
is not
>     >     present,
>     >     >     use the Destination IPv6 address.
>     >     >     > +\item Source TCP port
>     >     >     > +\item Destination TCP port
>     >     >     > +\end{itemize}
>     >     >     > +\item Else if VIRTIO_NET_HASH_TYPE_UDP_EX is set and t=
he
>     >     >     > +packet has a UDPv6 header, the hash is calculated over=
 the
>     >     following
>     >     >     fields:
>     >     >     > +\begin{itemize}
>     >     >     > +\item Home address from the home address option in the=
 IPv6
>     >     destination
>     >     >     options header. If the extension header is not present, u=
se the
>     >     Source IPv6
>     >     >     address.
>     >     >     > +\item IPv6 address that is contained in the
>     Routing-Header-Type-2
>     >     from
>     >     >     the associated extension header. If the extension header =
is not
>     >     present,
>     >     >     use the Destination IPv6 address.
>     >     >     > +\item Source UDP port
>     >     >     > +\item Destination UDP port
>     >     >     > +\end{itemize}
>     >     >     > +\item Else if VIRTIO_NET_HASH_TYPE_IP_EX is set, the h=
ash is
>     >     >     > +calculated over the following fields:
>     >     >     > +\begin{itemize}
>     >     >     > +\item Home address from the home address option in the=
 IPv6
>     >     destination
>     >     >     options header. If the extension header is not present, u=
se the
>     >     Source IPv6
>     >     >     address.
>     >     >     > +\item IPv6 address that is contained in the
>     Routing-Header-Type-2
>     >     from
>     >     >     the associated extension header. If the extension header =
is not
>     >     present,
>     >     >     use the Destination IPv6 address.
>     >     >     > +\end{itemize}
>     >     >     > +\item Else skip IPv6 extension headers and calculate t=
he
>     hash as
>     >     >     > +defined for an IPv6 packet without extension headers
>     >     >     > +(see \ref{sec:Device Types / Network Device / Device
>     Operation /
>     >     >     Processing of Incoming Packets / Hash calculation for inc=
oming
>     >     packets /
>     >     >     IPv6 packets without extension header}).
>     >     >     > +\end{itemize}
>     >     >     > +
>     >     >     > +\paragraph{Hash reporting for incoming packets}
>     >     >     > +\label{sec:Device Types / Network Device / Device Oper=
ation
>     /
>     >     Processing
>     >     >     of Incoming Packets / Hash reporting for incoming packets=
}
>     >     >     > +
>     >     >     > +If VIRTIO_NET_F_HASH_REPORT was negotiated and
>     >     >     > + the device has calculated the hash for the packet, th=
e
>     device
>     >     fills \
>     >     >     field{hash_type} with the type of calculated hash
>     >     >     > +and \field{hash_value} with the value of calculated ha=
sh.
>     >     >     > +
>     >     >     > +If VIRTIO_NET_F_HASH_REPORT was negotiated but due to =
any
>     reason
>     >     the
>     >     >     > +hash was not calculated, the device sets \field{hash_t=
ype}
>     to
>     >     >     VIRTIO_NET_HASH_REPORT_NONE.
>     >     >     > +
>     >     >     > +Possible values that the device can report in \field
>     {hash_type}
>     >     are
>     >     >     defined below.
>     >     >     > +They correspond to supported hash types defined in
>     >     >     > +\ref{sec:Device Types / Network Device / Device Operat=
ion /
>     >     Processing
>     >     >     of Incoming Packets / Hash calculation for incoming packe=
ts /
>     >     Supported/
>     >     >     enabled hash types}
>     >     >     > +as follows:
>     >     >     > +
>     >     >     > +VIRTIO_NET_HASH_TYPE_XXX =3D 1 << (VIRTIO_NET_HASH_REP=
ORT_XXX
>     - 1)
>     >     >
>     >     >
>     >     >     So hash_type is the HASH_REPORT value then? That's quite
>     confusing.
>     >     >     Let's rename to hash_report?
>     >     >
>     >     > No problem to rename anything, but I'd like to do it one time=
.
>     >     > Currently meaningful hash report values are (1..9), 0 for non=
e
>     >     > They correspond to bitmask of 9 bits for enabled/supported.
>     >     > It was possible to use the same definitions for enable/suppor=
t/
>     report
>     >     > but then reported kind of hash should be 4 bytes.
>     >     > As you anyway suggests padding at the end of the packet, we c=
an do
>     that,
>     >     > i.e. add (32 bit hash + 32 bit type)
>     >
>     >     We can but it seems like a waste, does it not? padding can be u=
sed
>     for
>     >     something later ...
>     >
>     >     > Or if we stay with the values as they are now:
>     >     > values 0..9 - VIRTIO_NET_WHAT?
>     >
>     >     I thought that's VIRTIO_NET_HASH_REPORT_XXX
>     >
>     > OK, this is exactly what is defined
>     >
>     >
>     >     > bits from 0 to 8 - VIRTIO_NET_WHAT?
>     >
>     >
>     >     and this one VIRTIO_NET_HASH_TYPE_XXX?
>     >
>     > OK, this is also exactly what is defined
>     >
>=20
>=20
>     Right I'm saying what's defined is fine, just call the fields
>     consistently.
>=20
>     >
>     >
>     >     Generally what you did here is a bit unusual. Mostly we just de=
fine
>     >     bit numbers
>     >             #define VIRTIO_SCSI_F_INOUT                    0
>     >             #define VIRTIO_SCSI_F_HOTPLUG                  1
>     >             #define VIRTIO_SCSI_F_CHANGE                   2
>     >             #define VIRTIO_SCSI_F_T10_PI                   3
>     >
>     >
>     > Value 0 of hash_report is "no hash calculated" and it does not
>     > participate in support/enable mask. I did not want to
>     > use value other than zero for "no hash".
>=20
>     Oh right.
>=20
>     > So you want bit 0 to be reserved (not used) in enable/support mask
>     > and then to have all the VIRTIO_NET_HASH_TYPE_XXX to be
>     > exactly 1 << VIRTIO_NET_HASH_REPORT_XXX? Just say...
>     >
>=20
>     We can do that too but it's up to you really.
>=20
>     So fixing the below you would say
>              bit 0 curresponding to value 1,
>              bit 1 corresponding to value 2 etc.
>              No bit corresponds to value 0
>     ?
>=20
> Currently defined:
>=20
> Reports:
> VIRTIO_NET_HASH_REPORT_NONE            0
> VIRTIO_NET_HASH_REPORT_IPv4            1
> VIRTIO_NET_HASH_REPORT_UDPv4           3
> VIRTIO_NET_HASH_REPORT_UDPv6_EX        9
>=20
> Bitmask (VIRTIO_NET_HASH_TYPE_XXX =3D 1 << (VIRTIO_NET_HASH_REPORT_XXX - =
1)):
> VIRTIO_NET_HASH_TYPE_IPv4 =3D (1 << 0)
> VIRTIO_NET_HASH_TYPE_UDPv4 =3D (1 << 2)
> VIRTIO_NET_HASH_TYPE_UDP_EX =3D (1 << 8)
>=20
>=20
> How you want it to be changed?
> Can you please write here in the same format?

IMHO at a minimum, \field{hash_type} should be \field{hash_report}.

That's all.

>=20
>=20
>     >
>     >     and just say that bit numbers are from this table, with bit
>     >     0 corresponding to the value 0, bit 1 to value 1 etc.
>     >
>     >
>     >     maybe that would have been easier on the eyes - I didn't try,
>     >     I'm not even sure.
>     >
>     >     But what you have is correct enough, we can always try to
>     >     improve the wording later.
>     >
>     >
>     >     >
>     >     >
>     >     >     > +
>     >     >     > +\begin{lstlisting}
>     >     >     > +#define VIRTIO_NET_HASH_REPORT_NONE            0
>     >     >     > +#define VIRTIO_NET_HASH_REPORT_IPv4            1
>     >     >     > +#define VIRTIO_NET_HASH_REPORT_TCPv4           2
>     >     >     > +#define VIRTIO_NET_HASH_REPORT_UDPv4           3
>     >     >     > +#define VIRTIO_NET_HASH_REPORT_IPv6            4
>     >     >     > +#define VIRTIO_NET_HASH_REPORT_TCPv6           5
>     >     >     > +#define VIRTIO_NET_HASH_REPORT_UDPv6           6
>     >     >     > +#define VIRTIO_NET_HASH_REPORT_IPv6_EX         7
>     >     >     > +#define VIRTIO_NET_HASH_REPORT_TCPv6_EX        8
>     >     >     > +#define VIRTIO_NET_HASH_REPORT_UDPv6_EX        9
>     >     >     > +\end{lstlisting}
>     >     >     > +
>     >     >     >  \subsubsection{Control Virtqueue}\label{sec:Device Typ=
es /
>     Network
>     >     >     Device / Device Operation / Control Virtqueue}
>     >     >     > =20
>     >     >     >  The driver uses the control virtqueue (if
>     VIRTIO_NET_F_CTRL_VQ is
>     >     >     > @@ -3896,6 +4064,7 @@ \subsubsection{Control Virtqueue}=
\label
>     >     {sec:Device
>     >     >     Types / Network Device / Devi
>     >     >     >  #define VIRTIO_NET_CTRL_MQ    4
>     >     >     >   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0 (for
>     automatic
>     >     receive
>     >     >     steering)
>     >     >     >   #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1 (for
>     >     configurable
>     >     >     receive steering)
>     >     >     > + #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG         2 (for
>     >     configurable hash
>     >     >     calculation)
>     >     >     >  \end{lstlisting}
>     >     >     > =20
>     >     >     >  If more than one multiqueue mode is negotiated, the
>     resulting
>     >     device
>     >     >     configuration is defined by the last command sent by the
>     driver.
>     >     >     > @@ -3961,10 +4130,37 @@ \subsubsection{Control Virtqueu=
e}\
>     label
>     >     >     {sec:Device Types / Network Device / Devi
>     >     >     >  according to the native endian of the guest rather tha=
n
>     >     >     >  (necessarily when not using the legacy interface)
>     little-endian.
>     >     >     > =20
>     >     >     > +\subparagraph{Hash calculation}\label{sec:Device Types=
 /
>     Network
>     >     Device
>     >     >     / Device Operation / Control Virtqueue / Automatic receiv=
e
>     steering
>     >     in
>     >     >     multiqueue mode / Hash calculation}
>     >     >     > +If VIRTIO_NET_F_HASH_REPORT was negotiated and the dev=
ice
>     uses
>     >     automatic
>     >     >     receive steering,
>     >     >     > +the device MUST support a command to configure hash
>     calculation
>     >     >     parameters.
>     >     >     > +
>     >     >     > +The driver provides parameters for hash calculation as
>     follows:
>     >     >     > +
>     >     >     > +\field{class} VIRTIO_NET_CTRL_MQ, \field{command}
>     >     >     VIRTIO_NET_CTRL_MQ_HASH_CONFIG.
>     >     >     > +
>     >     >     > +The \field{command-specific-data} has following format=
:
>     >     >     > +\begin{lstlisting}
>     >     >     > +struct virtio_net_hash_config {
>     >     >     > +    le32 hash_types;
>     >     >     > +    le16 reserved[4];
>     >     >     > +    u8 hash_key_length;
>     >     >     > +    u8 hash_key_data[hash_key_length];
>     >     >     > +};
>     >     >     > +\end{lstlisting}
>     >     >     > +Field \field{hash_types} contains a bitmask of allowed=
 hash
>     types
>     >     as
>     >     >     > +defined in
>     >     >     > +\ref{sec:Device Types / Network Device / Device Operat=
ion /
>     >     Processing
>     >     >     of Incoming Packets / Hash calculation for incoming packe=
ts /
>     >     Supported/
>     >     >     enabled hash types}.
>     >     >     > +Initially the device has all hash types disabled and r=
eports
>     only
>     >     >     VIRTIO_NET_HASH_REPORT_NONE.
>     >     >     > +
>     >     >     > +Field \field{reserved} MUST contain zeroes. It is defi=
ned to
>     make
>     >     the
>     >     >     structure to match the layout of virtio_net_rss_config
>     structure,
>     >     >     > +defined in \ref{sec:Device Types / Network Device / De=
vice
>     >     Operation /
>     >     >     Control Virtqueue / Receive-side scaling (RSS)}.
>     >     >     > +
>     >     >     > +Fields \field{hash_key_length} and \field{hash_key_dat=
a}
>     define
>     >     the key
>     >     >     to be used in hash calculation.
>     >     >     > +
>     >     >     >  \paragraph{Receive-side scaling (RSS)}\label{sec:Devic=
e
>     Types /
>     >     Network
>     >     >     Device / Device Operation / Control Virtqueue / Receive-s=
ide
>     scaling
>     >     (RSS)}
>     >     >     >  A device offers the feature VIRTIO_NET_F_RSS if it sup=
ports
>     RSS
>     >     receive
>     >     >     steering with Toeplitz hash calculation and configurable
>     parameters.
>     >     >     > =20
>     >     >     > -A driver queries RSS capabilities of the device by rea=
ding
>     device
>     >     >     configuration as defined in \ref{sec:Device Types / Netwo=
rk
>     Device /
>     >     Device
>     >     >     configuration layout / RSS}
>     >     >     > +A driver queries RSS capabilities of the device by rea=
ding
>     device
>     >     >     configuration as defined in \ref{sec:Device Types / Netwo=
rk
>     Device /
>     >     Device
>     >     >     configuration layout}
>     >     >     > =20
>     >     >     >  \subparagraph{Setting RSS parameters}\label{sec:Device=
 Types
>     /
>     >     Network
>     >     >     Device / Device Operation / Control Virtqueue / Receive-s=
ide
>     scaling
>     >     (RSS)
>     >     >     / Setting RSS parameters}
>     >     >     > =20
>     >     >     > @@ -3981,7 +4177,8 @@ \subsubsection{Control Virtqueue}=
\label
>     >     {sec:Device
>     >     >     Types / Network Device / Devi
>     >     >     >  };
>     >     >     >  \end{lstlisting}
>     >     >     >  Field \field{hash_types} contains a bitmask of allowed=
 hash
>     types
>     >     as
>     >     >     > -defined in \ref{sec:Device Types / Network Device / De=
vice
>     >     Operation /
>     >     >     Control Virtqueue / Receive-side scaling (RSS) / RSS hash
>     types}.
>     >     >     > +defined in
>     >     >     > +\ref{sec:Device Types / Network Device / Device Operat=
ion /
>     >     Processing
>     >     >     of Incoming Packets / Hash calculation for incoming packe=
ts /
>     >     Supported/
>     >     >     enabled hash types}.
>     >     >     > =20
>     >     >     >  Field \field{indirection_table_mask} is a mask to be a=
pplied
>     to
>     >     >     >  the calculated hash to produce an index in the
>     >     >     > @@ -3995,93 +4192,7 @@ \subsubsection{Control Virtqueue=
}\
>     label
>     >     {sec:Device
>     >     >     Types / Network Device / Devi
>     >     >     > =20
>     >     >     >  A driver sets \field{max_tx_vq} to inform a device how=
 many
>     >     transmit
>     >     >     virtqueues it may use (transmitq1\ldots transmitq \field
>     {max_tx_vq}).
>     >     >     > =20
>     >     >     > -\subparagraph{RSS hash types}\label{sec:Device Types /
>     Network
>     >     Device /
>     >     >     Device Operation / Control Virtqueue / Receive-side scali=
ng
>     (RSS) /
>     >     RSS
>     >     >     hash types}
>     >     >     > -
>     >     >     > -The device calculates the hash on IPv4 packets accordi=
ng to
>     the
>     >     >     > -field \field{hash_types} of the virtio_net_rss_config
>     structure as
>     >     >     follows:
>     >     >     > -\begin{itemize}
>     >     >     > -\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv4 is set and the
>     packet has
>     >     >     > -a TCP header, the hash is calculated over the followin=
g
>     fields:
>     >     >     > -\begin{itemize}
>     >     >     > -\item Source IP address
>     >     >     > -\item Destination IP address
>     >     >     > -\item Source TCP port
>     >     >     > -\item Destination TCP port
>     >     >     > -\end{itemize}
>     >     >     > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set an=
d the
>     >     >     > -packet has a UDP header, the hash is calculated over t=
he
>     following
>     >     >     fields:
>     >     >     > -\begin{itemize}
>     >     >     > -\item Source IP address
>     >     >     > -\item Destination IP address
>     >     >     > -\item Source UDP port
>     >     >     > -\item Destination UDP port
>     >     >     > -\end{itemize}
>     >     >     > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv4 is set, th=
e hash
>     is
>     >     >     > -calculated over the following fields:
>     >     >     > -\begin{itemize}
>     >     >     > -\item Source IP address
>     >     >     > -\item Destination IP address
>     >     >     > -\end{itemize}
>     >     >     > -\item Else the device does not calculate the hash
>     >     >     > -\end{itemize}
>     >     >     > -
>     >     >     > -\label{itm:Device Types / Network Device / Device Oper=
ation
>     /
>     >     Control
>     >     >     Virtqueue / Receive-side scaling (RSS) / RSS hash types/h=
ash on
>     IPv6
>     >     >     packets without extension headers}
>     >     >     > -The device calculates the hash on IPv6 packets without
>     extension
>     >     >     > -headers according to the field \field{hash_types} of t=
he
>     >     >     virtio_net_rss_config structure as follows:
>     >     >     > -\begin{itemize}
>     >     >     > -\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set and the
>     packet has
>     >     >     > -a TCPv6 header, the hash is calculated over the follow=
ing
>     fields:
>     >     >     > -\begin{itemize}
>     >     >     > -\item Source IPv6 address
>     >     >     > -\item Destination IPv6 address
>     >     >     > -\item Source TCP port
>     >     >     > -\item Destination TCP port
>     >     >     > -\end{itemize}
>     >     >     > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is set an=
d the
>     >     >     > -packet has a UDPv6 header, the hash is calculated over=
 the
>     >     following
>     >     >     fields:
>     >     >     > -\begin{itemize}
>     >     >     > -\item Source IPv6 address
>     >     >     > -\item Destination IPv6 address
>     >     >     > -\item Source UDP port
>     >     >     > -\item Destination UDP port
>     >     >     > -\end{itemize}
>     >     >     > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv6 is set, th=
e hash
>     is
>     >     >     > -calculated over the following fields:
>     >     >     > -\begin{itemize}
>     >     >     > -\item Source IPv6 address
>     >     >     > -\item Destination IPv6 address
>     >     >     > -\end{itemize}
>     >     >     > -\item Else the device does not calculate the hash
>     >     >     > -\end{itemize}
>     >     >     > -
>     >     >     > -The device calculates the hash on IPv6 packets with
>     extension
>     >     >     > -headers according to the field \field{hash_types} of t=
he
>     >     >     virtio_net_rss_config structure as follows:
>     >     >     > -\begin{itemize}
>     >     >     > -\item If VIRTIO_NET_RSS_HASH_TYPE_TCP_EX is set and th=
e
>     packet
>     >     >     > -has a TCPv6 header, the hash is calculated over the
>     following
>     >     fields:
>     >     >     > -\begin{itemize}
>     >     >     > -\item Home address from the home address option in the=
 IPv6
>     >     destination
>     >     >     options header. If the extension header is not present, u=
se the
>     >     Source IPv6
>     >     >     address.
>     >     >     > -\item IPv6 address that is contained in the
>     Routing-Header-Type-2
>     >     from
>     >     >     the associated extension header. If the extension header =
is not
>     >     present,
>     >     >     use the Destination IPv6 address.
>     >     >     > -\item Source TCP port
>     >     >     > -\item Destination TCP port
>     >     >     > -\end{itemize}
>     >     >     > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set a=
nd the
>     >     >     > -packet has a UDPv6 header, the hash is calculated over=
 the
>     >     following
>     >     >     fields:
>     >     >     > -\begin{itemize}
>     >     >     > -\item Home address from the home address option in the=
 IPv6
>     >     destination
>     >     >     options header. If the extension header is not present, u=
se the
>     >     Source IPv6
>     >     >     address.
>     >     >     > -\item IPv6 address that is contained in the
>     Routing-Header-Type-2
>     >     from
>     >     >     the associated extension header. If the extension header =
is not
>     >     present,
>     >     >     use the Destination IPv6 address.
>     >     >     > -\item Source UDP port
>     >     >     > -\item Destination UDP port
>     >     >     > -\end{itemize}
>     >     >     > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, t=
he
>     hash is
>     >     >     > -calculated over the following fields:
>     >     >     > -\begin{itemize}
>     >     >     > -\item Home address from the home address option in the=
 IPv6
>     >     destination
>     >     >     options header. If the extension header is not present, u=
se the
>     >     Source IPv6
>     >     >     address.
>     >     >     > -\item IPv6 address that is contained in the
>     Routing-Header-Type-2
>     >     from
>     >     >     the associated extension header. If the extension header =
is not
>     >     present,
>     >     >     use the Destination IPv6 address.
>     >     >     > -\end{itemize}
>     >     >     > -\item Else skip IPv6 extension headers and calculate t=
he
>     hash as
>     >     >     > -defined for an IPv6 packet without extension headers (=
see \
>     ref
>     >     >     {itm:Device Types / Network Device / Device Operation / C=
ontrol
>     >     Virtqueue /
>     >     >     Receive-side scaling (RSS) / RSS hash types/hash on IPv6
>     packets
>     >     without
>     >     >     extension headers}).
>     >     >     > -\end{itemize}
>     >     >     > +Fields \field{hash_key_length} and \field{hash_key_dat=
a}
>     define
>     >     the key
>     >     >     to be used in hash calculation.
>     >     >     > =20
>     >     >     >  \drivernormative{\subparagraph}{Setting RSS parameters=
}
>     {Device
>     >     Types /
>     >     >     Network Device / Device Operation / Control Virtqueue /
>     Receive-side
>     >     >     scaling (RSS) }
>     >     >     > =20
>     >     >     > @@ -4093,12 +4204,12 @@ \subsubsection{Control Virtqueu=
e}\
>     label
>     >     >     {sec:Device Types / Network Device / Devi
>     >     >     > =20
>     >     >     >  A driver MUST use \field{indirection_table_mask} value=
s that
>     are
>     >     less
>     >     >     than \field{rss_max_indirection_table_length} reported by=
 a
>     device.
>     >     >     > =20
>     >     >     > -A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ fl=
ags
>     that are
>     >     not
>     >     >     supported by a device.
>     >     >     > +A driver MUST NOT set any VIRTIO_NET_HASH_TYPE_ flags =
that
>     are not
>     >     >     supported by a device.
>     >     >     > =20
>     >     >     >  \devicenormative{\subparagraph}{RSS processing}{Device=
 Types
>     /
>     >     Network
>     >     >     Device / Device Operation / Control Virtqueue / Receive-s=
ide
>     scaling
>     >     (RSS)
>     >     >     / RSS processing}
>     >     >     >  The device MUST determine the destination queue for a
>     network
>     >     packet as
>     >     >     follows:
>     >     >     >  \begin{itemize}
>     >     >     > -\item Calculate the hash of the packet as defined in \=
ref
>     >     {sec:Device
>     >     >     Types / Network Device / Device Operation / Control Virtq=
ueue /
>     >     >     Receive-side scaling (RSS) / RSS hash types}
>     >     >     > +\item Calculate the hash of the packet as defined in \=
ref
>     >     {sec:Device
>     >     >     Types / Network Device / Device Operation / Processing of
>     Incoming
>     >     Packets
>     >     >     / Hash calculation for incoming packets}.
>     >     >     >  \item If the device did not calculate the hash for the
>     specific
>     >     packet,
>     >     >     the device directs the packet to the receiveq specified b=
y \
>     field
>     >     >     {unclassified_queue} of virtio_net_rss_config structure (=
value
>     of 0
>     >     >     corresponds to receiveq1).
>     >     >     >  \item Apply \field{indirection_table_mask} to the calc=
ulated
>     hash
>     >     and
>     >     >     use the result as the index in the indirection table to g=
et
>     0-based
>     >     number
>     >     >     of destination receiveq (value of 0 corresponds to receiv=
eq1).
>     >     >     >  \end{itemize}
>     >     >     > --
>     >     >     > 2.17.1
>     >     >
>     >     >
>     >     >     This publicly archived list offers a means to provide inp=
ut to
>     the
>     >     >     OASIS Virtual I/O Device (VIRTIO) TC.
>     >     >
>     >     >     In order to verify user consent to the Feedback License t=
erms
>     and
>     >     >     to minimize spam in the list archive, subscription is req=
uired
>     >     >     before posting.
>     >     >
>     >     >     Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>     >     >     Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.=
org
>     >     >     List help: virtio-comment-help@lists.oasis-open.org
>     >     >     List archive: https://lists.oasis-open.org/archives/
>     virtio-comment/
>     >     >     Feedback License: https://www.oasis-open.org/who/ipr/
>     >     feedback_license.pdf
>     >     >     List Guidelines: https://www.oasis-open.org/policies-guid=
elines
>     /
>     >     >     mailing-lists
>     >     >     Committee: https://www.oasis-open.org/committees/virtio/
>     >     >     Join OASIS: https://www.oasis-open.org/join/
>     >     >
>     >     >
>     >     >
>     >
>     >
>     >
>=20
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

