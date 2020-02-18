Return-Path: virtio-comment-return-1061-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3097D985E4D
	for <virtio-comment@lists.oasis-open.org>; Tue, 18 Feb 2020 07:43:47 +0000 (UTC)
Date: Tue, 18 Feb 2020 02:43:38 -0500 (EST)
From: Yuri Benditovich <ybendito@redhat.com>
Message-ID: <1125409035.7054260.1582011818959.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200218004223-mutt-send-email-mst@kernel.org>
References: <20200205185905.4163-1-yuri.benditovich@daynix.com> <20200218004223-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v3] virtio-net: Define per-packet hash reporting feature
Content-Type: multipart/alternative; 
	boundary="----=_Part_7054259_1054323376.1582011818957"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

------=_Part_7054259_1054323376.1582011818957
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

----- Original Message -----

> From: "Michael S. Tsirkin" <mst@redhat.com>
> To: "Yuri Benditovich" <yuri.benditovich@daynix.com>
> Cc: virtio-comment@lists.oasis-open.org, ybendito@redhat.com
> Sent: Tuesday, February 18, 2020 7:59:13 AM
> Subject: Re: [PATCH v3] virtio-net: Define per-packet hash reporting feat=
ure

> On Wed, Feb 05, 2020 at 08:59:05PM +0200, Yuri Benditovich wrote:
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/66
> > Define respective feature bit for virtio-net.
> > Extend packet layout to populate hash value and type.
> > Move the definition of IP/TCP/UDP header fields to
> > calculate the hash out of RSS section to common network
> > device section.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>

> Looks good to me.
> Minor typos/tweaks.
> Otherwise

> Acked-by: Michael S. Tsirkin <mst@redhat.com>

