Return-Path: <virtio-comment-return-6310-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B956EC7EE2F
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Jun 2023 14:35:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DD8D32AF8C
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Jun 2023 14:35:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CC591986521
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Jun 2023 14:35:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B1EE99864F3; Mon, 12 Jun 2023 14:35:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 81AC1986508;
	Mon, 12 Jun 2023 14:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R541e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Vl-UCeg_1686580510;
Message-ID: <c6609edb-5493-7470-4d56-df92c7a1715c@linux.alibaba.com>
Date: Mon, 12 Jun 2023 22:35:09 +0800
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
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <PH0PR12MB5481FEE6DF87BCF2D44BF311DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio] RE: [virtio-comment] [PATCH requirements 5/7]
 net-features: Add n-tuple receive flow steering requirements



在 2023/6/7 上午5:49, Parav Pandit 写道:
>
>> From: Heng Qi <hengqi@linux.alibaba.com>
>> Sent: Tuesday, June 6, 2023 8:09 AM
>> We have already aligned the requirements internally. There is a common
>> requirement in the cloud scenario: a virtual nic with SR-IOV capability.
>> The user of a vm splits it into one PF + multiple VFs, and each VF takes some of
>> the queues from the PF. Each VF can get its own IP address and mac from the PF.
>>
>> However, the forwarding component (here it can be understood as an eswitch)
>> connected to the virtual nic cannot see VFs, but can only see the PF (when
>> creating the SR-IOV virtual nic, the PF is bound to a forwarding component).
>> This behavior does not affect users (such as users in containers) using the VF,
>> that is, the user sees a real virtual nic. However, the data incoming and outgoing
>> this VF nic needs to be distinguished in the forwarding component:
>>
>> 1. When the packet comes out of the VF nic (from the perspective of the
>> forwarding component, it comes out of a queue of the PF), the source ip of the
>> packet is still the ip of the VF, and the forwarding component forwards it
>> directly;
>>
>> 2. When packets arrive at the forwarding component, the IPs seen by the
>> forwarding component (the IPs of all VFs) are the IPs of the PF.
>> If the forwarding component wants to direct packets to the corresponding VF, it
>> should use the flow director rules with the VF id issued by the PF.
>>
>> Perhaps the admin queue can achieve this capability, but the flow director rule
>> carrying the VF id has become the ethtool and kernel standard,
> To my knowledge the eswitch model is not part of the ethtool.
> It is part of the tc flower offloads and it covers far more than just _forwarding_ rules.
>
> so we should be able to steer to a vf_id with a abstraction of say switch_port_id as far as spec is concerned.
>
> The main difference is the type of rules eswitch vs the guest driver adds are very different.
> But yes, both should be able to use some of the common infrastructure.
>
> We should consider this requirement in mind and craft the "destination" to cover this.
>
> Since the flow insertion/removal queue should be present in one case PF and other case on VFs, we likely need a different queue than the AQ or expand the scope.
>
> We should cover these in the design/requirements further.
>
> I will update this details in the v1.

Hi, Parav.

Do we have a work schedule for the 1.4 features?
For example, the flow director we are very concerned about recently,
because different scenarios have requirements for it.

We'd like to work out with you a rough timeline so we can discuss and 
collaborate better!

I hope I'm not disrupting your schedule :), just for us to better 
promote the work of virtio!

Grateful!

>
>> so we can try to
>> include it in the flow director's ability first (this means that the flow director
>> itself can have this behavior, especially for those PFs that intend to limit the
>> capabilities of the VF, and this behavior can effectively support our scenario).


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

