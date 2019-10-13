Return-Path: virtio-comment-return-865-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8EADE984017
	for <virtio-comment@lists.oasis-open.org>; Sun, 13 Oct 2019 13:25:26 +0000 (UTC)
Date: Sun, 13 Oct 2019 09:25:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191013090837-mutt-send-email-mst@kernel.org>
References: <20191002164139.37819-1-yuri.benditovich@daynix.com>
 <20191011103139-mutt-send-email-mst@kernel.org>
 <CAOEp5Oc0YiKfgvtDMnR4=tkDvDFgW1bq2uU2TjdYFN4Em=7RHQ@mail.gmail.com>
 <20191013075312-mutt-send-email-mst@kernel.org>
 <CAOEp5Oeru0u6LyFg5xV_RSnThzAeauU6dQfnT5fS-7cybv88Rw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOEp5Oeru0u6LyFg5xV_RSnThzAeauU6dQfnT5fS-7cybv88Rw@mail.gmail.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH] virtio-net: define support for
 receive-side scaling
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Sun, Oct 13, 2019 at 04:07:36PM +0300, Yuri Benditovich wrote:
> On Sun, Oct 13, 2019 at 3:03 PM Michael S. Tsirkin <mst@redhat.com> wrote=
:
> >
> > On Sun, Oct 13, 2019 at 01:27:59PM +0300, Yuri Benditovich wrote:
> > > > > +Driver sends VIRTIO_NET_CTRL_RSS_QUERY_CAPABILITIES command to q=
uery device capabilities related to RSS.
> > > > > +Device responds the command using following format for \field{co=
mmand-specific-data}:
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_net_rss_capabilities {
> > > > > +    le16 hash_types_v4;  (bitmask of supported hash types for IP=
v4 packets)
> > > > > +    le16 hash_types_v6;  (bitmask of supported hash types for IP=
v6 packets)
> > > >
> > > >
> > > > I think hash types should move into feature bits.
> > > > There are 8 of them overall, we are not short on bits.
> > > >
> > > At the moment we have almost 30 feature bits for network devices (the
> > > range 0..23 defined for specific devices is fully used)
> > > The range 38..63 defined for futher extensions is partially used
> > > (there is also some feature bits that aren't documented yet).
> > > I think we do not have too much unused feature bits
> >
> > That's not true.  Used to be a problem pre 1.0 when
> > pci had a dedicated dword register. Since 1.0 there's
> > a selector which gives you any number of dwords.
> >
> > You can start using 64..95 immediately once
> > we run out of the 32..63 range.
> >
>=20
> Good to know. But this requires support for such features in QEMU.
> Currently virtio-net supports only 64 bits for features (as well as
> all the drivers, if I'm not mistaken)

It's pretty easy though.


> >
> > > and I would prefer
> > > to indicate support for different types of hashes via dedicated
> > > command.
> >
> > Big problem with using extra commands for discovery is that they break
> > passthrough. Tricks like VDPA can intercept and tweak feature
> > bits easily, and to a lesser extent config space accesses.
> > Intercepting vq commands is very tricky.
> >
>=20
> RSS requires 'SET' command anyway.

Yes but that does not have to be trapped.
The problem is with feature discovery.
SET is not part of that.


> >
> > > There are also other RSS-related capabilities that the driver should
> > > know (see below)
> > >
> > > > Or if you prefer, we can add a full 32 bit mask
> > > > for device specific things.
> > > >
> > > >
> > > >
> > > > > +    le16 max_indirection_table_len; (maximal number of queue ind=
ices in indirection table)
> > > > > +    u8 max_key_length; (maximal length of RSS key in bytes)
> > > >
> > > >
> > > > I would put the max values in the config space.
> > >
> > > Indeed, we can extend the config layout of virtio_net device
> > > (virtio_net_config) and discard VIRTIO_NET_CTRL_RSS_QUERY_CAPABILITIE=
S
> > > command.
> > >
> > > Unfortunately the definition of config space (virtio_net_config) is
> > > not synchronized between the spec and kernel headers.
> > > In kernel/qemu headers (used also by Win drivers) it was extended to
> > > accomodate speed and duplex and this definition is not present in the
> > > spec.
> > > Although there was some discussion about respective virtio_net featur=
e
> > > I do not see any spec patch related to this change.
> > >
> > > Do you prefer to add 'reserved' fields for speed/duplex and then add
> > > fields for RSS related capabilities (max_key_size,
> > > max_indirection_table_len)?
> >
> > I'd rather we added the fields, with minimal documentation for now.
> >
> > > In this case also bitmask of supported hashes can be placed here, I t=
hink.
> > >
> > > >
> > > > > +};
> > > > > +\end{lstlisting}
> > > > > +To describe supported/enabled hash types device and driver use f=
ollowing definitions:
> > > > > +
> > > > > +Hash types applicable for IPv4 packets and for IPv6 packets with=
out extension headers
> > > > > +\begin{lstlisting}
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_IP              (1 << 0)
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_TCP             (1 << 1)
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_UDP             (1 << 2)
> > > > > +\end{lstlisting}
> > > > > +Hash types applicable for IPv6 packets with extension headers
> > > > > +\begin{lstlisting}
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX           (1 << 4) (only =
for IPv6)
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX          (1 << 5) (only =
for IPv6)
> > > > > +#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX          (1 << 6) (only =
for IPv6)
> > > > > +\end{lstlisting}
> > > > > +For exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref{se=
c:Device Types / Network Device / Device Operation / Control Virtqueue / Re=
ceive-side scaling (RSS) / RSS hash types}.
> > > > > +
> > > > > +\subparagraph{Setting RSS parameters}\label{sec:Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Receive-side scaling=
 (RSS) / Setting RSS parameters}
> > > > > +
> > > > > +Driver sends VIRTIO_NET_CTRL_RSS_SET_PARAMETERS command using fo=
llowing format for \field{command-specific-data}:
> > > > > +\begin{lstlisting}
> > > > > +struct virtio_net_rss_params {
> > > > > +    u8 enable_rss;
> > > > > +    u8 hash_key_length;
> > > > > +    le16 hash_types_v4;  (bitmask of allowed hash types for IPv4=
 packets)
> > > > > +    le16 hash_types_v6;  (bitmask of allowed hash types for IPv6=
 packets)
> > > > > +    le16 indirection_table_length; (number of queue indices in i=
ndirection_table array)
> > > > > +    le16 unclassified_queue; (queue to place unclassified packet=
s in)
> > > > > +    le16 indirection_table[indirection_table_length];
> > > > > +    u8 hash_key_data[hash_key_length];
> > > > > +};
> > > > > +
> > > > > +\end{lstlisting}
> > > > > +Driver sets \field{enable_rss} to 0 to disable RSS processing by=
 the device and use automatic steering mode instead.
> > > >
> > > > I am not sure it's a good idea to have !RSS mean automatic steering=
.
> > > > We might have more options in the future.
> > > > Why not just enable RSS when the command is given?
> > >
> > > The driver (Win for sure) can receive a command to disable RSS (also
> > > during run-time).
> > > In this case it makes sense that the device does its default steering=
.
> >
> > Right, but if a hardware device implements RSS it might not want
> > to also support automatic steering.
>=20
> I'd suggest to define 'automatic steering' as any default mechanism to
> direct packets to RX queus that does not require explicit
> configuration.
> It is not guaranteed to be optimal.
> (This is different from what the spec defines now)

Is it really useful to have the device send packets
to queues at random?

The bahavior right now is at least well defined, even
though it's best effort.

Is there a motivation to switch existing RFS to
"send whereever device wants to" mode?
If yes pls include the motivation in the proposal.


> > What I'm saying is that it's better to have driver exiplicitly set
> > the steering, instead of enable/disable multiple options individually,
> > and then have device figure out what is ment if multiple ones are
> > enabled, or if no one is enabled.
>=20
> What I suggest:
> When the driver successfully enabled MQ, the device works with its
> default steering.
> If the driver enables RSS, the device works with configured settings.
> If the driver disables RSS, the device works with again with its
> default steering.
> If in future we define other steering mechanism, we'll need to state
> that enabling other (future) steering effectively discards any
> previously set steering settings.
>=20
> Any objections?

Then what happens when we add a 3rd mode?
Way I see it, at boot device uses a single pair of queues.

If you want automatic RFS, you use a command to do that
(right now it's name is VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET).

If you want a single queue, you again use
VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET with a value of 1.

Why don't we add a new command to enable RSS?

Last command simply takes precedence.

No tricks, no device default steering, device does not need
to maintain state.




> Do you want to state that this is impossible to switch back to default st=
eering?
> Do you want to add the requirement that the driver must not disable
> RSS if it did not enable it?

What I was asking is whether we really should make RSS depend on MQ?
I can see devices with RSS support but with no automatic steering.
No? We could allow VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET with value of 1 only
when RSS && !MQ, for the sole purpose of disabling RSS.
Or we could add a dedicated command that disables RSS and auto RFS.


> >
> > > If in future we have some additional options this is responsibility o=
f
> > > the driver to configure the steering accordingly.
> > >
> > > >
> > > > ATM we don't have a command to force a single queue mode.
> > > > Maybe we want a feature bit and a command for that.
> > >
> > > According to the spec (5.1.6.5.5):
> > > Multiqueue is disabled by setting virtqueue_pairs to 1 (this is the
> > > default) and waiting for the device to use the command buffer.
> >
> > right, so how does one disable RSS?
>=20
> Can you please clarify the question?
> If due to any reason the device uses single queue, it does not need
> any steering.

Right. So do we call VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET with a value of 1
to get a single queue?


> >
> > > >
> > > > > +
> > > > > +Driver sets \field{enable_rss} to 1 to enable RSS processing by =
the device using provided parameters.
> > > > > +
> > > > > +\subparagraph{RSS hash types}\label{sec:Device Types / Network D=
evice / Device Operation / Control Virtqueue / Receive-side scaling (RSS) /=
 RSS hash types}
> > > > > +
> > > > > +The device calculates hash on IPv4 packets according to the fiel=
d \field{hash_types_v4} of virtio_net_rss_params structure as follows:
> > > > > +\begin{itemize}
> > > > > +\item If VIRTIO_NET_RSS_HASH_TYPE_TCP is set and the packet has =
TCP header, the hash is calculated over following fields:
> > > > > +\begin{itemize}
> > > > > +\item Source IP address
> > > > > +\item Destination IP address
> > > > > +\item Source TCP port
> > > > > +\item Destination TCP port
> > > > > +\end{itemize}
> > > > > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP is set and the packet=
 has UDP header, the hash is calculated over following fields:
> > > > > +\begin{itemize}
> > > > > +\item Source IP address
> > > > > +\item Destination IP address
> > > > > +\item Source UDP port
> > > > > +\item Destination UDP port
> > > > > +\end{itemize}
> > > > > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP is set, the hash is ca=
lculated over following fields:
> > > > > +\begin{itemize}
> > > > > +\item Source IP address
> > > > > +\item Destination IP address
> > > > > +\end{itemize}
> > > > > +\item Else the device does not calculate the hash
> > > > > +\end{itemize}
> > > > > +
> > > > > +
> > > > > +The device calculates hash on IPv6 packets without extension hea=
ders according to the field \field{hash_types_v6} of virtio_net_rss_params =
structure as follows:
> > > > > +\begin{itemize}
> > > > > +\item If VIRTIO_NET_RSS_HASH_TYPE_TCP is set and the packet has =
TCPv6 header, the hash is calculated over following fields:
> > > > > +\begin{itemize}
> > > > > +\item Source IPv6 address
> > > > > +\item Destination IPv6 address
> > > > > +\item Source TCP port
> > > > > +\item Destination TCP port
> > > > > +\end{itemize}
> > > > > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP is set and the packet=
 has UDPv6 header, the hash is calculated over following fields:
> > > > > +\begin{itemize}
> > > > > +\item Source IPv6 address
> > > > > +\item Destination IPv6 address
> > > > > +\item Source UDP port
> > > > > +\item Destination UDP port
> > > > > +\end{itemize}
> > > > > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP is set, the hash is ca=
lculated over following fields:
> > > > > +\begin{itemize}
> > > > > +\item Source IPv6 address
> > > > > +\item Destination IPv6 address
> > > > > +\end{itemize}
> > > > > +\item Else the device does not calculate the hash
> > > > > +\end{itemize}
> > > > > +
> > > > > +
> > > > > +The device calculates hash on IPv6 packets with extension header=
s according to the field \field{hash_types_v6} of virtio_net_rss_params str=
ucture as follows:
> > > > > +\begin{itemize}
> > > > > +\item If VIRTIO_NET_RSS_HASH_TYPE_TCP_EX is set and the packet h=
as TCPv6 header, the hash is calculated over following fields:
> > > > > +\begin{itemize}
> > > > > +\item Home address from the home address option in the IPv6 dest=
ination options header. If the extension header is not present, use the Sou=
rce IPv6 address.
> > > > > +\item IPv6 address that is contained in the Routing-Header-Type-=
2 from the associated extension header. If the extension header is not pres=
ent, use the Destination IPv6 address.
> > > > > +\item Source TCP port
> > > > > +\item Destination TCP port
> > > > > +\end{itemize}
> > > > > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the pac=
ket has UDPv6 header, the hash is calculated over following fields:
> > > > > +\begin{itemize}
> > > > > +\item Home address from the home address option in the IPv6 dest=
ination options header. If the extension header is not present, use the Sou=
rce IPv6 address.
> > > > > +\item IPv6 address that is contained in the Routing-Header-Type-=
2 from the associated extension header. If the extension header is not pres=
ent, use the Destination IPv6 address.
> > > > > +\item Source UDP port
> > > > > +\item Destination UDP port
> > > > > +\end{itemize}
> > > > > +\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is=
 calculated over following fields:
> > > > > +\begin{itemize}
> > > > > +\item Home address from the home address option in the IPv6 dest=
ination options header. If the extension header is not present, use the Sou=
rce IPv6 address.
> > > > > +\item IPv6 address that is contained in the Routing-Header-Type-=
2 from the associated extension header. If the extension header is not pres=
ent, use the Destination IPv6 address.
> > > > > +\end{itemize}
> > > > > +\item Else skip IPv6 extension headers and calculate the hash as=
 defined above for IPv6 packet without extension headers
> > > > > +\end{itemize}
> > > > > +
> > > > > +
> > > > > +\drivernormative{\subparagraph}{Using RSS commands}{Device Types=
 / Network Device / Device Operation / Control Virtqueue / Receive-side sca=
ling (RSS) / Using RSS commands}
> > > > > +
> > > > > +A driver MUST NOT use RSS commands if the feature VIRTIO_NET_F_R=
SS has not been negotiated.
> > > > > +
> > > > > +A driver MUST NOT set RSS parameters before it successfully enab=
led operation with multiple queues.
> > > > > +
> > > > > +A driver MUST fill \field{indirection_table} array only with ind=
ices of enabled queues.
> > > > > +
> > > > > +An \field{indirection_table_length} MUST be power of two.
> > > > > +
> > > > > +A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that a=
re not supported by device.
> > > > > +
> > > > > +A driver MUST NOT set any bits below for \field{hash_types_v4}:
> > > > > +\begin{itemize}
> > > > > +\item VIRTIO_NET_RSS_HASH_TYPE_IP_EX
> > > > > +\item VIRTIO_NET_RSS_HASH_TYPE_TCP_EX
> > > > > +\item VIRTIO_NET_RSS_HASH_TYPE_UDP_EX
> > > > > +\end{itemize}
> > > > > +
> > > > > +\devicenormative{\subparagraph}{RSS processing}{Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Receive-side scaling=
 (RSS) / RSS processing}
> > > > > +If the device reports support for VIRTIO_NET_F_RSS it MUST suppo=
rt keys of at least 40 bytes and indirection table of at least 128 entries.
> > > > > +
> > > > > +The device MUST determine destination queue for network packet a=
s follows:
> > > > > +\begin{itemize}
> > > > > +\item Calculate hash of the packet as defined in \ref{sec:Device=
 Types / Network Device / Device Operation / Control Virtqueue / Receive-si=
de scaling (RSS) / RSS hash types}
> > > > > +\item If the device did not calculate the hash for specific pack=
et, the device directs the packet to the queue specified by \field{unclassi=
fied_queue} of virtio_net_rss_params structure
> > > > > +\item Apply mask of (indirection_table_length - 1) to the calcul=
ated hash and use the result as the index in the indirection table to get 0=
-based number of destination receive queue
> > > > > +\end{itemize}
> > > > >
> > > > >  \subsubsection{Legacy Interface: Framing Requirements}\label{sec=
:Device
> > > > >  Types / Network Device / Legacy Interface: Framing Requirements}
> > > > > --
> > > > > 2.17.2
> > > > >
> > > > >
> > > > > This publicly archived list offers a means to provide input to th=
e
> > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > >
> > > > > In order to verify user consent to the Feedback License terms and
> > > > > to minimize spam in the list archive, subscription is required
> > > > > before posting.
> > > > >
> > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > List archive: https://lists.oasis-open.org/archives/virtio-commen=
t/
> > > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_lic=
ense.pdf
> > > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/m=
ailing-lists
> > > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > > Join OASIS: https://www.oasis-open.org/join/
> > > >
> > > >
> > > > This publicly archived list offers a means to provide input to the
> > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > >
> > > > In order to verify user consent to the Feedback License terms and
> > > > to minimize spam in the list archive, subscription is required
> > > > before posting.
> > > >
> > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_licen=
se.pdf
> > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mai=
ling-lists
> > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > Join OASIS: https://www.oasis-open.org/join/
> > > >
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

