Return-Path: <virtio-comment-return-7172-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76964C04A94
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 07:38:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9F6D9120D4A
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 07:38:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 877D09863FA
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 07:38:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 70267983EB2; Wed, 16 Aug 2023 07:38:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F82E9863D1;
	Wed, 16 Aug 2023 07:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0Vpv4IB0_1692171508;
Message-ID: <d8502ab9-69f2-4e7b-a013-94caf1c5b6b1@linux.alibaba.com>
Date: Wed, 16 Aug 2023 15:38:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "david.edmondson@oracle.com" <david.edmondson@oracle.com>,
 "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 "sburla@marvell.com" <sburla@marvell.com>
Cc: Shahaf Shuler <shahafs@nvidia.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-6-parav@nvidia.com>
 <PH0PR12MB54819624183D0A74599C14A1DC15A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <PH0PR12MB54819624183D0A74599C14A1DC15A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH requirements v4 5/7] net-features: Add n-tuple receive
 flow filters requirements



在 2023/8/16 下午2:27, Parav Pandit 写道:
> Comments below from today's bi-weekly meeting to address in v5.

Thanks Parav!

>
>
>> From: Parav Pandit <parav@nvidia.com>
>> Sent: Tuesday, August 15, 2023 1:16 PM
>>
>> Add virtio net device requirements for receive flow filters.
>>
>> Signed-off-by: Parav Pandit <parav@nvidia.com>
>> ---
>> changelog:
>> v3->v4:
>> - Addressed comments from Satananda, Heng, David
>> - removed context specific wording, replaced with destination
>> - added group create/delete examples and updated requirements
>> - added optional support to use cvq for flor filter commands
>> - added example of transporting flow filter commands over cvq
>> - made group size to be 16-bit
>> - added concept of 0->n max flow filter entries based on max count
>> - added concept of 0->n max flow group based on max count
>> - split field bitmask to separate command from other filter capabilities
>> - rewrote rx filter processing chain order with respect to existing
>>    filter commands and rss
>> - made flow_id flat across all groups
>> v1->v2:
>> - split setup and operations requirements
>> - added design goal
>> - worded requirements more precisely
>> v0->v1:
>> - fixed comments from Heng Li
>> - renamed receive flow steering to receive flow filters
>> - clarified byte offset in match criteria
>> ---
>>   net-workstream/features-1.4.md | 151
>> +++++++++++++++++++++++++++++++++
>>   1 file changed, 151 insertions(+)
>>
>> diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
>> index cb72442..78bb3d2 100644
>> --- a/net-workstream/features-1.4.md
>> +++ b/net-workstream/features-1.4.md
>> @@ -9,6 +9,7 @@ together is desired while updating the virtio net interface.
>>   1. Device counters visible to the driver  2. Low latency tx and rx virtqueues for
>> PCI transport  3. Virtqueue notification coalescing re-arming support
>> +4  Virtqueue receive flow filters (RFF)
>>
>>   # 3. Requirements
>>   ## 3.1 Device counters
>> @@ -183,3 +184,153 @@ struct vnet_rx_completion {
>>      notifications until the driver rearms the notifications of the virtqueue.
>>   2. When the driver rearms the notification of the virtqueue, the device
>>      to notify again if notification coalescing conditions are met.
>> +
>> +## 3.4 Virtqueue receive flow filters (RFF) 0. Design goal:
>> +   To filter and/or to steer packet based on specific pattern match to a
>> +   specific destination to support application/networking stack driven receive
>> +   processing.
>> +1. Two use cases are: to support Linux netdev set_rxnfc() for
>> ETHTOOL_SRXCLSRLINS
>> +   and to support netdev feature NETIF_F_NTUPLE aka ARFS.
>> +
>> +### 3.4.1 control path
>> +1. The number of flow filter operations/sec can range from 100k/sec to
>> 1M/sec
>> +   or even more. Hence flow filter operations must be done over a queueing
>> +   interface using one or more queues.
>> +2. The device should be able to expose one or more supported flow filter
>> queue
>> +   count and its start vq index to the driver.
>> +3. As each device may be operating for different performance characteristic,
>> +   start vq index and count may be different for each device. Secondly, it is
>> +   inefficient for device to provide flow filters capabilities via a config space
>> +   region. Hence, the device should be able to share these attributes using
>> +   dma interface, instead of transport registers.
>> +4. Since flow filters are enabled much later in the driver life cycle, driver
>> +   will likely create these queues when flow filters are enabled.

Regarding this description, I want to say that ARFS will be enabled at 
runtime.
But ethtool RFF will be used at any time as long as the device is ready.

Combining what was discussed in today's meeting, flow vqs and ctrlq are 
mutually exclusive,
so if flow vqs are supported, then ethtool RFF can use flow vq:

"
0. Flow filter queues and flow filter commands on cvq are mutually 
exclusive.

1. When flow queues are supported, the driver should create flow filter 
queues and use it.
(Since cvq is not enabled for flow filters, any flow filter command 
coming on cvq must fail).

2. If driver wants to use flow filters over cvq, driver must explicitly 
enable flow filters on cvq via a command, when it is enabled on the cvq 
driver cannot use flow filter queues.
This eliminates any synchronization needed by the device among different 
types of queues.
"

Well the "likely create these queues when flow filters are enabled" 
described here is confusing.
Because if ethtool RFF is used, we need to create a flow vq in the probe 
stage, right?

There are several other reasons:
1. The behavior of dynamically creating flow vq will break the current 
virtio spec.
    Please see the "Device Initialization" chapter. ctrlq, as a 
configuration queue
    similar to flow vq, is also created in the probe phase. So if we 
support the "dynamically creating",
    we need to update the spec.

2. Flow vq is similar to transmit q, and does not need to fill 
descriptors in advance,
    so the consumption of resources is relatively small.

3. Dynamic creation of virtqueue seems to be a new thread of virtio 
spec, and it should also be
    applicable to rxqs and txqs. We can temporarily support creating 
flow vq in the probe stage,
    and subsequent dynamic creation can be an extension.

So, should we create the flow vqs at the initial stage of the driver probe?

Thanks!


>> +5. Flow filter operations are often accelerated by device in a hardware. Ability
>> +   to handle them on a queue other than control vq is desired. This achieves
>> near
>> +   zero modifications to existing implementations to add new operations on
>> new
>> +   purpose built queues (similar to transmit and receive queue).
>> +   Therefore, when flow filter queues are supported, it is strongly
>> recommended
>> +   to use it, when flow filter queues are not supported, if the device support
>> +   it using cvq, driver should be able to use over cvq.
> Rephase is like below.
> 0. Flow filter queues and flow filter commands on cvq are mutually exclusive.
>
> 1. When flow queues are supported, driver should create flow filter queues and use it.
> (Since cvq is not enabled for flow filters, any flow filter command coming on cvq must fail).
>
> 2. If driver wants to use flow filters over cvq, driver must explicitly enable flow filters on cvq via a command, when it is enabled on the cvq driver cannot use flow filter queues.
> This eliminates any synchronization needed by the device among different types of queues.
>
>
>> +6. The filter masks are optional; the device should be able to expose if it
>> +   support filter masks.
>> +7. The driver may want to have priority among group of flow entries; to
>> facilitate
>> +   the device support grouping flow filter entries by a notion of a flow group.
>> +   Each flow group defines priority in processing flow.
>> +8. The driver and group owner driver should be able to query supported
>> device
>> +   limits for the receive flow filters.
>> +
>> +### 3.4.2 flow operations path
>> +1. The driver should be able to define a receive packet match criteria, an
>> +   action and a destination for a packet. For example, an ipv4 packet with a
>> +   multicast address to be steered to the receive vq 0. The second example is
>> +   ipv4, tcp packet matching a specified IP address and tcp port tuple to
>> +   be steered to receive vq 10.
>> +2. The match criteria should include exact tuple fields well-defined such as
>> mac
>> +   address, IP addresses, tcp/udp ports, etc.
>> +3. The match criteria should also optionally include the field mask.
>> +5. Action includes (a) dropping or (b) forwarding the packet.
>> +6. Destination is a receive virtqueue index.
>> +7. Receive packet processing chain is:
>> +   a. filters programmed using cvq commands VIRTIO_NET_CTRL_RX,
>> +      VIRTIO_NET_CTRL_MAC and VIRTIO_NET_CTRL_VLAN.
>> +   b. filters programmed using RFF functiionality.
>> +   c. filters programmed using RSS VIRTIO_NET_CTRL_MQ_RSS_CONFIG
>> command.
>> +   Whichever filtering and steering functionality is enabled, they are applied
>> +   in the above order.
>> +9. If multiple entries are programmed which has overlapping filtering attributes
>> +   for a received packet, the driver to define the location/priority of the entry.
>> +10. The filter entries are usually short in size of few tens of bytes,
>> +   for example IPv6 + TCP tuple would be 36 bytes, and ops/sec rate is
>> +   high, hence supplying fields inside the queue descriptor is preferred for
>> +   up to a certain fixed size, say 96 bytes.
>> +11. A flow filter entry consists of (a) match criteria, (b) action,
>> +    (c) destination and (d) a unique 32 bit flow id, all supplied by the
>> +    driver.
>> +12. The driver should be able to query and delete flow filter entry by the
>> +    the device by the flow id.
>> +
>> +### 3.4.3 interface example
>> +
>> +1. Flow filter capabilities to query using a DMA interface such as cvq
>> +using two different commands.
>> +
>> +```
>> +/* command 1 */
>> +struct flow_filter_capabilities {
>> +	le16 start_vq_index;
>> +	le16 num_flow_filter_vqs;
>> +	le16 max_flow_groups;
>> +	le16 max_group_priorities; /* max priorities of the group */
>> +	le32 max_flow_filters_per_group;
>> +	le32 max_flow_filters; /* max flow_id in add/del
>> +				* is equal = max_flow_filters - 1.
>> +				*/
>> +	u8 max_priorities_per_group;
>> +};
>> +
>> +/* command 2 */
>> +struct flow_filter_fields_support_mask {
>> +	le64 supported_packet_field_mask_bmap[1];
>> +};
> Explain this bitmap that it indicates well known packet field such as src mac, dest ip, etc.
>
> Also expose it on AQ command so that live migration flow/provision flow can decide which device to use.
>
>> +
>> +```
>> +
>> +2. Group add/delete cvq commands:
>> +```
>> +
>> +struct virtio_net_rff_group_add {
>> +	le16 priority;
>> +	le16 group_id;
>> +};
>> +
>> +
>> +struct virtio_net_rff_group_delete {
>> +	le16 group_id;
>> +
>> +```
>> +
>> +3. Flow filter entry add/modify, delete over flow vq:
>> +
>> +```
>> +struct virtio_net_rff_add_modify {
>> +	u8 flow_op;
>> +	u8 padding;
>> +	u16 group_id;
>> +	le32 flow_id;
>> +	struct match_criteria mc;
>> +	struct destination dest;
>> +	struct action action;
>> +
>> +	struct match_criteria mask;	/* optional */
>> +};
>> +
>> +struct virtio_net_rff_delete {
>> +	u8 flow_op;
>> +	u8 padding[3];
>> +	le32 flow_id;
>> +};
>> +
>> +```
>> +
>> +4. Flow filter commands over cvq:
>> +
>> +```
>> +
>> +struct virtio_net_rff_cmd {
>> +	u8 class; /* RFF class */
>> +	u8 commands; /* RFF cmd = A */
>> +	u8 command-specific-data[]; /* contains struct
>> virtio_net_rff_add_modify or
>> +				     * struct virtio_net_rff_delete
>> +                                     */ };
>> +
>> +```
>> +
>> +### 3.4.4 For incremental future
>> +a. Driver should be able to specify a specific packet byte offset, number
>> +   of bytes and mask as math criteria.
>> +b. Support RSS context, in addition to a specific RQ.
>> +c. If/when virtio switch object is implemented, support ingress/egress flow
>> +   filters at the switch port level.
>> --
>> 2.26.2


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

