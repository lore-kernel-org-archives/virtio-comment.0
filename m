Return-Path: <virtio-comment-return-6091-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E08C7EE2A
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 04:39:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4A0402AF8C
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 04:39:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 324059867E4
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 04:39:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1ACBD983E8D; Fri,  2 Jun 2023 04:39:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 076AD9867DB;
	Fri,  2 Jun 2023 04:39:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Vk8Kwqm_1685680788;
Message-ID: <9afe0f6a-1a15-a200-b96d-385d3f69a375@linux.alibaba.com>
Date: Fri, 2 Jun 2023 12:39:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Shahaf Shuler <shahafs@nvidia.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-6-parav@nvidia.com>
 <a471e048-b492-eb04-608d-4312da4d0b09@linux.alibaba.com>
 <PH0PR12MB5481647B8D459F5594756C93DC4EA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <PH0PR12MB5481647B8D459F5594756C93DC4EA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio] RE: [virtio-comment] [PATCH requirements 5/7]
 net-features: Add n-tuple receive flow steering requirements



在 2023/6/2 上午11:51, Parav Pandit 写道:
> Hi Heng,
>
>> From: Heng Qi <hengqi@linux.alibaba.com>
>> Sent: Thursday, June 1, 2023 11:35 PM
>>
>> Hi, Parav.
>>
>> I also did some work on this feature, and I think it would be very useful if we
>> could work on this interface design and VirtIO Spec together!
>>
> Sure, happy to bring this alive together.
> More below.
>
>>> +
>>> +## 3.4 Receive virtqueue n-tuple flow steering (RFS)
>> I think this abbreviation can be replaced with eg Receive virtqueue n-tuple flow
>> director, RFD? or something else?
> One hw vendor product name has director in it, so will probably want to stay away picking such TM.
>
> May be we can just say flow filters.
> A filter may have an action and a destination.
> So it can be generic enough.

Yes, it's a good generic name.

>
>
>> This allows us to distinguish more clearly from (Accelerated) Recieve Flow
>> Steering, (A)RFS.
>>
> The idea was for ARFS and RFS both to reuse the same underlying infra, just the OS hooks are different. (stack vs user ethtool respectively).
>   

Yes, so I want it to have a distinguishing name from RFS, 'recieve flow 
filters' below as the name of the underlying infra is enough.:)

>> ARFS can *automatically* issue RFS rules based on n-tuple rules, and we can
>> still issue n-tuple rules *manually*.
>> So RFD seems more reasonable than RFS abbreviation, what do you think?:)
>>
> "Receive flow filters" is probably more neutral name. :)
>
>>> +1. The driver should be able to define a receive packet match criteria, an
>>> +   action and a destination for a packet. For example, an ipv4 packet with a
>>> +   multicast address to be steered to the receive vq 0. The second example is
>>> +   ipv4, tcp packet matching a specified IP address and tcp port tuple to
>>> +   steered to receive vq 10.
>>> +2. The match criteria should include exact tuple fields well-defined such as
>> mac
>>> +   address, IP addresses, tcp/udp ports, etc.
>>> +3. The match criteria should also include the field mask.
>> The mask structure can be considered to reuse the same structure as the key
>> structure.
> Yes, mask will probably have the bit mask definition.
>
>>> +4. The match criteria may optionally also include specific packet data offset,
>>> +   length, and matching pattern, which may not be defined in the standard
>> RFC.
>>> +5. Action includes (a) dropping or (b) forwarding the packet.
>>> +6. Destination location is a receive virtqueue index or rss context.
>> We may have an additional requirement internally, such as specifying the queue
>> id of a certain VF, but we are still aligning this requirement internally, and it may
>> be more reasonable to implement the work involving device group based on
>> admin vq.
>>
> The switch side APIs bit more complex.
> We were first considering using the flow filters/steering for the guest driver and extend further for switching side.

Yes, but it's not that hard to just extend a VF id. In general, we will 
get back to you next week after aligning because of any difficulties we 
need this.:)

>   
>>> +7. The device should process RFS rules before RSS rules, i.e., when there is a
>>> +   miss on the RFS rule RSS rule applies.
>>> +8. The device should be able to add/remove these rules at a rate of 100K
>>> +   rules/sec.
>>> +9. If multiple rules are programmed which has overlapping attributes for a
>>> +   received packet, the driver to define the location/priority of the rule.
>> Considering the capabilities similar to some current tools such as ethtool, if it is
>> a simple implementation, the first match principle can be applied.
>>
> Yes, this likely needs refinement, I just wanted to get the seed for priority to be afloat when I wrote.
> I am thinking of defining the priority at interface level, and driver can choose first match in the programming model based on the use.
>

Yes, in general we really need priorities, and then maybe a matching 
mode field to let the driver choose which matching principle to use.

>>> +10. The driver should be able to query flow steering table entries
>> programmed in
>>> +    the device by the flow id.
>>> +11. The driver should be able to add the entry for attributes (a) match
>>> +    criteria, (b) action, (c) destination and (d) assign a unique id of 32 bits.
>>> +12. The driver should be able to delete the steering rule entry via a unique
>> id.
>>> +13. The driver should be able to add and delete the steering rules in out of
>>> +    order manner without depending on previous commands.
>>> +14. A group member device should be able to query the attributes of the
>> flow
>>> +    steering that device supports.
>>> +15. The driver and group owner driver should be able to query supported
>> device
>>> +    limits for the steering entries.
>> Do we want to support some user-defined fields, so that manufacturers can
>> customize the interpretation of some fields.
>>
> Yes, we can phase out the common case of ipv{4,6} and {udp,tcp} as first phase and more customs field as second phase.
> Those use define fields can be useful in custom filters.

Yes, for example some simple tunnel matching is possible, but the full, 
exact tunnel matching is probably not the first phase of this new feature.


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

