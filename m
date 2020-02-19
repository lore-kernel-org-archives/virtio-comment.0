Return-Path: virtio-comment-return-1066-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3CE3F985EAA
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Feb 2020 11:07:27 +0000 (UTC)
Date: Wed, 19 Feb 2020 06:07:13 -0500 (EST)
From: Yuri Benditovich <ybendito@redhat.com>
Message-ID: <1841911156.7222325.1582110433680.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200219040122-mutt-send-email-mst@kernel.org>
References: <20200219075337.23191-1-yuri.benditovich@daynix.com> <20200219075337.23191-2-yuri.benditovich@daynix.com> <20200219040122-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define
 per-packet hash reporting feature
Content-Type: multipart/alternative; 
	boundary="----=_Part_7222324_139510119.1582110433679"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

------=_Part_7222324_139510119.1582110433679
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

----- Original Message -----

> From: "Michael S. Tsirkin" <mst@redhat.com>
> To: "Yuri Benditovich" <yuri.benditovich@daynix.com>
> Cc: virtio-comment@lists.oasis-open.org
> Sent: Wednesday, February 19, 2020 11:12:40 AM
> Subject: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define per-packe=
t
> hash reporting feature

> On Wed, Feb 19, 2020 at 09:53:37AM +0200, Yuri Benditovich wrote:
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/66
> > Define respective feature bit for virtio-net.
> > Extend packet layout to populate hash value and type.
> > Move the definition of IP/TCP/UDP header fields to
> > calculate the hash out of RSS section to common network
> > device section.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > ---
> > content.tex | 347 ++++++++++++++++++++++++++++++++++------------------
> > 1 file changed, 229 insertions(+), 118 deletions(-)
> >
> > diff --git a/content.tex b/content.tex
> > index b91a132..d7d4e42 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2895,6 +2895,9 @@ \subsection{Feature bits}\label{sec:Device Types =
/
> > Network Device / Feature bits
> > \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
> > channel.
> >
> > +\item[VIRTIO_NET_F_HASH_REPORT(57)] Device can report per-packet hash
> > + value and a type of calculated hash.
> > +
> > \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact
> > \field{hdr_len}
> > value. Device benefits from knowing the exact header length.
> >
> > @@ -2995,35 +2998,17 @@ \subsection{Device configuration
> > layout}\label{sec:Device Types / Network Device
> > le32 supported_hash_types;
> > };
> > \end{lstlisting}
> > -\label{sec:Device Types / Network Device / Device configuration layout=
 /
> > RSS}
> > -Three following fields, \field{rss_max_key_size},
> > \field{rss_max_indirection_table_length}
> > -and \field{supported_hash_types} only exist if VIRTIO_NET_F_RSS is set=
.
> > +The following field, \field{rss_max_key_size} only exist if
> > VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT is set.
> > +It specifies the maximal supported length of RSS key in bytes.
> >
> > -Field \field{rss_max_key_size} specifies the maximal supported length =
of
> > RSS key in bytes.
> > +The following field, \field{rss_max_indirection_table_length} only exi=
st
> > if VIRTIO_NET_F_RSS is set.
> > +It specifies the maximal number of 16-bit entries in RSS indirection
> > table.
> >
> > -Field \field{rss_max_indirection_table_length} specifies the maximal
> > number of 16-bit entries in RSS indirection table.
> > +The next field, \field{supported_hash_types} exists only if the device
> > supports hash calculation,
> > +i.e. if VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT is set.
> >
> > -Field \field{supported_hash_types} contains the bitmask of supported R=
SS
> > hash types.
> > -
> > -Hash types applicable for IPv4 packets:
> > -\begin{lstlisting}
> > -#define VIRTIO_NET_RSS_HASH_TYPE_IPv4 (1 << 0)
> > -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4 (1 << 1)
> > -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4 (1 << 2)
> > -\end{lstlisting}
> > -Hash types applicable for IPv6 packets without extension headers
> > -\begin{lstlisting}
> > -#define VIRTIO_NET_RSS_HASH_TYPE_IPv6 (1 << 3)
> > -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6 (1 << 4)
> > -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6 (1 << 5)
> > -\end{lstlisting}
> > -Hash types applicable for IPv6 packets with extension headers
> > -\begin{lstlisting}
> > -#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX (1 << 6)
> > -#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX (1 << 7)
> > -#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX (1 << 8)
> > -\end{lstlisting}
> > -For the exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see
> > \ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Receive-side scaling (RSS) / RSS hash types}.
> > +Field \field{supported_hash_types} contains the bitmask of supported h=
ash
> > types.
> > +See \ref{sec:Device Types / Network Device / Device Operation / Proces=
sing
> > of Incoming Packets / Hash calculation for incoming packets /
> > Supported/enabled hash types} for details of supported hash types.
> >
> > \devicenormative{\subsubsection}{Device configuration layout}{Device Ty=
pes
> > / Network Device / Device configuration layout}
> >
> > @@ -3048,7 +3033,7 @@ \subsection{Device configuration
> > layout}\label{sec:Device Types / Network Device
> > negotiated.
> >
> > The device MUST set \field{rss_max_key_size} to at least 40, if it offe=
rs
> > -VIRTIO_NET_F_RSS.
> > +VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> >
> > The device MUST set \field{rss_max_indirection_table_length} to at leas=
t
> > 128, if it offers
> > VIRTIO_NET_F_RSS.
> > @@ -3195,6 +3180,8 @@ \subsection{Device Operation}\label{sec:Device Ty=
pes
> > / Network Device / Device O
> > le16 csum_start;
> > le16 csum_offset;
> > le16 num_buffers;
> > + le32 hash_value; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
> > + le16 hash_type; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
> > };

> Just noticed this - it's a bit problematic as it might force
> compilers to add 2 bytes of padding at the end. Let's add extra 2 bytes
> of padding explicitly?
OK, no problem=20

> > \end{lstlisting}
> >
> > @@ -3517,6 +3504,12 @@ \subsubsection{Processing of Incoming
> > Packets}\label{sec:Device Types / Network
> >
> > \end{enumerate}
> >
> > +If applicable, the device calculates per-packet hash for incoming pack=
ets
> > as
> > +defined in \ref{sec:Device Types / Network Device / Device Operation /
> > Processing of Incoming Packets / Hash calculation for incoming packets}=
.
> > +
> > +If applicable, the device reports hash information for incoming packet=
s as
> > +defined in \ref{sec:Device Types / Network Device / Device Operation /
> > Processing of Incoming Packets / Hash reporting for incoming packets}.
> > +
> > \devicenormative{\paragraph}{Processing of Incoming Packets}{Device Typ=
es /
> > Network Device / Device Operation / Processing of Incoming Packets}
> > \label{devicenormative:Device Types / Network Device / Device Operation=
 /
> > Processing of Packets}%old label for latexdiff
> >
> > @@ -3619,6 +3612,181 @@ \subsubsection{Processing of Incoming
> > Packets}\label{sec:Device Types / Network
> > If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
> > VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
> > rely on the packet checksum being correct.
> > +
> > +\paragraph{Hash calculation for incoming packets}
> > +\label{sec:Device Types / Network Device / Device Operation / Processi=
ng
> > of Incoming Packets / Hash calculation for incoming packets}
> > +
> > +A device attempts to calculate a per-packet hash in the following case=
s:
> > +\begin{itemize}
> > +\item The feature VIRTIO_NET_F_RSS was negotiated. The device uses the
> > hash to determine the receive virtqueue to place incoming packets.
> > +\item The feature VIRTIO_NET_F_HASH_REPORT was negotiated. The device
> > reports the hash value and the hash type with the packet.
> > +\end{itemize}
> > +
> > +If the feature VIRTIO_NET_F_RSS was negotiated:
> > +\begin{itemize}
> > +\item The device uses \field{hash_types} of the virtio_net_rss_config
> > structure as 'Enabled hash types' bitmask.
> > +\item The device uses a key as defined in \field{hash_key_data} and
> > \field{hash_key_length} of the virtio_net_rss_config structure (see
> > +\ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Receive-side scaling (RSS) / Setting RSS parameters}).
> > +\end{itemize}
> > +
> > +If the feature VIRTIO_NET_F_RSS was not negotiated:
> > +\begin{itemize}
> > +\item The device uses \field{hash_types} of the virtio_net_hash_config
> > structure as 'Enabled hash types' bitmask.
> > +\item The device uses a key as defined in \field{hash_key_data} and
> > \field{hash_key_length} of the virtio_net_hash_config structure (see
> > +\ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Automatic receive steering in multiqueue mode / Hash
> > calculation}).
> > +\end{itemize}
> > +
> > +Note that if the device offers VIRTIO_NET_F_HASH_REPORT, even if it
> > supports only one pair of virtqueues, it MUST support
> > +at least one of commands of VIRTIO_NET_CTRL_MQ class to configure repo=
rted
> > hash parameters:
> > +\begin{itemize}
> > +\item If the device offers VIRTIO_NET_F_RSS, it MUST support
> > VIRTIO_NET_CTRL_MQ_RSS_CONFIG command per
> > + \ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Receive-side scaling (RSS) / Setting RSS parameters}.
> > +\item Otherwise the device MUST support VIRTIO_NET_CTRL_MQ_HASH_CONFIG
> > command per
> > + \ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Automatic receive steering in multiqueue mode / Hash
> > calculation}.
> > +\end{itemize}
> > +
> > +\subparagraph{Supported/enabled hash types}
> > +\label{sec:Device Types / Network Device / Device Operation / Processi=
ng
> > of Incoming Packets / Hash calculation for incoming packets /
> > Supported/enabled hash types}
> > +Hash types applicable for IPv4 packets:
> > +\begin{lstlisting}
> > +#define VIRTIO_NET_HASH_TYPE_IPv4 (1 << 0)
> > +#define VIRTIO_NET_HASH_TYPE_TCPv4 (1 << 1)
> > +#define VIRTIO_NET_HASH_TYPE_UDPv4 (1 << 2)
> > +\end{lstlisting}
> > +Hash types applicable for IPv6 packets without extension headers
> > +\begin{lstlisting}
> > +#define VIRTIO_NET_HASH_TYPE_IPv6 (1 << 3)
> > +#define VIRTIO_NET_HASH_TYPE_TCPv6 (1 << 4)
> > +#define VIRTIO_NET_HASH_TYPE_UDPv6 (1 << 5)
> > +\end{lstlisting}
> > +Hash types applicable for IPv6 packets with extension headers
> > +\begin{lstlisting}
> > +#define VIRTIO_NET_HASH_TYPE_IP_EX (1 << 6)
> > +#define VIRTIO_NET_HASH_TYPE_TCP_EX (1 << 7)
> > +#define VIRTIO_NET_HASH_TYPE_UDP_EX (1 << 8)
> > +\end{lstlisting}
> > +
> > +\subparagraph{IPv4 packets}
> > +\label{sec:Device Types / Network Device / Device Operation / Processi=
ng
> > of Incoming Packets / Hash calculation for incoming packets / IPv4
> > packets}
> > +The device calculates the hash on IPv4 packets according to 'Enabled h=
ash
> > types' bitmask as follows:
> > +\begin{itemize}
> > +\item If VIRTIO_NET_HASH_TYPE_TCPv4 is set and the packet has
> > +a TCP header, the hash is calculated over the following fields:
> > +\begin{itemize}
> > +\item Source IP address
> > +\item Destination IP address
> > +\item Source TCP port
> > +\item Destination TCP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_HASH_TYPE_UDPv4 is set and the
> > +packet has a UDP header, the hash is calculated over the following fie=
lds:
> > +\begin{itemize}
> > +\item Source IP address
> > +\item Destination IP address
> > +\item Source UDP port
> > +\item Destination UDP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_HASH_TYPE_IPv4 is set, the hash is
> > +calculated over the following fields:
> > +\begin{itemize}
> > +\item Source IP address
> > +\item Destination IP address
> > +\end{itemize}
> > +\item Else the device does not calculate the hash
> > +\end{itemize}
> > +
> > +\subparagraph{IPv6 packets without extension header}
> > +\label{sec:Device Types / Network Device / Device Operation / Processi=
ng
> > of Incoming Packets / Hash calculation for incoming packets / IPv6 pack=
ets
> > without extension header}
> > +The device calculates the hash on IPv6 packets without extension
> > +headers according to 'Enabled hash types' bitmask as follows:
> > +\begin{itemize}
> > +\item If VIRTIO_NET_HASH_TYPE_TCPv6 is set and the packet has
> > +a TCPv6 header, the hash is calculated over the following fields:
> > +\begin{itemize}
> > +\item Source IPv6 address
> > +\item Destination IPv6 address
> > +\item Source TCP port
> > +\item Destination TCP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_HASH_TYPE_UDPv6 is set and the
> > +packet has a UDPv6 header, the hash is calculated over the following
> > fields:
> > +\begin{itemize}
> > +\item Source IPv6 address
> > +\item Destination IPv6 address
> > +\item Source UDP port
> > +\item Destination UDP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_HASH_TYPE_IPv6 is set, the hash is
> > +calculated over the following fields:
> > +\begin{itemize}
> > +\item Source IPv6 address
> > +\item Destination IPv6 address
> > +\end{itemize}
> > +\item Else the device does not calculate the hash
> > +\end{itemize}
> > +
> > +\subparagraph{IPv6 packets with extension header}
> > +\label{sec:Device Types / Network Device / Device Operation / Processi=
ng
> > of Incoming Packets / Hash calculation for incoming packets / IPv6 pack=
ets
> > with extension header}
> > +The device calculates the hash on IPv6 packets with extension
> > +headers according to 'Enabled hash types' bitmask as follows:
> > +\begin{itemize}
> > +\item If VIRTIO_NET_HASH_TYPE_TCP_EX is set and the packet
> > +has a TCPv6 header, the hash is calculated over the following fields:
> > +\begin{itemize}
> > +\item Home address from the home address option in the IPv6 destinatio=
n
> > options header. If the extension header is not present, use the Source
> > IPv6 address.
> > +\item IPv6 address that is contained in the Routing-Header-Type-2 from=
 the
