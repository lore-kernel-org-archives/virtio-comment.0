Return-Path: <virtio-comment-return-8558-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2740C61D9B
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 14:02:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 105F426A35
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 14:02:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E64369868A5
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 14:02:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CC330986896; Wed, 22 Nov 2023 14:02:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BC5E3986898
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 14:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: RBjGsAWkOCC_1S-ZNKBvHQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700661752; x=1701266552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3ddtK4bLpjKb1WQ8vtogSPWGYn9LnCYohagke3CPEA=;
        b=CPENlsjU+L5DZiD4N8NPd3CyflIrtOiYLJiYngZ3JrJ119PyJ40oOMa1bAzgWyZdfk
         fgz8SmcqMuJ+uc5wAjgE5FdQYtxC4g0Aigm9PuldzcCVSGxqctc0SNr+Jgo02w+ztHO6
         zqHZNrVu63DXIWfqPTDOEm+aCPGlPCrQFXDQDhKjXDwrscVRrCZwK9xjHIJbcWIx6vaz
         dM0uPORXqU0vCYLLr6srFHcsn0kwP4Ymm22eYRylsgY+fZgjFk2i+2lT/FYcl7lPLqZM
         DMRFcf/YbPJNP4fQr4DArmqDy3poBz3LozoUDVrpfRvb69n0KiWp6QRiXH2pvNPg3wxE
         WUSQ==
X-Gm-Message-State: AOJu0YxsmSsufQy+8WxiX2gBmhhi/Y8vrNVEGEGmcwy58xblQPC95HC+
	w0WkmlWsD+1GZ/e9NKXM9sFVJX+8+1dwCqr1jVh8gSQ5qeb73cfG8EB7nT7KNh6uzMYiNdqiX1z
	4yKvT+c+hofdDNH6PoaxW+7mFhWlu+RRdFw==
X-Received: by 2002:a17:906:20d0:b0:a04:7e8a:dc2f with SMTP id c16-20020a17090620d000b00a047e8adc2fmr1315514ejc.70.1700661752239;
        Wed, 22 Nov 2023 06:02:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzRVZngjQd5lpwvQHmsyjnAule3hAyqN3hf/tWDLqKHH/hg5ZZSv/X8i+IKC07Zs1VvyoACA==
X-Received: by 2002:a17:906:20d0:b0:a04:7e8a:dc2f with SMTP id c16-20020a17090620d000b00a047e8adc2fmr1315347ejc.70.1700661749990;
        Wed, 22 Nov 2023 06:02:29 -0800 (PST)
Date: Wed, 22 Nov 2023 09:02:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, cohuck@redhat.com,
	sburla@marvell.com, shahafs@nvidia.com, si-wei.liu@oracle.com,
	xuanzhuo@linux.alibaba.com, Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231122084105-mutt-send-email-mst@kernel.org>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20231110123853.2093309-3-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter capabilities read
 commands

On Fri, Nov 10, 2023 at 02:38:50PM +0200, Parav Pandit wrote:
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
> v2->v3:
> - rebased on virtio-1.4 branch
> - removed reference for flow filter virtqueue
> v1->v2:
> - addressed comments from Satananda
> - added vlan type match field
> - kept space for types between l2, l3, l4 header match types
> - renamed mask to mask_supported with shorter width
> - made more fields reserved for furture
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
>  device-types/net/description.tex | 208 ++++++++++++++++++++++++++++++-
>  1 file changed, 206 insertions(+), 2 deletions(-)
> 
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
> +device can perform masking packet fields with the mask supplied in the flow
> +filter match entry.
> +
> +For each \field{type} the \field{fields_bmap} indicates supported fields
> +of the packet header which can be matched.
> +
> +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} are following:
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

This is such an elaborate structure to report just 12 read only bits.
Please let's just follow the example of  le32 supported_tunnel_types
and add l32 supported_flow_control.


After you were trying to add kilobytes to megabytes of memory -
I see little reason to save 12 RO bits that can be shared by any
number of VFs.

However, I do think we should create an option to access config space
over DMA (preferably admin commands). Let's add this quickly and then
we don't need to worry about legacy guests accessing flow filter
through MMIO.

-- 
MST


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