> > ---
> > content.tex | 347 ++++++++++++++++++++++++++++++++++------------------
> > 1 file changed, 228 insertions(+), 119 deletions(-)
> >
> > diff --git a/content.tex b/content.tex
> > index fb10061..20d598d 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2895,6 +2895,9 @@ \subsection{Feature bits}\label{sec:Device Types =
/
> > Network Device / Feature bits
> > \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
> > channel.
> >
> > +\item[VIRTIO_NET_F_HASH_REPORT(58)] Device can report per-packet hash
> > + value and a type of calculated hash.
> > +
> > \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact
> > \field{hdr_len}
> > value. Device benefits from knowing the exact header length.
> >
> > @@ -2981,35 +2984,17 @@ \subsection{Device configuration
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
> > +i.e. if VIRTIO_NET_F_RSS of VIRTIO_NET_F_HASH_REPORT is set.

> of -> or?
Yes, will fix the typo=20

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
> > @@ -3034,7 +3019,7 @@ \subsection{Device configuration
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
> > @@ -3159,6 +3144,8 @@ \subsection{Device Operation}\label{sec:Device Ty=
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
> > @@ -3481,6 +3468,12 @@ \subsubsection{Processing of Incoming
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
> > @@ -3583,6 +3576,181 @@ \subsubsection{Processing of Incoming
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

> below mentions structures that were never mentioned earlier.
> We should say a couple of words here.
> E.g.
> the driver configures the hash calculation by sending
> either the virtio_net_rss_config structure as described in
> ... or the
> virtio_net_hash_config structure as described in ... to the device.

OK, will add that=20

> > +If the feature VIRTIO_NET_F_RSS was negotiated:
> > +\begin{itemize}
> > +\item The device uses \field{hash_types} of the virtio_net_rss_config
> > structure as the 'Enabled hash types' bitmask.
> > +\item The device uses \field{hash_key_data} of the virtio_net_rss_conf=
ig
> > structure.

> .. as ... ?

OK=20

> Also what about key length field?
> We should document all fields.

> Also I would maybe repeat this near where the structure itself is defined=
.
OK=20

> > +\end{itemize}
> > +See the definition of virtio_net_rss_config structure in \ref{sec:Devi=
ce
> > Types / Network Device / Device Operation / Control Virtqueue /
> > Receive-side scaling (RSS) / Setting RSS parameters}

> I would just add a link where virtio_net_rss_config is mentioned.
> E.g.
> The device uses \field{hash_key_data} of the virtio_net_rss_config
> structure (See \ref{...}).

OK=20

> > +
> > +If the feature VIRTIO_NET_F_RSS was not negotiated:
> > +\begin{itemize}
> > +\item The device uses \field{hash_types} of the virtio_net_hash_config
> > structure as the 'Enabled hash types' bitmask.
> > +\item The device uses \field{hash_key_data} of the virtio_net_hash_con=
fig
> > structure.
> > +\end{itemize}
> > +See the definition of virtio_net_hash_config structure in \ref{sec:Dev=
ice
> > Types / Network Device / Device Operation / Control Virtqueue / Automat=
ic
> > receive steering in multiqueue mode / Hash calculation}.
> > +
> > +Note that if the device offers VIRTIO_NET_F_HASH_REPORT, even if it
> > supports only one pair of virtqueues, it SHOULD support
> > +at least one of commands of VIRTIO_NET_CTRL_MQ class to configure repo=
rted
> > hash parameters:
> > +\begin{itemize}
> > +\item If the device offers VIRTIO_NET_F_RSS, it MUST support
> > VIRTIO_NET_CTRL_MQ_RSS_CONFIG command per
> > + \ref{sec:Device Types / Network Device / Device Operation / Control
> > Virtqueue / Receive-side scaling (RSS) / Setting RSS parameters}.
> > +\item Otherwise the device SHOULD support VIRTIO_NET_CTRL_MQ_HASH_CONF=
IG
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
> > of Incoming Packets / Hash reporting for incoming packets}%old label fo=
r
> > latexdiff

> I doubt it's an old label

OK, I'll remove that=20

> > +
> > +If feature VIRTIO_NET_F_HASH_REPORT

> If feature VIRTIO_NET_F_HASH_REPORT -> If VIRTIO_NET_F_HASH_REPORT
OK=20

> > was negotiated and
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
> > @@ -3860,6 +4028,7 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
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
> > @@ -3925,10 +4094,37 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice
> > Types / Network Device / Devi
> > according to the native endian of the guest rather than
> > (necessarily when not using the legacy interface) little-endian.
> >
> > +\subparagraph{Hash calculation}\label{sec:Device Types / Network Devic=
e /
> > Device Operation / Control Virtqueue / Automatic receive steering in
> > multiqueue mode / Hash calculation}
> > +If VIRTIO_NET_F_HASH_REPORT negotiated

> negotiated -> was negotiated

OK=20

> > and the device uses automatic receive steering,
> > +the device SHOULD support a command to configure hash calculation
> > parameters.

> SHOULD and not MUST do drivers must expect failure and handle
> gracefully?

This corner non-functional case IMO does not present any critical problem t=
o the driver.=20
It already has negotiated the feature, so the packet is extended but does n=
ot contain a calculated hash.=20
OK, I'll change it to MUST. Please respond if you disagree.=20

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
> > structure to look similar

> look similar -> match the layout of
OK=20

> > to virtio_net_rss_config structure,
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
> > @@ -3945,7 +4141,8 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
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
> > @@ -3959,94 +4156,6 @@ \subsubsection{Control Virtqueue}\label{sec:Devi=
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
> > -
> > \drivernormative{\subparagraph}{Setting RSS parameters}{Device Types /
> > Network Device / Device Operation / Control Virtqueue / Receive-side
> > scaling (RSS) }
> >
> > A driver MUST NOT send the VIRTIO_NET_CTRL_MQ_RSS_CONFIG command if the
> > feature VIRTIO_NET_F_RSS has not been negotiated.
> > @@ -4057,12 +4166,12 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
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

I'll prepare the next drop with these minimal changes.=20

> > 2.17.1

------=_Part_7054259_1054323376.1582011818957
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: courier new,courier,monaco,monospace=
,sans-serif; font-size: 12pt; color: #000000"><div><br></div><div><br></div=
><hr id=3D"zwchr"><blockquote style=3D"border-left:2px solid #1010FF;margin=
-left:5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;=
text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;=
"><b>From: </b>"Michael S. Tsirkin" &lt;mst@redhat.com&gt;<br><b>To: </b>"Y=
uri Benditovich" &lt;yuri.benditovich@daynix.com&gt;<br><b>Cc: </b>virtio-c=
omment@lists.oasis-open.org, ybendito@redhat.com<br><b>Sent: </b>Tuesday, F=
ebruary 18, 2020 7:59:13 AM<br><b>Subject: </b>Re: [PATCH v3] virtio-net: D=
efine per-packet hash reporting feature<br><div><br></div>On Wed, Feb 05, 2=
020 at 08:59:05PM +0200, Yuri Benditovich wrote:<br>&gt; Fixes: https://git=
hub.com/oasis-tcs/virtio-spec/issues/66<br>&gt; Define respective feature b=
it for virtio-net.<br>&gt; Extend packet layout to populate hash value and =
type.<br>&gt; Move the definition of IP/TCP/UDP header fields to<br>&gt; ca=
lculate the hash out of RSS section to common network<br>&gt; device sectio=
n.<br>&gt; <br>&gt; Signed-off-by: Yuri Benditovich &lt;yuri.benditovich@da=
ynix.com&gt;<br><div><br></div>Looks good to me.<br>Minor typos/tweaks.<br>=
Otherwise<br><div><br></div>Acked-by: Michael S. Tsirkin &lt;mst@redhat.com=
&gt;<br><div><br></div><br>&gt; ---<br>&gt; &nbsp;content.tex | 347 +++++++=
+++++++++++++++++++++++++++------------------<br>&gt; &nbsp;1 file changed,=
 228 insertions(+), 119 deletions(-)<br>&gt; <br>&gt; diff --git a/content.=
tex b/content.tex<br>&gt; index fb10061..20d598d 100644<br>&gt; --- a/conte=
nt.tex<br>&gt; +++ b/content.tex<br>&gt; @@ -2895,6 +2895,9 @@ \subsection{=
Feature bits}\label{sec:Device Types / Network Device / Feature bits<br>&gt=
; &nbsp;\item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through contr=
ol<br>&gt; &nbsp; &nbsp; &nbsp;channel.<br>&gt; &nbsp;<br>&gt; +\item[VIRTI=
O_NET_F_HASH_REPORT(58)] Device can report per-packet hash<br>&gt; + &nbsp;=
 &nbsp;value and a type of calculated hash.<br>&gt; +<br>&gt; &nbsp;\item[V=
IRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \field{hdr_len}<=
br>&gt; &nbsp; &nbsp; &nbsp;value. Device benefits from knowing the exact h=
eader length.<br>&gt; &nbsp;<br>&gt; @@ -2981,35 +2984,17 @@ \subsection{De=
vice configuration layout}\label{sec:Device Types / Network Device<br>&gt; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le32 supported_hash_types;<br>&gt; &nbsp;=
};<br>&gt; &nbsp;\end{lstlisting}<br>&gt; -\label{sec:Device Types / Networ=
k Device / Device configuration layout / RSS}<br>&gt; -Three following fiel=
ds, \field{rss_max_key_size}, \field{rss_max_indirection_table_length}<br>&=
gt; -and \field{supported_hash_types} only exist if VIRTIO_NET_F_RSS is set=
.<br>&gt; +The following field, \field{rss_max_key_size} only exist if VIRT=
IO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT is set.<br>&gt; +It specifies the =
maximal supported length of RSS key in bytes.<br>&gt; &nbsp;<br>&gt; -Field=
 \field{rss_max_key_size} specifies the maximal supported length of RSS key=
 in bytes.<br>&gt; +The following field, \field{rss_max_indirection_table_l=
ength} only exist if VIRTIO_NET_F_RSS is set.<br>&gt; +It specifies the max=
imal number of 16-bit entries in RSS indirection table.<br>&gt; &nbsp;<br>&=
gt; -Field \field{rss_max_indirection_table_length} specifies the maximal n=
umber of 16-bit entries in RSS indirection table.<br>&gt; +The next field, =
\field{supported_hash_types} exists only if the device supports hash calcul=
ation,<br>&gt; +i.e. if VIRTIO_NET_F_RSS of VIRTIO_NET_F_HASH_REPORT is set=
.<br><div><br></div>of -&gt; or?</blockquote><div>Yes, will fix the typo<br=
></div><blockquote style=3D"border-left:2px solid #1010FF;margin-left:5px;p=
adding-left:5px;color:#000;font-weight:normal;font-style:normal;text-decora=
tion:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"><br><div>=
<br></div>&gt; &nbsp;<br>&gt; -Field \field{supported_hash_types} contains =
the bitmask of supported RSS hash types.<br>&gt; -<br>&gt; -Hash types appl=
icable for IPv4 packets:<br>&gt; -\begin{lstlisting}<br>&gt; -#define VIRTI=
O_NET_RSS_HASH_TYPE_IPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1=
 &lt;&lt; 0)<br>&gt; -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4 &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 1)<br>&gt; -#define VIRTIO_NET_RSS_=
HASH_TYPE_UDPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 2)<br=
>&gt; -\end{lstlisting}<br>&gt; -Hash types applicable for IPv6 packets wit=
hout extension headers<br>&gt; -\begin{lstlisting}<br>&gt; -#define VIRTIO_=
NET_RSS_HASH_TYPE_IPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &=
lt;&lt; 3)<br>&gt; -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6 &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 4)<br>&gt; -#define VIRTIO_NET_RSS_HA=
SH_TYPE_UDPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 5)<br>&=
gt; -\end{lstlisting}<br>&gt; -Hash types applicable for IPv6 packets with =
extension headers<br>&gt; -\begin{lstlisting}<br>&gt; -#define VIRTIO_NET_R=
SS_HASH_TYPE_IP_EX &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 6)=
<br>&gt; -#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;(1 &lt;&lt; 7)<br>&gt; -#define VIRTIO_NET_RSS_HASH_TYPE_UD=
P_EX &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 8)<br>&gt; -\end{=
lstlisting}<br>&gt; -For the exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ fla=
gs see \ref{sec:Device Types / Network Device / Device Operation / Control =
Virtqueue / Receive-side scaling (RSS) / RSS hash types}.<br>&gt; +Field \f=
ield{supported_hash_types} contains the bitmask of supported hash types.<br=
>&gt; +See \ref{sec:Device Types / Network Device / Device Operation / Proc=
essing of Incoming Packets / Hash calculation for incoming packets / Suppor=
ted/enabled hash types} for details of supported hash types.<br>&gt; &nbsp;=
<br>&gt; &nbsp;\devicenormative{\subsubsection}{Device configuration layout=
}{Device Types / Network Device / Device configuration layout}<br>&gt; &nbs=
p;<br>&gt; @@ -3034,7 +3019,7 @@ \subsection{Device configuration layout}\l=
abel{sec:Device Types / Network Device<br>&gt; &nbsp;negotiated.<br>&gt; &n=
bsp;<br>&gt; &nbsp;The device MUST set \field{rss_max_key_size} to at least=
 40, if it offers<br>&gt; -VIRTIO_NET_F_RSS.<br>&gt; +VIRTIO_NET_F_RSS or V=
IRTIO_NET_F_HASH_REPORT.<br>&gt; &nbsp;<br>&gt; &nbsp;The device MUST set \=
field{rss_max_indirection_table_length} to at least 128, if it offers<br>&g=
t; &nbsp;VIRTIO_NET_F_RSS.<br>&gt; @@ -3159,6 +3144,8 @@ \subsection{Device=
 Operation}\label{sec:Device Types / Network Device / Device O<br>&gt; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;le16 csum_start;<br>&gt; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;le16 csum_offset;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;l=
e16 num_buffers;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;le32 hash_value; (Onl=
y if VIRTIO_NET_F_HASH_REPORT negotiated)<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp;le16 hash_type; &nbsp;(Only if VIRTIO_NET_F_HASH_REPORT negotiated)<br>=
&gt; &nbsp;};<br>&gt; &nbsp;\end{lstlisting}<br>&gt; &nbsp;<br>&gt; @@ -348=
1,6 +3468,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:De=
vice Types / Network<br>&gt; &nbsp;<br>&gt; &nbsp;\end{enumerate}<br>&gt; &=
nbsp;<br>&gt; +If applicable, the device calculates per-packet hash for inc=
oming packets as<br>&gt; +defined in \ref{sec:Device Types / Network Device=
 / Device Operation / Processing of Incoming Packets / Hash calculation for=
 incoming packets}.<br>&gt; +<br>&gt; +If applicable, the device reports ha=
sh information for incoming packets as<br>&gt; +defined in \ref{sec:Device =
Types / Network Device / Device Operation / Processing of Incoming Packets =
/ Hash reporting for incoming packets}.<br>&gt; +<br>&gt; &nbsp;\devicenorm=
ative{\paragraph}{Processing of Incoming Packets}{Device Types / Network De=
vice / Device Operation / Processing of Incoming Packets}<br>&gt; &nbsp;\la=
bel{devicenormative:Device Types / Network Device / Device Operation / Proc=
essing of Packets}%old label for latexdiff<br>&gt; &nbsp;<br>&gt; @@ -3583,=
6 +3576,181 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Dev=
ice Types / Network<br>&gt; &nbsp;If neither VIRTIO_NET_HDR_F_NEEDS_CSUM no=
r<br>&gt; &nbsp;VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT<br>=
&gt; &nbsp;rely on the packet checksum being correct.<br>&gt; +<br>&gt; +\p=
aragraph{Hash calculation for incoming packets}<br>&gt; +\label{sec:Device =
Types / Network Device / Device Operation / Processing of Incoming Packets =
/ Hash calculation for incoming packets}<br>&gt; +<br>&gt; +A device attemp=
ts to calculate a per-packet hash in the following cases:<br>&gt; +\begin{i=
temize}<br>&gt; +\item The feature VIRTIO_NET_F_RSS was negotiated. The dev=
ice uses the hash to determine the receive virtqueue to place incoming pack=
ets.<br>&gt; +\item The feature VIRTIO_NET_F_HASH_REPORT was negotiated. Th=
e device reports the hash value and the hash type with the packet.<br>&gt; =
+\end{itemize}<br><div><br></div>below mentions structures that were never =
mentioned earlier.<br>We should say a couple of words here.<br>E.g.<br>the =
driver configures the hash calculation by sending<br>either the virtio_net_=
rss_config structure as described in<br>... or the<br>virtio_net_hash_confi=
g structure as described in ... to the device.<br></blockquote><div>OK, wil=
l add that<br></div><blockquote style=3D"border-left:2px solid #1010FF;marg=
in-left:5px;padding-left:5px;color:#000;font-weight:normal;font-style:norma=
l;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12p=
t;"><br>&gt; +If the feature VIRTIO_NET_F_RSS was negotiated:<br>&gt; +\beg=
in{itemize}<br>&gt; +\item The device uses \field{hash_types} of the virtio=
_net_rss_config structure as the 'Enabled hash types' bitmask.<br>&gt; +\it=
em The device uses \field{hash_key_data} of the virtio_net_rss_config struc=
ture.<br><div><br></div>.. as &nbsp;... ?<br></blockquote><div>OK<br></div>=
<blockquote style=3D"border-left:2px solid #1010FF;margin-left:5px;padding-=
left:5px;color:#000;font-weight:normal;font-style:normal;text-decoration:no=
ne;font-family:Helvetica,Arial,sans-serif;font-size:12pt;">Also what about =
key length field?<br>We should document all fields.<br><div><br></div>Also =
I would maybe repeat this near where the structure itself is defined.</bloc=
kquote><div><br></div><div>OK<br></div><blockquote style=3D"border-left:2px=
 solid #1010FF;margin-left:5px;padding-left:5px;color:#000;font-weight:norm=
al;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-=
serif;font-size:12pt;"><br><div><br></div>&gt; +\end{itemize}<br>&gt; +See =
the definition of virtio_net_rss_config structure in \ref{sec:Device Types =
/ Network Device / Device Operation / Control Virtqueue / Receive-side scal=
ing (RSS) / Setting RSS parameters}<br><div><br></div>I would just add a li=
nk where virtio_net_rss_config is mentioned.<br>E.g. <br>&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The device uses \field{hash_key_data} of the =
virtio_net_rss_config<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;st=
ructure (See \ref{...}).<br><div><br></div></blockquote><div>OK<br></div><d=
iv><br></div><blockquote style=3D"border-left:2px solid #1010FF;margin-left=
:5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;text-=
decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;">&gt=
; +<br>&gt; +If the feature VIRTIO_NET_F_RSS was not negotiated:<br>&gt; +\=
begin{itemize}<br>&gt; +\item The device uses \field{hash_types} of the vir=
tio_net_hash_config structure as the 'Enabled hash types' bitmask.<br>&gt; =
+\item The device uses \field{hash_key_data} of the virtio_net_hash_config =
structure.<br>&gt; +\end{itemize}<br>&gt; +See the definition of virtio_net=
_hash_config structure in \ref{sec:Device Types / Network Device / Device O=
peration / Control Virtqueue / Automatic receive steering in multiqueue mod=
e / Hash calculation}.<br>&gt; +<br>&gt; +Note that if the device offers VI=
RTIO_NET_F_HASH_REPORT, even if it supports only one pair of virtqueues, it=
 SHOULD support<br>&gt; +at least one of commands of VIRTIO_NET_CTRL_MQ cla=
ss to configure reported hash parameters:<br>&gt; +\begin{itemize}<br>&gt; =
+\item If the device offers VIRTIO_NET_F_RSS, it MUST support VIRTIO_NET_CT=
RL_MQ_RSS_CONFIG command per<br>&gt; + \ref{sec:Device Types / Network Devi=
ce / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / Se=
tting RSS parameters}.<br>&gt; +\item Otherwise the device SHOULD support V=
IRTIO_NET_CTRL_MQ_HASH_CONFIG command per<br>&gt; + \ref{sec:Device Types /=
 Network Device / Device Operation / Control Virtqueue / Automatic receive =
steering in multiqueue mode / Hash calculation}.<br>&gt; +\end{itemize}<br>=
&gt; +<br>&gt; +\subparagraph{Supported/enabled hash types}<br>&gt; +\label=
{sec:Device Types / Network Device / Device Operation / Processing of Incom=
ing Packets / Hash calculation for incoming packets / Supported/enabled has=
h types}<br>&gt; +Hash types applicable for IPv4 packets:<br>&gt; +\begin{l=
stlisting}<br>&gt; +#define VIRTIO_NET_HASH_TYPE_IPv4 &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 0)<br>&gt; +#define VIRTIO_NET_HASH_=
TYPE_TCPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 1)<br>&gt;=
 +#define VIRTIO_NET_HASH_TYPE_UDPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; (1 &lt;&lt; 2)<br>&gt; +\end{lstlisting}<br>&gt; +Hash types applicable=
 for IPv6 packets without extension headers<br>&gt; +\begin{lstlisting}<br>=
