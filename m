Return-Path: <virtio-comment-return-7707-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9EDCDB483
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 09:06:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 10F65749E9
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 09:06:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E8FD398683E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 09:06:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D0DB9986835; Fri, 13 Oct 2023 09:06:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BE671986836
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 09:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="365399428"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="365399428"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1086063000"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="1086063000"
Message-ID: <4a8bf09e-9aa3-4aec-a20e-8c92f3da3d3c@intel.com>
Date: Fri, 13 Oct 2023 17:06:02 +0800
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
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration



On 10/12/2023 6:58 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Thursday, October 12, 2023 3:51 PM
>>
>> On 10/11/2023 7:43 PM, Parav Pandit wrote:
>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>> Sent: Wednesday, October 11, 2023 3:55 PM
>>>>>>>>> I don’t have any strong opinion to keep it or remove it as most
>>>>>>>>> stakeholders
>>>>>>>> has the clear view of requirements now.
>>>>>>>>> Let me know.
>>>>>>>> So some people use VFs with VFIO. Hence the module name.  This
>>>>>>>> sentence by itself seems to have zero value for the spec. Just drop it.
>>>>>>> Ok. Will drop.
>>>>>> So why not build your admin vq live migration on our config space
>>>>>> solution, get out of the troubles, to make your life easier?
>>>>>>
>>>>> Your this question is completely unrelated to this reply or you
>>>>> misunderstood
>>>> what dropping commit log means.
>>>> if you can rebase admin vq LM on our basic facilities, I think you
>>>> dont need to talk about vfio in the first place, so I ask you to re-consider
>> Jason's proposal.
>>> I don’t really know why you are upset with the vfio term.
>>> It is the use case of the cloud operator and it is listed to indicate how proposal
>> fits in a such use case.
>>> If for some reason, you don’t like vfio, fine. Ignore it and move on.
>>>
>>> I already answered that I will remove from the commit log, because the
>> requirements are well understood now by the committee.
>>> Your comment is again unrelated (repeated) to your past two questions.
>>>
>>> I explained you the technical problem that admin command (not admin VQ)
>> of basic facilities cannot be done using config registers without any mediation
>> layer.
>> OK, I pop-ed Jason's proposal to make everything easier, and I see it is refused.
> Because it does not work for passthrough mode.
what are you talking about?
Config space does not work passthrough?
Have you ever tried pass through a virtio device to a guest?
>
>>>>> Dropping link to vfio does not drop the requirement.
>>>>> I am ok to drop because requirements are clear of passthrough of
>>>>> member
>>>> device.
>>>>> Vfio is not a trouble at all.
>>>>> Admin command is not a trouble either.
>>>>>
>>>>> The pure technical reason is: all the functionalities proposed
>>>>> cannot be done
>>>> in any other existing way.
>>>>> Why? For below reasons.
>>>>> 1. device context, and write records (aka dirty page addresses) is
>>>>> huge which cannot be shared using config registers at scale of 4000
>>>>> member devices
>>>> dirty page tracking will be implmemented in V2, actually I have the
>>>> patch right now.
>>> That is yet again the invitation to non_colloboration mode.
>>> Without reviewing, v0 and v1, you want to show dirty page tracking in some
>> other way.
>>> But ok, that is your non_coperative mode of working. Cannot help further.
>> I believe both me and Jason have proposed a solution, I see it is rejected.
>> But don't take it personal and please keep professional.
> Sure, as I explained the config register method do not work for passthrough mode, and does not scale.
Let me repeat again, these live migration facilities are 
per-device(per-VF) facility, so it only migrates itself.

And for pass through, you can try passthrough a virito device to a 
guest, see how the guest initialize the device
through the config space.

