Return-Path: <virtio-comment-return-8225-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5206C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:21:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EEB5A2AEFF
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:21:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D78AF9867FD
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:21:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C114A9867F0; Tue,  7 Nov 2023 08:21:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B212E9867F1
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 08:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368793555"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="368793555"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="3912201"
Message-ID: <5c659db2-9263-4f9c-b1ac-073de5c01446@intel.com>
Date: Tue, 7 Nov 2023 16:21:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-3-lingshan.zhu@intel.com>
 <PH0PR12MB54814E8B9E7D16C9EF421C82DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <78f206cd-1e07-4c20-a281-1ddf74cf4d84@intel.com>
 <PH0PR12MB5481F05E5A952E9A43B96F73DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <8eb1a4c5-eb7d-4f8d-8afd-4aab5559a8d6@intel.com>
 <PH0PR12MB5481CD22F4AFF3DFA7F53B91DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <850caea9-f7dc-4dee-ae00-936766287ba3@intel.com>
 <PH0PR12MB54810A60FD26411387DBC7D9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54810A60FD26411387DBC7D9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH V2 2/6] virtio: introduce SUSPEND bit
 in device status



On 11/6/2023 6:52 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Monday, November 6, 2023 2:51 PM
>>
>> On 11/6/2023 12:07 PM, Parav Pandit wrote:
>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>> Sent: Monday, November 6, 2023 9:00 AM
>>>>
>>>> On 11/3/2023 11:54 PM, Parav Pandit wrote:
>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>> Sent: Friday, November 3, 2023 8:25 PM
>>>>>>
>>>>>> On 11/3/2023 7:35 PM, Parav Pandit wrote:
>>>>>>>> From: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>>>> Sent: Friday, November 3, 2023 4:05 PM
>>>>>>>>
>>>>>>>> This patch introduces a new status bit in the device status: SUSPEND.
>>>>>>>>
>>>>>>>> This SUSPEND bit can be used by the driver to suspend a device,
>>>>>>>> in order to stabilize the device states and virtqueue states.
>>>>>>>>
>>>>>>>> Its main use case is live migration.
>>>>>>>>
>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>>>>>> You constantly complained that whatever was proposed using admin
>>>>>> commands method in [1] must work for passthrough and non-passthrough.
>>>>>>> And halfway in the discussion you propose a method after learning
>>>>>>> all the
>>>>>> limitations of in-band, you propose a solution only works for
>>>>>> non-passthrough mode.
>>>>>>> You asked someone to have comprehensive proposal and when it comes
>>>>>>> to
>>>>>> you following it, you just don’t.
>>>>>> not sure what you are talking about.
>>>>>>> And have most shallow commit message to not even mention it.
>>>>>>>
>>>>>>> Please be consistent in design approach.
>>>>>>> And if you don’t want to be, stop asking others.
>>>>>> this SUSPEND/RESUME doesn't change since the RFC series, how can it
>>>>>> not be inconsistent???
>>>>>>> This is not the way TC collaboration works.
>>>>>>> I probably shouldn’t even expect this from you.
>>>>> Your proposal does not cover both the use cases of passthrough and
>>>>> non-
>>>> passthrough.
>>>>> Yet you kept demanding them for others.
>>>>> This is just wrong.
>>>>>
>>>>> I am aware that both models as technical pros and cons.
>>>> Why this doesn't work? the device status byte has been working for
>>>> many years, and do you know when guest freeze, the hypervisor owns the
>> device????
>>> When the guest is not frozen and during the pre-copy phase, hypervisor needs
>> to access the device (context, dirty pages).
>>> How does it work if the guest owns the device?
>> Have you seen PASID there?
> PASID does not help because as explained virtio common config space and device specific config space is owned by the guest driver.
>
> Secondly PASID space is also owned by the guest driver.
hypervisor sets a PASID to isolate the cap.
>
>>>>>>> [1]
>>>>>>> https://lists.oasis-open.org/archives/virtio-comment/202310/msg004
>>>>>>> 72
>>>>>>> .h
>>>>>>> tml
>>>>>> Please don't be so emotional and please be professional.
>>>>>>
>>>>>> Why this solution can not work for pass-through? Do you know the
>>>>>> device ownership will be transferred to the hypervisor when guest
>>>>>> suspended in live migration?
>>>>> I explained 5 reasons why it does not work in previous reply.
>>>>>
>>>>> As the word indicates "live migration", the hypervisor needs to
>>>>> access the
>>>> device when it is "live" (not just after).
>>>>> Hence, passthrough mode must be able to capture the state of the
>>>>> device and
>>>> dirty pages database when its live.
>>>>> (and after the source is suspended).
>>>> No, the hypervisor should only collect dirty pages when the device alive.
>>> It is needed during both the times.
>>> When the device and guest is live during pre-copy phase.
>>> And after the device is frozen, to get the final round of pages.
>> With PASID, dirty page tracking facility can be isolated from the guest, means
>> the hypervisor owns this facility. So the hypervisor can collect the dirty pages.
>>
>> When the device suspended, it should report the last round of dirty pages
>> through dirty page tracking facility as expected.
>>
>> This can work, right?
> Unfortunately no, as non atomic bitmap cannot reside in the host memory,
as explained before, PCI and CPU supports atomic read/write. Please 
refer to PCI spec and CPU ISA.
> And whatever is in the device gets reset on device reset and/or FLR. So the dirty map detail is lost.
> Similarly the device context is also lost on these two events triggered by guest.
we explained before, when reset, the device should clear everything.
>
>>>> As you can see, the dirty page tracking facility has a PASID for
>>>> isolation. But still, the question is, we should better use platform
>>>> dirty page tracking
>>>>
>>> Nothing to do with PASID, as PASID is owned by the guest.
>> It looks you don't know how PASID work.
>> Host can setup PASID to isolate some facilities, right?
> There are few limitations with PASID.
> a. All platforms do not have PASID and
As we have explained for many times, this is a basic facility,
and the implementation is transport-specific.

We given an example of PCI implementation, and PCI support PASID, right?
> b. I explained above PASID do not work always as PASID only bifurcates DMA not the device _functionality_.
With a PASID, a cap can be considered to be placed in another logical 
address space, which is not accessible to the guest.
> c. PASID to be available to guest as_is what is present on the device
host hypervisor sets the PASID, transparent to the guest.
>
>>>> Then suspend the device after guest freeze, to stabilize the device
>>>> status, then read the status.
>>>>
>>>> How can you say this does not work???
>>> I explained above.
>> see above


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