&gt; +#define VIRTIO_NET_HASH_TYPE_IPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;(1 &lt;&lt; 3)<br>&gt; +#define VIRTIO_NET_HASH_TYPE_TCPv6 &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 4)<br>&gt; +#define VIRT=
IO_NET_HASH_TYPE_UDPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt=
; 5)<br>&gt; +\end{lstlisting}<br>&gt; +Hash types applicable for IPv6 pack=
ets with extension headers<br>&gt; +\begin{lstlisting}<br>&gt; +#define VIR=
TIO_NET_HASH_TYPE_IP_EX &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&l=
t; 6)<br>&gt; +#define VIRTIO_NET_HASH_TYPE_TCP_EX &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;(1 &lt;&lt; 7)<br>&gt; +#define VIRTIO_NET_HASH_TYPE_UDP_E=
X &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 8)<br>&gt; +\end{lst=
listing}<br>&gt; +<br>&gt; +\subparagraph{IPv4 packets}<br>&gt; +\label{sec=
:Device Types / Network Device / Device Operation / Processing of Incoming =
Packets / Hash calculation for incoming packets / IPv4 packets}<br>&gt; +Th=
e device calculates the hash on IPv4 packets according to 'Enabled hash typ=
es' bitmask as follows:<br>&gt; +\begin{itemize}<br>&gt; +\item If VIRTIO_N=
ET_HASH_TYPE_TCPv4 is set and the packet has<br>&gt; +a TCP header, the has=
h is calculated over the following fields:<br>&gt; +\begin{itemize}<br>&gt;=
 +\item Source IP address<br>&gt; +\item Destination IP address<br>&gt; +\i=
