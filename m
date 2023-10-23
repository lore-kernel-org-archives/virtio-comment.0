Return-Path: <virtio-comment-return-7900-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC92DC001E0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:09:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 19358941EA
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:09:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ED27D986674
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:09:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D40C5986669; Mon, 23 Oct 2023 10:09:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C3B5098666A
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 10:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="377180995"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="377180995"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="707894315"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="707894315"
Message-ID: <f2707430-bb1e-4dcd-b0b3-2b9a705e555a@intel.com>
Date: Mon, 23 Oct 2023 18:09:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
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
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54819C3A4BC9BB419715AB73DCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 10/20/2023 8:54 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Friday, October 20, 2023 3:01 PM
>>
>> On 10/19/2023 6:33 PM, Parav Pandit wrote:
>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>> Sent: Thursday, October 19, 2023 2:48 PM
>>>>
>>>> On 10/19/2023 5:14 PM, Michael S. Tsirkin wrote:
>>>>> On Thu, Oct 19, 2023 at 09:13:16AM +0000, Parav Pandit wrote:
>>>>>>> Oh, really? Quite interesting, do you want to move all config
>>>>>>> space fields in VF to admin vq? Have a plan?
>>>>>> Not in my plan for spec 1.4 time frame.
>>>>>> I do not want to divert the discussion, would like to focus on
>>>>>> device
>>>> migration phases.
>>>>>> Lets please discuss in some other dedicated thread.
>>>>> Possibly, if there's a way to send admin commands to vf itself then
>>>>> Lingshan will be happy?
>>>> still need to prove why admin commands are better than registers.
>>> Virtio spec development is not proof based approach. Please stop asking for it.
>>>
>>> I tried my best to have technical answer in [1].
>>> I explained that registers simply do not work for passthrough mode (if
>>> this is what you are asking when you are asking prove its better).
>>> They can work for non_passthrough mediated mode.
>>>
>>> A member device may do admin commands using registers. Michael and I are
>> discussing presently in the same thread.
>>> Since there are multiple things to be done for device migration, dedicated
>> register set for each functionality do not scale well, hard to maintain and
>> extend.
>>> A register holding a command content make sense.
>>>
>>> Now, with that, if this can be useful only for non_passthrough, I made humble
>> request to transport them using AQ, this way, you get all benefits of AQ.
>>> And trying to understand, why AQ cannot possible or inferior?
>>>
>>> If you have commands like suspend/resume device, register or queue
>> transport simply don’t work, because it's wrong to bifurcate the device with
>> such weird API.
>>> If you want to biferacate for mediation software, it probably makes sense to
>> operate at each VQ level, config space level. Such are very different commands
>> than passthrough.
>>> I think vdpa has demonstrated that very well on how to do specific work for
>> specific device type. So some of those work can be done using AQ.
>>> [1]
>>> https://lore.kernel.org/virtio-comment/870ace02-f99c-4582-932f-bd10336
>>> 2dae9@intel.com/T/#m37743aa924536d0256d6b3b8e83a11c750f28794
>> We have been through your statement for many times.
>> This is not about how many times you repeated, if you think this is true, you
>> need to prove that with solid evidence.
>>
> I will not respond to this comment anymore.
Ok if you choose not to respond.
>
>> For pass-through, I still recommend you to take a reference of current
>> virito-pci implementation, it works for pass-through, right?
> What do you mean by current virtio-pci implementation?
current virito-pci works for pass-through
>
>> For scale, I already told you for many times that they are per-device
>> facilities. How can a per-device facility not scale?
> Each VF device must implement new set of on-chip memory-based registers which demands more power, die area which does not scale efficiently to thousands of VFs.
that can be fpga gates or SOC implementing new features, you think that 
is a waste?
>
>> vDPA works fine on config space.
>>
>> So, if you still insist admin vq is better than config space like in
>> other thread you have concluded, you may imply that config space
>> interfaces should be re-factored to admin vq.
> Whatever is done in past is done, there is no way to change history.
> An new non init time registers should not be placed in device specific config space as virtio spec has clear guideline on it for good.
> Device context reading, dirty page address reading, changing vf device modes, all of these are clearly not a init time settings.
> Hence, they do not belong to the registers.
reset vq? and you get it from Appendix B. Creating New Device Types, are 
we implementing a new type of device???


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

