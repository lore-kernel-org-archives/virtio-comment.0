Return-Path: virtio-comment-return-1046-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E29359860A4
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Feb 2020 13:11:10 +0000 (UTC)
Date: Mon, 3 Feb 2020 08:10:57 -0500 (EST)
From: Yuri Benditovich <ybendito@redhat.com>
Message-ID: <926049155.4815995.1580735457487.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200203045508-mutt-send-email-mst@kernel.org>
References: <20200201100107.20281-1-yuri.benditovich@daynix.com> <20200203045508-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v2] virtio-net: Define per-packet hash
 reporting feature
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

----- Original Message ----- 

> From: "Michael S. Tsirkin" <mst@redhat.com>
> To: "Yuri Benditovich" <yuri.benditovich@daynix.com>
> Cc: virtio-comment@lists.oasis-open.org
> Sent: Monday, February 3, 2020 12:11:06 PM
> Subject: Re: [virtio-comment] [PATCH v2] virtio-net: Define per-packet hash
> reporting feature

> On Sat, Feb 01, 2020 at 12:01:07PM +0200, Yuri Benditovich wrote:
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/66
> > Define respective feature bit for virtio-net.
> > Extend packet layout to populate hash value and type.
> > Move the definition of IP/TCP/UDP header fields to
> > calculate the hash out of RSS section to common network
> > device section.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>

> Some comments and a question below.

