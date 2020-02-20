Return-Path: virtio-comment-return-1072-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4FBED985EF2
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Feb 2020 05:09:14 +0000 (UTC)
Date: Thu, 20 Feb 2020 00:09:01 -0500 (EST)
From: Yuri Benditovich <ybendito@redhat.com>
Message-ID: <575584881.7345661.1582175341197.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200219095236-mutt-send-email-mst@kernel.org>
References: <20200219075337.23191-1-yuri.benditovich@daynix.com> <20200219075337.23191-2-yuri.benditovich@daynix.com> <20200219040122-mutt-send-email-mst@kernel.org> <1841911156.7222325.1582110433680.JavaMail.zimbra@redhat.com> <20200219092917-mutt-send-email-mst@kernel.org> <1785864968.7261240.1582123777151.JavaMail.zimbra@redhat.com> <20200219095236-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define
 per-packet hash reporting feature
Content-Type: multipart/alternative; 
	boundary="----=_Part_7345660_715052899.1582175341195"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

------=_Part_7345660_715052899.1582175341195
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

----- Original Message -----

> From: "Michael S. Tsirkin" <mst@redhat.com>
> To: "Yuri Benditovich" <ybendito@redhat.com>
> Cc: "Yuri Benditovich" <yuri.benditovich@daynix.com>,
> virtio-comment@lists.oasis-open.org
> Sent: Wednesday, February 19, 2020 4:56:04 PM
> Subject: Re: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define
> per-packet hash reporting feature

