Return-Path: virtio-comment-return-811-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2BBDD985D08
	for <virtio-comment@lists.oasis-open.org>; Thu, 25 Jul 2019 08:15:59 +0000 (UTC)
Date: Thu, 25 Jul 2019 04:15:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190725024956-mutt-send-email-mst@kernel.org>
References: <20190722190249.1007522-1-yuri.benditovich@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722190249.1007522-1-yuri.benditovich@daynix.com>
Subject: [virtio-comment] Re: [PATCH v3] virtio-net: define support for controlled steering
 mode
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jul 22, 2019 at 10:02:49PM +0300, Yuri Benditovich wrote:
> Introducing feature bit and set of control commands
> for steering mode configuration.
> 
> Implements https://github.com/oasis-tcs/virtio-spec/issues/48
> 
> Updates from v2: changed mistake in allocated feature bit.
> 
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>


Can we have a native english speaker read the below please?
I see 0 definite (the) or indefinite (a) articles, so I think
that for sure some are missing.


> ---
>  content.tex | 194 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 194 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index 8f0498e..18a5c3e 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2732,6 +2732,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>  
> +\item[VIRTIO_NET_F_CTRL_STEERING_MODE(60)] Device supports selectable
> +    steering mode and/or control of steering mode parameters.
> +

So I understand some of this is already in the field.
I note that if we want to avoid conflicts with that implementation,
we can just reserve the class that was used, no need to
burn up a feature bits.



>  \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
>      and report number of coalesced segments and duplicated ACKs
>  
> @@ -2761,6 +2764,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>  \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
> +\item[VIRTIO_NET_F_CTRL_STEERING_MODE] Requires VIRTIO_NET_F_MQ.
>  \end{description}
>  
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Network Device / Feature bits / Legacy Interface: Feature bits}
> @@ -3700,8 +3704,198 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  MUST format \field{offloads}
>  according to the native endian of the guest rather than
>  (necessarily when not using the legacy interface) little-endian.
> +\paragraph{Controlled steering mode}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode}
> +Device indicates presence of this feature if it supports selectable/configurable steering modes.
> +\subparagraph{Querying and setting steering mode}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode}
> +There are two kinds of defined commands: GET and SET.
> +
> +For both types of commands driver sends output buffer containing \field{virtio_net_ctrl}, as defined by the \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue}.
> +
> +For GET commands driver provides input buffer for response structure defined for respective GET command.

OK so I think you mean that below there are commands that have GET
and commands that have SET in the name?

I would prefer that we just have 
that start with VIRTIO_NET_CTRL_SM_GET and
commands that start with VIRTIO_NET_CTRL_SM_SET


> +
> +Each response structure includes first byte for \field{ack} code of regular response for control command.

Which commands are regular?
This makes sense to you now since you read patch separate from
the spec but it won't to a regular reader reading it together.
And it won't if we add more commands that look differently.
Above we have text that says:

    All commands are of the following form:

    \begin{lstlisting}
    struct virtio_net_ctrl {
            u8 class;
            u8 command;
            u8 command-specific-data[];
            u8 ack;
    };

can we keep that form for all commands? note that it allows
both read and write only command specific data.
so it would all work if ack was the last not the 1st field.

otherwise, we need to change this text and add more fields
in the generic structure.


> +
> +Driver uses following value as \field{class} for all the commands related to steering control.
> +\begin{lstlisting}
> +#define VIRTIO_NET_CTRL_STEERING_MODE              6
> +\end{lstlisting}

So I think some old RSS code also used class 6, and some of that
was already in the field.  So I propose we document that we reserve class 6
and use class 7 here.



> +To query available steering modes driver uses following value as \field{command}.
> +
> +Device responds with \field{ack} following by bitmask designating supported steering modes.
> +
> +\begin{lstlisting}
> +#define VIRTIO_NET_CTRL_SM_GET_SUPPORTED_MODES    0

I would prefer that we replace SM with _STEERING_
E.g. expand SM to streeting mode and you will
see how the repeated "mode" is confusing.

> +/* automatic steering mode (default defined by the device) */
> +#define STEERING_MODE_AUTO                         (1 << 0)

So auto is kind of "what was there before".
and rss is the new thing.
do you envision that we will have a third, completely
separate steering solution?
if not how about we just define commands to enable/disable rss then?

