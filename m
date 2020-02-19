Return-Path: virtio-comment-return-1065-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7D257985EAA
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Feb 2020 09:12:52 +0000 (UTC)
Date: Wed, 19 Feb 2020 04:12:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200219040122-mutt-send-email-mst@kernel.org>
References: <20200219075337.23191-1-yuri.benditovich@daynix.com>
 <20200219075337.23191-2-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20200219075337.23191-2-yuri.benditovich@daynix.com>
Subject: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: Define per-packet hash reporting
 feature
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Feb 19, 2020 at 09:53:37AM +0200, Yuri Benditovich wrote:
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/66
> Define respective feature bit for virtio-net.
> Extend packet layout to populate hash value and type.
> Move the definition of IP/TCP/UDP header fields to
> calculate the hash out of RSS section to common network
> device section.
>=20
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> ---
>  content.tex | 347 ++++++++++++++++++++++++++++++++++------------------
>  1 file changed, 229 insertions(+), 118 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index b91a132..d7d4e42 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2895,6 +2895,9 @@ \subsection{Feature bits}\label{sec:Device Types / =
Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
> =20
> +\item[VIRTIO_NET_F_HASH_REPORT(57)] Device can report per-packet hash
> +    value and a type of calculated hash.
> +
>  \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \field=
{hdr_len}
>      value. Device benefits from knowing the exact header length.
> =20
> @@ -2995,35 +2998,17 @@ \subsection{Device configuration layout}\label{se=
c:Device Types / Network Device
>          le32 supported_hash_types;
>  };
>  \end{lstlisting}
> -\label{sec:Device Types / Network Device / Device configuration layout /=
 RSS}
> -Three following fields, \field{rss_max_key_size}, \field{rss_max_indirec=
tion_table_length}
> -and \field{supported_hash_types} only exist if VIRTIO_NET_F_RSS is set.
> +The following field, \field{rss_max_key_size} only exist if VIRTIO_NET_F=
_RSS or VIRTIO_NET_F_HASH_REPORT is set.
> +It specifies the maximal supported length of RSS key in bytes.
> =20
> -Field \field{rss_max_key_size} specifies the maximal supported length of=
 RSS key in bytes.
> +The following field, \field{rss_max_indirection_table_length} only exist=
 if VIRTIO_NET_F_RSS is set.
> +It specifies the maximal number of 16-bit entries in RSS indirection tab=
le.
> =20
> -Field \field{rss_max_indirection_table_length} specifies the maximal num=
ber of 16-bit entries in RSS indirection table.
> +The next field, \field{supported_hash_types} exists only if the device s=
upports hash calculation,
> +i.e. if VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT is set.
> =20
> -Field \field{supported_hash_types} contains the bitmask of supported RSS=
 hash types.
> -
> -Hash types applicable for IPv4 packets:
> -\begin{lstlisting}
> -#define VIRTIO_NET_RSS_HASH_TYPE_IPv4              (1 << 0)
> -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4             (1 << 1)
> -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4             (1 << 2)
> -\end{lstlisting}
> -Hash types applicable for IPv6 packets without extension headers
> -\begin{lstlisting}
> -#define VIRTIO_NET_RSS_HASH_TYPE_IPv6              (1 << 3)
> -#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6             (1 << 4)
> -#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6             (1 << 5)
> -\end{lstlisting}
> -Hash types applicable for IPv6 packets with extension headers
> -\begin{lstlisting}
> -#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX             (1 << 6)
> -#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX            (1 << 7)
> -#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX            (1 << 8)
> -\end{lstlisting}
> -For the exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref{sec:De=
vice Types / Network Device / Device Operation / Control Virtqueue / Receiv=
e-side scaling (RSS) / RSS hash types}.
> +Field \field{supported_hash_types} contains the bitmask of supported has=
h types.
> +See \ref{sec:Device Types / Network Device / Device Operation / Processi=
ng of Incoming Packets / Hash calculation for incoming packets / Supported/=
enabled hash types} for details of supported hash types.
> =20
>  \devicenormative{\subsubsection}{Device configuration layout}{Device Typ=
es / Network Device / Device configuration layout}
> =20
> @@ -3048,7 +3033,7 @@ \subsection{Device configuration layout}\label{sec:=
Device Types / Network Device
>  negotiated.
> =20
>  The device MUST set \field{rss_max_key_size} to at least 40, if it offer=
s
> -VIRTIO_NET_F_RSS.
> +VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> =20
>  The device MUST set \field{rss_max_indirection_table_length} to at least=
 128, if it offers
>  VIRTIO_NET_F_RSS.
> @@ -3195,6 +3180,8 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Network Device / Device O
>          le16 csum_start;
>          le16 csum_offset;
>          le16 num_buffers;
> +        le32 hash_value; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
> +        le16 hash_type;  (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
>  };

Just noticed this - it's a bit problematic as it might force
compilers to add 2 bytes of padding at the end. Let's add extra 2 bytes
of padding explicitly?

>  \end{lstlisting}
> =20
> @@ -3517,6 +3504,12 @@ \subsubsection{Processing of Incoming Packets}\lab=
el{sec:Device Types / Network
> =20
>  \end{enumerate}
> =20
> +If applicable, the device calculates per-packet hash for incoming packet=
s as
> +defined in \ref{sec:Device Types / Network Device / Device Operation / P=
rocessing of Incoming Packets / Hash calculation for incoming packets}.
> +
> +If applicable, the device reports hash information for incoming packets =
as
> +defined in \ref{sec:Device Types / Network Device / Device Operation / P=
rocessing of Incoming Packets / Hash reporting for incoming packets}.
> +
>  \devicenormative{\paragraph}{Processing of Incoming Packets}{Device Type=
s / Network Device / Device Operation / Processing of Incoming Packets}
>  \label{devicenormative:Device Types / Network Device / Device Operation =
/ Processing of Packets}%old label for latexdiff
> =20
> @@ -3619,6 +3612,181 @@ \subsubsection{Processing of Incoming Packets}\la=
bel{sec:Device Types / Network
>  If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
>  VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
>  rely on the packet checksum being correct.
> +
> +\paragraph{Hash calculation for incoming packets}
> +\label{sec:Device Types / Network Device / Device Operation / Processing=
 of Incoming Packets / Hash calculation for incoming packets}
> +
> +A device attempts to calculate a per-packet hash in the following cases:
> +\begin{itemize}
> +\item The feature VIRTIO_NET_F_RSS was negotiated. The device uses the h=
ash to determine the receive virtqueue to place incoming packets.
> +\item The feature VIRTIO_NET_F_HASH_REPORT was negotiated. The device re=
ports the hash value and the hash type with the packet.
> +\end{itemize}
> +
> +If the feature VIRTIO_NET_F_RSS was negotiated:
> +\begin{itemize}
> +\item The device uses \field{hash_types} of the virtio_net_rss_config st=
ructure as 'Enabled hash types' bitmask.
> +\item The device uses a key as defined in \field{hash_key_data} and \fie=
ld{hash_key_length} of the virtio_net_rss_config structure (see
> +\ref{sec:Device Types / Network Device / Device Operation / Control Virt=
queue / Receive-side scaling (RSS) / Setting RSS parameters}).
> +\end{itemize}
> +
> +If the feature VIRTIO_NET_F_RSS was not negotiated:
> +\begin{itemize}
> +\item The device uses \field{hash_types} of the virtio_net_hash_config s=
tructure as 'Enabled hash types' bitmask.
> +\item The device uses a key as defined in \field{hash_key_data} and \fie=
ld{hash_key_length} of the virtio_net_hash_config structure (see
> +\ref{sec:Device Types / Network Device / Device Operation / Control Virt=
queue / Automatic receive steering in multiqueue mode / Hash calculation}).
> +\end{itemize}
> +
> +Note that if the device offers VIRTIO_NET_F_HASH_REPORT, even if it supp=
orts only one pair of virtqueues, it MUST support
> +at least one of commands of VIRTIO_NET_CTRL_MQ class to configure report=
ed hash parameters:
> +\begin{itemize}
> +\item If the device offers VIRTIO_NET_F_RSS, it MUST support VIRTIO_NET_=
CTRL_MQ_RSS_CONFIG command per
> + \ref{sec:Device Types / Network Device / Device Operation / Control Vir=
tqueue / Receive-side scaling (RSS) / Setting RSS parameters}.
> +\item Otherwise the device MUST support VIRTIO_NET_CTRL_MQ_HASH_CONFIG c=
ommand per
> + \ref{sec:Device Types / Network Device / Device Operation / Control Vir=
tqueue / Automatic receive steering in multiqueue mode / Hash calculation}.
> +\end{itemize}
> +
> +\subparagraph{Supported/enabled hash types}
> +\label{sec:Device Types / Network Device / Device Operation / Processing=
 of Incoming Packets / Hash calculation for incoming packets / Supported/en=
abled hash types}
> +Hash types applicable for IPv4 packets:
> +\begin{lstlisting}
> +#define VIRTIO_NET_HASH_TYPE_IPv4              (1 << 0)
> +#define VIRTIO_NET_HASH_TYPE_TCPv4             (1 << 1)
> +#define VIRTIO_NET_HASH_TYPE_UDPv4             (1 << 2)
> +\end{lstlisting}
> +Hash types applicable for IPv6 packets without extension headers
> +\begin{lstlisting}
> +#define VIRTIO_NET_HASH_TYPE_IPv6              (1 << 3)
> +#define VIRTIO_NET_HASH_TYPE_TCPv6             (1 << 4)
> +#define VIRTIO_NET_HASH_TYPE_UDPv6             (1 << 5)
> +\end{lstlisting}
> +Hash types applicable for IPv6 packets with extension headers
> +\begin{lstlisting}
> +#define VIRTIO_NET_HASH_TYPE_IP_EX             (1 << 6)
> +#define VIRTIO_NET_HASH_TYPE_TCP_EX            (1 << 7)
> +#define VIRTIO_NET_HASH_TYPE_UDP_EX            (1 << 8)
> +\end{lstlisting}
> +
> +\subparagraph{IPv4 packets}
> +\label{sec:Device Types / Network Device / Device Operation / Processing=
 of Incoming Packets / Hash calculation for incoming packets / IPv4 packets=
}
> +The device calculates the hash on IPv4 packets according to 'Enabled has=
h types' bitmask as follows:
> +\begin{itemize}
> +\item If VIRTIO_NET_HASH_TYPE_TCPv4 is set and the packet has
> +a TCP header, the hash is calculated over the following fields:
> +\begin{itemize}
> +\item Source IP address
> +\item Destination IP address
> +\item Source TCP port
> +\item Destination TCP port
> +\end{itemize}
> +\item Else if VIRTIO_NET_HASH_TYPE_UDPv4 is set and the
> +packet has a UDP header, the hash is calculated over the following field=
s:
> +\begin{itemize}
> +\item Source IP address
> +\item Destination IP address
> +\item Source UDP port
> +\item Destination UDP port
> +\end{itemize}
> +\item Else if VIRTIO_NET_HASH_TYPE_IPv4 is set, the hash is
> +calculated over the following fields:
> +\begin{itemize}
> +\item Source IP address
> +\item Destination IP address
> +\end{itemize}
> +\item Else the device does not calculate the hash
> +\end{itemize}
> +
> +\subparagraph{IPv6 packets without extension header}
> +\label{sec:Device Types / Network Device / Device Operation / Processing=
 of Incoming Packets / Hash calculation for incoming packets / IPv6 packets=
 without extension header}
> +The device calculates the hash on IPv6 packets without extension
> +headers according to 'Enabled hash types' bitmask as follows:
> +\begin{itemize}
> +\item If VIRTIO_NET_HASH_TYPE_TCPv6 is set and the packet has
> +a TCPv6 header, the hash is calculated over the following fields:
> +\begin{itemize}
> +\item Source IPv6 address
> +\item Destination IPv6 address
> +\item Source TCP port
> +\item Destination TCP port
> +\end{itemize}
> +\item Else if VIRTIO_NET_HASH_TYPE_UDPv6 is set and the
> +packet has a UDPv6 header, the hash is calculated over the following fie=
lds:
> +\begin{itemize}
> +\item Source IPv6 address
> +\item Destination IPv6 address
> +\item Source UDP port
> +\item Destination UDP port
> +\end{itemize}
> +\item Else if VIRTIO_NET_HASH_TYPE_IPv6 is set, the hash is
> +calculated over the following fields:
> +\begin{itemize}
> +\item Source IPv6 address
> +\item Destination IPv6 address
> +\end{itemize}
> +\item Else the device does not calculate the hash
> +\end{itemize}
> +
> +\subparagraph{IPv6 packets with extension header}
> +\label{sec:Device Types / Network Device / Device Operation / Processing=
 of Incoming Packets / Hash calculation for incoming packets / IPv6 packets=
 with extension header}
> +The device calculates the hash on IPv6 packets with extension
> +headers according to 'Enabled hash types' bitmask as follows:
> +\begin{itemize}
> +\item If VIRTIO_NET_HASH_TYPE_TCP_EX is set and the packet
> +has a TCPv6 header, the hash is calculated over the following fields:
> +\begin{itemize}
> +\item Home address from the home address option in the IPv6 destination =
options header. If the extension header is not present, use the Source IPv6=
 address.
> +\item IPv6 address that is contained in the Routing-Header-Type-2 from t=
he associated extension header. If the extension header is not present, use=
 the Destination IPv6 address.
> +\item Source TCP port
> +\item Destination TCP port
> +\end{itemize}
> +\item Else if VIRTIO_NET_HASH_TYPE_UDP_EX is set and the
> +packet has a UDPv6 header, the hash is calculated over the following fie=
lds:
> +\begin{itemize}
> +\item Home address from the home address option in the IPv6 destination =
options header. If the extension header is not present, use the Source IPv6=
 address.
> +\item IPv6 address that is contained in the Routing-Header-Type-2 from t=
he associated extension header. If the extension header is not present, use=
 the Destination IPv6 address.
> +\item Source UDP port
> +\item Destination UDP port
> +\end{itemize}
> +\item Else if VIRTIO_NET_HASH_TYPE_IP_EX is set, the hash is
> +calculated over the following fields:
> +\begin{itemize}
> +\item Home address from the home address option in the IPv6 destination =
options header. If the extension header is not present, use the Source IPv6=
 address.
> +\item IPv6 address that is contained in the Routing-Header-Type-2 from t=
he associated extension header. If the extension header is not present, use=
 the Destination IPv6 address.
> +\end{itemize}
> +\item Else skip IPv6 extension headers and calculate the hash as
> +defined for an IPv6 packet without extension headers
> +(see \ref{sec:Device Types / Network Device / Device Operation / Process=
ing of Incoming Packets / Hash calculation for incoming packets / IPv6 pack=
ets without extension header}).
> +\end{itemize}
> +
> +\paragraph{Hash reporting for incoming packets}
> +\label{sec:Device Types / Network Device / Device Operation / Processing=
 of Incoming Packets / Hash reporting for incoming packets}
> +
> +If VIRTIO_NET_F_HASH_REPORT was negotiated and
> + the device has calculated the hash for the packet, the device fills \fi=
eld{hash_type} with the type of calculated hash
> +and \field{hash_value} with the value of calculated hash.
> +
> +If VIRTIO_NET_F_HASH_REPORT was negotiated but due to any reason the
> +hash was not calculated, the device sets \field{hash_type} to VIRTIO_NET=
_HASH_REPORT_NONE.
> +
> +Possible values that the device can report in \field{hash_type} are defi=
ned below.
> +They correspond to supported hash types defined in
> +\ref{sec:Device Types / Network Device / Device Operation / Processing o=
f Incoming Packets / Hash calculation for incoming packets / Supported/enab=
led hash types}
> +as follows:
> +
> +VIRTIO_NET_HASH_TYPE_XXX =3D 1 << (VIRTIO_NET_HASH_REPORT_XXX - 1)


So hash_type is the HASH_REPORT value then? That's quite confusing.
Let's rename to hash_report?


> +
> +\begin{lstlisting}
> +#define VIRTIO_NET_HASH_REPORT_NONE            0
> +#define VIRTIO_NET_HASH_REPORT_IPv4            1
> +#define VIRTIO_NET_HASH_REPORT_TCPv4           2
> +#define VIRTIO_NET_HASH_REPORT_UDPv4           3
> +#define VIRTIO_NET_HASH_REPORT_IPv6            4
> +#define VIRTIO_NET_HASH_REPORT_TCPv6           5
> +#define VIRTIO_NET_HASH_REPORT_UDPv6           6
> +#define VIRTIO_NET_HASH_REPORT_IPv6_EX         7
> +#define VIRTIO_NET_HASH_REPORT_TCPv6_EX        8
> +#define VIRTIO_NET_HASH_REPORT_UDPv6_EX        9
> +\end{lstlisting}
> +
>  \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Devic=
e / Device Operation / Control Virtqueue}
> =20
>  The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
> @@ -3896,6 +4064,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
>  #define VIRTIO_NET_CTRL_MQ    4
>   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0 (for automatic receive=
 steering)
>   #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1 (for configurable rece=
ive steering)
> + #define VIRTIO_NET_CTRL_MQ_HASH_CONFIG         2 (for configurable hash=
 calculation)
>  \end{lstlisting}
> =20
>  If more than one multiqueue mode is negotiated, the resulting device con=
figuration is defined by the last command sent by the driver.
> @@ -3961,10 +4130,37 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
e Types / Network Device / Devi
>  according to the native endian of the guest rather than
>  (necessarily when not using the legacy interface) little-endian.
> =20
> +\subparagraph{Hash calculation}\label{sec:Device Types / Network Device =
/ Device Operation / Control Virtqueue / Automatic receive steering in mult=
iqueue mode / Hash calculation}
> +If VIRTIO_NET_F_HASH_REPORT was negotiated and the device uses automatic=
 receive steering,
> +the device MUST support a command to configure hash calculation paramete=
rs.
> +
> +The driver provides parameters for hash calculation as follows:
> +
> +\field{class} VIRTIO_NET_CTRL_MQ, \field{command} VIRTIO_NET_CTRL_MQ_HAS=
H_CONFIG.
> +
> +The \field{command-specific-data} has following format:
> +\begin{lstlisting}
> +struct virtio_net_hash_config {
> +    le32 hash_types;
> +    le16 reserved[4];
> +    u8 hash_key_length;
> +    u8 hash_key_data[hash_key_length];
> +};
> +\end{lstlisting}
> +Field \field{hash_types} contains a bitmask of allowed hash types as
> +defined in
> +\ref{sec:Device Types / Network Device / Device Operation / Processing o=
f Incoming Packets / Hash calculation for incoming packets / Supported/enab=
led hash types}.
> +Initially the device has all hash types disabled and reports only VIRTIO=
_NET_HASH_REPORT_NONE.
> +
> +Field \field{reserved} MUST contain zeroes. It is defined to make the st=
ructure to match the layout of virtio_net_rss_config structure,
> +defined in \ref{sec:Device Types / Network Device / Device Operation / C=
ontrol Virtqueue / Receive-side scaling (RSS)}.
> +
> +Fields \field{hash_key_length} and \field{hash_key_data} define the key =
to be used in hash calculation.
> +
>  \paragraph{Receive-side scaling (RSS)}\label{sec:Device Types / Network =
Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS)}
>  A device offers the feature VIRTIO_NET_F_RSS if it supports RSS receive =
steering with Toeplitz hash calculation and configurable parameters.
> =20
> -A driver queries RSS capabilities of the device by reading device config=
uration as defined in \ref{sec:Device Types / Network Device / Device confi=
guration layout / RSS}
> +A driver queries RSS capabilities of the device by reading device config=
uration as defined in \ref{sec:Device Types / Network Device / Device confi=
guration layout}
> =20
>  \subparagraph{Setting RSS parameters}\label{sec:Device Types / Network D=
evice / Device Operation / Control Virtqueue / Receive-side scaling (RSS) /=
 Setting RSS parameters}
