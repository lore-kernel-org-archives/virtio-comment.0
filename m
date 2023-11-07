Return-Path: <virtio-comment-return-8233-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AA1C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 09:49:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F001621697
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 09:49:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8261986826
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 09:49:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id ADC999867F1; Tue,  7 Nov 2023 09:49:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9D6589867F9
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 09:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="379861107"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="379861107"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="828556008"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="828556008"
Message-ID: <d814df3e-57b0-4b3b-8de5-0818d5e2a02e@intel.com>
Date: Tue, 7 Nov 2023 17:48:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231105075906-mutt-send-email-mst@kernel.org>
 <b672e459-30be-49b1-91d6-c4461d8475ed@intel.com>
 <20231106052953-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231106052953-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty
 page tracking



On 11/6/2023 6:33 PM, Michael S. Tsirkin wrote:
> On Mon, Nov 06, 2023 at 11:58:03AM +0800, Zhu, Lingshan wrote:
>>
>> On 11/6/2023 12:12 AM, Michael S. Tsirkin wrote:
>>> On Fri, Nov 03, 2023 at 03:47:34PM +0000, Parav Pandit wrote:
>>>>>> [1]
>>>>>> https://lists.oasis-open.org/archives/virtio-comment/202310/msg00475.h
>>>>>> tml
>>>>> you still need to explain why this does not work for pass-through.
>>>> It does not work for following reasons.
>>>> 1. Because all the fields that put on the member device are not in direct control of the hypervisor.
>>>> The device is directly controlled by the guest including the device status and when it resets the device all the things stored in the device are lost.
>>> I think the idea is that when this gateway is in the device then
>>> device reset has to trap. At a high level, ok. But then what?
>> No, when device reset, the device is expected to forget everything and
>> re-intialize.
> That's a problem then - memory that was already written will not be
> detected as such.
Two cases:
1) memory written and has sent an interrupt. Then CPU has acknowledged 
the data, it should process the data
2) memory written but no interrupt, this should be lost as expected.
>
>>> Is a full scan of all memory required until device reset is complete?
>> Who scan the memory? The device tracks its own dirty pages.
> yes but reset erases this information.
should be, or the hypervisor will copy invalid information, cause a 
conflict.

I remember Jason as given an example on this.
>
>
>>> Drivers currently tend to busy poll the reset register,
>>> if this takes very long we might start seeing soft lockup
>>> messages. What is the idea then? Maybe for this we need a separate
>>> weaker reset that does not touch this capability?
>> When reset, how can we expect the LM progress continue running.
>>
>> For example, when the device DMA writes something, then reset before sending
>> an interrupt,
>> the DMA-ed pages should be lost as expected, right?
> interrupt is going to guest, has nothing to do with it.
>
> device writes data into memory
> device sends interrupt
> driver sees data
At this point, the guest CPU owns the dirty pages, owns the data
> driver sends reset
At this point, the device should forget everything
>
> meanwhile hypervisor did not see any dirty pages
>
> now what? hypervisor must apparently retrieve all
> dirty page data before it can reset the device.
It is not the hypervisor, once an interrupt has sent,
the guest take over the pages.
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

