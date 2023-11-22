Return-Path: <virtio-comment-return-8554-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9FBC61D97
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:38:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9A3E12B140
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:38:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 924EC9868A6
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:38:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 840BC986895; Wed, 22 Nov 2023 13:38:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7675F986896
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 13:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: a5pTTzcCPcW1Vi1GiqAc2Q-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.oasis-open.org,
 mst@redhat.com
Cc: sburla@marvell.com, shahafs@nvidia.com, si-wei.liu@oracle.com,
 xuanzhuo@linux.alibaba.com, Parav Pandit <parav@nvidia.com>, Heng Qi
 <hengqi@linux.alibaba.com>
In-Reply-To: <20231110123853.2093309-3-parav@nvidia.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 22 Nov 2023 14:38:18 +0100
Message-ID: <877cm9lxh1.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter capabilities read
 commands

On Fri, Nov 10 2023, Parav Pandit <parav@nvidia.com> wrote:

> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 30220b5..eccd8d6 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1173,7 +1173,11 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
>  
>  The device indicates the flow filter capabilities to the driver. These
>  capabilities include various maximum device limits and
> -supported packet match fields.
> +supported packet match fields. These control virtqueue
> +commands are:

Wait, if this uses control vq commands, what are the "flow control
virtqueues" mentioned in the previous patch?

> +\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
> +and
> +\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
>  
>  The flow filters are grouped using a flow filter group. Each flow filter
>  group has a priority. The device first applies the flow filters of the highest
> @@ -1224,7 +1228,136 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
>        the flow filters in group_C, the flow filters of next level group_B are applied.
>  \end{itemize}
>  
> -\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Setting Promiscuous Mode}%old label for latexdiff

I think you added this in the last patch? Just drop it?

> +\paragraph{Match Types and Fields}\label{sec:Device Types / Network Device / Device Operation / Flow Filter / Match Types and Fields}
> +
> +\begin{lstlisting}
> +struct virtio_net_ff_match_type_cap {
> +        le16 type;
> +        u8 mask_supported;
> +        u8 reserved[5];
> +        le64 fields_bmap;
> +};
> +\end{lstlisting}
> +
> +The \field{type} corresponds to following table:
> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Type & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_ETH_HDR & Ethernet header of the packet \\
> +\hline
> +0x1   & VIRTIO_NET_FF_VLAN_TAG_HDR & VLAN tag of the packet \\
> +\hline
> +0x200   & VIRTIO_NET_FF_IPV4_HDR & IPv4 header of the packet \\
> +\hline
> +0x300   & VIRTIO_NET_FF_IPV6_HDR & IPv6 header of the packet \\
> +\hline
> +0x400   & VIRTIO_NET_FF_TCP_HDR & TCP header of the packet \\
> +\hline
> +0x500   & VIRTIO_NET_FF_UDP_HDR & UDP header of the packet \\
> +\hline
> +other   & -    & reserved \\
> +\hline
> +\end{tabular}
> +
> +When the \field{mask_supported} is set, for the specific \field{type}, the

s/When the/When/

> +device can perform masking packet fields with the mask supplied in the flow

s/perform masking/mask/

> +filter match entry.
> +
> +For each \field{type} the \field{fields_bmap} indicates supported fields
> +of the packet header which can be matched.
> +
> +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} are following:

s/are following/as follows/

> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Bit & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the packet \\
> +\hline
> +1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet \\
> +\hline
> +2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
> +\hline
> +other   & -    & reserved \\
> +\hline
> +\end{tabular}
> +
> +For the \field{type} of VIRTIO_NET_FF_VLAN_TAG_HDR, VLAN tag fields
> +are represented by a bitmap in \field{fields_bmap} are following:

s/are following/as follows/

> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Bit & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_VLAN_TAG_TCI & Vlan tag TCI 16-bit field \\
> +\hline
> +other   & -    & reserved \\
> +\hline
> +\end{tabular}
> +
> +For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} are following:

s/are following/as follows/

> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Bit & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_SRC_IPV4 & Source IPV4 address in the packet \\
> +\hline
> +1   & VIRTIO_NET_FF_DST_IPV4 & Destination IPV4 address in the packet \\
> +\hline
> +other   & -    & reserved \\
> +\hline
> +\end{tabular}
> +
> +For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} are following:

s/are following/as follows/

> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Bit & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_SRC_IPV6 & Source IPV6 address in the packet \\
> +\hline
> +1   & VIRTIO_NET_FF_DST_IPV6 & Destination IPV6 address in the packet \\
> +\hline
> +other   & -    & reserved \\
> +\hline
> +\end{tabular}
> +
> +For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} are following:

