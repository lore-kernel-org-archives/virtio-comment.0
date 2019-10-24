Return-Path: virtio-comment-return-880-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2EACD9860BF
	for <virtio-comment@lists.oasis-open.org>; Thu, 24 Oct 2019 15:40:48 +0000 (UTC)
Date: Thu, 24 Oct 2019 11:27:54 -0400 (EDT)
From: Yuri Benditovich <ybendito@redhat.com>
Message-ID: <1769975678.6516591.1571930874603.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191023202428-mutt-send-email-mst@kernel.org>
References: <20191016075032.83600-1-yuri.benditovich@daynix.com> <20191016075032.83600-2-yuri.benditovich@daynix.com> <20191023202428-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_6516590_32048604.1571930874602"
Subject: Re: [virtio-comment] Re: [PATCH v2 1/1] virtio-net: define support
 for receive-side scaling
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

------=_Part_6516590_32048604.1571930874602
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

----- Original Message -----

> From: "Michael S. Tsirkin" <mst@redhat.com>
> To: "Yuri Benditovich" <yuri.benditovich@daynix.com>
> Cc: virtio-comment@lists.oasis-open.org
> Sent: Thursday, October 24, 2019 4:52:39 PM
> Subject: [virtio-comment] Re: [PATCH v2 1/1] virtio-net: define support f=
or
> receive-side scaling