> > associated extension header. If the extension header is not present, us=
e
> > the Destination IPv6 address.
> > +\item Source TCP port
> > +\item Destination TCP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_HASH_TYPE_UDP_EX is set and the
> > +packet has a UDPv6 header, the hash is calculated over the following
> > fields:
> > +\begin{itemize}
> > +\item Home address from the home address option in the IPv6 destinatio=
n
> > options header. If the extension header is not present, use the Source
> > IPv6 address.
> > +\item IPv6 address that is contained in the Routing-Header-Type-2 from=
 the
> > associated extension header. If the extension header is not present, us=
e
> > the Destination IPv6 address.
> > +\item Source UDP port
> > +\item Destination UDP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_HASH_TYPE_IP_EX is set, the hash is
> > +calculated over the following fields:
> > +\begin{itemize}
> > +\item Home address from the home address option in the IPv6 destinatio=
n
> > options header. If the extension header is not present, use the Source
> > IPv6 address.
> > +\item IPv6 address that is contained in the Routing-Header-Type-2 from=
 the
> > associated extension header. If the extension header is not present, us=
e
> > the Destination IPv6 address.
> > +\end{itemize}
> > +\item Else skip IPv6 extension headers and calculate the hash as
> > +defined for an IPv6 packet without extension headers
> > +(see \ref{sec:Device Types / Network Device / Device Operation /
> > Processing of Incoming Packets / Hash calculation for incoming packets =
/
> > IPv6 packets without extension header}).
> > +\end{itemize}
> > +
> > +\paragraph{Hash reporting for incoming packets}
> > +\label{sec:Device Types / Network Device / Device Operation / Processi=
ng
> > of Incoming Packets / Hash reporting for incoming packets}
> > +
> > +If VIRTIO_NET_F_HASH_REPORT was negotiated and
> > + the device has calculated the hash for the packet, the device fills
> > \field{hash_type} with the type of calculated hash
> > +and \field{hash_value} with the value of calculated hash.
> > +
> > +If VIRTIO_NET_F_HASH_REPORT was negotiated but due to any reason the
> > +hash was not calculated, the device sets \field{hash_type} to
> > VIRTIO_NET_HASH_REPORT_NONE.
> > +
> > +Possible values that the device can report in \field{hash_type} are
> > defined below.
> > +They correspond to supported hash types defined in
> > +\ref{sec:Device Types / Network Device / Device Operation / Processing=
 of
> > Incoming Packets / Hash calculation for incoming packets /
> > Supported/enabled hash types}
> > +as follows:
> > +
> > +VIRTIO_NET_HASH_TYPE_XXX =3D 1 << (VIRTIO_NET_HASH_REPORT_XXX - 1)

> So hash_type is the HASH_REPORT value then? That's quite confusing.
> Let's rename to hash_report?