tem Source TCP port<br>&gt; +\item Destination TCP port<br>&gt; +\end{itemi=
ze}<br>&gt; +\item Else if VIRTIO_NET_HASH_TYPE_UDPv4 is set and the<br>&gt=
; +packet has a UDP header, the hash is calculated over the following field=
s:<br>&gt; +\begin{itemize}<br>&gt; +\item Source IP address<br>&gt; +\item=
 Destination IP address<br>&gt; +\item Source UDP port<br>&gt; +\item Desti=
nation UDP port<br>&gt; +\end{itemize}<br>&gt; +\item Else if VIRTIO_NET_HA=
SH_TYPE_IPv4 is set, the hash is<br>&gt; +calculated over the following fie=
lds:<br>&gt; +\begin{itemize}<br>&gt; +\item Source IP address<br>&gt; +\it=
em Destination IP address<br>&gt; +\end{itemize}<br>&gt; +\item Else the de=
vice does not calculate the hash<br>&gt; +\end{itemize}<br>&gt; +<br>&gt; +=
\subparagraph{IPv6 packets without extension header}<br>&gt; +\label{sec:De=
vice Types / Network Device / Device Operation / Processing of Incoming Pac=
kets / Hash calculation for incoming packets / IPv6 packets without extensi=
on header}<br>&gt; +The device calculates the hash on IPv6 packets without =
extension<br>&gt; +headers according to 'Enabled hash types' bitmask as fol=
lows:<br>&gt; +\begin{itemize}<br>&gt; +\item If VIRTIO_NET_HASH_TYPE_TCPv6=
 is set and the packet has<br>&gt; +a TCPv6 header, the hash is calculated =
