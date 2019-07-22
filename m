Return-Path: virtio-comment-return-809-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E8C73985CF0
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Jul 2019 18:56:07 +0000 (UTC)
Date: Mon, 22 Jul 2019 14:56:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190722144537-mutt-send-email-mst@kernel.org>
References: <20190722184055.1007297-1-yuri.benditovich@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722184055.1007297-1-yuri.benditovich@daynix.com>
Subject: [virtio-comment] Re: [PATCH v2] virtio-net: define support for controlled steering
 mode
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jul 22, 2019 at 09:40:55PM +0300, Yuri Benditovich wrote:
> Introducing feature bit and set of control commands
> for steering mode configuration.
> 
> Implements https://github.com/oasis-tcs/virtio-spec/issues/48

Just for reference:
the correct tag is:
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/48

You also should include

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>

to record that

        (a) The contribution was created in whole or in part by you and
	     you have been authorized by everyone with rights to the
	     contribution to submit it under the virtio TC IPR rules;

        (b) The contribution is based upon previous work that, to the best
            of your knowledge, was contributed to the virtio TC
	    under the virtio TC IPR rules and you have the right to submit that
            work with modifications, whether created in whole or in part
            by you, under the same virtio TC IPR rules; or

        (c) The contribution was provided directly to you by some other
            person who certified (a), (b) or (c) and you have not modified
            it.

        (d) You understand and agree that this project and the contribution
            are public and that a record of the contribution (including all
            personal information you submit with it, including your sign-off) is
            maintained indefinitely and may be redistributed consistent with
            the virtio TC IPR rules.




> ---
>  content.tex | 194 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 194 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index 8f0498e..679d492 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2732,6 +2732,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>  
> +\item[VIRTIO_NET_F_CTRL_STEERING_MODE(61)] Device supports selectable
> +    steering mode and/or control of steering mode parameters.
> +
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
> +
> +Each response structure includes first byte for \field{ack} code of regular response for control command.
> +
> +Driver uses following value as \field{class} for all the commands related to steering control.
> +\begin{lstlisting}
> +#define VIRTIO_NET_CTRL_STEERING_MODE              6
> +\end{lstlisting}
> +To query available steering modes driver uses following value as \field{command}.
> +
> +Device responds with \field{ack} following by bitmask designating supported steering modes.
> +
> +\begin{lstlisting}
> +#define VIRTIO_NET_CTRL_SM_GET_SUPPORTED_MODES    0
> +/* automatic steering mode (default defined by the device) */
> +#define STEERING_MODE_AUTO                         (1 << 0)
> +/* RSS (Receive Side Scaling): input queue defined by
> +   calculated hash and indirection table */
> +#define STEERING_MODE_RSS                          (1 << 1)
> +struct virtio_net_supported_steering_modes {
> +    u8 ack;
> +    u8 steering_modes;
> +};
> +\end{lstlisting}
> +
> +For all operation related to specific steering mode driver uses following value as \field{command}
> +and uses following structure for \field{command-specific-data}.
> +\begin{lstlisting}
> +#define VIRTIO_NET_CTRL_SM_CONTROL                1
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
> +\end{lstlisting}
> +Response on VIRTIO_NET_SM_CTRL_RSS_GET_SUPPORTED_FUNCTIONS is a structure containing bitmask value:
> +\begin{lstlisting}
> +struct virtio_net_supported_hash_functions {
> +    u8 ack;
> +    u8 supported_hash_functions;
> +};
> +#define VIRTIO_RSS_HASH_FUNCTION_TOEPLITZ          (1 << 0)
> +#define VIRTIO_RSS_HASH_FUNCTION_SYMMETRIC         (1 << 1)
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
> +    /* maximal number of 16-bit entries */
> +    le16  max_indirection_table_len;
> +};
> +#define VIRTIO_NET_SM_HASH_SUPPORT_IP              (1 << 0)
> +#define VIRTIO_NET_SM_HASH_SUPPORT_IP_EX           (1 << 1) (only for IPv6)
> +#define VIRTIO_NET_SM_HASH_SUPPORT_TCP             (1 << 2)
> +#define VIRTIO_NET_SM_HASH_SUPPORT_TCP_EX          (1 << 3) (only for IPv6)
> +#define VIRTIO_NET_SM_HASH_SUPPORT_UDP             (1 << 4)
> +#define VIRTIO_NET_SM_HASH_SUPPORT_UDP_EX          (1 << 5) (only for IPv6)
> +\end{lstlisting}
> +For exact meaning of VIRTIO_NET_SM_HASH_SUPPORT_ flags see \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode / RSS Toeplitz implementation}.
> +
> +For VIRTIO_NET_SM_CTRL_RSS_SET command driver sends following structure:
> +\begin{lstlisting}
> +struct virtio_net_rss_conf {
> +    le16 hash_types_v4; (one or more of VIRTIO_NET_SM_HASH_SUPPORT bits)
> +    le16 hash_types_v6; (one or more of VIRTIO_NET_SM_HASH_SUPPORT bits)
> +    u8 hash_function; /* one of VIRTIO_RSS_HASH_FUNCTION*/
> +    u8 hash_key_length;
> +    le16 indirection_table_length;
> +    /* queue to place unclassified packets in */
> +    le16 default_queue;
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
> +
> +\devicenormative{\subparagraph}{RSS Toeplitz implementation}{Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode }
> +\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode / RSS Toeplitz implementation}
> +If device reports support for VIRTIO_RSS_HASH_FUNCTION_TOEPLITZ:
> +
> +It MUST support keys of at least 40 bytes and indirection table of at least 128 entries.
> +
> +The device applies mask of (indirection_table_length - 1) to the calculated hash and uses the result as the index in the indirection table to get 0-based number of destination receive queue.
> +
> +If the device did not calculate the hash for specific packet, it directs it to the default queue, as specified by virtio_net_rss_conf.\field{default_queue}.
> +
> +The device calculates hash on IPV4 packets as following according to virtio_net_rss_conf.\field{hash_types_v4}:
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
> +\item If one of VIRTIO_NET_SM_HASH_SUPPORT_TCP, VIRTIO_NET_SM_HASH_SUPPORT_UDP is set,
> +the device MUST skip over any IP header options. If the device can not skip over
> +IP header options, if MUST not calculate the hash. If the packet is not TCP or UDP packet respectively, the device falls back to VIRTIO_NET_SM_HASH_SUPPORT_IP case.
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
> +\begin{itemize}
> +\item Source IPv6 address
> +\item Destination IPv6 address
> +\item Source TCP port
> +\item Destination TCP port
> +\end{itemize}
> +\item If VIRTIO_NET_SM_HASH_SUPPORT_UDP is set, the hash is calculated over following fields:
> +\begin{itemize}
> +\item Source IPv6 address
> +\item Destination IPv6 address
> +\item Source UDP port
> +\item Destination UDP port
> +\end{itemize}
> +\item If one of VIRTIO_NET_SM_HASH_SUPPORT_TCP, VIRTIO_NET_SM_HASH_SUPPORT_UDP is set,
> +the device MUST skip over any IPv6 header options. If the device can not skip over
> +IPv6 header options, if MUST not calculate the hash. If the packet is not TCP or UDP packet respectively, the device falls back to VIRTIO_NET_SM_HASH_SUPPORT_IP case.
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

