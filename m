Return-Path: virtio-comment-return-931-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E4795985EA5
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Nov 2019 07:34:11 +0000 (UTC)
Date: Fri, 22 Nov 2019 02:34:02 -0500 (EST)
From: Yuri Benditovich <ybendito@redhat.com>
Message-ID: <134107204.10953124.1574408042524.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191112020924-mutt-send-email-mst@kernel.org>
References: <20191112053748.1616272-1-yuri.benditovich@daynix.com> <20191112053748.1616272-2-yuri.benditovich@daynix.com> <20191112020924-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: define support
 for receive-side scaling
Content-Type: multipart/alternative; 
	boundary="----=_Part_10953123_2111715139.1574408042523"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

------=_Part_10953123_2111715139.1574408042523
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

----- Original Message -----

> From: "Michael S. Tsirkin" <mst@redhat.com>
> To: "Yuri Benditovich" <yuri.benditovich@daynix.com>
> Cc: virtio-comment@lists.oasis-open.org
> Sent: Tuesday, November 12, 2019 9:10:38 AM
> Subject: [virtio-comment] Re: [PATCH v4 1/1] virtio-net: define support f=
or
> receive-side scaling

> On Tue, Nov 12, 2019 at 07:37:48AM +0200, Yuri Benditovich wrote:
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/48
> > Added support for RSS receive steering mode.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>

> Looks good to me.
> Big change and some people could be at DPDK conf,
> so pls give it a week or so, then request voting if no more
> comments.
> Thanks!

Please vote, if possible.=20
Thanks=20