over the following fields:<br>&gt; +\begin{itemize}<br>&gt; +\item Source I=
Pv6 address<br>&gt; +\item Destination IPv6 address<br>&gt; +\item Source T=
CP port<br>&gt; +\item Destination TCP port<br>&gt; +\end{itemize}<br>&gt; =
+\item Else if VIRTIO_NET_HASH_TYPE_UDPv6 is set and the<br>&gt; +packet ha=
s a UDPv6 header, the hash is calculated over the following fields:<br>&gt;=
 +\begin{itemize}<br>&gt; +\item Source IPv6 address<br>&gt; +\item Destina=
tion IPv6 address<br>&gt; +\item Source UDP port<br>&gt; +\item Destination=
 UDP port<br>&gt; +\end{itemize}<br>&gt; +\item Else if VIRTIO_NET_HASH_TYP=
E_IPv6 is set, the hash is<br>&gt; +calculated over the following fields:<b=
r>&gt; +\begin{itemize}<br>&gt; +\item Source IPv6 address<br>&gt; +\item D=
estination IPv6 address<br>&gt; +\end{itemize}<br>&gt; +\item Else the devi=
ce does not calculate the hash<br>&gt; +\end{itemize}<br>&gt; +<br>&gt; +\s=
ubparagraph{IPv6 packets with extension header}<br>&gt; +\label{sec:Device =
Types / Network Device / Device Operation / Processing of Incoming Packets =
/ Hash calculation for incoming packets / IPv6 packets with extension heade=
r}<br>&gt; +The device calculates the hash on IPv6 packets with extension<b=
r>&gt; +headers according to 'Enabled hash types' bitmask as follows:<br>&g=
t; +\begin{itemize}<br>&gt; +\item If VIRTIO_NET_HASH_TYPE_TCP_EX is set an=
d the packet<br>&gt; +has a TCPv6 header, the hash is calculated over the f=
ollowing fields:<br>&gt; +\begin{itemize}<br>&gt; +\item Home address from =
the home address option in the IPv6 destination options header. If the exte=
nsion header is not present, use the Source IPv6 address.<br>&gt; +\item IP=
v6 address that is contained in the Routing-Header-Type-2 from the associat=
ed extension header. If the extension header is not present, use the Destin=
ation IPv6 address.<br>&gt; +\item Source TCP port<br>&gt; +\item Destinati=
on TCP port<br>&gt; +\end{itemize}<br>&gt; +\item Else if VIRTIO_NET_HASH_T=
YPE_UDP_EX is set and the<br>&gt; +packet has a UDPv6 header, the hash is c=
alculated over the following fields:<br>&gt; +\begin{itemize}<br>&gt; +\ite=
m Home address from the home address option in the IPv6 destination options=
 header. If the extension header is not present, use the Source IPv6 addres=
s.<br>&gt; +\item IPv6 address that is contained in the Routing-Header-Type=
-2 from the associated extension header. If the extension header is not pre=
sent, use the Destination IPv6 address.<br>&gt; +\item Source UDP port<br>&=
gt; +\item Destination UDP port<br>&gt; +\end{itemize}<br>&gt; +\item Else =
if VIRTIO_NET_HASH_TYPE_IP_EX is set, the hash is<br>&gt; +calculated over =
the following fields:<br>&gt; +\begin{itemize}<br>&gt; +\item Home address =
from the home address option in the IPv6 destination options header. If the=
 extension header is not present, use the Source IPv6 address.<br>&gt; +\it=
