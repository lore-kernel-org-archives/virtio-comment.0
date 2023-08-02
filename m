Return-Path: <virtio-comment-return-6975-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8922BC001DF
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 15:25:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CA97761266
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 15:25:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A4CC8986699
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 15:25:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9130898664C; Wed,  2 Aug 2023 15:25:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7DCF8986654;
	Wed,  2 Aug 2023 15:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R611e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VovWJRW_1690989925;
Date: Wed, 2 Aug 2023 23:25:25 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Message-ID: <20230802152525.GA13690@h68b04307.sqa.eu95>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724033421.249893-6-parav@nvidia.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [virtio-comment] Re: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements

On Mon, Jul 24, 2023 at 06:34:19AM +0300, Parav Pandit wrote:
> Add virtio net device requirements for receive flow filters.
> 
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v1->v2:
> - split setup and operations requirements
> - added design goal
> - worded requirements more precisely
> v0->v1:
> - fixed comments from Heng Li
> - renamed receive flow steering to receive flow filters
> - clarified byte offset in match criteria
> ---
>  net-workstream/features-1.4.md | 105 +++++++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
> index 27a7886..d228462 100644
> --- a/net-workstream/features-1.4.md
> +++ b/net-workstream/features-1.4.md
> @@ -9,6 +9,7 @@ together is desired while updating the virtio net interface.
>  1. Device counters visible to the driver
>  2. Low latency tx and rx virtqueues for PCI transport
>  3. Virtqueue notification coalescing re-arming support
> +4  Virtqueue receive flow filters (RFF)
>  
>  # 3. Requirements
>  ## 3.1 Device counters
> @@ -175,3 +176,107 @@ struct vnet_rx_completion {
>     notifications until the driver rearms the notifications of the virtqueue.
>  2. When the driver rearms the notification of the virtqueue, the device
>     to notify again if notification coalescing conditions are met.
> +
> +## 3.4 Virtqueue receive flow filters (RFF)
> +0. Design goal:
> +   To filter and/or to steer packet based on specific pattern match to a
> +   specific context to support application/networking stack driven receive
> +   processing.
> +1. Two use cases are: to support Linux netdev set_rxnfc() for ETHTOOL_SRXCLSRLINS
> +   and to support netdev feature NETIF_F_NTUPLE aka ARFS.

Hi, Parav. Sorry for not responding to this in time due to other things recently.

Yes, RFF has two scenarios, set_rxnfc and ARFS, both of which will affect the packet steering on the device side.
I think manually configured rules should have higher priority than ARFS automatic configuration.
This behavior is intuitive and consistent with other drivers. Therefore, the processing chain on a rx packet is:
{mac,vlan,promisc rx filters} -> {set_rxnfc} -> {ARFS} -> {rss/hash config}.

There are also priorities within set_rxnfc and ARFS respectively.
1. For set_rxnfc, which has the exact match and the mask match. Exact matches should have higher priority.
Suppose there are two rules,
	rule1: {"tcpv4", "src-ip: 1.1.1.1"} -> rxq1
	rule2: {"tcpv4", "src-ip: 1.1.1.1", "dst-port: 8989"} -> rxq2
.For recieved rx packets whose src-ip is 1.1.1.1, should match rule2 instead of rule1.

The rules of set_rxnfc come from manual configuration, the number of these rules is small and
we may not need group grouping for this. And ctrlq can meet the configuration rate, 

2. For ARFS, which only has the exact match.
For ARFS, since there is only one matching rule for a certain flow, so there is no need for group?
We may need different types of tables, such as UDPv4 flow table, TCPv4 flow table to speed up the lookup for differect flow types.
Besides, the high rate and large number of configuration rules means that we need flow vq.

Therefore, although set_rxnfc and ARFS share a set of infrastructure, there are still some differences,
such as configuration rate and quantity. So do we need add two features (VIRTIO_NET_F_RXNFC and VIRTIO_NET_F_ARFS)
for set_rxnfc and ARFS respectively, and ARFS can choose flow vq?
In this way, is it more conducive to advancing the work of RFF (such as accelerating the advancement of set_rxnfc)?

> +
> +### 3.4.1 control path
> +1. The number of flow filter operations/sec can range from 100k/sec to 1M/sec
> +   or even more. Hence flow filter operations must be done over a queueing
> +   interface using one or more queues.

This is only for ARFS, for devices that only want to support set_rxnfc,
they don't provide VIRTIO_NET_F_ARFS and consider implementing flow vq.

> +2. The device should be able to expose one or more supported flow filter queue
> +   count and its start vq index to the driver.
> +3. As each device may be operating for different performance characteristic,
> +   start vq index and count may be different for each device. Secondly, it is
> +   inefficient for device to provide flow filters capabilities via a config space
> +   region. Hence, the device should be able to share these attributes using
> +   dma interface, instead of transport registers.
> +4. Since flow filters are enabled much later in the driver life cycle, driver
> +   will likely create these queues when flow filters are enabled.

I understand that the number of flow vqs is not reflected in
max_virtqueue_pairs. And a new vq is created at runtime, is this
supported in the existing virtio spec?

> +5. Flow filter operations are often accelerated by device in a hardware. Ability
> +   to handle them on a queue other than control vq is desired. This achieves near
> +   zero modifications to existing implementations to add new operations on new
> +   purpose built queues (similar to transmit and receive queue).
> +6. The filter masks are optional; the device should be able to expose if it
> +   support filter masks.
> +7. The driver may want to have priority among group of flow entries; to facilitate
> +   the device support grouping flow filter entries by a notion of a group. Each
> +   group defines priority in processing flow.
> +8. The driver and group owner driver should be able to query supported device
> +   limits for the flow filter entries.
> +
> +### 3.4.2 flow operations path
> +1. The driver should be able to define a receive packet match criteria, an
> +   action and a destination for a packet.

When the user does not specify a destination when configuring a rule, do
we need a default destination?

> For example, an ipv4 packet with a
> +   multicast address to be steered to the receive vq 0. The second example is
> +   ipv4, tcp packet matching a specified IP address and tcp port tuple to
> +   be steered to receive vq 10.
> +2. The match criteria should include exact tuple fields well-defined such as mac
> +   address, IP addresses, tcp/udp ports, etc.
> +3. The match criteria should also optionally include the field mask.
> +4. The match criteria may optionally also include specific packet byte offset
> +   pattern, match length, mask instead of RFC defined fields.
> +   length, and matching pattern, which may not be defined in the standard RFC.

Is there a description error here?

> +5. Action includes (a) dropping or (b) forwarding the packet.
> +6. Destination is a receive virtqueue index.

Since the concept of RSS context does not yet exist in the virtio spec.
Did we say that we also support carrying RSS context information when
negotiating the RFF feature? For example, RSS context configuration
commands and structures, etc.

Or support RSS context functionality as a separate feature in another thread?

A related point to consider is that when a user inserts a rule with an
rss context, the RSS context cannot be deleted, otherwise the device
will cause undefined behavior.

Thanks!

> +7. The device should process packet receive filters programmed via control vq
> +   commands first in the processing chain.
> +7. The device should process RFF entries before RSS configuration, i.e.,
> +   when there is a miss on the RFF entry, RSS configuration applies if it exists.
> +8. To summarize the processing chain on a rx packet is:
> +   {mac,vlan,promisc rx filters} -> {receive flow filters} -> {rss/hash config}.
> +9. If multiple entries are programmed which has overlapping attributes for a
> +   received packet, the driver to define the location/priority of the entry.
> +10. The filter entries are usually short in size of few tens of bytes,
> +   for example IPv6 + TCP tuple would be 36 bytes, and ops/sec rate is
> +   high, hence supplying fields inside the queue descriptor is preferred for
> +   up to a certain fixed size, say 56 bytes.
> +11. A flow filter entry consists of (a) match criteria, (b) action,
> +    (c) destination and (d) a unique 32 bit flow id, all supplied by the
> +    driver.
> +12. The driver should be able to query and delete flow filter entry by the
> +    the device by the flow id.
> +
> +### 3.4.3 interface example
> +
> +Flow filter capabilities to query using a DMA interface:
> +
> +```
> +struct flow_filter_capabilities {
> +	u8 flow_groups;
> +	u16 num_flow_filter_vqs;
> +	u16 start_vq_index;
> +	u32 max_flow_filters_per_group;
> +	u32 max_flow_filters;
> +	u64 supported_packet_field_mask_bmap[4];
> +};
> +
> +
> +```
> +
> +1. Flow filter entry add/modify, delete:
> +
> +struct virtio_net_rff_add_modify {
> +	u8 flow_op;
> +	u8 group_id;
> +	u8 padding[2];
> +	le32 flow_id;
> +	struct match_criteria mc;
> +	struct destination dest;
> +	struct action action;
> +
> +	struct match_criteria mask;	/* optional */
> +};
> +
> +2. Flow filter entry delete:
> +struct virtio_net_rff_delete {
> +	u8 flow_op;
> +	u8 group_id;
> +	u8 padding[2];
> +	le32 flow_id;
> +};
> -- 
> 2.26.2

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