No problem to rename anything, but I'd like to do it one time.=20
Currently meaningful hash report values are (1..9), 0 for none=20
They correspond to bitmask of 9 bits for enabled/supported.=20
It was possible to use the same definitions for enable/support/report=20
but then reported kind of hash should be 4 bytes.=20
As you anyway suggests padding at the end of the packet, we can do that,=20
i.e. add (32 bit hash + 32 bit type)=20

Or if we stay with the values as they are now:=20
values 0..9 - VIRTIO_NET_WHAT?=20
bits from 0 to 8 - VIRTIO_NET_WHAT?=20

> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_NET_HASH_REPORT_NONE 0
> > +#define VIRTIO_NET_HASH_REPORT_IPv4 1
> > +#define VIRTIO_NET_HASH_REPORT_TCPv4 2
> > +#define VIRTIO_NET_HASH_REPORT_UDPv4 3
> > +#define VIRTIO_NET_HASH_REPORT_IPv6 4
> > +#define VIRTIO_NET_HASH_REPORT_TCPv6 5
> > +#define VIRTIO_NET_HASH_REPORT_UDPv6 6
> > +#define VIRTIO_NET_HASH_REPORT_IPv6_EX 7
> > +#define VIRTIO_NET_HASH_REPORT_TCPv6_EX 8
> > +#define VIRTIO_NET_HASH_REPORT_UDPv6_EX 9
> > +\end{lstlisting}
> > +
> > \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Devi=
ce /
> > Device Operation / Control Virtqueue}
> >
> > The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
> > @@ -3896,6 +4064,7 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
e
> > Types / Network Device / Devi
> > #define VIRTIO_NET_CTRL_MQ 4
> > #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET 0 (for automatic receive steeri=
ng)
> > #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG 1 (for configurable receive steer=
ing)
> > + #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG 2 (for configurable hash
> > calculation)
> > \end{lstlisting}
> >
> > If more than one multiqueue mode is negotiated, the resulting device
> > configuration is defined by the last command sent by the driver.
> > @@ -3961,10 +4130,37 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice
> > Types / Network Device / Devi
> > according to the native endian of the guest rather than
> > (necessarily when not using the legacy interface) little-endian.
> >
> > +\subparagraph{Hash calculation}\label{sec:Device Types / Network Devic=
e /
> > Device Operation / Control Virtqueue / Automatic receive steering in
> > multiqueue mode / Hash calculation}
> > +If VIRTIO_NET_F_HASH_REPORT was negotiated and the device uses automat=
ic
> > receive steering,
> > +the device MUST support a command to configure hash calculation
> > parameters.
> > +
> > +The driver provides parameters for hash calculation as follows:
> > +
> > +\field{class} VIRTIO_NET_CTRL_MQ, \field{command}
> > VIRTIO_NET_CTRL_MQ_HASH_CONFIG.
> > +
> > +The \field{command-specific-data} has following format:
> > +\begin{lstlisting}
> > +struct virtio_net_hash_config {
> > + le32 hash_types;
> > + le16 reserved[4];
> > + u8 hash_key_length;
> > + u8 hash_key_data[hash_key_length];
> > +};
> > +\end{lstlisting}
> > +Field \field{hash_types} contains a bitmask of allowed hash types as
> > +defined in
> > +\ref{sec:Device Types / Network Device / Device Operation / Processing=
 of
> > Incoming Packets / Hash calculation for incoming packets /
> > Supported/enabled hash types}.
> > +Initially the device has all hash types disabled and reports only
> > VIRTIO_NET_HASH_REPORT_NONE.
> > +
> > +Field \field{reserved} MUST contain zeroes. It is defined to make the
> > structure to match the layout of virtio_net_rss_config structure,
> > +defined in \ref{sec:Device Types / Network Device / Device Operation /
> > Control Virtqueue / Receive-side scaling (RSS)}.
> > +
> > +Fields \field{hash_key_length} and \field{hash_key_data} define the ke=
y to
> > be used in hash calculation.
> > +
> > \paragraph{Receive-side scaling (RSS)}\label{sec:Device Types / Network
> > Device / Device Operation / Control Virtqueue / Receive-side scaling
> > (RSS)}
> > A device offers the feature VIRTIO_NET_F_RSS if it supports RSS receive
> > steering with Toeplitz hash calculation and configurable parameters.
> >
> > -A driver queries RSS capabilities of the device by reading device
> > configuration as defined in \ref{sec:Device Types / Network Device /
> > Device configuration layout / RSS}
> > +A driver queries RSS capabilities of the device by reading device
> > configuration as defined in \ref{sec:Device Types / Network Device /
> > Device configuration layout}
> >
> > \subparagraph{Setting RSS parameters}\label{sec:Device Types / Network
> > Device / Device Operation / Control Virtqueue / Receive-side scaling (R=
SS)
> > / Setting RSS parameters}
> >
> > @@ -3981,7 +4177,8 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
e
> > Types / Network Device / Devi
> > };
> > \end{lstlisting}
> > Field \field{hash_types} contains a bitmask of allowed hash types as
> > -defined in \ref{sec:Device Types / Network Device / Device Operation /
> > Control Virtqueue / Receive-side scaling (RSS) / RSS hash types}.
> > +defined in
> > +\ref{sec:Device Types / Network Device / Device Operation / Processing=
 of
> > Incoming Packets / Hash calculation for incoming packets /
> > Supported/enabled hash types}.
> >
> > Field \field{indirection_table_mask} is a mask to be applied to
> > the calculated hash to produce an index in the
> > @@ -3995,93 +4192,7 @@ \subsubsection{Control Virtqueue}\label{sec:Devi=
ce
> > Types / Network Device / Devi
> >
> > A driver sets \field{max_tx_vq} to inform a device how many transmit
> > virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
> >
> > -\subparagraph{RSS hash types}\label{sec:Device Types / Network Device =
/
> > Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS
> > hash types}
> > -
> > -The device calculates the hash on IPv4 packets according to the
> > -field \field{hash_types} of the virtio_net_rss_config structure as
> > follows:
> > -\begin{itemize}
> > -\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv4 is set and the packet has
> > -a TCP header, the hash is calculated over the following fields:
> > -\begin{itemize}
> > -\item Source IP address
> > -\item Destination IP address
> > -\item Source TCP port
> > -\item Destination TCP port
> > -\end{itemize}
> > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set and the
> > -packet has a UDP header, the hash is calculated over the following fie=
lds:
> > -\begin{itemize}
> > -\item Source IP address
> > -\item Destination IP address
> > -\item Source UDP port
> > -\item Destination UDP port
> > -\end{itemize}
> > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv4 is set, the hash is
> > -calculated over the following fields:
> > -\begin{itemize}
> > -\item Source IP address
> > -\item Destination IP address
> > -\end{itemize}
> > -\item Else the device does not calculate the hash
> > -\end{itemize}
> > -
> > -\label{itm:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Receive-side scaling (RSS) / RSS hash types/hash on IPv6
> > packets without extension headers}
> > -The device calculates the hash on IPv6 packets without extension
> > -headers according to the field \field{hash_types} of the
> > virtio_net_rss_config structure as follows:
> > -\begin{itemize}
> > -\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set and the packet has
> > -a TCPv6 header, the hash is calculated over the following fields:
> > -\begin{itemize}
> > -\item Source IPv6 address
> > -\item Destination IPv6 address
> > -\item Source TCP port
> > -\item Destination TCP port
> > -\end{itemize}
> > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is set and the
> > -packet has a UDPv6 header, the hash is calculated over the following
> > fields:
> > -\begin{itemize}
> > -\item Source IPv6 address
> > -\item Destination IPv6 address
> > -\item Source UDP port
> > -\item Destination UDP port
> > -\end{itemize}
> > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv6 is set, the hash is
> > -calculated over the following fields:
> > -\begin{itemize}
> > -\item Source IPv6 address
> > -\item Destination IPv6 address
> > -\end{itemize}
> > -\item Else the device does not calculate the hash
> > -\end{itemize}
> > -
> > -The device calculates the hash on IPv6 packets with extension
> > -headers according to the field \field{hash_types} of the
> > virtio_net_rss_config structure as follows:
> > -\begin{itemize}
> > -\item If VIRTIO_NET_RSS_HASH_TYPE_TCP_EX is set and the packet
> > -has a TCPv6 header, the hash is calculated over the following fields:
> > -\begin{itemize}
> > -\item Home address from the home address option in the IPv6 destinatio=
n
> > options header. If the extension header is not present, use the Source
> > IPv6 address.
> > -\item IPv6 address that is contained in the Routing-Header-Type-2 from=
 the
> > associated extension header. If the extension header is not present, us=
e
> > the Destination IPv6 address.
> > -\item Source TCP port
> > -\item Destination TCP port
> > -\end{itemize}
> > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the
> > -packet has a UDPv6 header, the hash is calculated over the following
> > fields:
> > -\begin{itemize}
> > -\item Home address from the home address option in the IPv6 destinatio=
n
> > options header. If the extension header is not present, use the Source
> > IPv6 address.
> > -\item IPv6 address that is contained in the Routing-Header-Type-2 from=
 the
> > associated extension header. If the extension header is not present, us=
e
> > the Destination IPv6 address.
> > -\item Source UDP port
> > -\item Destination UDP port
> > -\end{itemize}
> > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is
> > -calculated over the following fields:
> > -\begin{itemize}
> > -\item Home address from the home address option in the IPv6 destinatio=
n
> > options header. If the extension header is not present, use the Source
> > IPv6 address.
> > -\item IPv6 address that is contained in the Routing-Header-Type-2 from=
 the
> > associated extension header. If the extension header is not present, us=
e
> > the Destination IPv6 address.
> > -\end{itemize}
> > -\item Else skip IPv6 extension headers and calculate the hash as
> > -defined for an IPv6 packet without extension headers (see \ref{itm:Dev=
ice
> > Types / Network Device / Device Operation / Control Virtqueue /
> > Receive-side scaling (RSS) / RSS hash types/hash on IPv6 packets withou=
t
> > extension headers}).
> > -\end{itemize}
> > +Fields \field{hash_key_length} and \field{hash_key_data} define the ke=
y to
> > be used in hash calculation.
> >
> > \drivernormative{\subparagraph}{Setting RSS parameters}{Device Types /
> > Network Device / Device Operation / Control Virtqueue / Receive-side
> > scaling (RSS) }
> >
> > @@ -4093,12 +4204,12 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice
> > Types / Network Device / Devi
> >
> > A driver MUST use \field{indirection_table_mask} values that are less t=
han
> > \field{rss_max_indirection_table_length} reported by a device.
> >
> > -A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are not
> > supported by a device.
> > +A driver MUST NOT set any VIRTIO_NET_HASH_TYPE_ flags that are not
> > supported by a device.
> >
> > \devicenormative{\subparagraph}{RSS processing}{Device Types / Network
> > Device / Device Operation / Control Virtqueue / Receive-side scaling (R=
SS)
> > / RSS processing}
> > The device MUST determine the destination queue for a network packet as
> > follows:
> > \begin{itemize}
> > -\item Calculate the hash of the packet as defined in \ref{sec:Device T=
ypes
> > / Network Device / Device Operation / Control Virtqueue / Receive-side
> > scaling (RSS) / RSS hash types}
> > +\item Calculate the hash of the packet as defined in \ref{sec:Device T=
ypes
> > / Network Device / Device Operation / Processing of Incoming Packets /
> > Hash calculation for incoming packets}.
> > \item If the device did not calculate the hash for the specific packet,=
 the
> > device directs the packet to the receiveq specified by
> > \field{unclassified_queue} of virtio_net_rss_config structure (value of=
 0
> > corresponds to receiveq1).
> > \item Apply \field{indirection_table_mask} to the calculated hash and u=
se
> > the result as the index in the indirection table to get 0-based number =
of
> > destination receiveq (value of 0 corresponds to receiveq1).
> > \end{itemize}
> > --
> > 2.17.1

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

------=_Part_7222324_139510119.1582110433679
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
i Benditovich" &lt;yuri.benditovich@daynix.com&gt;<br><b>Cc: </b>virtio-com=
ment@lists.oasis-open.org<br><b>Sent: </b>Wednesday, February 19, 2020 11:1=
2:40 AM<br><b>Subject: </b>[virtio-comment] Re: [PATCH v4 1/1] virtio-net: =
Define per-packet hash reporting feature<br><div><br></div>On Wed, Feb 19, =
2020 at 09:53:37AM +0200, Yuri Benditovich wrote:<br>&gt; Fixes: https://gi=
thub.com/oasis-tcs/virtio-spec/issues/66<br>&gt; Define respective feature =
bit for virtio-net.<br>&gt; Extend packet layout to populate hash value and=
 type.<br>&gt; Move the definition of IP/TCP/UDP header fields to<br>&gt; c=
alculate the hash out of RSS section to common network<br>&gt; device secti=
on.<br>&gt; <br>&gt; Signed-off-by: Yuri Benditovich &lt;yuri.benditovich@d=
aynix.com&gt;<br>&gt; ---<br>&gt; &nbsp;content.tex | 347 +++++++++++++++++=
+++++++++++++++++------------------<br>&gt; &nbsp;1 file changed, 229 inser=
tions(+), 118 deletions(-)<br>&gt; <br>&gt; diff --git a/content.tex b/cont=
ent.tex<br>&gt; index b91a132..d7d4e42 100644<br>&gt; --- a/content.tex<br>=
&gt; +++ b/content.tex<br>&gt; @@ -2895,6 +2895,9 @@ \subsection{Feature bi=
ts}\label{sec:Device Types / Network Device / Feature bits<br>&gt; &nbsp;\i=
tem[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control<br>&gt;=
 &nbsp; &nbsp; &nbsp;channel.<br>&gt; &nbsp;<br>&gt; +\item[VIRTIO_NET_F_HA=
SH_REPORT(57)] Device can report per-packet hash<br>&gt; + &nbsp; &nbsp;val=
ue and a type of calculated hash.<br>&gt; +<br>&gt; &nbsp;\item[VIRTIO_NET_=
F_GUEST_HDRLEN(59)] Driver can provide the exact \field{hdr_len}<br>&gt; &n=
bsp; &nbsp; &nbsp;value. Device benefits from knowing the exact header leng=
th.<br>&gt; &nbsp;<br>&gt; @@ -2995,35 +2998,17 @@ \subsection{Device confi=
guration layout}\label{sec:Device Types / Network Device<br>&gt; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;le32 supported_hash_types;<br>&gt; &nbsp;};<br>&gt;=
 &nbsp;\end{lstlisting}<br>&gt; -\label{sec:Device Types / Network Device /=
 Device configuration layout / RSS}<br>&gt; -Three following fields, \field=
{rss_max_key_size}, \field{rss_max_indirection_table_length}<br>&gt; -and \=
field{supported_hash_types} only exist if VIRTIO_NET_F_RSS is set.<br>&gt; =
+The following field, \field{rss_max_key_size} only exist if VIRTIO_NET_F_R=
SS or VIRTIO_NET_F_HASH_REPORT is set.<br>&gt; +It specifies the maximal su=
pported length of RSS key in bytes.<br>&gt; &nbsp;<br>&gt; -Field \field{rs=
s_max_key_size} specifies the maximal supported length of RSS key in bytes.=
<br>&gt; +The following field, \field{rss_max_indirection_table_length} onl=
y exist if VIRTIO_NET_F_RSS is set.<br>&gt; +It specifies the maximal numbe=
r of 16-bit entries in RSS indirection table.<br>&gt; &nbsp;<br>&gt; -Field=
 \field{rss_max_indirection_table_length} specifies the maximal number of 1=
6-bit entries in RSS indirection table.<br>&gt; +The next field, \field{sup=
ported_hash_types} exists only if the device supports hash calculation,<br>=
&gt; +i.e. if VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT is set.<br>&gt; =
&nbsp;<br>&gt; -Field \field{supported_hash_types} contains the bitmask of =
supported RSS hash types.<br>&gt; -<br>&gt; -Hash types applicable for IPv4=
 packets:<br>&gt; -\begin{lstlisting}<br>&gt; -#define VIRTIO_NET_RSS_HASH_=
TYPE_IPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 0)<br=
>&gt; -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4 &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; (1 &lt;&lt; 1)<br>&gt; -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 2)<br>&gt; -\end{lst=
listing}<br>&gt; -Hash types applicable for IPv6 packets without extension =
headers<br>&gt; -\begin{lstlisting}<br>&gt; -#define VIRTIO_NET_RSS_HASH_TY=
PE_IPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 3)<br>&=
gt; -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; (1 &lt;&lt; 4)<br>&gt; -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6 &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 5)<br>&gt; -\end{lstli=
sting}<br>&gt; -Hash types applicable for IPv6 packets with extension heade=
rs<br>&gt; -\begin{lstlisting}<br>&gt; -#define VIRTIO_NET_RSS_HASH_TYPE_IP=
_EX &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 6)<br>&gt; -#defi=
ne VIRTIO_NET_RSS_HASH_TYPE_TCP_EX &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;(1 &lt;&lt; 7)<br>&gt; -#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 8)<br>&gt; -\end{lstlisting}<br>=
&gt; -For the exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref{sec=
:Device Types / Network Device / Device Operation / Control Virtqueue / Rec=
eive-side scaling (RSS) / RSS hash types}.<br>&gt; +Field \field{supported_=
hash_types} contains the bitmask of supported hash types.<br>&gt; +See \ref=
{sec:Device Types / Network Device / Device Operation / Processing of Incom=
ing Packets / Hash calculation for incoming packets / Supported/enabled has=
h types} for details of supported hash types.<br>&gt; &nbsp;<br>&gt; &nbsp;=
\devicenormative{\subsubsection}{Device configuration layout}{Device Types =
/ Network Device / Device configuration layout}<br>&gt; &nbsp;<br>&gt; @@ -=
3048,7 +3033,7 @@ \subsection{Device configuration layout}\label{sec:Device=
 Types / Network Device<br>&gt; &nbsp;negotiated.<br>&gt; &nbsp;<br>&gt; &n=
bsp;The device MUST set \field{rss_max_key_size} to at least 40, if it offe=
rs<br>&gt; -VIRTIO_NET_F_RSS.<br>&gt; +VIRTIO_NET_F_RSS or VIRTIO_NET_F_HAS=
H_REPORT.<br>&gt; &nbsp;<br>&gt; &nbsp;The device MUST set \field{rss_max_i=
ndirection_table_length} to at least 128, if it offers<br>&gt; &nbsp;VIRTIO=
_NET_F_RSS.<br>&gt; @@ -3195,6 +3180,8 @@ \subsection{Device Operation}\lab=
el{sec:Device Types / Network Device / Device O<br>&gt; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;le16 csum_start;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;l=
e16 csum_offset;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le16 num_buffers=
;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;le32 hash_value; (Only if VIRTIO_NET=
_F_HASH_REPORT negotiated)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;le16 hash_t=
ype; &nbsp;(Only if VIRTIO_NET_F_HASH_REPORT negotiated)<br>&gt; &nbsp;};<b=
r><div><br></div>Just noticed this - it's a bit problematic as it might for=
ce<br>compilers to add 2 bytes of padding at the end. Let's add extra 2 byt=
es<br>of padding explicitly?</blockquote><div>OK, no problem<br></div><div>=
<br></div><blockquote style=3D"border-left:2px solid #1010FF;margin-left:5p=
x;padding-left:5px;color:#000;font-weight:normal;font-style:normal;text-dec=
oration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" data-m=
ce-style=3D"border-left: 2px solid #1010FF; margin-left: 5px; padding-left:=
 5px; color: #000; font-weight: normal; font-style: normal; text-decoration=
: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><br><div=
><br></div>&gt; &nbsp;\end{lstlisting}<br>&gt; &nbsp;<br>&gt; @@ -3517,6 +3=
504,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device T=
ypes / Network<br>&gt; &nbsp;<br>&gt; &nbsp;\end{enumerate}<br>&gt; &nbsp;<=
br>&gt; +If applicable, the device calculates per-packet hash for incoming =
packets as<br>&gt; +defined in \ref{sec:Device Types / Network Device / Dev=
ice Operation / Processing of Incoming Packets / Hash calculation for incom=
ing packets}.<br>&gt; +<br>&gt; +If applicable, the device reports hash inf=
ormation for incoming packets as<br>&gt; +defined in \ref{sec:Device Types =
/ Network Device / Device Operation / Processing of Incoming Packets / Hash=
 reporting for incoming packets}.<br>&gt; +<br>&gt; &nbsp;\devicenormative{=
\paragraph}{Processing of Incoming Packets}{Device Types / Network Device /=
 Device Operation / Processing of Incoming Packets}<br>&gt; &nbsp;\label{de=
vicenormative:Device Types / Network Device / Device Operation / Processing=
 of Packets}%old label for latexdiff<br>&gt; &nbsp;<br>&gt; @@ -3619,6 +361=
2,181 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Ty=
pes / Network<br>&gt; &nbsp;If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor<br>&=
gt; &nbsp;VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT<br>&gt; &=
nbsp;rely on the packet checksum being correct.<br>&gt; +<br>&gt; +\paragra=
ph{Hash calculation for incoming packets}<br>&gt; +\label{sec:Device Types =
/ Network Device / Device Operation / Processing of Incoming Packets / Hash=
 calculation for incoming packets}<br>&gt; +<br>&gt; +A device attempts to =
calculate a per-packet hash in the following cases:<br>&gt; +\begin{itemize=
}<br>&gt; +\item The feature VIRTIO_NET_F_RSS was negotiated. The device us=
es the hash to determine the receive virtqueue to place incoming packets.<b=
r>&gt; +\item The feature VIRTIO_NET_F_HASH_REPORT was negotiated. The devi=
ce reports the hash value and the hash type with the packet.<br>&gt; +\end{=
itemize}<br>&gt; +<br>&gt; +If the feature VIRTIO_NET_F_RSS was negotiated:=
<br>&gt; +\begin{itemize}<br>&gt; +\item The device uses \field{hash_types}=
 of the virtio_net_rss_config structure as 'Enabled hash types' bitmask.<br=
>&gt; +\item The device uses a key as defined in \field{hash_key_data} and =
\field{hash_key_length} of the virtio_net_rss_config structure (see<br>&gt;=
 +\ref{sec:Device Types / Network Device / Device Operation / Control Virtq=
ueue / Receive-side scaling (RSS) / Setting RSS parameters}).<br>&gt; +\end=
{itemize}<br>&gt; +<br>&gt; +If the feature VIRTIO_NET_F_RSS was not negoti=
ated:<br>&gt; +\begin{itemize}<br>&gt; +\item The device uses \field{hash_t=
ypes} of the virtio_net_hash_config structure as 'Enabled hash types' bitma=
sk.<br>&gt; +\item The device uses a key as defined in \field{hash_key_data=
} and \field{hash_key_length} of the virtio_net_hash_config structure (see<=
br>&gt; +\ref{sec:Device Types / Network Device / Device Operation / Contro=
l Virtqueue / Automatic receive steering in multiqueue mode / Hash calculat=
ion}).<br>&gt; +\end{itemize}<br>&gt; +<br>&gt; +Note that if the device of=
fers VIRTIO_NET_F_HASH_REPORT, even if it supports only one pair of virtque=
ues, it MUST support<br>&gt; +at least one of commands of VIRTIO_NET_CTRL_M=
Q class to configure reported hash parameters:<br>&gt; +\begin{itemize}<br>=
&gt; +\item If the device offers VIRTIO_NET_F_RSS, it MUST support VIRTIO_N=
ET_CTRL_MQ_RSS_CONFIG command per<br>&gt; + \ref{sec:Device Types / Network=
 Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS)=
 / Setting RSS parameters}.<br>&gt; +\item Otherwise the device MUST suppor=
