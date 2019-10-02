Return-Path: virtio-comment-return-853-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A1F63985FEB
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Oct 2019 21:27:09 +0000 (UTC)
Date: Wed, 2 Oct 2019 17:26:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191002172615-mutt-send-email-mst@kernel.org>
References: <20191002164139.37819-1-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20191002164139.37819-1-yuri.benditovich@daynix.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH] virtio-net: define support for receive-side scaling
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Oct 02, 2019 at 07:41:39PM +0300, Yuri Benditovich wrote:
> Added support for RSS receive steering mode.
>=20
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>

could you pls list the changes from the previous versions?

> ---
>  conformance.tex |   2 +
>  content.tex     | 170 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 172 insertions(+)
>=20
> diff --git a/conformance.tex b/conformance.tex
> index 0ac58aa..bd31ba3 100644
> --- a/conformance.tex
> +++ b/conformance.tex
> @@ -101,6 +101,7 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
>  \item \ref{drivernormative:Device Types / Network Device / Device Operat=
ion / Control Virtqueue / Gratuitous Packet Sending}
>  \item \ref{drivernormative:Device Types / Network Device / Device Operat=
ion / Control Virtqueue / Automatic receive steering in multiqueue mode}
>  \item \ref{drivernormative:Device Types / Network Device / Device Operat=
ion / Control Virtqueue / Offloads State Configuration / Setting Offloads S=
tate}
> +\item \ref{drivernormative:Device Types / Network Device / Device Operat=
ion / Control Virtqueue / Receive-side scaling (RSS) / Using RSS commands}
>  \end{itemize}
> =20
>  \conformance{\subsection}{Block Driver Conformance}\label{sec:Conformanc=
e / Driver Conformance / Block Driver Conformance}
> @@ -257,6 +258,7 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}
>  \item \ref{devicenormative:Device Types / Network Device / Device Operat=
ion / Control Virtqueue / Setting MAC Address Filtering}
>  \item \ref{devicenormative:Device Types / Network Device / Device Operat=
ion / Control Virtqueue / Gratuitous Packet Sending}
>  \item \ref{devicenormative:Device Types / Network Device / Device Operat=
ion / Control Virtqueue / Automatic receive steering in multiqueue mode}
> +\item \ref{devicenormative:Device Types / Network Device / Device Operat=
ion / Control Virtqueue / Receive-side scaling (RSS) / RSS processing}
>  \end{itemize}
> =20
>  \conformance{\subsection}{Block Device Conformance}\label{sec:Conformanc=
e / Device Conformance / Block Device Conformance}
> diff --git a/content.tex b/content.tex
> index 679391e..5672299 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2811,6 +2811,9 @@ \subsection{Feature bits}\label{sec:Device Types / =
Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
> =20
> +\item[VIRTIO_NET_F_RSS(60)] Device supports RSS (receive-side scaling)
> +    with Toeplitz hash calculation and configurable hash parameters for =
receive steering
> +
>  \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
>      and report number of coalesced segments and duplicated ACKs
> =20
> @@ -2840,6 +2843,7 @@ \subsubsection{Feature bit requirements}\label{sec:=
Device Types / Network Device
>  \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NE=
T_F_HOST_TSO6.
> +\item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_MQ
>  \end{description}
> =20
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / =
Network Device / Feature bits / Legacy Interface: Feature bits}
> @@ -3785,6 +3789,172 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
e Types / Network Device / Devi
>  according to the native endian of the guest rather than
>  (necessarily when not using the legacy interface) little-endian.
> =20
> +\paragraph{Receive-side scaling (RSS)}\label{sec:Device Types / Network =
Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS)}
> +The device indicates presence of this feature if in addition to automati=
c receive steering it supports RSS steering with Toeplitz hash calculation =
and configurable parameters.
> +
> +Driver uses following value as \field{class} for RSS-related commands.
> +\begin{lstlisting}
> +#define VIRTIO_NET_CTRL_RSS              6
> +\end{lstlisting}
> +Driver uses following values as \field{command} for RSS-related commands=
.
> +\begin{lstlisting}
> +#define VIRTIO_NET_CTRL_RSS_QUERY_CAPABILITIES              0
> +#define VIRTIO_NET_CTRL_RSS_SET_PARAMETERS                  1
> +\end{lstlisting}
> +
> +\subparagraph{Querying RSS capabilities}\label{sec:Device Types / Networ=
k Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS=
) / Querying RSS capabilities}
> +
> +Driver sends VIRTIO_NET_CTRL_RSS_QUERY_CAPABILITIES command to query dev=
ice capabilities related to RSS.
> +Device responds the command using following format for \field{command-sp=
ecific-data}:
> +\begin{lstlisting}
> +struct virtio_net_rss_capabilities {
> +    le16 hash_types_v4;  (bitmask of supported hash types for IPv4 packe=
ts)
> +    le16 hash_types_v6;  (bitmask of supported hash types for IPv6 packe=
ts)
> +    le16 max_indirection_table_len; (maximal number of queue indices in =
indirection table)
> +    u8 max_key_length; (maximal length of RSS key in bytes)
> +};
> +\end{lstlisting}
> +To describe supported/enabled hash types device and driver use following=
 definitions:
