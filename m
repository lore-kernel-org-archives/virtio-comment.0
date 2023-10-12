Return-Path: <virtio-comment-return-7674-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA74CDB482
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:00:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 66CC0799A6
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:00:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5DA53986837
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:00:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 54CFA986474; Thu, 12 Oct 2023 10:00:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 46F4F98660E
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 10:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="383744936"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="383744936"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="783636798"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="783636798"
Message-ID: <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
Date: Thu, 12 Oct 2023 18:00:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
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
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 10/11/2023 6:54 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Wednesday, October 11, 2023 3:38 PM
>>
>>>> The system admin can choose only passthrough some of the devices for
>>>> nested guests, so passthrough the PF to L1 guest is not a good idea,
>>>> because there can be many devices still work for the host or L1.
>>> Possible. One size does not fit all.
>>> What I expressed is most common scenarios that user care about.
>> don't block existing usecases, don't break the userspace, nested is common.
> Nothing is broken as virtio spec do not have any single construct to support migration.
> If nested is common, can you share the performance number with real virtio device with/without 2 level nesting?
> I frankly don’t know how they look like.
virtio devices support nested, I mean don't break this usecase
And end user accept performance overhead in nested, this is not related 
to this topic.

>
>>>>> In second use case, where one want to bind only one member device to
>>>>> one VM, I think same plumbing can be extended to have another VF, to
>>>>> take
>>>> the role of migration device instead of owner device.
>>>>> I don’t see a good way to passthrough and also do in-band migration
>>>>> without
>>>> lot of device specific trap and emulation.
>>>>> I also don’t know the cpu performance numbers with 3 levels of
>>>>> nested page
>>>> table translation which to my understanding cannot be accelerated by
>>>> the current cpu.
>>>> host_PA->L1_QEMU_VA->L1_Guest_PA->L1_QEMU_VA->L2_Guest_PA and so
>> on,
>>>> there can be performance overhead, but can be done.
>>>>
>>>> So admin vq migration still don't work for nested, this is surely a blocker.
>>> In specific case of member devices are located at different nest level, it does
>> not.
>> so you got the point, so this series should not be merged.
>>> Why prevents you have a peer VF do the role of migration driver?
>>> Basically, what I am proposing is, connect two VFs to the L1 guest. One VF is
>> migration driver, one VF is passthrough to L2 guest.
>>> And same scheme works.
>> A peer VF? A management VF? still break the existing usecase. and how do you
>> transfer ownership of L2 VF from PF to L1 VF?
> A peer management VF which services admin command (like PF).
> Ownership of admin command is delegated to the management VF.
interesting, do you plan to cook a patch implementing this?
Really make sense?

How do you transfer the ownership?
How to you maintain a different group?
How do you isolate the groups?
How to you keep the guest or host secure?
How do you manage the overlaps?
How do you implement the hardware support that?
How do you change the PCI routing?
>
>>> On the other hand,
>>> Many parts of the cpu subsystem such as PML, page tables do not have N
>> level nesting support either.
>> page tables could be emulated, as showed to you before, just PA to VA, nested
>> PA to nested VA
>>> They all work on top of emulation and pay the price for emulation when
>> nesting is done.
>>> May be that is the first version for virtio too.
>> there are performance overhead, but can be done.
>>> I frankly feel that nesting support requires industry level eco system support
>> not just in virtio.
>>> Virtio attempting to focus on nested and having nearly same level
>> performance as bare metal seems farfetched.
>>> Maybe I am wrong, as we have not seen such high perf nested env even with
>> sw based device.
>>> What can be possibly done is,
>>> 1. What admin commands are useful from this series that can be useful for
>> nesting?
>>> 2. What admin commands from current series needs extension for nesting?
>>> 3. What admin commands do not work at all for nesting, and hence, need to
>> have new commands.
>>> If we can focus on those, maybe we can find common approach that cater to
>> both commands.
>> virtio support nested now, dont let your admin vq LM break this.
> New spec addition is not breaking existing virtio implementation in sw.
don't break nested, again.
> New spec additions of owner and member devices do not apply to non member and non owner devices.
if so, no member no owner, so no admin vq? then this proposal doesn't 
make any sense?
>
>>>>> Do you know how does it work for Intel x86_64?
>>>>> Can it do > 2 level of nested page tables? If no, what is the perf
>>>>> characteristics
>>>> to expect?
>>>> of course that can be done, Page table is not a problem, there are
>>>> soft mmu emulation and viommu, through performance overhead.
>>> Due to the performance overheads, I really doubt any cloud operator would
>> use passthrough virtio device for any sensible workload.
>>> But you may know already how nested performance looks like that may be
>> acceptable to users.
>> Many tenants run their nested cluster. Don't break this.
> How new spec addition such as crypto device addition broke net device?
> Or how net vq interrupt moderation breaks existing sw?
> It does not.
> They are driven through their own feature bits and admin command capabilities.
> It does not break any existing deployments.
we are talking about nested, don't break nested


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