t VIRTIO_NET_CTRL_MQ_HASH_CONFIG command per<br>&gt; + \ref{sec:Device Type=
s / Network Device / Device Operation / Control Virtqueue / Automatic recei=
ve steering in multiqueue mode / Hash calculation}.<br>&gt; +\end{itemize}<=
br>&gt; +<br>&gt; +\subparagraph{Supported/enabled hash types}<br>&gt; +\la=
bel{sec:Device Types / Network Device / Device Operation / Processing of In=
coming Packets / Hash calculation for incoming packets / Supported/enabled =
hash types}<br>&gt; +Hash types applicable for IPv4 packets:<br>&gt; +\begi=
n{lstlisting}<br>&gt; +#define VIRTIO_NET_HASH_TYPE_IPv4 &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 0)<br>&gt; +#define VIRTIO_NET_HA=
SH_TYPE_TCPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 1)<br>&=
gt; +#define VIRTIO_NET_HASH_TYPE_UDPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; (1 &lt;&lt; 2)<br>&gt; +\end{lstlisting}<br>&gt; +Hash types applica=
ble for IPv6 packets without extension headers<br>&gt; +\begin{lstlisting}<=
br>&gt; +#define VIRTIO_NET_HASH_TYPE_IPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;(1 &lt;&lt; 3)<br>&gt; +#define VIRTIO_NET_HASH_TYPE_TCPv6 =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 4)<br>&gt; +#define V=
IRTIO_NET_HASH_TYPE_UDPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;=
&lt; 5)<br>&gt; +\end{lstlisting}<br>&gt; +Hash types applicable for IPv6 p=
ackets with extension headers<br>&gt; +\begin{lstlisting}<br>&gt; +#define =
VIRTIO_NET_HASH_TYPE_IP_EX &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt=
;&lt; 6)<br>&gt; +#define VIRTIO_NET_HASH_TYPE_TCP_EX &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;(1 &lt;&lt; 7)<br>&gt; +#define VIRTIO_NET_HASH_TYPE_UD=
P_EX &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 8)<br>&gt; +\end{=
lstlisting}<br>&gt; +<br>&gt; +\subparagraph{IPv4 packets}<br>&gt; +\label{=
sec:Device Types / Network Device / Device Operation / Processing of Incomi=
ng Packets / Hash calculation for incoming packets / IPv4 packets}<br>&gt; =
+The device calculates the hash on IPv4 packets according to 'Enabled hash =
types' bitmask as follows:<br>&gt; +\begin{itemize}<br>&gt; +\item If VIRTI=
O_NET_HASH_TYPE_TCPv4 is set and the packet has<br>&gt; +a TCP header, the =
hash is calculated over the following fields:<br>&gt; +\begin{itemize}<br>&=
gt; +\item Source IP address<br>&gt; +\item Destination IP address<br>&gt; =
+\item Source TCP port<br>&gt; +\item Destination TCP port<br>&gt; +\end{it=
emize}<br>&gt; +\item Else if VIRTIO_NET_HASH_TYPE_UDPv4 is set and the<br>=
&gt; +packet has a UDP header, the hash is calculated over the following fi=
elds:<br>&gt; +\begin{itemize}<br>&gt; +\item Source IP address<br>&gt; +\i=
tem Destination IP address<br>&gt; +\item Source UDP port<br>&gt; +\item De=
stination UDP port<br>&gt; +\end{itemize}<br>&gt; +\item Else if VIRTIO_NET=
_HASH_TYPE_IPv4 is set, the hash is<br>&gt; +calculated over the following =
fields:<br>&gt; +\begin{itemize}<br>&gt; +\item Source IP address<br>&gt; +=
\item Destination IP address<br>&gt; +\end{itemize}<br>&gt; +\item Else the=
 device does not calculate the hash<br>&gt; +\end{itemize}<br>&gt; +<br>&gt=