> +
> +Hash types applicable for IPv4 packets and for IPv6 packets without exte=
nsion headers
> +\begin{lstlisting}
> +#define VIRTIO_NET_RSS_HASH_TYPE_IP              (1 << 0)
> +#define VIRTIO_NET_RSS_HASH_TYPE_TCP             (1 << 1)
> +#define VIRTIO_NET_RSS_HASH_TYPE_UDP             (1 << 2)
> +\end{lstlisting}
> +Hash types applicable for IPv6 packets with extension headers
> +\begin{lstlisting}
> +#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX           (1 << 4) (only for IPv6=
)
> +#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX          (1 << 5) (only for IPv6=
)
> +#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX          (1 << 6) (only for IPv6=
)
> +\end{lstlisting}
> +For exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref{sec:Device=
 Types / Network Device / Device Operation / Control Virtqueue / Receive-si=
de scaling (RSS) / RSS hash types}.
> +
> +\subparagraph{Setting RSS parameters}\label{sec:Device Types / Network D=
evice / Device Operation / Control Virtqueue / Receive-side scaling (RSS) /=
 Setting RSS parameters}
> +
> +Driver sends VIRTIO_NET_CTRL_RSS_SET_PARAMETERS command using following =
format for \field{command-specific-data}:
> +\begin{lstlisting}
> +struct virtio_net_rss_params {
> +    u8 enable_rss;
> +    u8 hash_key_length;
> +    le16 hash_types_v4;  (bitmask of allowed hash types for IPv4 packets=
)
> +    le16 hash_types_v6;  (bitmask of allowed hash types for IPv6 packets=
)
> +    le16 indirection_table_length; (number of queue indices in indirecti=
on_table array)
> +    le16 unclassified_queue; (queue to place unclassified packets in)
> +    le16 indirection_table[indirection_table_length];
> +    u8 hash_key_data[hash_key_length];
> +};
> +
> +\end{lstlisting}
> +Driver sets \field{enable_rss} to 0 to disable RSS processing by the dev=
ice and use automatic steering mode instead.
> +
> +Driver sets \field{enable_rss} to 1 to enable RSS processing by the devi=
ce using provided parameters.
> +
> +\subparagraph{RSS hash types}\label{sec:Device Types / Network Device / =
Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS has=
h types}
> +
> +The device calculates hash on IPv4 packets according to the field \field=
{hash_types_v4} of virtio_net_rss_params structure as follows:
> +\begin{itemize}
> +\item If VIRTIO_NET_RSS_HASH_TYPE_TCP is set and the packet has TCP head=
er, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IP address
> +\item Destination IP address
> +\item Source TCP port
> +\item Destination TCP port
> +\end{itemize}
> +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP is set and the packet has UDP=
 header, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IP address
> +\item Destination IP address
> +\item Source UDP port
> +\item Destination UDP port
> +\end{itemize}
> +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP is set, the hash is calculated=
 over following fields:
