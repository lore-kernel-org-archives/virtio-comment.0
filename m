Return-Path: <virtio-comment-return-7927-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB83C00A8F
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 03:45:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B83012B020
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 03:45:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8146B98699F
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 03:45:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 683A3986990; Tue, 24 Oct 2023 03:45:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 587EC986991
	for <virtio-comment@lists.oasis-open.org>; Tue, 24 Oct 2023 03:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VuoXQ1R_1698119148;
Message-ID: <fb9bbd04-c01d-4266-bda2-b91d33490a30@linux.alibaba.com>
Date: Tue, 24 Oct 2023 11:45:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Satananda Burla <sburla@marvell.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <6d62175fc237e79c1a985c58eee303d5b214656b.1697014234.git.hengqi@linux.alibaba.com>
 <f96785f3-005b-4803-b483-eb50fea4a672@linux.alibaba.com>
 <PH0PR12MB5481D10B5D788695BCFBBA89DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <PH0PR12MB5481D10B5D788695BCFBBA89DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH RESEND v3] virtio-net: support the RSS
 context



在 2023/10/24 上午11:41, Parav Pandit 写道:
> Hi Heng,
>
>> From: Heng Qi <hengqi@linux.alibaba.com>
>> Sent: Tuesday, October 24, 2023 9:07 AM
>>
>>
>> 在 2023/10/12 下午3:47, Heng Qi 写道:
>>> Commit 84a1d9c48200 ("net: ethtool: extend RXNFC API to support RSS
>>> spreading of filter matches") adds support for RSS context as a
>>> destination for receive flow filters (see WIP work: https://lists.oasis-
>> open.org/archives/virtio-comment/202308/msg00194.html).
>>> An RSS context consists of configurable parameters specified by receive-side
>> scaling.
>>> Some use cases:
>>> 1. When users want some data flows to be steered to specific multiple rxqs,
>> they can set
>>>      receive flow filter rules for these data flows to an RSS context with desired
>> rxqs.
>>> 2. Traffic isolation. Used when users want the traffic of certain applications to
>> occupy
>>>      several queues without being distubed.
>>>
>>> How to set/configure an RSS context:
>>> Assuming no RSS context has been created before.
>>> 1. ethtool -X eth0 context new start 5 equal 8
>>>
>>> This command creates an RSS context with an id=1 for eth0, and fills
>>> in the indirection table with rxq indexes 5-8 circularly. The hash key
>>> and hash types reuse the default RSS configuration.
>>>
>>> Then, we can use 'ethtool -x eth0 context 1' to query the above configuration.
>>>
>>> 2. ethtool -X eth0 context new start 6 equal 7 \
>>>      hkey 8f:bf:dd:11:23:58:d2:8a:00:31:d0:32:a3:b5:1f:\
>>>
>>> 1f:e4:d1:fe:47:7f:64:42:fd:d0:61:16:b8:b0:f9:71:e8:2d:36:7f:18:dd:4d:c
>>> 8:f3
>>>
>>> This command creates an RSS context with an id=2 for eth0, and fills
>>> in the indirection table with rxq indexes 6-7 circularly. The hash key
>>> is 8f:bf:dd:11:23:58:d2:8a:00:31:d0\
>> :32:a3:b5:1f:1f:e4:d1:fe:47:7f:64:42:fd:d0:61:16:b8:b0:f9:71:e8:2d:36:7f:18:dd:4
>> d:c8:f3.
>>> Hash types reuse the default RSS configuration.
>>>
>>> 3. ethtool -N eth0 rx-flow-hash tcp4 sdfn context 1
>>>
>>> This command specifies the hash types for the RSS context whose id=1 on
>> eth0.
>>> Now this RSS context only has the hash key to reuse the default RSS
>> configuration.
>>> 4. ethtool -N eth0 flow-type udp4 src-ip 1.1.1.1 context 1
>>>
>>> This command configures a receive flow filter rule for eth0, and the
>>> data flow matching this rule will continue to select the final rxq
>>> according to the RSS context configuration with id=1.
>>>
>>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/178
>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
>>> Signed-off-by: Parav Pandit <parav@nvidia.com>
>>> Acked-by: Satananda Burla <sburla@marvell.com>
>> Hi Cornelia.
>>
>> Could you please open a vote for this work? This work has been long delayed.
>>
>> Thanks!
>>
> Can you please rebase the patch on top of Xuan's patch [1]?
>
> This is because, Xuan patch uses same feature bit 50.
> Please mention in the commit log as well for the dependency.
>
> Once you rebase and use different feature bit, it is due for vote.
>
> I will also rebase the flow filters on top of your series to avoid the collision on feature bit.

Ok, I'll rebase this work on top of Xuan's voting patch.

Thanks.

>
> [1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00047.html


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