> =20
> @@ -3981,7 +4177,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
>  };
>  \end{lstlisting}
>  Field \field{hash_types} contains a bitmask of allowed hash types as
> -defined in \ref{sec:Device Types / Network Device / Device Operation / C=
ontrol Virtqueue / Receive-side scaling (RSS) / RSS hash types}.
> +defined in
> +\ref{sec:Device Types / Network Device / Device Operation / Processing o=
f Incoming Packets / Hash calculation for incoming packets / Supported/enab=
led hash types}.
> =20
>  Field \field{indirection_table_mask} is a mask to be applied to
>  the calculated hash to produce an index in the
> @@ -3995,93 +4192,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device=
 Types / Network Device / Devi
> =20
>  A driver sets \field{max_tx_vq} to inform a device how many transmit vir=
tqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
> =20
> -\subparagraph{RSS hash types}\label{sec:Device Types / Network Device / =
Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS has=
h types}
> -
> -The device calculates the hash on IPv4 packets according to the
> -field \field{hash_types} of the virtio_net_rss_config structure as follo=
ws:
> -\begin{itemize}
> -\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv4 is set and the packet has
> -a TCP header, the hash is calculated over the following fields:
> -\begin{itemize}
> -\item Source IP address
> -\item Destination IP address
> -\item Source TCP port
> -\item Destination TCP port
> -\end{itemize}
> -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set and the
> -packet has a UDP header, the hash is calculated over the following field=
s:
> -\begin{itemize}
> -\item Source IP address
> -\item Destination IP address
> -\item Source UDP port
> -\item Destination UDP port
> -\end{itemize}
> -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv4 is set, the hash is
> -calculated over the following fields:
> -\begin{itemize}
> -\item Source IP address
> -\item Destination IP address
> -\end{itemize}
> -\item Else the device does not calculate the hash
> -\end{itemize}
> -
> -\label{itm:Device Types / Network Device / Device Operation / Control Vi=
rtqueue / Receive-side scaling (RSS) / RSS hash types/hash on IPv6 packets =
without extension headers}
> -The device calculates the hash on IPv6 packets without extension
> -headers according to the field \field{hash_types} of the virtio_net_rss_=
config structure as follows:
> -\begin{itemize}
> -\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set and the packet has
> -a TCPv6 header, the hash is calculated over the following fields:
> -\begin{itemize}
> -\item Source IPv6 address
> -\item Destination IPv6 address
> -\item Source TCP port
> -\item Destination TCP port
> -\end{itemize}
> -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is set and the
> -packet has a UDPv6 header, the hash is calculated over the following fie=
lds:
> -\begin{itemize}
> -\item Source IPv6 address
> -\item Destination IPv6 address
> -\item Source UDP port
> -\item Destination UDP port
> -\end{itemize}
> -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv6 is set, the hash is
> -calculated over the following fields:
> -\begin{itemize}
> -\item Source IPv6 address
> -\item Destination IPv6 address
> -\end{itemize}
> -\item Else the device does not calculate the hash
> -\end{itemize}
> -
> -The device calculates the hash on IPv6 packets with extension
> -headers according to the field \field{hash_types} of the virtio_net_rss_=
config structure as follows:
> -\begin{itemize}
> -\item If VIRTIO_NET_RSS_HASH_TYPE_TCP_EX is set and the packet
> -has a TCPv6 header, the hash is calculated over the following fields:
> -\begin{itemize}
> -\item Home address from the home address option in the IPv6 destination =
options header. If the extension header is not present, use the Source IPv6=
 address.
