Return-Path: <virtio-comment-return-7709-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F314ECDB47E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 10:23:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 436CC7BAEE
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 10:23:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 271A0986841
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 10:23:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0F1589865D9; Fri, 13 Oct 2023 10:23:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F2F45986837
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 10:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="389007522"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="389007522"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001880406"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="1001880406"
Message-ID: <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
Date: Fri, 13 Oct 2023 17:44:27 +0800
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
 <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com>
 <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 10/12/2023 7:37 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Thursday, October 12, 2023 4:40 PM
>> On 10/12/2023 6:09 PM, Parav Pandit wrote:
>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>> Sent: Thursday, October 12, 2023 3:30 PM
>>>>
>>>> On 10/11/2023 6:54 PM, Parav Pandit wrote:
>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>> Sent: Wednesday, October 11, 2023 3:38 PM
>>>>>>
>>>>>>>> The system admin can choose only passthrough some of the devices
>>>>>>>> for nested guests, so passthrough the PF to L1 guest is not a
>>>>>>>> good idea, because there can be many devices still work for the host or
>> L1.
>>>>>>> Possible. One size does not fit all.
>>>>>>> What I expressed is most common scenarios that user care about.
>>>>>> don't block existing usecases, don't break the userspace, nested is
>> common.
>>>>> Nothing is broken as virtio spec do not have any single construct to
>>>>> support
>>>> migration.
>>>>> If nested is common, can you share the performance number with real
>>>>> virtio
>>>> device with/without 2 level nesting?
>>>>> I frankly don’t know how they look like.
>>>> virtio devices support nested, I mean don't break this usecase And
>>>> end user accept performance overhead in nested, this is not related to this
>> topic.
>>> Can you show an example of virtio device nesting and live migration already
>> supported where the device has _done_ the live migration.
>>> Due to which you claim that new feature of admin command-based owner
>> and member device breaks something?
>> current virito/kvm/qemu support nested.
> Sure, two of the 3 components are not part of the virtio spec.
> Hence, they are not broken.
you want virtio work for them right? don't break this.
>
>>> Please don’t use the verb "break".
>>> Your proposal is the first of its kind that supports migrating nested device.
>>> This is why new patches of config register or admin command does not break
>> anything existing.
>> if your proposal don't support nested, you break nested use cases.
>>>>>>>>> In second use case, where one want to bind only one member
>>>>>>>>> device to one VM, I think same plumbing can be extended to have
>>>>>>>>> another VF, to take
>>>>>>>> the role of migration device instead of owner device.
>>>>>>>>> I don’t see a good way to passthrough and also do in-band
>>>>>>>>> migration without
>>>>>>>> lot of device specific trap and emulation.
>>>>>>>>> I also don’t know the cpu performance numbers with 3 levels of
>>>>>>>>> nested page
>>>>>>>> table translation which to my understanding cannot be accelerated
>>>>>>>> by the current cpu.
>>>>>>>> host_PA->L1_QEMU_VA->L1_Guest_PA->L1_QEMU_VA->L2_Guest_PA
>> and
>>>> so
>>>>>> on,
>>>>>>>> there can be performance overhead, but can be done.
>>>>>>>>
>>>>>>>> So admin vq migration still don't work for nested, this is surely a
>> blocker.
>>>>>>> In specific case of member devices are located at different nest
>>>>>>> level, it does
>>>>>> not.
>>>>>> so you got the point, so this series should not be merged.
>>>>>>> Why prevents you have a peer VF do the role of migration driver?
>>>>>>> Basically, what I am proposing is, connect two VFs to the L1 guest.
>>>>>>> One VF is
>>>>>> migration driver, one VF is passthrough to L2 guest.
>>>>>>> And same scheme works.
>>>>>> A peer VF? A management VF? still break the existing usecase. and
>>>>>> how do you transfer ownership of L2 VF from PF to L1 VF?
>>>>> A peer management VF which services admin command (like PF).
>>>>> Ownership of admin command is delegated to the management VF.
>>>> interesting, do you plan to cook a patch implementing this?
>>> No. I am hoping that you can help to draft those patches for nested case to
>> work when one wants to hand of single VM to single nested guest VM.
>>> I will not be able to test any of nested things and show its performance value
>> either, as I don’t see how rest of the eco system can match up for the nested.
>>> Hence, your expertise in drafting extension for nested is desired.
> Answer to your below question of patch drafting is here. If you can help to extend it will be good.
where are the draft patch?
>
>>>> Really make sense?
>>>>
>>>> How do you transfer the ownership?
>>> An additional ownership deletgation by a new admin command.
>> if you think this can work, do you want to cook a patch to implement this before
>> you submitting this live migration series?
> I answered this already above.
talk is cheap, show me your patch
>
>>>> How to you maintain a different group?
>>> One to one assignment.
>> same as above
>>>> How do you isolate the groups?
>>> Not sure, what it means. The explicit group is created and VFs are placed in
>> this group.
>> VF resource are on PF, right?
> Which resource?
> Before jumping to resource, may be you want to answer "group isolation"?
>
>>>> How to you keep the guest or host secure?
>>> Please be specific. Its very broad question when it comes to defining the
>> interface.
>> without isolation, can be attacked?
> What isolation are you talking about?
> I am suggesting that one VF as dummy PF is given the role of admin commands.
>
>>>> How do you manage the overlaps?
>>> Overlaps between?
>> host pf and L1 VF
> L1 VF works at it own level.
> Host PF works at its own level.
> This is the true nesting.
>
>>>> How do you implement the hardware support that?
>>> Please consult your board designers. Hard to say how to implement something
>> in generic.
>> so you don't have an idea
> :)
> Right, I do not have idea for Intel boards.
> I was suggesting a management VF that can service the admin commands.
>
>>>> How do you change the PCI routing?
>>> Why anything to be changed in PCI routing?
>> do you place PF and mangement VF in an ACL group?
> ACL group at which layer?
>
>> Do does L1 management VF's member device belong to the PF physically?
> Yes.
Answer all questions above, if you think a management VF can work,
please show me your patch.
>>>>> It does not break any existing deployments.
>>>> we are talking about nested, don't break nested
>>> Virtio spec for nested is not defined yet. Hence nothing is broken. Please avoid
>> using the verb, _break_.
>> virtio nested works for many years
> I replied: your break comment is not applicable to virtio_spec, nor does it apply to any existing software you listed.
>
> As Michael said, software based nesting is used..
> See if actual hw based devices can implement it or not. Many components of cpu cannot do N level nesting either, but may be virtio can.
> I don’t know how yet.
two facts:
1. virito works for nested for years
2. your admin vq lm solution does not work for nested


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

