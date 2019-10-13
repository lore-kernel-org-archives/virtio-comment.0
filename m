Return-Path: virtio-comment-return-862-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E8397984017
	for <virtio-comment@lists.oasis-open.org>; Sun, 13 Oct 2019 10:28:13 +0000 (UTC)
MIME-Version: 1.0
References: <20191002164139.37819-1-yuri.benditovich@daynix.com> <20191011103139-mutt-send-email-mst@kernel.org>
In-Reply-To: <20191011103139-mutt-send-email-mst@kernel.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Sun, 13 Oct 2019 13:27:59 +0300
Message-ID: <CAOEp5Oc0YiKfgvtDMnR4=tkDvDFgW1bq2uU2TjdYFN4Em=7RHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [virtio-comment] [PATCH] virtio-net: define support for
 receive-side scaling
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Sat, Oct 12, 2019 at 7:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Oct 02, 2019 at 07:41:39PM +0300, Yuri Benditovich wrote:
> > Added support for RSS receive steering mode.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
>
>
> Thanks!
> So I would like this to be a bit flatter in the device memory,
> such that these are easier to intercept.
> See below for detail.
>
>
>
> > ---
> >  conformance.tex |   2 +
> >  content.tex     | 170 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 172 insertions(+)
>
> So the description of the new functionality is reasonable, but it looks
> like you didn't yet go over the existing text and see that
> it makes sense with the new one.
>
> For example, a cursory look gave me statements like
>
>         When multiqueue is enabled, the device MUST use automatic receive steering
>         based on packet flow.
>
> or
>
>         Multiqueue is disabled by default. The driver enables multiqueue by
>         executing the VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command, specifying
>         the number of the transmit and receive queues to be used up to
>         \field{max_virtqueue_pairs}; subsequently,
>         transmitq1\ldots transmitqn and receiveq1\ldots receiveqn where
>         n=\field{virtqueue_pairs} MAY be used.
>
>
> we need to change the existing text separating multiqueue operation
> that applies to both auto steering and to RSS, and auto steering proper.

I agree. I'll make respective changes in v2

>
> I also think that it's not wise to always require auto steering
> support like your text does: auto steering might be
> expensive for hardware to implement, RSS might be easier.
>

I agree that exact definition of how auto streering works should be changed.
I'll try to make it less imperative, probably using existing
definition as an example of implementation and not a mandatory
requirement.

>
>
>
> > diff --git a/conformance.tex b/conformance.tex
> > index 0ac58aa..bd31ba3 100644
> > --- a/conformance.tex
> > +++ b/conformance.tex
> > @@ -101,6 +101,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> >  \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Gratuitous Packet Sending}
> >  \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Automatic receive steering in multiqueue mode}
> >  \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Offloads State Configuration / Setting Offloads State}
> > +\item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / Using RSS commands}
> >  \end{itemize}
> >
> >  \conformance{\subsection}{Block Driver Conformance}\label{sec:Conformance / Driver Conformance / Block Driver Conformance}
> > @@ -257,6 +258,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> >  \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Setting MAC Address Filtering}
> >  \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Gratuitous Packet Sending}
> >  \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Automatic receive steering in multiqueue mode}
> > +\item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS processing}
> >  \end{itemize}
> >
> >  \conformance{\subsection}{Block Device Conformance}\label{sec:Conformance / Device Conformance / Block Device Conformance}
> > diff --git a/content.tex b/content.tex
> > index 679391e..5672299 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2811,6 +2811,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
> >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
> >      channel.
> >
> > +\item[VIRTIO_NET_F_RSS(60)] Device supports RSS (receive-side scaling)
> > +    with Toeplitz hash calculation and configurable hash parameters for receive steering
> > +
> >  \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
> >      and report number of coalesced segments and duplicated ACKs
> >
> > @@ -2840,6 +2843,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
> >  \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
> >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
> >  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
> > +\item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_MQ
> >  \end{description}
> >
> >  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Network Device / Feature bits / Legacy Interface: Feature bits}
> > @@ -3785,6 +3789,172 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> >  according to the native endian of the guest rather than
> >  (necessarily when not using the legacy interface) little-endian.
> >
> > +\paragraph{Receive-side scaling (RSS)}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS)}
> > +The device indicates presence of this feature if in addition to automatic receive steering it supports RSS steering with Toeplitz hash calculation and configurable parameters.
> > +
> > +Driver uses following value as \field{class} for RSS-related commands.
> > +\begin{lstlisting}
> > +#define VIRTIO_NET_CTRL_RSS              6
> > +\end{lstlisting}
>
> Why don't we reuse VIRTIO_NET_CTRL_MQ?
> It seems appropriate.

No problem, we can reuse VIRTIO_NET_CTRL_MQ for RSS functionality.