> +\begin{itemize}
> +\item Source IP address
> +\item Destination IP address
> +\end{itemize}
> +\item Else the device does not calculate the hash
> +\end{itemize}
> +
> +
> +The device calculates hash on IPv6 packets without extension headers acc=
ording to the field \field{hash_types_v6} of virtio_net_rss_params structur=
e as follows:
> +\begin{itemize}
> +\item If VIRTIO_NET_RSS_HASH_TYPE_TCP is set and the packet has TCPv6 he=
ader, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IPv6 address
> +\item Destination IPv6 address
> +\item Source TCP port
> +\item Destination TCP port
> +\end{itemize}
> +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP is set and the packet has UDP=
v6 header, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IPv6 address
> +\item Destination IPv6 address
> +\item Source UDP port
> +\item Destination UDP port
> +\end{itemize}
> +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP is set, the hash is calculated=
 over following fields:
> +\begin{itemize}
> +\item Source IPv6 address
> +\item Destination IPv6 address
> +\end{itemize}
> +\item Else the device does not calculate the hash
> +\end{itemize}
> +
> +
> +The device calculates hash on IPv6 packets with extension headers accord=
ing to the field \field{hash_types_v6} of virtio_net_rss_params structure a=
s follows:
> +\begin{itemize}
> +\item If VIRTIO_NET_RSS_HASH_TYPE_TCP_EX is set and the packet has TCPv6=
 header, the hash is calculated over following fields:
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
> +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the packet has =
UDPv6 header, the hash is calculated over following fields:
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
> +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is calcula=
ted over following fields:
> +\begin{itemize}
> +\item Home address from the home address option in the IPv6 destination =
options header. If the extension header is not present, use the Source IPv6=
 address.
> +\item IPv6 address that is contained in the Routing-Header-Type-2 from t=
he associated extension header. If the extension header is not present, use=
 the Destination IPv6 address.
> +\end{itemize}
> +\item Else skip IPv6 extension headers and calculate the hash as defined=
 above for IPv6 packet without extension headers
> +\end{itemize}
> +
> +
> +\drivernormative{\subparagraph}{Using RSS commands}{Device Types / Netwo=
rk Device / Device Operation / Control Virtqueue / Receive-side scaling (RS=
S) / Using RSS commands}
> +
> +A driver MUST NOT use RSS commands if the feature VIRTIO_NET_F_RSS has n=
ot been negotiated.
> +
> +A driver MUST NOT set RSS parameters before it successfully enabled oper=
ation with multiple queues.
> +
> +A driver MUST fill \field{indirection_table} array only with indices of =
enabled queues.
> +
> +An \field{indirection_table_length} MUST be power of two.
> +
> +A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are not s=
upported by device.
> +
> +A driver MUST NOT set any bits below for \field{hash_types_v4}:
> +\begin{itemize}
> +\item VIRTIO_NET_RSS_HASH_TYPE_IP_EX
> +\item VIRTIO_NET_RSS_HASH_TYPE_TCP_EX
> +\item VIRTIO_NET_RSS_HASH_TYPE_UDP_EX
> +\end{itemize}
> +
> +\devicenormative{\subparagraph}{RSS processing}{Device Types / Network D=
evice / Device Operation / Control Virtqueue / Receive-side scaling (RSS) /=
 RSS processing}
> +If the device reports support for VIRTIO_NET_F_RSS it MUST support keys =
of at least 40 bytes and indirection table of at least 128 entries.
> +
> +The device MUST determine destination queue for network packet as follow=
s:
> +\begin{itemize}
> +\item Calculate hash of the packet as defined in \ref{sec:Device Types /=
 Network Device / Device Operation / Control Virtqueue / Receive-side scali=
ng (RSS) / RSS hash types}
> +\item If the device did not calculate the hash for specific packet, the =
device directs the packet to the queue specified by \field{unclassified_que=
ue} of virtio_net_rss_params structure
> +\item Apply mask of (indirection_table_length - 1) to the calculated has=
h and use the result as the index in the indirection table to get 0-based n=
umber of destination receive queue
> +\end{itemize}
> =20
>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>  Types / Network Device / Legacy Interface: Framing Requirements}
> --=20
> 2.17.2


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