> +/* RSS (Receive Side Scaling): input queue defined by
> +   calculated hash and indirection table */
> +#define STEERING_MODE_RSS                          (1 << 1)

Why isn't above prefixed with  VIRTIO_NET_ ?


> +struct virtio_net_supported_steering_modes {
> +    u8 ack;
> +    u8 steering_modes;
> +};
> +\end{lstlisting}

I guess the implication is that we have
    struct virtio_net_ctrl {
            u8 class;
            u8 command;
            u8 command-specific-data[];
            u8 ack;
    };

followed by "u8 steering_modes", and the shared ack above
is a hint about that.


> +
> +For all operation related to specific steering mode driver uses following value as \field{command}

which operation (operations?) are related to
a specific mode? and which aren't?

> +and uses following structure for \field{command-specific-data}.
> +\begin{lstlisting}
> +#define VIRTIO_NET_CTRL_SM_CONTROL                1

control twice is kind of ugly.

Also this is not a get and not a set.

> +
> +struct virtio_net_steering_mode_control {
> +    u8 steering_mode;
> +    u8 mode_command;
> +};
> +\end{lstlisting}
> +In case of \field{steering_mode}=STEERING_MODE_AUTO the value of \field{mode_command} is ignored.
> +
> +In case of \field{steering_mode}=STEERING_MODE_RSS possible values of \field{mode_command} are:
> +\begin{lstlisting}
> +#define VIRTIO_NET_SM_CTRL_RSS_SET                       0
> +#define VIRTIO_NET_SM_CTRL_RSS_GET_SUPPORTED_FUNCTIONS   1
> +#define VIRTIO_NET_SM_CTRL_RSS_GET_SUPPORTED_HASHES      2

Why do we need another level of indirection?
Could we not just define separate commands in
virtio_net_ctrl instead of VIRTIO_NET_CTRL_SM_CONTROL?
So

VIRTIO_NET_CTRL_STEERING_SET_MODE_AUTO
VIRTIO_NET_CTRL_STEERING_SET_MODE_RSS

Also, do we need two commands for hashes and functions?
How about:

VIRTIO_NET_CTRL_STEERING_GET_RSS_SUPPORT
to pass both?

Also we have functions which are actually hash functions,
and hashes which are hash types, right?
let's make this clearer pls.


Is it true that hash types and functions are only for RSS?

pls say so


> +\end{lstlisting}
> +Response on VIRTIO_NET_SM_CTRL_RSS_GET_SUPPORTED_FUNCTIONS is a structure containing bitmask value:
> +\begin{lstlisting}
> +struct virtio_net_supported_hash_functions {
> +    u8 ack;
> +    u8 supported_hash_functions;
> +};
> +#define VIRTIO_RSS_HASH_FUNCTION_TOEPLITZ          (1 << 0)
> +#define VIRTIO_RSS_HASH_FUNCTION_SYMMETRIC         (1 << 1)

what exactly is VIRTIO_RSS_HASH_FUNCTION_SYMMETRIC?
Not referenced anywhere.

what if no bits are set? does this mean anything?



> +\end{lstlisting}
> +Response on VIRTIO_NET_SM_CTRL_RSS_GET_SUPPORTED_HASHES command  is a structure containing bitmask values
> +for supported hash types and capabilities related to hash calculation.
> +Device reports supported hash types separately for IPv4 and IPv6.
> +\begin{lstlisting}
> +struct virtio_net_supported_hashes {
> +    u8 ack;
> +    u8 max_key_length;
> +    le16 hash_types_v4;
> +    le16 hash_types_v6;

I guess the above are bits according to VIRTIO_NET_SM_HASH_SUPPORT_
bellow?


> +    /* maximal number of 16-bit entries */

this is the only place that mentions 16-bit entries. what are they?
I guess for GET the below is some kind of device capability?
Does it have any meaning for SET?

> +    le16  max_indirection_table_len;
> +};
> +#define VIRTIO_NET_SM_HASH_SUPPORT_IP              (1 << 0)
> +#define VIRTIO_NET_SM_HASH_SUPPORT_IP_EX           (1 << 1) (only for IPv6)
> +#define VIRTIO_NET_SM_HASH_SUPPORT_TCP             (1 << 2)
> +#define VIRTIO_NET_SM_HASH_SUPPORT_TCP_EX          (1 << 3) (only for IPv6)
> +#define VIRTIO_NET_SM_HASH_SUPPORT_UDP             (1 << 4)
> +#define VIRTIO_NET_SM_HASH_SUPPORT_UDP_EX          (1 << 5) (only for IPv6)