> > ---
> > conformance.tex | 2 +
> > content.tex | 234 +++++++++++++++++++++++++++++++++++++++++++-----
> > 2 files changed, 213 insertions(+), 23 deletions(-)
> >
> > diff --git a/conformance.tex b/conformance.tex
> > index 0ac58aa..01449c5 100644
> > --- a/conformance.tex
> > +++ b/conformance.tex
> > @@ -101,6 +101,7 @@ \section{Conformance Targets}\label{sec:Conformance=
 /
> > Conformance Targets}
> > \item \ref{drivernormative:Device Types / Network Device / Device Opera=
tion
> > / Control Virtqueue / Gratuitous Packet Sending}
> > \item \ref{drivernormative:Device Types / Network Device / Device Opera=
tion
> > / Control Virtqueue / Automatic receive steering in multiqueue mode}
> > \item \ref{drivernormative:Device Types / Network Device / Device Opera=
tion
> > / Control Virtqueue / Offloads State Configuration / Setting Offloads
> > State}
> > +\item \ref{drivernormative:Device Types / Network Device / Device
> > Operation / Control Virtqueue / Receive-side scaling (RSS) }
> > \end{itemize}
> >
> > \conformance{\subsection}{Block Driver Conformance}\label{sec:Conforman=
ce /
> > Driver Conformance / Block Driver Conformance}
> > @@ -257,6 +258,7 @@ \section{Conformance Targets}\label{sec:Conformance=
 /
> > Conformance Targets}
> > \item \ref{devicenormative:Device Types / Network Device / Device Opera=
tion
> > / Control Virtqueue / Setting MAC Address Filtering}
> > \item \ref{devicenormative:Device Types / Network Device / Device Opera=
tion
> > / Control Virtqueue / Gratuitous Packet Sending}
> > \item \ref{devicenormative:Device Types / Network Device / Device Opera=
tion
> > / Control Virtqueue / Automatic receive steering in multiqueue mode}
> > +\item \ref{devicenormative:Device Types / Network Device / Device
> > Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS
> > processing}
> > \end{itemize}
> >
> > \conformance{\subsection}{Block Device Conformance}\label{sec:Conforman=
ce /
> > Device Conformance / Block Device Conformance}
> > diff --git a/content.tex b/content.tex
> > index 679391e..7a7abd2 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2752,7 +2752,7 @@ \subsection{Virtqueues}\label{sec:Device Types /
> > Network Device / Virtqueues}
> > \item[2N] controlq
> > \end{description}
> >
> > - N=3D1 if VIRTIO_NET_F_MQ is not negotiated, otherwise N is set by
> > + N=3D1 if neither VIRTIO_NET_F_MQ nor VIRTIO_NET_F_RSS are negotiated,
> > otherwise N is set by
> > \field{max_virtqueue_pairs}.
> >
> > controlq only exists if VIRTIO_NET_F_CTRL_VQ set.
> > @@ -2811,6 +2811,9 @@ \subsection{Feature bits}\label{sec:Device Types =
/
> > Network Device / Feature bits
> > \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
> > channel.
> >
> > +\item[VIRTIO_NET_F_RSS(60)] Device supports RSS (receive-side scaling)
> > + with Toeplitz hash calculation and configurable hash parameters for
> > receive steering
> > +
> > \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
> > and report number of coalesced segments and duplicated ACKs
> >
> > @@ -2840,6 +2843,7 @@ \subsubsection{Feature bit
> > requirements}\label{sec:Device Types / Network Device
> > \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
> > \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
> > \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or
> > VIRTIO_NET_F_HOST_TSO6.
> > +\item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
> > \end{description}
> >
> > \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types /
> > Network Device / Feature bits / Legacy Interface: Feature bits}
> > @@ -2854,7 +2858,7 @@ \subsubsection{Legacy Interface: Feature
> > bits}\label{sec:Device Types / Network
> > \subsection{Device configuration layout}\label{sec:Device Types / Netwo=
rk
> > Device / Device configuration layout}
> > \label{sec:Device Types / Block Device / Feature bits / Device
> > configuration layout}
> >
> > -Three driver-read-only configuration fields are currently defined. The
> > \field{mac} address field
> > +Device configuration fields are listed below, they are read-only for a
> > driver. The \field{mac} address field
> > always exists (though is only valid if VIRTIO_NET_F_MAC is set), and
> > \field{status} only exists if VIRTIO_NET_F_STATUS is set. Two
> > read-only bits (for the driver) are currently defined for the status fi=
eld:
> > @@ -2866,23 +2870,58 @@ \subsection{Device configuration
> > layout}\label{sec:Device Types / Network Device
> > \end{lstlisting}
> >
> > The following driver-read-only field, \field{max_virtqueue_pairs} only
> > exists if
> > -VIRTIO_NET_F_MQ is set. This field specifies the maximum number
> > +VIRTIO_NET_F_MQ or VIRTIO_NET_F_RSS is set. This field specifies the
> > maximum number
> > of each of transmit and receive virtqueues (receiveq1\ldots receiveqN
> > -and transmitq1\ldots transmitqN respectively) that can be configured o=
nce
> > VIRTIO_NET_F_MQ
> > +and transmitq1\ldots transmitqN respectively) that can be configured o=
nce
> > at least one of these features
> > is negotiated.
> >
> > The following driver-read-only field, \field{mtu} only exists if
> > VIRTIO_NET_F_MTU is set. This field specifies the maximum MTU for the
> > driver to
> > use.
> >
> > +Two following fields, \field{speed} and \field{duplex} are reserved.
> > \begin{lstlisting}
> > struct virtio_net_config {
> > u8 mac[6];
> > le16 status;
> > le16 max_virtqueue_pairs;
> > le16 mtu;
> > + le32 speed;
> > + u8 duplex;
> > + u8 rss_max_key_size;
> > + le16 rss_max_indirection_table_length;
> > + le32 supported_hash_types;
> > };
> > \end{lstlisting}
> > +\label{sec:Device Types / Network Device / Device configuration layout=
 /
> > RSS}
> > +Three following fields, \field{rss_max_key_size},
> > \field{rss_max_indirection_table_length}
> > +and \field{supported_hash_types} only exist if VIRTIO_NET_F_RSS is set=
.
> > +
> > +Field \field{rss_max_key_size} specifies maximal supported length of R=
SS
> > key in bytes.
> > +
> > +Field \field{rss_max_indirection_table_length} specifies maximal numbe=
r of
> > 16-bit entries in RSS indirection table.
> > +
> > +Field \field{supported_hash_types} contains bitmask of supported RSS h=
ash
> > types.
> > +
> > +Hash types applicable for IPv4 packets:
> > +\begin{lstlisting}
> > +#define VIRTIO_NET_RSS_HASH_TYPE_IPv4 (1 << 0)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4 (1 << 1)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4 (1 << 2)
> > +\end{lstlisting}
> > +Hash types applicable for IPv6 packets without extension headers
> > +\begin{lstlisting}
> > +#define VIRTIO_NET_RSS_HASH_TYPE_IPv6 (1 << 3)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6 (1 << 4)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6 (1 << 5)
> > +\end{lstlisting}
> > +Hash types applicable for IPv6 packets with extension headers
> > +\begin{lstlisting}
> > +#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX (1 << 6)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX (1 << 7)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX (1 << 8)
> > +\end{lstlisting}
> > +For exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref{sec:Devi=
ce
> > Types / Network Device / Device Operation / Control Virtqueue /
> > Receive-side scaling (RSS) / RSS hash types}.
> >
> > \devicenormative{\subsubsection}{Device configuration layout}{Device Ty=
pes
> > / Network Device / Device configuration layout}
> >
> > @@ -2906,6 +2945,12 @@ \subsection{Device configuration
> > layout}\label{sec:Device Types / Network Device
> > so without fragmentation, after VIRTIO_NET_F_MTU has been successfully
> > negotiated.
> >
> > +The device MUST set \field{rss_max_key_size} to at least 40, if it off=
ers
> > +VIRTIO_NET_F_RSS.
> > +
> > +The device MUST set \field{rss_max_indirection_table_length} to at lea=
st
> > 128, if it offers
> > +VIRTIO_NET_F_RSS.
> > +
> > If the driver negotiates the VIRTIO_NET_F_STANDBY feature, the device M=
AY
> > act
> > as a standby device for a primary device with the same MAC address.
> >
> > @@ -3675,33 +3720,52 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice
> > Types / Network Device / Devi
> > with class VIRTIO_NET_CTRL_ANNOUNCE and command
> > VIRTIO_NET_CTRL_ANNOUNCE_ACK
> > before marking the buffer as used.
> >
> > -\paragraph{Automatic receive steering in multiqueue mode}\label{sec:De=
vice
> > Types / Network Device / Device Operation / Control Virtqueue / Automat=
ic
> > receive steering in multiqueue mode}
> > +\paragraph{Device operation in multiqueue mode}\label{sec:Device Types=
 /
> > Network Device / Device Operation / Control Virtqueue / Device operatio=
n
> > in multiqueue mode}
> >
> > -If the driver negotiates the VIRTIO_NET_F_MQ feature bit (depends
> > -on VIRTIO_NET_F_CTRL_VQ), it MAY transmit outgoing packets on one
> > -of the multiple transmitq1\ldots transmitqN and ask the device to
> > -queue incoming packets into one of the multiple receiveq1\ldots receiv=
eqN
> > -depending on the packet flow.
> > +This specification defines following modes that a device MAY implement=
 for
> > operation with multiple transmit/receive virtqueues:
> > +\begin{itemize}
> > +\item Automatic receive steering as defined in \ref{sec:Device Types /
> > Network Device / Device Operation / Control Virtqueue / Automatic recei=
ve
> > steering in multiqueue mode}.
> > + If a device supports such mode, it offers VIRTIO_NET_F_MQ feature bit=
.
> > +\item Receive-side scaling as defined in \ref{devicenormative:Device T=
ypes
> > / Network Device / Device Operation / Control Virtqueue / Receive-side
> > scaling (RSS) / RSS processing}.
> > + If a device supports such mode, it offers VIRTIO_NET_F_RSS feature bi=
t.
> > +\end{itemize}
> >
> > -\begin{lstlisting}
> > -struct virtio_net_ctrl_mq {
> > - le16 virtqueue_pairs;
> > -};
> > +A device MAY support one of these features or both. The driver MAY
> > negotiate any set of these features that the device supports.
> >
> > +Multiqueue is disabled by default.
> > +
> > +The driver enables multiqueue by sending a command using \field{class}
> > VIRTIO_NET_CTRL_MQ. The \field{command} selects the mode of multiqueue
> > operation, as follows:
> > +\begin{lstlisting}
> > #define VIRTIO_NET_CTRL_MQ 4
> > - #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET 0
> > - #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN 1
> > - #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX 0x8000
> > + #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET 0 (for automatic receive
> > steering)
> > + #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG 1 (for configurable receive
> > steering)
> > \end{lstlisting}
> >
> > -Multiqueue is disabled by default. The driver enables multiqueue by
> > -executing the VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command, specifying
> > +If more than one multiqueue mode negotiated, the resulting device
> > configuration is defined by the last command sent by the driver.
> > +
> > +\paragraph{Automatic receive steering in multiqueue mode}\label{sec:De=
vice
> > Types / Network Device / Device Operation / Control Virtqueue / Automat=
ic
> > receive steering in multiqueue mode}
> > +
> > +If the driver negotiates the VIRTIO_NET_F_MQ feature bit (depends on
> > VIRTIO_NET_F_CTRL_VQ), it MAY transmit outgoing packets on one
> > +of the multiple transmitq1\ldots transmitqN and ask the device to
> > +queue incoming packets into one of the multiple receiveq1\ldots receiv=
eqN
> > +depending on the packet flow.
> > +
> > +The driver enables multiqueue by
> > +sending the VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command, specifying
> > the number of the transmit and receive queues to be used up to
> > \field{max_virtqueue_pairs}; subsequently,
> > transmitq1\ldots transmitqn and receiveq1\ldots receiveqn where
> > n=3D\field{virtqueue_pairs} MAY be used.
> > +\begin{lstlisting}
> > +struct virtio_net_ctrl_mq_pairs_set {
> > + le16 virtqueue_pairs;
> > +};
> > +#define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN 1
> > +#define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX 0x8000
> >
> > -When multiqueue is enabled, the device MUST use automatic receive stee=
ring
> > +\end{lstlisting}
> > +
> > +When multiqueue is enabled by VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command,=
 the
> > device MUST use automatic receive steering
> > based on packet flow. Programming of the receive steering
> > classificator is implicit. After the driver transmitted a packet of a
> > flow on transmitqX, the device SHOULD cause incoming packets for that f=
low
> > to
> > @@ -3709,7 +3773,7 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
e
> > Types / Network Device / Devi
> > no packets have been transmitted yet, the device MAY steer a packet
> > to a random queue out of the specified receiveq1\ldots receiveqn.
> >
> > -Multiqueue is disabled by setting \field{virtqueue_pairs} to 1 (this i=
s
> > +Multiqueue is disabled by VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET with
> > \field{virtqueue_pairs} to 1 (this is
> > the default) and waiting for the device to use the command buffer.
> >
> > \drivernormative{\subparagraph}{Automatic receive steering in multiqueu=
e
> > mode}{Device Types / Network Device / Device Operation / Control Virtqu=
eue
> > / Automatic receive steering in multiqueue mode}
> > @@ -3728,8 +3792,7 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
e
> > Types / Network Device / Devi
> >
> > \devicenormative{\subparagraph}{Automatic receive steering in multiqueu=
e
> > mode}{Device Types / Network Device / Device Operation / Control Virtqu=
eue
> > / Automatic receive steering in multiqueue mode}
> >
> > -The device MUST queue packets only on any receiveq1 before the
> > -VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command.
> > +The device after initialization of reset MUST queue packets only on
> > receiveq1.
> >
> > The device MUST NOT queue packets on receive queues greater than
> > \field{virtqueue_pairs} once it has placed the
> > @@ -3741,6 +3804,131 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice
> > Types / Network Device / Devi
> > according to the native endian of the guest rather than
> > (necessarily when not using the legacy interface) little-endian.
> >
> > +\paragraph{Receive-side scaling (RSS)}\label{sec:Device Types / Networ=
k
> > Device / Device Operation / Control Virtqueue / Receive-side scaling
> > (RSS)}
> > +A device offers feature VIRTIO_NET_F_RSS if it supports RSS receive
> > steering with Toeplitz hash calculation and configurable parameters.
> > +
> > +A driver queries RSS capabilities of the device by reading device
> > configuration as defined in \ref{sec:Device Types / Network Device /
> > Device configuration layout / RSS}
> > +
> > +\subparagraph{Setting RSS parameters}\label{sec:Device Types / Network
> > Device / Device Operation / Control Virtqueue / Receive-side scaling (R=
SS)
> > / Setting RSS parameters}
> > +
> > +Driver sends VIRTIO_NET_CTRL_MQ_RSS_CONFIG command using following for=
mat
> > for \field{command-specific-data}:
> > +\begin{lstlisting}
> > +struct virtio_net_rss_config {
> > + le32 hash_types;
> > + le16 indirection_table_mask;
> > + le16 unclassified_queue;
> > + le16 indirection_table[indirection_table_length];
> > + le16 max_tx_vq;
> > + u8 hash_key_length;
> > + u8 hash_key_data[hash_key_length];
> > +};
> > +\end{lstlisting}
> > +Field \field{hash_types} contains a bitmask of allowed hash types as
> > +defined in \ref{sec:Device Types / Network Device / Device Operation /
> > Control Virtqueue / Receive-side scaling (RSS) / RSS hash types}.
> > +
> > +Field \field{indirection_table_mask} is a mask to be applied to calcul=
ated
> > hash to produce index in \field{indirection_table array}.
> > +Number of entries in \field{indirection_table} is
> > (\field{indirection_table_mask} + 1).
> > +
> > +Field \field{unclassified_queue} contains 0-based index of receive
> > virtqueue to place unclassified packets in. Index 0 corresponds to
> > receiveq1.
> > +
> > +Field \field{indirection_table} contains array of 0-based indices of
> > receive virtqueus. Index 0 corresponds to receiveq1.
> > +
> > +A driver sets \field{max_tx_vq} to inform a device how many transmit
> > virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
> > +
> > +\subparagraph{RSS hash types}\label{sec:Device Types / Network Device =
/
> > Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS
> > hash types}
> > +
> > +The device calculates hash on IPv4 packets according to the field
> > \field{hash_types} of virtio_net_rss_config structure as follows:
> > +\begin{itemize}
> > +\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv4 is set and the packet has TCP
> > header, the hash is calculated over following fields:
> > +\begin{itemize}
> > +\item Source IP address
> > +\item Destination IP address
> > +\item Source TCP port
> > +\item Destination TCP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set and the packet has=
 UDP
> > header, the hash is calculated over following fields:
> > +\begin{itemize}
> > +\item Source IP address
> > +\item Destination IP address
> > +\item Source UDP port
> > +\item Destination UDP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv4 is set, the hash is calcul=
ated
> > over following fields:
> > +\begin{itemize}
> > +\item Source IP address
> > +\item Destination IP address
> > +\end{itemize}
> > +\item Else the device does not calculate the hash
> > +\end{itemize}
> > +
> > +The device calculates hash on IPv6 packets without extension headers
> > according to the field \field{hash_types} of virtio_net_rss_config
> > structure as follows:
> > +\begin{itemize}
> > +\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set and the packet has TCPv=
6
> > header, the hash is calculated over following fields:
> > +\begin{itemize}
> > +\item Source IPv6 address
> > +\item Destination IPv6 address
> > +\item Source TCP port
> > +\item Destination TCP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is set and the packet has
> > UDPv6 header, the hash is calculated over following fields:
> > +\begin{itemize}
> > +\item Source IPv6 address
> > +\item Destination IPv6 address
> > +\item Source UDP port
> > +\item Destination UDP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv6 is set, the hash is calcul=
ated
> > over following fields:
> > +\begin{itemize}
> > +\item Source IPv6 address
> > +\item Destination IPv6 address
> > +\end{itemize}
> > +\item Else the device does not calculate the hash
> > +\end{itemize}
> > +
> > +The device calculates hash on IPv6 packets with extension headers
> > according to the field \field{hash_types} of virtio_net_rss_config
> > structure as follows:
> > +\begin{itemize}
> > +\item If VIRTIO_NET_RSS_HASH_TYPE_TCP_EX is set and the packet has TCP=
v6
> > header, the hash is calculated over following fields:
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
> > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the packet ha=
s
> > UDPv6 header, the hash is calculated over following fields:
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
> > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is
> > calculated over following fields:
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
> > +\item Else skip IPv6 extension headers and calculate the hash as defin=
ed
> > above for IPv6 packet without extension headers
> > +\end{itemize}
> > +
> > +\drivernormative{\subparagraph}{Setting RSS parameters}{Device Types /
> > Network Device / Device Operation / Control Virtqueue / Receive-side
> > scaling (RSS) }
> > +
> > +A driver MUST NOT send VIRTIO_NET_CTRL_MQ_RSS_CONFIG command if the
> > feature VIRTIO_NET_F_RSS has not been negotiated.
> > +
> > +A driver MUST fill \field{indirection_table} array only with indices o=
f
> > enabled queues. Index 0 corresponds to receiveq1.
> > +
> > +Number of entries in \field{indirection_table}
> > (\field{indirection_table_mask} + 1) MUST be a power of two.
> > +
> > +A driver MUST use \field{indirection_table_mask} values that are less =
than
> > \field{rss_max_indirection_table_length} reported by a device.
> > +
> > +A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are not
> > supported by a device.
> > +
> > +\devicenormative{\subparagraph}{RSS processing}{Device Types / Network
> > Device / Device Operation / Control Virtqueue / Receive-side scaling (R=
SS)
> > / RSS processing}
> > +The device MUST determine destination queue for network packet as foll=
ows:
> > +\begin{itemize}
> > +\item Calculate hash of the packet as defined in \ref{sec:Device Types=
 /
> > Network Device / Device Operation / Control Virtqueue / Receive-side
> > scaling (RSS) / RSS hash types}
> > +\item If the device did not calculate the hash for specific packet, th=
e
> > device directs the packet to the receiveq specified by
> > \field{unclassified_queue} of virtio_net_rss_config structure (value of=
 0
> > corresponds to receiveq1).
> > +\item Apply \field{indirection_table_mask} to the calculated hash and =
use
> > the result as the index in the indirection table to get 0-based number =
of
> > destination receiveq (value of 0 corresponds to receiveq1).
> > +\end{itemize}
> > +
> > \paragraph{Offloads State Configuration}\label{sec:Device Types / Netwo=
rk
> > Device / Device Operation / Control Virtqueue / Offloads State
> > Configuration}
> >
> > If the VIRTIO_NET_F_CTRL_GUEST_OFFLOADS feature is negotiated, the driv=
er
> > can
> > --
> > 2.17.2

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

------=_Part_10953123_2111715139.1574408042523
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
ment@lists.oasis-open.org<br><b>Sent: </b>Tuesday, November 12, 2019 9:10:3=
8 AM<br><b>Subject: </b>[virtio-comment] Re: [PATCH v4 1/1] virtio-net: def=
ine support for receive-side scaling<br><div><br></div>On Tue, Nov 12, 2019=
 at 07:37:48AM +0200, Yuri Benditovich wrote:<br>&gt; Fixes: https://github=
.com/oasis-tcs/virtio-spec/issues/48<br>&gt; Added support for RSS receive =
steering mode.<br>&gt; <br>&gt; Signed-off-by: Yuri Benditovich &lt;yuri.be=
nditovich@daynix.com&gt;<br><div><br></div><br>Looks good to me.<br>Big cha=
nge and some people could be at DPDK conf,<br>so pls give it a week or so, =
then request voting if no more<br>comments.<br>Thanks!<br></blockquote><div=
>Please vote, if possible.<br></div><div>Thanks<br></div><div><br></div><di=
v><br></div><blockquote style=3D"border-left:2px solid #1010FF;margin-left:=
5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;text-d=
ecoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" data=
-mce-style=3D"border-left: 2px solid #1010FF; margin-left: 5px; padding-lef=
t: 5px; color: #000; font-weight: normal; font-style: normal; text-decorati=
on: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;">&gt; -=
--<br>&gt; &nbsp;conformance.tex | &nbsp; 2 +<br>&gt; &nbsp;content.tex &nb=
sp; &nbsp; | 234 +++++++++++++++++++++++++++++++++++++++++++-----<br>&gt; &=
nbsp;2 files changed, 213 insertions(+), 23 deletions(-)<br>&gt; <br>&gt; d=
iff --git a/conformance.tex b/conformance.tex<br>&gt; index 0ac58aa..01449c=
5 100644<br>&gt; --- a/conformance.tex<br>&gt; +++ b/conformance.tex<br>&gt=
; @@ -101,6 +101,7 @@ \section{Conformance Targets}\label{sec:Conformance /=
 Conformance Targets}<br>&gt; &nbsp;\item \ref{drivernormative:Device Types=
 / Network Device / Device Operation / Control Virtqueue / Gratuitous Packe=
t Sending}<br>&gt; &nbsp;\item \ref{drivernormative:Device Types / Network =
Device / Device Operation / Control Virtqueue / Automatic receive steering =
in multiqueue mode}<br>&gt; &nbsp;\item \ref{drivernormative:Device Types /=
 Network Device / Device Operation / Control Virtqueue / Offloads State Con=
figuration / Setting Offloads State}<br>&gt; +\item \ref{drivernormative:De=
vice Types / Network Device / Device Operation / Control Virtqueue / Receiv=
e-side scaling (RSS) }<br>&gt; &nbsp;\end{itemize}<br>&gt; &nbsp;<br>&gt; &=
nbsp;\conformance{\subsection}{Block Driver Conformance}\label{sec:Conforma=
nce / Driver Conformance / Block Driver Conformance}<br>&gt; @@ -257,6 +258=
,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Tar=
gets}<br>&gt; &nbsp;\item \ref{devicenormative:Device Types / Network Devic=
e / Device Operation / Control Virtqueue / Setting MAC Address Filtering}<b=
r>&gt; &nbsp;\item \ref{devicenormative:Device Types / Network Device / Dev=
ice Operation / Control Virtqueue / Gratuitous Packet Sending}<br>&gt; &nbs=
p;\item \ref{devicenormative:Device Types / Network Device / Device Operati=
on / Control Virtqueue / Automatic receive steering in multiqueue mode}<br>=
&gt; +\item \ref{devicenormative:Device Types / Network Device / Device Ope=
ration / Control Virtqueue / Receive-side scaling (RSS) / RSS processing}<b=
r>&gt; &nbsp;\end{itemize}<br>&gt; &nbsp;<br>&gt; &nbsp;\conformance{\subse=
ction}{Block Device Conformance}\label{sec:Conformance / Device Conformance=
 / Block Device Conformance}<br>&gt; diff --git a/content.tex b/content.tex=
<br>&gt; index 679391e..7a7abd2 100644<br>&gt; --- a/content.tex<br>&gt; ++=
+ b/content.tex<br>&gt; @@ -2752,7 +2752,7 @@ \subsection{Virtqueues}\label=
{sec:Device Types / Network Device / Virtqueues}<br>&gt; &nbsp;\item[2N] co=
ntrolq<br>&gt; &nbsp;\end{description}<br>&gt; &nbsp;<br>&gt; - N=3D1 if VI=
RTIO_NET_F_MQ is not negotiated, otherwise N is set by<br>&gt; + N=3D1 if n=
either VIRTIO_NET_F_MQ nor VIRTIO_NET_F_RSS are negotiated, otherwise N is =
set by<br>&gt; &nbsp; \field{max_virtqueue_pairs}.<br>&gt; &nbsp;<br>&gt; &=
nbsp; controlq only exists if VIRTIO_NET_F_CTRL_VQ set.<br>&gt; @@ -2811,6 =
+2811,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Devic=
e / Feature bits<br>&gt; &nbsp;\item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MA=
C address through control<br>&gt; &nbsp; &nbsp; &nbsp;channel.<br>&gt; &nbs=
p;<br>&gt; +\item[VIRTIO_NET_F_RSS(60)] Device supports RSS (receive-side s=
caling)<br>&gt; + &nbsp; &nbsp;with Toeplitz hash calculation and configura=
ble hash parameters for receive steering<br>&gt; +<br>&gt; &nbsp;\item[VIRT=
IO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs<br>&gt; &nbsp; &nb=
sp; &nbsp;and report number of coalesced segments and duplicated ACKs<br>&g=
t; &nbsp;<br>&gt; @@ -2840,6 +2843,7 @@ \subsubsection{Feature bit requirem=
ents}\label{sec:Device Types / Network Device<br>&gt; &nbsp;\item[VIRTIO_NE=
T_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.<br>&gt; &nbsp;\item[VIRTIO_NET_F_CTR=
L_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.<br>&gt; &nbsp;\item[VIRTIO_NET_F=
_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.<br>&gt=
; +\item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.<br>&gt; &nbsp;\en=
d{description}<br>&gt; &nbsp;<br>&gt; &nbsp;\subsubsection{Legacy Interface=
: Feature bits}\label{sec:Device Types / Network Device / Feature bits / Le=
gacy Interface: Feature bits}<br>&gt; @@ -2854,7 +2858,7 @@ \subsubsection{=
Legacy Interface: Feature bits}\label{sec:Device Types / Network<br>&gt; &n=
bsp;\subsection{Device configuration layout}\label{sec:Device Types / Netwo=
rk Device / Device configuration layout}<br>&gt; &nbsp;\label{sec:Device Ty=
pes / Block Device / Feature bits / Device configuration layout}<br>&gt; &n=
bsp;<br>&gt; -Three driver-read-only configuration fields are currently def=
ined. The \field{mac} address field<br>&gt; +Device configuration fields ar=
e listed below, they are read-only for a driver. The \field{mac} address fi=
eld<br>&gt; &nbsp;always exists (though is only valid if VIRTIO_NET_F_MAC i=
s set), and<br>&gt; &nbsp;\field{status} only exists if VIRTIO_NET_F_STATUS=
 is set. Two<br>&gt; &nbsp;read-only bits (for the driver) are currently de=
fined for the status field:<br>&gt; @@ -2866,23 +2870,58 @@ \subsection{Dev=
ice configuration layout}\label{sec:Device Types / Network Device<br>&gt; &=
nbsp;\end{lstlisting}<br>&gt; &nbsp;<br>&gt; &nbsp;The following driver-rea=
d-only field, \field{max_virtqueue_pairs} only exists if<br>&gt; -VIRTIO_NE=
T_F_MQ is set. This field specifies the maximum number<br>&gt; +VIRTIO_NET_=
F_MQ or VIRTIO_NET_F_RSS is set. This field specifies the maximum number<br=
>&gt; &nbsp;of each of transmit and receive virtqueues (receiveq1\ldots rec=
eiveqN<br>&gt; -and transmitq1\ldots transmitqN respectively) that can be c=
onfigured once VIRTIO_NET_F_MQ<br>&gt; +and transmitq1\ldots transmitqN res=
pectively) that can be configured once at least one of these features<br>&g=
t; &nbsp;is negotiated.<br>&gt; &nbsp;<br>&gt; &nbsp;The following driver-r=
ead-only field, \field{mtu} only exists if<br>&gt; &nbsp;VIRTIO_NET_F_MTU i=
s set. This field specifies the maximum MTU for the driver to<br>&gt; &nbsp=
;use.<br>&gt; &nbsp;<br>&gt; +Two following fields, \field{speed} and \fiel=
d{duplex} are reserved.<br>&gt; &nbsp;\begin{lstlisting}<br>&gt; &nbsp;stru=
ct virtio_net_config {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u8 mac[6];=
<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le16 status;<br>&gt; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;le16 max_virtqueue_pairs;<br>&gt; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;le16 mtu;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;le32 speed;<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;u8 duplex;<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp;u8 rss_max_key_size;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;le16 rs=
s_max_indirection_table_length;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;le32 s=
upported_hash_types;<br>&gt; &nbsp;};<br>&gt; &nbsp;\end{lstlisting}<br>&gt=
; +\label{sec:Device Types / Network Device / Device configuration layout /=
 RSS}<br>&gt; +Three following fields, \field{rss_max_key_size}, \field{rss=
_max_indirection_table_length}<br>&gt; +and \field{supported_hash_types} on=
ly exist if VIRTIO_NET_F_RSS is set.<br>&gt; +<br>&gt; +Field \field{rss_ma=
x_key_size} specifies maximal supported length of RSS key in bytes.<br>&gt;=
 +<br>&gt; +Field \field{rss_max_indirection_table_length} specifies maxima=
l number of 16-bit entries in RSS indirection table.<br>&gt; +<br>&gt; +Fie=
ld \field{supported_hash_types} contains bitmask of supported RSS hash type=
s.<br>&gt; +<br>&gt; +Hash types applicable for IPv4 packets:<br>&gt; +\beg=
in{lstlisting}<br>&gt; +#define VIRTIO_NET_RSS_HASH_TYPE_IPv4 &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 0)<br>&gt; +#define VIRTIO_N=
ET_RSS_HASH_TYPE_TCPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt=
; 1)<br>&gt; +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4 &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; (1 &lt;&lt; 2)<br>&gt; +\end{lstlisting}<br>&gt; +Hash =
types applicable for IPv6 packets without extension headers<br>&gt; +\begin=
{lstlisting}<br>&gt; +#define VIRTIO_NET_RSS_HASH_TYPE_IPv6 &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 3)<br>&gt; +#define VIRTIO_NET=
_RSS_HASH_TYPE_TCPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; =
4)<br>&gt; +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6 &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; (1 &lt;&lt; 5)<br>&gt; +\end{lstlisting}<br>&gt; +Hash ty=
pes applicable for IPv6 packets with extension headers<br>&gt; +\begin{lstl=
isting}<br>&gt; +#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 6)<br>&gt; +#define VIRTIO_NET_RSS_HASH_=
TYPE_TCP_EX &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 7)<br>&gt;=
 +#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;(1 &lt;&lt; 8)<br>&gt; +\end{lstlisting}<br>&gt; +For exact meaning=
 of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref{sec:Device Types / Network Dev=
ice / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / R=
SS hash types}.<br>&gt; &nbsp;<br>&gt; &nbsp;\devicenormative{\subsubsectio=
n}{Device configuration layout}{Device Types / Network Device / Device conf=
iguration layout}<br>&gt; &nbsp;<br>&gt; @@ -2906,6 +2945,12 @@ \subsection=
{Device configuration layout}\label{sec:Device Types / Network Device<br>&g=
t; &nbsp;so without fragmentation, after VIRTIO_NET_F_MTU has been successf=
ully<br>&gt; &nbsp;negotiated.<br>&gt; &nbsp;<br>&gt; +The device MUST set =
\field{rss_max_key_size} to at least 40, if it offers<br>&gt; +VIRTIO_NET_F=
_RSS.<br>&gt; +<br>&gt; +The device MUST set \field{rss_max_indirection_tab=
le_length} to at least 128, if it offers<br>&gt; +VIRTIO_NET_F_RSS.<br>&gt;=
 +<br>&gt; &nbsp;If the driver negotiates the VIRTIO_NET_F_STANDBY feature,=
 the device MAY act<br>&gt; &nbsp;as a standby device for a primary device =
with the same MAC address.<br>&gt; &nbsp;<br>&gt; @@ -3675,33 +3720,52 @@ \=
subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / =
Devi<br>&gt; &nbsp;with class VIRTIO_NET_CTRL_ANNOUNCE and command VIRTIO_N=
ET_CTRL_ANNOUNCE_ACK<br>&gt; &nbsp;before marking the buffer as used.<br>&g=
t; &nbsp;<br>&gt; -\paragraph{Automatic receive steering in multiqueue mode=
}\label{sec:Device Types / Network Device / Device Operation / Control Virt=
queue / Automatic receive steering in multiqueue mode}<br>&gt; +\paragraph{=
Device operation in multiqueue mode}\label{sec:Device Types / Network Devic=
e / Device Operation / Control Virtqueue / Device operation in multiqueue m=
ode}<br>&gt; &nbsp;<br>&gt; -If the driver negotiates the VIRTIO_NET_F_MQ f=
eature bit (depends<br>&gt; -on VIRTIO_NET_F_CTRL_VQ), it MAY transmit outg=
oing packets on one<br>&gt; -of the multiple transmitq1\ldots transmitqN an=
d ask the device to<br>&gt; -queue incoming packets into one of the multipl=
e receiveq1\ldots receiveqN<br>&gt; -depending on the packet flow.<br>&gt; =
+This specification defines following modes that a device MAY implement for=
 operation with multiple transmit/receive virtqueues:<br>&gt; +\begin{itemi=
ze}<br>&gt; +\item Automatic receive steering as defined in \ref{sec:Device=
 Types / Network Device / Device Operation / Control Virtqueue / Automatic =
receive steering in multiqueue mode}.<br>&gt; + If a device supports such m=
ode, it offers VIRTIO_NET_F_MQ feature bit.<br>&gt; +\item Receive-side sca=
ling as defined in \ref{devicenormative:Device Types / Network Device / Dev=
ice Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS proces=
sing}.<br>&gt; + If a device supports such mode, it offers VIRTIO_NET_F_RSS=
 feature bit.<br>&gt; +\end{itemize}<br>&gt; &nbsp;<br>&gt; -\begin{lstlist=
ing}<br>&gt; -struct virtio_net_ctrl_mq {<br>&gt; - &nbsp; &nbsp; &nbsp; &n=
bsp;le16 virtqueue_pairs;<br>&gt; -};<br>&gt; +A device MAY support one of =
these features or both. The driver MAY negotiate any set of these features =
that the device supports.<br>&gt; &nbsp;<br>&gt; +Multiqueue is disabled by=
 default.<br>&gt; +<br>&gt; +The driver enables multiqueue by sending a com=
mand using \field{class} VIRTIO_NET_CTRL_MQ. The \field{command} selects th=
e mode of multiqueue operation, as follows:<br>&gt; +\begin{lstlisting}<br>=
&gt; &nbsp;#define VIRTIO_NET_CTRL_MQ &nbsp; &nbsp;4<br>&gt; - #define VIRT=
IO_NET_CTRL_MQ_VQ_PAIRS_SET &nbsp; &nbsp; &nbsp; &nbsp;0<br>&gt; - #define =
VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN &nbsp; &nbsp; &nbsp; &nbsp;1<br>&gt; - #def=
ine VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX &nbsp; &nbsp; &nbsp; &nbsp;0x8000<br>&g=
t; + #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET &nbsp; &nbsp; &nbsp; &nbsp;0 (=
for automatic receive steering)<br>&gt; + #define VIRTIO_NET_CTRL_MQ_RSS_CO=
NFIG &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1 (for configurable receive steering=
)<br>&gt; &nbsp;\end{lstlisting}<br>&gt; &nbsp;<br>&gt; -Multiqueue is disa=
bled by default. The driver enables multiqueue by<br>&gt; -executing the VI=
RTIO_NET_CTRL_MQ_VQ_PAIRS_SET command, specifying<br>&gt; +If more than one=
 multiqueue mode negotiated, the resulting device configuration is defined =
by the last command sent by the driver.<br>&gt; +<br>&gt; +\paragraph{Autom=
atic receive steering in multiqueue mode}\label{sec:Device Types / Network =
Device / Device Operation / Control Virtqueue / Automatic receive steering =
in multiqueue mode}<br>&gt; +<br>&gt; +If the driver negotiates the VIRTIO_=
NET_F_MQ feature bit (depends on VIRTIO_NET_F_CTRL_VQ), it MAY transmit out=
going packets on one<br>&gt; +of the multiple transmitq1\ldots transmitqN a=
nd ask the device to<br>&gt; +queue incoming packets into one of the multip=
le receiveq1\ldots receiveqN<br>&gt; +depending on the packet flow.<br>&gt;=
 +<br>&gt; +The driver enables multiqueue by<br>&gt; +sending the VIRTIO_NE=
T_CTRL_MQ_VQ_PAIRS_SET command, specifying<br>&gt; &nbsp;the number of the =
transmit and receive queues to be used up to<br>&gt; &nbsp;\field{max_virtq=
ueue_pairs}; subsequently,<br>&gt; &nbsp;transmitq1\ldots transmitqn and re=
ceiveq1\ldots receiveqn where<br>&gt; &nbsp;n=3D\field{virtqueue_pairs} MAY=
 be used.<br>&gt; +\begin{lstlisting}<br>&gt; +struct virtio_net_ctrl_mq_pa=
irs_set {<br>&gt; + &nbsp; &nbsp; &nbsp; le16 virtqueue_pairs;<br>&gt; +};<=
br>&gt; +#define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN &nbsp; &nbsp; &nbsp; &nbsp=
;1<br>&gt; +#define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX &nbsp; &nbsp; &nbsp; &n=
bsp;0x8000<br>&gt; &nbsp;<br>&gt; -When multiqueue is enabled, the device M=
UST use automatic receive steering<br>&gt; +\end{lstlisting}<br>&gt; +<br>&=
gt; +When multiqueue is enabled by VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command,=
 the device MUST use automatic receive steering<br>&gt; &nbsp;based on pack=
et flow. Programming of the receive steering<br>&gt; &nbsp;classificator is=
 implicit. After the driver transmitted a packet of a<br>&gt; &nbsp;flow on=
 transmitqX, the device SHOULD cause incoming packets for that flow to<br>&=
gt; @@ -3709,7 +3773,7 @@ \subsubsection{Control Virtqueue}\label{sec:Devic=
e Types / Network Device / Devi<br>&gt; &nbsp;no packets have been transmit=
ted yet, the device MAY steer a packet<br>&gt; &nbsp;to a random queue out =
of the specified receiveq1\ldots receiveqn.<br>&gt; &nbsp;<br>&gt; -Multiqu=
eue is disabled by setting \field{virtqueue_pairs} to 1 (this is<br>&gt; +M=
ultiqueue is disabled by VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET with \field{virtqu=
eue_pairs} to 1 (this is<br>&gt; &nbsp;the default) and waiting for the dev=
ice to use the command buffer.<br>&gt; &nbsp;<br>&gt; &nbsp;\drivernormativ=
e{\subparagraph}{Automatic receive steering in multiqueue mode}{Device Type=
s / Network Device / Device Operation / Control Virtqueue / Automatic recei=
ve steering in multiqueue mode}<br>&gt; @@ -3728,8 +3792,7 @@ \subsubsectio=
n{Control Virtqueue}\label{sec:Device Types / Network Device / Devi<br>&gt;=
 &nbsp;<br>&gt; &nbsp;\devicenormative{\subparagraph}{Automatic receive ste=
ering in multiqueue mode}{Device Types / Network Device / Device Operation =
/ Control Virtqueue / Automatic receive steering in multiqueue mode}<br>&gt=
; &nbsp;<br>&gt; -The device MUST queue packets only on any receiveq1 befor=
e the <br>&gt; -VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command.<br>&gt; +The devic=
e after initialization of reset MUST queue packets only on receiveq1.<br>&g=
t; &nbsp;<br>&gt; &nbsp;The device MUST NOT queue packets on receive queues=
 greater than<br>&gt; &nbsp;\field{virtqueue_pairs} once it has placed the<=
br>&gt; @@ -3741,6 +3804,131 @@ \subsubsection{Control Virtqueue}\label{sec=
:Device Types / Network Device / Devi<br>&gt; &nbsp;according to the native=
 endian of the guest rather than<br>&gt; &nbsp;(necessarily when not using =
the legacy interface) little-endian.<br>&gt; &nbsp;<br>&gt; +\paragraph{Rec=
eive-side scaling (RSS)}\label{sec:Device Types / Network Device / Device O=
peration / Control Virtqueue / Receive-side scaling (RSS)}<br>&gt; +A devic=
e offers feature VIRTIO_NET_F_RSS if it supports RSS receive steering with =
Toeplitz hash calculation and configurable parameters.<br>&gt; +<br>&gt; +A=
 driver queries RSS capabilities of the device by reading device configurat=
ion as defined in \ref{sec:Device Types / Network Device / Device configura=
tion layout / RSS}<br>&gt; +<br>&gt; +\subparagraph{Setting RSS parameters}=
\label{sec:Device Types / Network Device / Device Operation / Control Virtq=
ueue / Receive-side scaling (RSS) / Setting RSS parameters}<br>&gt; +<br>&g=
t; +Driver sends VIRTIO_NET_CTRL_MQ_RSS_CONFIG command using following form=
at for \field{command-specific-data}:<br>&gt; +\begin{lstlisting}<br>&gt; +=
struct virtio_net_rss_config {<br>&gt; + &nbsp; &nbsp;le32 hash_types;<br>&=
gt; + &nbsp; &nbsp;le16 indirection_table_mask;<br>&gt; + &nbsp; &nbsp;le16=
 unclassified_queue;<br>&gt; + &nbsp; &nbsp;le16 indirection_table[indirect=
ion_table_length];<br>&gt; + &nbsp; &nbsp;le16 max_tx_vq;<br>&gt; + &nbsp; =
&nbsp;u8 hash_key_length;<br>&gt; + &nbsp; &nbsp;u8 hash_key_data[hash_key_=
length];<br>&gt; +};<br>&gt; +\end{lstlisting}<br>&gt; +Field \field{hash_t=
ypes} contains a bitmask of allowed hash types as<br>&gt; +defined in \ref{=
sec:Device Types / Network Device / Device Operation / Control Virtqueue / =
Receive-side scaling (RSS) / RSS hash types}.<br>&gt; +<br>&gt; +Field \fie=
ld{indirection_table_mask} is a mask to be applied to calculated hash to pr=
oduce index in \field{indirection_table array}.<br>&gt; +Number of entries =
in \field{indirection_table} is (\field{indirection_table_mask} + 1).<br>&g=
t; +<br>&gt; +Field \field{unclassified_queue} contains 0-based index of re=
ceive virtqueue to place unclassified packets in. Index 0 corresponds to re=
ceiveq1.<br>&gt; +<br>&gt; +Field \field{indirection_table} contains array =
of 0-based indices of receive virtqueus. Index 0 corresponds to receiveq1.<=
br>&gt; +<br>&gt; +A driver sets \field{max_tx_vq} to inform a device how m=
any transmit virtqueues it may use (transmitq1\ldots transmitq \field{max_t=
x_vq}).<br>&gt; +<br>&gt; +\subparagraph{RSS hash types}\label{sec:Device T=
ypes / Network Device / Device Operation / Control Virtqueue / Receive-side=
 scaling (RSS) / RSS hash types}<br>&gt; +<br>&gt; +The device calculates h=
ash on IPv4 packets according to the field \field{hash_types} of virtio_net=
_rss_config structure as follows:<br>&gt; +\begin{itemize}<br>&gt; +\item I=
f VIRTIO_NET_RSS_HASH_TYPE_TCPv4 is set and the packet has TCP header, the =
hash is calculated over following fields:<br>&gt; +\begin{itemize}<br>&gt; =
+\item Source IP address<br>&gt; +\item Destination IP address<br>&gt; +\it=
em Source TCP port<br>&gt; +\item Destination TCP port<br>&gt; +\end{itemiz=
e}<br>&gt; +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set and the pac=
ket has UDP header, the hash is calculated over following fields:<br>&gt; +=
\begin{itemize}<br>&gt; +\item Source IP address<br>&gt; +\item Destination=
 IP address<br>&gt; +\item Source UDP port<br>&gt; +\item Destination UDP p=
ort<br>&gt; +\end{itemize}<br>&gt; +\item Else if VIRTIO_NET_RSS_HASH_TYPE_=
IPv4 is set, the hash is calculated over following fields:<br>&gt; +\begin{=
itemize}<br>&gt; +\item Source IP address<br>&gt; +\item Destination IP add=
ress<br>&gt; +\end{itemize}<br>&gt; +\item Else the device does not calcula=
te the hash<br>&gt; +\end{itemize}<br>&gt; +<br>&gt; +The device calculates=
 hash on IPv6 packets without extension headers according to the field \fie=
ld{hash_types} of virtio_net_rss_config structure as follows:<br>&gt; +\beg=
in{itemize}<br>&gt; +\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set and the=
 packet has TCPv6 header, the hash is calculated over following fields:<br>=
&gt; +\begin{itemize}<br>&gt; +\item Source IPv6 address<br>&gt; +\item Des=
tination IPv6 address<br>&gt; +\item Source TCP port<br>&gt; +\item Destina=
tion TCP port<br>&gt; +\end{itemize}<br>&gt; +\item Else if VIRTIO_NET_RSS_=
HASH_TYPE_UDPv6 is set and the packet has UDPv6 header, the hash is calcula=
ted over following fields:<br>&gt; +\begin{itemize}<br>&gt; +\item Source I=
Pv6 address<br>&gt; +\item Destination IPv6 address<br>&gt; +\item Source U=
DP port<br>&gt; +\item Destination UDP port<br>&gt; +\end{itemize}<br>&gt; =
+\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv6 is set, the hash is calculated=
 over following fields:<br>&gt; +\begin{itemize}<br>&gt; +\item Source IPv6=
 address<br>&gt; +\item Destination IPv6 address<br>&gt; +\end{itemize}<br>=
&gt; +\item Else the device does not calculate the hash<br>&gt; +\end{itemi=
ze}<br>&gt; +<br>&gt; +The device calculates hash on IPv6 packets with exte=
nsion headers according to the field \field{hash_types} of virtio_net_rss_c=
onfig structure as follows:<br>&gt; +\begin{itemize}<br>&gt; +\item If VIRT=
IO_NET_RSS_HASH_TYPE_TCP_EX is set and the packet has TCPv6 header, the has=
h is calculated over following fields:<br>&gt; +\begin{itemize}<br>&gt; +\i=
tem Home address from the home address option in the IPv6 destination optio=
ns header. If the extension header is not present, use the Source IPv6 addr=
ess.<br>&gt; +\item IPv6 address that is contained in the Routing-Header-Ty=
pe-2 from the associated extension header. If the extension header is not p=
resent, use the Destination IPv6 address.<br>&gt; +\item Source TCP port<br=
>&gt; +\item Destination TCP port<br>&gt; +\end{itemize}<br>&gt; +\item Els=
e if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the packet has UDPv6 header=
, the hash is calculated over following fields:<br>&gt; +\begin{itemize}<br=
>&gt; +\item Home address from the home address option in the IPv6 destinat=
ion options header. If the extension header is not present, use the Source =
IPv6 address.<br>&gt; +\item IPv6 address that is contained in the Routing-=
Header-Type-2 from the associated extension header. If the extension header=
 is not present, use the Destination IPv6 address.<br>&gt; +\item Source UD=
P port<br>&gt; +\item Destination UDP port<br>&gt; +\end{itemize}<br>&gt; +=
\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is calculated=
 over following fields:<br>&gt; +\begin{itemize}<br>&gt; +\item Home addres=
s from the home address option in the IPv6 destination options header. If t=
he extension header is not present, use the Source IPv6 address.<br>&gt; +\=
item IPv6 address that is contained in the Routing-Header-Type-2 from the a=
ssociated extension header. If the extension header is not present, use the=
 Destination IPv6 address.<br>&gt; +\end{itemize}<br>&gt; +\item Else skip =
IPv6 extension headers and calculate the hash as defined above for IPv6 pac=
ket without extension headers<br>&gt; +\end{itemize}<br>&gt; +<br>&gt; +\dr=
ivernormative{\subparagraph}{Setting RSS parameters}{Device Types / Network=
 Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS)=
 }<br>&gt; +<br>&gt; +A driver MUST NOT send VIRTIO_NET_CTRL_MQ_RSS_CONFIG =
command if the feature VIRTIO_NET_F_RSS has not been negotiated.<br>&gt; +<=
br>&gt; +A driver MUST fill \field{indirection_table} array only with indic=
es of enabled queues. Index 0 corresponds to receiveq1.<br>&gt; +<br>&gt; +=
Number of entries in \field{indirection_table} (\field{indirection_table_ma=
sk} + 1) MUST be a power of two.<br>&gt; +<br>&gt; +A driver MUST use \fiel=
d{indirection_table_mask} values that are less than \field{rss_max_indirect=
ion_table_length} reported by a device.<br>&gt; +<br>&gt; +A driver MUST NO=
T set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are not supported by a devic=
e.<br>&gt; +<br>&gt; +\devicenormative{\subparagraph}{RSS processing}{Devic=
e Types / Network Device / Device Operation / Control Virtqueue / Receive-s=
ide scaling (RSS) / RSS processing}<br>&gt; +The device MUST determine dest=
ination queue for network packet as follows:<br>&gt; +\begin{itemize}<br>&g=
t; +\item Calculate hash of the packet as defined in \ref{sec:Device Types =
/ Network Device / Device Operation / Control Virtqueue / Receive-side scal=
ing (RSS) / RSS hash types}<br>&gt; +\item If the device did not calculate =
the hash for specific packet, the device directs the packet to the receiveq=
 specified by \field{unclassified_queue} of virtio_net_rss_config structure=
 (value of 0 corresponds to receiveq1).<br>&gt; +\item Apply \field{indirec=
tion_table_mask} to the calculated hash and use the result as the index in =
the indirection table to get 0-based number of destination receiveq (value =
of 0 corresponds to receiveq1).<br>&gt; +\end{itemize}<br>&gt; +<br>&gt; &n=
bsp;\paragraph{Offloads State Configuration}\label{sec:Device Types / Netwo=
rk Device / Device Operation / Control Virtqueue / Offloads State Configura=
tion}<br>&gt; &nbsp;<br>&gt; &nbsp;If the VIRTIO_NET_F_CTRL_GUEST_OFFLOADS =
feature is negotiated, the driver can<br>&gt; -- <br>&gt; 2.17.2<br><div><b=
r></div><br>This publicly archived list offers a means to provide input to =
the <br>OASIS Virtual I/O Device (VIRTIO) TC. <br><br>In order to verify us=
er consent to the Feedback License terms and <br>to minimize spam in the li=
st archive, subscription is required <br>before posting. <br><br>Subscribe:=
 virtio-comment-subscribe@lists.oasis-open.org <br>Unsubscribe: virtio-comm=
ent-unsubscribe@lists.oasis-open.org <br>List help: virtio-comment-help@lis=
ts.oasis-open.org <br>List archive: https://lists.oasis-open.org/archives/v=
irtio-comment/ <br>Feedback License: https://www.oasis-open.org/who/ipr/fee=
dback_license.pdf <br>List Guidelines: https://www.oasis-open.org/policies-=
guidelines/mailing-lists <br>Committee: https://www.oasis-open.org/committe=
es/virtio/ <br>Join OASIS: https://www.oasis-open.org/join/<br><div><br></d=
iv></blockquote><div><br></div></div></body></html>
------=_Part_10953123_2111715139.1574408042523--