>
>
> > +Driver uses following values as \field{command} for RSS-related commands.
> > +\begin{lstlisting}
> > +#define VIRTIO_NET_CTRL_RSS_QUERY_CAPABILITIES              0
> > +#define VIRTIO_NET_CTRL_RSS_SET_PARAMETERS                  1
> > +\end{lstlisting}
> > +
> > +\subparagraph{Querying RSS capabilities}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / Querying RSS capabilities}
> > +
> > +Driver sends VIRTIO_NET_CTRL_RSS_QUERY_CAPABILITIES command to query device capabilities related to RSS.
> > +Device responds the command using following format for \field{command-specific-data}:
> > +\begin{lstlisting}
> > +struct virtio_net_rss_capabilities {
> > +    le16 hash_types_v4;  (bitmask of supported hash types for IPv4 packets)
> > +    le16 hash_types_v6;  (bitmask of supported hash types for IPv6 packets)
>
>
> I think hash types should move into feature bits.
> There are 8 of them overall, we are not short on bits.
>
At the moment we have almost 30 feature bits for network devices (the
range 0..23 defined for specific devices is fully used)
The range 38..63 defined for futher extensions is partially used
(there is also some feature bits that aren't documented yet).
I think we do not have too much unused feature bits and I would prefer
to indicate support for different types of hashes via dedicated
command.
There are also other RSS-related capabilities that the driver should
know (see below)

> Or if you prefer, we can add a full 32 bit mask
> for device specific things.
>
>
>
> > +    le16 max_indirection_table_len; (maximal number of queue indices in indirection table)
> > +    u8 max_key_length; (maximal length of RSS key in bytes)
>
>
> I would put the max values in the config space.

Indeed, we can extend the config layout of virtio_net device
(virtio_net_config) and discard VIRTIO_NET_CTRL_RSS_QUERY_CAPABILITIES
command.

Unfortunately the definition of config space (virtio_net_config) is
not synchronized between the spec and kernel headers.
In kernel/qemu headers (used also by Win drivers) it was extended to
accomodate speed and duplex and this definition is not present in the
spec.
Although there was some discussion about respective virtio_net feature
I do not see any spec patch related to this change.

Do you prefer to add 'reserved' fields for speed/duplex and then add
fields for RSS related capabilities (max_key_size,
max_indirection_table_len)?
In this case also bitmask of supported hashes can be placed here, I think.

>
> > +};
> > +\end{lstlisting}
> > +To describe supported/enabled hash types device and driver use following definitions:
> > +
> > +Hash types applicable for IPv4 packets and for IPv6 packets without extension headers
> > +\begin{lstlisting}
> > +#define VIRTIO_NET_RSS_HASH_TYPE_IP              (1 << 0)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_TCP             (1 << 1)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_UDP             (1 << 2)
> > +\end{lstlisting}
> > +Hash types applicable for IPv6 packets with extension headers
> > +\begin{lstlisting}
> > +#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX           (1 << 4) (only for IPv6)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX          (1 << 5) (only for IPv6)
> > +#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX          (1 << 6) (only for IPv6)
> > +\end{lstlisting}
> > +For exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS hash types}.
> > +
> > +\subparagraph{Setting RSS parameters}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / Setting RSS parameters}
> > +
> > +Driver sends VIRTIO_NET_CTRL_RSS_SET_PARAMETERS command using following format for \field{command-specific-data}:
> > +\begin{lstlisting}
> > +struct virtio_net_rss_params {
> > +    u8 enable_rss;
> > +    u8 hash_key_length;
> > +    le16 hash_types_v4;  (bitmask of allowed hash types for IPv4 packets)
> > +    le16 hash_types_v6;  (bitmask of allowed hash types for IPv6 packets)
> > +    le16 indirection_table_length; (number of queue indices in indirection_table array)
> > +    le16 unclassified_queue; (queue to place unclassified packets in)
> > +    le16 indirection_table[indirection_table_length];
> > +    u8 hash_key_data[hash_key_length];
> > +};
> > +
> > +\end{lstlisting}
> > +Driver sets \field{enable_rss} to 0 to disable RSS processing by the device and use automatic steering mode instead.
>
> I am not sure it's a good idea to have !RSS mean automatic steering.
> We might have more options in the future.
> Why not just enable RSS when the command is given?

The driver (Win for sure) can receive a command to disable RSS (also
during run-time).
In this case it makes sense that the device does its default steering.
If in future we have some additional options this is responsibility of
the driver to configure the steering accordingly.

>
> ATM we don't have a command to force a single queue mode.
> Maybe we want a feature bit and a command for that.

According to the spec (5.1.6.5.5):
Multiqueue is disabled by setting virtqueue_pairs to 1 (this is the
default) and waiting for the device to use the command buffer.