> On Wed, Oct 16, 2019 at 10:50:32AM +0300, Yuri Benditovich wrote:
> > Fixes https://github.com/oasis-tcs/virtio-spec/issues/48
> > Added support for RSS receive steering mode.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > ---
> > conformance.tex | 2 +
> > content.tex | 181 ++++++++++++++++++++++++++++++++++++++++++++++--
> > 2 files changed, 177 insertions(+), 6 deletions(-)
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
> > index 679391e..1e0c9b0 100644
> > --- a/content.tex
> > +++ b/content.tex
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
> > +\item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_MQ
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
> > @@ -2875,14 +2879,49 @@ \subsection{Device configuration
> > layout}\label{sec:Device Types / Network Device
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
> > + le32 rss_supported_hash_types;
> > };
> > \end{lstlisting}
> > +\label{sec:Device Types / Network Device / Device configuration layout=
 /
> > RSS}
> > +Three following fields, \field{rss_max_key_size},
> > \field{rss_max_indirection_table_length}
> > +and \field{rss_supported_hash_types} only exist if VIRTIO_NET_F_RSS is
> > set.
> > +
> > +Field \field{rss_max_key_size} specifies maximal supported length of R=
SS
> > key in bytes.
> > +
> > +Field \field{rss_max_indirection_table_length} specifies maximal numbe=
r of
> > 16-bit entries in RSS indirection table.
> > +
> > +Field \field{rss_supported_hash_types} contains bitmask of supported R=
SS
> > hash types.
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
> > @@ -3684,14 +3723,16 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice
> > Types / Network Device / Devi
> > depending on the packet flow.
> >
> > \begin{lstlisting}
> > -struct virtio_net_ctrl_mq {
> > - le16 virtqueue_pairs;
> > -};
> > -
> > #define VIRTIO_NET_CTRL_MQ 4
> > #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET 0
> > + struct virtio_net_ctrl_mq_pairs_set {
> > + le16 virtqueue_pairs;
> > + };
> > +
> > #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN 1
> > #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX 0x8000
> > +
> > + #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG 1
> > \end{lstlisting}
> >
> > Multiqueue is disabled by default. The driver enables multiqueue by
> > @@ -3701,7 +3742,11 @@ \subsubsection{Control Virtqueue}\label{sec:Devi=
ce
> > Types / Network Device / Devi
> > transmitq1\ldots transmitqn and receiveq1\ldots receiveqn where
> > n=3D\field{virtqueue_pairs} MAY be used.
> >
> > -When multiqueue is enabled, the device MUST use automatic receive stee=
ring
> > +After the driver enabled multiqueue

> enabled how?
with VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET, according to previous paragraph, seve=
ral lines above.=20

> > and if the feature VIRTIO_NET_F_RSS is negotiated,
> > +the driver MAY execute VIRTIO_NET_CTRL_MQ_RSS_CONFIG command to set ex=
act
> > parameters for
> > +RSS receive steering.
> > +
> > +When multiqueue is enabled and the device feature VIRTIO_NET_F_RSS is =
not
> > negotiated, the device MUST use automatic receive steering
> > based on packet flow. Programming of the receive steering
> > classificator is implicit. After the driver transmitted a packet of a
> > flow on transmitqX, the device SHOULD cause incoming packets for that f=
low
> > to

> Isn't there value is allowing devices to support RSS but not auto RFS?
Because automatic steering implementation is best effort anyway (the device=
 SHOULD), I do not think we need to state this explicitly.=20

There is anyway 2 cases when the device need to do something:=20
1. It is configured for MQ, but the RSS is not configured and VIRTIO_NET_F_=
RSS is not acked by the host=20
2. It is configured for MQ, VIRTIO_NET_F_RSS acked, but the RSS is not conf=
igured (for example, the OS configuration is 'not to use RSS'=20

If the device supports RSS but does not support optimal automatic steering,=
 it still need to live somehow in 2 scenarios above.=20
IMO, RSS is an addition to MQ, not an alternative.=20
Number of pairs to use if defined according to CPUs/IRQs/resources and spec=
ific usage of each one is defined by RSS.=20

> Looks like the only thing we need from MQ is ability to
> support VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET with value of 1 as
> a way to disable RSS - is that right?
VQ_PAIRS_SET=3D1 disables multiqueue and everything related to it in the de=
vice.=20
It was in the spec from the beginning, so I do not want to touch it, but I =
do not see any motivation in the driver to issue this command (unless all t=
he CPUs except the single one were unplugged)=20

> If yes, let's just add a new command that works with either
> VIRTIO_NET_F_RSS or VIRTIO_NET_F_MQ?
> Or special-case VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET with value of 1,
> and allow that also with VIRTIO_NET_F_RSS?

IMO it is allowed by definition, as F_RSS requires F_MQ.=20

> > @@ -3709,6 +3754,10 @@ \subsubsection{Control Virtqueue}\label{sec:Devi=
ce
> > Types / Network Device / Devi
> > no packets have been transmitted yet, the device MAY steer a packet
> > to a random queue out of the specified receiveq1\ldots receiveqn.
> >
> > +When multiqueue is enabled and the device feature VIRTIO_NET_F_RSS is
> > negotiated, the device MUST use RSS receive steering
> > +according to the configuration provided by the driver as defined in
> > \ref{devicenormative:Device Types / Network Device / Device Operation /
> > Control Virtqueue / Receive-side scaling (RSS) / RSS processing}.
> > +In case when multiqueue is enabled but the driver did not provide RSS
> > configuration yet, the device SHOULD use automatic receive steering or
> > reasonable internal RSS configuration.
> > +

> After once providing configuration, there's no way to get back to
> that default state, is there? this might be problematic -
> e.g. this makes debugging harder.
It is very simple to get to default state - just do not send RSS configurat=
ion after MQ.=20

> > Multiqueue is disabled by setting \field{virtqueue_pairs} to 1 (this is
> > the default) and waiting for the device to use the command buffer.
> >
> > @@ -3741,6 +3790,126 @@ \subsubsection{Control Virtqueue}\label{sec:Dev=
ice
> > Types / Network Device / Devi
> > according to the native endian of the guest rather than
> > (necessarily when not using the legacy interface) little-endian.
> >
> > +\paragraph{Receive-side scaling (RSS)}\label{sec:Device Types / Networ=
k
> > Device / Device Operation / Control Virtqueue / Receive-side scaling
> > (RSS)}
> > +The device indicates presence of this feature if it supports RSS recei=
ve
> > steering with Toeplitz hash calculation and configurable parameters.
> > +
> > +\subparagraph{Querying RSS capabilities}\label{sec:Device Types / Netw=
ork
> > Device / Device Operation / Control Virtqueue / Receive-side scaling (R=
SS)
> > / Querying RSS capabilities}
> > +
> > +Driver queries RSS capabilities of the device by reading device
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
> > + le32 hash_types; (bitmask of allowed hash types)
> > + le16 indirection_table_length; (number of queue indices in
> > indirection_table array)
> > + le16 unclassified_queue; (queue to place unclassified packets in)
> > + le16 indirection_table[indirection_table_length];
> > + u8 hash_key_length;
> > + u8 hash_key_data[hash_key_length];
> > +};
> > +
> > +\end{lstlisting}
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
> > +
> > +\drivernormative{\subparagraph}{Setting RSS parameters}{Device Types /
> > Network Device / Device Operation / Control Virtqueue / Receive-side
> > scaling (RSS) }
> > +
> > +A driver MUST NOT set RSS parameters if the feature VIRTIO_NET_F_RSS h=
as
> > not been negotiated.
> > +
> > +A driver MUST NOT set RSS parameters before it successfully enabled
> > operation with multiple queues.

> Hmm. Meaning what?
Number of virtqueue pairs the device can use is provided in VIRTIO_NET_CTRL=
_MQ_VQ_PAIRS_SET.=20
So before that the driver can't set RSS parameters to avoid any misundersta=
nding.=20

> > +
> > +A driver MUST fill \field{indirection_table} array only with indices o=
f
> > enabled queues.

> Enabled using the transport enable flag?
TODO: change to:=20
A driver MUST NOT fill \field{indirection_table} array only with indices gr=
eater than number of virtqueue pairs set by VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET=
.=20

> Do we keep the requirement that even virtqueues are RX and odd ones are T=
X?
TODO: clarify=20
Redirection table contains 0-based indices of virtqueue pairs, the device u=
ses respective receiveq.=20

> Please write virtqueues not queues.
OK=20

> > +
> > +An \field{indirection_table_length} MUST be power of two.

> "a power of two"?

OK=20

> or 0 I guess? If you want 2^16 values? If yes need to clarify where
> indirection_table is defined.

I did not mean that as I do not expect 2^16 CPUs.=20
My intention was that 0 is no table and the device uses only default one.=
=20

> > +
> > +A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are not
> > supported by device.
> > +
> > +\devicenormative{\subparagraph}{RSS processing}{Device Types / Network
> > Device / Device Operation / Control Virtqueue / Receive-side scaling (R=
SS)
> > / RSS processing}
> > +If the device reports support for VIRTIO_NET_F_RSS it MUST support key=
s of
> > at least 40 bytes and indirection table of at least 128 entries.
> > +
> > +The device MUST determine destination queue for network packet as foll=
ows:
> > +\begin{itemize}
> > +\item Calculate hash of the packet as defined in \ref{sec:Device Types=
 /
> > Network Device / Device Operation / Control Virtqueue / Receive-side
> > scaling (RSS) / RSS hash types}
> > +\item If the device did not calculate the hash for specific packet, th=
e
> > device directs the packet to the queue specified by
> > \field{unclassified_queue} of virtio_net_rss_config structure
> > +\item Apply mask of (indirection_table_length - 1) to the calculated h=
ash
> > and use the result as the index in the indirection table to get 0-based
> > number of destination receive queue

> So if I get the value 2, is this VQ 2? Or is it RX queue 2, VQ 4?

> I am guessing you mean
> receiveq1. . .receiveqN

> but these are 1-based not 0-based.

> So maybe document here (0 corresponding to receiveq1, 1 to receiveq2 and =
so
> on).
OK, I will clarify=20

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

------=_Part_6516590_32048604.1571930874602
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
ment@lists.oasis-open.org<br><b>Sent: </b>Thursday, October 24, 2019 4:52:3=
9 PM<br><b>Subject: </b>[virtio-comment] Re: [PATCH v2 1/1] virtio-net: def=
ine support for receive-side scaling<br><div><br></div>On Wed, Oct 16, 2019=
 at 10:50:32AM +0300, Yuri Benditovich wrote:<br>&gt; Fixes https://github.=
com/oasis-tcs/virtio-spec/issues/48<br>&gt; Added support for RSS receive s=
teering mode.<br>&gt; <br>&gt; Signed-off-by: Yuri Benditovich &lt;yuri.ben=
ditovich@daynix.com&gt;<br>&gt; ---<br>&gt; &nbsp;conformance.tex | &nbsp; =
2 +<br>&gt; &nbsp;content.tex &nbsp; &nbsp; | 181 +++++++++++++++++++++++++=
+++++++++++++++++++++--<br>&gt; &nbsp;2 files changed, 177 insertions(+), 6=
 deletions(-)<br>&gt; <br>&gt; diff --git a/conformance.tex b/conformance.t=
ex<br>&gt; index 0ac58aa..01449c5 100644<br>&gt; --- a/conformance.tex<br>&=
gt; +++ b/conformance.tex<br>&gt; @@ -101,6 +101,7 @@ \section{Conformance =
Targets}\label{sec:Conformance / Conformance Targets}<br>&gt; &nbsp;\item \=
ref{drivernormative:Device Types / Network Device / Device Operation / Cont=
rol Virtqueue / Gratuitous Packet Sending}<br>&gt; &nbsp;\item \ref{drivern=
ormative:Device Types / Network Device / Device Operation / Control Virtque=
ue / Automatic receive steering in multiqueue mode}<br>&gt; &nbsp;\item \re=
f{drivernormative:Device Types / Network Device / Device Operation / Contro=
l Virtqueue / Offloads State Configuration / Setting Offloads State}<br>&gt=
; +\item \ref{drivernormative:Device Types / Network Device / Device Operat=
ion / Control Virtqueue / Receive-side scaling (RSS) }<br>&gt; &nbsp;\end{i=
temize}<br>&gt; &nbsp;<br>&gt; &nbsp;\conformance{\subsection}{Block Driver=
 Conformance}\label{sec:Conformance / Driver Conformance / Block Driver Con=
formance}<br>&gt; @@ -257,6 +258,7 @@ \section{Conformance Targets}\label{s=
ec:Conformance / Conformance Targets}<br>&gt; &nbsp;\item \ref{devicenormat=
ive:Device Types / Network Device / Device Operation / Control Virtqueue / =
Setting MAC Address Filtering}<br>&gt; &nbsp;\item \ref{devicenormative:Dev=
ice Types / Network Device / Device Operation / Control Virtqueue / Gratuit=
ous Packet Sending}<br>&gt; &nbsp;\item \ref{devicenormative:Device Types /=
 Network Device / Device Operation / Control Virtqueue / Automatic receive =
steering in multiqueue mode}<br>&gt; +\item \ref{devicenormative:Device Typ=
es / Network Device / Device Operation / Control Virtqueue / Receive-side s=
caling (RSS) / RSS processing}<br>&gt; &nbsp;\end{itemize}<br>&gt; &nbsp;<b=
r>&gt; &nbsp;\conformance{\subsection}{Block Device Conformance}\label{sec:=
Conformance / Device Conformance / Block Device Conformance}<br>&gt; diff -=
-git a/content.tex b/content.tex<br>&gt; index 679391e..1e0c9b0 100644<br>&=
gt; --- a/content.tex<br>&gt; +++ b/content.tex<br>&gt; @@ -2811,6 +2811,9 =
@@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feat=
ure bits<br>&gt; &nbsp;\item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC addres=
s through control<br>&gt; &nbsp; &nbsp; &nbsp;channel.<br>&gt; &nbsp;<br>&g=
t; +\item[VIRTIO_NET_F_RSS(60)] Device supports RSS (receive-side scaling)<=
br>&gt; + &nbsp; &nbsp;with Toeplitz hash calculation and configurable hash=
 parameters for receive steering<br>&gt; +<br>&gt; &nbsp;\item[VIRTIO_NET_F=
_RSC_EXT(61)] Device can process duplicated ACKs<br>&gt; &nbsp; &nbsp; &nbs=
p;and report number of coalesced segments and duplicated ACKs<br>&gt; &nbsp=
;<br>&gt; @@ -2840,6 +2843,7 @@ \subsubsection{Feature bit requirements}\la=
bel{sec:Device Types / Network Device<br>&gt; &nbsp;\item[VIRTIO_NET_F_MQ] =
Requires VIRTIO_NET_F_CTRL_VQ.<br>&gt; &nbsp;\item[VIRTIO_NET_F_CTRL_MAC_AD=
DR] Requires VIRTIO_NET_F_CTRL_VQ.<br>&gt; &nbsp;\item[VIRTIO_NET_F_RSC_EXT=
] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.<br>&gt; +\item=
[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_MQ<br>&gt; &nbsp;\end{description}=
<br>&gt; &nbsp;<br>&gt; &nbsp;\subsubsection{Legacy Interface: Feature bits=
}\label{sec:Device Types / Network Device / Feature bits / Legacy Interface=
: Feature bits}<br>&gt; @@ -2854,7 +2858,7 @@ \subsubsection{Legacy Interfa=
ce: Feature bits}\label{sec:Device Types / Network<br>&gt; &nbsp;\subsectio=
n{Device configuration layout}\label{sec:Device Types / Network Device / De=
vice configuration layout}<br>&gt; &nbsp;\label{sec:Device Types / Block De=
vice / Feature bits / Device configuration layout}<br>&gt; &nbsp;<br>&gt; -=
Three driver-read-only configuration fields are currently defined. The \fie=
ld{mac} address field<br>&gt; +Device configuration fields are listed below=
, they are read-only for a driver. The \field{mac} address field<br>&gt; &n=
bsp;always exists (though is only valid if VIRTIO_NET_F_MAC is set), and<br=
>&gt; &nbsp;\field{status} only exists if VIRTIO_NET_F_STATUS is set. Two<b=
r>&gt; &nbsp;read-only bits (for the driver) are currently defined for the =
status field:<br>&gt; @@ -2875,14 +2879,49 @@ \subsection{Device configurat=
ion layout}\label{sec:Device Types / Network Device<br>&gt; &nbsp;VIRTIO_NE=
T_F_MTU is set. This field specifies the maximum MTU for the driver to<br>&=
gt; &nbsp;use.<br>&gt; &nbsp;<br>&gt; +Two following fields, \field{speed} =
and \field{duplex} are reserved.<br>&gt; &nbsp;\begin{lstlisting}<br>&gt; &=
nbsp;struct virtio_net_config {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;u=
8 mac[6];<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le16 status;<br>&gt; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;le16 max_virtqueue_pairs;<br>&gt; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;le16 mtu;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;le3=
2 speed;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;u8 duplex;<br>&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp;u8 rss_max_key_size;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;le16 rss_max_indirection_table_length;<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp;le32 rss_supported_hash_types;<br>&gt; &nbsp;};<br>&gt; &nbsp;\end{lstli=
sting}<br>&gt; +\label{sec:Device Types / Network Device / Device configura=
tion layout / RSS}<br>&gt; +Three following fields, \field{rss_max_key_size=
}, \field{rss_max_indirection_table_length}<br>&gt; +and \field{rss_support=
ed_hash_types} only exist if VIRTIO_NET_F_RSS is set.<br>&gt; +<br>&gt; +Fi=
eld \field{rss_max_key_size} specifies maximal supported length of RSS key =
in bytes.<br>&gt; +<br>&gt; +Field \field{rss_max_indirection_table_length}=
 specifies maximal number of 16-bit entries in RSS indirection table.<br>&g=
t; +<br>&gt; +Field \field{rss_supported_hash_types} contains bitmask of su=
pported RSS hash types.<br>&gt; +<br>&gt; +Hash types applicable for IPv4 p=
ackets:<br>&gt; +\begin{lstlisting}<br>&gt; +#define VIRTIO_NET_RSS_HASH_TY=
PE_IPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 0)<br>&=
gt; +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4 &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; (1 &lt;&lt; 1)<br>&gt; +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4 &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 2)<br>&gt; +\end{lstli=
sting}<br>&gt; +Hash types applicable for IPv6 packets without extension he=
aders<br>&gt; +\begin{lstlisting}<br>&gt; +#define VIRTIO_NET_RSS_HASH_TYPE=
_IPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 3)<br>&gt=
; +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; (1 &lt;&lt; 4)<br>&gt; +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6 &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 5)<br>&gt; +\end{lstlist=
ing}<br>&gt; +Hash types applicable for IPv6 packets with extension headers=
<br>&gt; +\begin{lstlisting}<br>&gt; +#define VIRTIO_NET_RSS_HASH_TYPE_IP_E=
X &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (1 &lt;&lt; 6)<br>&gt; +#define=
 VIRTIO_NET_RSS_HASH_TYPE_TCP_EX &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(=
1 &lt;&lt; 7)<br>&gt; +#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;(1 &lt;&lt; 8)<br>&gt; +\end{lstlisting}<br>&g=
t; +For exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref{sec:Devic=
e Types / Network Device / Device Operation / Control Virtqueue / Receive-s=
ide scaling (RSS) / RSS hash types}.<br>&gt; &nbsp;<br>&gt; &nbsp;\deviceno=
rmative{\subsubsection}{Device configuration layout}{Device Types / Network=
 Device / Device configuration layout}<br>&gt; &nbsp;<br>&gt; @@ -3684,14 +=
3723,16 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Netwo=
rk Device / Devi<br>&gt; &nbsp;depending on the packet flow.<br>&gt; &nbsp;=
<br>&gt; &nbsp;\begin{lstlisting}<br>&gt; -struct virtio_net_ctrl_mq {<br>&=
gt; - &nbsp; &nbsp; &nbsp; &nbsp;le16 virtqueue_pairs;<br>&gt; -};<br>&gt; =
-<br>&gt; &nbsp;#define VIRTIO_NET_CTRL_MQ &nbsp; &nbsp;4<br>&gt; &nbsp; #d=
efine VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET &nbsp; &nbsp; &nbsp; &nbsp;0<br>&gt; =
+ struct virtio_net_ctrl_mq_pairs_set {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;le16 virtqueue_pairs;<br>&gt; + };<br>&gt; +<br>&gt; &nbsp; #define VIRTI=
O_NET_CTRL_MQ_VQ_PAIRS_MIN &nbsp; &nbsp; &nbsp; &nbsp;1<br>&gt; &nbsp; #def=
ine VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX &nbsp; &nbsp; &nbsp; &nbsp;0x8000<br>&g=
t; +<br>&gt; + #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;1<br>&gt; &nbsp;\end{lstlisting}<br>&gt; &nbsp;<br>&gt; &nbsp;M=
ultiqueue is disabled by default. The driver enables multiqueue by<br>&gt; =
@@ -3701,7 +3742,11 @@ \subsubsection{Control Virtqueue}\label{sec:Device T=
ypes / Network Device / Devi<br>&gt; &nbsp;transmitq1\ldots transmitqn and =
receiveq1\ldots receiveqn where<br>&gt; &nbsp;n=3D\field{virtqueue_pairs} M=
AY be used.<br>&gt; &nbsp;<br>&gt; -When multiqueue is enabled, the device =
MUST use automatic receive steering<br>&gt; +After the driver enabled multi=
queue<br><div><br></div>enabled how?</blockquote><div>with VIRTIO_NET_CTRL_=
MQ_VQ_PAIRS_SET, according to previous paragraph, several lines above.<br><=
/div><blockquote style=3D"border-left:2px solid #1010FF;margin-left:5px;pad=
ding-left:5px;color:#000;font-weight:normal;font-style:normal;text-decorati=
on:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" data-mce-st=
yle=3D"border-left: 2px solid #1010FF; margin-left: 5px; padding-left: 5px;=
 color: #000; font-weight: normal; font-style: normal; text-decoration: non=
e; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><br><div><br>=
</div>&gt; and if the feature VIRTIO_NET_F_RSS is negotiated,<br>&gt; +the =
driver MAY execute VIRTIO_NET_CTRL_MQ_RSS_CONFIG command to set exact param=
eters for<br>&gt; +RSS receive steering.<br>&gt; +<br>&gt; +When multiqueue=
 is enabled and the device feature VIRTIO_NET_F_RSS is not negotiated, the =
device MUST use automatic receive steering<br>&gt; &nbsp;based on packet fl=
ow. Programming of the receive steering<br>&gt; &nbsp;classificator is impl=
icit. After the driver transmitted a packet of a<br>&gt; &nbsp;flow on tran=
smitqX, the device SHOULD cause incoming packets for that flow to<br><div><=
br></div><br>Isn't there value is allowing devices to support RSS but not a=
uto RFS?</blockquote><div>Because automatic steering implementation is best=
 effort anyway (the device SHOULD), I do not think we need to state this ex=
plicitly.<br></div><div> <br></div><div>There is anyway 2 cases when the de=
vice need to do something:<br></div><div>1. It is configured for MQ, but th=
e RSS is not configured and VIRTIO_NET_F_RSS is not acked by the host<br></=
div><div>2. It is configured for MQ, VIRTIO_NET_F_RSS acked, but the RSS is=
 not configured (for example, the OS configuration is 'not to use RSS'<br><=
/div><div><br></div><div>If the device supports RSS but does not support op=
timal automatic steering, it still need to live somehow in 2 scenarios abov=
e.<br></div><div>IMO, RSS is an addition to MQ, not an alternative.<br></di=
v><div>Number of pairs to use if defined according to CPUs/IRQs/resources a=
nd specific usage of each one is defined by RSS.<br></div><div><br></div><b=
lockquote style=3D"border-left:2px solid #1010FF;margin-left:5px;padding-le=
ft:5px;color:#000;font-weight:normal;font-style:normal;text-decoration:none=
;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" data-mce-style=3D"=
border-left: 2px solid #1010FF; margin-left: 5px; padding-left: 5px; color:=
 #000; font-weight: normal; font-style: normal; text-decoration: none; font=
-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><br><div><br></div>L=
ooks like the only thing we need from MQ is ability to<br>support VIRTIO_NE=
T_CTRL_MQ_VQ_PAIRS_SET with value of 1 as<br>a way to disable RSS - is that=
 right?</blockquote><div>VQ_PAIRS_SET=3D1 disables multiqueue and everythin=
g related to it in the device.<br></div><div>It was in the spec from the be=
ginning, so I do not want to touch it, but I do not see any motivation in t=
he driver to issue this command (unless all the CPUs except the single one =
were unplugged)<br></div><div><br></div><blockquote style=3D"border-left:2p=
x solid #1010FF;margin-left:5px;padding-left:5px;color:#000;font-weight:nor=
mal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans=
-serif;font-size:12pt;" data-mce-style=3D"border-left: 2px solid #1010FF; m=
argin-left: 5px; padding-left: 5px; color: #000; font-weight: normal; font-=
style: normal; text-decoration: none; font-family: Helvetica,Arial,sans-ser=
if; font-size: 12pt;"><br>If yes, let's just add a new command that works w=
ith either<br>VIRTIO_NET_F_RSS or VIRTIO_NET_F_MQ?<br>Or special-case VIRTI=
O_NET_CTRL_MQ_VQ_PAIRS_SET with value of 1,<br>and allow that also with VIR=
TIO_NET_F_RSS?<br></blockquote><div>IMO it is allowed by definition, as F_R=
SS requires F_MQ.<br></div><div><br></div><blockquote style=3D"border-left:=
2px solid #1010FF;margin-left:5px;padding-left:5px;color:#000;font-weight:n=
ormal;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sa=
ns-serif;font-size:12pt;" data-mce-style=3D"border-left: 2px solid #1010FF;=
 margin-left: 5px; padding-left: 5px; color: #000; font-weight: normal; fon=
t-style: normal; text-decoration: none; font-family: Helvetica,Arial,sans-s=
erif; font-size: 12pt;"><br><div><br></div>&gt; @@ -3709,6 +3754,10 @@ \sub=
subsection{Control Virtqueue}\label{sec:Device Types / Network Device / Dev=
i<br>&gt; &nbsp;no packets have been transmitted yet, the device MAY steer =
a packet<br>&gt; &nbsp;to a random queue out of the specified receiveq1\ldo=
ts receiveqn.<br>&gt; &nbsp;<br>&gt; +When multiqueue is enabled and the de=
vice feature VIRTIO_NET_F_RSS is negotiated, the device MUST use RSS receiv=
e steering<br>&gt; +according to the configuration provided by the driver a=
s defined in \ref{devicenormative:Device Types / Network Device / Device Op=
eration / Control Virtqueue / Receive-side scaling (RSS) / RSS processing}.=
<br>&gt; +In case when multiqueue is enabled but the driver did not provide=
 RSS configuration yet, the device SHOULD use automatic receive steering or=
 reasonable internal RSS configuration.<br>&gt; +<br><div><br></div><br>Aft=
er once providing configuration, there's no way to get back to<br>that defa=
ult state, is there? this might be problematic - <br>e.g. this makes debugg=
ing harder.</blockquote><div>It is very simple to get to default state - ju=
st do not send RSS configuration after MQ.<br></div><blockquote style=3D"bo=
rder-left:2px solid #1010FF;margin-left:5px;padding-left:5px;color:#000;fon=
t-weight:normal;font-style:normal;text-decoration:none;font-family:Helvetic=
a,Arial,sans-serif;font-size:12pt;" data-mce-style=3D"border-left: 2px soli=
d #1010FF; margin-left: 5px; padding-left: 5px; color: #000; font-weight: n=
ormal; font-style: normal; text-decoration: none; font-family: Helvetica,Ar=
ial,sans-serif; font-size: 12pt;"><br><div><br></div><br>&gt; &nbsp;Multiqu=
eue is disabled by setting \field{virtqueue_pairs} to 1 (this is<br>&gt; &n=
bsp;the default) and waiting for the device to use the command buffer.<br>&=
gt; &nbsp;<br>&gt; @@ -3741,6 +3790,126 @@ \subsubsection{Control Virtqueue=
}\label{sec:Device Types / Network Device / Devi<br>&gt; &nbsp;according to=
 the native endian of the guest rather than<br>&gt; &nbsp;(necessarily when=
 not using the legacy interface) little-endian.<br>&gt; &nbsp;<br>&gt; +\pa=
ragraph{Receive-side scaling (RSS)}\label{sec:Device Types / Network Device=
 / Device Operation / Control Virtqueue / Receive-side scaling (RSS)}<br>&g=
t; +The device indicates presence of this feature if it supports RSS receiv=
e steering with Toeplitz hash calculation and configurable parameters.<br>&=
gt; +<br>&gt; +\subparagraph{Querying RSS capabilities}\label{sec:Device Ty=
pes / Network Device / Device Operation / Control Virtqueue / Receive-side =
scaling (RSS) / Querying RSS capabilities}<br>&gt; +<br>&gt; +Driver querie=
s RSS capabilities of the device by reading device configuration as defined=
 in \ref{sec:Device Types / Network Device / Device configuration layout / =
RSS}<br>&gt; +<br>&gt; +\subparagraph{Setting RSS parameters}\label{sec:Dev=
ice Types / Network Device / Device Operation / Control Virtqueue / Receive=
-side scaling (RSS) / Setting RSS parameters}<br>&gt; +<br>&gt; +Driver sen=
ds VIRTIO_NET_CTRL_MQ_RSS_CONFIG command using following format for \field{=
command-specific-data}:<br>&gt; +\begin{lstlisting}<br>&gt; +struct virtio_=
net_rss_config {<br>&gt; + &nbsp; &nbsp;le32 hash_types; &nbsp;(bitmask of =
allowed hash types)<br>&gt; + &nbsp; &nbsp;le16 indirection_table_length; (=
number of queue indices in indirection_table array)<br>&gt; + &nbsp; &nbsp;=
le16 unclassified_queue; (queue to place unclassified packets in)<br>&gt; +=
 &nbsp; &nbsp;le16 indirection_table[indirection_table_length];<br>&gt; + &=
nbsp; &nbsp;u8 hash_key_length;<br>&gt; + &nbsp; &nbsp;u8 hash_key_data[has=
h_key_length];<br>&gt; +};<br>&gt; +<br>&gt; +\end{lstlisting}<br>&gt; +\su=
bparagraph{RSS hash types}\label{sec:Device Types / Network Device / Device=
 Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS hash type=
s}<br>&gt; +<br>&gt; +The device calculates hash on IPv4 packets according =
to the field \field{hash_types} of virtio_net_rss_config structure as follo=
ws:<br>&gt; +\begin{itemize}<br>&gt; +\item If VIRTIO_NET_RSS_HASH_TYPE_TCP=
v4 is set and the packet has TCP header, the hash is calculated over follow=
ing fields:<br>&gt; +\begin{itemize}<br>&gt; +\item Source IP address<br>&g=
t; +\item Destination IP address<br>&gt; +\item Source TCP port<br>&gt; +\i=
tem Destination TCP port<br>&gt; +\end{itemize}<br>&gt; +\item Else if VIRT=
IO_NET_RSS_HASH_TYPE_UDPv4 is set and the packet has UDP header, the hash i=
s calculated over following fields:<br>&gt; +\begin{itemize}<br>&gt; +\item=
 Source IP address<br>&gt; +\item Destination IP address<br>&gt; +\item Sou=
rce UDP port<br>&gt; +\item Destination UDP port<br>&gt; +\end{itemize}<br>=
&gt; +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv4 is set, the hash is calcu=
lated over following fields:<br>&gt; +\begin{itemize}<br>&gt; +\item Source=
 IP address<br>&gt; +\item Destination IP address<br>&gt; +\end{itemize}<br=
>&gt; +\item Else the device does not calculate the hash<br>&gt; +\end{item=
ize}<br>&gt; +<br>&gt; +<br>&gt; +The device calculates hash on IPv6 packet=
s without extension headers according to the field \field{hash_types} of vi=
rtio_net_rss_config structure as follows:<br>&gt; +\begin{itemize}<br>&gt; =
+\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set and the packet has TCPv6 he=
ader, the hash is calculated over following fields:<br>&gt; +\begin{itemize=
}<br>&gt; +\item Source IPv6 address<br>&gt; +\item Destination IPv6 addres=
s<br>&gt; +\item Source TCP port<br>&gt; +\item Destination TCP port<br>&gt=
; +\end{itemize}<br>&gt; +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is s=
et and the packet has UDPv6 header, the hash is calculated over following f=
ields:<br>&gt; +\begin{itemize}<br>&gt; +\item Source IPv6 address<br>&gt; =
+\item Destination IPv6 address<br>&gt; +\item Source UDP port<br>&gt; +\it=
em Destination UDP port<br>&gt; +\end{itemize}<br>&gt; +\item Else if VIRTI=
O_NET_RSS_HASH_TYPE_IPv6 is set, the hash is calculated over following fiel=
ds:<br>&gt; +\begin{itemize}<br>&gt; +\item Source IPv6 address<br>&gt; +\i=
tem Destination IPv6 address<br>&gt; +\end{itemize}<br>&gt; +\item Else the=
 device does not calculate the hash<br>&gt; +\end{itemize}<br>&gt; +<br>&gt=
; +<br>&gt; +The device calculates hash on IPv6 packets with extension head=
ers according to the field \field{hash_types} of virtio_net_rss_config stru=
cture as follows:<br>&gt; +\begin{itemize}<br>&gt; +\item If VIRTIO_NET_RSS=
_HASH_TYPE_TCP_EX is set and the packet has TCPv6 header, the hash is calcu=
lated over following fields:<br>&gt; +\begin{itemize}<br>&gt; +\item Home a=
ddress from the home address option in the IPv6 destination options header.=
 If the extension header is not present, use the Source IPv6 address.<br>&g=
t; +\item IPv6 address that is contained in the Routing-Header-Type-2 from =
the associated extension header. If the extension header is not present, us=
e the Destination IPv6 address.<br>&gt; +\item Source TCP port<br>&gt; +\it=
em Destination TCP port<br>&gt; +\end{itemize}<br>&gt; +\item Else if VIRTI=
O_NET_RSS_HASH_TYPE_UDP_EX is set and the packet has UDPv6 header, the hash=
 is calculated over following fields:<br>&gt; +\begin{itemize}<br>&gt; +\it=
em Home address from the home address option in the IPv6 destination option=
s header. If the extension header is not present, use the Source IPv6 addre=
ss.<br>&gt; +\item IPv6 address that is contained in the Routing-Header-Typ=
e-2 from the associated extension header. If the extension header is not pr=
esent, use the Destination IPv6 address.<br>&gt; +\item Source UDP port<br>=
&gt; +\item Destination UDP port<br>&gt; +\end{itemize}<br>&gt; +\item Else=
 if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is calculated over foll=
owing fields:<br>&gt; +\begin{itemize}<br>&gt; +\item Home address from the=
 home address option in the IPv6 destination options header. If the extensi=
on header is not present, use the Source IPv6 address.<br>&gt; +\item IPv6 =
address that is contained in the Routing-Header-Type-2 from the associated =
extension header. If the extension header is not present, use the Destinati=
on IPv6 address.<br>&gt; +\end{itemize}<br>&gt; +\item Else skip IPv6 exten=
sion headers and calculate the hash as defined above for IPv6 packet withou=
t extension headers<br>&gt; +\end{itemize}<br>&gt; +<br>&gt; +<br>&gt; +\dr=
ivernormative{\subparagraph}{Setting RSS parameters}{Device Types / Network=
 Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS)=
 }<br>&gt; +<br>&gt; +A driver MUST NOT set RSS parameters if the feature V=
IRTIO_NET_F_RSS has not been negotiated.<br>&gt; +<br>&gt; +A driver MUST N=
OT set RSS parameters before it successfully enabled operation with multipl=
e queues.<br><div><br></div>Hmm. Meaning what?</blockquote><div>Number of v=
irtqueue pairs the device can use is provided in VIRTIO_NET_CTRL_MQ_VQ_PAIR=
S_SET.<br></div><div>So before that the driver can't set RSS parameters to =
avoid any misunderstanding.<br></div><blockquote style=3D"border-left:2px s=
olid #1010FF;margin-left:5px;padding-left:5px;color:#000;font-weight:normal=
;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-se=
rif;font-size:12pt;" data-mce-style=3D"border-left: 2px solid #1010FF; marg=
in-left: 5px; padding-left: 5px; color: #000; font-weight: normal; font-sty=
le: normal; text-decoration: none; font-family: Helvetica,Arial,sans-serif;=
 font-size: 12pt;"><br><div><br></div>&gt; +<br>&gt; +A driver MUST fill \f=
ield{indirection_table} array only with indices of enabled queues.<br><div>=
<br></div>Enabled using the transport enable flag?</blockquote><div>TODO: c=
hange to:<br></div><div>A driver MUST NOT fill \field{indirection_table} ar=
ray only with indices greater than number of virtqueue pairs set by VIRTIO_=
NET_CTRL_MQ_VQ_PAIRS_SET.</div><blockquote style=3D"border-left:2px solid #=
1010FF;margin-left:5px;padding-left:5px;color:#000;font-weight:normal;font-=
style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;fo=
nt-size:12pt;" data-mce-style=3D"border-left: 2px solid #1010FF; margin-lef=
t: 5px; padding-left: 5px; color: #000; font-weight: normal; font-style: no=
rmal; text-decoration: none; font-family: Helvetica,Arial,sans-serif; font-=
size: 12pt;"><br>Do we keep the requirement that even virtqueues are RX and=
 odd ones are TX?</blockquote><div>TODO: clarify<br></div><div>Redirection =
table contains 0-based indices of virtqueue pairs, the device uses respecti=
ve receiveq.<br></div><blockquote style=3D"border-left:2px solid #1010FF;ma=
rgin-left:5px;padding-left:5px;color:#000;font-weight:normal;font-style:nor=
mal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:1=
2pt;" data-mce-style=3D"border-left: 2px solid #1010FF; margin-left: 5px; p=
adding-left: 5px; color: #000; font-weight: normal; font-style: normal; tex=
t-decoration: none; font-family: Helvetica,Arial,sans-serif; font-size: 12p=
t;"><br><div><br></div><br>Please write virtqueues not queues.</blockquote>=
<div>OK<br></div><blockquote style=3D"border-left:2px solid #1010FF;margin-=
left:5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;t=
ext-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"=
 data-mce-style=3D"border-left: 2px solid #1010FF; margin-left: 5px; paddin=
g-left: 5px; color: #000; font-weight: normal; font-style: normal; text-dec=
oration: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><=
br><div><br></div>&gt; +<br>&gt; +An \field{indirection_table_length} MUST =
be power of two.<br><div><br></div>"a power of two"?<br></blockquote><div>O=
K<br></div><blockquote style=3D"border-left:2px solid #1010FF;margin-left:5=
px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;text-de=
coration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" data-=
mce-style=3D"border-left: 2px solid #1010FF; margin-left: 5px; padding-left=
: 5px; color: #000; font-weight: normal; font-style: normal; text-decoratio=
n: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;">or 0 I =
guess? If you want 2^16 values? If yes need to clarify where<br>indirection=
_table is defined.<br></blockquote><div>I did not mean that as I do not exp=
ect 2^16 CPUs.<br></div><div>My intention was that 0 is no table and the de=
vice uses only default one.<br></div><blockquote style=3D"border-left:2px s=
olid #1010FF;margin-left:5px;padding-left:5px;color:#000;font-weight:normal=
;font-style:normal;text-decoration:none;font-family:Helvetica,Arial,sans-se=
rif;font-size:12pt;" data-mce-style=3D"border-left: 2px solid #1010FF; marg=
in-left: 5px; padding-left: 5px; color: #000; font-weight: normal; font-sty=
le: normal; text-decoration: none; font-family: Helvetica,Arial,sans-serif;=
 font-size: 12pt;"><br><div><br></div>&gt; +<br>&gt; +A driver MUST NOT set=
 any VIRTIO_NET_RSS_HASH_TYPE_ flags that are not supported by device.<br>&=
gt; +<br>&gt; +\devicenormative{\subparagraph}{RSS processing}{Device Types=
 / Network Device / Device Operation / Control Virtqueue / Receive-side sca=
ling (RSS) / RSS processing}<br>&gt; +If the device reports support for VIR=
TIO_NET_F_RSS it MUST support keys of at least 40 bytes and indirection tab=
le of at least 128 entries.<br>&gt; +<br>&gt; +The device MUST determine de=
stination queue for network packet as follows:<br>&gt; +\begin{itemize}<br>=
&gt; +\item Calculate hash of the packet as defined in \ref{sec:Device Type=
s / Network Device / Device Operation / Control Virtqueue / Receive-side sc=
aling (RSS) / RSS hash types}<br>&gt; +\item If the device did not calculat=
e the hash for specific packet, the device directs the packet to the queue =
specified by \field{unclassified_queue} of virtio_net_rss_config structure<=
br>&gt; +\item Apply mask of (indirection_table_length - 1) to the calculat=
ed hash and use the result as the index in the indirection table to get 0-b=
ased number of destination receive queue<br><div><br></div>So if I get the =
value 2, is this VQ 2? Or is it RX queue 2, VQ 4?<br><div><br></div>I am gu=
essing you mean <br>receiveq1. . .receiveqN<br><div><br></div>but these are=
 1-based not 0-based.<br><div><br></div>So maybe document here (0 correspon=
ding to receiveq1, 1 to receiveq2 and so on).</blockquote><div>OK, I will c=
larify<br></div><blockquote style=3D"border-left:2px solid #1010FF;margin-l=
eft:5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;te=
xt-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;" =
data-mce-style=3D"border-left: 2px solid #1010FF; margin-left: 5px; padding=
-left: 5px; color: #000; font-weight: normal; font-style: normal; text-deco=
ration: none; font-family: Helvetica,Arial,sans-serif; font-size: 12pt;"><b=
r><div><br></div><br>&gt; +\end{itemize}<br>&gt; +<br>&gt; &nbsp;\paragraph=
{Offloads State Configuration}\label{sec:Device Types / Network Device / De=
vice Operation / Control Virtqueue / Offloads State Configuration}<br>&gt; =
&nbsp;<br>&gt; &nbsp;If the VIRTIO_NET_F_CTRL_GUEST_OFFLOADS feature is neg=
otiated, the driver can<br>&gt; -- <br>&gt; 2.17.2<br><div><br></div><br>Th=
is publicly archived list offers a means to provide input to the <br>OASIS =
Virtual I/O Device (VIRTIO) TC. <br><div><br></div>In order to verify user =
consent to the Feedback License terms and <br>to minimize spam in the list =
archive, subscription is required <br>before posting. <br><div><br></div>Su=
bscribe: virtio-comment-subscribe@lists.oasis-open.org <br>Unsubscribe: vir=
tio-comment-unsubscribe@lists.oasis-open.org <br>List help: virtio-comment-=
help@lists.oasis-open.org <br>List archive: https://lists.oasis-open.org/ar=
chives/virtio-comment/ <br>Feedback License: https://www.oasis-open.org/who=
/ipr/feedback_license.pdf <br>List Guidelines: https://www.oasis-open.org/p=
olicies-guidelines/mailing-lists <br>Committee: https://www.oasis-open.org/=
committees/virtio/ <br>Join OASIS: https://www.oasis-open.org/join/<br><div=
><br></div></blockquote><div><br></div></div></body></html>
------=_Part_6516590_32048604.1571930874602--