> -\item IPv6 address that is contained in the Routing-Header-Type-2 from t=
he associated extension header. If the extension header is not present, use=
 the Destination IPv6 address.
> -\item Source TCP port
> -\item Destination TCP port
> -\end{itemize}
> -\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the
> -packet has a UDPv6 header, the hash is calculated over the following fie=
lds:
> -\begin{itemize}
> -\item Home address from the home address option in the IPv6 destination =
options header. If the extension header is not present, use the Source IPv6=
 address.
> -\item IPv6 address that is contained in the Routing-Header-Type-2 from t=
he associated extension header. If the extension header is not present, use=
 the Destination IPv6 address.
> -\item Source UDP port
> -\item Destination UDP port
> -\end{itemize}
> -\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is
> -calculated over the following fields:
> -\begin{itemize}
> -\item Home address from the home address option in the IPv6 destination =
options header. If the extension header is not present, use the Source IPv6=
 address.
> -\item IPv6 address that is contained in the Routing-Header-Type-2 from t=
he associated extension header. If the extension header is not present, use=
 the Destination IPv6 address.
> -\end{itemize}
> -\item Else skip IPv6 extension headers and calculate the hash as
> -defined for an IPv6 packet without extension headers (see \ref{itm:Devic=
e Types / Network Device / Device Operation / Control Virtqueue / Receive-s=
ide scaling (RSS) / RSS hash types/hash on IPv6 packets without extension h=
eaders}).
> -\end{itemize}
> +Fields \field{hash_key_length} and \field{hash_key_data} define the key =
to be used in hash calculation.
> =20
>  \drivernormative{\subparagraph}{Setting RSS parameters}{Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Receive-side scaling=
 (RSS) }
