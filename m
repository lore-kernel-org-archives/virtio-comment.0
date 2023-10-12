Return-Path: <virtio-comment-return-7678-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B95CDB46E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:21:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E4793D93E7
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:21:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CE3AF98680A
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:21:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BA719986474; Thu, 12 Oct 2023 10:21:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AB79C98660E
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 10:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364252712"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="364252712"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870524708"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="870524708"
Message-ID: <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
Date: Thu, 12 Oct 2023 18:21:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration



On 10/11/2023 7:43 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Wednesday, October 11, 2023 3:55 PM
>>>>>>> I don’t have any strong opinion to keep it or remove it as most
>>>>>>> stakeholders
>>>>>> has the clear view of requirements now.
>>>>>>> Let me know.
>>>>>> So some people use VFs with VFIO. Hence the module name.  This
>>>>>> sentence by itself seems to have zero value for the spec. Just drop it.
>>>>> Ok. Will drop.
>>>> So why not build your admin vq live migration on our config space
>>>> solution, get out of the troubles, to make your life easier?
>>>>
>>> Your this question is completely unrelated to this reply or you misunderstood
>> what dropping commit log means.
>> if you can rebase admin vq LM on our basic facilities, I think you dont need to
>> talk about vfio in the first place, so I ask you to re-consider Jason's proposal.
> I don’t really know why you are upset with the vfio term.
> It is the use case of the cloud operator and it is listed to indicate how proposal fits in a such use case.
> If for some reason, you don’t like vfio, fine. Ignore it and move on.
>
> I already answered that I will remove from the commit log, because the requirements are well understood now by the committee.
>
> Your comment is again unrelated (repeated) to your past two questions.
>
> I explained you the technical problem that admin command (not admin VQ) of basic facilities cannot be done using config registers without any mediation layer.
OK, I pop-ed Jason's proposal to make everything easier, and I see it is 
refused.
>
>>> Dropping link to vfio does not drop the requirement.
>>> I am ok to drop because requirements are clear of passthrough of member
>> device.
>>> Vfio is not a trouble at all.
>>> Admin command is not a trouble either.
>>>
>>> The pure technical reason is: all the functionalities proposed cannot be done
>> in any other existing way.
>>> Why? For below reasons.
>>> 1. device context, and write records (aka dirty page addresses) is
>>> huge which cannot be shared using config registers at scale of 4000
>>> member devices
>> dirty page tracking will be implmemented in V2, actually I have the patch right
>> now.
> That is yet again the invitation to non_colloboration mode.
> Without reviewing, v0 and v1, you want to show dirty page tracking in some other way.
>
> But ok, that is your non_coperative mode of working. Cannot help further.
I believe both me and Jason have proposed a solution, I see it is rejected.
But don't take it personal and please keep professional.
>
>> inflight descriptor tracking will be implemented by Eugenio in V2.
> When we have near complete proposal from two device vendors, you want to push something to unknown future without reviewing the work;
> does not make sense.
Didn't I ever provide feedback to you? Really?
>
> You are still in the mode of _take_ what we did with near zero explanation.
> You asked question of why passthrough proposal cannot advantage of in_band config registers.
> I explained technical reason listed here.
I have answered the questions, and asked questions for many times.
What do you mean by "why passthrough proposal cannot advantage of 
in_band config registers."?
Config space work for passthrough for sure.
>
> So please don’t jump to conclusions before finishing the discussion on how both side can take advantage of each other.
>
> Lets please do that.
We have proposed a solution, right?

I still need to point out: admin vq LM does not work, one example is nested.
>
>> There are no scale problem as I repeated for many time, they are per-device
>> basic facilities, just migrate the VF by its own facility, so there are no 40000
>> member devices, this is not per PF.
>>
> I explained that device reset, flr etc flow cannot work when controlling and controlled functions are single entity for passthrough mode.
> The scale problem is, one needs to duplicate the registers on each VF.
> The industry is moving away from the register interface in many _real_ hw devices implementation.
> Some of the examples are IMS, SIOV, NVMe and more.
we have discussed this for many times, please refer to previous threads, 
even with Jason.
>
>> The device context can be read from config space or trapped, like shadow
> There are 1 million flows of the net device flow filters in progress.
> Each flow is 64B in size.
> Total size is 64MB.
> I don’t see how one can read such amount of memory using config registers.
control vq?
Or do you want to migrate non-virtio context?
That is out of spec
>
>> control vq which is already done, that is basic virtualization.
> There is nothing like "basic virtualization".
> What is proposed here is fulfilling the requirement of passthrough mode.
>
> Your comment is implying, "I don’t care for passthrough requirements, do non_passthrough".
that is your understanding, and you misunderstood it. Config space 
servers passthrough for many years.
>
> The discussion should be,
> How can we leverage common framework for passthrough and mediated mode?
> Can we? If so, which are the pieces?
config space is a common framework, right?
>
> For me it is frankly very weird to take native virtio member device, convert into a medicated device using a giant software, and after that convolution get virtio device.
> But for nested case you have the use case.
> So if we focus positively on how two use cases can use some common functionality, that will be great.
why config space need a giant sw to work?