That is really basic virtualization, not hard to test.
>
>>>> inflight descriptor tracking will be implemented by Eugenio in V2.
>>> When we have near complete proposal from two device vendors, you want
>>> to push something to unknown future without reviewing the work; does not
>> make sense.
>> Didn't I ever provide feedback to you? Really?
> No. I didn’t see why you need to post a new patch for dirty page tracking, when it is already present in this series.
> I would like to understand and review this aspects.
> Same for the device context.
you will see dirty page tracking in my V2, as I repeated for many times.
For device context, we have discussed this in other threads, did you 
ignored that again?
Hint: how do you define device context for every device type, e.g, 
virtio-fs.
Don't say you only migrate virito-net or blk.
>
>>> You are still in the mode of _take_ what we did with near zero explanation.
>>> You asked question of why passthrough proposal cannot advantage of in_band
>> config registers.
>>> I explained technical reason listed here.
>> I have answered the questions, and asked questions for many times.
>> What do you mean by "why passthrough proposal cannot advantage of in_band
>> config registers."?
>> Config space work for passthrough for sure.
> Config space registers are passthrough the guest VM.
> Hence hypervisor messing it with, programming some address would result in either security issue.
> Or functionally broken, to sustain the functionality, each nested layer needs one copy of these registers for each nest level.
> So they must be trapped somehow.
trap and emulated are basic virtualization.
>
> Secondly I don’t see how one can read 1M flows using config registers.
Not sure what you are talking about, beyond the spec?
>
>>> So please don’t jump to conclusions before finishing the discussion on how
>> both side can take advantage of each other.
>>> Lets please do that.
>> We have proposed a solution, right?
>>
> Which one? To do something in future?
> I don’t see a suggestion on how one can use device context and dirty page tracking for nested and passthrough uniformly.
> I see a technical difficulty in making both work with uniform interface.
Please don't ignore previous answers, don't force us repeat again and again.

It is Jason's proposal. Please refer to previous threads, also for 
device context and dirty pages.
>
>> I still need to point out: admin vq LM does not work, one example is nested.
> As Michael said, please don’t confuse between admin commands and admin vq.
anyway, admin vq live migration don't work for nested.
>
>>>> There are no scale problem as I repeated for many time, they are
>>>> per-device basic facilities, just migrate the VF by its own facility,
>>>> so there are no 40000 member devices, this is not per PF.
>>>>
>>> I explained that device reset, flr etc flow cannot work when controlling and
>> controlled functions are single entity for passthrough mode.
>>> The scale problem is, one needs to duplicate the registers on each VF.
>>> The industry is moving away from the register interface in many _real_ hw
>> devices implementation.
>>> Some of the examples are IMS, SIOV, NVMe and more.
>> we have discussed this for many times, please refer to previous threads, even
>> with Jason.
> I do not agree for any registers to add to the VF which are reset on device_reset and FLR.
> As it does not work for passthrough mode.
Jason has answered your these FLR questions for many times, I don't want 
to repeat his words,
even myself have answered many times. If you keep ignoring the answers, 
and ask again and again,
what is the point?

So please refer to the previous threads.
>
>>>> The device context can be read from config space or trapped, like
>>>> shadow
>>> There are 1 million flows of the net device flow filters in progress.
>>> Each flow is 64B in size.
>>> Total size is 64MB.
>>> I don’t see how one can read such amount of memory using config registers.
>> control vq?
> The control vq and flow filter vqs are owned by the guest driver, not the hypervisor.
> So no, cvq cannot be used.
first, don't cut off the threads, don't delete words, that really 
confusing readers.

And I think you misunderstand a lot of virtualization fundamentals,
at least have a look at how shadow control vq works.