> =20
> @@ -4093,12 +4204,12 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
e Types / Network Device / Devi
> =20
>  A driver MUST use \field{indirection_table_mask} values that are less th=
an \field{rss_max_indirection_table_length} reported by a device.
> =20
> -A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are not s=
upported by a device.
> +A driver MUST NOT set any VIRTIO_NET_HASH_TYPE_ flags that are not suppo=
rted by a device.
> =20
>  \devicenormative{\subparagraph}{RSS processing}{Device Types / Network D=
evice / Device Operation / Control Virtqueue / Receive-side scaling (RSS) /=
 RSS processing}
>  The device MUST determine the destination queue for a network packet as =
follows:
>  \begin{itemize}
> -\item Calculate the hash of the packet as defined in \ref{sec:Device Typ=
es / Network Device / Device Operation / Control Virtqueue / Receive-side s=
caling (RSS) / RSS hash types}
> +\item Calculate the hash of the packet as defined in \ref{sec:Device Typ=
es / Network Device / Device Operation / Processing of Incoming Packets / H=
ash calculation for incoming packets}.
>  \item If the device did not calculate the hash for the specific packet, =
the device directs the packet to the receiveq specified by \field{unclassif=
ied_queue} of virtio_net_rss_config structure (value of 0 corresponds to re=
ceiveq1).
>  \item Apply \field{indirection_table_mask} to the calculated hash and us=
e the result as the index in the indirection table to get 0-based number of=
 destination receiveq (value of 0 corresponds to receiveq1).
>  \end{itemize}
> --=20
> 2.17.1


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

