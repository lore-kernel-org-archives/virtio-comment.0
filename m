Return-Path: <virtio-comment-return-7834-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D3FCDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 07:10:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4931A72347
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 07:10:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 14BD49868D3
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 07:10:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E00269868C7; Thu, 19 Oct 2023 07:10:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CE2F39868C8
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 07:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R221e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VuT9DBX_1697699400;
Message-ID: <42ef3788-8cd0-47a7-b246-ad997dcf2ac3@linux.alibaba.com>
Date: Thu, 19 Oct 2023 15:09:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Parav Pandit <parav@nvidia.com>
Cc: sburla@marvell.com, shahafs@nvidia.com, si-wei.liu@oracle.com,
 xuanzhuo@linux.alibaba.com,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-2-parav@nvidia.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <20231007051443.460148-2-parav@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/7] virtio-net: Add theory of
 operation for flow filter



在 2023/10/7 下午1:14, Parav Pandit 写道:
> Currently packet allow/drop interface has few limitations.

s/few limitations/a few limitations

>
> 1. Driver can either select which MAC and VLANs to consider
> for allowing/dropping packets, here, the driver has a
> limitation that driver needs to supply full mac
> table for each type. Driver cannot add or delete an
> individual entry.
>
> 2. Driver cannot select mac+vlan combination for which
> to allow/drop packet.
>
> 3. Driver cannot not set other commonly used packet match fields

Remove 'not'.

> such as IP header fields, TCP, UDP, SCP header fields.
>
> 4. Driver cannot steer specific packets based on the match
> fields to specific receiveq.
>
> 5. Driver do not have multiple or dedicated virtqueues to
>     perform flow filter requests in accelerated manner in
>     the device.
>
> Flow filter as generic framework overcome above limitations.

'as a generic framework overcomes'

>
> As starting point it is useful to support at least two use cases.
> a. ARFS
> b. ethtool ntuple steering
>
> In future it can be further extended for usecases such as
> switching device, connection tracking or may be more.
>
> The flow filter has following properties.
>
> 1. It is an extendible object that driver can add or delete.
> 2. It belongs to a flow filter group (group has priority).
> 3. Each flow filter is identified using a unique identifier(id),
>     has priority, match fields, destination(rq) and action(allow/drop).
> 4. Flow filter has optionally mask too.
>
> This patch adds theory of operation for flow filter functionality.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>   device-types/net/description.tex | 114 ++++++++++++++++++++++++++++++-
>   1 file changed, 113 insertions(+), 1 deletion(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 76585b0..c9a8c52 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -10,7 +10,9 @@ \section{Network Device}\label{sec:Device Types / Network Device}
>   removes these packets from the transmit virtqueue and sends them to
>   the link. The device may have a control virtqueue. The driver
>   uses the control virtqueue to dynamically manipulate various
> -features of the initialized device.
> +features of the initialized device. The device may have flow filter
> +virtqueues. The driver uses flow filter virtqueues to steer specific
> +receive packets to a specific destination such as specified receiveq.
>   
>   \subsection{Device ID}\label{sec:Device Types / Network Device / Device ID}
>   
> @@ -33,6 +35,9 @@ \subsection{Virtqueues}\label{sec:Device Types / Network Device / Virtqueues}
>   controlq is optional; it only exists if VIRTIO_NET_F_CTRL_VQ is
>   negotiated.
>   
> +The flow filter virtqueues are optional; it may exists only if VIRTIO_NET_F_FLOW_FILTER
> +is negotiated and if the device reports such capability.
> +
>   \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits}
>   
>   \begin{description}
> @@ -119,6 +124,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>       device with the same MAC address.
>   
>   \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
> +
> +\item[VIRTIO_NET_F_FLOW_FILTER(64)] Device supports flow filter requests.
>   \end{description}
>   
>   \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
> @@ -150,6 +157,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
>   \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
>   \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
>   \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> +\item[VIRTIO_NET_F_FLOW_FILTER] Requires VIRTIO_NET_F_CTRL_VQ.
>   \end{description}
>   
>   \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Network Device / Feature bits / Legacy Interface: Feature bits}
> @@ -1141,6 +1149,110 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>   #define VIRTIO_NET_HASH_REPORT_UDPv6_EX        9
>   \end{lstlisting}
>   
> +\subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Operation / Flow Filter}
> +
> +To forward a received packet to a specific receiveq or to drop the packet based
> +on one ore more fields of the packet, the device supports flow filter

s/one ore more/one or more

