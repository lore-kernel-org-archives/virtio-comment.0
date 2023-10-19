Return-Path: <virtio-comment-return-7835-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F89CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 07:13:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 75D9E7786B
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 07:13:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 505B59868D0
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 07:13:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3DF8A9868C7; Thu, 19 Oct 2023 07:13:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2F5029868C8
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 07:13:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R641e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VuT9EK6_1697699604;
Message-ID: <39cd5f48-2044-4e19-bec0-fa1f0a4c124b@linux.alibaba.com>
Date: Thu, 19 Oct 2023 15:13:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Parav Pandit <parav@nvidia.com>
Cc: sburla@marvell.com, shahafs@nvidia.com, si-wei.liu@oracle.com,
 xuanzhuo@linux.alibaba.com,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-3-parav@nvidia.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <20231007051443.460148-3-parav@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 2/7] virtio-net: Add flow filter
 capabilities read commands



在 2023/10/7 下午1:14, Parav Pandit 写道:
> The device responds flow filter capabilities using two commands.
> One command indicates generic flow filter device limits such as
> number of flow filters, number of flow filter groups, support or
> multiple transports etc.
>
> The second command indicates supported match types, and fields
> of the packet.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
>
> ---
> changelog:
> v0->v1:
> - added mask field in the type to indicate supported mask by device
>    and also in later patch to use it to indicate mask on adding
>    flow filter. As a result removed the mask_supported capability
>    field
> ---
>   device-types/net/description.tex | 194 ++++++++++++++++++++++++++++++-
>   1 file changed, 192 insertions(+), 2 deletions(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index c9a8c52..19f6c60 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1168,7 +1168,11 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
>   The device indicates the flow filter capabilities to the driver, which
>   includes various maximum device limits, supported transports and
>   supported packet match fields. The driver enables the transport for flow
> -filter requests using a control virtqueue command.
> +filter requests using a control virtqueue command. These control virtqueue
> +commands are:
> +\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
> +and
> +\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
>   
>   The device support transporting flow filter requests on either the control
>   virtqueue or on the flow filter virtqueues or on both. However, device
> @@ -1252,7 +1256,116 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
>         the flow filters in group_C, the flow filters of next level group_B are applied.
>   \end{itemize}
>   
> -\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
> +\paragraph{Match Types and Fields}\label{sec:Device Types / Network Device / Device Operation / Flow Filter / Match Types and Fields}
> +
> +\begin{lstlisting}
> +struct virtio_net_ff_match_type {
> +        le16 type;
> +        le16 mask;
> +        le32 reserved;
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
> +0   & VIRTIO_NET_FF_ETH_HDR & Ethernet header of the packet  \\
> +\hline
> +1   & VIRTIO_NET_FF_IPV4_HDR & IPv4 header of the packet \\
> +\hline
> +2   & VIRTIO_NET_FF_IPV6_HDR & IPv6 header of the packet \\
> +\hline
> +3   & VIRTIO_NET_FF_TCP_HDR & TCP header of the packet \\
> +\hline
> +4   & VIRTIO_NET_FF_UDP_HDR & UDP header of the packet \\
> +\hline
> +other   & -    & reserved  \\
> +\hline
> +\end{tabular}
> +
> +When the \field{mask} is set, for the specific \field{type}, the device
> +supports masking packet content with the supplied mask of the flow filter
> +before comparing the resulting value with the flow filter match fields.
> +
> +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} are following:
> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Bit & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the packet  \\
> +\hline
> +1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet \\
> +\hline
> +2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
> +\hline
> +\end{tabular}
> +
> +For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} are following:
> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Bit & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_SRC_IPV4 & Source IPV4 address in the packet \\
> +\hline
> +1   & VIRTIO_NET_FF_DST_IPV4 & Destination IPV4 address in the packet \\
> +\hline
> +other   & -    & reserved  \\
> +\hline
> +\end{tabular}
> +
> +For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} are following:
> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Bit & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_SRC_IPV6 & Source IPV6 address in the packet \\
> +\hline
> +1   & VIRTIO_NET_FF_DST_IPV6 & Destination IPV6 address in the packet \\
> +\hline
> +other   & -    & reserved  \\
> +\hline
> +\end{tabular}
> +
> +For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} are following:
> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Bit & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_SRC_TCP_PORT & Source TCP port in the packet \\
> +\hline
> +1   & VIRTIO_NET_FF_DST_TCP_PORT & Destination TCP port in the packet \\
> +\hline
> +other   & -    & reserved  \\
> +\hline
> +\end{tabular}
> +
> +For the \field{type} of VIRTIO_NET_FF_UDP_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} are following:
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
>   \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
>   
>   The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
> @@ -1917,6 +2030,83 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>   
>   Upon reset, a device MUST initialize all coalescing parameters to 0.
>   
> +\paragraph{Flow Filter}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter}
> +
> +If the VIRTIO_NET_F_FLOW_FILTERS feature is negotiated, the driver can
> +send commands VIRTIO_NET_CTRL_FF_CAP_GET and
> +VIRTIO_NET_CTRL_FF_MATCH_CAP_GET to query the flow filter
> +capabilities of the device.
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
> +        le16 max_vqs;
> +        le16 start_vq_index;
> +        le16 max_match_fields;
> +        le16 max_groups; /* valid group id = max_groups - 1 */
> +        le32 max_ff_per_group;
> +        le32 max_ff; /* max flow_id in add/del
> +                                * = max_ff - 1.
> +                                */
> +        u8 max_flow_priorities_per_group;
> +        u8 cvq_supports_ff_req;
> +};
> +\end{lstlisting}
> +
> +The \field{max_vqs} indicates total number of flow filter virtqueues supported
> +by the device starting from virtqueue index \field{start_vq_index}. When the
> +device do not support flow filter requests over flow filter virtqueues,

