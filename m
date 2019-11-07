Return-Path: virtio-comment-return-901-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3E4EC985F01
	for <virtio-comment@lists.oasis-open.org>; Thu,  7 Nov 2019 14:25:04 +0000 (UTC)
Date: Thu, 7 Nov 2019 09:24:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191107090856-mutt-send-email-mst@kernel.org>
References: <20191030180846.139034-1-yuri.benditovich@daynix.com>
 <20191030180846.139034-2-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20191030180846.139034-2-yuri.benditovich@daynix.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v3 1/1] virtio-net: define support for
 receive-side scaling
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Oct 30, 2019 at 08:08:46PM +0200, Yuri Benditovich wrote:
> Fixes https://github.com/oasis-tcs/virtio-spec/issues/48


It should be:

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/48
(note the column).

> Added support for RSS receive steering mode.
>=20
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>


Looks good overall.

> ---
>  conformance.tex |   2 +
>  content.tex     | 232 ++++++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 215 insertions(+), 19 deletions(-)
>=20
> diff --git a/conformance.tex b/conformance.tex
> index 0ac58aa..01449c5 100644
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
ion / Control Virtqueue / Receive-side scaling (RSS) }
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
> index 679391e..12dc415 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2752,7 +2752,7 @@ \subsection{Virtqueues}\label{sec:Device Types / Ne=
twork Device / Virtqueues}
>  \item[2N] controlq
>  \end{description}
> =20
> - N=3D1 if VIRTIO_NET_F_MQ is not negotiated, otherwise N is set by
> + N=3D1 if VIRTIO_NET_F_MQ and VIRTIO_NET_F_RSS are not negotiated, other=
wise N is set by

better "neither VIRTIO_NET_F_MQ nor VIRTIO_NET_F_RSS are negotiated".


