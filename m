Return-Path: <virtio-comment-return-7178-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336BFC001E0
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 11:10:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8113C42A68
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 11:10:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6C409986400
	for <virtio-comment@archiver.kernel.org>; Wed, 16 Aug 2023 11:10:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 599199863D7; Wed, 16 Aug 2023 11:10:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4979C9863D8;
	Wed, 16 Aug 2023 11:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R741e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0Vpvonu._1692184231;
Message-ID: <9bb0ef99-9a38-4db8-8027-a35634eb6b02@linux.alibaba.com>
Date: Wed, 16 Aug 2023 19:10:30 +0800
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
 <d8502ab9-69f2-4e7b-a013-94caf1c5b6b1@linux.alibaba.com>
 <PH0PR12MB5481F06EC56F02837B515F83DC15A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <PH0PR12MB5481F06EC56F02837B515F83DC15A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH requirements v4 5/7] net-features: Add n-tuple receive
 flow filters requirements



在 2023/8/16 下午6:31, Parav Pandit 写道:
>
>> From: Heng Qi <hengqi@linux.alibaba.com>
>> Sent: Wednesday, August 16, 2023 1:08 PM
>>>> From: Parav Pandit <parav@nvidia.com>
>>>> Sent: Tuesday, August 15, 2023 1:16 PM
>>>>
>>>> Add virtio net device requirements for receive flow filters.
>>>>
>>>> Signed-off-by: Parav Pandit <parav@nvidia.com>
>>>> ---
>>>> changelog:
>>>> v3->v4:
>>>> - Addressed comments from Satananda, Heng, David
>>>> - removed context specific wording, replaced with destination
>>>> - added group create/delete examples and updated requirements
>>>> - added optional support to use cvq for flor filter commands
>>>> - added example of transporting flow filter commands over cvq
>>>> - made group size to be 16-bit
>>>> - added concept of 0->n max flow filter entries based on max count
>>>> - added concept of 0->n max flow group based on max count
>>>> - split field bitmask to separate command from other filter
>>>> capabilities
>>>> - rewrote rx filter processing chain order with respect to existing
>>>>     filter commands and rss
>>>> - made flow_id flat across all groups
>>>> v1->v2:
>>>> - split setup and operations requirements
>>>> - added design goal
>>>> - worded requirements more precisely
>>>> v0->v1:
>>>> - fixed comments from Heng Li
>>>> - renamed receive flow steering to receive flow filters
>>>> - clarified byte offset in match criteria
>>>> ---
>>>>    net-workstream/features-1.4.md | 151
>>>> +++++++++++++++++++++++++++++++++
>>>>    1 file changed, 151 insertions(+)
>>>>
>>>> diff --git a/net-workstream/features-1.4.md
>>>> b/net-workstream/features-1.4.md index cb72442..78bb3d2 100644
>>>> --- a/net-workstream/features-1.4.md
>>>> +++ b/net-workstream/features-1.4.md
>>>> @@ -9,6 +9,7 @@ together is desired while updating the virtio net interface.
>>>>    1. Device counters visible to the driver  2. Low latency tx and rx
>>>> virtqueues for PCI transport  3. Virtqueue notification coalescing
>>>> re-arming support
>>>> +4  Virtqueue receive flow filters (RFF)
>>>>
>>>>    # 3. Requirements
>>>>    ## 3.1 Device counters
>>>> @@ -183,3 +184,153 @@ struct vnet_rx_completion {
>>>>       notifications until the driver rearms the notifications of the virtqueue.
>>>>    2. When the driver rearms the notification of the virtqueue, the device
>>>>       to notify again if notification coalescing conditions are met.
>>>> +
>>>> +## 3.4 Virtqueue receive flow filters (RFF) 0. Design goal:
>>>> +   To filter and/or to steer packet based on specific pattern match to a
>>>> +   specific destination to support application/networking stack driven
>> receive
>>>> +   processing.
>>>> +1. Two use cases are: to support Linux netdev set_rxnfc() for
>>>> ETHTOOL_SRXCLSRLINS
>>>> +   and to support netdev feature NETIF_F_NTUPLE aka ARFS.
>>>> +
>>>> +### 3.4.1 control path
>>>> +1. The number of flow filter operations/sec can range from 100k/sec
>>>> +to
>>>> 1M/sec
>>>> +   or even more. Hence flow filter operations must be done over a queueing
>>>> +   interface using one or more queues.
>>>> +2. The device should be able to expose one or more supported flow
>>>> +filter
>>>> queue
>>>> +   count and its start vq index to the driver.
>>>> +3. As each device may be operating for different performance
>> characteristic,
>>>> +   start vq index and count may be different for each device. Secondly, it is
>>>> +   inefficient for device to provide flow filters capabilities via a config space
>>>> +   region. Hence, the device should be able to share these attributes using
>>>> +   dma interface, instead of transport registers.
>>>> +4. Since flow filters are enabled much later in the driver life cycle, driver
>>>> +   will likely create these queues when flow filters are enabled.
>> Regarding this description, I want to say that ARFS will be enabled at runtime.
>> But ethtool RFF will be used at any time as long as the device is ready.
>>
> Yes, but ethool RFS is blocking callback in which slow task such as q creation can be done, only when one wants to add flows.
> ARFS is anyway controlled using set_features() callback.
>
>> Combining what was discussed in today's meeting, flow vqs and ctrlq are
>> mutually exclusive, so if flow vqs are supported, then ethtool RFF can use flow
>> vq:
>>
>> "
>> 0. Flow filter queues and flow filter commands on cvq are mutually exclusive.
>>
>> 1. When flow queues are supported, the driver should create flow filter queues
>> and use it.
>> (Since cvq is not enabled for flow filters, any flow filter command coming on cvq
>> must fail).
>>
>> 2. If driver wants to use flow filters over cvq, driver must explicitly enable flow
>> filters on cvq via a command, when it is enabled on the cvq driver cannot use
>> flow filter queues.
>> This eliminates any synchronization needed by the device among different types
>> of queues.
>> "
>>
> Ack.
>
>> Well the "likely create these queues when flow filters are enabled"
>> described here is confusing.
>> Because if ethtool RFF is used, we need to create a flow vq in the probe stage,
>> right?
>>
> Current spec wording limits one to create queues before DRIVER_OK.
> But with introduction of _RESET bit one can create an empty queue and disable it (reset it! What a grand name).
>
> And re-enable it during ethtool callbacks.
> This would be workaround to dynamically create the queue.

Yes, this is workaround, we can just set the number of flow vqs for the 
device, but not allocate resources nor enable.
But this is not exhaustive, because xdp may also require dynamic q 
creation/destruction.

>   
>> There are several other reasons:
>> 1. The behavior of dynamically creating flow vq will break the current virtio
>> spec.
>>      Please see the "Device Initialization" chapter. ctrlq, as a configuration queue
>>      similar to flow vq, is also created in the probe phase. So if we support the
>> "dynamically creating",
>>      we need to update the spec.
>>
>> 2. Flow vq is similar to transmit q, and does not need to fill descriptors in
>> advance,
>>      so the consumption of resources is relatively small.
>>
> Only the queue descriptors memory is consumed, which is not a lot.
> But concept of creating resource without consuming is just bad.
> We learnt the lesson from mlx5 driver that dynamic creation is efficient.
> Many part of Linux kernel also moving in this direction, all the way upto dynamically individual msix vector.

Ok. I got it.

>
> So we should strive to enable them dynamically and improve the virtio spec.
>
> It should an orthogonal feature, sadly how the RING_RESET feature is done. :(

RING_RESET is performed without changing the number of queues. But what 
you said above is a workaround.

>   
>> 3. Dynamic creation of virtqueue seems to be a new thread of virtio spec, and it
>> should also be
>>      applicable to rxqs and txqs. We can temporarily support creating flow vq in
>> the probe stage,
>>      and subsequent dynamic creation can be an extension.
>>
>> So, should we create the flow vqs at the initial stage of the driver probe?
> One option is to follow the above workaround.
> Second option is to add feature bit to feature bit to indicate dynamic Q creation.

I'm leaning towards the second option, which makes the work orthogonal 
and also works in the case of XDP.

Thanks!



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

