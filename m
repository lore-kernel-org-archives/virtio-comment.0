Return-Path: <virtio-comment-return-7897-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7FACDB474
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 09:48:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AC20079100
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 09:48:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 92C96986677
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 09:48:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 79289986669; Mon, 23 Oct 2023 09:48:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6814998666A
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 09:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="451024988"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="451024988"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="793074860"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="793074860"
Message-ID: <b9ac0893-be30-41d9-8898-2a60e8e909aa@intel.com>
Date: Mon, 23 Oct 2023 17:48:15 +0800
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
References: <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
 <PH0PR12MB54813F96D29B2D2ACEADD62ADCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54813F96D29B2D2ACEADD62ADCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 10/20/2023 8:47 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Friday, October 20, 2023 4:42 PM
>>
>> On 10/20/2023 5:41 PM, Michael S. Tsirkin wrote:
>>> On Fri, Oct 20, 2023 at 05:31:01PM +0800, Zhu, Lingshan wrote:
>>>> On 10/19/2023 6:33 PM, Parav Pandit wrote:
>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>> Sent: Thursday, October 19, 2023 2:48 PM
>>>>>>
>>>>>> On 10/19/2023 5:14 PM, Michael S. Tsirkin wrote:
>>>>>>> On Thu, Oct 19, 2023 at 09:13:16AM +0000, Parav Pandit wrote:
>>>>>>>>> Oh, really? Quite interesting, do you want to move all config
>>>>>>>>> space fields in VF to admin vq? Have a plan?
>>>>>>>> Not in my plan for spec 1.4 time frame.
>>>>>>>> I do not want to divert the discussion, would like to focus on
>>>>>>>> device
>>>>>> migration phases.
>>>>>>>> Lets please discuss in some other dedicated thread.
>>>>>>> Possibly, if there's a way to send admin commands to vf itself
>>>>>>> then Lingshan will be happy?
>>>>>> still need to prove why admin commands are better than registers.
>>>>> Virtio spec development is not proof based approach. Please stop asking for
>> it.
>>>>> I tried my best to have technical answer in [1].
>>>>> I explained that registers simply do not work for passthrough mode
>>>>> (if this is what you are asking when you are asking prove its better).
>>>>> They can work for non_passthrough mediated mode.
>>>>>
>>>>> A member device may do admin commands using registers. Michael and I
>> are discussing presently in the same thread.
>>>>> Since there are multiple things to be done for device migration, dedicated
>> register set for each functionality do not scale well, hard to maintain and
>> extend.
>>>>> A register holding a command content make sense.
>>>>>
>>>>> Now, with that, if this can be useful only for non_passthrough, I made
>> humble request to transport them using AQ, this way, you get all benefits of AQ.
>>>>> And trying to understand, why AQ cannot possible or inferior?
>>>>>
>>>>> If you have commands like suspend/resume device, register or queue
>> transport simply don’t work, because it's wrong to bifurcate the device with
>> such weird API.
>>>>> If you want to biferacate for mediation software, it probably makes sense to
>> operate at each VQ level, config space level. Such are very different commands
>> than passthrough.
>>>>> I think vdpa has demonstrated that very well on how to do specific work for
>> specific device type. So some of those work can be done using AQ.
>>>>> [1]
>>>>> https://lore.kernel.org/virtio-comment/870ace02-f99c-4582-932f-bd103
>>>>> 362dae9@intel.com/T/#m37743aa924536d0256d6b3b8e83a11c750f28794
>>>> We have been through your statement for many times.
>>>> This is not about how many times you repeated, if you think this is
>>>> true, you need to prove that with solid evidence.
>>>>
>>>>
>>>> For pass-through, I still recommend you to take a reference of
>>>> current virito-pci implementation, it works for pass-through, right?
>>> Current migration implementation in e.g. QEMU? It does but it traps
>>> data path accesses. That, I think we can agree, should not be the only
>>> option to migrate.
>> OK, I am glad we agree that config space work for pass-through, hope we don't
>> need to discuss this anymore.
>>>> For scale, I already told you for many times that they are per-device
>>>> facilities. How can a per-device facility not scale?
>>>> vDPA works fine on config space.
>>>>
>>>> So, if you still insist admin vq is better than config space like in
>>>> other thread you have concluded, you may imply that config space
>>>> interfaces should be re-factored to admin vq.
>>> There are good arguments that yes, virtio needs a transport for config
>>> space that is DMA based as opposed to memory mapped based.  This is
>>> one of the things all vendors seem to prefer in IDPF so virtio should have the
>> option.
>> Do you really want to refactor virtio-pci common config fields to PF's admin vq?
>> E.g, do you really want to move queue_enable in virtio-pci common config
>> fields to PF's admin vq?
>>
> No. Please read the response carefully.
> I said 'For non-backward compatible SIOV device of the future, yes, virtio-pci common config (non init registers) should be moved to a vq, located on the member device directly.'
> Notice the 'member device directly'.
> Not the PF admin vq.
I think this is a question to Michael and he answered.

We are talking about PCI, not SIOV, for SIOV we need transport vq.

Here again, we are introducing basic facilities for live migration, and 
the implementation is transport-specific.
>
>> Config space is control path, DMA is data-path, let's better not mix them, we
>> never expect to use config space to transfer data.
>>
> And that control path is only for the init time configuration as correctly listed in the virtio spec as,
>
> " Device configuration space should only be used for initialization-time parameters.".
don't you know new field reset_vq is introduced to virtio common cfg? 
This is not only for initialization, right?

and your citation is from Appendix B. Creating New Device Types, are we 
creating a new device type?
>
>> So we need DMA to transfer data, for example I take advantages of device DMA
>> to logging dirty pages, This also applies to in-flight descriptors.
>>
> Can you please explain via virtqueue cannot be used for DMA bulk data transfer as listed in virtio spec.
>
> " The mechanism for bulk data transport on virtio devices is pretentiously called a virtqueue"
what is your point? vq can do DMA, so what?


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

