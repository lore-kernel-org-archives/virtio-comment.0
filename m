Return-Path: <virtio-comment-return-8572-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F49CC61DF7
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 14:14:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 702352B24C
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 14:14:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4FB8B9868AC
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 14:14:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 31C189868A2; Thu, 23 Nov 2023 14:14:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 225809868A3
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Nov 2023 14:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: OktZOha-PyepDC5rp5zZIg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700748838; x=1701353638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UyaTxQrnWlph8eEfDzhB5H9VfZtoJ+jv1ofjKdFICk=;
        b=JOtQWAwFpYieLYZ5b/qdKKd14DOvSt3D33T+x7oCqHIe6Ey5VlY55s3hVzvGG37pqZ
         k7SMdkznfr5Sy0qpU1WukmxKFzsGkGtVwVMSLxpTrxZoiUcjH2/RQfN4fLJ2huMZBa1y
         KRQ/Z7wmcL8Cqs31TT3tELknDPHgTBMbPUA9sg6QDga6wGJtydjtXNLuiBaoC+/cWYXr
         94h0R+7oaJ0Ng4kZWobwHAlOOPXpFxoWtvQdVQSZLCzoN0u7IqA9FFKUYmmolqgyrxQI
         W0dV5ueyar8be06plj0cdwnv3X6BPhMtJoc2u7Q8g9lVp/9ajT6W9ZxyJit2Jfk76bL5
         qRtg==
X-Gm-Message-State: AOJu0Yw5D2gev8tJYEw41CG/9NnyzgcrL2Pi4OowMfYkMF8LE8vfcgEL
	8Qqstchi3zWdGT6bPbLmB5UpuvuwinoIIljXwNSfTe2zPkI+K5iWuvgHfKvm2dIGze7jK9QIAlz
	UICMF0sI90ZpR2FgShQHz3oFbuHHwV1Nwuw==
X-Received: by 2002:a05:600c:1553:b0:409:5a92:4718 with SMTP id f19-20020a05600c155300b004095a924718mr4086724wmg.36.1700748838256;
        Thu, 23 Nov 2023 06:13:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5x3Gla1EVc7BkAZhiBHvoavQ/xcy17FQ4Ejma7XqnT0Mdm7fB989PUoYqll1KGo6QPDg/1A==
X-Received: by 2002:a05:600c:1553:b0:409:5a92:4718 with SMTP id f19-20020a05600c155300b004095a924718mr4086702wmg.36.1700748837778;
        Thu, 23 Nov 2023 06:13:57 -0800 (PST)
Date: Thu, 23 Nov 2023 09:13:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com,
	sburla@marvell.com, shahafs@nvidia.com, si-wei.liu@oracle.com,
	xuanzhuo@linux.alibaba.com, Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231123091129-mutt-send-email-mst@kernel.org>
References: <20231123092119.2718448-1-parav@nvidia.com>
 <20231123092119.2718448-3-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20231123092119.2718448-3-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v7 2/5] virtio-net: Add flow filter capabilities read
 commands

On Thu, Nov 23, 2023 at 11:21:16AM +0200, Parav Pandit wrote:
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

So I am still unsure about these commands.  What exactly is the point?

Patch 5/5 mandates that device validates all fields already.
Are there guests that will actually look at these
caps as opposed to just sending commands and looking
at the return status?


> ---
> changelog:
> v6->v7:
> - plenty of grammar corrections suggested by Cornelia
> v2->v3:
> - rebased on virtio-1.4 branch
> - removed reference for flow filter virtqueue
> v1->v2:
> - addressed comments from Satananda
> - added vlan type match field
> - kept space for types between l2, l3, l4 header match types
> - renamed mask to mask_supported with shorter width
> - made more fields reserved for future
> - addressed comments from Heng
> - grammar correction
> - added field to indicate supported number of actions per flow
>   filter match entry
> - added missing documentation for max_flow_priorities_per_group
> v0->v1:
> - added mask field in the type to indicate supported mask by device
>   and also in later patch to use it to indicate mask on adding
>   flow filter. As a result removed the mask_supported capability
>   field
> ---
>  device-types/net/description.tex | 207 ++++++++++++++++++++++++++++++-
>  1 file changed, 206 insertions(+), 1 deletion(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 03909ae..10d92d9 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -1170,7 +1170,11 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
>  
>  The device indicates the flow filter capabilities to the driver. These
>  capabilities include various maximum device limits and
> -supported packet match fields.
> +supported packet match fields. These control virtqueue
> +commands are:
> +\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
> +and
> +\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
>  
>  The flow filters are grouped using a flow filter group. Each flow filter
>  group has a priority. The device first applies the flow filters of the highest
> @@ -1222,6 +1226,136 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
>        the flow filters in group_C, the flow filters of next level group_B are applied.
>  \end{itemize}
>  
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
> +When \field{mask_supported} is set, for the specific \field{type}, the
> +device can mask packet fields with the mask supplied in the flow
> +filter match entry.
> +
> +For each \field{type} the \field{fields_bmap} indicates supported fields
> +of the packet header which can be matched.
> +
> +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} as follows:
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
> +are represented by a bitmap in \field{fields_bmap} as follows:
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
> +are represented by a bitmap in \field{fields_bmap} as follows:
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
> +are represented by a bitmap in \field{fields_bmap} as follows:
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
> +are represented by a bitmap in \field{fields_bmap} as follows:
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
> +are represented by a bitmap in \field{fields_bmap} as follows:
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
> @@ -2389,6 +2523,77 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
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
> +\field{max_groups} indicates total number of flow filter groups supported
> +by the device whose group identifiers can be any value in the range from 0 to
> +\field{max_groups - 1}. The flow filter group can have any priority in range
> +of 0 to \field{max_groups - 1}.
> +
> +\field{max_ff_per_group} indicates the maximum number of
> +flow filters per flow filter group which can be added by the driver.
> +
> +\field{max_ff} indicates the maximum number of flow filters across
> +all the flow groups which can be added by the driver.
> +
> +\field{max_ff_priorities_per_group} indicates the maximum priority value
> +of a flow filter within a group. A flow filter within a group can have any
> +priority in range of zero to \field{max_ff_priorities_per_group - 1}.
> +
> +\field{max_match_fields} indicates maximum number of fields of a packet
> +which can be matched by the device for a flow filter.
> +
> +\field{max_actions} indicates maximum number of actions for a flow filter
> +that can be supplied.
> +
> +\field{max_flow_priorities_per_group} indicates maximum number of
> +priorities supported by the device per flow filter group.
> +
> +\subparagraph{Flow Filter Match Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}
> +
> +The command VIRTIO_NET_CTRL_FF_MATCH_CAP_GET indicates which fields
> +of the packet can be matched.
> +
> +\begin{lstlisting}
> +struct virtio_net_ctrl_ff_match_types {
> +        le32 num_entries;
> +        struct virtio_net_ff_match_type_cap types[];
> +};
> +\end{lstlisting}
> +
> +\field{num_entries} indicates the length of the array \field{types}.
> +Each array entry of \field{types} represents the fields of the packet
> +which are supported for matching by the device.
> +
>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
>  Types / Network Device / Legacy Interface: Framing Requirements}
>  
> -- 
> 2.34.1


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