>   \field{max_virtqueue_pairs}.
> =20
>   controlq only exists if VIRTIO_NET_F_CTRL_VQ set.
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
> +\item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
>  \end{description}
> =20
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / =
Network Device / Feature bits / Legacy Interface: Feature bits}
> @@ -2854,7 +2858,7 @@ \subsubsection{Legacy Interface: Feature bits}\labe=
l{sec:Device Types / Network
>  \subsection{Device configuration layout}\label{sec:Device Types / Networ=
k Device / Device configuration layout}
>  \label{sec:Device Types / Block Device / Feature bits / Device configura=
tion layout}
> =20
> -Three driver-read-only configuration fields are currently defined. The \=
field{mac} address field
> +Device configuration fields are listed below, they are read-only for a d=
river. The \field{mac} address field
>  always exists (though is only valid if VIRTIO_NET_F_MAC is set), and
>  \field{status} only exists if VIRTIO_NET_F_STATUS is set. Two
>  read-only bits (for the driver) are currently defined for the status fie=
ld:
> @@ -2866,23 +2870,58 @@ \subsection{Device configuration layout}\label{se=
c:Device Types / Network Device
>  \end{lstlisting}
> =20
>  The following driver-read-only field, \field{max_virtqueue_pairs} only e=
xists if
> -VIRTIO_NET_F_MQ is set. This field specifies the maximum number
> +VIRTIO_NET_F_MQ or VIRTIO_NET_F_RSS is set. This field specifies the max=
imum number
>  of each of transmit and receive virtqueues (receiveq1\ldots receiveqN
> -and transmitq1\ldots transmitqN respectively) that can be configured onc=
e VIRTIO_NET_F_MQ
> +and transmitq1\ldots transmitqN respectively) that can be configured onc=
e at least one of these features
>  is negotiated.
> =20
>  The following driver-read-only field, \field{mtu} only exists if
>  VIRTIO_NET_F_MTU is set. This field specifies the maximum MTU for the dr=
iver to
>  use.
> =20
> +Two following fields, \field{speed} and \field{duplex} are reserved.
>  \begin{lstlisting}
>  struct virtio_net_config {
>          u8 mac[6];
>          le16 status;
>          le16 max_virtqueue_pairs;
>          le16 mtu;
> +        le32 speed;
> +        u8 duplex;
> +        u8 rss_max_key_size;
> +        le16 rss_max_indirection_table_length;
> +        le32 rss_supported_hash_types;

Looking forward to hash offloading, I propose naming this
supported_hash_types.

>  };
>  \end{lstlisting}
> +\label{sec:Device Types / Network Device / Device configuration layout /=
 RSS}
> +Three following fields, \field{rss_max_key_size}, \field{rss_max_indirec=
tion_table_length}
> +and \field{rss_supported_hash_types} only exist if VIRTIO_NET_F_RSS is s=
et.
> +
> +Field \field{rss_max_key_size} specifies maximal supported length of RSS=
 key in bytes.
> +
> +Field \field{rss_max_indirection_table_length} specifies maximal number =
of 16-bit entries in RSS indirection table.
> +
> +Field \field{rss_supported_hash_types} contains bitmask of supported RSS=
 hash types.
> +
> +Hash types applicable for IPv4 packets:
> +\begin{lstlisting}
> +#define VIRTIO_NET_RSS_HASH_TYPE_IPv4              (1 << 0)
> +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4             (1 << 1)
> +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4             (1 << 2)
> +\end{lstlisting}
> +Hash types applicable for IPv6 packets without extension headers
> +\begin{lstlisting}
> +#define VIRTIO_NET_RSS_HASH_TYPE_IPv6              (1 << 3)
> +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6             (1 << 4)
> +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6             (1 << 5)
> +\end{lstlisting}
> +Hash types applicable for IPv6 packets with extension headers
> +\begin{lstlisting}
> +#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX             (1 << 6)
> +#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX            (1 << 7)
> +#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX            (1 << 8)
> +\end{lstlisting}
> +For exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref{sec:Device=
 Types / Network Device / Device Operation / Control Virtqueue / Receive-si=
de scaling (RSS) / RSS hash types}.
> =20
>  \devicenormative{\subsubsection}{Device configuration layout}{Device Typ=
es / Network Device / Device configuration layout}
> =20
> @@ -2906,6 +2945,12 @@ \subsection{Device configuration layout}\label{sec=
:Device Types / Network Device
>  so without fragmentation, after VIRTIO_NET_F_MTU has been successfully
>  negotiated.
> =20
> +The device MUST set \field{rss_max_key_size} to at least 40, if it offer=
s
> +VIRTIO_NET_F_RSS.
> +
> +The device MUST set \field{rss_max_indirection_table_length} to at least=
 128, if it offers
> +VIRTIO_NET_F_RSS.
> +
>  If the driver negotiates the VIRTIO_NET_F_STANDBY feature, the device MA=
Y act
>  as a standby device for a primary device with the same MAC address.
> =20
> @@ -3675,33 +3720,56 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
e Types / Network Device / Devi
>  with class VIRTIO_NET_CTRL_ANNOUNCE and command VIRTIO_NET_CTRL_ANNOUNCE=
_ACK
>  before marking the buffer as used.
> =20
> -\paragraph{Automatic receive steering in multiqueue mode}\label{sec:Devi=
ce Types / Network Device / Device Operation / Control Virtqueue / Automati=
c receive steering in multiqueue mode}
> +\paragraph{Device operation in multiqueue mode}\label{sec:Device Types /=
 Network Device / Device Operation / Control Virtqueue / Device operation i=
n multiqueue mode}
> =20
> -If the driver negotiates the VIRTIO_NET_F_MQ feature bit (depends
> -on VIRTIO_NET_F_CTRL_VQ), it MAY transmit outgoing packets on one
> -of the multiple transmitq1\ldots transmitqN and ask the device to
> -queue incoming packets into one of the multiple receiveq1\ldots receiveq=
N
> -depending on the packet flow.
> +This specification defines following modes that a device MAY implement f=
or operation with multiple transmit/receive virtqueues:
> +\begin{itemize}
> +\item Automatic receive steering as defined in \ref{sec:Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Automatic receive st=
eering in multiqueue mode}.
> + If a device supports such mode, it offers VIRTIO_NET_F_MQ feature bit.
> +\item Receive-side scaling as defined in \ref{devicenormative:Device Typ=
es / Network Device / Device Operation / Control Virtqueue / Receive-side s=
caling (RSS) / RSS processing}.
> + If a device supports such mode, it offers VIRTIO_NET_F_RSS feature bit.
> +\end{itemize}
> =20
> -\begin{lstlisting}
> -struct virtio_net_ctrl_mq {
> -        le16 virtqueue_pairs;
> -};
> +A device MAY support one of these features or both. The driver MAY negot=
iate any set of these features that the device supports.
> =20
> +Multiqueue is disabled by default.
> +
> +The driver enables multiqueue by


> executing one of commands

sending a command using the \field{class}
VIRTIO_NET_CTRL_MQ.


> depending on selected mode of multiqueue operation.

The \field{command} selects the mode of multiqueue operation,
as follows:

> +\begin{lstlisting}
>  #define VIRTIO_NET_CTRL_MQ    4
>   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0
> + struct virtio_net_ctrl_mq_pairs_set {
> +        le16 virtqueue_pairs;
> + };
> +
>   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN        1
>   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX        0x8000
> +
> + #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
>  \end{lstlisting}
>

Maybe reorder here.
\begin{lstlisting}
 #define VIRTIO_NET_CTRL_MQ    4
 #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0
 #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
\end{lstlisting}

and then move auto steering structure and macros to the Automatic receive s=
teering
paragraph.

 =20
> -Multiqueue is disabled by default. The driver enables multiqueue by
> +In order to enable multiqueue mode with automatic receive steering the d=
river uses VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command with \field{virtqueue_pa=
irs} > 1.


I'd move the virtqueue_pairs command to the automatic steering part.

> +
> +In order to enable multiqueue mode with configurable receive-side steeri=
ng the driver uses RSS VIRTIO_NET_CTRL_MQ_RSS_CONFIG command.
> +
> +In more than one multiqueue mode negotiated, the resulting device config=
uration is defined by the last command sent by the driver.
> +
> +\paragraph{Automatic receive steering in multiqueue mode}\label{sec:Devi=
ce Types / Network Device / Device Operation / Control Virtqueue / Automati=
c receive steering in multiqueue mode}
> +
> +If the driver negotiates the VIRTIO_NET_F_MQ feature bit (depends on VIR=
TIO_NET_F_CTRL_VQ), it MAY transmit outgoing packets on one
> +of the multiple transmitq1\ldots transmitqN and ask the device to
> +queue incoming packets into one of the multiple receiveq1\ldots receiveq=
N
> +depending on the packet flow.
> +
> +
> +The driver enables multiqueue by
>  executing the VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command, specifying
>  the number of the transmit and receive queues to be used up to
>  \field{max_virtqueue_pairs}; subsequently,
>  transmitq1\ldots transmitqn and receiveq1\ldots receiveqn where
>  n=3D\field{virtqueue_pairs} MAY be used.
> =20
> -When multiqueue is enabled, the device MUST use automatic receive steeri=
ng
> +When multiqueue is enabled by VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command, t=
he device MUST use automatic receive steering
>  based on packet flow. Programming of the receive steering
>  classificator is implicit. After the driver transmitted a packet of a
>  flow on transmitqX, the device SHOULD cause incoming packets for that fl=
ow to
> @@ -3709,7 +3777,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
>  no packets have been transmitted yet, the device MAY steer a packet
>  to a random queue out of the specified receiveq1\ldots receiveqn.
> =20
> -Multiqueue is disabled by setting \field{virtqueue_pairs} to 1 (this is
> +Multiqueue is disabled by VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET with \field{vi=
rtqueue_pairs} to 1 (this is
>  the default) and waiting for the device to use the command buffer.
> =20
>  \drivernormative{\subparagraph}{Automatic receive steering in multiqueue=
 mode}{Device Types / Network Device / Device Operation / Control Virtqueue=
 / Automatic receive steering in multiqueue mode}
> @@ -3728,8 +3796,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
> =20
>  \devicenormative{\subparagraph}{Automatic receive steering in multiqueue=
 mode}{Device Types / Network Device / Device Operation / Control Virtqueue=
 / Automatic receive steering in multiqueue mode}
> =20
> -The device MUST queue packets only on any receiveq1 before the=20
> -VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command.
> +The device after initialization of reset MUST queue packets only on rece=
iveq1.
> =20
>  The device MUST NOT queue packets on receive queues greater than
>  \field{virtqueue_pairs} once it has placed the
> @@ -3741,6 +3808,133 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
e Types / Network Device / Devi
>  according to the native endian of the guest rather than
>  (necessarily when not using the legacy interface) little-endian.
> =20
> +\paragraph{Receive-side scaling (RSS)}\label{sec:Device Types / Network =
Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS)}
> +A device offers feature VIRTIO_NET_F_RSS if it supports RSS receive stee=
ring with Toeplitz hash calculation and configurable parameters.
> +
> +A driver queries RSS capabilities of the device by reading device config=
uration as defined in \ref{sec:Device Types / Network Device / Device confi=
guration layout / RSS}
> +
> +\subparagraph{Setting RSS parameters}\label{sec:Device Types / Network D=
evice / Device Operation / Control Virtqueue / Receive-side scaling (RSS) /=
 Setting RSS parameters}
> +
> +Driver sends VIRTIO_NET_CTRL_MQ_RSS_CONFIG command using following forma=
t for \field{command-specific-data}:
> +\begin{lstlisting}
> +struct virtio_net_rss_config {
> +    le32 hash_types;
> +    le16 indirection_table_mask;
> +    le16 unclassified_queue;
> +    le16 indirection_table[indirection_table_length];
> +    le16 max_tx_vq;
> +    u8 hash_key_length;
> +    u8 hash_key_data[hash_key_length];
> +};
> +\end{lstlisting}
> +Field \field{hash_types} contains a bitmask of allowed hash types as
> +defined in \ref{sec:Device Types / Network Device / Device Operation / C=
ontrol Virtqueue / Receive-side scaling (RSS) / RSS hash types}.
> +
> +Field \field{indirection_table_mask} is a mask to be applied to calculat=
ed hash to produce index in \field{indirection_table array}.
> +Number of entries in \field{indirection_table} is (\field{indirection_ta=
ble_mask} + 1).
> +
> +Field \field{unclassified_queue} contains 0-based index of receive virtq=
ueue to place unclassified packets in. Index 0 corresponds to receiveq1.
> +
> +Field \field{indirection_table} contains array of 0-based indices of rec=
eive virtqueus. Index 0 corresponds to receiveq1.
> +
> +Driver indicates how many transmit virtqueues it MAY use, i.e. transmitq=
1 \ldots transmitqN, where N=3D\field{virtqueue_pairs}.
> +
> +A driver sets \field{max_tx_vq} to inform a device how many transmit vir=
tqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
> +
> +\subparagraph{RSS hash types}\label{sec:Device Types / Network Device / =
Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS has=
h types}
> +
> +The device calculates hash on IPv4 packets according to the field \field=
{hash_types} of virtio_net_rss_config structure as follows:
> +\begin{itemize}
> +\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv4 is set and the packet has TCP he=
ader, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IP address
> +\item Destination IP address
> +\item Source TCP port
> +\item Destination TCP port
> +\end{itemize}
> +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set and the packet has U=
DP header, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IP address
> +\item Destination IP address
> +\item Source UDP port
> +\item Destination UDP port
> +\end{itemize}
> +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv4 is set, the hash is calculat=
ed over following fields:
> +\begin{itemize}
> +\item Source IP address
> +\item Destination IP address
> +\end{itemize}
> +\item Else the device does not calculate the hash
> +\end{itemize}
> +
> +The device calculates hash on IPv6 packets without extension headers acc=
ording to the field \field{hash_types} of virtio_net_rss_config structure a=
s follows:
> +\begin{itemize}
> +\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set and the packet has TCPv6 =
header, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IPv6 address
> +\item Destination IPv6 address
> +\item Source TCP port
> +\item Destination TCP port
> +\end{itemize}
> +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is set and the packet has U=
DPv6 header, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IPv6 address
> +\item Destination IPv6 address
> +\item Source UDP port
> +\item Destination UDP port
> +\end{itemize}
> +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv6 is set, the hash is calculat=
ed over following fields:
> +\begin{itemize}
> +\item Source IPv6 address
> +\item Destination IPv6 address
> +\end{itemize}
> +\item Else the device does not calculate the hash
> +\end{itemize}
> +
> +The device calculates hash on IPv6 packets with extension headers accord=
ing to the field \field{hash_types} of virtio_net_rss_config structure as f=
ollows:
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
> +\drivernormative{\subparagraph}{Setting RSS parameters}{Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Receive-side scaling=
 (RSS) }
> +
> +A driver MUST NOT send VIRTIO_NET_CTRL_MQ_RSS_CONFIG command if the feat=
ure VIRTIO_NET_F_RSS has not been negotiated.
> +
> +A driver MUST fill \field{indirection_table} array only with indices of =
enabled queues. Index 0 corresponds to receiveq1.
> +
> +Number of entries in \field{indirection_table} (\field{indirection_table=
_mask} + 1) MUST be a power of two.
> +
> +A driver MUST use \field{indirection_table_mask} values that are less th=
an \field{rss_max_indirection_table_length} reported by a device.
> +
> +A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are not s=
upported by a device.
> +
> +\devicenormative{\subparagraph}{RSS processing}{Device Types / Network D=
evice / Device Operation / Control Virtqueue / Receive-side scaling (RSS) /=
 RSS processing}
> +The device MUST determine destination queue for network packet as follow=
s:
> +\begin{itemize}
> +\item Calculate hash of the packet as defined in \ref{sec:Device Types /=
 Network Device / Device Operation / Control Virtqueue / Receive-side scali=
ng (RSS) / RSS hash types}
> +\item If the device did not calculate the hash for specific packet, the =
device directs the packet to the receiveq specified by \field{unclassified_=
queue} of virtio_net_rss_config structure (value of 0 corresponds to receiv=
eq1).
> +\item Apply \field{indirection_table_mask} to the calculated hash and us=
e the result as the index in the indirection table to get 0-based number of=
 destination receiveq (value of 0 corresponds to receiveq1).
> +\end{itemize}
> +
>  \paragraph{Offloads State Configuration}\label{sec:Device Types / Networ=
k Device / Device Operation / Control Virtqueue / Offloads State Configurat=
ion}
> =20
>  If the VIRTIO_NET_F_CTRL_GUEST_OFFLOADS feature is negotiated, the drive=
r can
> --=20
> 2.17.2
>=20
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


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

