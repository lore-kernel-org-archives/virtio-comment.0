Return-Path: <virtio-comment-return-6313-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7556CC7EE2E
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 02:28:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A505A2AC54
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 02:28:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8D84098653E
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 02:28:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7B380986422; Tue, 13 Jun 2023 02:28:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6909598653D;
	Tue, 13 Jun 2023 02:28:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Vl01pA1_1686623286;
Message-ID: <0f2ad536-a7e7-04f7-31f8-81c1c2bfaa16@linux.alibaba.com>
Date: Tue, 13 Jun 2023 10:28:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: Shahaf Shuler <shahafs@nvidia.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-6-parav@nvidia.com>
 <a471e048-b492-eb04-608d-4312da4d0b09@linux.alibaba.com>
 <PH0PR12MB5481647B8D459F5594756C93DC4EA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9afe0f6a-1a15-a200-b96d-385d3f69a375@linux.alibaba.com>
 <20230606120830.GA28580@h68b04307.sqa.eu95>
 <PH0PR12MB5481FEE6DF87BCF2D44BF311DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <c6609edb-5493-7470-4d56-df92c7a1715c@linux.alibaba.com>
 <PH0PR12MB548129A5BC4DDF5A9B986E8CDC54A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <PH0PR12MB548129A5BC4DDF5A9B986E8CDC54A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [virtio] RE: [virtio-comment] [PATCH
 requirements 5/7] net-features: Add n-tuple receive flow steering
 requirements



在 2023/6/13 上午1:26, Parav Pandit 写道:
>> From: Heng Qi <hengqi@linux.alibaba.com>
>> Sent: Monday, June 12, 2023 10:35 AM
>>> I will update this details in the v1.
>> Hi, Parav.
>>
>> Do we have a work schedule for the 1.4 features?
> Since n-tuple requirements are straightforward, below is timeline in mind,
> 1. Requirements agree and drafted by June-30
> 2. Design and its review to finish by July-30
> 3. Spec to review by Aug-30

OK, is this timeline for all 1.4 features or individual high priority 
1.4 features?
Do we have a prioritization of 1.4 features? This also facilitates time 
investment for community maintainers.

>> For example, the flow director we are very concerned about recently, because
>> different scenarios have requirements for it.
>>
>> We'd like to work out with you a rough timeline so we can discuss and
>> collaborate better!
>>
> Will above timeline workable for you to work together on it?

This timeline is ok for us. In addition, if it is difficult for the 
community to carry the VF id or there is an unclear
demarcation problem with the design of  the group owner management, 
maybe we can skip this first (In any
case, it depends on the opinion of the virtio community).

> We should work on finite requirements that we can converge and deliver.

Yes. Agree.

> First draft was this v0 one.
>
> Otherwise, it can be never ending list that doesn't reach anywhere as steering technology keeps improving.
>
> Slightly unrelated to question, let's call this feature as: "receive flow filters", instead of "flow director".

OK, here's our previous agreement.

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