guessing these are masks for hash_types?
So please make these HASH_TYPE_ and above HASH_FUNC_

Also it seems these are reused to actually program the
hash is that right?

> +\end{lstlisting}



> +For exact meaning of VIRTIO_NET_SM_HASH_SUPPORT_ flags see \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode / RSS Toeplitz implementation}.
> +
> +For VIRTIO_NET_SM_CTRL_RSS_SET command driver sends following structure:
> +\begin{lstlisting}
> +struct virtio_net_rss_conf {
> +    le16 hash_types_v4; (one or more of VIRTIO_NET_SM_HASH_SUPPORT bits)
> +    le16 hash_types_v6; (one or more of VIRTIO_NET_SM_HASH_SUPPORT bits)
> +    u8 hash_function; /* one of VIRTIO_RSS_HASH_FUNCTION*/

So this opens an option to set no bits, all all bits here.

Is there an actual need to switch hash on the fly?
Or even to support symmetric hashing? who uses that? dpdk?
does device have to support all types with all functions?
can a device support a subset with toeplitz
and another one with symmetric?

> +    u8 hash_key_length;
> +    le16 indirection_table_length;
> +    /* queue to place unclassified packets in */
> +    le16 default_queue;

rename to unclassified_queue then?

> +    /* le16 indirection_table[indirection_table_length] */
> +    /* u8   hash key data[hash_key_length]*/
> +};
> +\end{lstlisting}
> +\drivernormative{\subparagraph}{Querying and setting steering mode}{Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode}
> +
> +A driver MUST NOT use commands of steering mode control if
> +the feature VIRTIO_NET_F_CTRL_STEERING_MODE has not been negotiated
> +and before it successfully enabled operation with multiple queues.
>  
> +A driver MUST fill \field{indirection_table} array only with indices of enabled queues.
>  
> +A \field{indirection_table_length} MUST be power of two.
> +
> +A driver MUST NOT set any VIRTIO_NET_SM_HASH_SUPPORT flags that are not supported by device.
> +
> +If a driver sets one of If VIRTIO_NET_SM_HASH_SUPPORT_TCP,If VIRTIO_NET_SM_HASH_SUPPORT_UDP flags, it MUST set also VIRTIO_NET_SM_HASH_SUPPORT_IP flag.
> +
> +If a driver sets one of If VIRTIO_NET_SM_HASH_SUPPORT_TCP_EX,If VIRTIO_NET_SM_HASH_SUPPORT_UDP_EX flags, it MUST set also VIRTIO_NET_SM_HASH_SUPPORT_IP_EX flag.

"also set"

Also - can you set TCP_EX without TCP?

> +
> +\devicenormative{\subparagraph}{RSS Toeplitz implementation}{Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode }

I think you want to put the label here within {} and not below.

> +\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode / RSS Toeplitz implementation}
> +If device reports support for VIRTIO_RSS_HASH_FUNCTION_TOEPLITZ:
> +
> +It MUST support keys of at least 40 bytes and indirection table of at least 128 entries.

"It" is ambigous. Pls say "device". Also make below a list please so it
is clear what does the condition refer to.

> +
> +The device applies mask of (indirection_table_length - 1) to the calculated hash and uses the result as the index in the indirection table to get 0-based number of destination receive queue.

is this a conformance statement? if yes include should/may/must

same below everywhere.

if not move out of conformance section.


> +
> +If the device did not calculate the hash for specific packet,

do you mean if the rules do not specify any fields
to include for hash calculation?

> it directs it to the default queue, as specified by virtio_net_rss_conf.\field{default_queue}.

This use of "." is not standard in the spec.
If you want to use this you need to add this in introduction.
Or better just say
\field{default_queue} of struct virtio_net_rss_conf.


> +
> +The device calculates hash on IPV4 packets as following according to virtio_net_rss_conf.\field{hash_types_v4}:

as follows?

