Return-Path: <virtio-comment-return-7020-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64686C04A94
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 07:51:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A99E271C8B
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 07:51:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8996D98670B
	for <virtio-comment@archiver.kernel.org>; Fri,  4 Aug 2023 07:51:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 709939866DE; Fri,  4 Aug 2023 07:51:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5EC9B9866DF;
	Fri,  4 Aug 2023 07:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R811e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Vp.jcK9_1691135479;
Message-ID: <47dd90a2-3be6-5bab-a423-08d8d5a63be9@linux.alibaba.com>
Date: Fri, 4 Aug 2023 15:51:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Parav Pandit <parav@nvidia.com>
Cc: Satananda Burla <sburla@marvell.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 Shahaf Shuler <shahafs@nvidia.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <20230802152525.GA13690@h68b04307.sqa.eu95>
 <PH0PR12MB5481538EEC183EBE3FF16234DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230803130725.GA47086@h68b04307.sqa.eu95>
 <PH0PR12MB54811B738594B741F8F8D723DC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230804071728.GA7515@h68b04307.sqa.eu95>
 <PH0PR12MB54814571128E5D313192D4EFDC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <PH0PR12MB54814571128E5D313192D4EFDC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio] RE: [PATCH requirements 5/7] net-features: Add n-tuple
 receive flow filters requirements



在 2023/8/4 下午3:30, Parav Pandit 写道:
>> From: Heng Qi <hengqi@linux.alibaba.com>
>> Sent: Friday, August 4, 2023 12:47 PM
>> Yes, but a small update:
>> If flowvq is created, RFF must be done only on flowvq by the driver.
>> If flowvq is supported, but not created, cvq can be used.
>> If flowvq is not supported, cvq is used.
>>
> Looks fine, I want to think little more on the last point to make sure we are not missing something.
> Will respond by Monday on it.

Ok.

> [..]
>
>> Oh, I got it, I think we should let people see more details in the next version.:)
>>
>>> For any new/undefined protocol, if user wants to say, In a packet at
>>> byte offset A, if you find pattern == 0x800, drop the packet.
>>> In a packet at byte offset B, if you find pattern == 0x8100, forward to rq 10.
>>>
>>> I didn't consider multiple matching patterns for now, though it is very useful.
>>> I am inclined to keep the option of _any_match to take up later, for now to do
>> only well defined match?
>>> WDYT?
>> I think it's ok, but we don't seem to need the length here. But in any case, I
>> don't think it's that important to have or not ^^
>>
> Length will be needed to indicate how many bytes to match to.
> Lets do this rule incrementally after we get the base line done for known RFC defined fields.
>
>>> Lets keep rss context in future work as its orthogonal to it.
>>> Yes, your help for rss context will be good.
>>> Lets first finish RFF as its bit in the advance stage.
>> Yes! But I worry that a spec that references a concept that doesn't exist in the
>> existing spec may be blocked, so if you have no objections, I will push this work
>> forward in the near future to help RFF possible blocking.
> I was probably not clear enough, I propose that lets remove the RSS context for now in the RFF.
> Once RSS context is done, at that point in future to enhance RFF.

I need some time to see if the rss context has an effect on our 
scenario, so please hold it for now. I'll sync it up as soon as possible.

Thanks!

>
> ---------------------------------------------------------------------
> To unsubscribe from this mail list, you must leave the OASIS TC that
> generates this mail.  Follow this link to all your TCs in OASIS at:
> https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php


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