> +functionality. The flow filter can match the packet for a flow, take an action
> +such as forward the packet to the specific receiveq or drop the packet.
> +For example, the driver can request the device to forward received packets
> +which matches to a specific source and destination IP addresses and

s/which matches/which match

> +TCP ports to a specific receiveq.
> +
> +Each flow filter consists of one or more match fields, a flow filter priority,
> +a flow filter identifier, an action to forward a packet to the destination
> +or to drop the packet. Each flow filter is independent of each other.
> +The driver can add, replace and delete a flow filter in the device using
> +a flow filter request.
> +
> +The device indicates the flow filter capabilities to the driver, which
> +includes various maximum device limits, supported transports and

s/includes/include

> +supported packet match fields. The driver enables the transport for flow
> +filter requests using a control virtqueue command.
> +
> +The device support transporting flow filter requests on either the control

s/support/supports

> +virtqueue or on the flow filter virtqueues or on both. However, device
> +supports enabling flow filter request only on one type of virtqueue
> +at a time, i.e. either control virtqueue or flow filter virtqueues.
> +Once the driver sets the flow filter request transport in the device,
> +the driver can send flow filter request using the enabled transport.
> +
> +The flow filters are grouped using a flow filter group. Each flow filter
> +group has a priority. The device first applies the flow filters of the highest
> +priority group to the received packet. If there is no match for the
> +flow filters of such a group for the packet, the flow filters of the next
> +priority group are applied, until there is a match for the packet from such
> +a group or the last group has reached.
> +
> +The flow filter group can have one or more flow filters. Within a flow
> +filter group, a packet may find match to multiple flow filters. In such

s/find match/find a match

> +scenario, a flow filter with the highested priority is applied first to the

s/highested/highest

> +packet, if there is no match, the next higher priority flow filter is applied.
> +
> +The match fields also optionally consist of a match mask. When a mask is
> +specified for the flow filter, first the packet fields are masked before
> +matching with the fields of the flow filter.
> +
> +\paragraph{Flow Filter Virtqueue}\label{sec:sec:Device Types / Network Device / Device Operation / Flow Filter / Flow Filter Virtqueue}
> +
> +The flow filter virtqueues are dedicated virtqueues which transport the
> +flow filter requests. The driver adds flow filter request to the flow
> +filter virtqueue, the device removes such a request from the virtqueue
> +and executes it, when the request completes by the device, the device

s/request completes/request is completed

> +updates the result of it to the driver.
> +
> +The flow filter virtqueues are optional. The device may choose to support
> +flow filters requests either on the control virtqueue or on the flow filter
> +virtqueues or both.
> +
> +If the VIRTIO_F_RING_DYNAMIC is negotiated, the driver can create the
> +flow filters virtqueues after the driver has finished the device
> +initialization.
> +
> +The device can support one or more flow filter virtqueues. The driver
> +can choose one to up to supported number of virtqueues to send requests.
> +
> +If the VIRTIO_F_RING_DYNAMIC is not negotiated, the flow filters
> +virtqueues must be created during device initialization phase.
> +
> +\paragraph{Packet Processing Order}\label{sec:sec:Device Types / Network Device / Device Operation / Flow Filter / Packet Processing Order}
> +
> +Whichever filtering and steering functionality is enabled, they are
> +applied in the following order to for the received packet:

Remove 'to'.

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
> +the next level of processing is omitted.
> +
> +When a flow filter is matched for the packet, it also stops the processing
> +of the packet for next stage.
> +
> +Few examples are:
> +\begin{itemize}
> +\item If the packet is dropped by the flow filter configuration, RSS
> +      configuration is not applied to such a packet.
> +\item If the packet is forwarded to a specific receiveq using flow filters,
> +      RSS configuration is not applied to such a packet due to a match on the
> +      flow filter request.
> +\item If the packet is dropped due to VIRTIO_NET_CTRL_MAC configuration,
> +      flow filters or RSS configuration is not applied to such a packet.
> +\item If the packet does not find any match in any of the flow filter groups,
> +      next level RSS device configuration is applied if its exists.
> +\item If there are three flow filter groups configured as group_A, group_B
> +      and group_C with respective priorties as 4, 5, and 6; flow filters of

s/priorties/priorities

Thanks!

> +      group_C is applied first having highest group priority, if there is a match,
> +      flow filters of group_B and group_A are skipped; if there is no match for
> +      the flow filters in group_C, the flow filters of next level group_B are applied.
> +\end{itemize}
> +
> +\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
>   \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
>   
>   The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is


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