>
> > +
> > +Driver sets \field{enable_rss} to 1 to enable RSS processing by the device using provided parameters.
> > +
> > +\subparagraph{RSS hash types}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS hash types}
> > +
> > +The device calculates hash on IPv4 packets according to the field \field{hash_types_v4} of virtio_net_rss_params structure as follows:
> > +\begin{itemize}
> > +\item If VIRTIO_NET_RSS_HASH_TYPE_TCP is set and the packet has TCP header, the hash is calculated over following fields:
> > +\begin{itemize}
> > +\item Source IP address
> > +\item Destination IP address
> > +\item Source TCP port
> > +\item Destination TCP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP is set and the packet has UDP header, the hash is calculated over following fields:
> > +\begin{itemize}
> > +\item Source IP address
> > +\item Destination IP address
> > +\item Source UDP port
> > +\item Destination UDP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP is set, the hash is calculated over following fields:
> > +\begin{itemize}
> > +\item Source IP address
> > +\item Destination IP address
> > +\end{itemize}
> > +\item Else the device does not calculate the hash
> > +\end{itemize}
> > +
> > +
> > +The device calculates hash on IPv6 packets without extension headers according to the field \field{hash_types_v6} of virtio_net_rss_params structure as follows:
> > +\begin{itemize}
> > +\item If VIRTIO_NET_RSS_HASH_TYPE_TCP is set and the packet has TCPv6 header, the hash is calculated over following fields:
> > +\begin{itemize}
> > +\item Source IPv6 address
> > +\item Destination IPv6 address
> > +\item Source TCP port
> > +\item Destination TCP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP is set and the packet has UDPv6 header, the hash is calculated over following fields:
> > +\begin{itemize}
> > +\item Source IPv6 address
> > +\item Destination IPv6 address
> > +\item Source UDP port
> > +\item Destination UDP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP is set, the hash is calculated over following fields:
> > +\begin{itemize}
> > +\item Source IPv6 address
> > +\item Destination IPv6 address
> > +\end{itemize}
> > +\item Else the device does not calculate the hash
> > +\end{itemize}
> > +
> > +
> > +The device calculates hash on IPv6 packets with extension headers according to the field \field{hash_types_v6} of virtio_net_rss_params structure as follows:
> > +\begin{itemize}
> > +\item If VIRTIO_NET_RSS_HASH_TYPE_TCP_EX is set and the packet has TCPv6 header, the hash is calculated over following fields:
> > +\begin{itemize}
> > +\item Home address from the home address option in the IPv6 destination options header. If the extension header is not present, use the Source IPv6 address.
> > +\item IPv6 address that is contained in the Routing-Header-Type-2 from the associated extension header. If the extension header is not present, use the Destination IPv6 address.
> > +\item Source TCP port
> > +\item Destination TCP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the packet has UDPv6 header, the hash is calculated over following fields:
> > +\begin{itemize}
> > +\item Home address from the home address option in the IPv6 destination options header. If the extension header is not present, use the Source IPv6 address.
> > +\item IPv6 address that is contained in the Routing-Header-Type-2 from the associated extension header. If the extension header is not present, use the Destination IPv6 address.
> > +\item Source UDP port
> > +\item Destination UDP port
> > +\end{itemize}
> > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is calculated over following fields:
> > +\begin{itemize}
> > +\item Home address from the home address option in the IPv6 destination options header. If the extension header is not present, use the Source IPv6 address.
> > +\item IPv6 address that is contained in the Routing-Header-Type-2 from the associated extension header. If the extension header is not present, use the Destination IPv6 address.
> > +\end{itemize}
> > +\item Else skip IPv6 extension headers and calculate the hash as defined above for IPv6 packet without extension headers
> > +\end{itemize}
> > +
> > +
> > +\drivernormative{\subparagraph}{Using RSS commands}{Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / Using RSS commands}
> > +
> > +A driver MUST NOT use RSS commands if the feature VIRTIO_NET_F_RSS has not been negotiated.
> > +
> > +A driver MUST NOT set RSS parameters before it successfully enabled operation with multiple queues.
> > +
> > +A driver MUST fill \field{indirection_table} array only with indices of enabled queues.
> > +
> > +An \field{indirection_table_length} MUST be power of two.
> > +
> > +A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are not supported by device.
> > +
> > +A driver MUST NOT set any bits below for \field{hash_types_v4}:
> > +\begin{itemize}
> > +\item VIRTIO_NET_RSS_HASH_TYPE_IP_EX
> > +\item VIRTIO_NET_RSS_HASH_TYPE_TCP_EX
> > +\item VIRTIO_NET_RSS_HASH_TYPE_UDP_EX
> > +\end{itemize}
> > +
> > +\devicenormative{\subparagraph}{RSS processing}{Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS processing}
> > +If the device reports support for VIRTIO_NET_F_RSS it MUST support keys of at least 40 bytes and indirection table of at least 128 entries.
> > +
> > +The device MUST determine destination queue for network packet as follows:
> > +\begin{itemize}
> > +\item Calculate hash of the packet as defined in \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS hash types}
> > +\item If the device did not calculate the hash for specific packet, the device directs the packet to the queue specified by \field{unclassified_queue} of virtio_net_rss_params structure
> > +\item Apply mask of (indirection_table_length - 1) to the calculated hash and use the result as the index in the indirection table to get 0-based number of destination receive queue
> > +\end{itemize}
> >
> >  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
> >  Types / Network Device / Legacy Interface: Framing Requirements}
> > --
> > 2.17.2
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
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>

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

