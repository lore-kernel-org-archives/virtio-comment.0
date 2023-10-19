Return-Path: <virtio-comment-return-7846-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313DACDB483
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:09:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 844ED42D6F
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:09:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 741649868D1
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:09:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 661409868CE; Thu, 19 Oct 2023 09:09:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 585C59868CF
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 09:09:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="385081542"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="385081542"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="791926777"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="791926777"
Message-ID: <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
Date: Thu, 19 Oct 2023 17:09:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
 <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>,
 Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com>
 <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <PH0PR12MB548139B50AD2D1B86AC9A127DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com>
 <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 10/19/2023 5:01 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Thursday, October 19, 2023 1:45 PM
>>
>> On 10/18/2023 5:48 PM, Parav Pandit wrote:
>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>> Sent: Wednesday, October 18, 2023 2:13 PM
>>>>
>>>> On 10/18/2023 3:20 PM, Parav Pandit wrote:
>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>> Sent: Wednesday, October 18, 2023 12:22 PM
>>>>>>
>>>>>> On 10/18/2023 2:41 PM, Parav Pandit wrote:
>>>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>>>> Sent: Wednesday, October 18, 2023 12:06 PM
>>>>>>>>
>>>>>>>> On 10/18/2023 1:02 PM, Parav Pandit wrote:
>>>>>>>>>> From: virtio-comment@lists.oasis-open.org
>>>>>>>>>> <virtio-comment@lists.oasis- open.org> On Behalf Of Zhu,
>>>>>>>>>> Lingshan
>>>>>>>>>> Sent: Monday, October 16, 2023 3:18 PM
>>>>>>>>>>
>>>>>>>>>> On 10/13/2023 7:54 PM, Parav Pandit wrote:
>>>>>>>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>>>> Sent: Friday, October 13, 2023 3:14 PM
>>>>>>>>>>>>>>>> How do you transfer the ownership?
>>>>>>>>>>>>>>> An additional ownership deletgation by a new admin
>> command.
>>>>>>>>>>>>>> if you think this can work, do you want to cook a patch to
>>>>>>>>>>>>>> implement this before you submitting this live migration series?
>>>>>>>>>>>>> I answered this already above.
>>>>>>>>>>>> talk is cheap, show me your patch
>>>>>>>>>>> Huh. We presented the infrastructure that migrates, 30+ device
>>>>>>>>>>> types,
>>>>>>>>>> covering device context ideas from Oracle.
>>>>>>>>>>> Covering P2P, supporting device_reset, FLR, dirty page tracking.
>>>>>>>>>>>
>>>>>>>>>>> Please have some respect for other members who covered more
>>>>>>>>>>> ground than
>>>>>>>>>> your series.
>>>>>>>>>>> What more? Apply the same nested concept on the member device
>>>>>>>>>>> as
>>>>>>>>>> Michael suggested, it is nested virtualization maintain exact
>>>>>>>>>> same
>>>>>> semantics.
>>>>>>>>>>> So a VF is mapped as PF to the L1 guest.
>>>>>>>>>>> L1 guest can enable SR-IOV on it, and map one VF to L2 guest.
>>>>>>>>>>>
>>>>>>>>>>> This nested work can be extended in future, once first level
>>>>>>>>>>> nesting is
>>>>>>>>>> covered.
>>>>>>>>>>>> Answer all questions above, if you think a management VF can
>>>>>>>>>>>> work, please show me your patch.
>>>>>>>>>>> The idea evolves from technical debate then pointing fingers
>>>>>>>>>>> like your
>>>>>>>>>> comment.
>>>>>>>>>>> I think a positive discussion with Michael and a pointer to
>>>>>>>>>>> the paper from
>>>>>>>>>> Jason gave a good direction of doing _right_ nesting that
>>>>>>>>>> follows two
>>>>>>>> principles.
>>>>>>>>>>> a. efficiency property
>>>>>>>>>>> b. equivalence property
>>>>>>>>>>>
>>>>>>>>>>> (c. resource control is natural already)
>>>>>>>>>>>
>>>>>>>>>>> Both apply at VMM and at VM level enabling recursive
>>>>>>>>>>> virtualization, by
>>>>>>>>>> having VF that can act as PF inside the guest.
>>>>>>>>>>> [1] https://dl.acm.org/doi/pdf/10.1145/361011.361073
>>>>>>>>>> Please just show me your patch resolving these opens, how about
>>>>>>>>>> start from defining virito-fs device context and your management VF?
>>>>>>>>> As answered, device context infrastructure is done, per device
>>>>>>>>> specific device-
>>>>>>>> context will be defined incrementally.
>>>>>>>>> I will not be including virtio-fs in this series. It will be
>>>>>>>>> done incrementally in
>>>>>>>> future utilizing the infrastructure build in this series.
>>>>>>>> Done? How do you conclude this? You just tell me what is the full
>>>>>>>> set of virito-fs device context now and how to migrate them.
>>>>>>>>
>>>>>>>> You cant? you refuse or you don't? Do you expect the HW designer
>>>>>>>> to figure out by themself?
>>>>>>> I wont be able to tell now as I don’t think it is necessary for this series.
>>>>>>> If one out of 30 devices cannot migrate because of unimaginable
>>>>>>> amount of
>>>>>> complexity has been placed there, may be one will not implement it
>>>>>> as member device.
>>>>>>>     From experience of migratable complex gpu devices, rdma devices
>>>>>>> (stateful
>>>>>> having hundred thousand of stateful QPs), my understanding is
>>>>>> complex state of virtio-fs can be defined and migratable.
>>>>>>> Mlx5 driver consist of 150,000 lines of code and that device is
>>>>>>> migratable
>>>>>> with complex state.
>>>>>>> So I am optimistic that virtio-fs can be migratable too.
>>>>>>> It does not have to limited by my limited creativity of 2023.
>>>>>>> May be I am wrong, in that case one will not implement passthrough
>>>>>>> virtio-fs
>>>>>> device.
>>>>>> your series wants to migrate device context, but doesn't define
>>>>>> device context, does this sounds reasonable?
>>>>> Device generic context is defined at [1] and also the infrastructure
>>>>> for defining
>>>> the device context in parallel by multiple people can be done post
>>>> the work of [1].
>>>>> Per each device type context will be defined incrementally post this work.
>>>>>
>>>>> [1]
>>>>> https://lists.oasis-open.org/archives/virtio-comment/202310/msg00190
>>>>> .h
>>>>> tml
>>>> This is not post of the work, you should define them before you use
>>>> them in this series.
>>>>
>>> I don’t agree to cook ocean in this patch series.
>>> No practical spec devel community does it.
>>> As long as we feel comfortable that device context framework is extendible, it
>> is fine.
>>> If virtio-fs seems very hard, may be one will come with a new light weight FS
>> device. I really don’t know.
>> so you want to migrate device context, but refuse to define them?
>>>> And you need to prove why admin vq are better than registers solution
>>>> if you want a merge.
>>> Michael already responded the practical aspects.
>>> Since you may claim, I didn’t answer, below is the technical details.
>>>
>>> Why admin commands and aq is better is because of below reasons in my
>> view:
>>> Functionally better:
>>> 1. When the live migration registers are located on the VF itself, VMM does
>> not have control of it.
>>> These registers reset, on FLR and device reset because these are virtio
>> registers of the device.
>>> Hence, VMM lost the state for the job that VMM was supposed to do.
>>> Therefore, passthrough mode cannot depend on these registers.
>>>
>>> 2. Any bulk data transfer of device context and dirty page tracking requires
>> DMA.
>>> Hence those DMA must happen to the device which is different than VF itself.
>>> If it is on the VF itself, it has two problems.
>>> 2.a. VF device reset and FLR will clear them, and device context is lost.
>>>
>>> 2.b. the DMA occurs at the PCI RID level.
>>> IOMMU cannot bifurcate the DMA of one RID to two different address space
>> of guest and hypervisor.
>>> This requires PASID support.
>>> Using PASID has following problems.
>>> 2.b.1 PASID typically not used by the kernel software. It is only meant for the
>> user processes.
>>> Hence for kernel work a reserving PASID won't be acceptable upstream
>> kernel.
>>> 2.b.2 Somehow if this is done, When the VF itself supports PASID, it required
>> now vPASID support.
>>> This is again not where industry is going in other forums where I am part of.
>> Hence, it will be failure for virtio. Hence, I do not recommend vPASID route.
>>> 2.b.3 One of the widely used cpu seems to have dropped the support due to
>> limitation of an instruction around PASID.
>>> So it cannot be used there, this further limits virtio passthrough users.
>>>
>>> Even if somehow 2.b.2 and 2.b.3 is overcome in theory, #1 and 2.a is
>> functional problems.
>>> Scale wise better:
>>> 3. Admin command and admin vq are used _only_ when one does device
>> migration command.
>>> One does not migrate VMs every few msec.
>>> Hence such functionality to be better be done which is efficient for
>> performance, but without consuming on-chip memory.
>>> Admin command and admin vq satisfy those.
>>>
>>> 4. Once the software matures further, admin command would prefer
>> completion interrupt, instead of poll.
>>> How to get notification/interrupt? Well, virtqueue defines this already.
>>> Should we replicate that in some PF registers?
>>> It can be. But once you put all the functionalities of admin command and aq
>> in registers the whole thing becomes yet another register_q.
>>> 5. Can these registers be placed in the PF to overcome #1 and #2 for
>> passthrough?
>>> In theory yes.
>>> In practice, no, as there are many commands that flow, which needs to scale
>> to reasonable number of VFs.
>>> Admin commands over admin vq provides this generic facility.
>>>
>>> 6. Most modern devices who attempts to scale, cut down their register
>> footprint, registers are used only for main bootstap, init time config work.
>>> Even in virtio spec, one can read:
>>> "Device configuration space is generally used for rarely changing or
>> initialization-time parameters."
>>> Adding some additional registers to a PF device config space for non init time
>> parameters does not make sense.
>>> 7. Additionally, a nested virtualization should be done by truly nesting the
>> device at right abstraction point of owner-member relationship.
>>> This follows two principles of (a) efficiency and (b) equivalency of what Jason
>> paper pointed.
>>> And we ask for nested VF extension we will get our guidance from PCI-SIG, of
>> why it should be done if it is matching with rest of the ecosystem components
>> that support/don’t support the nesting.
>> It they are true, shall we refactor virtio-pci common cfg functionalities to use
>> admin vq?
> For non-backward compatible SIOV device of the future, yes, virtio-pci common config (non init registers) should be moved to a vq, located on the member device directly.
Oh, really? Quite interesting, do you want to move all config space 
fields in VF to admin vq? Have a plan?


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

