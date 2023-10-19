Return-Path: <virtio-comment-return-7833-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1863BCDB483
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 06:56:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 50A3168469
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 06:56:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 360109868CE
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 06:56:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 21BF69868C7; Thu, 19 Oct 2023 06:56:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1249F9868C8
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 06:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VuT98vE_1697698560;
Message-ID: <f5d80d00-34ca-416e-91a3-202f8f039ba2@linux.alibaba.com>
Date: Thu, 19 Oct 2023 14:56:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Parav Pandit <parav@nvidia.com>
Cc: sburla@marvell.com, shahafs@nvidia.com, si-wei.liu@oracle.com,
 xuanzhuo@linux.alibaba.com,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-8-parav@nvidia.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <20231007051443.460148-8-parav@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 7/7] virtio-net: Add flow filter
 device and driver requirements



在 2023/10/7 下午1:14, Parav Pandit 写道:
> The flow filter functionality consists of the following
> four components.
> Add driver and device requirements for it.
>
> 1. Device capabilities query for commands VIRTIO_NET_CTRL_FF_CAP_GET,
>     VIRTIO_NET_CTRL_FF_MATCH_CAP_GET.
> 2. Flow filter group operation commands VIRTIO_NET_CTRL_FF_GROUP_ADD
>     and VIRTIO_NET_CTRL_FF_GROUP_DEL.
> 3. Flow filter transport mode set command
>     VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET.
> 4. Flow filter requests using command VIRTIO_NET_CTRL_FF_REQ and
>     the structure virtio_net_ff_op for the flow filter virtqueue.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> ---
> changelog:
> v0->v1:
> - addressed comments from Satananda
> - added device requirement to return non zero value in fields_bmap
> - added device requirement to not repeat filter type in response
> - added driver requirement to order filter match field as it
>    appears in the packet
> - added device requirement to fail group delete command on existing
>    flow entries
> ---
>   device-types/net/description.tex | 126 +++++++++++++++++++++++++++++++
>   1 file changed, 126 insertions(+)
>
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index cf2836d..1a3ce63 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -2364,6 +2364,132 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>   \field{command-specific-result} is in format of
>   \field{struct virtio_net_ff_req_result}.
>   
> +\devicenormative{\subparagraph}{Flow Filter}{Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter}
> +
> +When the VIRTIO_NET_F_FLOW_FILTER is negotiated, the device MUST support
> +VIRTIO_NET_CTRL_FF_CAP_GET, VIRTIO_NET_CTRL_FF_MATCH_CAP_GET, VIRTIO_NET_CTRL_FF_GROUP_ADD,
> +VIRTIO_NET_CTRL_FF_GROUP_DEL, VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET and
> +VIRTIO_NET_CTRL_FF_REQ commands.
> +
> +When the VIRTIO_NET_F_FLOW_FILTER is not negotiated, the device MUST respond
> +with error VIRTIO_NET_ERR for
> +VIRTIO_NET_CTRL_FF_CAP_GET, VIRTIO_NET_CTRL_FF_MATCH_CAP_GET, VIRTIO_NET_CTRL_FF_GROUP_ADD,
> +VIRTIO_NET_CTRL_FF_GROUP_DEL, VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET and
> +VIRTIO_NET_CTRL_FF_REQ commands.
> +
> +When the command VIRTIO_NET_CTRL_FF_CAP_GET completes successfully, the device
> +MUST set either \field{max_vqs} to be non zero or set
> +\field{cvq_supports_ff_ops} to 1; the device MUST set non zero value for fields
> +\field{max_groups}, \field{max_ff_per_group}, \field{max_ff},
> +\field{max_match_fields} and \field{max_flow_priorities_per_group}.
> +
> +When the command VIRTIO_NET_CTRL_FF_MATCH_CAP_GET completes successfully,
> +\begin{itemize}
> +\item the device MUST set non zero value for fields \field{num_entries}, \field{fields_bmap}
> +and set corresponding number of valid entries.
> +\item the device MUST NOT repeat \field{type} in the \field{types}.
> +\end{itemize}
> +
> +The device MUST set VIRTIO_NET_ERROR for the command
> +VIRTIO_NET_CTRL_FF_GROUP_ADD if there are existing flow filters for the
> +supplied group \field{id} or for the supplied \field{priority}.
> +
> +The device MUST set VIRTIO_NET_ERROR for the command
> +VIRTIO_NET_CTRL_FF_GROUP_DEL if the group identified with \field{id}
> +does not exist in the device.
> +
> +The device MUST set VIRTIO_NET_ERROR for the command
> +VIRTIO_NET_CTRL_FF_GROUP_DEL if the group identified with \field{id}
> +has one or more flow filters present in the group.
> +
> +If there are active flow filters already added in the device, the device
> +MUST respond VIRTIO_NET_ERROR for the command
> +VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET.
> +
> +The device MUST respond VIRTIO_NET_ERROR for the command
> +VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET when \field{mode} is set to
> +VIRTIO_NET_FF_TRANSPORT_CVQ and \field{cvq_supports_ff_ops} is set to zero;
> +or when \field{mode} is set to VIRTIO_NET_FF_TRANSPORT_FFVQ and
> +\field{max_vqs} is zero.
> +
> +The device MUST fail the operation VIRTIO_NET_FF_OP_ADD if the
> +\field{match} contains duplicate \field{type}.
> +
> +The device MUST fail the operation VIRTIO_NET_FF_OP_DEL if the
> +requested flow filter of identifier \field{id} do not exist in the
> +the device.
> +
> +The device MUST fail the operation VIRTIO_NET_FF_OP_ADD if the
> +\field{vq_index} in the \field{dest} is outside of the range.
> +
> +When the flow filter forwards the packet to the \field{vq_index} and
> +if the receiveq is reset, the device MUST drop such packets.
> +
> +When the flow filter \field{action} is VIRTIO_NET_FF_ACTION_DROP,
> +the device MUST ignore fields of \field{struct virtio_net_ff_dest}.
> +
> +When the driver has added multiple flow filters with same \field{priority}
> +and for a packet if multiple flow filters MAY match such that it MAY result
> +in different \field{action} or different \field{dest}, the device
> +MAY apply any of the matching flow filters.
> +
> +The device MUST follow received packet processing ordering chain as following:
> +
> +The device SHOULD set \field{device_status} to DEVICE_NEEDS_RESET when
> +the driver has not set the flow filter transport mode to
> +VIRTIO_NET_FF_TRANSPORT_FFVQ and if the driver enables the flow filter
> +virtqueue.
> +
> +\begin{itemize}
> +\item Device configuration done using control virtqueue commands VIRTIO_NET_CTRL_RX,
> +   VIRTIO_NET_CTRL_MAC and VIRTIO_NET_CTRL_VLAN.
> +\item Flow filters programmed using flow filters functionality.
> +\item Device configuration done using VIRTIO_NET_CTRL_MQ_RSS_CONFIG command.
> +\end{itemize}
> +
> +When the device drops the packet due to the configuration done using the control
> +virtqueue commands VIRTIO_NET_CTRL_RX or VIRTIO_NET_CTRL_MAC or VIRTIO_NET_CTRL_VLAN,
> +the device MUST stop processing this packet for flow filters processing.
> +
> +When the device matches the flow filter for the packet and if the match is successful,
> +the filter processing chain MUST stop, i.e. next level of processing MUST not be done.
> +
> +When the device matches the flow filter for the packet and if no match entry is found
> +for the packet, the receive packet processing continues to next level, i.e. to apply
> +configuration done using VIRTIO_NET_CTRL_MQ_RSS_CONFIG command.
> +
> +The device MUST support enabling \field{max_vqs} number of flow filters
> +virtqueues after device initializaton phase if VIRTIO_F_RING_DYNAMIC

