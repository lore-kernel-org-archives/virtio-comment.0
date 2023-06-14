Return-Path: <virtio-comment-return-6350-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E7BEB64D8
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:26:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A0C1D71C87
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:26:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8205198668E
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:26:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6BEEE986656; Wed, 14 Jun 2023 04:26:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5A45E98665C
	for <virtio-comment@lists.oasis-open.org>; Wed, 14 Jun 2023 04:26:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="386920015"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="386920015"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="1042037189"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="1042037189"
Message-ID: <c78d5554-ac1b-ed67-01d0-00943e69af44@intel.com>
Date: Wed, 14 Jun 2023 12:26:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "alvaro.karsz@solid-run.com" <alvaro.karsz@solid-run.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>,
 "longpeng2@huawei.com" <longpeng2@huawei.com>,
 Dragos Tatulea <dtatulea@nvidia.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Heng Qi
 <hengqi@linux.alibaba.com>, Shannon Nelson <snelson@pensando.io>,
 Max Gurtovoy <mgurtovoy@nvidia.com>,
 "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>
References: <20230608180617-mutt-send-email-mst@kernel.org>
 <CAJaqyWf-=R+KHfBjzrGzkunTdeV8sAgFUv_kYoxNo3uqH2OOSw@mail.gmail.com>
 <20230609115250-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
 <20230613034216-mutt-send-email-mst@kernel.org>
 <20230613035132-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
 <PH0PR12MB5481746BE0C1B7CE4D098A7BDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230613154823-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F91C70744E7A83BD10ADC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230613173837-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481CBCA2D51F3B67581C100DC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB5481CBCA2D51F3B67581C100DC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling



On 6/14/2023 5:54 AM, Parav Pandit wrote:
>
>> From: Michael S. Tsirkin <mst@redhat.com>
>> Sent: Tuesday, June 13, 2023 5:48 PM
>>> Why queue_reset is needed here?
>>> I don't see spec saying that queue_enable must be done only once for a given
>> Q before DRIVER_OK.
>>
>> I see you found it.
>>
>>>> - program another queue address, size
>>>>
>>>> Finally we are decided, let's start operating:
>>>>
>>>> - DRIVER_OK
>>>>
>>>>
>>>> I don't see how it's possible with just queue_enable.
>>>>
>>>>
>>>>> It is not explicitly mentioned in the spec that one can setup the
>>>>> queue using
>>>> queue reset instead of queue enable.
>>>>> As Jason mentioned it is implementation specific, one device
>>>>> supports it and
>>>> one doesn't.
>>>>> Hence, it will break on those devices which doesnt support it.
>>>>>
>>>> Setup? No, and spec explicitly says to setup one has to use
>>>> queue_enable. But this is not what we discussed with Stefano here.
>>>>
>>> The above sequence you described is not well documented.
>> It's the standard sequence for queue reset, is it not?
>>
>> For example:
>>
>> 	Virtqueue reset is divided into two parts. The driver first resets a queue
>> and
>> 	can afterwards optionally re-enable it.
>>
>>
>> it seems clear that queue has to be enabled before being reset.
>>
> Yes, it is clear.
>   
>> I'm not sure what's broken.
>>
> If a device has assumed that queue_reset must be done after DRIVER_OK stage because until that point the device is not "live",
> Such device needs the fix.
I think queue_reset just resets the queue and its fields including the 
queue_enable. DRIVER_OK is not a must for performing a queue_reset,
My understanding is:
- before DRIVER_OK, the driver can re-config the queue anytime, doesn't 
need a reset_queue
- after DRIVER_OK, the driver has to reset the queue to re-config the 
queue. Because a queue is considered alive when both DRIVER_OK && 
queue_enable,
and resetting a queue also set queue_enable to zero.

At the end of the migration, hypervisor should reset the queues and 
config the queues with the guest configurations and enable the queues, 
right?

Thanks


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