; +\subparagraph{IPv6 packets without extension header}<br>&gt; +\label{sec=
:Device Types / Network Device / Device Operation / Processing of Incoming =
Packets / Hash calculation for incoming packets / IPv6 packets without exte=
nsion header}<br>&gt; +The device calculates the hash on IPv6 packets witho=
ut extension<br>&gt; +headers according to 'Enabled hash types' bitmask as =
follows:<br>&gt; +\begin{itemize}<br>&gt; +\item If VIRTIO_NET_HASH_TYPE_TC=
Pv6 is set and the packet has<br>&gt; +a TCPv6 header, the hash is calculat=
ed over the following fields:<br>&gt; +\begin{itemize}<br>&gt; +\item Sourc=
e IPv6 address<br>&gt; +\item Destination IPv6 address<br>&gt; +\item Sourc=
e TCP port<br>&gt; +\item Destination TCP port<br>&gt; +\end{itemize}<br>&g=
t; +\item Else if VIRTIO_NET_HASH_TYPE_UDPv6 is set and the<br>&gt; +packet=
 has a UDPv6 header, the hash is calculated over the following fields:<br>&=
gt; +\begin{itemize}<br>&gt; +\item Source IPv6 address<br>&gt; +\item Dest=
ination IPv6 address<br>&gt; +\item Source UDP port<br>&gt; +\item Destinat=
ion UDP port<br>&gt; +\end{itemize}<br>&gt; +\item Else if VIRTIO_NET_HASH_=
TYPE_IPv6 is set, the hash is<br>&gt; +calculated over the following fields=
:<br>&gt; +\begin{itemize}<br>&gt; +\item Source IPv6 address<br>&gt; +\ite=
m Destination IPv6 address<br>&gt; +\end{itemize}<br>&gt; +\item Else the d=
evice does not calculate the hash<br>&gt; +\end{itemize}<br>&gt; +<br>&gt; =
+\subparagraph{IPv6 packets with extension header}<br>&gt; +\label{sec:Devi=
ce Types / Network Device / Device Operation / Processing of Incoming Packe=
ts / Hash calculation for incoming packets / IPv6 packets with extension he=
ader}<br>&gt; +The device calculates the hash on IPv6 packets with extensio=
n<br>&gt; +headers according to 'Enabled hash types' bitmask as follows:<br=
>&gt; +\begin{itemize}<br>&gt; +\item If VIRTIO_NET_HASH_TYPE_TCP_EX is set=
 and the packet<br>&gt; +has a TCPv6 header, the hash is calculated over th=