em IPv6 address that is contained in the Routing-Header-Type-2 from the ass=
ociated extension header. If the extension header is not present, use the D=
estination IPv6 address.<br>&gt; +\end{itemize}<br>&gt; +\item Else skip IP=
v6 extension headers and calculate the hash as<br>&gt; +defined for an IPv6=
 packet without extension headers<br>&gt; +(see \ref{sec:Device Types / Net=
work Device / Device Operation / Processing of Incoming Packets / Hash calc=
ulation for incoming packets / IPv6 packets without extension header}).<br>=
&gt; +\end{itemize}<br>&gt; +<br>&gt; +\paragraph{Hash reporting for incomi=
ng packets}<br>&gt; +\label{sec:Device Types / Network Device / Device Oper=
ation / Processing of Incoming Packets / Hash reporting for incoming packet=
s}%old label for latexdiff<br><div><br></div>I doubt it's an old label<br><=
/blockquote><div>OK, I'll remove that<br></div><div><br></div><blockquote s=
tyle=3D"border-left:2px solid #1010FF;margin-left:5px;padding-left:5px;colo=
r:#000;font-weight:normal;font-style:normal;text-decoration:none;font-famil=
y:Helvetica,Arial,sans-serif;font-size:12pt;">&gt; +<br>&gt; +If feature VI=
RTIO_NET_F_HASH_REPORT<br><div><br></div>If feature VIRTIO_NET_F_HASH_REPOR=
T -&gt; If VIRTIO_NET_F_HASH_REPORT</blockquote><div>OK<br></div><blockquot=
e style=3D"border-left:2px solid #1010FF;margin-left:5px;padding-left:5px;c=
olor:#000;font-weight:normal;font-style:normal;text-decoration:none;font-fa=
mily:Helvetica,Arial,sans-serif;font-size:12pt;"><br><div><br></div>&gt; wa=
s negotiated and<br>&gt; + the device has calculated the hash for the packe=
t, the device fills \field{hash_type} with the type of calculated hash<br>&=
gt; +and \field{hash_value} with the value of calculated hash.<br>&gt; +<br=
>&gt; +If VIRTIO_NET_F_HASH_REPORT was negotiated but due to any reason the=
<br>&gt; +hash was not calculated, the device sets \field{hash_type} to VIR=
TIO_NET_HASH_REPORT_NONE.<br>&gt; +<br>&gt; +Possible values that the devic=
e can report in \field{hash_type} are defined below.<br>&gt; +They correspo=
nd to supported hash types defined in<br>&gt; +\ref{sec:Device Types / Netw=
ork Device / Device Operation / Processing of Incoming Packets / Hash calcu=
lation for incoming packets / Supported/enabled hash types}<br>&gt; +as fol=
lows:<br>&gt; +<br>&gt; +VIRTIO_NET_HASH_TYPE_XXX =3D 1 &lt;&lt; (VIRTIO_NE=
T_HASH_REPORT_XXX - 1)<br>&gt; +<br>&gt; +\begin{lstlisting}<br>&gt; +#defi=
ne VIRTIO_NET_HASH_REPORT_NONE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0<b=
r>&gt; +#define VIRTIO_NET_HASH_REPORT_IPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;1<br>&gt; +#define VIRTIO_NET_HASH_REPORT_TCPv4 &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; 2<br>&gt; +#define VIRTIO_NET_HASH_REPORT_UDPv4 &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; 3<br>&gt; +#define VIRTIO_NET_HASH_REPORT_IPv6 &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4<br>&gt; +#define VIRTIO_NET_HASH_R=
EPORT_TCPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 5<br>&gt; +#define VIRTIO_NE=
T_HASH_REPORT_UDPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 6<br>&gt; +#define V=
IRTIO_NET_HASH_REPORT_IPv6_EX &nbsp; &nbsp; &nbsp; &nbsp; 7<br>&gt; +#defin=
e VIRTIO_NET_HASH_REPORT_TCPv6_EX &nbsp; &nbsp; &nbsp; &nbsp;8<br>&gt; +#de=
fine VIRTIO_NET_HASH_REPORT_UDPv6_EX &nbsp; &nbsp; &nbsp; &nbsp;9<br>&gt; +=
\end{lstlisting}<br>&gt; +<br>&gt; &nbsp;\subsubsection{Control Virtqueue}\=
label{sec:Device Types / Network Device / Device Operation / Control Virtqu=
eue}<br>&gt; &nbsp;<br>&gt; &nbsp;The driver uses the control virtqueue (if=
 VIRTIO_NET_F_CTRL_VQ is<br>&gt; @@ -3860,6 +4028,7 @@ \subsubsection{Contr=
ol Virtqueue}\label{sec:Device Types / Network Device / Devi<br>&gt; &nbsp;=
#define VIRTIO_NET_CTRL_MQ &nbsp; &nbsp;4<br>&gt; &nbsp; #define VIRTIO_NET=
_CTRL_MQ_VQ_PAIRS_SET &nbsp; &nbsp; &nbsp; &nbsp;0 (for automatic receive s=
teering)<br>&gt; &nbsp; #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;1 (for configurable receive steering)<br>&gt; + #defin=
e VIRTIO_NET_CTRL_MQ_HASH_CONFIG &nbsp; &nbsp; &nbsp; &nbsp; 2 (for configu=
rable hash calculation)<br>&gt; &nbsp;\end{lstlisting}<br>&gt; &nbsp;<br>&g=
t; &nbsp;If more than one multiqueue mode is negotiated, the resulting devi=
ce configuration is defined by the last command sent by the driver.<br>&gt;=
 @@ -3925,10 +4094,37 @@ \subsubsection{Control Virtqueue}\label{sec:Device=
 Types / Network Device / Devi<br>&gt; &nbsp;according to the native endian=
 of the guest rather than<br>&gt; &nbsp;(necessarily when not using the leg=
acy interface) little-endian.<br>&gt; &nbsp;<br>&gt; +\subparagraph{Hash ca=
lculation}\label{sec:Device Types / Network Device / Device Operation / Con=
trol Virtqueue / Automatic receive steering in multiqueue mode / Hash calcu=
lation}<br>&gt; +If VIRTIO_NET_F_HASH_REPORT negotiated<br><div><br></div>n=
egotiated -&gt; was negotiated<br></blockquote><div>OK<br></div><blockquote=
 style=3D"border-left:2px solid #1010FF;margin-left:5px;padding-left:5px;co=
lor:#000;font-weight:normal;font-style:normal;text-decoration:none;font-fam=
ily:Helvetica,Arial,sans-serif;font-size:12pt;">&gt; and the device uses au=
tomatic receive steering,<br>&gt; +the device SHOULD support a command to c=
onfigure hash calculation parameters.<br><div><br></div>SHOULD and not MUST=
 do drivers must expect &nbsp;failure and handle<br>gracefully?<br></blockq=
uote><div>This corner non-functional case IMO does not present any critical=
 problem to the driver.<br></div><div>It already has negotiated the feature=
, so the packet is extended but does not contain a calculated hash.<br></di=
v><div>OK, I'll change it to MUST. Please respond if you disagree.<br></div=
><div><br></div><blockquote style=3D"border-left:2px solid #1010FF;margin-l=
eft:5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;te=
xt-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;">=
&gt; +<br>&gt; +The driver provides parameters for hash calculation as foll=
ows:<br>&gt; +<br>&gt; +\field{class} VIRTIO_NET_CTRL_MQ, \field{command} V=
IRTIO_NET_CTRL_MQ_HASH_CONFIG.<br>&gt; +<br>&gt; +The \field{command-specif=
ic-data} has following format:<br>&gt; +\begin{lstlisting}<br>&gt; +struct =
virtio_net_hash_config {<br>&gt; + &nbsp; &nbsp;le32 hash_types;<br>&gt; + =
&nbsp; &nbsp;le16 reserved[4];<br>&gt; + &nbsp; &nbsp;u8 hash_key_length;<b=
r>&gt; + &nbsp; &nbsp;u8 hash_key_data[hash_key_length];<br>&gt; +};<br>&gt=
; +\end{lstlisting}<br>&gt; +Field \field{hash_types} contains a bitmask of=
 allowed hash types as<br>&gt; +defined in<br>&gt; +\ref{sec:Device Types /=
 Network Device / Device Operation / Processing of Incoming Packets / Hash =
calculation for incoming packets / Supported/enabled hash types}.<br>&gt; +=
Initially the device has all hash types disabled and reports only VIRTIO_NE=
T_HASH_REPORT_NONE.<br>&gt; +<br>&gt; +Field \field{reserved} MUST contain =
zeroes. It is defined to make the structure to look similar<br><div><br></d=
iv>look similar -&gt; match the layout of</blockquote><div>OK<br></div><blo=
ckquote style=3D"border-left:2px solid #1010FF;margin-left:5px;padding-left=
:5px;color:#000;font-weight:normal;font-style:normal;text-decoration:none;f=
ont-family:Helvetica,Arial,sans-serif;font-size:12pt;"><br><div><br></div>&=
gt; to virtio_net_rss_config structure,<br>&gt; +defined in \ref{sec:Device=
 Types / Network Device / Device Operation / Control Virtqueue / Receive-si=
de scaling (RSS)}.<br>&gt; +<br>&gt; +Fields \field{hash_key_length} and \f=
ield{hash_key_data} define the key to be used in hash calculation.<br>&gt; =
+<br>&gt; &nbsp;\paragraph{Receive-side scaling (RSS)}\label{sec:Device Typ=
es / Network Device / Device Operation / Control Virtqueue / Receive-side s=
caling (RSS)}<br>&gt; &nbsp;A device offers the feature VIRTIO_NET_F_RSS if=
 it supports RSS receive steering with Toeplitz hash calculation and config=
urable parameters.<br>&gt; &nbsp;<br>&gt; -A driver queries RSS capabilitie=
s of the device by reading device configuration as defined in \ref{sec:Devi=
ce Types / Network Device / Device configuration layout / RSS}<br>&gt; +A d=
river queries RSS capabilities of the device by reading device configuratio=
n as defined in \ref{sec:Device Types / Network Device / Device configurati=
on layout}<br>&gt; &nbsp;<br>&gt; &nbsp;\subparagraph{Setting RSS parameter=
s}\label{sec:Device Types / Network Device / Device Operation / Control Vir=
tqueue / Receive-side scaling (RSS) / Setting RSS parameters}<br>&gt; &nbsp=
;<br>&gt; @@ -3945,7 +4141,8 @@ \subsubsection{Control Virtqueue}\label{sec=
:Device Types / Network Device / Devi<br>&gt; &nbsp;};<br>&gt; &nbsp;\end{l=
stlisting}<br>&gt; &nbsp;Field \field{hash_types} contains a bitmask of all=
owed hash types as<br>&gt; -defined in \ref{sec:Device Types / Network Devi=
ce / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RS=
S hash types}.<br>&gt; +defined in<br>&gt; +\ref{sec:Device Types / Network=
 Device / Device Operation / Processing of Incoming Packets / Hash calculat=
ion for incoming packets / Supported/enabled hash types}.<br>&gt; &nbsp;<br=
>&gt; &nbsp;Field \field{indirection_table_mask} is a mask to be applied to=
<br>&gt; &nbsp;the calculated hash to produce an index in the<br>&gt; @@ -3=
959,94 +4156,6 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types =
/ Network Device / Devi<br>&gt; &nbsp;<br>&gt; &nbsp;A driver sets \field{m=
ax_tx_vq} to inform a device how many transmit virtqueues it may use (trans=
mitq1\ldots transmitq \field{max_tx_vq}).<br>&gt; &nbsp;<br>&gt; -\subparag=
raph{RSS hash types}\label{sec:Device Types / Network Device / Device Opera=
tion / Control Virtqueue / Receive-side scaling (RSS) / RSS hash types}<br>=
&gt; -<br>&gt; -The device calculates the hash on IPv4 packets according to=
 the<br>&gt; -field \field{hash_types} of the virtio_net_rss_config structu=
re as follows:<br>&gt; -\begin{itemize}<br>&gt; -\item If VIRTIO_NET_RSS_HA=
SH_TYPE_TCPv4 is set and the packet has<br>&gt; -a TCP header, the hash is =
calculated over the following fields:<br>&gt; -\begin{itemize}<br>&gt; -\it=
em Source IP address<br>&gt; -\item Destination IP address<br>&gt; -\item S=
ource TCP port<br>&gt; -\item Destination TCP port<br>&gt; -\end{itemize}<b=
r>&gt; -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set and the<br>&gt;=
 -packet has a UDP header, the hash is calculated over the following fields=
:<br>&gt; -\begin{itemize}<br>&gt; -\item Source IP address<br>&gt; -\item =
Destination IP address<br>&gt; -\item Source UDP port<br>&gt; -\item Destin=
ation UDP port<br>&gt; -\end{itemize}<br>&gt; -\item Else if VIRTIO_NET_RSS=
_HASH_TYPE_IPv4 is set, the hash is<br>&gt; -calculated over the following =
fields:<br>&gt; -\begin{itemize}<br>&gt; -\item Source IP address<br>&gt; -=
\item Destination IP address<br>&gt; -\end{itemize}<br>&gt; -\item Else the=
 device does not calculate the hash<br>&gt; -\end{itemize}<br>&gt; -<br>&gt=
; -\label{itm:Device Types / Network Device / Device Operation / Control Vi=
rtqueue / Receive-side scaling (RSS) / RSS hash types/hash on IPv6 packets =
without extension headers}<br>&gt; -The device calculates the hash on IPv6 =
packets without extension<br>&gt; -headers according to the field \field{ha=
sh_types} of the virtio_net_rss_config structure as follows:<br>&gt; -\begi=
n{itemize}<br>&gt; -\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set and the =
packet has<br>&gt; -a TCPv6 header, the hash is calculated over the followi=
ng fields:<br>&gt; -\begin{itemize}<br>&gt; -\item Source IPv6 address<br>&=
gt; -\item Destination IPv6 address<br>&gt; -\item Source TCP port<br>&gt; =
-\item Destination TCP port<br>&gt; -\end{itemize}<br>&gt; -\item Else if V=
IRTIO_NET_RSS_HASH_TYPE_UDPv6 is set and the<br>&gt; -packet has a UDPv6 he=
ader, the hash is calculated over the following fields:<br>&gt; -\begin{ite=
mize}<br>&gt; -\item Source IPv6 address<br>&gt; -\item Destination IPv6 ad=
dress<br>&gt; -\item Source UDP port<br>&gt; -\item Destination UDP port<br=
>&gt; -\end{itemize}<br>&gt; -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv6 i=
s set, the hash is<br>&gt; -calculated over the following fields:<br>&gt; -=
\begin{itemize}<br>&gt; -\item Source IPv6 address<br>&gt; -\item Destinati=
on IPv6 address<br>&gt; -\end{itemize}<br>&gt; -\item Else the device does =
not calculate the hash<br>&gt; -\end{itemize}<br>&gt; -<br>&gt; -The device=
 calculates the hash on IPv6 packets with extension<br>&gt; -headers accord=
ing to the field \field{hash_types} of the virtio_net_rss_config structure =
as follows:<br>&gt; -\begin{itemize}<br>&gt; -\item If VIRTIO_NET_RSS_HASH_=
TYPE_TCP_EX is set and the packet<br>&gt; -has a TCPv6 header, the hash is =
calculated over the following fields:<br>&gt; -\begin{itemize}<br>&gt; -\it=
em Home address from the home address option in the IPv6 destination option=
s header. If the extension header is not present, use the Source IPv6 addre=
ss.<br>&gt; -\item IPv6 address that is contained in the Routing-Header-Typ=
e-2 from the associated extension header. If the extension header is not pr=
esent, use the Destination IPv6 address.<br>&gt; -\item Source TCP port<br>=
&gt; -\item Destination TCP port<br>&gt; -\end{itemize}<br>&gt; -\item Else=
 if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the<br>&gt; -packet has a UD=
Pv6 header, the hash is calculated over the following fields:<br>&gt; -\beg=
in{itemize}<br>&gt; -\item Home address from the home address option in the=
 IPv6 destination options header. If the extension header is not present, u=
se the Source IPv6 address.<br>&gt; -\item IPv6 address that is contained i=
n the Routing-Header-Type-2 from the associated extension header. If the ex=
tension header is not present, use the Destination IPv6 address.<br>&gt; -\=
item Source UDP port<br>&gt; -\item Destination UDP port<br>&gt; -\end{item=
ize}<br>&gt; -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash=
 is<br>&gt; -calculated over the following fields:<br>&gt; -\begin{itemize}=
<br>&gt; -\item Home address from the home address option in the IPv6 desti=
nation options header. If the extension header is not present, use the Sour=
ce IPv6 address.<br>&gt; -\item IPv6 address that is contained in the Routi=
ng-Header-Type-2 from the associated extension header. If the extension hea=
der is not present, use the Destination IPv6 address.<br>&gt; -\end{itemize=
}<br>&gt; -\item Else skip IPv6 extension headers and calculate the hash as=
<br>&gt; -defined for an IPv6 packet without extension headers (see \ref{it=
m:Device Types / Network Device / Device Operation / Control Virtqueue / Re=
ceive-side scaling (RSS) / RSS hash types/hash on IPv6 packets without exte=
nsion headers}).<br>&gt; -\end{itemize}<br>&gt; -<br>&gt; &nbsp;\drivernorm=
ative{\subparagraph}{Setting RSS parameters}{Device Types / Network Device =
/ Device Operation / Control Virtqueue / Receive-side scaling (RSS) }<br>&g=
t; &nbsp;<br>&gt; &nbsp;A driver MUST NOT send the VIRTIO_NET_CTRL_MQ_RSS_C=
ONFIG command if the feature VIRTIO_NET_F_RSS has not been negotiated.<br>&=
gt; @@ -4057,12 +4166,12 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice Types / Network Device / Devi<br>&gt; &nbsp;<br>&gt; &nbsp;A driver MUS=
T use \field{indirection_table_mask} values that are less than \field{rss_m=
ax_indirection_table_length} reported by a device.<br>&gt; &nbsp;<br>&gt; -=
A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are not supp=
orted by a device.<br>&gt; +A driver MUST NOT set any VIRTIO_NET_HASH_TYPE_=
 flags that are not supported by a device.<br>&gt; &nbsp;<br>&gt; &nbsp;\de=
vicenormative{\subparagraph}{RSS processing}{Device Types / Network Device =
/ Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS p=
rocessing}<br>&gt; &nbsp;The device MUST determine the destination queue fo=
r a network packet as follows:<br>&gt; &nbsp;\begin{itemize}<br>&gt; -\item=
 Calculate the hash of the packet as defined in \ref{sec:Device Types / Net=
work Device / Device Operation / Control Virtqueue / Receive-side scaling (=
RSS) / RSS hash types}<br>&gt; +\item Calculate the hash of the packet as d=
efined in \ref{sec:Device Types / Network Device / Device Operation / Proce=
ssing of Incoming Packets / Hash calculation for incoming packets}.<br>&gt;=
 &nbsp;\item If the device did not calculate the hash for the specific pack=
et, the device directs the packet to the receiveq specified by \field{uncla=
ssified_queue} of virtio_net_rss_config structure (value of 0 corresponds t=
o receiveq1).<br>&gt; &nbsp;\item Apply \field{indirection_table_mask} to t=
he calculated hash and use the result as the index in the indirection table=
 to get 0-based number of destination receiveq (value of 0 corresponds to r=
eceiveq1).<br>&gt; &nbsp;\end{itemize}<br>&gt; -- <br></blockquote><div>I'l=
l prepare the next drop with these minimal changes.<br></div><div><br></div=
><blockquote style=3D"border-left:2px solid #1010FF;margin-left:5px;padding=
-left:5px;color:#000;font-weight:normal;font-style:normal;text-decoration:n=
one;font-family:Helvetica,Arial,sans-serif;font-size:12pt;">&gt; 2.17.1<br>=
<div><br></div></blockquote><div><br></div></div></body></html>
------=_Part_7054259_1054323376.1582011818957--

