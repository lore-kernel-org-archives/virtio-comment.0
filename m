Return-Path: <virtio-comment-return-7975-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21299C25B6B
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:44:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 69F46780D
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:44:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4D927986A50
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:44:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 359EB986A49; Thu, 26 Oct 2023 06:44:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 25A14986A4A
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 06:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="418600329"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="418600329"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="824874506"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="824874506"
Message-ID: <9604eb82-8efd-46cd-8b15-90fc637eff0c@intel.com>
Date: Thu, 26 Oct 2023 14:44:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <PH0PR12MB54819C3A4BC9BB419715AB73DCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f2707430-bb1e-4dcd-b0b3-2b9a705e555a@intel.com>
 <PH0PR12MB5481033BB7C0BCABAE329B13DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f9a604b2-7bc9-49ce-bd28-59909f0a5fec@intel.com>
 <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 10/24/2023 6:37 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Tuesday, October 24, 2023 4:00 PM
>>
>> On 10/23/2023 6:14 PM, Parav Pandit wrote:
>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>> Sent: Monday, October 23, 2023 3:39 PM
>>>>
>>>> On 10/20/2023 8:54 PM, Parav Pandit wrote:
>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>> Sent: Friday, October 20, 2023 3:01 PM
>>>>>>
>>>>>> On 10/19/2023 6:33 PM, Parav Pandit wrote:
>>>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>>>> Sent: Thursday, October 19, 2023 2:48 PM
>>>>>>>>
>>>>>>>> On 10/19/2023 5:14 PM, Michael S. Tsirkin wrote:
>>>>>>>>> On Thu, Oct 19, 2023 at 09:13:16AM +0000, Parav Pandit wrote:
>>>>>>>>>>> Oh, really? Quite interesting, do you want to move all config
>>>>>>>>>>> space fields in VF to admin vq? Have a plan?
>>>>>>>>>> Not in my plan for spec 1.4 time frame.
>>>>>>>>>> I do not want to divert the discussion, would like to focus on
>>>>>>>>>> device
>>>>>>>> migration phases.
>>>>>>>>>> Lets please discuss in some other dedicated thread.
>>>>>>>>> Possibly, if there's a way to send admin commands to vf itself
>>>>>>>>> then Lingshan will be happy?
>>>>>>>> still need to prove why admin commands are better than registers.
>>>>>>> Virtio spec development is not proof based approach. Please stop
>>>>>>> asking for
>>>> it.
>>>>>>> I tried my best to have technical answer in [1].
>>>>>>> I explained that registers simply do not work for passthrough mode
>>>>>>> (if this is what you are asking when you are asking prove its better).
>>>>>>> They can work for non_passthrough mediated mode.
>>>>>>>
>>>>>>> A member device may do admin commands using registers. Michael and
>>>>>>> I are
>>>>>> discussing presently in the same thread.
>>>>>>> Since there are multiple things to be done for device migration,
>>>>>>> dedicated
>>>>>> register set for each functionality do not scale well, hard to
>>>>>> maintain and extend.
>>>>>>> A register holding a command content make sense.
>>>>>>>
>>>>>>> Now, with that, if this can be useful only for non_passthrough, I
>>>>>>> made humble
>>>>>> request to transport them using AQ, this way, you get all benefits of AQ.
>>>>>>> And trying to understand, why AQ cannot possible or inferior?
>>>>>>>
>>>>>>> If you have commands like suspend/resume device, register or queue
>>>>>> transport simply don’t work, because it's wrong to bifurcate the
>>>>>> device with such weird API.
>>>>>>> If you want to biferacate for mediation software, it probably
>>>>>>> makes sense to
>>>>>> operate at each VQ level, config space level. Such are very
>>>>>> different commands than passthrough.
>>>>>>> I think vdpa has demonstrated that very well on how to do specific
>>>>>>> work for
>>>>>> specific device type. So some of those work can be done using AQ.
>>>>>>> [1]
>>>>>>> https://lore.kernel.org/virtio-comment/870ace02-f99c-4582-932f-bd1
>>>>>>> 03
>>>>>>> 36
>>>>>>> 2dae9@intel.com/T/#m37743aa924536d0256d6b3b8e83a11c750f28794
>>>>>> We have been through your statement for many times.
>>>>>> This is not about how many times you repeated, if you think this is
>>>>>> true, you need to prove that with solid evidence.
>>>>>>
>>>>> I will not respond to this comment anymore.
>>>> Ok if you choose not to respond.
>>>>>> For pass-through, I still recommend you to take a reference of
>>>>>> current virito-pci implementation, it works for pass-through, right?
>>>>> What do you mean by current virtio-pci implementation?
>>>> current virito-pci works for pass-through
>>> I still don’t understand what is "current virtio-pci".
>>> Do you mean qemu implementation of emulated virtio-pci or you mean
>> virtio-pci specification for passthrough?
>>> What do you want me to refer to for passthrough? Please clarify.
>> you know guest vcpu and its vRC can not access host side devices, and there
>> must be a driver helping the pass-through use cases, like vDPA and vfio
> I am not sure how to corelate this answer to the question of "virtio-pci for passthrough".
> :(
>
> Today when a virtio-pci member device is passthrough to the guest VM, hypervisor is not involved in virtio interface such as config space, cvq, data vq etc.
> Do you agree?
Can vCPU access host side device config space? It needs a pass-through 
helper driver like vfio, right?
>
>>>>>> For scale, I already told you for many times that they are
>>>>>> per-device facilities. How can a per-device facility not scale?
>>>>> Each VF device must implement new set of on-chip memory-based
>>>>> registers
>>>> which demands more power, die area which does not scale efficiently
>>>> to thousands of VFs.
>>>> that can be fpga gates or SOC implementing new features, you think
>>>> that is a waste?
>>> It is waste in hw, if there is a better approach possible to not burn them as
>> gates and save on resources for rarely used items.
>> Is a new entry in MSIX table a waste of HW?
> Not as must as existing MSI-X table entries which requires linear amount of on-chip memory.
anyway, even only one MSIX entry cost my HW resource than the amount of 
new registers in my proposal.
>
>> Can I say implementing admin vq in SOC is a waste of cores?
> Which cores in the SoC?
> If it is on the PF, there is only handful of AQs for scale of N VFs.
I see you got the point anyway, new features cost extra resource
>
>>>
>>>>>> vDPA works fine on config space.
>>>>>>
>>>>>> So, if you still insist admin vq is better than config space like
>>>>>> in other thread you have concluded, you may imply that config space
>>>>>> interfaces should be re-factored to admin vq.
>>>>> Whatever is done in past is done, there is no way to change history.
>>>>> An new non init time registers should not be placed in device
>>>>> specific config
>>>> space as virtio spec has clear guideline on it for good.
>>>>> Device context reading, dirty page address reading, changing vf
>>>>> device modes,
>>>> all of these are clearly not a init time settings.
>>>>> Hence, they do not belong to the registers.
>>>> reset vq? and you get it from Appendix B. Creating New Device Types,
>>>> are we implementing a new type of device???
>>> I don’t understand your question.
>>> I replied the history of reset_vq.
>>> Take good examples to follow, reset_vq clearly is not the one.
>> so again, we are not implementing new device type, so your citation doesn't
>> apply.
> I disagree.
> I am engineer to build practical systems considering limitations and also advancements of the transport; while listening to other industry efforts,
> I am no from legal department.
> Hence, Appendix B makes a sense to me to apply to the existing device which also has the section for "device improvements".
it titled as "new device", and I think this discussion is non-sense. So 
if you want to fix this statement, works for me.


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