e following fields:<br>&gt; +\begin{itemize}<br>&gt; +\item Home address fr=
om the home address option in the IPv6 destination options header. If the e=
xtension header is not present, use the Source IPv6 address.<br>&gt; +\item=
 IPv6 address that is contained in the Routing-Header-Type-2 from the assoc=
iated extension header. If the extension header is not present, use the Des=
tination IPv6 address.<br>&gt; +\item Source TCP port<br>&gt; +\item Destin=
ation TCP port<br>&gt; +\end{itemize}<br>&gt; +\item Else if VIRTIO_NET_HAS=
H_TYPE_UDP_EX is set and the<br>&gt; +packet has a UDPv6 header, the hash i=
s calculated over the following fields:<br>&gt; +\begin{itemize}<br>&gt; +\=
item Home address from the home address option in the IPv6 destination opti=
ons header. If the extension header is not present, use the Source IPv6 add=
ress.<br>&gt; +\item IPv6 address that is contained in the Routing-Header-T=
ype-2 from the associated extension header. If the extension header is not =
present, use the Destination IPv6 address.<br>&gt; +\item Source UDP port<b=
r>&gt; +\item Destination UDP port<br>&gt; +\end{itemize}<br>&gt; +\item El=
se if VIRTIO_NET_HASH_TYPE_IP_EX is set, the hash is<br>&gt; +calculated ov=
er the following fields:<br>&gt; +\begin{itemize}<br>&gt; +\item Home addre=
ss from the home address option in the IPv6 destination options header. If =
the extension header is not present, use the Source IPv6 address.<br>&gt; +=
\item IPv6 address that is contained in the Routing-Header-Type-2 from the =
associated extension header. If the extension header is not present, use th=
e Destination IPv6 address.<br>&gt; +\end{itemize}<br>&gt; +\item Else skip=
 IPv6 extension headers and calculate the hash as<br>&gt; +defined for an I=
Pv6 packet without extension headers<br>&gt; +(see \ref{sec:Device Types / =
Network Device / Device Operation / Processing of Incoming Packets / Hash c=
alculation for incoming packets / IPv6 packets without extension header}).<=
br>&gt; +\end{itemize}<br>&gt; +<br>&gt; +\paragraph{Hash reporting for inc=
oming packets}<br>&gt; +\label{sec:Device Types / Network Device / Device O=
peration / Processing of Incoming Packets / Hash reporting for incoming pac=
kets}<br>&gt; +<br>&gt; +If VIRTIO_NET_F_HASH_REPORT was negotiated and<br>=
&gt; + the device has calculated the hash for the packet, the device fills =
\field{hash_type} with the type of calculated hash<br>&gt; +and \field{hash=
_value} with the value of calculated hash.<br>&gt; +<br>&gt; +If VIRTIO_NET=
_F_HASH_REPORT was negotiated but due to any reason the<br>&gt; +hash was n=
ot calculated, the device sets \field{hash_type} to VIRTIO_NET_HASH_REPORT_=
NONE.<br>&gt; +<br>&gt; +Possible values that the device can report in \fie=
ld{hash_type} are defined below.<br>&gt; +They correspond to supported hash=
 types defined in<br>&gt; +\ref{sec:Device Types / Network Device / Device =
Operation / Processing of Incoming Packets / Hash calculation for incoming =
packets / Supported/enabled hash types}<br>&gt; +as follows:<br>&gt; +<br>&=
gt; +VIRTIO_NET_HASH_TYPE_XXX =3D 1 &lt;&lt; (VIRTIO_NET_HASH_REPORT_XXX - =
1)<br><div><br></div><br>So hash_type is the HASH_REPORT value then? That's=
 quite confusing.<br>Let's rename to hash_report?<br></blockquote><div>No p=
