Return-Path: virtio-comment-return-813-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5EDAF985D82
	for <virtio-comment@lists.oasis-open.org>; Thu, 25 Jul 2019 13:22:46 +0000 (UTC)
Date: Thu, 25 Jul 2019 09:22:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190725084717-mutt-send-email-mst@kernel.org>
References: <20190722190249.1007522-1-yuri.benditovich@daynix.com>
 <20190725024956-mutt-send-email-mst@kernel.org>
 <CAOEp5OeL1aVGVA_ofcnvvZAa0NMvvu9Wh1z7GJm8MXM602t1=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOEp5OeL1aVGVA_ofcnvvZAa0NMvvu9Wh1z7GJm8MXM602t1=Q@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH v3] virtio-net: define support for controlled steering
 mode
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jul 25, 2019 at 03:38:15PM +0300, Yuri Benditovich wrote:
> On Thu, Jul 25, 2019 at 11:15 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jul 22, 2019 at 10:02:49PM +0300, Yuri Benditovich wrote:
> > > Introducing feature bit and set of control commands
> > > for steering mode configuration.
> > >
> > > Implements https://github.com/oasis-tcs/virtio-spec/issues/48
> > >
> > > Updates from v2: changed mistake in allocated feature bit.
> > >
> > > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> >
> >
> > Can we have a native english speaker read the below please?
> > I see 0 definite (the) or indefinite (a) articles, so I think
> > that for sure some are missing.
> >
> >
> > > ---
> > >  content.tex | 194 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 194 insertions(+)
> > >
> > > diff --git a/content.tex b/content.tex
> > > index 8f0498e..18a5c3e 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -2732,6 +2732,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
> > >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
> > >      channel.
> > >
> > > +\item[VIRTIO_NET_F_CTRL_STEERING_MODE(60)] Device supports selectable
> > > +    steering mode and/or control of steering mode parameters.
> > > +
> >
> > So I understand some of this is already in the field.
> > I note that if we want to avoid conflicts with that implementation,
> > we can just reserve the class that was used, no need to
> > burn up a feature bits.
> >
> 
> No, there is nothing in the field yet. The motivation is to define
> interface that true hardware can use.
> 
> >
> >
> > >  \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
> > >      and report number of coalesced segments and duplicated ACKs
> > >
> > > @@ -2761,6 +2764,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
> > >  \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
> > >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
> > >  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
> > > +\item[VIRTIO_NET_F_CTRL_STEERING_MODE] Requires VIRTIO_NET_F_MQ.
> > >  \end{description}
> > >
> > >  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Network Device / Feature bits / Legacy Interface: Feature bits}
> > > @@ -3700,8 +3704,198 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> > >  MUST format \field{offloads}
> > >  according to the native endian of the guest rather than
> > >  (necessarily when not using the legacy interface) little-endian.
> > > +\paragraph{Controlled steering mode}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode}
> > > +Device indicates presence of this feature if it supports selectable/configurable steering modes.
> > > +\subparagraph{Querying and setting steering mode}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode}
> > > +There are two kinds of defined commands: GET and SET.
> > > +
> > > +For both types of commands driver sends output buffer containing \field{virtio_net_ctrl}, as defined by the \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue}.
> > > +
> > > +For GET commands driver provides input buffer for response structure defined for respective GET command.
> >
> > OK so I think you mean that below there are commands that have GET
> > and commands that have SET in the name?
> >
> > I would prefer that we just have
> > that start with VIRTIO_NET_CTRL_SM_GET and
> > commands that start with VIRTIO_NET_CTRL_SM_SET
> >
> >
> > > +
> > > +Each response structure includes first byte for \field{ack} code of regular response for control command.
> >
> > Which commands are regular?
> > This makes sense to you now since you read patch separate from
> > the spec but it won't to a regular reader reading it together.
> > And it won't if we add more commands that look differently.
> > Above we have text that says:
> >
> >     All commands are of the following form:
> >
> >     \begin{lstlisting}
> >     struct virtio_net_ctrl {
> >             u8 class;
> >             u8 command;
> >             u8 command-specific-data[];
> >             u8 ack;
> >     };
> >
> > can we keep that form for all commands? note that it allows
> > both read and write only command specific data.
> > so it would all work if ack was the last not the 1st field.
> >
> > otherwise, we need to change this text and add more fields
> > in the generic structure.
> >
> 
> Actually, this text (common format of control command) is a little unclear.
> It does not mention that:
> (class + command + command-specific data + ack) are located in
> different buffers and actually there are 2 different structures:
> In fact:
> struct virtio_net_ctrl_out {
>       u8 class;
>       u8 command;
>       u8 command-specific-data[];
> }
> 
> struct virtio_net_ctrl_in {
>     u8 ack;
>     u8 command-specific-response[]; (optional, till now not used)
> }