s/are following/as follows/

> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Bit & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_SRC_TCP_PORT & Source TCP port in the packet \\
> +\hline
> +1   & VIRTIO_NET_FF_DST_TCP_PORT & Destination TCP port in the packet \\
> +\hline
> +other   & -    & reserved \\
> +\hline
> +\end{tabular}
> +
> +For the \field{type} of VIRTIO_NET_FF_UDP_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} are following:

s/are following/as follows/

> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Bit & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_SRC_UDP_PORT & Source UDP port in the packet \\
> +\hline
> +1   & VIRTIO_NET_FF_DST_UDP_PORT & Destination UDP port in the packet \\
> +\hline
> +other   & -    & reserved  \\
> +\hline
> +\end{tabular}
> +
>  \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
>  
>  The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
> @@ -2392,6 +2525,77 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>  of the driver's records. In such cases, the driver should allocate additional
>  space for the \field{command-specific-result} buffer.
>  
> +\paragraph{Flow Filter}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter}
> +
> +If the VIRTIO_NET_F_FLOW_FILTER feature is negotiated,
> +
> +\begin{itemize}
> +\item the driver can send commands VIRTIO_NET_CTRL_FF_CAP_GET and
> +VIRTIO_NET_CTRL_FF_MATCH_CAP_GET to query the flow filter
> +capabilities of the device.
> +\end{itemize}
> +
> +\begin{lstlisting}
> +#define VIRTIO_NET_CTRL_FF 7
> + #define VIRTIO_NET_CTRL_FF_CAP_GET 0
> + #define VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1
> +\end{lstlisting}
> +
> +\subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
> +
> +The command VIRTIO_NET_CTRL_FF_CAP_GET provides the flow filter device capabilities.
> +
> +\begin{lstlisting}
> +struct virtio_net_ctrl_ff_caps {
> +        le16 max_match_fields;
> +        le16 max_groups; /* valid group id = max_groups - 1 */
> +        le32 max_ff_per_group;
> +        le32 max_ff; /* max flow_id in add/del = max_ff - 1 */
> +        le16 max_actions;
> +        u8 max_flow_priorities_per_group;
> +};
> +\end{lstlisting}
> +
> +The \field{max_groups} indicates total number of flow filter groups supported

s/The//

> +by the device whose group identifier can be any value in the range from 0 to

s/group identifier/group indentifiers/

> +\field{max_groups - 1}. The flow filter group can have any priority in range
> +of 0 to \field{max_groups - 1}.
> +
> +The \field{max_ff_per_group} indicates maximum number of

s/The//
s/maximum/the maximum/

> +flow filter per flow filter group which can be added by the driver.

"flow filters"

> +
> +The \field{max_ff} indicates maximum number of flow filters across

s/The//
s/maximum/the maximum/

> +all the flow groups which can be added by the driver.
> +
> +The \field{max_ff_priorities_per_group} indicates maximum priority value

s/The//
s/maximum/the maximum/

> +of a flow filter within a group. A flow filter within a group can have any
> +priority in range of zero to \field{max_ff_priorities_per_group - 1}.
> +
> +The \field{max_match_fields} indicates maximum number of fields of the packet

s/The//
s/maximum/the maximum/
s/of the packet/of a packet/

> +which can be matched by the device for a flow filter.
> +
> +The \field{max_actions} indicates maximum number of actions for a flow filter

s/The//
s/maximum/the maximum/

> +match entry can be supplied by the driver.

"that can be supplied"

> +
> +The \field{max_flow_priorities_per_group} indicates maximum number of

s/The//
s/maximum/the maximum/

> +priorities supported by the device per flow filter group.
> +
> +\subparagraph{Flow Filter Match Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}
> +
> +The command VIRTIO_NET_CTRL_FF_MATCH_CAP_GET indicates which fields
> +from the packet can be matched.

s/from/of/

> +
> +\begin{lstlisting}
> +struct virtio_net_ctrl_ff_match_types {
> +        le32 num_entries;
> +        struct virtio_net_ff_match_type_cap types[];
> +};
> +\end{lstlisting}
> +
> +The \field{num_entries} indicates the length of an array \field{types}.

s/The//
s/an/the/

> +Each array entry of \field{types} represents supported match fields of
> +the packet by the device.

"represents the fields of the packet which are supported for matching by
the device"

> +
>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>  Types / Network Device / Legacy Interface: Framing Requirements}
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

