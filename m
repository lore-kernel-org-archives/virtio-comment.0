Return-Path: <virtio-comment-return-6341-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE560EB64D8
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 03:53:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0C58B1318C6
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 03:53:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ED26198668E
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 03:53:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DC76C986656; Wed, 14 Jun 2023 03:53:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8A6B98665C;
	Wed, 14 Jun 2023 03:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Vl4hON._1686714793;
Message-ID: <304df5b1-7e3d-6fcf-d61d-22f5e12c415e@linux.alibaba.com>
Date: Wed, 14 Jun 2023 11:53:10 +0800
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
 <7536eeda-ff4e-633a-89bf-aad94aca317a@linux.alibaba.com>
 <PH0PR12MB548176C28A3ECA7E09E6345ADC5AA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <PH0PR12MB548176C28A3ECA7E09E6345ADC5AA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [virtio] [PATCH requirements 5/7]
 net-features: Add n-tuple receive flow steering requirements



在 2023/6/14 上午11:48, Parav Pandit 写道:
>> From: Heng Qi <hengqi@linux.alibaba.com>
>> Sent: Tuesday, June 13, 2023 11:43 PM
>>> If it’s a "flowvq" dedicated queue device both the requirements are
>> addressed.
>>> Device can choose to implement in its preferred way.
>> I think this is a migration issue:
>> Devices A and B each offser the VIRTIO_NET_F_RECEIVE_FLOW_FILTER (this is a
>> temporary name) feature.
>> And device A implements flowvq, device B does not implement flowvq, they are
>> both using receive flow filters but ARFS is disabled.
>> The migration should fail at this time. Does this meet user expectations?
>>
> If F_RECEIVE_FLOW_FILTER is offered, it means a device supports flowvq on src and dst.
> So migration wont fail.
>   
> It is no different than any other net _F feature.
> For example notification coalescing or _MQ or _RSS.
>
> What I meant in above "preferred way" is, device can choose to operate flow table entries as 5 flow/sec.
> Or it can choose to do 100K flows/sec.

Ok, I see. I misunderstood the "preferred way" before :)

>
> The basic requirement is that flow rule entries should be a low latency interface.
>
>> Or do we warn in the spec that using flow vq might cause the migration issue?
>>
> It should not cause migration once the device features and associated attributes can be queries by the group owner.
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