command-specific-data can be read, write or both.
That is why it's between class+command (write) and ack (read).

So why do we need to add an extra command-specific-response?
let's just put everything in command-specific-data.


> >
> > > +
> > > +Driver uses following value as \field{class} for all the commands related to steering control.
> > > +\begin{lstlisting}
> > > +#define VIRTIO_NET_CTRL_STEERING_MODE              6
> > > +\end{lstlisting}
> >
> > So I think some old RSS code also used class 6, and some of that
> > was already in the field.  So I propose we document that we reserve class 6
> > and use class 7 here.
> >
> >
> There is nothing in the field with RSS/Steering mode
> 
> >
> > > +To query available steering modes driver uses following value as \field{command}.
> > > +
> > > +Device responds with \field{ack} following by bitmask designating supported steering modes.
> > > +
> > > +\begin{lstlisting}
> > > +#define VIRTIO_NET_CTRL_SM_GET_SUPPORTED_MODES    0
> >
> > I would prefer that we replace SM with _STEERING_
> > E.g. expand SM to streeting mode and you will
> > see how the repeated "mode" is confusing.
> >
> > > +/* automatic steering mode (default defined by the device) */
> > > +#define STEERING_MODE_AUTO                         (1 << 0)
> >
> > So auto is kind of "what was there before".
> > and rss is the new thing.
> > do you envision that we will have a third, completely
> > separate steering solution?
> > if not how about we just define commands to enable/disable rss then?
> 
> If there is use case for third mode, why not.
> This third mode might be also RSS but, for example, requiring
> additional parameters.
> It looks like the RSS configuration that we try to define here will
> satisfy Linux. But if not?

We add another feature flag? Last time we looked at steering was 2012.
I don't think an extra command every 7 years will be a problem.

> Disable RSS and any explicit steering mode = default (automatic)
> steering mode, IMO
> 
> >
> > > +/* RSS (Receive Side Scaling): input queue defined by
> > > +   calculated hash and indirection table */
> > > +#define STEERING_MODE_RSS                          (1 << 1)
> >
> > Why isn't above prefixed with  VIRTIO_NET_ ?
> >
> >
> > > +struct virtio_net_supported_steering_modes {
> > > +    u8 ack;
> > > +    u8 steering_modes;
> > > +};
> > > +\end{lstlisting}
> >
> > I guess the implication is that we have
> >     struct virtio_net_ctrl {
> >             u8 class;
> >             u8 command;
> >             u8 command-specific-data[];
> >             u8 ack;
> >     };
> >
> > followed by "u8 steering_modes", and the shared ack above
> > is a hint about that.
> >
> >
> > > +
> > > +For all operation related to specific steering mode driver uses following value as \field{command}
> >
> > which operation (operations?) are related to
> > a specific mode? and which aren't?
> >
> > > +and uses following structure for \field{command-specific-data}.
> > > +\begin{lstlisting}
> > > +#define VIRTIO_NET_CTRL_SM_CONTROL                1
> >
> > control twice is kind of ugly.
> >
> > Also this is not a get and not a set.
> 
> Because it can be get or set, as below, depending on command

So I worry that at least some supported functions/types should maybe
just be device features. Because otherwise we can have incompatible
cards and feature bits look the same, you need to poke at the command to
figure out whether it supports everything.

Active ones can still be set appropriately with a command.
E.g. this is what we did for guest offloads. RSS seems similar.



