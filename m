Return-Path: <virtio-comment-return-8551-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E5EC61D9B
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:22:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E66B52AEF3
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:22:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B90F6986898
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 13:22:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 94DD7986895; Wed, 22 Nov 2023 13:22:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 84C43986896
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 13:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 4aexb6gsPh6FeY9nvjUcWg-1
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.oasis-open.org,
 mst@redhat.com
Cc: sburla@marvell.com, shahafs@nvidia.com, si-wei.liu@oracle.com,
 xuanzhuo@linux.alibaba.com, Parav Pandit <parav@nvidia.com>, Heng Qi
 <hengqi@linux.alibaba.com>
In-Reply-To: <20231110123853.2093309-2-parav@nvidia.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-2-parav@nvidia.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 22 Nov 2023 14:22:51 +0100
Message-ID: <87a5r5ly6s.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: [virtio-comment] Re: [PATCH v6 1/5] virtio-net: Add theory of operation for flow filter

On Fri, Nov 10 2023, Parav Pandit <parav@nvidia.com> wrote:

> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index aff5e08..30220b5 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -33,6 +33,9 @@ \subsection{Virtqueues}\label{sec:Device Types / Network Device / Virtqueues}
>  controlq is optional; it only exists if VIRTIO_NET_F_CTRL_VQ is
>  negotiated.
>  
> +The flow filter virtqueues are optional; it may exists only if VIRTIO_NET_F_FLOW_FILTER
> +is negotiated and if the device reports such capability.

I first thought we should just reword this... but what does "such
capability" actually mean? If the feature is negotiated, there are M
flow filter virtqueues at positions 2N+1..2N+M, with the value of M
exposed by the device? I think we need to list those virtqueues
explicitly, otherwise it is confusing.

(...)

> +Each flow filter consists of one or more match key, a flow filter priority,

s/key/keys/

> +a flow filter identifier, an action to forward a packet to the destination
> +or to drop the packet.

(...)

> +The flow filter group can have one or more flow filters. Within a flow

s/The/A/

> +filter group, a packet may find a match to multiple flow filters. In such

s/find a match to/match/
s/such/such a/

> +scenario, a flow filter with the highest priority is applied first to the
> +packet, if there is no match, the next higher priority flow filter is applied.

Slightly confusing... maybe

"In such a scenario, of the matching flow filters the one with the
highest priority is applied, skipping any matching filters with a lower
priority."

(At least, that's how I interpret this.)


> +
> +\paragraph{Packet Processing Order}\label{sec:sec:Device Types / Network Device / Device Operation / Flow Filter / Packet Processing Order}
> +
> +Whichever filtering and steering functionality is enabled, they are
> +applied in the following order for the received packet:

"If enabled, filtering and steering functionalities are applied to the
received packet in the following order:" ?

> +
> +\begin{itemize}
> +\item apply device configuration done using control virtqueue commands
> +      VIRTIO_NET_CTRL_RX, VIRTIO_NET_CTRL_MAC and VIRTIO_NET_CTRL_VLAN.
> +\item apply flow filter configuration done using flow filter requests.
> +\item apply device configuration done using command
> +      VIRTIO_NET_CTRL_MQ_RSS_CONFIG.
> +\end{itemize}
> +
> +While processing a received packet, at any stage if the packet is dropped,

"if the packet is dropped at any stage"

> +the next level of processing is omitted.

"the following levels of processing are omitted"

> +
> +When a flow filter is matched for the packet, it also stops the processing
> +of the packet for next stage.

"If a flow filter is matched for the packet, the following levels of
processing are omitted as well." ?

> +
> +Few examples are:

s/Few/A few/

> +\begin{itemize}
> +\item If the packet is dropped by the flow filter configuration, RSS
> +      configuration is not applied to such a packet.
> +\item If the packet is forwarded to a specific receiveq using flow filters,
> +      RSS configuration is not applied to such a packet due to a match on the
> +      flow filter request.
> +\item If the packet is dropped due to VIRTIO_NET_CTRL_MAC configuration,
> +      flow filters or RSS configuration is not applied to such a packet.

"neither flow filters nor RSS configuration are applied"

> +\item If the packet does not find any match in any of the flow filter groups,
> +      next level RSS device configuration is applied if its exists.
> +\item If there are three flow filter groups configured as group_A, group_B
> +      and group_C with respective priorities as 4, 5, and 6; flow filters of

s/flow filters/the flow filters/

> +      group_C is applied first having highest group priority, if there is a match,

s/is applied/are applied/

> +      flow filters of group_B and group_A are skipped; if there is no match for
> +      the flow filters in group_C, the flow filters of next level group_B are applied.
> +\end{itemize}
> +
> +\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
>  \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
>  
>  The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is


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