So both Jason and I suggest you build admin vq solution based on our 
basic facilities.
>
>> If you want to migrate device context, you need to specify device context for
>> every type of device, net maybe easy, how do you see virtio-fs?
> Virtio-fs will have its on device context too.
> Every device has some sort of backend in varied degree.
> Net being widely used and moderate complex device.
> Fs being slightly stateful but less complex than net, as it has far less control operations.
so, do you say you have implement a live migration solution which can 
migrate device context,
but only work for net or block?

Then you should call it virtio net/blk migration and implement in 
net/block section.
> In fact virtio-fs device already discusses the migrating the device side state, as listed in device context.
> So virtio-fs device will have its own device-context defined.
if you want to migrate it, you need to define it
>
> The infrastructure and basic facilities are setup in this series, that one can easily extend for all the current and new device types.
really? how?
>
>> And we are migrating stateless devices, or no? How do you migrate virtio-fs?
>>> 2. sharing such large context and write addresses in parallel for
>>> multiple devices cannot be done using single register file
>> see above
>>> 3. These registers cannot be residing in the VF because VF can undergo
>>> FLR, and device reset which must clear these registers
>> do you mean you want to audit all PCI features? When FLR, the device is rested,
>> do you expect a device remember anything after FLR?
> Not at all. VF member device will not remember anything after FLR.
>> Do you want to trap FLR? Why?
> This proposal does _not_ want to trap the FLR in the hypervisor virtio driver.
>
> When one does the mediation-based design, it must trap/emulate/fake the FLR.
> It helps to address the case of nested as you mentioned.
once passthrough, the guest driver can access the config space to reset 
the device, right?
>> Why FLR block or conflict with live migration?
> It does not block or conflict.
OK, cool, so let's make this a conclusion
>
> The whole point is, when you put live migration functionality on the VF itself, you just cannot FLR this device.
> One must trap the FLR and do fake FLR and build the whole infrastructure to not FLR The device.
> Above is not passthrough device.
No, the guest can reset the device, even causing a failed live migration.
>
>>> 4. When VF does the DMA, all dma occurs in the guest address space, not in
>> hypervisor space; any flr and device reset must stop such dma.
>>> And device reset and flr are controlled by the guest (not mediated by
>> hypervisor).
>> if the guest reset the device, it is totally reasonable operation, and the guest
>> own the risk, right?
> Sure, but the guest still expects its dirty pages and device context to be migrated across device_reset.
> Device_reset will lose all this information within the device if done without mediation and special care.
No, if the guest reset a device, that means the device should be RESET, 
to forget its config,
that would be really wired to migrate a fresh device at the source side, 
to be a running device at the destination side.
>
> So, to avoid that now one needs to have fake device reset too and build that infrastructure to not reset.
>
> The passthrough proposal fundamental concept is:
>
> all the native virtio functionalities are between guest driver and the actual device.
see above.
>
>> and still, do you want to audit every PCI features? at least you didn't do that in
>> your series.
> Can you please list which PCI features audit you are talking about?
you audit FLR, then do you want to check everyone?
If no, how to decide which one should be audited, why others not?
>
> Keep in mind, that will all the mediation, one now must equally audit all this giant software stack too.
> So maybe it is fine for those who are ok with it.
so you agree FLR is not a problem, at least for config space solution?
>
>> For migration, you know the hypervisor takes the ownership of the device in the
>> stop_window.
> I do not know what stop_window means.
> Do you mean stop_copy of vfio or it is qemu term?
when guest freeze.
>
>>> 5. Any PASID to separate out admin vq on the VF does not work for two
>> reasons.
>>> R_1: device flr and device reset must stop all the dmas.
>>> R_2: PASID by most leading vendors is still not mature enough
>>> R_3: One also needs to do inversion to not expose PASID capability of
>>> the member PCI device to not expose
>> see above and what if guest shutdown? the same answer, right?
> Not sure, I follow.
> If the guest shutdown, the guest specific shutdown APIs are called.
>
> With passthrough device, R_1 just works as is.
> R_3 is not needed as they are directly given to the guest.
> R_2 platform dependency is not needed either.
I think we already have a concussion for FLR.
For PASID, what blocks the solution?
>
>>>> Actually you don't see any technical problems in our config space
>>>> proposal, right?
>>> In config registers method, for passthrough I clearly see the technical
>> problems (functional and scale) listed above.
>>> Due to which config registers cannot reside on the VF and cannot scale either.
>> so see above answers.


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