roblem to rename anything, but I'd like to do it one time.<br></div><div>Cu=
rrently meaningful hash report values are (1..9), 0 for none<br></div><div>=
They correspond to bitmask of 9 bits for enabled/supported.<br></div><div>I=
t was possible to use the same definitions for enable/support/report<br></d=
iv><div>but then reported kind of hash should be 4 bytes.<br></div><div>As =
you anyway suggests padding at the end of the packet, we can do that,<br></=
div><div>i.e. add (32 bit hash + 32 bit type)<br></div><div><br></div><div>=
Or if we stay with the values as they are now:<br></div><div>values 0..9 - =
VIRTIO_NET_WHAT?<br></div><div>bits from 0 to 8 - VIRTIO_NET_WHAT?<br></div=
><div><br></div><blockquote style=3D"border-left:2px solid #1010FF;margin-l=
eft:5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;te=
xt-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" =
data-mce-style=3D"border-left: 2px solid #1010FF; margin-left: 5px; padding=
-left: 5px; color: #000; font-weight: normal; font-style: normal; text-deco=
ration: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><b=
r>&gt; +<br>&gt; +\begin{lstlisting}<br>&gt; +#define VIRTIO_NET_HASH_REPOR=
T_NONE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0<br>&gt; +#define VIRTIO_N=
ET_HASH_REPORT_IPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1<br>&gt; +#de=
fine VIRTIO_NET_HASH_REPORT_TCPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2<br>&=
gt; +#define VIRTIO_NET_HASH_REPORT_UDPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; 3<br>&gt; +#define VIRTIO_NET_HASH_REPORT_IPv6 &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;4<br>&gt; +#define VIRTIO_NET_HASH_REPORT_TCPv6 &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; 5<br>&gt; +#define VIRTIO_NET_HASH_REPORT_UDPv6 &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; 6<br>&gt; +#define VIRTIO_NET_HASH_REPORT_IP=
v6_EX &nbsp; &nbsp; &nbsp; &nbsp; 7<br>&gt; +#define VIRTIO_NET_HASH_REPORT=
_TCPv6_EX &nbsp; &nbsp; &nbsp; &nbsp;8<br>&gt; +#define VIRTIO_NET_HASH_REP=
ORT_UDPv6_EX &nbsp; &nbsp; &nbsp; &nbsp;9<br>&gt; +\end{lstlisting}<br>&gt;=
 +<br>&gt; &nbsp;\subsubsection{Control Virtqueue}\label{sec:Device Types /=
 Network Device / Device Operation / Control Virtqueue}<br>&gt; &nbsp;<br>&=
gt; &nbsp;The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is=
<br>&gt; @@ -3896,6 +4064,7 @@ \subsubsection{Control Virtqueue}\label{sec:=
Device Types / Network Device / Devi<br>&gt; &nbsp;#define VIRTIO_NET_CTRL_=
MQ &nbsp; &nbsp;4<br>&gt; &nbsp; #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET &n=
bsp; &nbsp; &nbsp; &nbsp;0 (for automatic receive steering)<br>&gt; &nbsp; =
#define VIRTIO_NET_CTRL_MQ_RSS_CONFIG &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1 (=
for configurable receive steering)<br>&gt; + #define VIRTIO_NET_CTRL_MQ_HAS=
H_CONFIG &nbsp; &nbsp; &nbsp; &nbsp; 2 (for configurable hash calculation)<=
br>&gt; &nbsp;\end{lstlisting}<br>&gt; &nbsp;<br>&gt; &nbsp;If more than on=
e multiqueue mode is negotiated, the resulting device configuration is defi=
ned by the last command sent by the driver.<br>&gt; @@ -3961,10 +4130,37 @@=
 \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device =
/ Devi<br>&gt; &nbsp;according to the native endian of the guest rather tha=
n<br>&gt; &nbsp;(necessarily when not using the legacy interface) little-en=
dian.<br>&gt; &nbsp;<br>&gt; +\subparagraph{Hash calculation}\label{sec:Dev=
ice Types / Network Device / Device Operation / Control Virtqueue / Automat=
ic receive steering in multiqueue mode / Hash calculation}<br>&gt; +If VIRT=
IO_NET_F_HASH_REPORT was negotiated and the device uses automatic receive s=
teering,<br>&gt; +the device MUST support a command to configure hash calcu=
lation parameters.<br>&gt; +<br>&gt; +The driver provides parameters for ha=
sh calculation as follows:<br>&gt; +<br>&gt; +\field{class} VIRTIO_NET_CTRL=
_MQ, \field{command} VIRTIO_NET_CTRL_MQ_HASH_CONFIG.<br>&gt; +<br>&gt; +The=
 \field{command-specific-data} has following format:<br>&gt; +\begin{lstlis=
ting}<br>&gt; +struct virtio_net_hash_config {<br>&gt; + &nbsp; &nbsp;le32 =
hash_types;<br>&gt; + &nbsp; &nbsp;le16 reserved[4];<br>&gt; + &nbsp; &nbsp=
;u8 hash_key_length;<br>&gt; + &nbsp; &nbsp;u8 hash_key_data[hash_key_lengt=
h];<br>&gt; +};<br>&gt; +\end{lstlisting}<br>&gt; +Field \field{hash_types}=
 contains a bitmask of allowed hash types as<br>&gt; +defined in<br>&gt; +\=
ref{sec:Device Types / Network Device / Device Operation / Processing of In=
coming Packets / Hash calculation for incoming packets / Supported/enabled =
hash types}.<br>&gt; +Initially the device has all hash types disabled and =
reports only VIRTIO_NET_HASH_REPORT_NONE.<br>&gt; +<br>&gt; +Field \field{r=
eserved} MUST contain zeroes. It is defined to make the structure to match =
the layout of virtio_net_rss_config structure,<br>&gt; +defined in \ref{sec=
:Device Types / Network Device / Device Operation / Control Virtqueue / Rec=
eive-side scaling (RSS)}.<br>&gt; +<br>&gt; +Fields \field{hash_key_length}=
 and \field{hash_key_data} define the key to be used in hash calculation.<b=
r>&gt; +<br>&gt; &nbsp;\paragraph{Receive-side scaling (RSS)}\label{sec:Dev=
ice Types / Network Device / Device Operation / Control Virtqueue / Receive=
-side scaling (RSS)}<br>&gt; &nbsp;A device offers the feature VIRTIO_NET_F=
_RSS if it supports RSS receive steering with Toeplitz hash calculation and=
 configurable parameters.<br>&gt; &nbsp;<br>&gt; -A driver queries RSS capa=
bilities of the device by reading device configuration as defined in \ref{s=
ec:Device Types / Network Device / Device configuration layout / RSS}<br>&g=
t; +A driver queries RSS capabilities of the device by reading device confi=
guration as defined in \ref{sec:Device Types / Network Device / Device conf=
iguration layout}<br>&gt; &nbsp;<br>&gt; &nbsp;\subparagraph{Setting RSS pa=
rameters}\label{sec:Device Types / Network Device / Device Operation / Cont=
rol Virtqueue / Receive-side scaling (RSS) / Setting RSS parameters}<br>&gt=
; &nbsp;<br>&gt; @@ -3981,7 +4177,8 @@ \subsubsection{Control Virtqueue}\la=
bel{sec:Device Types / Network Device / Devi<br>&gt; &nbsp;};<br>&gt; &nbsp=
;\end{lstlisting}<br>&gt; &nbsp;Field \field{hash_types} contains a bitmask=
 of allowed hash types as<br>&gt; -defined in \ref{sec:Device Types / Netwo=
rk Device / Device Operation / Control Virtqueue / Receive-side scaling (RS=
S) / RSS hash types}.<br>&gt; +defined in<br>&gt; +\ref{sec:Device Types / =
Network Device / Device Operation / Processing of Incoming Packets / Hash c=
alculation for incoming packets / Supported/enabled hash types}.<br>&gt; &n=
bsp;<br>&gt; &nbsp;Field \field{indirection_table_mask} is a mask to be app=
lied to<br>&gt; &nbsp;the calculated hash to produce an index in the<br>&gt=
; @@ -3995,93 +4192,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device=
 Types / Network Device / Devi<br>&gt; &nbsp;<br>&gt; &nbsp;A driver sets \=
field{max_tx_vq} to inform a device how many transmit virtqueues it may use=
 (transmitq1\ldots transmitq \field{max_tx_vq}).<br>&gt; &nbsp;<br>&gt; -\s=