> > ---
> > content.tex | 299 ++++++++++++++++++++++++++++++++--------------------
> > 1 file changed, 184 insertions(+), 115 deletions(-)
> >
> > diff --git a/content.tex b/content.tex
> > index fb10061..2836e0a 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2895,6 +2895,9 @@ \subsection{Feature bits}\label{sec:Device Types /
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
> > @@ -2981,35 +2984,18 @@ \subsection{Device configuration
> > layout}\label{sec:Device Types / Network Device
> > le32 supported_hash_types;
> > };
> > \end{lstlisting}
> > -\label{sec:Device Types / Network Device / Device configuration layout /
> > RSS}
> > -Three following fields, \field{rss_max_key_size},
> > \field{rss_max_indirection_table_length}
> > -and \field{supported_hash_types} only exist if VIRTIO_NET_F_RSS is set.
> > +Two following fields, \field{rss_max_key_size} and
> > \field{rss_max_indirection_table_length}
> > +only exist if VIRTIO_NET_F_RSS is set.
> >
> > Field \field{rss_max_key_size} specifies the maximal supported length of
> > RSS key in bytes.
> >
> > Field \field{rss_max_indirection_table_length} specifies the maximal number
> > of 16-bit entries in RSS indirection table.
> >
> > -Field \field{supported_hash_types} contains the bitmask of supported RSS
> > hash types.
> > +The next field, \field{supported_hash_types} exists only if the device
> > supports hash calculation,
> > +i.e. suggests VIRTIO_NET_F_HASH_REPORT or VIRTIO_NET_F_RSS.

> i.e. if VIRTIO_NET_F_HASH_REPORT or VIRTIO_NET_F_RSS is set.

> correct?

OK, I will resent with all the syntax changes.

> >
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
> > +Field \field{supported_hash_types} contains the bitmask of supported hash
> > types.
> > +See \ref{sec:Device Types / Network Device / Device Operation / Processing
> > of Incoming Packets / Hash calculation for incoming packets /
> > Supported/enabled hash types} for details of supported hash types.
> >
> > \devicenormative{\subsubsection}{Device configuration layout}{Device Types
> > / Network Device / Device configuration layout}
> >
> > @@ -3159,6 +3145,8 @@ \subsection{Device Operation}\label{sec:Device Types
> > / Network Device / Device O
> > le16 csum_start;
> > le16 csum_offset;
> > le16 num_buffers;
> > + le32 hash_value; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
> > + le16 hash_type; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
> > };
> > \end{lstlisting}
> >
> > @@ -3481,6 +3469,12 @@ \subsubsection{Processing of Incoming
> > Packets}\label{sec:Device Types / Network
> >
> > \end{enumerate}
> >
> > +If applicable, the device calculates per-packet hash for incoming packets
> > as
> > +defined in \ref{sec:Device Types / Network Device / Device Operation /
> > Processing of Incoming Packets / Hash calculation for incoming packets}.
> > +
> > +If applicable, the device reports hash information for incoming packets as
> > +defined in \ref{sec:Device Types / Network Device / Device Operation /
> > Processing of Incoming Packets / Hash reporting for incoming packets}.
> > +
> > \devicenormative{\paragraph}{Processing of Incoming Packets}{Device Types /
> > Network Device / Device Operation / Processing of Incoming Packets}
> > \label{devicenormative:Device Types / Network Device / Device Operation /
> > Processing of Packets}%old label for latexdiff
> >
> > @@ -3583,6 +3577,168 @@ \subsubsection{Processing of Incoming
> > Packets}\label{sec:Device Types / Network
> > If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
> > VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
> > rely on the packet checksum being correct.
> > +
> > +\paragraph{Hash calculation for incoming packets}
> > +\label{sec:Device Types / Network Device / Device Operation / Processing
> > of Incoming Packets / Hash calculation for incoming packets}
> > +
> > +A device attempts to calculate per-packet hash in following cases:

> a per-packet hash in the following cases

> > +\begin{itemize}
> > +\item The feature VIRTIO_NET_F_RSS was negotiated. The device uses the
> > hash to determine receive virtqueue to place incoming packet to.

> the receive virtqueue to place incoming packets

> > +\item The feature VIRTIO_NET_F_HASH_REPORT was negotiated. The device
> > reports hash value and hash type with the packet.

> the hash value and the hash type

> > +\end{itemize}
> > +
> > +If the feature VIRTIO_NET_F_RSS was negotiated:
> > +\begin{itemize}
> > +\item The device uses \field{hash_types} of the virtio_net_rss_config
> > structure as 'Enabled hash types' bitmask.

> the 'Enabled hash types'

> > +\item The device uses \field{hash_key_data} of the virtio_net_rss_config
> > structure.
> > +\end{itemize}
> > +See the definition of virtio_net_rss_config structure in \ref{sec:Device
> > Types / Network Device / Device Operation / Control Virtqueue /
> > Receive-side scaling (RSS) / Setting RSS parameters}
> > +
> > +If the feature VIRTIO_NET_F_RSS was not negotiated, the device uses
> > internal configuration
> > +of enabled hash types and a key used for hash calculation.

> I don't understand this last paragraph. Could you clarify?

In order to calculate a hash the device shall have 2 things:
a key for hash calculation
a bitmask which hash types are enabled

In case the device supportes RSS command (even with single queue), it can take them from current RSS configuration.
If only VIRTIO_NET_F_HASH_REPORT is negotiated, the device uses internal preset of both parameters.

Do you suggest something different?

> > +
> > +\subparagraph{Supported/enabled hash types}
> > +\label{sec:Device Types / Network Device / Device Operation / Processing
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
> > +\label{sec:Device Types / Network Device / Device Operation / Processing
> > of Incoming Packets / Hash calculation for incoming packets / IPv4
> > packets}
> > +The device calculates the hash on IPv4 packets according to 'Enabled hash
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
> > +packet has a UDP header, the hash is calculated over the following fields:
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
> > +\label{sec:Device Types / Network Device / Device Operation / Processing
> > of Incoming Packets / Hash calculation for incoming packets / IPv6 packets
> > without extension header}
> > +The device calculates the hash on IPv6 packets without extension
> > +headers to 'Enabled hash types' bitmask as follows:

> headers to -> headers according to

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
> > +\label{sec:Device Types / Network Device / Device Operation / Processing
> > of Incoming Packets / Hash calculation for incoming packets / IPv6 packets
> > with extension header}
> > +The device calculates the hash on IPv6 packets with extension
> > +headers according to to 'Enabled hash types' bitmask as follows:
> > +\begin{itemize}
> > +\item If VIRTIO_NET_HASH_TYPE_TCP_EX is set and the packet
> > +has a TCPv6 header, the hash is calculated over the following fields:
> > +\begin{itemize}
> > +\item Home address from the home address option in the IPv6 destination
> > options header. If the extension header is not present, use the Source
> > IPv6 address.
> > +\item IPv6 address that is contained in the Routing-Header-Type-2 from the
> > associated extension header. If the extension header is not present, use
> > the Destination IPv6 address.
> > +\item Source TCP port
> > +\item Destination TCP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_HASH_TYPE_UDP_EX is set and the
> > +packet has a UDPv6 header, the hash is calculated over the following
> > fields:
> > +\begin{itemize}
> > +\item Home address from the home address option in the IPv6 destination
> > options header. If the extension header is not present, use the Source
> > IPv6 address.
> > +\item IPv6 address that is contained in the Routing-Header-Type-2 from the
> > associated extension header. If the extension header is not present, use
> > the Destination IPv6 address.
> > +\item Source UDP port
> > +\item Destination UDP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_HASH_TYPE_IP_EX is set, the hash is
> > +calculated over the following fields:
> > +\begin{itemize}
> > +\item Home address from the home address option in the IPv6 destination
> > options header. If the extension header is not present, use the Source
> > IPv6 address.
> > +\item IPv6 address that is contained in the Routing-Header-Type-2 from the
> > associated extension header. If the extension header is not present, use
> > the Destination IPv6 address.
> > +\end{itemize}
> > +\item Else skip IPv6 extension headers and calculate the hash as
> > +defined for an IPv6 packet without extension headers
> > +(see \ref{sec:Device Types / Network Device / Device Operation /
> > Processing of Incoming Packets / Hash calculation for incoming packets /
> > IPv6 packets without extension header}).
> > +\end{itemize}
> > +
> > +\paragraph{Hash reporting for incoming packets}
> > +\label{sec:Device Types / Network Device / Device Operation / Processing
> > of Incoming Packets / Hash reporting for incoming packets}%old label for
> > latexdiff
> > +
> > +If feature VIRTIO_NET_F_HASH_REPORT was negotiated and
> > + the device has calculated the hash for the packet, the device fills
> > \field{hash_type} with the type of calculated hash
> > +and \field{hash_value} with the value of calculated hash.
> > +
> > +If VIRTIO_NET_F_HASH_REPORT was negotiated but due to any reason the
> > +has was not calculated, the device sets \field{hash_type} to
> > VIRTIO_NET_HASH_REPORT_NONE.

> has was -> hash was

> > +
> > +Possible values that the device can report in \field{hash_type} are
> > defined below.
> > +They correspond to supported hash types defined in
> > +\ref{sec:Device Types / Network Device / Device Operation / Processing of
> > Incoming Packets / Hash calculation for incoming packets /
> > Supported/enabled hash types}
> > +as follows:
> > +
> > +VIRTIO_NET_HASH_TYPE_XXX = 1 << (VIRTIO_NET_HASH_REPORT_XXX - 1)
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
> > \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device /
> > Device Operation / Control Virtqueue}
> >
> > The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
> > @@ -3928,7 +4084,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device
> > Types / Network Device / Devi
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
> > Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS)
> > / Setting RSS parameters}
> >
> > @@ -3945,7 +4101,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device
> > Types / Network Device / Devi
> > };
> > \end{lstlisting}
> > Field \field{hash_types} contains a bitmask of allowed hash types as
> > -defined in \ref{sec:Device Types / Network Device / Device Operation /
> > Control Virtqueue / Receive-side scaling (RSS) / RSS hash types}.
> > +defined in
> > +\ref{sec:Device Types / Network Device / Device Operation / Processing of
> > Incoming Packets / Hash calculation for incoming packets /
> > Supported/enabled hash types}.
> >
> > Field \field{indirection_table_mask} is a mask to be applied to
> > the calculated hash to produce an index in the
> > @@ -3959,94 +4116,6 @@ \subsubsection{Control Virtqueue}\label{sec:Device
> > Types / Network Device / Devi
> >
> > A driver sets \field{max_tx_vq} to inform a device how many transmit
> > virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
> >
> > -\subparagraph{RSS hash types}\label{sec:Device Types / Network Device /
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
> > -packet has a UDP header, the hash is calculated over the following fields:
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
> > -\item Home address from the home address option in the IPv6 destination
> > options header. If the extension header is not present, use the Source
> > IPv6 address.
> > -\item IPv6 address that is contained in the Routing-Header-Type-2 from the
> > associated extension header. If the extension header is not present, use
> > the Destination IPv6 address.
> > -\item Source TCP port
> > -\item Destination TCP port
> > -\end{itemize}
> > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the
> > -packet has a UDPv6 header, the hash is calculated over the following
> > fields:
> > -\begin{itemize}
> > -\item Home address from the home address option in the IPv6 destination
> > options header. If the extension header is not present, use the Source
> > IPv6 address.
> > -\item IPv6 address that is contained in the Routing-Header-Type-2 from the
> > associated extension header. If the extension header is not present, use
> > the Destination IPv6 address.
> > -\item Source UDP port
> > -\item Destination UDP port
> > -\end{itemize}
> > -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is
> > -calculated over the following fields:
> > -\begin{itemize}
> > -\item Home address from the home address option in the IPv6 destination
> > options header. If the extension header is not present, use the Source
> > IPv6 address.
> > -\item IPv6 address that is contained in the Routing-Header-Type-2 from the
> > associated extension header. If the extension header is not present, use
> > the Destination IPv6 address.
> > -\end{itemize}
> > -\item Else skip IPv6 extension headers and calculate the hash as
> > -defined for an IPv6 packet without extension headers (see \ref{itm:Device
> > Types / Network Device / Device Operation / Control Virtqueue /
> > Receive-side scaling (RSS) / RSS hash types/hash on IPv6 packets without
> > extension headers}).
> > -\end{itemize}
> > -
> > \drivernormative{\subparagraph}{Setting RSS parameters}{Device Types /
> > Network Device / Device Operation / Control Virtqueue / Receive-side
> > scaling (RSS) }
> >
> > A driver MUST NOT send the VIRTIO_NET_CTRL_MQ_RSS_CONFIG command if the
> > feature VIRTIO_NET_F_RSS has not been negotiated.
> > @@ -4057,12 +4126,12 @@ \subsubsection{Control Virtqueue}\label{sec:Device
> > Types / Network Device / Devi
> >
> > A driver MUST use \field{indirection_table_mask} values that are less than
> > \field{rss_max_indirection_table_length} reported by a device.
> >
> > -A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are not
> > supported by a device.
> > +A driver MUST NOT set any VIRTIO_NET_HASH_TYPE_ flags that are not
> > supported by a device.
> >
> > \devicenormative{\subparagraph}{RSS processing}{Device Types / Network
> > Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS)
> > / RSS processing}
> > The device MUST determine the destination queue for a network packet as
> > follows:
> > \begin{itemize}
> > -\item Calculate the hash of the packet as defined in \ref{sec:Device Types
> > / Network Device / Device Operation / Control Virtqueue / Receive-side
> > scaling (RSS) / RSS hash types}
> > +\item Calculate the hash of the packet as defined in \ref{sec:Device Types
> > / Network Device / Device Operation / Processing of Incoming Packets /
> > Hash calculation for incoming packets}.
> > \item If the device did not calculate the hash for the specific packet, the
> > device directs the packet to the receiveq specified by
> > \field{unclassified_queue} of virtio_net_rss_config structure (value of 0
> > corresponds to receiveq1).
> > \item Apply \field{indirection_table_mask} to the calculated hash and use
> > the result as the index in the indirection table to get 0-based number of
> > destination receiveq (value of 0 corresponds to receiveq1).
> > \end{itemize}
> > --
> > 2.17.1
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
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > List Guidelines:
> > https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/

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
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


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