s/initializaton/initialization

Thanks!

> +feature is negotiated.
> +
> +When \field{max_vqs} is non zero, the device MUST report \field{start_vq_index},
> +such that it does not overlap with any other virtqueues indices.
> +
> +\drivernormative{\subparagraph}{Flow Filters}{Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filters}
> +
> +The driver MUST NOT change the flow filters transport mode using
> +VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET when the device has flow filters
> +added.
> +
> +The driver MUST NOT set transport mode of VIRTIO_NET_FF_TRANSPORT_CVQ
> +if \field{cvq_supports_ff_ops} is set to zero.
> +
> +The driver MUST NOT set transport mode of VIRTIO_NET_FF_TRANSPORT_FFVQ
> +if \field{max_vqs} is set to zero in the command response of
> +VIRTIO_NET_CTRL_FF_CAP_GET.
> +
> +The driver MUST NOT send any flow filters specific commands having class code
> +of VIRTIO_NET_CTRL_FF when VIRTIO_NET_F_FLOW_FILTER is not negotiated.
> +
> +The driver SHOULD NOT add multiple flow filters with same \field{priority}
> +in a flow filter group, with overlapping match values.
> +
> +The driver SHOULD use different priority for different flow filters
> +if multiple of the flow filters MAY match for a packet.
> +
> +The driver SHOULD set the \field{type} in \field{match_entries} as that of
> +the order appears in the packet.
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

