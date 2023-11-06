Return-Path: <virtio-comment-return-8178-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31062C4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 03:58:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7C68A3E56D
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 03:58:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5D94098670A
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 03:58:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4826F9866FB; Mon,  6 Nov 2023 03:58:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 382E69866FC
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 03:58:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455686765"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="455686765"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="791340550"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="791340550"
Message-ID: <b672e459-30be-49b1-91d6-c4461d8475ed@intel.com>
Date: Mon, 6 Nov 2023 11:58:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: "jasowang@redhat.com" <jasowang@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
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
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231105075906-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking



On 11/6/2023 12:12 AM, Michael S. Tsirkin wrote:
> On Fri, Nov 03, 2023 at 03:47:34PM +0000, Parav Pandit wrote:
>>>> [1]
>>>> https://lists.oasis-open.org/archives/virtio-comment/202310/msg00475.h
>>>> tml
>>> you still need to explain why this does not work for pass-through.
>> It does not work for following reasons.
>> 1. Because all the fields that put on the member device are not in direct control of the hypervisor.
>> The device is directly controlled by the guest including the device status and when it resets the device all the things stored in the device are lost.
> I think the idea is that when this gateway is in the device then
> device reset has to trap. At a high level, ok. But then what?
No, when device reset, the device is expected to forget everything and
re-intialize.
> Is a full scan of all memory required until device reset is complete?
Who scan the memory? The device tracks its own dirty pages.
> Drivers currently tend to busy poll the reset register,
> if this takes very long we might start seeing soft lockup
> messages. What is the idea then? Maybe for this we need a separate
> weaker reset that does not touch this capability?
When reset, how can we expect the LM progress continue running.

For example, when the device DMA writes something, then reset before 
sending an interrupt,
the DMA-ed pages should be lost as expected, right?
>
>> 2. the PCI FLR is clearing all the registers you exposed here.
> Same problem, though FLR at least is expected to take a long time.
If FLR, then whole device reset, and this is PCI, not virtio.
As Jason pointed out, do you want to audit every PCI functionality?
>
>
>> 3. Endless expansion of config registers of dirty tracking is not scalable, as they are not init time registers not following the Appendix B guidelines.
>> 4. bitmap based dirty tracking is not atomic between cpu and device.
>> Hence, it is racy.
> Well pcie atomics exist. Not sure whether it's reasonable to rely on
> them. Any data on who common implementations are?
>
>> 5. All the device context needed for passthrough based hypervisor for a device type specific is missing.
>> All of those can be used for non-passthrough as well.
>> [1] https://lists.oasis-open.org/archives/virtio-comment/202311/msg00085.html
>>
>>> And I
>>> remember this is a point-less topic as MST ever wants to mute another "pass-
>>> through" thread.
>> No. he did not say that.
>> He meant to not endlessly debate which one is better.
>> He clearly said, try to see if you can make multiple hypervisor model work.
>> And your series shows a clear ignorance of his guidance.
> I think you mean "ignoring" :)
>
>
>>>>>> +optionally the device is permitted to set the entire byte, which
>>>>>> +encompasses
>>>>> the relevant bit, to 1.
>>>>>> +
>>>>>> +The device MAY increase \field{gra_power} to reduce
>>> \field{bitmap_length}.
>>>>>> +
>>>>>> +The device must ignore any writes to \field{pasid} if PASID
>>>>>> +Extended Capability is absent or the PASID functionality is
>>>>>> +disabled in PASID Extended Capability
>>>>> I have to say this is going to work very badly when the number of
>>>>> dirty pages is
>>>>> small: you will end up scanning and re-scanning all of bitmap.
>>>>> And the resolution is apparently 8 pages? You have just multiplied
>>>>> the migration bandwidth by a factor of 8.
>>>> Yeah.
>>>> And device does not even know previously reported pages are read by driver
>>> or not. All guess work game for driver and device.
>>> see my reply to him
>> Please see above reply.


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

