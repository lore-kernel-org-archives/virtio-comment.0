Return-Path: <virtio-comment-return-6354-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5776EB64D9
	for <virtio-comment@archiver.kernel.org>; Thu, 15 Jun 2023 05:56:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0FC6E42563
	for <virtio-comment@archiver.kernel.org>; Thu, 15 Jun 2023 05:56:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0160B9866B6
	for <virtio-comment@archiver.kernel.org>; Thu, 15 Jun 2023 05:56:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E096E986339; Thu, 15 Jun 2023 05:56:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C463898663F
	for <virtio-comment@lists.oasis-open.org>; Thu, 15 Jun 2023 05:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="339165724"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="339165724"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="802209733"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="802209733"
Message-ID: <a948882f-7646-7cef-d04d-b7ead9336cc5@intel.com>
Date: Thu, 15 Jun 2023 13:56:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
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
 <c78d5554-ac1b-ed67-01d0-00943e69af44@intel.com>
 <PH0PR12MB548104F31CA38275A2D7E41EDC5AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <476b3ec4-0a19-2f61-4d2a-e4badfbeb499@intel.com>
 <PH0PR12MB548153E61A5C67902F427746DC5AA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB548153E61A5C67902F427746DC5AA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling



On 6/14/2023 7:56 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Wednesday, June 14, 2023 2:11 AM
>> On 6/14/2023 12:32 PM, Parav Pandit wrote:
>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>> Sent: Wednesday, June 14, 2023 12:27 AM
>>>>> If a device has assumed that queue_reset must be done after
>>>>> DRIVER_OK stage because until that point the device is not "live",
>>>>> Such device needs the
>>>> fix.
>>>> I think queue_reset just resets the queue and its fields including
>>>> the queue_enable. DRIVER_OK is not a must for performing a
>>>> queue_reset, My understanding is:
>>>> - before DRIVER_OK, the driver can re-config the queue anytime,
>>>> doesn't need a reset_queue
>>> Before DRIVER_OK stage, to reconfigure a queue, driver needs to write
>> queue_enable = 0.
>>> This is not allowed in the spec.
>>> So driver need to use queue_reset to reconfigure.
>> The spec requires the driver config all other fields before set queue_enable.
>> I am not sure whether there are real occurring cases that re-config the vq fields
>> between queue_enable and DRIVER_OK in the initialization.
>>
> Probably there is no case today, but may be it can occur where driver tries to configure something and if it fails, it may need to roll back and re-configure queues.
>
>> But I agree maybe we should allow set queue_enable = 0.
>>
> This functionality of queue_enable = 0, is supported using queue_reset register.
>   
>> This reset may happen after DRIVER_OK.
> Yes, the queue_reset after DRIVER_OK is not ambiguous.
> Queue_reset before DRIVER_OK has the ambiguity, and will clarify that it should be supported by device before DRIVER_OK.
>
> For the main motivation of this patch, the _RESET bit seems enough to selectively enable the queue before or after DRIVER_OK.
I guess the intention may be:
Step 1: the hypervisor owns all queues, it enables all queues and cvq, 
set queue fields with phony host values.
Then set DRIVER_OK, config the device and send commands through cvq.
But don't do link announce. So the device would not consume the 
descriptors and external network will not send
any data to it.

Step 2: Reset the queues, set the fields of the queues with guest 
config, selectively enable the queues,
so the device works for the guest.

Does this sounds good?




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