> +\begin{itemize}
> +\item If VIRTIO_NET_SM_HASH_SUPPORT_IP is set, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IP address
> +\item Destination IP address
> +\end{itemize}
> +\item If VIRTIO_NET_SM_HASH_SUPPORT_TCP is set, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IP address
> +\item Destination IP address
> +\item Source TCP port
> +\item Destination TCP port
> +\end{itemize}
> +\item If VIRTIO_NET_SM_HASH_SUPPORT_UDP is set, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IP address
> +\item Destination IP address
> +\item Source UDP port
> +\item Destination UDP port
> +\end{itemize}


Actually above list is not exclusive.
Pls explain that, otherwise it seems that
e.g. if VIRTIO_NET_SM_HASH_SUPPORT_UDP is set then source/dest ip
is not included.
Or just add an example.


> +\item If one of VIRTIO_NET_SM_HASH_SUPPORT_TCP, VIRTIO_NET_SM_HASH_SUPPORT_UDP is set,
> +the device MUST skip over any IP header options.

skip during which operation?  what does skip mean here? you list the
header fields to include in the hash explicitly.


> If the device can not

is unable to

> skip over
> +IP header options, if MUST not calculate the hash.


MUST NOT


Also is above best effort then?

> If the packet is not TCP or UDP packet respectively, the device falls back to VIRTIO_NET_SM_HASH_SUPPORT_IP case.




> +\end{itemize}
> +
> +The device calculates hash on IPV6 packets as following according to virtio_net_rss_conf.\field{hash_types_v6}:
> +\begin{itemize}
> +\item If VIRTIO_NET_SM_HASH_SUPPORT_IP is set, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IPv6 address
> +\item Destination IPv6 address
> +\end{itemize}
> +\item If VIRTIO_NET_SM_HASH_SUPPORT_TCP is set, the hash is calculated over following fields:

add here "for tcp packets"

> +\begin{itemize}
> +\item Source IPv6 address
> +\item Destination IPv6 address
> +\item Source TCP port
> +\item Destination TCP port
> +\end{itemize}
> +\item If VIRTIO_NET_SM_HASH_SUPPORT_UDP is set, the hash is calculated over following fields:

add here "for udp packets"

> +\begin{itemize}
> +\item Source IPv6 address
> +\item Destination IPv6 address
> +\item Source UDP port
> +\item Destination UDP port
> +\end{itemize}
> +\item If one of VIRTIO_NET_SM_HASH_SUPPORT_TCP, VIRTIO_NET_SM_HASH_SUPPORT_UDP is set,
> +the device MUST skip over any IPv6 header options. If the device can not skip over
> +IPv6 header options, if MUST not calculate the hash.

and then what? put it in unclassified queue right?

> If the packet is not TCP or UDP packet respectively, the device falls back to VIRTIO_NET_SM_HASH_SUPPORT_IP case.

this last sentence is just confusing. pls drop it.

> +\item If VIRTIO_NET_SM_HASH_SUPPORT_IP_EX is set, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Home address from the home address option in the IPv6 destination options header. If the extension header is not present, use the Source IPv6 address.
> +\item IPv6 address that is contained in the Routing-Header-Type-2 from the associated extension header. If the extension header is not present, use the Destination IPv6 address.
> +\end{itemize}
> +\item If VIRTIO_NET_SM_HASH_SUPPORT_TCP_EX is set, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IPv6 address as specified for VIRTIO_NET_SM_HASH_SUPPORT_IP_EX
> +\item Destination IPv6 address as specified for VIRTIO_NET_SM_HASH_SUPPORT_IP_EX
> +\item Source TCP port
> +\item Destination TCP port
> +\end{itemize}
> +\item If VIRTIO_NET_SM_HASH_SUPPORT_UDP_EX is set, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IPv6 address as specified for VIRTIO_NET_SM_HASH_SUPPORT_IP_EX
> +\item Destination IPv6 address as specified for VIRTIO_NET_SM_HASH_SUPPORT_IP_EX
> +\item Source UDP port
> +\item Destination UDP port
> +\end{itemize}
> +\item If one of VIRTIO_NET_SM_HASH_SUPPORT_TCP_EX, VIRTIO_NET_SM_HASH_SUPPORT_UDP_EX is set
> +and the packet is not TCP or UDP packet respectively, the device falls back to VIRTIO_NET_SM_HASH_SUPPORT_IP_EX case.
> +\end{itemize}

Same as for IPv4 above.


>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>  Types / Network Device / Legacy Interface: Framing Requirements}
>  
> -- 
> 2.17.2

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