> >
> > > +
> > > +struct virtio_net_steering_mode_control {
> > > +    u8 steering_mode;
> > > +    u8 mode_command;
> > > +};
> > > +\end{lstlisting}
> > > +In case of \field{steering_mode}=STEERING_MODE_AUTO the value of \field{mode_command} is ignored.
> > > +
> > > +In case of \field{steering_mode}=STEERING_MODE_RSS possible values of \field{mode_command} are:
> > > +\begin{lstlisting}
> > > +#define VIRTIO_NET_SM_CTRL_RSS_SET                       0
> > > +#define VIRTIO_NET_SM_CTRL_RSS_GET_SUPPORTED_FUNCTIONS   1
> > > +#define VIRTIO_NET_SM_CTRL_RSS_GET_SUPPORTED_HASHES      2
> >
> > Why do we need another level of indirection?
> > Could we not just define separate commands in
> > virtio_net_ctrl instead of VIRTIO_NET_CTRL_SM_CONTROL?
> > So
> >
> > VIRTIO_NET_CTRL_STEERING_SET_MODE_AUTO
> > VIRTIO_NET_CTRL_STEERING_SET_MODE_RSS
> >
> > Also, do we need two commands for hashes and functions?
> > How about:
> >
> > VIRTIO_NET_CTRL_STEERING_GET_RSS_SUPPORT
> > to pass both?
> >
> > Also we have functions which are actually hash functions,
> > and hashes which are hash types, right?
> > let's make this clearer pls.
> >
> >
> > Is it true that hash types and functions are only for RSS?
> >
> 
> Yes, but only because currently we do not have anything except of auto and RSS

Well you have RSS in the name :).

Either drop rss from the name or say in the spec
they only apply to rss.

It seems too hard to predict what that something else can be.
I would just make it all RSS specific.


> > pls say so
> >
> >
> > > +\end{lstlisting}
> > > +Response on VIRTIO_NET_SM_CTRL_RSS_GET_SUPPORTED_FUNCTIONS is a structure containing bitmask value:
> > > +\begin{lstlisting}
> > > +struct virtio_net_supported_hash_functions {
> > > +    u8 ack;
> > > +    u8 supported_hash_functions;
> > > +};
> > > +#define VIRTIO_RSS_HASH_FUNCTION_TOEPLITZ          (1 << 0)
> > > +#define VIRTIO_RSS_HASH_FUNCTION_SYMMETRIC         (1 << 1)
> >
> > what exactly is VIRTIO_RSS_HASH_FUNCTION_SYMMETRIC?
> > Not referenced anywhere.
> 
> Probably, need to remove it for now.
> It was defined in previous round on RSS patches and my impression was
> that it is defined for Linux.

OK if you want to support everything linux can use then take a look
at ethtool man page as well as code in net/core/ethtool.c in linux.


      -x --show-rxfh-indir --show-rxfh
              Retrieves the receive flow hash indirection table and/or RSS hash key.

       -X --set-rxfh-indir --rxfh
              Configures the receive flow hash indirection table and/or RSS hash key.

           hkey   Sets RSS hash key of the specified network device. RSS hash key should be of device supported length.  Hash
                  key format must be in xx:yy:zz:aa:bb:cc format meaning both the nibbles of a byte should be mentioned  even
                  if a nibble is zero.

           hfunc  Sets  RSS  hash function of the specified network device.  List of RSS hash functions which kernel supports
                  is shown as a part of the --show-rxfh command output.

           equal N
                  Sets the receive flow hash indirection table to spread flows evenly between the first N receive queues.

           weight W0 W1 ...
                  Sets the receive flow hash indirection table to spread flows between receive queues according to the  given
                  weights.  The sum of the weights must be non-zero and must not exceed the size of the indirection table.

           default
                  Sets the receive flow hash indirection table to its default value.

           context CTX | new
                  Specifies an RSS context to act on; either new to allocate a new RSS context, or CTX, a value returned by a
                  previous ... context new.

           delete Delete the specified RSS context.  May only be used in conjunction with context and a non-zero CTX value.


hash functions linux knows about ATM are toeplitz xor and crc32.

there's support for weights - I guess windows is always equally
weighted?

linux also supports ntuple filtering, see e.g.
https://blog.packagecloud.io/eng/2016/06/22/monitoring-tuning-linux-networking-stack-receiving-data/#adjusting-the-rx-hash-fields-for-network-flows

You also want get commands to retrieve what you programmed.



> >
> > what if no bits are set? does this mean anything?
> >
> 
> Then it is unclear why the device claims it supports RSS if it does
> not support any hashing function.
> The driver will need to do by itself everything for RSS support.

or disable rss?

