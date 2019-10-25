Return-Path: virtio-comment-return-883-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CAD789860CD
	for <virtio-comment@lists.oasis-open.org>; Fri, 25 Oct 2019 08:15:07 +0000 (UTC)
MIME-Version: 1.0
References: <20191016075032.83600-1-yuri.benditovich@daynix.com>
 <20191016075032.83600-2-yuri.benditovich@daynix.com> <20191023202428-mutt-send-email-mst@kernel.org>
 <1769975678.6516591.1571930874603.JavaMail.zimbra@redhat.com> <20191024114034-mutt-send-email-mst@kernel.org>
In-Reply-To: <20191024114034-mutt-send-email-mst@kernel.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Fri, 25 Oct 2019 11:14:53 +0300
Message-ID: <CAOEp5Oea+P5jK+9Y4rc0RbHkVQcR+FJNfAWnEK8018K6j83xmw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v2 1/1] virtio-net: define support
 for receive-side scaling
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yuri Benditovich <ybendito@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Oct 24, 2019 at 6:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Oct 24, 2019 at 11:27:54AM -0400, Yuri Benditovich wrote:
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
> >     From: "Michael S. Tsirkin" <mst@redhat.com>
> >     To: "Yuri Benditovich" <yuri.benditovich@daynix.com>
> >     Cc: virtio-comment@lists.oasis-open.org
> >     Sent: Thursday, October 24, 2019 4:52:39 PM
> >     Subject: [virtio-comment] Re: [PATCH v2 1/1] virtio-net: define sup=
port for
> >     receive-side scaling
> >
> >     On Wed, Oct 16, 2019 at 10:50:32AM +0300, Yuri Benditovich wrote:
> >     > Fixes https://github.com/oasis-tcs/virtio-spec/issues/48
> >     > Added support for RSS receive steering mode.
> >     >
> >     > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> >     > ---
> >     >  conformance.tex |   2 +
> >     >  content.tex     | 181 ++++++++++++++++++++++++++++++++++++++++++=
++++--
> >     >  2 files changed, 177 insertions(+), 6 deletions(-)
> >     >
> >     > diff --git a/conformance.tex b/conformance.tex
> >     > index 0ac58aa..01449c5 100644
> >     > --- a/conformance.tex
> >     > +++ b/conformance.tex
> >     > @@ -101,6 +101,7 @@ \section{Conformance Targets}\label{sec:Confo=
rmance /
> >     Conformance Targets}
> >     >  \item \ref{drivernormative:Device Types / Network Device / Devic=
e
> >     Operation / Control Virtqueue / Gratuitous Packet Sending}
> >     >  \item \ref{drivernormative:Device Types / Network Device / Devic=
e
> >     Operation / Control Virtqueue / Automatic receive steering in multi=
queue
> >     mode}
> >     >  \item \ref{drivernormative:Device Types / Network Device / Devic=
e
> >     Operation / Control Virtqueue / Offloads State Configuration / Sett=
ing
> >     Offloads State}
> >     > +\item \ref{drivernormative:Device Types / Network Device / Devic=
e
> >     Operation / Control Virtqueue / Receive-side scaling (RSS) }
> >     >  \end{itemize}
> >     >
> >     >  \conformance{\subsection}{Block Driver Conformance}\label
> >     {sec:Conformance / Driver Conformance / Block Driver Conformance}
> >     > @@ -257,6 +258,7 @@ \section{Conformance Targets}\label{sec:Confo=
rmance /
> >     Conformance Targets}
> >     >  \item \ref{devicenormative:Device Types / Network Device / Devic=
e
> >     Operation / Control Virtqueue / Setting MAC Address Filtering}
> >     >  \item \ref{devicenormative:Device Types / Network Device / Devic=
e
> >     Operation / Control Virtqueue / Gratuitous Packet Sending}
> >     >  \item \ref{devicenormative:Device Types / Network Device / Devic=
e
> >     Operation / Control Virtqueue / Automatic receive steering in multi=
queue
> >     mode}
> >     > +\item \ref{devicenormative:Device Types / Network Device / Devic=
e
> >     Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS
> >     processing}
> >     >  \end{itemize}
> >     >
> >     >  \conformance{\subsection}{Block Device Conformance}\label
> >     {sec:Conformance / Device Conformance / Block Device Conformance}
> >     > diff --git a/content.tex b/content.tex
> >     > index 679391e..1e0c9b0 100644
> >     > --- a/content.tex
> >     > +++ b/content.tex
> >     > @@ -2811,6 +2811,9 @@ \subsection{Feature bits}\label{sec:Device =
Types /
> >     Network Device / Feature bits
> >     >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through co=
ntrol
> >     >      channel.
> >     >
> >     > +\item[VIRTIO_NET_F_RSS(60)] Device supports RSS (receive-side sc=
aling)
> >     > +    with Toeplitz hash calculation and configurable hash paramet=
ers for
> >     receive steering
> >     > +
> >     >  \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated AC=
Ks
> >     >      and report number of coalesced segments and duplicated ACKs
> >     >
> >     > @@ -2840,6 +2843,7 @@ \subsubsection{Feature bit requirements}\la=
bel
> >     {sec:Device Types / Network Device
> >     >  \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
> >     >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
> >     >  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or
> >     VIRTIO_NET_F_HOST_TSO6.
> >     > +\item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_MQ
> >     >  \end{description}
> >     >
> >     >  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device =
Types /
> >     Network Device / Feature bits / Legacy Interface: Feature bits}
> >     > @@ -2854,7 +2858,7 @@ \subsubsection{Legacy Interface: Feature bi=
ts}\
> >     label{sec:Device Types / Network
> >     >  \subsection{Device configuration layout}\label{sec:Device Types =
/
> >     Network Device / Device configuration layout}
> >     >  \label{sec:Device Types / Block Device / Feature bits / Device
> >     configuration layout}
> >     >
> >     > -Three driver-read-only configuration fields are currently define=
d. The \
> >     field{mac} address field
> >     > +Device configuration fields are listed below, they are read-only=
 for a
> >     driver. The \field{mac} address field
> >     >  always exists (though is only valid if VIRTIO_NET_F_MAC is set),=
 and
> >     >  \field{status} only exists if VIRTIO_NET_F_STATUS is set. Two
> >     >  read-only bits (for the driver) are currently defined for the st=
atus
> >     field:
> >     > @@ -2875,14 +2879,49 @@ \subsection{Device configuration layout}\=
label
> >     {sec:Device Types / Network Device
> >     >  VIRTIO_NET_F_MTU is set. This field specifies the maximum MTU fo=
r the
> >     driver to
> >     >  use.
> >     >
> >     > +Two following fields, \field{speed} and \field{duplex} are reser=
ved.
> >     >  \begin{lstlisting}
> >     >  struct virtio_net_config {
> >     >          u8 mac[6];
> >     >          le16 status;
> >     >          le16 max_virtqueue_pairs;
> >     >          le16 mtu;
> >     > +        le32 speed;
> >     > +        u8 duplex;
> >     > +        u8 rss_max_key_size;
> >     > +        le16 rss_max_indirection_table_length;
> >     > +        le32 rss_supported_hash_types;
> >     >  };
> >     >  \end{lstlisting}
> >     > +\label{sec:Device Types / Network Device / Device configuration =
layout /
> >     RSS}
> >     > +Three following fields, \field{rss_max_key_size}, \field
> >     {rss_max_indirection_table_length}
> >     > +and \field{rss_supported_hash_types} only exist if VIRTIO_NET_F_=
RSS is
> >     set.
> >     > +
> >     > +Field \field{rss_max_key_size} specifies maximal supported lengt=
h of RSS
> >     key in bytes.
> >     > +
> >     > +Field \field{rss_max_indirection_table_length} specifies maximal=
 number
> >     of 16-bit entries in RSS indirection table.
> >     > +
> >     > +Field \field{rss_supported_hash_types} contains bitmask of suppo=
rted RSS
> >     hash types.
> >     > +
> >     > +Hash types applicable for IPv4 packets:
> >     > +\begin{lstlisting}
> >     > +#define VIRTIO_NET_RSS_HASH_TYPE_IPv4              (1 << 0)
> >     > +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4             (1 << 1)
> >     > +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4             (1 << 2)
> >     > +\end{lstlisting}
> >     > +Hash types applicable for IPv6 packets without extension headers
> >     > +\begin{lstlisting}
> >     > +#define VIRTIO_NET_RSS_HASH_TYPE_IPv6              (1 << 3)
> >     > +#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6             (1 << 4)
> >     > +#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6             (1 << 5)
> >     > +\end{lstlisting}
> >     > +Hash types applicable for IPv6 packets with extension headers
> >     > +\begin{lstlisting}
> >     > +#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX             (1 << 6)
> >     > +#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX            (1 << 7)
> >     > +#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX            (1 << 8)
> >     > +\end{lstlisting}
> >     > +For exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref{se=
c:Device
> >     Types / Network Device / Device Operation / Control Virtqueue /
> >     Receive-side scaling (RSS) / RSS hash types}.
> >     >
> >     >  \devicenormative{\subsubsection}{Device configuration layout}{De=
vice
> >     Types / Network Device / Device configuration layout}
> >     >
> >     > @@ -3684,14 +3723,16 @@ \subsubsection{Control Virtqueue}\label
> >     {sec:Device Types / Network Device / Devi
> >     >  depending on the packet flow.
> >     >
> >     >  \begin{lstlisting}
> >     > -struct virtio_net_ctrl_mq {
> >     > -        le16 virtqueue_pairs;
> >     > -};
> >     > -
> >     >  #define VIRTIO_NET_CTRL_MQ    4
> >     >   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0
> >     > + struct virtio_net_ctrl_mq_pairs_set {
> >     > +        le16 virtqueue_pairs;
> >     > + };
> >     > +
> >     >   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN        1
> >     >   #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX        0x8000
> >     > +
> >     > + #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
> >     >  \end{lstlisting}
> >     >
> >     >  Multiqueue is disabled by default. The driver enables multiqueue=
 by
> >     > @@ -3701,7 +3742,11 @@ \subsubsection{Control Virtqueue}\label{se=
c:Device
> >     Types / Network Device / Devi
> >     >  transmitq1\ldots transmitqn and receiveq1\ldots receiveqn where
> >     >  n=3D\field{virtqueue_pairs} MAY be used.
> >     >
> >     > -When multiqueue is enabled, the device MUST use automatic receiv=
e
> >     steering
> >     > +After the driver enabled multiqueue
> >
> >     enabled how?
> >
> > with VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET, according to previous paragraph, =
several
> > lines above.
>
> Oh right.
>
> >
> >
> >     > and if the feature VIRTIO_NET_F_RSS is negotiated,
> >     > +the driver MAY execute VIRTIO_NET_CTRL_MQ_RSS_CONFIG command to =
set
> >     exact parameters for
> >     > +RSS receive steering.
> >     > +
> >     > +When multiqueue is enabled and the device feature VIRTIO_NET_F_R=
SS is
> >     not negotiated, the device MUST use automatic receive steering
> >     >  based on packet flow. Programming of the receive steering
> >     >  classificator is implicit. After the driver transmitted a packet=
 of a
> >     >  flow on transmitqX, the device SHOULD cause incoming packets for=
 that
> >     flow to
> >
> >
> >     Isn't there value is allowing devices to support RSS but not auto R=
FS?
> >
> > Because automatic steering implementation is best effort anyway (the de=
vice
> > SHOULD), I do not think we need to state this explicitly.
>
> Well it's a quality of implementation issue.
> If there's no automatic RFS then driver really should use RSS.
> If there's automatic RFS then it depends on a bunch of
> factors which is better.
>
> If device does not do RFS we really want driver to know about this.

We can use bit 31 of supported hashes to indicate that the device
requires RSS setting for optimal steering.
Such device has all the configured vqs prepared upon MQ command but
typically uses only receive1 until it receives RSS setting.

>
>
> > There is anyway 2 cases when the device need to do something:
> > 1. It is configured for MQ, but the RSS is not configured and VIRTIO_NE=
T_F_RSS
> > is not acked by the host
> > 2. It is configured for MQ, VIRTIO_NET_F_RSS acked, but the RSS is not
> > configured (for example, the OS configuration is 'not to use RSS'
> >
> > If the device supports RSS but does not support optimal automatic steer=
ing, it
> > still need to live somehow in 2 scenarios above.
> > IMO, RSS is an addition to MQ, not an alternative.
> > Number of pairs to use if defined according to CPUs/IRQs/resources and =
specific
> > usage of each one is defined by RSS.
>
>
> Well what we call MQ is automatic RFS. That part is disabled
> when you enable RSS, and it seems wasteful to enable
> it temporarily - in particular because
> automatic RFS can use up lots of resources.
>
>
>
> >
> >
> >
> >     Looks like the only thing we need from MQ is ability to
> >     support VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET with value of 1 as
> >     a way to disable RSS - is that right?
> >
> > VQ_PAIRS_SET=3D1 disables multiqueue and everything related to it in th=
e device.
> > It was in the spec from the beginning, so I do not want to touch it, bu=
t I do
> > not see any motivation in the driver to issue this command (unless all =
the CPUs
> > except the single one were unplugged)
> >
> >
> >
> >     If yes, let's just add a new command that works with either
> >     VIRTIO_NET_F_RSS or VIRTIO_NET_F_MQ?
> >     Or special-case VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET with value of 1,
> >     and allow that also with VIRTIO_NET_F_RSS?
> >
> > IMO it is allowed by definition, as F_RSS requires F_MQ.
> >
> >
> >
> >
> >     > @@ -3709,6 +3754,10 @@ \subsubsection{Control Virtqueue}\label{se=
c:Device
> >     Types / Network Device / Devi
> >     >  no packets have been transmitted yet, the device MAY steer a pac=
ket
> >     >  to a random queue out of the specified receiveq1\ldots receiveqn=
.
> >     >
> >     > +When multiqueue is enabled and the device feature VIRTIO_NET_F_R=
SS is
> >     negotiated, the device MUST use RSS receive steering
> >     > +according to the configuration provided by the driver as defined=
 in \ref
> >     {devicenormative:Device Types / Network Device / Device Operation /=
 Control
> >     Virtqueue / Receive-side scaling (RSS) / RSS processing}.
> >     > +In case when multiqueue is enabled but the driver did not provid=
e RSS
> >     configuration yet, the device SHOULD use automatic receive steering=
 or
> >     reasonable internal RSS configuration.
> >     > +
> >
> >
> >     After once providing configuration, there's no way to get back to
> >     that default state, is there? this might be problematic -
> >     e.g. this makes debugging harder.
> >
> > It is very simple to get to default state - just do not send RSS config=
uration
> > after MQ.
>
> What if I sent it, and want to revert? There's value in being able to
> get back to the original state.
>

If we define initial setting for a device with RSS and without
automatic steering (as suggested above), this can be done by trivial
RSS configuration (hashes =3D none, default =3D 0).

>
> >
> >
> >
> >     >  Multiqueue is disabled by setting \field{virtqueue_pairs} to 1 (=
this is
> >     >  the default) and waiting for the device to use the command buffe=
r.
> >     >
> >     > @@ -3741,6 +3790,126 @@ \subsubsection{Control Virtqueue}\label
> >     {sec:Device Types / Network Device / Devi
> >     >  according to the native endian of the guest rather than
> >     >  (necessarily when not using the legacy interface) little-endian.
> >     >
> >     > +\paragraph{Receive-side scaling (RSS)}\label{sec:Device Types / =
Network
> >     Device / Device Operation / Control Virtqueue / Receive-side scalin=
g (RSS)}
> >     > +The device indicates presence of this feature if it supports RSS=
 receive
> >     steering with Toeplitz hash calculation and configurable parameters=
.
> >     > +
> >     > +\subparagraph{Querying RSS capabilities}\label{sec:Device Types =
/
> >     Network Device / Device Operation / Control Virtqueue / Receive-sid=
e
> >     scaling (RSS) / Querying RSS capabilities}
> >     > +
> >     > +Driver queries RSS capabilities of the device by reading device
> >     configuration as defined in \ref{sec:Device Types / Network Device =
/ Device
> >     configuration layout / RSS}
> >     > +
> >     > +\subparagraph{Setting RSS parameters}\label{sec:Device Types / N=
etwork
> >     Device / Device Operation / Control Virtqueue / Receive-side scalin=
g (RSS)
> >     / Setting RSS parameters}
> >     > +
> >     > +Driver sends VIRTIO_NET_CTRL_MQ_RSS_CONFIG command using followi=
ng
> >     format for \field{command-specific-data}:
> >     > +\begin{lstlisting}
> >     > +struct virtio_net_rss_config {
> >     > +    le32 hash_types;  (bitmask of allowed hash types)
> >     > +    le16 indirection_table_length; (number of queue indices in
> >     indirection_table array)
> >     > +    le16 unclassified_queue; (queue to place unclassified packet=
s in)
> >     > +    le16 indirection_table[indirection_table_length];
> >     > +    u8 hash_key_length;
> >     > +    u8 hash_key_data[hash_key_length];
> >     > +};
> >     > +
> >     > +\end{lstlisting}
> >     > +\subparagraph{RSS hash types}\label{sec:Device Types / Network D=
evice /
> >     Device Operation / Control Virtqueue / Receive-side scaling (RSS) /=
 RSS
> >     hash types}
> >     > +
> >     > +The device calculates hash on IPv4 packets according to the fiel=
d \field
> >     {hash_types} of virtio_net_rss_config structure as follows:
> >     > +\begin{itemize}
> >     > +\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv4 is set and the packet ha=
s TCP
> >     header, the hash is calculated over following fields:
> >     > +\begin{itemize}
> >     > +\item Source IP address
> >     > +\item Destination IP address
> >     > +\item Source TCP port
> >     > +\item Destination TCP port
> >     > +\end{itemize}
> >     > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set and the pack=
et has
> >     UDP header, the hash is calculated over following fields:
> >     > +\begin{itemize}
> >     > +\item Source IP address
> >     > +\item Destination IP address
> >     > +\item Source UDP port
> >     > +\item Destination UDP port
> >     > +\end{itemize}
> >     > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv4 is set, the hash is
> >     calculated over following fields:
> >     > +\begin{itemize}
> >     > +\item Source IP address
> >     > +\item Destination IP address
> >     > +\end{itemize}
> >     > +\item Else the device does not calculate the hash
> >     > +\end{itemize}
> >     > +
> >     > +
> >     > +The device calculates hash on IPv6 packets without extension hea=
ders
> >     according to the field \field{hash_types} of virtio_net_rss_config
> >     structure as follows:
> >     > +\begin{itemize}
> >     > +\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set and the packet ha=
s TCPv6
> >     header, the hash is calculated over following fields:
> >     > +\begin{itemize}
> >     > +\item Source IPv6 address
> >     > +\item Destination IPv6 address
> >     > +\item Source TCP port
> >     > +\item Destination TCP port
> >     > +\end{itemize}
> >     > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is set and the pack=
et has
> >     UDPv6 header, the hash is calculated over following fields:
> >     > +\begin{itemize}
> >     > +\item Source IPv6 address
> >     > +\item Destination IPv6 address
> >     > +\item Source UDP port
> >     > +\item Destination UDP port
> >     > +\end{itemize}
> >     > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv6 is set, the hash is
> >     calculated over following fields:
> >     > +\begin{itemize}
> >     > +\item Source IPv6 address
> >     > +\item Destination IPv6 address
> >     > +\end{itemize}
> >     > +\item Else the device does not calculate the hash
> >     > +\end{itemize}
> >     > +
> >     > +
> >     > +The device calculates hash on IPv6 packets with extension header=
s
> >     according to the field \field{hash_types} of virtio_net_rss_config
> >     structure as follows:
> >     > +\begin{itemize}
> >     > +\item If VIRTIO_NET_RSS_HASH_TYPE_TCP_EX is set and the packet h=
as TCPv6
> >     header, the hash is calculated over following fields:
> >     > +\begin{itemize}
> >     > +\item Home address from the home address option in the IPv6 dest=
ination
> >     options header. If the extension header is not present, use the Sou=
rce IPv6
> >     address.
> >     > +\item IPv6 address that is contained in the Routing-Header-Type-=
2 from
> >     the associated extension header. If the extension header is not pre=
sent,
> >     use the Destination IPv6 address.
> >     > +\item Source TCP port
> >     > +\item Destination TCP port
> >     > +\end{itemize}
> >     > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the pac=
ket has
> >     UDPv6 header, the hash is calculated over following fields:
> >     > +\begin{itemize}
> >     > +\item Home address from the home address option in the IPv6 dest=
ination
> >     options header. If the extension header is not present, use the Sou=
rce IPv6
> >     address.
> >     > +\item IPv6 address that is contained in the Routing-Header-Type-=
2 from
> >     the associated extension header. If the extension header is not pre=
sent,
> >     use the Destination IPv6 address.
> >     > +\item Source UDP port
> >     > +\item Destination UDP port
> >     > +\end{itemize}
> >     > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is
> >     calculated over following fields:
> >     > +\begin{itemize}
> >     > +\item Home address from the home address option in the IPv6 dest=
ination
> >     options header. If the extension header is not present, use the Sou=
rce IPv6
> >     address.
> >     > +\item IPv6 address that is contained in the Routing-Header-Type-=
2 from
> >     the associated extension header. If the extension header is not pre=
sent,
> >     use the Destination IPv6 address.
> >     > +\end{itemize}
> >     > +\item Else skip IPv6 extension headers and calculate the hash as=
 defined
> >     above for IPv6 packet without extension headers
> >     > +\end{itemize}
> >     > +
> >     > +
> >     > +\drivernormative{\subparagraph}{Setting RSS parameters}{Device T=
ypes /
> >     Network Device / Device Operation / Control Virtqueue / Receive-sid=
e
> >     scaling (RSS) }
> >     > +
> >     > +A driver MUST NOT set RSS parameters if the feature VIRTIO_NET_F=
_RSS has
> >     not been negotiated.
> >     > +
> >     > +A driver MUST NOT set RSS parameters before it successfully enab=
led
> >     operation with multiple queues.
> >
> >     Hmm. Meaning what?
> >
> > Number of virtqueue pairs the device can use is provided in
> > VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET.
> > So before that the driver can't set RSS parameters to avoid any
> > misunderstanding.
> >
>
> Well with RSS there's no real reason to specify vq pairs -
> we list the active vqs explicitly.

In general, this is not correct.
RSS settings lists only receive vqs in the indirection table + default
receive vq (which could be not in the table).
The driver still can use any enabled transmit vq. So this setting is
still needed as the device should know how much vq pairs it can use.
If the device need to calculate value of max vq pairs instead of
receiving if clearly, this really can create misunderstang.

> That redundancy in interface looks inelegant and can be a source of bugs,
> as in different devices behaving differently, drivers working
> with one device will fail with another.
> It's better to avoid such redundancy if we can.
>

My suggestion is:
Any MQ capable device (with or without RFS) receive
VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET to configure max vq pairs.
If the device indicates that it does not have RFS (bit 31 in supported
hash bitmap), it SHOULD use only receiveq1 until it receives RSS
parameters.
Then we do not have any redundancy.

>
> >
> >     > +
> >     > +A driver MUST fill \field{indirection_table} array only with ind=
ices of
> >     enabled queues.
> >
> >     Enabled using the transport enable flag?
> >
> > TODO: change to:
> > A driver MUST NOT fill \field{indirection_table} array only with indice=
s
> > greater than number of virtqueue pairs set by VIRTIO_NET_CTRL_MQ_VQ_PAI=
RS_SET.
> >
> >
> >     Do we keep the requirement that even virtqueues are RX and odd ones=
 are TX?
> >
> > TODO: clarify
> > Redirection table contains 0-based indices of virtqueue pairs, the devi=
ce uses
> > respective receiveq.
>
>
>
>
> >
> >
> >
> >     Please write virtqueues not queues.
> >
> > OK
> >
> >
> >
> >     > +
> >     > +An \field{indirection_table_length} MUST be power of two.
> >
> >     "a power of two"?
> >
> > OK
> >
> >     or 0 I guess? If you want 2^16 values? If yes need to clarify where
> >     indirection_table is defined.
> >
> > I did not mean that as I do not expect 2^16 CPUs.
> > My intention was that 0 is no table and the device uses only default on=
e.
> >
>
> well you did say a power of two and that excludes 0.
>
> yet another way is to disable all hash masks.
>
> So let's just pass the hash mask then?
> indirection_table_mask
>
> and the requirement is that indirection_table_mask + 1 must be a power of=
 2.

OK to save time.

>
>
> >
> >     > +
> >     > +A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that a=
re not
> >     supported by device.
> >     > +
> >     > +\devicenormative{\subparagraph}{RSS processing}{Device Types / N=
etwork
> >     Device / Device Operation / Control Virtqueue / Receive-side scalin=
g (RSS)
> >     / RSS processing}
> >     > +If the device reports support for VIRTIO_NET_F_RSS it MUST suppo=
rt keys
> >     of at least 40 bytes and indirection table of at least 128 entries.
> >     > +
> >     > +The device MUST determine destination queue for network packet a=
s
> >     follows:
> >     > +\begin{itemize}
> >     > +\item Calculate hash of the packet as defined in \ref{sec:Device=
 Types /
> >     Network Device / Device Operation / Control Virtqueue / Receive-sid=
e
> >     scaling (RSS) / RSS hash types}
> >     > +\item If the device did not calculate the hash for specific pack=
et, the
> >     device directs the packet to the queue specified by \field
> >     {unclassified_queue} of virtio_net_rss_config structure
> >     > +\item Apply mask of (indirection_table_length - 1) to the calcul=
ated
> >     hash and use the result as the index in the indirection table to ge=
t
> >     0-based number of destination receive queue
> >
> >     So if I get the value 2, is this VQ 2? Or is it RX queue 2, VQ 4?
> >
> >     I am guessing you mean
> >     receiveq1. . .receiveqN
> >
> >     but these are 1-based not 0-based.
> >
> >     So maybe document here (0 corresponding to receiveq1, 1 to receiveq=
2 and so
> >     on).
> >
> > OK, I will clarify
> >
> >
> >
> >
> >     > +\end{itemize}
> >     > +
> >     >  \paragraph{Offloads State Configuration}\label{sec:Device Types =
/
> >     Network Device / Device Operation / Control Virtqueue / Offloads St=
ate
> >     Configuration}
> >     >
> >     >  If the VIRTIO_NET_F_CTRL_GUEST_OFFLOADS feature is negotiated, t=
he
> >     driver can
> >     > --
> >     > 2.17.2
> >
> >
> >     This publicly archived list offers a means to provide input to the
> >     OASIS Virtual I/O Device (VIRTIO) TC.
> >
> >     In order to verify user consent to the Feedback License terms and
> >     to minimize spam in the list archive, subscription is required
> >     before posting.
> >
> >     Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >     Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >     List help: virtio-comment-help@lists.oasis-open.org
> >     List archive: https://lists.oasis-open.org/archives/virtio-comment/
> >     Feedback License: https://www.oasis-open.org/who/ipr/feedback_licen=
se.pdf
> >     List Guidelines: https://www.oasis-open.org/policies-guidelines/
> >     mailing-lists
> >     Committee: https://www.oasis-open.org/committees/virtio/
> >     Join OASIS: https://www.oasis-open.org/join/
> >
> >
> >

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