s/do not/does not

Thanks!

> +\field{max_vqs} is zero. When \field{max_vqs} is non zero, the driver can enable
> +maximum of \field{max_vqs} number of flow filter virtqueues starting from
> +virtqueue index \field{start_vq_index}.
> +
> +The \field{max_groups} indicates total number of flow filter groups supported
> +by the device whose group identifier can be any value in the range from 0 to
> +\field{max_groups - 1}. The flow filter group can have any priority in range
> +of 0 to \field{max_groups - 1}.
> +
> +The \field{max_ff_per_group} indicates maximum number of
> +flow filter per flow filter group which can be added by the driver.
> +
> +The \field{max_ff} indicates maximum number of flow filters across
> +all the flow groups which can be added by the driver.
> +
> +The \field{max_ff_priorities_per_group} indicates maximum priority value
> +of a flow filter within a group. A flow filter within a group can have any
> +priority in range of zero to \field{max_ff_priorities_per_group - 1}.
> +
> +The \field{max_match_fields} indicates maximum number of fields of the packet
> +which can be matched by the device for a flow filter.
> +
> +When the \field{cvq_supports_ff_req} is set, the device supports
> +flow filter requests using a control virtqueue. The device may support flow
> +filter requests on control virtqueue or using flow filter virtqueues or both.
> +
> +\subparagraph{Flow Filter Match Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}
> +
> +The command VIRTIO_NET_CTRL_FF_MATCH_CAP_GET indicates which fields
> +from the packet can be matched.
> +
> +\begin{lstlisting}
> +struct virtio_net_ctrl_ff_match_types {
> +        le32 num_entries;
> +        struct virtio_net_ff_match_type types[];
> +};
> +\end{lstlisting}
> +
> +The \field{num_entries} indicates the length of an array \field{types}.
> +Each array entry of \field{types} represents supported match fields of
> +the packet by the device.
> +
>   \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>   Types / Network Device / Legacy Interface: Framing Requirements}
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