> >
> >
> > > +\end{lstlisting}
> > > +Response on VIRTIO_NET_SM_CTRL_RSS_GET_SUPPORTED_HASHES command  is a structure containing bitmask values
> > > +for supported hash types and capabilities related to hash calculation.
> > > +Device reports supported hash types separately for IPv4 and IPv6.
> > > +\begin{lstlisting}
> > > +struct virtio_net_supported_hashes {
> > > +    u8 ack;
> > > +    u8 max_key_length;
> > > +    le16 hash_types_v4;
> > > +    le16 hash_types_v6;
> >
> > I guess the above are bits according to VIRTIO_NET_SM_HASH_SUPPORT_
> > bellow?
> >
> Yes, sure
> 
> >
> > > +    /* maximal number of 16-bit entries */
> >
> > this is the only place that mentions 16-bit entries. what are they?
> > I guess for GET the below is some kind of device capability?
> > Does it have any meaning for SET?
> 
> Stucture for set is defined below, in VIRTIO_NET_SM_CTRL_RSS_SET
> Yes, this is capability, i.e. how many queue indices the device can accomodate.
> 
> 
> >
> > > +    le16  max_indirection_table_len;
> > > +};
> > > +#define VIRTIO_NET_SM_HASH_SUPPORT_IP              (1 << 0)
> > > +#define VIRTIO_NET_SM_HASH_SUPPORT_IP_EX           (1 << 1) (only for IPv6)
> > > +#define VIRTIO_NET_SM_HASH_SUPPORT_TCP             (1 << 2)
> > > +#define VIRTIO_NET_SM_HASH_SUPPORT_TCP_EX          (1 << 3) (only for IPv6)
> > > +#define VIRTIO_NET_SM_HASH_SUPPORT_UDP             (1 << 4)
> > > +#define VIRTIO_NET_SM_HASH_SUPPORT_UDP_EX          (1 << 5) (only for IPv6)
> >
> > guessing these are masks for hash_types?
> > So please make these HASH_TYPE_ and above HASH_FUNC_
> >
> > Also it seems these are reused to actually program the
> > hash is that right?
> 
> The device supports some set of hash functions, i.e. "how it knows to
> calculate hash"
> The device supports some set of "what it can hash", as it should know
> to recognize headers / extension headers
> The driver tells the device which hash function to select ("how") and
> which hash types it can use ("what")
> For example, under server 2016 the driver can't request the device to
> calculate UDP hash at all

okay so all this needs to be explicit in the spec.

> >
> > > +\end{lstlisting}
> >
> >
> >
> > > +For exact meaning of VIRTIO_NET_SM_HASH_SUPPORT_ flags see \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode / RSS Toeplitz implementation}.
> > > +
> > > +For VIRTIO_NET_SM_CTRL_RSS_SET command driver sends following structure:
> > > +\begin{lstlisting}
> > > +struct virtio_net_rss_conf {
> > > +    le16 hash_types_v4; (one or more of VIRTIO_NET_SM_HASH_SUPPORT bits)
> > > +    le16 hash_types_v6; (one or more of VIRTIO_NET_SM_HASH_SUPPORT bits)
> > > +    u8 hash_function; /* one of VIRTIO_RSS_HASH_FUNCTION*/
> >
> > So this opens an option to set no bits, all all bits here.
> >
> > Is there an actual need to switch hash on the fly?
> 
> In general, yes. This is not a "need" but normal reaction to NIC
> configuration command.
> The driver does not duscuss commands.
> Under certifications tests we can't expect that entire adapter will be
> reinitialized for changing RSS settings.

ok so pls write out the requirement e.g. driver must set
exactly one bit. Or maybe in that case, why don't we pass the bit #?
I.e. define functions/hashes as bit number, not shifted.
supported mask can still use a bitmap.

> > Or even to support symmetric hashing? who uses that? dpdk?
> > does device have to support all types with all functions?
> 
> The device indicates support for what it knows to do.
> If the device does not support at least IP hash type, it is
> meaningless to declare RSS support.

to clarify: we have 2 functions and 3 types.
must device support all 6 combinations?
or can it support some types only with some functions?
again pls include that in the spec

> > can a device support a subset with toeplitz
> > and another one with symmetric?
> >
> 
> This does not make too much sense, but this is device decides what and
> how it is able to support.

question is what does it declare then? spec must be explicit.

> > > +    u8 hash_key_length;
> > > +    le16 indirection_table_length;
> > > +    /* queue to place unclassified packets in */
> > > +    le16 default_queue;
> >
> > rename to unclassified_queue then?
> >
> > > +    /* le16 indirection_table[indirection_table_length] */
> > > +    /* u8   hash key data[hash_key_length]*/
> > > +};
> > > +\end{lstlisting}
> > > +\drivernormative{\subparagraph}{Querying and setting steering mode}{Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode}
> > > +
> > > +A driver MUST NOT use commands of steering mode control if
> > > +the feature VIRTIO_NET_F_CTRL_STEERING_MODE has not been negotiated
> > > +and before it successfully enabled operation with multiple queues.
> > >
> > > +A driver MUST fill \field{indirection_table} array only with indices of enabled queues.
> > >
> > > +A \field{indirection_table_length} MUST be power of two.
> > > +
> > > +A driver MUST NOT set any VIRTIO_NET_SM_HASH_SUPPORT flags that are not supported by device.
> > > +
> > > +If a driver sets one of If VIRTIO_NET_SM_HASH_SUPPORT_TCP,If VIRTIO_NET_SM_HASH_SUPPORT_UDP flags, it MUST set also VIRTIO_NET_SM_HASH_SUPPORT_IP flag.
> > > +
> > > +If a driver sets one of If VIRTIO_NET_SM_HASH_SUPPORT_TCP_EX,If VIRTIO_NET_SM_HASH_SUPPORT_UDP_EX flags, it MUST set also VIRTIO_NET_SM_HASH_SUPPORT_IP_EX flag.
> >
> > "also set"
> >
> > Also - can you set TCP_EX without TCP?
> >
> 
> Yes. Even makes sense to avoid misunderstanding, this is what Windows
> does (AFAIR).
> 
> > > +
> > > +\devicenormative{\subparagraph}{RSS Toeplitz implementation}{Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode }
> >
> > I think you want to put the label here within {} and not below.
> >
> > > +\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode / RSS Toeplitz implementation}
> > > +If device reports support for VIRTIO_RSS_HASH_FUNCTION_TOEPLITZ:
> > > +
> > > +It MUST support keys of at least 40 bytes and indirection table of at least 128 entries.
> >
> > "It" is ambigous. Pls say "device". Also make below a list please so it
> > is clear what does the condition refer to.
> >
> > > +
> > > +The device applies mask of (indirection_table_length - 1) to the calculated hash and uses the result as the index in the indirection table to get 0-based number of destination receive queue.
> >
> > is this a conformance statement? if yes include should/may/must
> >
> > same below everywhere.
> >
> > if not move out of conformance section.
> >
> >
> > > +
> > > +If the device did not calculate the hash for specific packet,
> >
> > do you mean if the rules do not specify any fields
> > to include for hash calculation?
> 
> Or if the device due to some limitations (for example, does not know
> how to process header with options) is not able to calculate hash on
> specific packet.

