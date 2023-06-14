Return-Path: <virtio-comment-return-6339-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFB2EB64D8
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 03:43:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EE3C4C6107
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 03:43:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D385998668E
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 03:43:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C6FF6986656; Wed, 14 Jun 2023 03:43:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AC66598665C;
	Wed, 14 Jun 2023 03:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Vl4iTW4_1686714187;
Message-ID: <7536eeda-ff4e-633a-89bf-aad94aca317a@linux.alibaba.com>
Date: Wed, 14 Jun 2023 11:43:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Shahaf Shuler <shahafs@nvidia.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-6-parav@nvidia.com>
 <ae7b4a7f-dc9b-3466-1a46-8535f288856a@linux.alibaba.com>
 <PH0PR12MB548142D52698EFD9E101D555DC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2e035358-d16e-92ae-e4c3-92d141787876@linux.alibaba.com>
 <PH0PR12MB5481978B30D222EE4E3254FBDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <PH0PR12MB5481978B30D222EE4E3254FBDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio] [PATCH requirements 5/7] net-features: Add n-tuple
 receive flow steering requirements



在 2023/6/13 下午8:24, Parav Pandit 写道:
>
>> From: Heng Qi <hengqi@linux.alibaba.com>
>> Sent: Tuesday, June 13, 2023 1:04 AM
>>
>>
>> 在 2023/6/13 下午12:16, Parav Pandit 写道:
>>>> From: Heng Qi <hengqi@linux.alibaba.com>
>>>> Sent: Monday, June 12, 2023 10:57 PM
>>> [..]
>>>>> +4. The match criteria may optionally also include specific packet
>>>>> +data offset,
>>>> Is this the offset of the packet payload (not including the packet
>>>> header)? If yes, what might be the usage scenarios?
>>>>
>>> Some packet header fields may not be defined initially by us.
>>> For example some protocol FOO type which has some header after UDP
>> header.
>>> And wants to filter and steer to a specific RQ.
>> Ok, I got it.
>>
>>> A virtio may not have defined such protocol at the beginning. So a generic
>> extension allows to steer packet.
>>> At that point line between header and data is blurry. :)
>> Then I think it's just an *offset* from the start of the packet so we can use this
>> capability for the packet header as well.
>>
> Yes, will change it. "packet data" was misleading. It is just the packet offset.
>   
>>>>> +   length, and matching pattern, which may not be defined in the
>>>>> + standard
>>>> RFC.
>>>>> +5. Action includes (a) dropping or (b) forwarding the packet.
>>>>> +6. Destination location is a receive virtqueue index or rss context.
>>>>> +7. The device should process RFS rules before RSS rules, i.e., when there is
>> a
>>>>> +   miss on the RFS rule RSS rule applies.
>>>>> +8. The device should be able to add/remove these rules at a rate of 100K
>>>>> +   rules/sec.
>>>> Why do we need to add this limit for the device please? I think that
>>>> different devices may handle ctrq at different speeds.
>>>>
>>> ARFS rules insertion is fast and tcp streams should be able to converge quicker
>> on the desired cpu.
>>> So rule insertion should be fast enough.
>>> Many of the device can/may be able to do this as some semi-fast path
>> operation unlike CVQ which is typically a device level control operation, often
>> done as slow process.
>>
>> We need to consider ARFS for receive flow filters, but receive flow filters are
>> more infrastructure, do we need to offer a sub-feature to distinguish whether a
>> device supports this dedicated queue or not.
>> This becomes easier for users who only use receive flow filters without ARFS
>> enabled.
>> At this point, ARFS and receive flow filters become orthogonal.
>>
> If it’s a "flowvq" dedicated queue device both the requirements are addressed.
> Device can choose to implement in its preferred way.

I think this is a migration issue:
Devices A and B each offser the VIRTIO_NET_F_RECEIVE_FLOW_FILTER (this 
is a temporary name) feature.
And device A implements flowvq, device B does not implement flowvq, they 
are both using receive flow filters but ARFS is disabled.
The migration should fail at this time. Does this meet user expectations?

Or do we warn in the spec that using flow vq might cause the migration 
issue?

Thanks!

>
>>> So driver-device interface to be able to scale up to low latency and high
>> throughput flow insert/delete ops.
>>
>> Ok.
>>
>>> It is ok one device may choose to not support such high rate, but interface
>> definition wise I imagine to be on its own dedicated queue.
>>>>> +9. If multiple rules are programmed which has overlapping attributes for a
>>>>> +   received packet, the driver to define the location/priority of the rule.
>>>>> +10. The driver should be able to query flow steering table entries
>>>> programmed in
>>>>> +    the device by the flow id.
>>>> Combining points 9 and 10, can I deduce that the attributes of a flow
>>>> rule include identifier (id), position (index of the rule entry) and priority?
>>> Yes, I also think that way.
>>>
>>>> According to point 11, the driver needs to provide a unique id, if
>>>> the location and priority are not provided, they should have predefined
>> default values.
>>> Yes.
>>> I am not fully sure of it as it brings some uncertainty in behavior.
>>> So having second thought as driver to always provide it.
>> Yes, and this point is specific, then we can continue to confirm it in the future
>> spec version.
>>
> Ok. I will revise it in v1.
>
>>>>> +11. The driver should be able to add the entry for attributes (a) match
>>>>> +    criteria, (b) action, (c) destination and (d) assign a unique id of 32 bits.
>>>>> +12. The driver should be able to delete the steering rule entry via
>>>>> +a unique
>>>> id.
>>>>> +13. The driver should be able to add and delete the steering rules in out of
>>>>> +    order manner without depending on previous commands.
>>>>> +14. A group member device should be able to query the attributes of
>>>>> +the
>>>> flow
>>>>> +    steering that device supports.
>>>> Does a group member driver support insertion rules?  The group owner
>>>> driver and a group member driver should have the ability to
>>>> add/remove rules for themselves.
>>>>
>>> Yes, Group owner adds rule for the self, not on behalf.
>>> Same as group member.
>>> No difference between them as they operate on self device.
>> Ok.
>>
>>> In future, a group owner may want to steer the packet towards a group
>> member, like eswitch.
>>
>> Yes.
>> And what I want to say is that our cloud architecture is similar to two-layer
>> virtualization, but we only have one layer of eswitch, so we need VF id to let
>> eswitch provide simple flow steering for the second layer of virtualization, and
>> do not need complicated eswitch.
>> This is the purpose of carrying VF id, but now we can not consider this (VF id) in
>> the feature of receive flow filters, so as not to hinder the progress of this
>> feature.
>>
> Ok. Lets keep this in notes and mind to have the abstraction and don’t jump to bake vf id in the spec in the initial version.


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