ubparagraph{RSS hash types}\label{sec:Device Types / Network Device / Devic=
e Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS hash typ=
es}<br>&gt; -<br>&gt; -The device calculates the hash on IPv4 packets accor=
ding to the<br>&gt; -field \field{hash_types} of the virtio_net_rss_config =
structure as follows:<br>&gt; -\begin{itemize}<br>&gt; -\item If VIRTIO_NET=
_RSS_HASH_TYPE_TCPv4 is set and the packet has<br>&gt; -a TCP header, the h=
ash is calculated over the following fields:<br>&gt; -\begin{itemize}<br>&g=
t; -\item Source IP address<br>&gt; -\item Destination IP address<br>&gt; -=
\item Source TCP port<br>&gt; -\item Destination TCP port<br>&gt; -\end{ite=
mize}<br>&gt; -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set and the<=
br>&gt; -packet has a UDP header, the hash is calculated over the following=
 fields:<br>&gt; -\begin{itemize}<br>&gt; -\item Source IP address<br>&gt; =
-\item Destination IP address<br>&gt; -\item Source UDP port<br>&gt; -\item=
 Destination UDP port<br>&gt; -\end{itemize}<br>&gt; -\item Else if VIRTIO_=
NET_RSS_HASH_TYPE_IPv4 is set, the hash is<br>&gt; -calculated over the fol=
lowing fields:<br>&gt; -\begin{itemize}<br>&gt; -\item Source IP address<br=
>&gt; -\item Destination IP address<br>&gt; -\end{itemize}<br>&gt; -\item E=
lse the device does not calculate the hash<br>&gt; -\end{itemize}<br>&gt; -=
<br>&gt; -\label{itm:Device Types / Network Device / Device Operation / Con=
trol Virtqueue / Receive-side scaling (RSS) / RSS hash types/hash on IPv6 p=
ackets without extension headers}<br>&gt; -The device calculates the hash o=
n IPv6 packets without extension<br>&gt; -headers according to the field \f=
ield{hash_types} of the virtio_net_rss_config structure as follows:<br>&gt;=
 -\begin{itemize}<br>&gt; -\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set a=
nd the packet has<br>&gt; -a TCPv6 header, the hash is calculated over the =
following fields:<br>&gt; -\begin{itemize}<br>&gt; -\item Source IPv6 addre=
ss<br>&gt; -\item Destination IPv6 address<br>&gt; -\item Source TCP port<b=
r>&gt; -\item Destination TCP port<br>&gt; -\end{itemize}<br>&gt; -\item El=
se if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is set and the<br>&gt; -packet has a U=
DPv6 header, the hash is calculated over the following fields:<br>&gt; -\be=
gin{itemize}<br>&gt; -\item Source IPv6 address<br>&gt; -\item Destination =
IPv6 address<br>&gt; -\item Source UDP port<br>&gt; -\item Destination UDP =
port<br>&gt; -\end{itemize}<br>&gt; -\item Else if VIRTIO_NET_RSS_HASH_TYPE=
_IPv6 is set, the hash is<br>&gt; -calculated over the following fields:<br=
>&gt; -\begin{itemize}<br>&gt; -\item Source IPv6 address<br>&gt; -\item De=
stination IPv6 address<br>&gt; -\end{itemize}<br>&gt; -\item Else the devic=
e does not calculate the hash<br>&gt; -\end{itemize}<br>&gt; -<br>&gt; -The=
 device calculates the hash on IPv6 packets with extension<br>&gt; -headers=
 according to the field \field{hash_types} of the virtio_net_rss_config str=
ucture as follows:<br>&gt; -\begin{itemize}<br>&gt; -\item If VIRTIO_NET_RS=
S_HASH_TYPE_TCP_EX is set and the packet<br>&gt; -has a TCPv6 header, the h=
ash is calculated over the following fields:<br>&gt; -\begin{itemize}<br>&g=
t; -\item Home address from the home address option in the IPv6 destination=
 options header. If the extension header is not present, use the Source IPv=
6 address.<br>&gt; -\item IPv6 address that is contained in the Routing-Hea=
der-Type-2 from the associated extension header. If the extension header is=
 not present, use the Destination IPv6 address.<br>&gt; -\item Source TCP p=
ort<br>&gt; -\item Destination TCP port<br>&gt; -\end{itemize}<br>&gt; -\it=
em Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the<br>&gt; -packet h=
as a UDPv6 header, the hash is calculated over the following fields:<br>&gt=
; -\begin{itemize}<br>&gt; -\item Home address from the home address option=
 in the IPv6 destination options header. If the extension header is not pre=
sent, use the Source IPv6 address.<br>&gt; -\item IPv6 address that is cont=
ained in the Routing-Header-Type-2 from the associated extension header. If=
 the extension header is not present, use the Destination IPv6 address.<br>=
&gt; -\item Source UDP port<br>&gt; -\item Destination UDP port<br>&gt; -\e=
nd{itemize}<br>&gt; -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, t=
he hash is<br>&gt; -calculated over the following fields:<br>&gt; -\begin{i=
temize}<br>&gt; -\item Home address from the home address option in the IPv=
6 destination options header. If the extension header is not present, use t=
he Source IPv6 address.<br>&gt; -\item IPv6 address that is contained in th=
e Routing-Header-Type-2 from the associated extension header. If the extens=
ion header is not present, use the Destination IPv6 address.<br>&gt; -\end{=
itemize}<br>&gt; -\item Else skip IPv6 extension headers and calculate the =
hash as<br>&gt; -defined for an IPv6 packet without extension headers (see =
\ref{itm:Device Types / Network Device / Device Operation / Control Virtque=
ue / Receive-side scaling (RSS) / RSS hash types/hash on IPv6 packets witho=
ut extension headers}).<br>&gt; -\end{itemize}<br>&gt; +Fields \field{hash_=
key_length} and \field{hash_key_data} define the key to be used in hash cal=
culation.<br>&gt; &nbsp;<br>&gt; &nbsp;\drivernormative{\subparagraph}{Sett=
ing RSS parameters}{Device Types / Network Device / Device Operation / Cont=
rol Virtqueue / Receive-side scaling (RSS) }<br>&gt; &nbsp;<br>&gt; @@ -409=
3,12 +4204,12 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types /=
 Network Device / Devi<br>&gt; &nbsp;<br>&gt; &nbsp;A driver MUST use \fiel=
d{indirection_table_mask} values that are less than \field{rss_max_indirect=
ion_table_length} reported by a device.<br>&gt; &nbsp;<br>&gt; -A driver MU=
ST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are not supported by a =
device.<br>&gt; +A driver MUST NOT set any VIRTIO_NET_HASH_TYPE_ flags that=
 are not supported by a device.<br>&gt; &nbsp;<br>&gt; &nbsp;\devicenormati=
ve{\subparagraph}{RSS processing}{Device Types / Network Device / Device Op=
eration / Control Virtqueue / Receive-side scaling (RSS) / RSS processing}<=
br>&gt; &nbsp;The device MUST determine the destination queue for a network=
 packet as follows:<br>&gt; &nbsp;\begin{itemize}<br>&gt; -\item Calculate =
the hash of the packet as defined in \ref{sec:Device Types / Network Device=
 / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS =
hash types}<br>&gt; +\item Calculate the hash of the packet as defined in \=
ref{sec:Device Types / Network Device / Device Operation / Processing of In=
coming Packets / Hash calculation for incoming packets}.<br>&gt; &nbsp;\ite=
m If the device did not calculate the hash for the specific packet, the dev=
ice directs the packet to the receiveq specified by \field{unclassified_que=
ue} of virtio_net_rss_config structure (value of 0 corresponds to receiveq1=
).<br>&gt; &nbsp;\item Apply \field{indirection_table_mask} to the calculat=
ed hash and use the result as the index in the indirection table to get 0-b=
ased number of destination receiveq (value of 0 corresponds to receiveq1).<=
br>&gt; &nbsp;\end{itemize}<br>&gt; -- <br>&gt; 2.17.1<br><div><br></div><b=
r>This publicly archived list offers a means to provide input to the <br>OA=
SIS Virtual I/O Device (VIRTIO) TC. <br><br>In order to verify user consent=
 to the Feedback License terms and <br>to minimize spam in the list archive=
, subscription is required <br>before posting. <br><br>Subscribe: virtio-co=
mment-subscribe@lists.oasis-open.org <br>Unsubscribe: virtio-comment-unsubs=
cribe@lists.oasis-open.org <br>List help: virtio-comment-help@lists.oasis-o=
pen.org <br>List archive: https://lists.oasis-open.org/archives/virtio-comm=
ent/ <br>Feedback License: https://www.oasis-open.org/who/ipr/feedback_lice=
nse.pdf <br>List Guidelines: https://www.oasis-open.org/policies-guidelines=
/mailing-lists <br>Committee: https://www.oasis-open.org/committees/virtio/=
 <br>Join OASIS: https://www.oasis-open.org/join/<br><div><br></div></block=
quote><div><br></div></div></body></html>
------=_Part_7222324_139510119.1582110433679--