so this is best effort then?
pls be explicit in the spec.

> >
> > > it directs it to the default queue, as specified by virtio_net_rss_conf.\field{default_queue}.
> >
> > This use of "." is not standard in the spec.
> > If you want to use this you need to add this in introduction.
> > Or better just say
> > \field{default_queue} of struct virtio_net_rss_conf.
> >
> >
> > > +
> > > +The device calculates hash on IPV4 packets as following according to virtio_net_rss_conf.\field{hash_types_v4}:
> >
> > as follows?
> >
> > > +\begin{itemize}
> > > +\item If VIRTIO_NET_SM_HASH_SUPPORT_IP is set, the hash is calculated over following fields:
> > > +\begin{itemize}
> > > +\item Source IP address
> > > +\item Destination IP address
> > > +\end{itemize}
> > > +\item If VIRTIO_NET_SM_HASH_SUPPORT_TCP is set, the hash is calculated over following fields:
> > > +\begin{itemize}
> > > +\item Source IP address
> > > +\item Destination IP address
> > > +\item Source TCP port
> > > +\item Destination TCP port
> > > +\end{itemize}
> > > +\item If VIRTIO_NET_SM_HASH_SUPPORT_UDP is set, the hash is calculated over following fields:
> > > +\begin{itemize}
> > > +\item Source IP address
> > > +\item Destination IP address
> > > +\item Source UDP port
> > > +\item Destination UDP port
> > > +\end{itemize}
> >
> >
> > Actually above list is not exclusive.
> > Pls explain that, otherwise it seems that
> > e.g. if VIRTIO_NET_SM_HASH_SUPPORT_UDP is set then source/dest ip
> > is not included.
> > Or just add an example.
> >
> >
> > > +\item If one of VIRTIO_NET_SM_HASH_SUPPORT_TCP, VIRTIO_NET_SM_HASH_SUPPORT_UDP is set,
> > > +the device MUST skip over any IP header options.
> >
> > skip during which operation?  what does skip mean here? you list the
> > header fields to include in the hash explicitly.
> >
> 
> Yes, there are listed fields that are included in hash calculation.
> But to retrieve the field (TCP port) the device needs to locate TCP header.
> For that the device MUST skip over IP header options.
> 
> Like that:
> https://docs.microsoft.com/en-us/windows-hardware/drivers/network/rss-hashing-types

