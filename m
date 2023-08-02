Return-Path: <virtio-comment-return-6976-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F078C001E0
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 15:33:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CEA0ECB163
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 15:33:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BABEC9866AE
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 15:33:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A5A8C98664C; Wed,  2 Aug 2023 15:33:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 90232986654;
	Wed,  2 Aug 2023 15:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VovQK9w_1690990378;
Message-ID: <d7dea4fb-5c47-fc3b-f220-0865aecf4cb7@linux.alibaba.com>
Date: Wed, 2 Aug 2023 23:32:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Shahaf Shuler <shahafs@nvidia.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <PH0PR12MB5481BFAC574390286C5BA0FBDC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB54816E5CA04DAFD03581F6CBDC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <PH0PR12MB54816E5CA04DAFD03581F6CBDC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH requirements 5/7] net-features: Add
 n-tuple receive flow filters requirements



在 2023/8/2 下午2:44, Parav Pandit 写道:
>
>> From: virtio@lists.oasis-open.org <virtio@lists.oasis-open.org> On Behalf Of
>> Parav Pandit
>> Sent: Tuesday, August 1, 2023 2:04 PM
>>
>> Hi Michael and all,
>>
>>> From: Parav Pandit <parav@nvidia.com>
>>> Sent: Monday, July 24, 2023 9:04 AM
>>>
>>> Add virtio net device requirements for receive flow filters.
>>>
>>> Signed-off-by: Parav Pandit <parav@nvidia.com>
>> Do you have any further comments on it?
>>
>> Heng and I want to progress now to start the design/spec draft of it starting 3rd
>> Aug.
>> Flow filter command requires packed VQ descriptor extension.
>> So, we need to wrap up now for this infrastructure extension pre-work which
>> has significant effort.
>>
>> For now, we are taking design to next stage for these steering requirements.
>> The packed vq extension is going to benefit low latency tx part as well as
>> reviewed by Stephan.
> In todays' meeting we further discussed that inline is optional feature for the txq and for steering filters.
> Hence, based on the feedback, we can progress now without packed vq extension.

Hi, Parav.
I remember that the last meeting (7.26) was canceled and the meeting was 
postponed until today (8.02)?
If yes, unfortunately we missed this meeting :(.

Is the next meeting still two weeks away (8.16) ?

Thanks!

>
> We need to close on the config space access via dma interface.
> So lets finish that blocker now so counters and filters can progress.
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


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