> On Wed, Feb 19, 2020 at 09:49:37AM -0500, Yuri Benditovich wrote:
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
> > To: "Yuri Benditovich" <ybendito@redhat.com>
> > Cc: "Yuri Benditovich" <yuri.benditovich@daynix.com>,
> > virtio-comment@lists.oasis-open.org
> > Sent: Wednesday, February 19, 2020 4:35:49 PM
> > Subject: Re: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define
> > per-packet hash reporting feature
> >
> > On Wed, Feb 19, 2020 at 06:07:13AM -0500, Yuri Benditovich wrote:
> > >
> > >
> > >
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
> > >
> > > From: "Michael S. Tsirkin" <mst@redhat.com>
> > > To: "Yuri Benditovich" <yuri.benditovich@daynix.com>
> > > Cc: virtio-comment@lists.oasis-open.org
> > > Sent: Wednesday, February 19, 2020 11:12:40 AM
> > > Subject: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define
> > per-packet
> > > hash reporting feature
> > >
> > > On Wed, Feb 19, 2020 at 09:53:37AM +0200, Yuri Benditovich wrote:
> > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/66
> > > > Define respective feature bit for virtio-net.
> > > > Extend packet layout to populate hash value and type.
> > > > Move the definition of IP/TCP/UDP header fields to
> > > > calculate the hash out of RSS section to common network
> > > > device section.
> > > >
> > > > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > > > ---
> > > > content.tex | 347
> > ++++++++++++++++++++++++++++++++++------------------
> > > > 1 file changed, 229 insertions(+), 118 deletions(-)
> > > >
> > > > diff --git a/content.tex b/content.tex
> > > > index b91a132..d7d4e42 100644
> > > > --- a/content.tex
> > > > +++ b/content.tex
> > > > @@ -2895,6 +2895,9 @@ \subsection{Feature bits}\label{sec:Device
> > Types /
> > > Network Device / Feature bits
> > > > \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through
> > control
> > > > channel.
> > > >
> > > > +\item[VIRTIO_NET_F_HASH_REPORT(57)] Device can report per-packet
> > hash
> > > > + value and a type of calculated hash.
> > > > +
> > > > \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact
> > \field
> > > {hdr_len}
> > > > value. Device benefits from knowing the exact header length.
> > > >
> > > > @@ -2995,35 +2998,17 @@ \subsection{Device configuration layout}\
> > label
> > > {sec:Device Types / Network Device
> > > > le32 supported_hash_types;
> > > > };
> > > > \end{lstlisting}
> > > > -\label{sec:Device Types / Network Device / Device configuration
> > layout /
> > > RSS}
> > > > -Three following fields, \field{rss_max_key_size}, \field
> > > {rss_max_indirection_table_length}
> > > > -and \field{supported_hash_types} only exist if VIRTIO_NET_F_RSS is
> > set.
> > > > +The following field, \field{rss_max_key_size} only exist if
> > > VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT is set.
> > > > +It specifies the maximal supported length of RSS key in bytes.
> > > >
> > > > -Field \field{rss_max_key_size} specifies the maximal supported
> > length of
> > > RSS key in bytes.
> > > > +The following field, \field{rss_max_indirection_table_length} only
> > exist
> > > if VIRTIO_NET_F_RSS is set.
> > > > +It specifies the maximal number of 16-bit entries in RSS
> > indirection
> > > table.
> > > >
> > > > -Field \field{rss_max_indirection_table_length} specifies the
> > maximal
> > > number of 16-bit entries in RSS indirection table.
> > > > +The next field, \field{supported_hash_types} exists only if the
> > device
> > > supports hash calculation,
> > > > +i.e. if VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT is set.
> > > >
> > > > -Field \field{supported_hash_types} contains the bitmask of
> > supported RSS
> > > hash types.
> > > > -
> > > > -Hash types applicable for IPv4 packets:
> > > > -\begin{lstlisting}
> > > > -#define VIRTIO_NET_RSS_HASH_TYPE_IPv4 (1 << 0)
> > > > -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4 (1 << 1)
> > > > -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4 (1 << 2)
> > > > -\end{lstlisting}
> > > > -Hash types applicable for IPv6 packets without extension headers
> > > > -\begin{lstlisting}
> > > > -#define VIRTIO_NET_RSS_HASH_TYPE_IPv6 (1 << 3)
> > > > -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6 (1 << 4)
> > > > -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6 (1 << 5)
> > > > -\end{lstlisting}
> > > > -Hash types applicable for IPv6 packets with extension headers
> > > > -\begin{lstlisting}
> > > > -#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX (1 << 6)
> > > > -#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX (1 << 7)
> > > > -#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX (1 << 8)
> > > > -\end{lstlisting}
> > > > -For the exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref
> > > {sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue /
> > > Receive-side scaling (RSS) / RSS hash types}.
> > > > +Field \field{supported_hash_types} contains the bitmask of
> > supported
> > > hash types.
> > > > +See \ref{sec:Device Types / Network Device / Device Operation /
> > > Processing of Incoming Packets / Hash calculation for incoming
> > packets /
> > > Supported/enabled hash types} for details of supported hash types.
> > > >
> > > > \devicenormative{\subsubsection}{Device configuration layout}
> > {Device
> > > Types / Network Device / Device configuration layout}
> > > >
> > > > @@ -3048,7 +3033,7 @@ \subsection{Device configuration layout}\
> > label
> > > {sec:Device Types / Network Device
> > > > negotiated.
> > > >
> > > > The device MUST set \field{rss_max_key_size} to at least 40, if it
> > > offers
> > > > -VIRTIO_NET_F_RSS.
> > > > +VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> > > >
> > > > The device MUST set \field{rss_max_indirection_table_length} to at
> > least
> > > 128, if it offers
> > > > VIRTIO_NET_F_RSS.
> > > > @@ -3195,6 +3180,8 @@ \subsection{Device Operation}\label
> > {sec:Device
> > > Types / Network Device / Device O
> > > > le16 csum_start;
> > > > le16 csum_offset;
> > > > le16 num_buffers;
> > > > + le32 hash_value; (Only if VIRTIO_NET_F_HASH_REPORT
> > negotiated)
> > > > + le16 hash_type; (Only if VIRTIO_NET_F_HASH_REPORT
> > negotiated)
> > > > };
> > >
> > > Just noticed this - it's a bit problematic as it might force
> > > compilers to add 2 bytes of padding at the end. Let's add extra 2
> > bytes
> > > of padding explicitly?
> > >
> > > OK, no problem
> > >
> > >
> > >
> > >
> > > > \end{lstlisting}
> > > >
> > > > @@ -3517,6 +3504,12 @@ \subsubsection{Processing of Incoming
> > Packets}\
> > > label{sec:Device Types / Network
> > > >
> > > > \end{enumerate}
> > > >
> > > > +If applicable, the device calculates per-packet hash for incoming
> > > packets as
> > > > +defined in \ref{sec:Device Types / Network Device / Device
> > Operation /
> > > Processing of Incoming Packets / Hash calculation for incoming
> > packets}.
> > > > +
> > > > +If applicable, the device reports hash information for incoming
> > packets
> > > as
> > > > +defined in \ref{sec:Device Types / Network Device / Device
> > Operation /
> > > Processing of Incoming Packets / Hash reporting for incoming
> > packets}.
> > > > +
> > > > \devicenormative{\paragraph}{Processing of Incoming Packets}
> > {Device
> > > Types / Network Device / Device Operation / Processing of Incoming
> > Packets}
> > > > \label{devicenormative:Device Types / Network Device / Device
> > Operation
> > > / Processing of Packets}%old label for latexdiff
> > > >
> > > > @@ -3619,6 +3612,181 @@ \subsubsection{Processing of Incoming
> > Packets}\
> > > label{sec:Device Types / Network
> > > > If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
> > > > VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
> > > > rely on the packet checksum being correct.
> > > > +
> > > > +\paragraph{Hash calculation for incoming packets}
> > > > +\label{sec:Device Types / Network Device / Device Operation /
> > Processing
> > > of Incoming Packets / Hash calculation for incoming packets}
> > > > +
> > > > +A device attempts to calculate a per-packet hash in the following
> > cases:
> > > > +\begin{itemize}
> > > > +\item The feature VIRTIO_NET_F_RSS was negotiated. The device uses
> > the
> > > hash to determine the receive virtqueue to place incoming packets.
> > > > +\item The feature VIRTIO_NET_F_HASH_REPORT was negotiated. The
> > device
> > > reports the hash value and the hash type with the packet.
> > > > +\end{itemize}
> > > > +
> > > > +If the feature VIRTIO_NET_F_RSS was negotiated:
> > > > +\begin{itemize}
> > > > +\item The device uses \field{hash_types} of the
> > virtio_net_rss_config
> > > structure as 'Enabled hash types' bitmask.
> > > > +\item The device uses a key as defined in \field{hash_key_data}
> > and \
> > > field{hash_key_length} of the virtio_net_rss_config structure (see
> > > > +\ref{sec:Device Types / Network Device / Device Operation /
> > Control
> > > Virtqueue / Receive-side scaling (RSS) / Setting RSS parameters}).
> > > > +\end{itemize}
> > > > +
> > > > +If the feature VIRTIO_NET_F_RSS was not negotiated:
> > > > +\begin{itemize}
> > > > +\item The device uses \field{hash_types} of the
> > virtio_net_hash_config
> > > structure as 'Enabled hash types' bitmask.
> > > > +\item The device uses a key as defined in \field{hash_key_data}
> > and \
> > > field{hash_key_length} of the virtio_net_hash_config structure (see
> > > > +\ref{sec:Device Types / Network Device / Device Operation /
> > Control
> > > Virtqueue / Automatic receive steering in multiqueue mode / Hash
> > > calculation}).
> > > > +\end{itemize}
> > > > +
> > > > +Note that if the device offers VIRTIO_NET_F_HASH_REPORT, even if
> > it
> > > supports only one pair of virtqueues, it MUST support
> > > > +at least one of commands of VIRTIO_NET_CTRL_MQ class to configure
> > > reported hash parameters:
> > > > +\begin{itemize}
> > > > +\item If the device offers VIRTIO_NET_F_RSS, it MUST support
> > > VIRTIO_NET_CTRL_MQ_RSS_CONFIG command per
> > > > + \ref{sec:Device Types / Network Device / Device Operation /
> > Control
> > > Virtqueue / Receive-side scaling (RSS) / Setting RSS parameters}.
> > > > +\item Otherwise the device MUST support
> > VIRTIO_NET_CTRL_MQ_HASH_CONFIG
> > > command per
> > > > + \ref{sec:Device Types / Network Device / Device Operation /
> > Control
> > > Virtqueue / Automatic receive steering in multiqueue mode / Hash
> > > calculation}.
> > > > +\end{itemize}
> > > > +
> > > > +\subparagraph{Supported/enabled hash types}
> > > > +\label{sec:Device Types / Network Device / Device Operation /
> > Processing
> > > of Incoming Packets / Hash calculation for incoming packets /
> > Supported/
> > > enabled hash types}
> > > > +Hash types applicable for IPv4 packets:
> > > > +\begin{lstlisting}
> > > > +#define VIRTIO_NET_HASH_TYPE_IPv4 (1 << 0)
> > > > +#define VIRTIO_NET_HASH_TYPE_TCPv4 (1 << 1)
> > > > +#define VIRTIO_NET_HASH_TYPE_UDPv4 (1 << 2)
> > > > +\end{lstlisting}
> > > > +Hash types applicable for IPv6 packets without extension headers
> > > > +\begin{lstlisting}
> > > > +#define VIRTIO_NET_HASH_TYPE_IPv6 (1 << 3)
> > > > +#define VIRTIO_NET_HASH_TYPE_TCPv6 (1 << 4)
> > > > +#define VIRTIO_NET_HASH_TYPE_UDPv6 (1 << 5)
> > > > +\end{lstlisting}
> > > > +Hash types applicable for IPv6 packets with extension headers
> > > > +\begin{lstlisting}
> > > > +#define VIRTIO_NET_HASH_TYPE_IP_EX (1 << 6)
> > > > +#define VIRTIO_NET_HASH_TYPE_TCP_EX (1 << 7)
> > > > +#define VIRTIO_NET_HASH_TYPE_UDP_EX (1 << 8)
> > > > +\end{lstlisting}
> > > > +
> > > > +\subparagraph{IPv4 packets}
> > > > +\label{sec:Device Types / Network Device / Device Operation /
> > Processing
> > > of Incoming Packets / Hash calculation for incoming packets / IPv4
> > packets}
> > > > +The device calculates the hash on IPv4 packets according to
> > 'Enabled
> > > hash types' bitmask as follows:
> > > > +\begin{itemize}
> > > > +\item If VIRTIO_NET_HASH_TYPE_TCPv4 is set and the packet has
> > > > +a TCP header, the hash is calculated over the following fields:
> > > > +\begin{itemize}
> > > > +\item Source IP address
> > > > +\item Destination IP address
> > > > +\item Source TCP port
> > > > +\item Destination TCP port
> > > > +\end{itemize}
> > > > +\item Else if VIRTIO_NET_HASH_TYPE_UDPv4 is set and the
> > > > +packet has a UDP header, the hash is calculated over the following
> > > fields:
> > > > +\begin{itemize}
> > > > +\item Source IP address
> > > > +\item Destination IP address
> > > > +\item Source UDP port
> > > > +\item Destination UDP port
> > > > +\end{itemize}
> > > > +\item Else if VIRTIO_NET_HASH_TYPE_IPv4 is set, the hash is
> > > > +calculated over the following fields:
> > > > +\begin{itemize}
> > > > +\item Source IP address
> > > > +\item Destination IP address
> > > > +\end{itemize}
> > > > +\item Else the device does not calculate the hash
> > > > +\end{itemize}
> > > > +
> > > > +\subparagraph{IPv6 packets without extension header}
> > > > +\label{sec:Device Types / Network Device / Device Operation /
> > Processing
> > > of Incoming Packets / Hash calculation for incoming packets / IPv6
> > packets
> > > without extension header}
> > > > +The device calculates the hash on IPv6 packets without extension
> > > > +headers according to 'Enabled hash types' bitmask as follows:
> > > > +\begin{itemize}
> > > > +\item If VIRTIO_NET_HASH_TYPE_TCPv6 is set and the packet has
> > > > +a TCPv6 header, the hash is calculated over the following fields:
> > > > +\begin{itemize}
> > > > +\item Source IPv6 address
> > > > +\item Destination IPv6 address
> > > > +\item Source TCP port
> > > > +\item Destination TCP port
> > > > +\end{itemize}
> > > > +\item Else if VIRTIO_NET_HASH_TYPE_UDPv6 is set and the
> > > > +packet has a UDPv6 header, the hash is calculated over the
> > following
> > > fields:
> > > > +\begin{itemize}
> > > > +\item Source IPv6 address
> > > > +\item Destination IPv6 address
> > > > +\item Source UDP port
> > > > +\item Destination UDP port
> > > > +\end{itemize}
> > > > +\item Else if VIRTIO_NET_HASH_TYPE_IPv6 is set, the hash is
> > > > +calculated over the following fields:
> > > > +\begin{itemize}
> > > > +\item Source IPv6 address
> > > > +\item Destination IPv6 address
> > > > +\end{itemize}
> > > > +\item Else the device does not calculate the hash
> > > > +\end{itemize}
> > > > +
> > > > +\subparagraph{IPv6 packets with extension header}
> > > > +\label{sec:Device Types / Network Device / Device Operation /
> > Processing
> > > of Incoming Packets / Hash calculation for incoming packets / IPv6
> > packets
> > > with extension header}
> > > > +The device calculates the hash on IPv6 packets with extension
> > > > +headers according to 'Enabled hash types' bitmask as follows:
> > > > +\begin{itemize}
> > > > +\item If VIRTIO_NET_HASH_TYPE_TCP_EX is set and the packet
> > > > +has a TCPv6 header, the hash is calculated over the following
> > fields:
> > > > +\begin{itemize}
> > > > +\item Home address from the home address option in the IPv6
> > destination
> > > options header. If the extension header is not present, use the
> > Source IPv6
> > > address.
> > > > +\item IPv6 address that is contained in the Routing-Header-Type-2
> > from
> > > the associated extension header. If the extension header is not
> > present,
> > > use the Destination IPv6 address.
> > > > +\item Source TCP port
> > > > +\item Destination TCP port
> > > > +\end{itemize}
> > > > +\item Else if VIRTIO_NET_HASH_TYPE_UDP_EX is set and the
> > > > +packet has a UDPv6 header, the hash is calculated over the
> > following
> > > fields:
> > > > +\begin{itemize}
> > > > +\item Home address from the home address option in the IPv6
> > destination
> > > options header. If the extension header is not present, use the
> > Source IPv6
> > > address.
> > > > +\item IPv6 address that is contained in the Routing-Header-Type-2
> > from
> > > the associated extension header. If the extension header is not
> > present,
> > > use the Destination IPv6 address.
> > > > +\item Source UDP port
> > > > +\item Destination UDP port
> > > > +\end{itemize}
> > > > +\item Else if VIRTIO_NET_HASH_TYPE_IP_EX is set, the hash is
> > > > +calculated over the following fields:
> > > > +\begin{itemize}
> > > > +\item Home address from the home address option in the IPv6
> > destination
> > > options header. If the extension header is not present, use the
> > Source IPv6
> > > address.
> > > > +\item IPv6 address that is contained in the Routing-Header-Type-2
> > from
> > > the associated extension header. If the extension header is not
> > present,
> > > use the Destination IPv6 address.
> > > > +\end{itemize}
> > > > +\item Else skip IPv6 extension headers and calculate the hash as
> > > > +defined for an IPv6 packet without extension headers
> > > > +(see \ref{sec:Device Types / Network Device / Device Operation /
> > > Processing of Incoming Packets / Hash calculation for incoming
> > packets /
> > > IPv6 packets without extension header}).
> > > > +\end{itemize}
> > > > +
> > > > +\paragraph{Hash reporting for incoming packets}
> > > > +\label{sec:Device Types / Network Device / Device Operation /
> > Processing
> > > of Incoming Packets / Hash reporting for incoming packets}
> > > > +
> > > > +If VIRTIO_NET_F_HASH_REPORT was negotiated and
> > > > + the device has calculated the hash for the packet, the device
> > fills \
> > > field{hash_type} with the type of calculated hash
> > > > +and \field{hash_value} with the value of calculated hash.
> > > > +
> > > > +If VIRTIO_NET_F_HASH_REPORT was negotiated but due to any reason
> > the
> > > > +hash was not calculated, the device sets \field{hash_type} to
> > > VIRTIO_NET_HASH_REPORT_NONE.
> > > > +
> > > > +Possible values that the device can report in \field{hash_type}
> > are
> > > defined below.
> > > > +They correspond to supported hash types defined in
> > > > +\ref{sec:Device Types / Network Device / Device Operation /
> > Processing
> > > of Incoming Packets / Hash calculation for incoming packets /
> > Supported/
> > > enabled hash types}
> > > > +as follows:
> > > > +
> > > > +VIRTIO_NET_HASH_TYPE_XXX =3D 1 << (VIRTIO_NET_HASH_REPORT_XXX - 1)
> > >
> > >
> > > So hash_type is the HASH_REPORT value then? That's quite confusing.
> > > Let's rename to hash_report?
> > >
> > > No problem to rename anything, but I'd like to do it one time.
> > > Currently meaningful hash report values are (1..9), 0 for none
> > > They correspond to bitmask of 9 bits for enabled/supported.
> > > It was possible to use the same definitions for enable/support/report
> > > but then reported kind of hash should be 4 bytes.
> > > As you anyway suggests padding at the end of the packet, we can do th=
at,
> > > i.e. add (32 bit hash + 32 bit type)
> >
> > We can but it seems like a waste, does it not? padding can be used for
> > something later ...
> >
> > > Or if we stay with the values as they are now:
> > > values 0..9 - VIRTIO_NET_WHAT?
> >
> > I thought that's VIRTIO_NET_HASH_REPORT_XXX
> >
> > OK, this is exactly what is defined
> >
> >
> > > bits from 0 to 8 - VIRTIO_NET_WHAT?
> >
> >
> > and this one VIRTIO_NET_HASH_TYPE_XXX?
> >
> > OK, this is also exactly what is defined
> >

> Right I'm saying what's defined is fine, just call the fields
> consistently.

> >
> >
> > Generally what you did here is a bit unusual. Mostly we just define
> > bit numbers
> > #define VIRTIO_SCSI_F_INOUT 0
> > #define VIRTIO_SCSI_F_HOTPLUG 1
> > #define VIRTIO_SCSI_F_CHANGE 2
> > #define VIRTIO_SCSI_F_T10_PI 3
> >
> >
> > Value 0 of hash_report is "no hash calculated" and it does not
> > participate in support/enable mask. I did not want to
> > use value other than zero for "no hash".

> Oh right.

> > So you want bit 0 to be reserved (not used) in enable/support mask
> > and then to have all the VIRTIO_NET_HASH_TYPE_XXX to be
> > exactly 1 << VIRTIO_NET_HASH_REPORT_XXX? Just say...
> >

> We can do that too but it's up to you really.

> So fixing the below you would say
> bit 0 curresponding to value 1,
> bit 1 corresponding to value 2 etc.
> No bit corresponds to value 0
> ?

Currently defined:=20

Reports:=20
VIRTIO_NET_HASH_REPORT_NONE 0=20
VIRTIO_NET_HASH_REPORT_IPv4 1=20
VIRTIO_NET_HASH_REPORT_UDPv4 3=20
VIRTIO_NET_HASH_REPORT_UDPv6_EX 9=20

Bitmask (VIRTIO_NET_HASH_TYPE_XXX =3D 1 << (VIRTIO_NET_HASH_REPORT_XXX - 1)=
):=20
VIRTIO_NET_HASH_TYPE_IPv4 =3D (1 << 0)=20
VIRTIO_NET_HASH_TYPE_UDPv4 =3D (1 << 2)=20
VIRTIO_NET_HASH_TYPE_UDP_EX =3D (1 << 8)=20

How you want it to be changed?=20
Can you please write here in the same format?=20

> >
> > and just say that bit numbers are from this table, with bit
> > 0 corresponding to the value 0, bit 1 to value 1 etc.
> >
> >
> > maybe that would have been easier on the eyes - I didn't try,
> > I'm not even sure.
> >
> > But what you have is correct enough, we can always try to
> > improve the wording later.
> >
> >
> > >
> > >
> > > > +
> > > > +\begin{lstlisting}
> > > > +#define VIRTIO_NET_HASH_REPORT_NONE 0
> > > > +#define VIRTIO_NET_HASH_REPORT_IPv4 1
> > > > +#define VIRTIO_NET_HASH_REPORT_TCPv4 2
> > > > +#define VIRTIO_NET_HASH_REPORT_UDPv4 3
> > > > +#define VIRTIO_NET_HASH_REPORT_IPv6 4
> > > > +#define VIRTIO_NET_HASH_REPORT_TCPv6 5
> > > > +#define VIRTIO_NET_HASH_REPORT_UDPv6 6
> > > > +#define VIRTIO_NET_HASH_REPORT_IPv6_EX 7
> > > > +#define VIRTIO_NET_HASH_REPORT_TCPv6_EX 8
> > > > +#define VIRTIO_NET_HASH_REPORT_UDPv6_EX 9
> > > > +\end{lstlisting}
> > > > +
> > > > \subsubsection{Control Virtqueue}\label{sec:Device Types / Network
> > > Device / Device Operation / Control Virtqueue}
> > > >
> > > > The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
> > > > @@ -3896,6 +4064,7 @@ \subsubsection{Control Virtqueue}\label
> > {sec:Device
> > > Types / Network Device / Devi
> > > > #define VIRTIO_NET_CTRL_MQ 4
> > > > #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET 0 (for automatic
> > receive
> > > steering)
> > > > #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG 1 (for
> > configurable
> > > receive steering)
> > > > + #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG 2 (for
> > configurable hash
> > > calculation)
> > > > \end{lstlisting}
> > > >
> > > > If more than one multiqueue mode is negotiated, the resulting
> > device
> > > configuration is defined by the last command sent by the driver.
> > > > @@ -3961,10 +4130,37 @@ \subsubsection{Control Virtqueue}\label
> > > {sec:Device Types / Network Device / Devi
> > > > according to the native endian of the guest rather than
> > > > (necessarily when not using the legacy interface) little-endian.
> > > >
> > > > +\subparagraph{Hash calculation}\label{sec:Device Types / Network
> > Device
> > > / Device Operation / Control Virtqueue / Automatic receive steering
> > in
> > > multiqueue mode / Hash calculation}
> > > > +If VIRTIO_NET_F_HASH_REPORT was negotiated and the device uses
> > automatic
> > > receive steering,
> > > > +the device MUST support a command to configure hash calculation
> > > parameters.
> > > > +
> > > > +The driver provides parameters for hash calculation as follows:
> > > > +
> > > > +\field{class} VIRTIO_NET_CTRL_MQ, \field{command}
> > > VIRTIO_NET_CTRL_MQ_HASH_CONFIG.
> > > > +
> > > > +The \field{command-specific-data} has following format:
> > > > +\begin{lstlisting}
> > > > +struct virtio_net_hash_config {
> > > > + le32 hash_types;
> > > > + le16 reserved[4];
> > > > + u8 hash_key_length;
> > > > + u8 hash_key_data[hash_key_length];
> > > > +};
> > > > +\end{lstlisting}
> > > > +Field \field{hash_types} contains a bitmask of allowed hash types
> > as
> > > > +defined in
> > > > +\ref{sec:Device Types / Network Device / Device Operation /
> > Processing
> > > of Incoming Packets / Hash calculation for incoming packets /
> > Supported/
> > > enabled hash types}.
> > > > +Initially the device has all hash types disabled and reports only
> > > VIRTIO_NET_HASH_REPORT_NONE.
> > > > +
> > > > +Field \field{reserved} MUST contain zeroes. It is defined to make
> > the
> > > structure to match the layout of virtio_net_rss_config structure,
> > > > +defined in \ref{sec:Device Types / Network Device / Device
> > Operation /
> > > Control Virtqueue / Receive-side scaling (RSS)}.
> > > > +
> > > > +Fields \field{hash_key_length} and \field{hash_key_data} define
> > the key
> > > to be used in hash calculation.
> > > > +
> > > > \paragraph{Receive-side scaling (RSS)}\label{sec:Device Types /
> > Network
> > > Device / Device Operation / Control Virtqueue / Receive-side scaling
> > (RSS)}
> > > > A device offers the feature VIRTIO_NET_F_RSS if it supports RSS
> > receive
> > > steering with Toeplitz hash calculation and configurable parameters.
> > > >
> > > > -A driver queries RSS capabilities of the device by reading device
> > > configuration as defined in \ref{sec:Device Types / Network Device /
> > Device
> > > configuration layout / RSS}
> > > > +A driver queries RSS capabilities of the device by reading device
> > > configuration as defined in \ref{sec:Device Types / Network Device /
> > Device
> > > configuration layout}
> > > >
> > > > \subparagraph{Setting RSS parameters}\label{sec:Device Types /
> > Network
> > > Device / Device Operation / Control Virtqueue / Receive-side scaling
> > (RSS)
> > > / Setting RSS parameters}
> > > >
> > > > @@ -3981,7 +4177,8 @@ \subsubsection{Control Virtqueue}\label
> > {sec:Device
> > > Types / Network Device / Devi
> > > > };
> > > > \end{lstlisting}
> > > > Field \field{hash_types} contains a bitmask of allowed hash types
> > as
> > > > -defined in \ref{sec:Device Types / Network Device / Device
> > Operation /
> > > Control Virtqueue / Receive-side scaling (RSS) / RSS hash types}.
> > > > +defined in
> > > > +\ref{sec:Device Types / Network Device / Device Operation /
> > Processing
> > > of Incoming Packets / Hash calculation for incoming packets /
> > Supported/
> > > enabled hash types}.
> > > >
> > > > Field \field{indirection_table_mask} is a mask to be applied to
> > > > the calculated hash to produce an index in the
> > > > @@ -3995,93 +4192,7 @@ \subsubsection{Control Virtqueue}\label
> > {sec:Device
> > > Types / Network Device / Devi
> > > >
> > > > A driver sets \field{max_tx_vq} to inform a device how many
> > transmit
> > > virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
> > > >
> > > > -\subparagraph{RSS hash types}\label{sec:Device Types / Network
> > Device /
> > > Device Operation / Control Virtqueue / Receive-side scaling (RSS) /
> > RSS
> > > hash types}
> > > > -
> > > > -The device calculates the hash on IPv4 packets according to the
> > > > -field \field{hash_types} of the virtio_net_rss_config structure as
> > > follows:
> > > > -\begin{itemize}
> > > > -\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv4 is set and the packet has
> > > > -a TCP header, the hash is calculated over the following fields:
> > > > -\begin{itemize}
> > > > -\item Source IP address
> > > > -\item Destination IP address
> > > > -\item Source TCP port
> > > > -\item Destination TCP port
> > > > -\end{itemize}
> > > > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set and the
> > > > -packet has a UDP header, the hash is calculated over the following
> > > fields:
> > > > -\begin{itemize}
> > > > -\item Source IP address
> > > > -\item Destination IP address
> > > > -\item Source UDP port
> > > > -\item Destination UDP port
> > > > -\end{itemize}
> > > > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv4 is set, the hash is
> > > > -calculated over the following fields:
> > > > -\begin{itemize}
> > > > -\item Source IP address
> > > > -\item Destination IP address
> > > > -\end{itemize}
> > > > -\item Else the device does not calculate the hash
> > > > -\end{itemize}
> > > > -
> > > > -\label{itm:Device Types / Network Device / Device Operation /
> > Control
> > > Virtqueue / Receive-side scaling (RSS) / RSS hash types/hash on IPv6
> > > packets without extension headers}
> > > > -The device calculates the hash on IPv6 packets without extension
> > > > -headers according to the field \field{hash_types} of the
> > > virtio_net_rss_config structure as follows:
> > > > -\begin{itemize}
> > > > -\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set and the packet has
> > > > -a TCPv6 header, the hash is calculated over the following fields:
> > > > -\begin{itemize}
> > > > -\item Source IPv6 address
> > > > -\item Destination IPv6 address
> > > > -\item Source TCP port
> > > > -\item Destination TCP port
> > > > -\end{itemize}
> > > > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is set and the
> > > > -packet has a UDPv6 header, the hash is calculated over the
> > following
> > > fields:
> > > > -\begin{itemize}
> > > > -\item Source IPv6 address
> > > > -\item Destination IPv6 address
> > > > -\item Source UDP port
> > > > -\item Destination UDP port
> > > > -\end{itemize}
> > > > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv6 is set, the hash is
> > > > -calculated over the following fields:
> > > > -\begin{itemize}
> > > > -\item Source IPv6 address
> > > > -\item Destination IPv6 address
> > > > -\end{itemize}
> > > > -\item Else the device does not calculate the hash
> > > > -\end{itemize}
> > > > -
> > > > -The device calculates the hash on IPv6 packets with extension
> > > > -headers according to the field \field{hash_types} of the
> > > virtio_net_rss_config structure as follows:
> > > > -\begin{itemize}
> > > > -\item If VIRTIO_NET_RSS_HASH_TYPE_TCP_EX is set and the packet
> > > > -has a TCPv6 header, the hash is calculated over the following
> > fields:
> > > > -\begin{itemize}
> > > > -\item Home address from the home address option in the IPv6
> > destination
> > > options header. If the extension header is not present, use the
> > Source IPv6
> > > address.
> > > > -\item IPv6 address that is contained in the Routing-Header-Type-2
> > from
> > > the associated extension header. If the extension header is not
> > present,
> > > use the Destination IPv6 address.
> > > > -\item Source TCP port
> > > > -\item Destination TCP port
> > > > -\end{itemize}
> > > > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the
> > > > -packet has a UDPv6 header, the hash is calculated over the
> > following
> > > fields:
> > > > -\begin{itemize}
> > > > -\item Home address from the home address option in the IPv6
> > destination
> > > options header. If the extension header is not present, use the
> > Source IPv6
> > > address.
> > > > -\item IPv6 address that is contained in the Routing-Header-Type-2
> > from
> > > the associated extension header. If the extension header is not
> > present,
> > > use the Destination IPv6 address.
> > > > -\item Source UDP port
> > > > -\item Destination UDP port
> > > > -\end{itemize}
> > > > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is
> > > > -calculated over the following fields:
> > > > -\begin{itemize}
> > > > -\item Home address from the home address option in the IPv6
> > destination
> > > options header. If the extension header is not present, use the
> > Source IPv6
> > > address.
> > > > -\item IPv6 address that is contained in the Routing-Header-Type-2
> > from
> > > the associated extension header. If the extension header is not
> > present,
> > > use the Destination IPv6 address.
> > > > -\end{itemize}
> > > > -\item Else skip IPv6 extension headers and calculate the hash as
> > > > -defined for an IPv6 packet without extension headers (see \ref
> > > {itm:Device Types / Network Device / Device Operation / Control
> > Virtqueue /
> > > Receive-side scaling (RSS) / RSS hash types/hash on IPv6 packets
> > without
> > > extension headers}).
> > > > -\end{itemize}
> > > > +Fields \field{hash_key_length} and \field{hash_key_data} define
> > the key
> > > to be used in hash calculation.
> > > >
> > > > \drivernormative{\subparagraph}{Setting RSS parameters}{Device
> > Types /
> > > Network Device / Device Operation / Control Virtqueue / Receive-side
> > > scaling (RSS) }
> > > >
> > > > @@ -4093,12 +4204,12 @@ \subsubsection{Control Virtqueue}\label
> > > {sec:Device Types / Network Device / Devi
> > > >
> > > > A driver MUST use \field{indirection_table_mask} values that are
> > less
> > > than \field{rss_max_indirection_table_length} reported by a device.
> > > >
> > > > -A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are
> > not
> > > supported by a device.
> > > > +A driver MUST NOT set any VIRTIO_NET_HASH_TYPE_ flags that are not
> > > supported by a device.
> > > >
> > > > \devicenormative{\subparagraph}{RSS processing}{Device Types /
> > Network
> > > Device / Device Operation / Control Virtqueue / Receive-side scaling
> > (RSS)
> > > / RSS processing}
> > > > The device MUST determine the destination queue for a network
> > packet as
> > > follows:
> > > > \begin{itemize}
> > > > -\item Calculate the hash of the packet as defined in \ref
> > {sec:Device
> > > Types / Network Device / Device Operation / Control Virtqueue /
> > > Receive-side scaling (RSS) / RSS hash types}
> > > > +\item Calculate the hash of the packet as defined in \ref
> > {sec:Device
> > > Types / Network Device / Device Operation / Processing of Incoming
> > Packets
> > > / Hash calculation for incoming packets}.
> > > > \item If the device did not calculate the hash for the specific
> > packet,
> > > the device directs the packet to the receiveq specified by \field
> > > {unclassified_queue} of virtio_net_rss_config structure (value of 0
> > > corresponds to receiveq1).
> > > > \item Apply \field{indirection_table_mask} to the calculated hash
> > and
> > > use the result as the index in the indirection table to get 0-based
> > number
> > > of destination receiveq (value of 0 corresponds to receiveq1).
> > > > \end{itemize}
> > > > --
> > > > 2.17.1
> > >
> > >
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > >
> > > In order to verify user consent to the Feedback License terms and
> > > to minimize spam in the list archive, subscription is required
> > > before posting.
> > >
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > Feedback License: https://www.oasis-open.org/who/ipr/
> > feedback_license.pdf
> > > List Guidelines: https://www.oasis-open.org/policies-guidelines/
> > > mailing-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/
> > >
> > >
> > >
> >
> >
> >

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

------=_Part_7345660_715052899.1582175341195
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: courier new,courier,monaco,monospace=
,sans-serif; font-size: 12pt; color: #000000"><div><br></div><div><br></div=
><hr id=3D"zwchr"><blockquote style=3D"border-left:2px solid #1010FF;margin=
-left:5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;=
text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;=
" data-mce-style=3D"border-left: 2px solid #1010FF; margin-left: 5px; paddi=
ng-left: 5px; color: #000; font-weight: normal; font-style: normal; text-de=
coration: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;">=
<b>From: </b>"Michael S. Tsirkin" &lt;mst@redhat.com&gt;<br><b>To: </b>"Yur=
i Benditovich" &lt;ybendito@redhat.com&gt;<br><b>Cc: </b>"Yuri Benditovich"=
 &lt;yuri.benditovich@daynix.com&gt;, virtio-comment@lists.oasis-open.org<b=
r><b>Sent: </b>Wednesday, February 19, 2020 4:56:04 PM<br><b>Subject: </b>R=
e: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define per-packet hash r=
eporting feature<br><div><br></div>On Wed, Feb 19, 2020 at 09:49:37AM -0500=
, Yuri Benditovich wrote:<br>&gt; <br>&gt; <br>&gt; =E2=94=81=E2=94=81=E2=
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
lt;mst@redhat.com&gt;<br>&gt; &nbsp; &nbsp; To: "Yuri Benditovich" &lt;yben=
dito@redhat.com&gt;<br>&gt; &nbsp; &nbsp; Cc: "Yuri Benditovich" &lt;yuri.b=
enditovich@daynix.com&gt;,<br>&gt; &nbsp; &nbsp; virtio-comment@lists.oasis=
-open.org<br>&gt; &nbsp; &nbsp; Sent: Wednesday, February 19, 2020 4:35:49 =
PM<br>&gt; &nbsp; &nbsp; Subject: Re: [virtio-comment] Re: [PATCH v4 1/1] v=
irtio-net: Define<br>&gt; &nbsp; &nbsp; per-packet hash reporting feature<b=
r>&gt; <br>&gt; &nbsp; &nbsp; On Wed, Feb 19, 2020 at 06:07:13AM -0500, Yur=
i Benditovich wrote:<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; &gt;<=
br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; =E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &=
nbsp; From: "Michael S. Tsirkin" &lt;mst@redhat.com&gt;<br>&gt; &nbsp; &nbs=
p; &gt; &nbsp; &nbsp; To: "Yuri Benditovich" &lt;yuri.benditovich@daynix.co=
m&gt;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Cc: virtio-comment@lists.oas=
is-open.org<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Sent: Wednesday, Febru=
ary 19, 2020 11:12:40 AM<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Subject: =
[virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define<br>&gt; &nbsp; &nbsp=
; per-packet<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; hash reporting featur=
e<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; On We=
d, Feb 19, 2020 at 09:53:37AM +0200, Yuri Benditovich wrote:<br>&gt; &nbsp;=
 &nbsp; &gt; &nbsp; &nbsp; &gt; Fixes: https://github.com/oasis-tcs/virtio-=
spec/issues/66<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; Define respect=
ive feature bit for virtio-net.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &g=
t; Extend packet layout to populate hash value and type.<br>&gt; &nbsp; &nb=
sp; &gt; &nbsp; &nbsp; &gt; Move the definition of IP/TCP/UDP header fields=
 to<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; calculate the hash out of=
 RSS section to common network<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt=
; device section.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt;<br>&gt; &nb=
sp; &nbsp; &gt; &nbsp; &nbsp; &gt; Signed-off-by: Yuri Benditovich &lt;yuri=
.benditovich@daynix.com&gt;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -=
--<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;content.tex | 347<br=
>&gt; &nbsp; &nbsp; ++++++++++++++++++++++++++++++++++------------------<br=
>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;1 file changed, 229 inser=
tions(+), 118 deletions(-)<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt;<br=
>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; diff --git a/content.tex b/cont=
ent.tex<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; index b91a132..d7d4e4=
2 100644<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; --- a/content.tex<br=
>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +++ b/content.tex<br>&gt; &nbsp=
; &nbsp; &gt; &nbsp; &nbsp; &gt; @@ -2895,6 +2895,9 @@ \subsection{Feature =
bits}\label{sec:Device<br>&gt; &nbsp; &nbsp; Types /<br>&gt; &nbsp; &nbsp; =
&gt; &nbsp; &nbsp; Network Device / Feature bits<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; &nbsp; &gt; &nbsp;\item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC add=
ress through<br>&gt; &nbsp; &nbsp; control<br>&gt; &nbsp; &nbsp; &gt; &nbsp=
; &nbsp; &gt; &nbsp; &nbsp; &nbsp;channel.<br>&gt; &nbsp; &nbsp; &gt; &nbsp=
; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item[V=
IRTIO_NET_F_HASH_REPORT(57)] Device can report per-packet<br>&gt; &nbsp; &n=
bsp; hash<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; + &nbsp; &nbsp;valu=
e and a type of calculated hash.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &=
gt; +<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;\item[VIRTIO_NET_=
F_GUEST_HDRLEN(59)] Driver can provide the exact<br>&gt; &nbsp; &nbsp; \fie=
ld<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; {hdr_len}<br>&gt; &nbsp; &nbsp;=
 &gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &nbsp;value. Device benefits from kn=
owing the exact header length.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt=
; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; @@ -2995,35 +2998,17=
 @@ \subsection{Device configuration layout}\<br>&gt; &nbsp; &nbsp; label<b=
r>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; {sec:Device Types / Network Device<=
br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;le32 supported_hash_types;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &g=
t; &nbsp;};<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;\end{lstlis=
ting}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\label{sec:Device Type=
s / Network Device / Device configuration<br>&gt; &nbsp; &nbsp; layout /<br=
>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; RSS}<br>&gt; &nbsp; &nbsp; &gt; &nbs=
p; &nbsp; &gt; -Three following fields, \field{rss_max_key_size}, \field<br=
>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; {rss_max_indirection_table_length}<b=
r>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -and \field{supported_hash_typ=
es} only exist if VIRTIO_NET_F_RSS is<br>&gt; &nbsp; &nbsp; set.<br>&gt; &n=
bsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +The following field, \field{rss_max_ke=
y_size} only exist if<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; VIRTIO_NET_F=
_RSS or VIRTIO_NET_F_HASH_REPORT is set.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; =
&nbsp; &gt; +It specifies the maximal supported length of RSS key in bytes.=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp;=
 &gt; &nbsp; &nbsp; &gt; -Field \field{rss_max_key_size} specifies the maxi=
mal supported<br>&gt; &nbsp; &nbsp; length of<br>&gt; &nbsp; &nbsp; &gt; &n=
bsp; &nbsp; RSS key in bytes.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt;=
 +The following field, \field{rss_max_indirection_table_length} only<br>&gt=
; &nbsp; &nbsp; exist<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; if VIRTIO_NE=
T_F_RSS is set.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +It specifies=
 the maximal number of 16-bit entries in RSS<br>&gt; &nbsp; &nbsp; indirect=
ion<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; table.<br>&gt; &nbsp; &nbsp; &=
gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt;=
 -Field \field{rss_max_indirection_table_length} specifies the<br>&gt; &nbs=
p; &nbsp; maximal<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; number of 16-bit=
 entries in RSS indirection table.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp;=
 &gt; +The next field, \field{supported_hash_types} exists only if the<br>&=
gt; &nbsp; &nbsp; device<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; supports =
hash calculation,<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +i.e. if VI=
RTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT is set.<br>&gt; &nbsp; &nbsp; &g=
t; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; =
-Field \field{supported_hash_types} contains the bitmask of<br>&gt; &nbsp; =
&nbsp; supported RSS<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; hash types.<b=
r>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -<br>&gt; &nbsp; &nbsp; &gt; &=
nbsp; &nbsp; &gt; -Hash types applicable for IPv4 packets:<br>&gt; &nbsp; &=
nbsp; &gt; &nbsp; &nbsp; &gt; -\begin{lstlisting}<br>&gt; &nbsp; &nbsp; &gt=
; &nbsp; &nbsp; &gt; -#define VIRTIO_NET_RSS_HASH_TYPE_IPv4 &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 0)<br>&gt; &nbsp; &nbsp; &gt; =
&nbsp; &nbsp; &gt; -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4 &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 1)<br>&gt; &nbsp; &nbsp; &gt; &nbsp; =
&nbsp; &gt; -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4 &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; (1 &lt;&lt; 2)<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; =
&gt; -\end{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -Hash =
types applicable for IPv6 packets without extension headers<br>&gt; &nbsp; =
&nbsp; &gt; &nbsp; &nbsp; &gt; -\begin{lstlisting}<br>&gt; &nbsp; &nbsp; &g=
t; &nbsp; &nbsp; &gt; -#define VIRTIO_NET_RSS_HASH_TYPE_IPv6 &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 3)<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; &nbsp; &gt; -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6 &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 4)<br>&gt; &nbsp; &nbsp; &gt; &nbsp;=
 &nbsp; &gt; -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6 &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; (1 &lt;&lt; 5)<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp;=
 &gt; -\end{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -Hash=
 types applicable for IPv6 packets with extension headers<br>&gt; &nbsp; &n=
bsp; &gt; &nbsp; &nbsp; &gt; -\begin{lstlisting}<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; &nbsp; &gt; -#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 6)<br>&gt; &nbsp; &nbsp; &gt; &nbsp;=
 &nbsp; &gt; -#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;(1 &lt;&lt; 7)<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp;=
 &gt; -#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;(1 &lt;&lt; 8)<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -=
\end{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -For the exa=
ct meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref<br>&gt; &nbsp; &nbsp=
; &gt; &nbsp; &nbsp; {sec:Device Types / Network Device / Device Operation =
/ Control<br>&gt; &nbsp; &nbsp; Virtqueue /<br>&gt; &nbsp; &nbsp; &gt; &nbs=
p; &nbsp; Receive-side scaling (RSS) / RSS hash types}.<br>&gt; &nbsp; &nbs=
p; &gt; &nbsp; &nbsp; &gt; +Field \field{supported_hash_types} contains the=
 bitmask of<br>&gt; &nbsp; &nbsp; supported<br>&gt; &nbsp; &nbsp; &gt; &nbs=
p; &nbsp; hash types.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +See \r=
ef{sec:Device Types / Network Device / Device Operation /<br>&gt; &nbsp; &n=
bsp; &gt; &nbsp; &nbsp; Processing of Incoming Packets / Hash calculation f=
or incoming<br>&gt; &nbsp; &nbsp; packets /<br>&gt; &nbsp; &nbsp; &gt; &nbs=
p; &nbsp; Supported/enabled hash types} for details of supported hash types=
.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp=
; &gt; &nbsp; &nbsp; &gt; &nbsp;\devicenormative{\subsubsection}{Device con=
figuration layout}<br>&gt; &nbsp; &nbsp; {Device<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; &nbsp; Types / Network Device / Device configuration layout}<br>&gt=
; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &=
nbsp; &nbsp; &gt; @@ -3048,7 +3033,7 @@ \subsection{Device configuration la=
yout}\<br>&gt; &nbsp; &nbsp; label<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp;=
 {sec:Device Types / Network Device<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp=
; &gt; &nbsp;negotiated.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbs=
p;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;The device MUST set =
\field{rss_max_key_size} to at least 40, if it<br>&gt; &nbsp; &nbsp; &gt; &=
nbsp; &nbsp; offers<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -VIRTIO_N=
ET_F_RSS.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +VIRTIO_NET_F_RSS o=
r VIRTIO_NET_F_HASH_REPORT.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &=
nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;The device MUST s=
et \field{rss_max_indirection_table_length} to at<br>&gt; &nbsp; &nbsp; lea=
st<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; 128, if it offers<br>&gt; &nbsp=
; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;VIRTIO_NET_F_RSS.<br>&gt; &nbsp; &nb=
sp; &gt; &nbsp; &nbsp; &gt; @@ -3195,6 +3180,8 @@ \subsection{Device Operat=
ion}\label<br>&gt; &nbsp; &nbsp; {sec:Device<br>&gt; &nbsp; &nbsp; &gt; &nb=
sp; &nbsp; Types / Network Device / Device O<br>&gt; &nbsp; &nbsp; &gt; &nb=
sp; &nbsp; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le16 csum_start;<br>&gt; =
&nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le1=
6 csum_offset;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;le16 num_buffers;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nb=
sp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;le32 hash_value; (Only if VIRTIO_NET_=
F_HASH_REPORT<br>&gt; &nbsp; &nbsp; negotiated)<br>&gt; &nbsp; &nbsp; &gt; =
&nbsp; &nbsp; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;le16 hash_type; &nbsp;(Only=
 if VIRTIO_NET_F_HASH_REPORT<br>&gt; &nbsp; &nbsp; negotiated)<br>&gt; &nbs=
p; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;};<br>&gt; &nbsp; &nbsp; &gt;<br>&g=
t; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Just noticed this - it's a bit problema=
tic as it might force<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; compilers to=
 add 2 bytes of padding at the end. Let's add extra 2<br>&gt; &nbsp; &nbsp;=
 bytes<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; of padding explicitly?<br>&=
gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; &gt; OK, no problem<br>&gt; &n=
bsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; &gt;<br>&=
gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;=
\end{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&g=
t; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; @@ -3517,6 +3504,12 @@ \subsubsect=
ion{Processing of Incoming<br>&gt; &nbsp; &nbsp; Packets}\<br>&gt; &nbsp; &=
nbsp; &gt; &nbsp; &nbsp; label{sec:Device Types / Network<br>&gt; &nbsp; &n=
bsp; &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp=
; &gt; &nbsp;\end{enumerate}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; =
&nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +If applicable, the de=
vice calculates per-packet hash for incoming<br>&gt; &nbsp; &nbsp; &gt; &nb=
sp; &nbsp; packets as<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +define=
d in \ref{sec:Device Types / Network Device / Device<br>&gt; &nbsp; &nbsp; =
Operation /<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Processing of Incoming=
 Packets / Hash calculation for incoming<br>&gt; &nbsp; &nbsp; packets}.<br=
>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &n=
bsp; &nbsp; &gt; +If applicable, the device reports hash information for in=
coming<br>&gt; &nbsp; &nbsp; packets<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbs=
p; as<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +defined in \ref{sec:De=
vice Types / Network Device / Device<br>&gt; &nbsp; &nbsp; Operation /<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Processing of Incoming Packets / Hash =
reporting for incoming<br>&gt; &nbsp; &nbsp; packets}.<br>&gt; &nbsp; &nbsp=
; &gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &=
nbsp;\devicenormative{\paragraph}{Processing of Incoming Packets}<br>&gt; &=
nbsp; &nbsp; {Device<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Types / Netwo=
rk Device / Device Operation / Processing of Incoming<br>&gt; &nbsp; &nbsp;=
 Packets}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;\label{device=
normative:Device Types / Network Device / Device<br>&gt; &nbsp; &nbsp; Oper=
ation<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; / Processing of Packets}%old=
 label for latexdiff<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;<b=
r>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; @@ -3619,6 +3612,181 @@ \subsu=
bsection{Processing of Incoming<br>&gt; &nbsp; &nbsp; Packets}\<br>&gt; &nb=
sp; &nbsp; &gt; &nbsp; &nbsp; label{sec:Device Types / Network<br>&gt; &nbs=
p; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;If neither VIRTIO_NET_HDR_F_NEEDS_C=
SUM nor<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;VIRTIO_NET_HDR_=
F_DATA_VALID is set, the driver MUST NOT<br>&gt; &nbsp; &nbsp; &gt; &nbsp; =
&nbsp; &gt; &nbsp;rely on the packet checksum being correct.<br>&gt; &nbsp;=
 &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; =
&gt; +\paragraph{Hash calculation for incoming packets}<br>&gt; &nbsp; &nbs=
p; &gt; &nbsp; &nbsp; &gt; +\label{sec:Device Types / Network Device / Devi=
ce Operation /<br>&gt; &nbsp; &nbsp; Processing<br>&gt; &nbsp; &nbsp; &gt; =
&nbsp; &nbsp; of Incoming Packets / Hash calculation for incoming packets}<=
br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; =
&nbsp; &nbsp; &gt; +A device attempts to calculate a per-packet hash in the=
 following<br>&gt; &nbsp; &nbsp; cases:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &=
nbsp; &gt; +\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +=
\item The feature VIRTIO_NET_F_RSS was negotiated. The device uses<br>&gt; =
&nbsp; &nbsp; the<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; hash to determin=
e the receive virtqueue to place incoming packets.<br>&gt; &nbsp; &nbsp; &g=
t; &nbsp; &nbsp; &gt; +\item The feature VIRTIO_NET_F_HASH_REPORT was negot=
iated. The<br>&gt; &nbsp; &nbsp; device<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &=
nbsp; reports the hash value and the hash type with the packet.<br>&gt; &nb=
sp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &nbsp; &nbsp; &gt=
; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +If th=
e feature VIRTIO_NET_F_RSS was negotiated:<br>&gt; &nbsp; &nbsp; &gt; &nbsp=
; &nbsp; &gt; +\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt=
; +\item The device uses \field{hash_types} of the<br>&gt; &nbsp; &nbsp; vi=
rtio_net_rss_config<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; structure as '=
Enabled hash types' bitmask.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; =
+\item The device uses a key as defined in \field{hash_key_data}<br>&gt; &n=
bsp; &nbsp; and \<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; field{hash_key_l=
ength} of the virtio_net_rss_config structure (see<br>&gt; &nbsp; &nbsp; &g=
t; &nbsp; &nbsp; &gt; +\ref{sec:Device Types / Network Device / Device Oper=
ation /<br>&gt; &nbsp; &nbsp; Control<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nb=
sp; Virtqueue / Receive-side scaling (RSS) / Setting RSS parameters}).<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &nbsp; &nb=
sp; &gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt;=
 +If the feature VIRTIO_NET_F_RSS was not negotiated:<br>&gt; &nbsp; &nbsp;=
 &gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp;=
 &nbsp; &gt; +\item The device uses \field{hash_types} of the<br>&gt; &nbsp=
; &nbsp; virtio_net_hash_config<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; st=
ructure as 'Enabled hash types' bitmask.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; =
&nbsp; &gt; +\item The device uses a key as defined in \field{hash_key_data=
}<br>&gt; &nbsp; &nbsp; and \<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; fiel=
d{hash_key_length} of the virtio_net_hash_config structure (see<br>&gt; &nb=
sp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\ref{sec:Device Types / Network Device =
/ Device Operation /<br>&gt; &nbsp; &nbsp; Control<br>&gt; &nbsp; &nbsp; &g=
t; &nbsp; &nbsp; Virtqueue / Automatic receive steering in multiqueue mode =
/ Hash<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; calculation}).<br>&gt; &nbs=
p; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +Note t=
hat if the device offers VIRTIO_NET_F_HASH_REPORT, even if<br>&gt; &nbsp; &=
nbsp; it<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; supports only one pair of=
 virtqueues, it MUST support<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; =
+at least one of commands of VIRTIO_NET_CTRL_MQ class to configure<br>&gt; =
&nbsp; &nbsp; &gt; &nbsp; &nbsp; reported hash parameters:<br>&gt; &nbsp; &=
nbsp; &gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; &=
nbsp; &nbsp; &gt; +\item If the device offers VIRTIO_NET_F_RSS, it MUST sup=
port<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; VIRTIO_NET_CTRL_MQ_RSS_CONFIG=
 command per<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; + \ref{sec:Devic=
e Types / Network Device / Device Operation /<br>&gt; &nbsp; &nbsp; Control=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Virtqueue / Receive-side scaling =
(RSS) / Setting RSS parameters}.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &=
gt; +\item Otherwise the device MUST support<br>&gt; &nbsp; &nbsp; VIRTIO_N=
ET_CTRL_MQ_HASH_CONFIG<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; command per=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; + \ref{sec:Device Types / Ne=
twork Device / Device Operation /<br>&gt; &nbsp; &nbsp; Control<br>&gt; &nb=
sp; &nbsp; &gt; &nbsp; &nbsp; Virtqueue / Automatic receive steering in mul=
tiqueue mode / Hash<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; calculation}.<=
br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &nbsp;=
 &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; =
&gt; +\subparagraph{Supported/enabled hash types}<br>&gt; &nbsp; &nbsp; &gt=
; &nbsp; &nbsp; &gt; +\label{sec:Device Types / Network Device / Device Ope=
ration /<br>&gt; &nbsp; &nbsp; Processing<br>&gt; &nbsp; &nbsp; &gt; &nbsp;=
 &nbsp; of Incoming Packets / Hash calculation for incoming packets /<br>&g=
t; &nbsp; &nbsp; Supported/<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; enable=
d hash types}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +Hash types app=
licable for IPv4 packets:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\b=
egin{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +#define VIR=
TIO_NET_HASH_TYPE_IPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &=
lt;&lt; 0)<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NE=
T_HASH_TYPE_TCPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 1)<=
br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_TYPE=
_UDPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 2)<br>&gt; &nb=
sp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{lstlisting}<br>&gt; &nbsp; &nbsp; =
&gt; &nbsp; &nbsp; &gt; +Hash types applicable for IPv6 packets without ext=
ension headers<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\begin{lstlis=
ting}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HAS=
H_TYPE_IPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 3)<=
br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_TYPE=
_TCPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 4)<br>&gt; &nb=
sp; &nbsp; &gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_TYPE_UDPv6 &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 5)<br>&gt; &nbsp; &nbsp; =
&gt; &nbsp; &nbsp; &gt; +\end{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; &nbsp;=
 &nbsp; &gt; +Hash types applicable for IPv6 packets with extension headers=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\begin{lstlisting}<br>&gt; =
&nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_TYPE_IP_EX &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 6)<br>&gt; &nbsp; &nbs=
p; &gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_TYPE_TCP_EX &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 7)<br>&gt; &nbsp; &nbsp; &gt; &nb=
sp; &nbsp; &gt; +#define VIRTIO_NET_HASH_TYPE_UDP_EX &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;(1 &lt;&lt; 8)<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; =
&gt; +\end{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\subparagraph{IPv4 packets}<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\label{sec:Device Types / Networ=
k Device / Device Operation /<br>&gt; &nbsp; &nbsp; Processing<br>&gt; &nbs=
p; &nbsp; &gt; &nbsp; &nbsp; of Incoming Packets / Hash calculation for inc=
oming packets / IPv4<br>&gt; &nbsp; &nbsp; packets}<br>&gt; &nbsp; &nbsp; &=
gt; &nbsp; &nbsp; &gt; +The device calculates the hash on IPv4 packets acco=
rding to<br>&gt; &nbsp; &nbsp; 'Enabled<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &=
nbsp; hash types' bitmask as follows:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nb=
sp; &gt; +\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\i=
tem If VIRTIO_NET_HASH_TYPE_TCPv4 is set and the packet has<br>&gt; &nbsp; =
&nbsp; &gt; &nbsp; &nbsp; &gt; +a TCP header, the hash is calculated over t=
he following fields:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\begin{=
itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Source IP add=
ress<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Destination IP ad=
dress<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Source TCP port<=
br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Destination TCP port<b=
r>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &nbsp; =
&nbsp; &gt; &nbsp; &nbsp; &gt; +\item Else if VIRTIO_NET_HASH_TYPE_UDPv4 is=
 set and the<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +packet has a UD=
P header, the hash is calculated over the following<br>&gt; &nbsp; &nbsp; &=
gt; &nbsp; &nbsp; fields:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\b=
egin{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Source I=
P address<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Destination =
IP address<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Source UDP =
port<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Destination UDP p=
ort<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &n=
bsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Else if VIRTIO_NET_HASH_TYPE_IPv=
4 is set, the hash is<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +calcul=
ated over the following fields:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &g=
t; +\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item So=
urce IP address<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Destin=
ation IP address<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{itemiz=
e}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Else the device doe=
s not calculate the hash<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\en=
d{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &=
nbsp; &gt; &nbsp; &nbsp; &gt; +\subparagraph{IPv6 packets without extension=
 header}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\label{sec:Device T=
ypes / Network Device / Device Operation /<br>&gt; &nbsp; &nbsp; Processing=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; of Incoming Packets / Hash calcul=
ation for incoming packets / IPv6<br>&gt; &nbsp; &nbsp; packets<br>&gt; &nb=
sp; &nbsp; &gt; &nbsp; &nbsp; without extension header}<br>&gt; &nbsp; &nbs=
p; &gt; &nbsp; &nbsp; &gt; +The device calculates the hash on IPv6 packets =
without extension<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +headers ac=
cording to 'Enabled hash types' bitmask as follows:<br>&gt; &nbsp; &nbsp; &=
gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &=
nbsp; &gt; +\item If VIRTIO_NET_HASH_TYPE_TCPv6 is set and the packet has<b=
r>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +a TCPv6 header, the hash is c=
alculated over the following fields:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbs=
p; &gt; +\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\it=
em Source IPv6 address<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item=
 Destination IPv6 address<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\i=
tem Source TCP port<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item De=
stination TCP port<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{item=
ize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Else if VIRTIO_NE=
T_HASH_TYPE_UDPv6 is set and the<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &=
gt; +packet has a UDPv6 header, the hash is calculated over the<br>&gt; &nb=
sp; &nbsp; following<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; fields:<br>&g=
t; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&gt; &nbsp; &n=
bsp; &gt; &nbsp; &nbsp; &gt; +\item Source IPv6 address<br>&gt; &nbsp; &nbs=
p; &gt; &nbsp; &nbsp; &gt; +\item Destination IPv6 address<br>&gt; &nbsp; &=
nbsp; &gt; &nbsp; &nbsp; &gt; +\item Source UDP port<br>&gt; &nbsp; &nbsp; =
&gt; &nbsp; &nbsp; &gt; +\item Destination UDP port<br>&gt; &nbsp; &nbsp; &=
gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nb=
sp; &gt; +\item Else if VIRTIO_NET_HASH_TYPE_IPv6 is set, the hash is<br>&g=
t; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +calculated over the following fie=
lds:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&gt;=
 &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Source IPv6 address<br>&gt; &=
nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Destination IPv6 address<br>&gt=
; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &nbsp; &nbsp=
; &gt; &nbsp; &nbsp; &gt; +\item Else the device does not calculate the has=
h<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &nbs=
p; &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp=
; &gt; +\subparagraph{IPv6 packets with extension header}<br>&gt; &nbsp; &n=
bsp; &gt; &nbsp; &nbsp; &gt; +\label{sec:Device Types / Network Device / De=
vice Operation /<br>&gt; &nbsp; &nbsp; Processing<br>&gt; &nbsp; &nbsp; &gt=
; &nbsp; &nbsp; of Incoming Packets / Hash calculation for incoming packets=
 / IPv6<br>&gt; &nbsp; &nbsp; packets<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nb=
sp; with extension header}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +T=
he device calculates the hash on IPv6 packets with extension<br>&gt; &nbsp;=
 &nbsp; &gt; &nbsp; &nbsp; &gt; +headers according to 'Enabled hash types' =
bitmask as follows:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\begin{i=
temize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item If VIRTIO_NET_=
HASH_TYPE_TCP_EX is set and the packet<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &n=
bsp; &gt; +has a TCPv6 header, the hash is calculated over the following<br=
>&gt; &nbsp; &nbsp; fields:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +=
\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Home a=
ddress from the home address option in the IPv6<br>&gt; &nbsp; &nbsp; desti=
nation<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; options header. If the exte=
nsion header is not present, use the<br>&gt; &nbsp; &nbsp; Source IPv6<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; address.<br>&gt; &nbsp; &nbsp; &gt; &n=
bsp; &nbsp; &gt; +\item IPv6 address that is contained in the Routing-Heade=
r-Type-2<br>&gt; &nbsp; &nbsp; from<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp=
; the associated extension header. If the extension header is not<br>&gt; &=
nbsp; &nbsp; present,<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; use the Dest=
ination IPv6 address.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item =
Source TCP port<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Destin=
ation TCP port<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{itemize}=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Else if VIRTIO_NET_HA=
SH_TYPE_UDP_EX is set and the<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt;=
 +packet has a UDPv6 header, the hash is calculated over the<br>&gt; &nbsp;=
 &nbsp; following<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; fields:<br>&gt; =
&nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&gt; &nbsp; &nbsp=
; &gt; &nbsp; &nbsp; &gt; +\item Home address from the home address option =
in the IPv6<br>&gt; &nbsp; &nbsp; destination<br>&gt; &nbsp; &nbsp; &gt; &n=
bsp; &nbsp; options header. If the extension header is not present, use the=
<br>&gt; &nbsp; &nbsp; Source IPv6<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp;=
 address.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item IPv6 address=
 that is contained in the Routing-Header-Type-2<br>&gt; &nbsp; &nbsp; from<=
br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; the associated extension header. I=
f the extension header is not<br>&gt; &nbsp; &nbsp; present,<br>&gt; &nbsp;=
 &nbsp; &gt; &nbsp; &nbsp; use the Destination IPv6 address.<br>&gt; &nbsp;=
 &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Source UDP port<br>&gt; &nbsp; &nbsp=
; &gt; &nbsp; &nbsp; &gt; +\item Destination UDP port<br>&gt; &nbsp; &nbsp;=
 &gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &=
nbsp; &gt; +\item Else if VIRTIO_NET_HASH_TYPE_IP_EX is set, the hash is<br=
>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +calculated over the following =
fields:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\begin{itemize}<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Home address from the home=
 address option in the IPv6<br>&gt; &nbsp; &nbsp; destination<br>&gt; &nbsp=
; &nbsp; &gt; &nbsp; &nbsp; options header. If the extension header is not =
present, use the<br>&gt; &nbsp; &nbsp; Source IPv6<br>&gt; &nbsp; &nbsp; &g=
t; &nbsp; &nbsp; address.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\i=
tem IPv6 address that is contained in the Routing-Header-Type-2<br>&gt; &nb=
sp; &nbsp; from<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; the associated ext=
ension header. If the extension header is not<br>&gt; &nbsp; &nbsp; present=
,<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; use the Destination IPv6 address=
.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &nbs=
p; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Else skip IPv6 extension headers a=
nd calculate the hash as<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +def=
ined for an IPv6 packet without extension headers<br>&gt; &nbsp; &nbsp; &gt=
; &nbsp; &nbsp; &gt; +(see \ref{sec:Device Types / Network Device / Device =
Operation /<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Processing of Incoming=
 Packets / Hash calculation for incoming<br>&gt; &nbsp; &nbsp; packets /<br=
>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; IPv6 packets without extension heade=
r}).<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{itemize}<br>&gt; &=
nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &n=
bsp; &gt; +\paragraph{Hash reporting for incoming packets}<br>&gt; &nbsp; &=
nbsp; &gt; &nbsp; &nbsp; &gt; +\label{sec:Device Types / Network Device / D=
evice Operation /<br>&gt; &nbsp; &nbsp; Processing<br>&gt; &nbsp; &nbsp; &g=
t; &nbsp; &nbsp; of Incoming Packets / Hash reporting for incoming packets}=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; &nbsp; &gt; +If VIRTIO_NET_F_HASH_REPORT was negotiated and<br>&gt;=
 &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; + the device has calculated the hash=
 for the packet, the device<br>&gt; &nbsp; &nbsp; fills \<br>&gt; &nbsp; &n=
bsp; &gt; &nbsp; &nbsp; field{hash_type} with the type of calculated hash<b=
r>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +and \field{hash_value} with t=
he value of calculated hash.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; =
+<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +If VIRTIO_NET_F_HASH_REPOR=
T was negotiated but due to any reason<br>&gt; &nbsp; &nbsp; the<br>&gt; &n=
bsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +hash was not calculated, the device se=
ts \field{hash_type} to<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; VIRTIO_NET=
_HASH_REPORT_NONE.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&gt; =
&nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +Possible values that the device can =
report in \field{hash_type}<br>&gt; &nbsp; &nbsp; are<br>&gt; &nbsp; &nbsp;=
 &gt; &nbsp; &nbsp; defined below.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp;=
 &gt; +They correspond to supported hash types defined in<br>&gt; &nbsp; &n=
bsp; &gt; &nbsp; &nbsp; &gt; +\ref{sec:Device Types / Network Device / Devi=
ce Operation /<br>&gt; &nbsp; &nbsp; Processing<br>&gt; &nbsp; &nbsp; &gt; =
&nbsp; &nbsp; of Incoming Packets / Hash calculation for incoming packets /=
<br>&gt; &nbsp; &nbsp; Supported/<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; =
enabled hash types}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +as follo=
ws:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &=
gt; &nbsp; &nbsp; &gt; +VIRTIO_NET_HASH_TYPE_XXX =3D 1 &lt;&lt; (VIRTIO_NET=
_HASH_REPORT_XXX - 1)<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; &gt;=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; So hash_type is the HASH_REPORT v=
alue then? That's quite confusing.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp;=
 Let's rename to hash_report?<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nb=
sp; &gt; No problem to rename anything, but I'd like to do it one time.<br>=
&gt; &nbsp; &nbsp; &gt; Currently meaningful hash report values are (1..9),=
 0 for none<br>&gt; &nbsp; &nbsp; &gt; They correspond to bitmask of 9 bits=
 for enabled/supported.<br>&gt; &nbsp; &nbsp; &gt; It was possible to use t=
he same definitions for enable/support/report<br>&gt; &nbsp; &nbsp; &gt; bu=
t then reported kind of hash should be 4 bytes.<br>&gt; &nbsp; &nbsp; &gt; =
As you anyway suggests padding at the end of the packet, we can do that,<br=
>&gt; &nbsp; &nbsp; &gt; i.e. add (32 bit hash + 32 bit type)<br>&gt; <br>&=
gt; &nbsp; &nbsp; We can but it seems like a waste, does it not? padding ca=
n be used for<br>&gt; &nbsp; &nbsp; something later ...<br>&gt; <br>&gt; &n=
bsp; &nbsp; &gt; Or if we stay with the values as they are now:<br>&gt; &nb=
sp; &nbsp; &gt; values 0..9 - VIRTIO_NET_WHAT?<br>&gt; <br>&gt; &nbsp; &nbs=
p; I thought that's VIRTIO_NET_HASH_REPORT_XXX<br>&gt; <br>&gt; OK, this is=
 exactly what is defined<br>&gt; <br>&gt; <br>&gt; &nbsp; &nbsp; &gt; bits =
from 0 to 8 - VIRTIO_NET_WHAT?<br>&gt; <br>&gt; <br>&gt; &nbsp; &nbsp; and =
this one VIRTIO_NET_HASH_TYPE_XXX?<br>&gt; <br>&gt; OK, this is also exactl=
y what is defined<br>&gt; <br><div><br></div><br>Right I'm saying what's de=
fined is fine, just call the fields<br>consistently.<br><div><br></div>&gt;=
 <br>&gt; <br>&gt; &nbsp; &nbsp; Generally what you did here is a bit unusu=
al. Mostly we just define<br>&gt; &nbsp; &nbsp; bit numbers<br>&gt; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; #define VIRTIO_SCSI_F_INOUT &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0<br>&gt; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; #define VIRTIO_SCSI_F_HOTPLUG &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1<br>&gt; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; #define VIRTIO_SCSI_F_CHANGE &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2<br>&gt; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; #define VIRTIO_SCSI_F_T10_PI &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3<br>&gt; <br>&gt; <br>&gt; Value 0 =
of hash_report is "no hash calculated" and it does not<br>&gt; participate =
in support/enable mask. I did not want to<br>&gt; use value other than zero=
 for "no hash".<br><div><br></div>Oh right.<br><div><br></div>&gt; So you w=
ant bit 0 to be reserved (not used) in enable/support mask<br>&gt; and then=
 to have all the VIRTIO_NET_HASH_TYPE_XXX to be<br>&gt; exactly 1 &lt;&lt; =
VIRTIO_NET_HASH_REPORT_XXX? Just say...<br>&gt; <br><div><br></div>We can d=
o that too but it's up to you really.<br><div><br></div>So fixing the below=
 you would say<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bit 0 cu=
rresponding to value 1,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 bit 1 corresponding to value 2 etc.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; No bit corresponds to value 0<br>?<br></blockquote><div><div>=
Currently defined:<br></div><div><br></div><div>Reports:</div>VIRTIO_NET_HA=
SH_REPORT_NONE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; 0<br>VIRTIO_NET_HASH_REPORT_IPv4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>VIRTIO_NET_HASH_REPORT_UDPv4&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3<br></div><div>VIRTIO_NET=
_HASH_REPORT_UDPv6_EX&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9<br><br></=
div><div>Bitmask (VIRTIO_NET_HASH_TYPE_XXX =3D 1 &lt;&lt; (VIRTIO_NET_HASH_=
REPORT_XXX - 1)):</div><div>VIRTIO_NET_HASH_TYPE_IPv4 =3D (1 &lt;&lt; 0)<br=
></div><div>VIRTIO_NET_HASH_TYPE_UDPv4 =3D (1 &lt;&lt; 2)</div><div>VIRTIO_=
NET_HASH_TYPE_UDP_EX =3D (1 &lt;&lt; 8)</div><div><br></div><div><br></div>=
<div>How you want it to be changed?<br></div><div>Can you please write here=
 in the same format?<br></div><div><br></div><div><br></div><blockquote sty=
le=3D"border-left:2px solid #1010FF;margin-left:5px;padding-left:5px;color:=
#000;font-weight:normal;font-style:normal;text-decoration:none;font-family:=
Helvetica,Arial,sans-serif;font-size:12pt;" data-mce-style=3D"border-left: =
2px solid #1010FF; margin-left: 5px; padding-left: 5px; color: #000; font-w=
eight: normal; font-style: normal; text-decoration: none; font-family: Helv=
etica,Arial,sans-serif; font-size: 12pt;">&gt; <br>&gt; &nbsp; &nbsp; and j=
ust say that bit numbers are from this table, with bit<br>&gt; &nbsp; &nbsp=
; 0 corresponding to the value 0, bit 1 to value 1 etc.<br>&gt; <br>&gt; <b=
r>&gt; &nbsp; &nbsp; maybe that would have been easier on the eyes - I didn=
't try,<br>&gt; &nbsp; &nbsp; I'm not even sure.<br>&gt; <br>&gt; &nbsp; &n=
bsp; But what you have is correct enough, we can always try to<br>&gt; &nbs=
p; &nbsp; improve the wording later.<br>&gt; <br>&gt; <br>&gt; &nbsp; &nbsp=
; &gt;<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; =
&gt; +<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\begin{lstlisting}<br=
>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_REPORT=
_NONE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_REPORT_IPv4 &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;1<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +#de=
fine VIRTIO_NET_HASH_REPORT_TCPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_REPORT_U=
DPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3<br>&gt; &nbsp; &nbsp; &gt; &nbsp;=
 &nbsp; &gt; +#define VIRTIO_NET_HASH_REPORT_IPv6 &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;4<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +#define VI=
RTIO_NET_HASH_REPORT_TCPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 5<br>&gt; &nb=
sp; &nbsp; &gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_REPORT_UDPv6 &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; 6<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp;=
 &gt; +#define VIRTIO_NET_HASH_REPORT_IPv6_EX &nbsp; &nbsp; &nbsp; &nbsp; 7=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +#define VIRTIO_NET_HASH_REP=
ORT_TCPv6_EX &nbsp; &nbsp; &nbsp; &nbsp;8<br>&gt; &nbsp; &nbsp; &gt; &nbsp;=
 &nbsp; &gt; +#define VIRTIO_NET_HASH_REPORT_UDPv6_EX &nbsp; &nbsp; &nbsp; =
&nbsp;9<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\end{lstlisting}<br>=
&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &nb=
sp; &nbsp; &gt; &nbsp;\subsubsection{Control Virtqueue}\label{sec:Device Ty=
pes / Network<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Device / Device Oper=
ation / Control Virtqueue}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &n=
bsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;The driver uses th=
e control virtqueue (if VIRTIO_NET_F_CTRL_VQ is<br>&gt; &nbsp; &nbsp; &gt; =
&nbsp; &nbsp; &gt; @@ -3896,6 +4064,7 @@ \subsubsection{Control Virtqueue}\=
label<br>&gt; &nbsp; &nbsp; {sec:Device<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &=
nbsp; Types / Network Device / Devi<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp=
; &gt; &nbsp;#define VIRTIO_NET_CTRL_MQ &nbsp; &nbsp;4<br>&gt; &nbsp; &nbsp=
; &gt; &nbsp; &nbsp; &gt; &nbsp; #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET &n=
bsp; &nbsp; &nbsp; &nbsp;0 (for automatic<br>&gt; &nbsp; &nbsp; receive<br>=
&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; steering)<br>&gt; &nbsp; &nbsp; &gt; =
&nbsp; &nbsp; &gt; &nbsp; #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;1 (for<br>&gt; &nbsp; &nbsp; configurable<br>&gt; &n=
bsp; &nbsp; &gt; &nbsp; &nbsp; receive steering)<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; &nbsp; &gt; + #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG &nbsp; &nbsp; =
&nbsp; &nbsp; 2 (for<br>&gt; &nbsp; &nbsp; configurable hash<br>&gt; &nbsp;=
 &nbsp; &gt; &nbsp; &nbsp; calculation)<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &=
nbsp; &gt; &nbsp;\end{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; =
&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;If more tha=
n one multiqueue mode is negotiated, the resulting<br>&gt; &nbsp; &nbsp; de=
vice<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; configuration is defined by t=
he last command sent by the driver.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp=
; &gt; @@ -3961,10 +4130,37 @@ \subsubsection{Control Virtqueue}\label<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; {sec:Device Types / Network Device / D=
evi<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;according to the na=
tive endian of the guest rather than<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbs=
p; &gt; &nbsp;(necessarily when not using the legacy interface) little-endi=
an.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nb=
sp; &gt; &nbsp; &nbsp; &gt; +\subparagraph{Hash calculation}\label{sec:Devi=
ce Types / Network<br>&gt; &nbsp; &nbsp; Device<br>&gt; &nbsp; &nbsp; &gt; =
&nbsp; &nbsp; / Device Operation / Control Virtqueue / Automatic receive st=
eering<br>&gt; &nbsp; &nbsp; in<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; mu=
ltiqueue mode / Hash calculation}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; =
&gt; +If VIRTIO_NET_F_HASH_REPORT was negotiated and the device uses<br>&gt=
; &nbsp; &nbsp; automatic<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; receive =
steering,<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +the device MUST su=
pport a command to configure hash calculation<br>&gt; &nbsp; &nbsp; &gt; &n=
bsp; &nbsp; parameters.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>=
&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +The driver provides parameters =
for hash calculation as follows:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &=
gt; +<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\field{class} VIRTIO_N=
ET_CTRL_MQ, \field{command}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; VIRTIO=
_NET_CTRL_MQ_HASH_CONFIG.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +<b=
r>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +The \field{command-specific-d=
ata} has following format:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\=
begin{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +struct vir=
tio_net_hash_config {<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; + &nbsp=
; &nbsp;le32 hash_types;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; + &n=
bsp; &nbsp;le16 reserved[4];<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; =
+ &nbsp; &nbsp;u8 hash_key_length;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp;=
 &gt; + &nbsp; &nbsp;u8 hash_key_data[hash_key_length];<br>&gt; &nbsp; &nbs=
p; &gt; &nbsp; &nbsp; &gt; +};<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt=
; +\end{lstlisting}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +Field \f=
ield{hash_types} contains a bitmask of allowed hash types<br>&gt; &nbsp; &n=
bsp; as<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +defined in<br>&gt; &=
nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\ref{sec:Device Types / Network Devic=
e / Device Operation /<br>&gt; &nbsp; &nbsp; Processing<br>&gt; &nbsp; &nbs=
p; &gt; &nbsp; &nbsp; of Incoming Packets / Hash calculation for incoming p=
ackets /<br>&gt; &nbsp; &nbsp; Supported/<br>&gt; &nbsp; &nbsp; &gt; &nbsp;=
 &nbsp; enabled hash types}.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; =
+Initially the device has all hash types disabled and reports only<br>&gt; =
&nbsp; &nbsp; &gt; &nbsp; &nbsp; VIRTIO_NET_HASH_REPORT_NONE.<br>&gt; &nbsp=
; &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp;=
 &gt; +Field \field{reserved} MUST contain zeroes. It is defined to make<br=
>&gt; &nbsp; &nbsp; the<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; structure =
to match the layout of virtio_net_rss_config structure,<br>&gt; &nbsp; &nbs=
p; &gt; &nbsp; &nbsp; &gt; +defined in \ref{sec:Device Types / Network Devi=
ce / Device<br>&gt; &nbsp; &nbsp; Operation /<br>&gt; &nbsp; &nbsp; &gt; &n=
bsp; &nbsp; Control Virtqueue / Receive-side scaling (RSS)}.<br>&gt; &nbsp;=
 &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; =
&gt; +Fields \field{hash_key_length} and \field{hash_key_data} define<br>&g=
t; &nbsp; &nbsp; the key<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; to be use=
d in hash calculation.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;\paragraph{Receive-side sca=
ling (RSS)}\label{sec:Device Types /<br>&gt; &nbsp; &nbsp; Network<br>&gt; =
&nbsp; &nbsp; &gt; &nbsp; &nbsp; Device / Device Operation / Control Virtqu=
eue / Receive-side scaling<br>&gt; &nbsp; &nbsp; (RSS)}<br>&gt; &nbsp; &nbs=
p; &gt; &nbsp; &nbsp; &gt; &nbsp;A device offers the feature VIRTIO_NET_F_R=
SS if it supports RSS<br>&gt; &nbsp; &nbsp; receive<br>&gt; &nbsp; &nbsp; &=
gt; &nbsp; &nbsp; steering with Toeplitz hash calculation and configurable =
parameters.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &n=
bsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -A driver queries RSS capabilities of t=
he device by reading device<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; config=
uration as defined in \ref{sec:Device Types / Network Device /<br>&gt; &nbs=
p; &nbsp; Device<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; configuration lay=
out / RSS}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +A driver queries =
RSS capabilities of the device by reading device<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; &nbsp; configuration as defined in \ref{sec:Device Types / Network =
Device /<br>&gt; &nbsp; &nbsp; Device<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nb=
sp; configuration layout}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nb=
sp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;\subparagraph{Setti=
ng RSS parameters}\label{sec:Device Types /<br>&gt; &nbsp; &nbsp; Network<b=
r>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Device / Device Operation / Control=
 Virtqueue / Receive-side scaling<br>&gt; &nbsp; &nbsp; (RSS)<br>&gt; &nbsp=
; &nbsp; &gt; &nbsp; &nbsp; / Setting RSS parameters}<br>&gt; &nbsp; &nbsp;=
 &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &g=
t; @@ -3981,7 +4177,8 @@ \subsubsection{Control Virtqueue}\label<br>&gt; &n=
bsp; &nbsp; {sec:Device<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Types / Ne=
twork Device / Devi<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;};<=
br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;\end{lstlisting}<br>&gt=
; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;Field \field{hash_types} cont=
ains a bitmask of allowed hash types<br>&gt; &nbsp; &nbsp; as<br>&gt; &nbsp=
; &nbsp; &gt; &nbsp; &nbsp; &gt; -defined in \ref{sec:Device Types / Networ=
k Device / Device<br>&gt; &nbsp; &nbsp; Operation /<br>&gt; &nbsp; &nbsp; &=
gt; &nbsp; &nbsp; Control Virtqueue / Receive-side scaling (RSS) / RSS hash=
 types}.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +defined in<br>&gt; =
&nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\ref{sec:Device Types / Network Devi=
ce / Device Operation /<br>&gt; &nbsp; &nbsp; Processing<br>&gt; &nbsp; &nb=
sp; &gt; &nbsp; &nbsp; of Incoming Packets / Hash calculation for incoming =
packets /<br>&gt; &nbsp; &nbsp; Supported/<br>&gt; &nbsp; &nbsp; &gt; &nbsp=
; &nbsp; enabled hash types}.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt;=
 &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;Field \field{in=
direction_table_mask} is a mask to be applied to<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; &nbsp; &gt; &nbsp;the calculated hash to produce an index in the<br=
>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; @@ -3995,93 +4192,7 @@ \subsubs=
ection{Control Virtqueue}\label<br>&gt; &nbsp; &nbsp; {sec:Device<br>&gt; &=
nbsp; &nbsp; &gt; &nbsp; &nbsp; Types / Network Device / Devi<br>&gt; &nbsp=
; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &=
nbsp; &gt; &nbsp;A driver sets \field{max_tx_vq} to inform a device how man=
y<br>&gt; &nbsp; &nbsp; transmit<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; v=
irtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).<br>&gt=
; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &=
nbsp; &nbsp; &gt; -\subparagraph{RSS hash types}\label{sec:Device Types / N=
etwork<br>&gt; &nbsp; &nbsp; Device /<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nb=
sp; Device Operation / Control Virtqueue / Receive-side scaling (RSS) /<br>=
&gt; &nbsp; &nbsp; RSS<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; hash types}=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; &nbsp; &gt; -The device calculates the hash on IPv4 packets accordi=
ng to the<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -field \field{hash_=
types} of the virtio_net_rss_config structure as<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; &nbsp; follows:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\beg=
in{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item If VIRTIO_=
NET_RSS_HASH_TYPE_TCPv4 is set and the packet has<br>&gt; &nbsp; &nbsp; &gt=
; &nbsp; &nbsp; &gt; -a TCP header, the hash is calculated over the followi=
ng fields:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\begin{itemize}<b=
r>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Source IP address<br>&g=
t; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Destination IP address<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Source TCP port<br>&gt; &n=
bsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Destination TCP port<br>&gt; &nb=
sp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\end{itemize}<br>&gt; &nbsp; &nbsp; &gt=
; &nbsp; &nbsp; &gt; -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set a=
nd the<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -packet has a UDP head=
er, the hash is calculated over the following<br>&gt; &nbsp; &nbsp; &gt; &n=
bsp; &nbsp; fields:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\begin{i=
temize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Source IP addr=
ess<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Destination IP add=
ress<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Source UDP port<b=
r>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Destination UDP port<br=
>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\end{itemize}<br>&gt; &nbsp; &=
nbsp; &gt; &nbsp; &nbsp; &gt; -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv4 =
is set, the hash is<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -calculat=
ed over the following fields:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt;=
 -\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Sour=
ce IP address<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Destinat=
ion IP address<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\end{itemize}=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Else the device does =
not calculate the hash<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\end{=
itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -<br>&gt; &nbsp; &nb=
sp; &gt; &nbsp; &nbsp; &gt; -\label{itm:Device Types / Network Device / Dev=
ice Operation /<br>&gt; &nbsp; &nbsp; Control<br>&gt; &nbsp; &nbsp; &gt; &n=
bsp; &nbsp; Virtqueue / Receive-side scaling (RSS) / RSS hash types/hash on=
 IPv6<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; packets without extension he=
aders}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -The device calculates=
 the hash on IPv6 packets without extension<br>&gt; &nbsp; &nbsp; &gt; &nbs=
p; &nbsp; &gt; -headers according to the field \field{hash_types} of the<br=
>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; virtio_net_rss_config structure as f=
ollows:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\begin{itemize}<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item If VIRTIO_NET_RSS_HASH_TYP=
E_TCPv6 is set and the packet has<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; =
&gt; -a TCPv6 header, the hash is calculated over the following fields:<br>=
&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\begin{itemize}<br>&gt; &nbsp; =
&nbsp; &gt; &nbsp; &nbsp; &gt; -\item Source IPv6 address<br>&gt; &nbsp; &n=
bsp; &gt; &nbsp; &nbsp; &gt; -\item Destination IPv6 address<br>&gt; &nbsp;=
 &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Source TCP port<br>&gt; &nbsp; &nbsp=
; &gt; &nbsp; &nbsp; &gt; -\item Destination TCP port<br>&gt; &nbsp; &nbsp;=
 &gt; &nbsp; &nbsp; &gt; -\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &=
nbsp; &gt; -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is set and the<br>=
&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -packet has a UDPv6 header, the =
hash is calculated over the<br>&gt; &nbsp; &nbsp; following<br>&gt; &nbsp; =
&nbsp; &gt; &nbsp; &nbsp; fields:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; =
&gt; -\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item =
Source IPv6 address<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item De=
stination IPv6 address<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item=
 Source UDP port<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Desti=
nation UDP port<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\end{itemize=
}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Else if VIRTIO_NET_R=
SS_HASH_TYPE_IPv6 is set, the hash is<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nb=
sp; &gt; -calculated over the following fields:<br>&gt; &nbsp; &nbsp; &gt; =
&nbsp; &nbsp; &gt; -\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp=
; &gt; -\item Source IPv6 address<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; =
&gt; -\item Destination IPv6 address<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbs=
p; &gt; -\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item=
 Else the device does not calculate the hash<br>&gt; &nbsp; &nbsp; &gt; &nb=
sp; &nbsp; &gt; -\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt=
; -<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -The device calculates th=
e hash on IPv6 packets with extension<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nb=
sp; &gt; -headers according to the field \field{hash_types} of the<br>&gt; =
&nbsp; &nbsp; &gt; &nbsp; &nbsp; virtio_net_rss_config structure as follows=
:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\begin{itemize}<br>&gt; &n=
bsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item If VIRTIO_NET_RSS_HASH_TYPE_TCP_=
EX is set and the packet<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -has=
 a TCPv6 header, the hash is calculated over the following<br>&gt; &nbsp; &=
nbsp; fields:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\begin{itemize=
}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Home address from th=
e home address option in the IPv6<br>&gt; &nbsp; &nbsp; destination<br>&gt;=
 &nbsp; &nbsp; &gt; &nbsp; &nbsp; options header. If the extension header i=
s not present, use the<br>&gt; &nbsp; &nbsp; Source IPv6<br>&gt; &nbsp; &nb=
sp; &gt; &nbsp; &nbsp; address.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &g=
t; -\item IPv6 address that is contained in the Routing-Header-Type-2<br>&g=
t; &nbsp; &nbsp; from<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; the associat=
ed extension header. If the extension header is not<br>&gt; &nbsp; &nbsp; p=
resent,<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; use the Destination IPv6 a=
ddress.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Source TCP por=
t<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Destination TCP port=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\end{itemize}<br>&gt; &nbsp=
; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UD=
P_EX is set and the<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -packet h=
as a UDPv6 header, the hash is calculated over the<br>&gt; &nbsp; &nbsp; fo=
llowing<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; fields:<br>&gt; &nbsp; &nb=
sp; &gt; &nbsp; &nbsp; &gt; -\begin{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nb=
sp; &nbsp; &gt; -\item Home address from the home address option in the IPv=
6<br>&gt; &nbsp; &nbsp; destination<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp=
; options header. If the extension header is not present, use the<br>&gt; &=
nbsp; &nbsp; Source IPv6<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; address.<=
br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item IPv6 address that is c=
ontained in the Routing-Header-Type-2<br>&gt; &nbsp; &nbsp; from<br>&gt; &n=
bsp; &nbsp; &gt; &nbsp; &nbsp; the associated extension header. If the exte=
nsion header is not<br>&gt; &nbsp; &nbsp; present,<br>&gt; &nbsp; &nbsp; &g=
t; &nbsp; &nbsp; use the Destination IPv6 address.<br>&gt; &nbsp; &nbsp; &g=
t; &nbsp; &nbsp; &gt; -\item Source UDP port<br>&gt; &nbsp; &nbsp; &gt; &nb=
sp; &nbsp; &gt; -\item Destination UDP port<br>&gt; &nbsp; &nbsp; &gt; &nbs=
p; &nbsp; &gt; -\end{itemize}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt;=
 -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is<br>&gt; =
&nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -calculated over the following fields=
:<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\begin{itemize}<br>&gt; &n=
bsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item Home address from the home addre=
ss option in the IPv6<br>&gt; &nbsp; &nbsp; destination<br>&gt; &nbsp; &nbs=
p; &gt; &nbsp; &nbsp; options header. If the extension header is not presen=
t, use the<br>&gt; &nbsp; &nbsp; Source IPv6<br>&gt; &nbsp; &nbsp; &gt; &nb=
sp; &nbsp; address.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\item IP=
v6 address that is contained in the Routing-Header-Type-2<br>&gt; &nbsp; &n=
bsp; from<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; the associated extension=
 header. If the extension header is not<br>&gt; &nbsp; &nbsp; present,<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; use the Destination IPv6 address.<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\end{itemize}<br>&gt; &nbsp; &nb=
sp; &gt; &nbsp; &nbsp; &gt; -\item Else skip IPv6 extension headers and cal=
culate the hash as<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -defined f=
or an IPv6 packet without extension headers (see \ref<br>&gt; &nbsp; &nbsp;=
 &gt; &nbsp; &nbsp; {itm:Device Types / Network Device / Device Operation /=
 Control<br>&gt; &nbsp; &nbsp; Virtqueue /<br>&gt; &nbsp; &nbsp; &gt; &nbsp=
; &nbsp; Receive-side scaling (RSS) / RSS hash types/hash on IPv6 packets<b=
r>&gt; &nbsp; &nbsp; without<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; exten=
sion headers}).<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; -\end{itemize=
}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +Fields \field{hash_key_len=
gth} and \field{hash_key_data} define<br>&gt; &nbsp; &nbsp; the key<br>&gt;=
 &nbsp; &nbsp; &gt; &nbsp; &nbsp; to be used in hash calculation.<br>&gt; &=
nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbs=
p; &nbsp; &gt; &nbsp;\drivernormative{\subparagraph}{Setting RSS parameters=
}{Device<br>&gt; &nbsp; &nbsp; Types /<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &n=
bsp; Network Device / Device Operation / Control Virtqueue / Receive-side<b=
r>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; scaling (RSS) }<br>&gt; &nbsp; &nbs=
p; &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; =
&gt; @@ -4093,12 +4204,12 @@ \subsubsection{Control Virtqueue}\label<br>&gt=
; &nbsp; &nbsp; &gt; &nbsp; &nbsp; {sec:Device Types / Network Device / Dev=
i<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp=
; &gt; &nbsp; &nbsp; &gt; &nbsp;A driver MUST use \field{indirection_table_=
mask} values that are<br>&gt; &nbsp; &nbsp; less<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; &nbsp; than \field{rss_max_indirection_table_length} reported by a =
device.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp;=
 &nbsp; &gt; &nbsp; &nbsp; &gt; -A driver MUST NOT set any VIRTIO_NET_RSS_H=
ASH_TYPE_ flags that are<br>&gt; &nbsp; &nbsp; not<br>&gt; &nbsp; &nbsp; &g=
t; &nbsp; &nbsp; supported by a device.<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &=
nbsp; &gt; +A driver MUST NOT set any VIRTIO_NET_HASH_TYPE_ flags that are =
not<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; supported by a device.<br>&gt;=
 &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;<br>&gt; &nbsp; &nbsp; &gt; &n=
bsp; &nbsp; &gt; &nbsp;\devicenormative{\subparagraph}{RSS processing}{Devi=
ce Types /<br>&gt; &nbsp; &nbsp; Network<br>&gt; &nbsp; &nbsp; &gt; &nbsp; =
&nbsp; Device / Device Operation / Control Virtqueue / Receive-side scaling=
<br>&gt; &nbsp; &nbsp; (RSS)<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; / RSS=
 processing}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;The device=
 MUST determine the destination queue for a network<br>&gt; &nbsp; &nbsp; p=
acket as<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; follows:<br>&gt; &nbsp; &=
nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;\begin{itemize}<br>&gt; &nbsp; &nbsp; &=
gt; &nbsp; &nbsp; &gt; -\item Calculate the hash of the packet as defined i=
n \ref<br>&gt; &nbsp; &nbsp; {sec:Device<br>&gt; &nbsp; &nbsp; &gt; &nbsp; =
&nbsp; Types / Network Device / Device Operation / Control Virtqueue /<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Receive-side scaling (RSS) / RSS hash =
types}<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; +\item Calculate the h=
ash of the packet as defined in \ref<br>&gt; &nbsp; &nbsp; {sec:Device<br>&=
gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Types / Network Device / Device Operat=
ion / Processing of Incoming<br>&gt; &nbsp; &nbsp; Packets<br>&gt; &nbsp; &=
nbsp; &gt; &nbsp; &nbsp; / Hash calculation for incoming packets}.<br>&gt; =
&nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; &nbsp;\item If the device did not cal=
culate the hash for the specific<br>&gt; &nbsp; &nbsp; packet,<br>&gt; &nbs=
p; &nbsp; &gt; &nbsp; &nbsp; the device directs the packet to the receiveq =
specified by \field<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; {unclassified_=
queue} of virtio_net_rss_config structure (value of 0<br>&gt; &nbsp; &nbsp;=
 &gt; &nbsp; &nbsp; corresponds to receiveq1).<br>&gt; &nbsp; &nbsp; &gt; &=
nbsp; &nbsp; &gt; &nbsp;\item Apply \field{indirection_table_mask} to the c=
alculated hash<br>&gt; &nbsp; &nbsp; and<br>&gt; &nbsp; &nbsp; &gt; &nbsp; =
&nbsp; use the result as the index in the indirection table to get 0-based<=
br>&gt; &nbsp; &nbsp; number<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; of de=
stination receiveq (value of 0 corresponds to receiveq1).<br>&gt; &nbsp; &n=
bsp; &gt; &nbsp; &nbsp; &gt; &nbsp;\end{itemize}<br>&gt; &nbsp; &nbsp; &gt;=
 &nbsp; &nbsp; &gt; --<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; &gt; 2.17.1=
<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp=
; &gt; &nbsp; &nbsp; This publicly archived list offers a means to provide =
input to the<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; OASIS Virtual I/O Dev=
ice (VIRTIO) TC.<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; &gt; &nbs=
p; &nbsp; In order to verify user consent to the Feedback License terms and=
<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; to minimize spam in the list arch=
ive, subscription is required<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; befo=
re posting.<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &n=
bsp; Subscribe: virtio-comment-subscribe@lists.oasis-open.org<br>&gt; &nbsp=
; &nbsp; &gt; &nbsp; &nbsp; Unsubscribe: virtio-comment-unsubscribe@lists.o=
asis-open.org<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; List help: virtio-co=
mment-help@lists.oasis-open.org<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Li=
st archive: https://lists.oasis-open.org/archives/virtio-comment/<br>&gt; &=
nbsp; &nbsp; &gt; &nbsp; &nbsp; Feedback License: https://www.oasis-open.or=
g/who/ipr/<br>&gt; &nbsp; &nbsp; feedback_license.pdf<br>&gt; &nbsp; &nbsp;=
 &gt; &nbsp; &nbsp; List Guidelines: https://www.oasis-open.org/policies-gu=
idelines/<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; mailing-lists<br>&gt; &n=
bsp; &nbsp; &gt; &nbsp; &nbsp; Committee: https://www.oasis-open.org/commit=
tees/virtio/<br>&gt; &nbsp; &nbsp; &gt; &nbsp; &nbsp; Join OASIS: https://w=
ww.oasis-open.org/join/<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; &nbsp; &nbsp; &g=
t;<br>&gt; &nbsp; &nbsp; &gt;<br>&gt; <br>&gt; <br>&gt; <br><div><br></div>=
<br><div><br></div>This publicly archived list offers a means to provide in=
put to the <br>OASIS Virtual I/O Device (VIRTIO) TC. <br><div><br></div>In =
order to verify user consent to the Feedback License terms and <br>to minim=
ize spam in the list archive, subscription is required <br>before posting. =
<br><div><br></div>Subscribe: virtio-comment-subscribe@lists.oasis-open.org=
 <br>Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org <br>List =
help: virtio-comment-help@lists.oasis-open.org <br>List archive: https://li=
sts.oasis-open.org/archives/virtio-comment/ <br>Feedback License: https://w=
ww.oasis-open.org/who/ipr/feedback_license.pdf <br>List Guidelines: https:/=
/www.oasis-open.org/policies-guidelines/mailing-lists <br>Committee: https:=
//www.oasis-open.org/committees/virtio/ <br>Join OASIS: https://www.oasis-o=
pen.org/join/<br><div><br></div></blockquote><div><br></div></div></body></=
html>
------=_Part_7345660_715052899.1582175341195--