tldr.

imho above just confuses the reader.
we say what's included, the rest you skip.


> 
> >
> > > If the device can not
> >
> > is unable to
> >
> > > skip over
> > > +IP header options, if MUST not calculate the hash.
> >
> >
> > MUST NOT
> >
> >
> > Also is above best effort then?
> >
> > > If the packet is not TCP or UDP packet respectively, the device falls back to VIRTIO_NET_SM_HASH_SUPPORT_IP case.
> >
> >
> >
> >
> > > +\end{itemize}
> > > +
> > > +The device calculates hash on IPV6 packets as following according to virtio_net_rss_conf.\field{hash_types_v6}:
> > > +\begin{itemize}
> > > +\item If VIRTIO_NET_SM_HASH_SUPPORT_IP is set, the hash is calculated over following fields:
> > > +\begin{itemize}
> > > +\item Source IPv6 address
> > > +\item Destination IPv6 address
> > > +\end{itemize}
> > > +\item If VIRTIO_NET_SM_HASH_SUPPORT_TCP is set, the hash is calculated over following fields:
> >
> > add here "for tcp packets"
> >
> > > +\begin{itemize}
> > > +\item Source IPv6 address
> > > +\item Destination IPv6 address
> > > +\item Source TCP port
> > > +\item Destination TCP port
> > > +\end{itemize}
> > > +\item If VIRTIO_NET_SM_HASH_SUPPORT_UDP is set, the hash is calculated over following fields:
> >
> > add here "for udp packets"
> >
> > > +\begin{itemize}
> > > +\item Source IPv6 address
> > > +\item Destination IPv6 address
> > > +\item Source UDP port
> > > +\item Destination UDP port
> > > +\end{itemize}
> > > +\item If one of VIRTIO_NET_SM_HASH_SUPPORT_TCP, VIRTIO_NET_SM_HASH_SUPPORT_UDP is set,
> > > +the device MUST skip over any IPv6 header options. If the device can not skip over
> > > +IPv6 header options, if MUST not calculate the hash.
> >
> > and then what? put it in unclassified queue right?
> >
> > > If the packet is not TCP or UDP packet respectively, the device falls back to VIRTIO_NET_SM_HASH_SUPPORT_IP case.
> >
> > this last sentence is just confusing. pls drop it.
> >
> > > +\item If VIRTIO_NET_SM_HASH_SUPPORT_IP_EX is set, the hash is calculated over following fields:
> > > +\begin{itemize}
> > > +\item Home address from the home address option in the IPv6 destination options header. If the extension header is not present, use the Source IPv6 address.
> > > +\item IPv6 address that is contained in the Routing-Header-Type-2 from the associated extension header. If the extension header is not present, use the Destination IPv6 address.
> > > +\end{itemize}
> > > +\item If VIRTIO_NET_SM_HASH_SUPPORT_TCP_EX is set, the hash is calculated over following fields:
> > > +\begin{itemize}
> > > +\item Source IPv6 address as specified for VIRTIO_NET_SM_HASH_SUPPORT_IP_EX
> > > +\item Destination IPv6 address as specified for VIRTIO_NET_SM_HASH_SUPPORT_IP_EX
> > > +\item Source TCP port
> > > +\item Destination TCP port
> > > +\end{itemize}
> > > +\item If VIRTIO_NET_SM_HASH_SUPPORT_UDP_EX is set, the hash is calculated over following fields:
> > > +\begin{itemize}
> > > +\item Source IPv6 address as specified for VIRTIO_NET_SM_HASH_SUPPORT_IP_EX
> > > +\item Destination IPv6 address as specified for VIRTIO_NET_SM_HASH_SUPPORT_IP_EX
> > > +\item Source UDP port
> > > +\item Destination UDP port
> > > +\end{itemize}
> > > +\item If one of VIRTIO_NET_SM_HASH_SUPPORT_TCP_EX, VIRTIO_NET_SM_HASH_SUPPORT_UDP_EX is set
> > > +and the packet is not TCP or UDP packet respectively, the device falls back to VIRTIO_NET_SM_HASH_SUPPORT_IP_EX case.
> > > +\end{itemize}
> >
> > Same as for IPv4 above.
> >
> >
> > >  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
> > >  Types / Network Device / Legacy Interface: Framing Requirements}
> > >
> > > --
> > > 2.17.2

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