And the parameters set to config vq are also device context as we 
discussed for many times.
>
>> Or do you want to migrate non-virtio context?
> Every thing is virtio device context.
see above
>
>>>> control vq which is already done, that is basic virtualization.
>>> There is nothing like "basic virtualization".
>>> What is proposed here is fulfilling the requirement of passthrough mode.
>>>
>>> Your comment is implying, "I don’t care for passthrough requirements, do
>> non_passthrough".
>> that is your understanding, and you misunderstood it. Config space servers
>> passthrough for many years.
> "Config space servers" ?
> I do not understand it, can you please explain what does that mean?
>
> I do not see your suggestion on how one can implement passthrough member device when passthrough device does the dma and migration framework also need to do the dma.
Try pass through a virtio device to a guest and learn how the guest take 
advantage the config space before you comment.
>
>>> The discussion should be,
>>> How can we leverage common framework for passthrough and mediated
>> mode?
>>> Can we? If so, which are the pieces?
>> config space is a common framework, right?
>>> For me it is frankly very weird to take native virtio member device, convert
>> into a medicated device using a giant software, and after that convolution get
>> virtio device.
>>> But for nested case you have the use case.
>>> So if we focus positively on how two use cases can use some common
>> functionality, that will be great.
>> why config space need a giant sw to work?
> You can count the number of lines of code for existing and rest 30+ devices to see how much does it take.
> Which is still missing some of the code for small downtime.
> And compare it with passthrough driver code.
>
> Regardless, I just don’t see how config registers work.
again, please try pass through a device to a guest. Try to understand 
how config space work.
>
>> So both Jason and I suggest you build admin vq solution based on our basic
>> facilities.
> :)
> That basic facility is missing dirty page tracking, P2P support, device context, FLR, device reset support.
> Hence, it is unusable right now for passthough member device.
> And 6th problemetic thing in it is, it does not scale with member devices.
Please refer to previous discussions, it is meaningless if you keep 
ignoring our answers and keep asking the same
questions.
>
>>>> If you want to migrate device context, you need to specify device
>>>> context for every type of device, net maybe easy, how do you see virtio-fs?
>>> Virtio-fs will have its on device context too.
>>> Every device has some sort of backend in varied degree.
>>> Net being widely used and moderate complex device.
>>> Fs being slightly stateful but less complex than net, as it has far less control
>> operations.
>> so, do you say you have implement a live migration solution which can migrate
>> device context, but only work for net or block?
> I don’t think this question about implementation has any relevance.
> Frankly feels like a court to me. :(
> No. I dint say that.
> We have implemented net, fs, block devices and single framework proposed here can support all 3 and rest 28+.
> The device context part in this series do not cover special/optional things of all the device type.
> This is something I promised to do gradually, once the framework looks good.
If you don't define them, only talking about "migrate the device 
context" but don't tell us what do migrate,
does this make sense to anybody?
>> Then you should call it virtio net/blk migration and implement in net/block
>> section.
> No. you misunderstood. My point was showing orthogonal complexities of net vs fs.
> I likely failed to explain that.
see above, anyway you need to define them, how about starting form 
virito FS?
>
>>> In fact virtio-fs device already discusses the migrating the device side state, as
>> listed in device context.
>>> So virtio-fs device will have its own device-context defined.
>> if you want to migrate it, you need to define it
> Sure.
> Only device specific things to be defined in future.
Now, not future if you want to migrate device context.
> Rest is already present.
> We are not going to define all the device context in one patch series that no one can review reliably.
> It will be done incrementally.
so you agree at least for now we should migrate stateless devices, right?
>
> But the feedback, I am taking is, we need to add a command that indicates which TLVs are supported in the device migration.
> So virtio-fs or other device migration capabilities can be discovered.
> I will cover this in v2.
so you propose a solution as "virtio migration", but only migrate 
selective types of devices?
You should rename it to be "virtio-net live migration".
>
> Thanks a lot for this thoughts.
>
>>> The infrastructure and basic facilities are setup in this series, that one can
>> easily extend for all the current and new device types.
>> really? how?
>>>> And we are migrating stateless devices, or no? How do you migrate virtio-fs?
>>>>> 2. sharing such large context and write addresses in parallel for
>>>>> multiple devices cannot be done using single register file
>>>> see above
>>>>> 3. These registers cannot be residing in the VF because VF can
>>>>> undergo FLR, and device reset which must clear these registers
>>>> do you mean you want to audit all PCI features? When FLR, the device
>>>> is rested, do you expect a device remember anything after FLR?
>>> Not at all. VF member device will not remember anything after FLR.
>>>> Do you want to trap FLR? Why?
>>> This proposal does _not_ want to trap the FLR in the hypervisor virtio driver.
>>>
>>> When one does the mediation-based design, it must trap/emulate/fake the
>> FLR.
>>> It helps to address the case of nested as you mentioned.
>> once passthrough, the guest driver can access the config space to reset the
>> device, right?
>>>> Why FLR block or conflict with live migration?
>>> It does not block or conflict.
>> OK, cool, so let's make this a conclusion
>>> The whole point is, when you put live migration functionality on the VF itself,
>> you just cannot FLR this device.
>>> One must trap the FLR and do fake FLR and build the whole infrastructure to
>> not FLR The device.
>>> Above is not passthrough device.
>> No, the guest can reset the device, even causing a failed live migration.
> Not in the proposal here.
> Can you please prove how in the current v1 proposal, device reset will fail the migration?
> I would like to fix it.
if the device is reset, it forgets everything right?
>
>>>>> 4. When VF does the DMA, all dma occurs in the guest address space,
>>>>> not in
>>>> hypervisor space; any flr and device reset must stop such dma.
>>>>> And device reset and flr are controlled by the guest (not mediated
>>>>> by
>>>> hypervisor).
>>>> if the guest reset the device, it is totally reasonable operation,
>>>> and the guest own the risk, right?
>>> Sure, but the guest still expects its dirty pages and device context to be
>> migrated across device_reset.
>>> Device_reset will lose all this information within the device if done without
>> mediation and special care.
>> No, if the guest reset a device, that means the device should be RESET, to forget
>> its config, that would be really wired to migrate a fresh device at the source
>> side, to be a running device at the destination side.
> Device reset not doing the role of reset is just a plain broken spec.
why? The reset behavior is well defined in the spec, and works fine for 
years.
>
>>> So, to avoid that now one needs to have fake device reset too and build that
>> infrastructure to not reset.
>>> The passthrough proposal fundamental concept is:
>>>
>>> all the native virtio functionalities are between guest driver and the actual
>> device.
>> see above.
>>>> and still, do you want to audit every PCI features? at least you
>>>> didn't do that in your series.
>>> Can you please list which PCI features audit you are talking about?
>> you audit FLR, then do you want to check everyone?
>> If no, how to decide which one should be audited, why others not?
> I really find it hard to follow your question.
>
> I explained in patch 5 and 8 about interactions with the FLR and its support.
> Not sure what you want me to check.
>
> You mentioned that "I didn’t audit every PCI features"? So can you please list which one and in relation to which admin commands?
Your job to audit everyone if you talk about FLR. Because FLR is PCI 
spec, not virtio, you need to explain why other PCI features not
need to be audited.

We have explained why FLR is not a concern for many times, and I don't 
want to repeat, please refer to previous discussions.
>
>>> Keep in mind, that will all the mediation, one now must equally audit all this
>> giant software stack too.
>>> So maybe it is fine for those who are ok with it.
>> so you agree FLR is not a problem, at least for config space solution?
> I don’t know what you mean "FLR is not a problem".
>
> FLR on the VF must work as it works without live migration for passthrough device as today.
> And admin commands have some interactions with it.
> And this proposal covers it.
> I am missing some text that Michael and Jason pointed out.
> I am working on v2 to annotate or better word them.
When guest reset the device, the device should be reset for sure. then 
it forgets everything,
how do you expect the reset-ed device still work for live migration? is 
it a race?
>
>>>> For migration, you know the hypervisor takes the ownership of the
>>>> device in the stop_window.
>>> I do not know what stop_window means.
>>> Do you mean stop_copy of vfio or it is qemu term?
>> when guest freeze.
>>>>> 5. Any PASID to separate out admin vq on the VF does not work for
>>>>> two
>>>> reasons.
>>>>> R_1: device flr and device reset must stop all the dmas.
>>>>> R_2: PASID by most leading vendors is still not mature enough
>>>>> R_3: One also needs to do inversion to not expose PASID capability
>>>>> of the member PCI device to not expose
>>>> see above and what if guest shutdown? the same answer, right?
>>> Not sure, I follow.
>>> If the guest shutdown, the guest specific shutdown APIs are called.
>>>
>>> With passthrough device, R_1 just works as is.
>>> R_3 is not needed as they are directly given to the guest.
>>> R_2 platform dependency is not needed either.
>> I think we already have a concussion for FLR.
> I don’t have any concussion.
> I wrote what to be supported for the FLR above.
OK, again, our discussions has been ignored again, and all start over again.

Would you please read our previous discussions?
>
>> For PASID, what blocks the solution?
> When the device is passthrough, PASID capabilities cannot be emulated.
> PASID space is owned fully by the guest.
>
> There is no single known cpu vendor support splitting pasid between hypervisor and guest.
> I can double check, but last I recall that Linux kernel removed such weird support.
do you know there is something called vIOMMU?


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

