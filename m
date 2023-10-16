Return-Path: <virtio-comment-return-7732-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41086CDB474
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 09:44:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 82E151922E6
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 09:44:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6832198648C
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 09:44:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 51D99986412; Mon, 16 Oct 2023 09:44:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 410EE98643F
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 Oct 2023 09:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385329749"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="385329749"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="749232401"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="749232401"
Message-ID: <ad2900a5-3e11-4c2d-bb5b-be37d42b76e6@intel.com>
Date: Mon, 16 Oct 2023 17:44:01 +0800
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
 <4a8bf09e-9aa3-4aec-a20e-8c92f3da3d3c@intel.com>
 <PH0PR12MB5481F0C9549BFCD2EF1C175BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB5481F0C9549BFCD2EF1C175BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration



On 10/13/2023 7:28 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Friday, October 13, 2023 2:36 PM
> [..]
>>> Because it does not work for passthrough mode.
>> what are you talking about?
>> Config space does not work passthrough?
> Once the register space of the VF that is supposed to be used by the live migration is passed to the guest, it is under guest control.
> Hence, live migration driver won't be able to use it.
Does guest control device status to reset itself? harmful?
These facilities can be trapped and emulated, even the feature bits, right?
You know the guest actually don't direct access the device config space,
there is a vfio/vdpa driver, right?
>
>> Have you ever tried pass through a virtio device to a guest?
> :)
> Please explain how the question is relevant to this discussion in separate thread, so that one can keep technical focus.
> (Please keep your discussion technical, instead of derogatory to other members).
if you want me to answer your question, at least you SHOULD NOT cut off 
the context, or you are trying to confuse everyone.
Or did you try to avoid or hide anything? I am not sure this is a good 
practice.

The context in last discussion is:

me: OK, I pop-ed Jason's proposal to make everything easier, and I see 
it is refused.
you: Because it does not work for passthrough mode.
me: what are you talking about?
     Config space does not work passthrough?
     Have you ever tried pass through a virtio device to a guest?

So I ask you try to pass through a virito-pci device to a guest,
then check whether the config space work for pass-through mode.

again, don't cut off threads before the discussion is closed.
>
>> Let me repeat again, these live migration facilities are
>> per-device(per-VF) facility, so it only migrates itself.
>>
> Since they are per device (per VF), they reside in the guest VM. Hence, VMM cannot live migrate it.
you know the config space can be trapped and emulated, and the 
hypervisor takes the ownership of
the device once the guest freeze in the stop window.
>
>> And for pass through, you can try passthrough a virito device to a guest, see
>> how the guest initialize the device through the config space.
>>
>> That is really basic virtualization, not hard to test.
> Repeated points, I am omitting.
ok, if you get it, let's close it.
>
>>>>>> inflight descriptor tracking will be implemented by Eugenio in V2.
>>>>> When we have near complete proposal from two device vendors, you
>>>>> want to push something to unknown future without reviewing the work;
>>>>> does not
>>>> make sense.
>>>> Didn't I ever provide feedback to you? Really?
>>> No. I didn’t see why you need to post a new patch for dirty page tracking,
>> when it is already present in this series.
> This is plain ignorance and shows non_cooperative mode of working in technical committee.
you have cut off the tread again, so I can't read the context.
>
>>> I would like to understand and review this aspects.
>>> Same for the device context.
>> you will see dirty page tracking in my V2, as I repeated for many times.
> Since you are not co-operative, I have less sympathy to see V2.
> I don’t see a reason to see when, it is fully presented here.
Again, please don't take it personal and please be professional.

Speaking of collaboration, please at least respect others' time and answers.
Both Jason and I have responded to you multiple times on the same 
questions(for example, FLR, nested, passthrough).
If our answers are ignored again and again, and then after a few days or 
hours
you come back asking the same question again, what's the point?

And please don't cut off any threads before we close the discussion.
>
>> For device context, we have discussed this in other threads, did you ignored that
>> again?
> No. I didn’t. I replied that the generic infrastructure is built the enables every device type to migrate by defining their device context.
don't we have a conclusion there or did you miss anything? Since you 
refuse to define device context for
every device type, how do you migrate stateful devices?

So we should implement a stateless live migration solution, right?
>
>> Hint: how do you define device context for every device type, e.g, virtio-fs.
>> Don't say you only migrate virito-net or blk.
> I didn’t say it. I said to migrate all 30+ device types.
> And infrastructure is presented here.
so please define device context for all the devices.
how about starting from virtio-fs?
>
>>>>> You are still in the mode of _take_ what we did with near zero explanation.
>>>>> You asked question of why passthrough proposal cannot advantage of
>>>>> in_band
>>>> config registers.
>>>>> I explained technical reason listed here.
>>>> I have answered the questions, and asked questions for many times.
>>>> What do you mean by "why passthrough proposal cannot advantage of
>>>> in_band config registers."?
>>>> Config space work for passthrough for sure.
>>> Config space registers are passthrough the guest VM.
>>> Hence hypervisor messing it with, programming some address would result in
>> either security issue.
>>> Or functionally broken, to sustain the functionality, each nested layer needs
>> one copy of these registers for each nest level.
>>> So they must be trapped somehow.
>> trap and emulated are basic virtualization.
> Not for passthrough devices, sorry.
> See the paper that Jason pointed out.
> Control program/vmm is trap is involved only on the privileged operation of the VMM.
> Virtio cvqs, virtio registers are not the privileged operation of the VMM, because they are of the native virtio device itself.
> Period.
since the context is cut of again, I failed to read the context.

But config space can be trapped and emulated, right?
When guest accessing device config space, actually
it access the hypervisor-presented config space.
>
>>> Secondly I don’t see how one can read 1M flows using config registers.
>> Not sure what you are talking about, beyond the spec?
> The spec which is under works for few months by multiple technical members.
> Please subscribe to virtio-comment mailing list.
> How come you changed your point from cvq to different argument of out of spec? :)
I mean, what is your 1M flows? is it beyond spec?
>
>>>>> So please don’t jump to conclusions before finishing the discussion
>>>>> on how
>>>> both side can take advantage of each other.
>>>>> Lets please do that.
>>>> We have proposed a solution, right?
>>>>
>>> Which one? To do something in future?
>>> I don’t see a suggestion on how one can use device context and dirty page
>> tracking for nested and passthrough uniformly.
>>> I see a technical difficulty in making both work with uniform interface.
>> Please don't ignore previous answers, don't force us repeat again and again.
>>
> You didn’t answer, how.
> Your answer was "you will post dirty page tracking without reviewing current" and Eugenio will post v2....
Yes, will do. and you can check the patch when it posted.

Eugenio will cook a patch for in-flight descriptors, not dirty page, 
that is mine.
>
>> It is Jason's proposal. Please refer to previous threads, also for device context
>> and dirty pages.
>>>> I still need to point out: admin vq LM does not work, one example is nested.
>>> As Michael said, please don’t confuse between admin commands and admin
>> vq.
>> anyway, admin vq live migration don't work for nested.
> I am convicned with the paper that Jason pointed out.
>
> A nested solution involves a member device supporting the nesting without trap and emulation so that it follows the two properties:
> The efficiency property and equivalence property.
>
> Hence a member device which wants to support nested case, should present itself with attributes to support nesting.
failed to process the sentence, but I am glad you are convinced by the 
paper.
>
>
>>>>>> There are no scale problem as I repeated for many time, they are
>>>>>> per-device basic facilities, just migrate the VF by its own
>>>>>> facility, so there are no 40000 member devices, this is not per PF.
>>>>>>
>>>>> I explained that device reset, flr etc flow cannot work when
>>>>> controlling and
>>>> controlled functions are single entity for passthrough mode.
>>>>> The scale problem is, one needs to duplicate the registers on each VF.
>>>>> The industry is moving away from the register interface in many
>>>>> _real_ hw
>>>> devices implementation.
>>>>> Some of the examples are IMS, SIOV, NVMe and more.
>>>> we have discussed this for many times, please refer to previous
>>>> threads, even with Jason.
>>> I do not agree for any registers to add to the VF which are reset on
>> device_reset and FLR.
>>> As it does not work for passthrough mode.
>> Jason has answered your these FLR questions for many times, I don't want to
>> repeat his words, even myself have answered many times. If you keep ignoring
>> the answers, and ask again and again, what is the point?
>>
>> So please refer to the previous threads.
> I don’t think I asked the question above. Please re-read.
you cut if off again, what question? if about FLR, I believe
Jason has answered for many times.
>
>>>>>> The device context can be read from config space or trapped, like
>>>>>> shadow
>>>>> There are 1 million flows of the net device flow filters in progress.
>>>>> Each flow is 64B in size.
>>>>> Total size is 64MB.
>>>>> I don’t see how one can read such amount of memory using config
>> registers.
>>>> control vq?
>>> The control vq and flow filter vqs are owned by the guest driver, not the
>> hypervisor.
>>> So no, cvq cannot be used.
>> first, don't cut off the threads, don't delete words, that really confusing readers.
>>
> Your comments are so long that it is hard to follow such a long thread.
> Hence only the related comments are kept.
> But I understand, will try to avoid.
>
>> And I think you misunderstand a lot of virtualization fundamentals, at least have
>> a look at how shadow control vq works.
>>
> In case if you don’t know, the shadow cvq acceleration for Nvidia ConnectX6-DX is done jointly with Dragos and me, with recent patches from Sie-Wei.
>
> I don’t think so I missed.
>
> Shadow vq is great when you don’t have underlying support from the device.
>
> When you have passthrough member devices, they are not trapped or emulated.
> The future hypervisor must not be able to see things of cvq, datavq or addressed programmed by the guest.
> And hence the infrastructure is geared towards such approach.
I failed to read the full context as you cut off them. I can't even read 
your original questions, they are truncated.

Anyway, lets migrate device without device-context first.
>
>> And the parameters set to config vq are also device context as we discussed for
>> many times.
>>>> Or do you want to migrate non-virtio context?
>>> Every thing is virtio device context.
>> see above
>>>>>> control vq which is already done, that is basic virtualization.
>>>>> There is nothing like "basic virtualization".
>>>>> What is proposed here is fulfilling the requirement of passthrough mode.
>>>>>
>>>>> Your comment is implying, "I don’t care for passthrough
>>>>> requirements, do
>>>> non_passthrough".
>>>> that is your understanding, and you misunderstood it. Config space
>>>> servers passthrough for many years.
>>> "Config space servers" ?
>>> I do not understand it, can you please explain what does that mean?
>>>
>>> I do not see your suggestion on how one can implement passthrough member
>> device when passthrough device does the dma and migration framework also
>> need to do the dma.
>> Try pass through a virtio device to a guest and learn how the guest take
>> advantage the config space before you comment.
> Right. It does not work. The guest is doing the device_reset and flr.
> Hence, it is resetting everything. All the dirty page log is lost.
> All the device context is lost.
> Hypervisor didn’t see any of this happening, because it didn’t do the trap.
>
> Look, if you are going to continue to argue that you must do trap + emulation and don’t talk about passthrough,
> Please stop here, because discussion won't go anywhere.
>
> I made my best to answer the limitations in very first email where you asked.
OK, I see the gap, and I am sure we can help you here.
Try consider a question:
how do you define pass-through? Can a guest access the device without a 
host driver helper?
>
>>> That basic facility is missing dirty page tracking, P2P support, device context,
>> FLR, device reset support.
>>> Hence, it is unusable right now for passthough member device.
>>> And 6th problemetic thing in it is, it does not scale with member devices.
>> Please refer to previous discussions, it is meaningless if you keep ignoring our
>> answers and keep asking the same questions.
> Again, please re-read, I didn’t ask the question.
> I replied 6 problems that are not solved.
I believe we have answered for many times. The questions are cut off again,
but how about search for previous answers?
>
>>>>>> If you want to migrate device context, you need to specify device
>>>>>> context for every type of device, net maybe easy, how do you see virtio-fs?
>>>>> Virtio-fs will have its on device context too.
>>>>> Every device has some sort of backend in varied degree.
>>>>> Net being widely used and moderate complex device.
>>>>> Fs being slightly stateful but less complex than net, as it has far
>>>>> less control
>>>> operations.
>>>> so, do you say you have implement a live migration solution which can
>>>> migrate device context, but only work for net or block?
>>> I don’t think this question about implementation has any relevance.
>>> Frankly feels like a court to me. :(
>>> No. I dint say that.
>>> We have implemented net, fs, block devices and single framework proposed
>> here can support all 3 and rest 28+.
>>> The device context part in this series do not cover special/optional things of
>> all the device type.
>>> This is something I promised to do gradually, once the framework looks good.
>> If you don't define them, only talking about "migrate the device context" but
>> don't tell us what do migrate, does this make sense to anybody?
>>>> Then you should call it virtio net/blk migration and implement in
>>>> net/block section.
>>> No. you misunderstood. My point was showing orthogonal complexities of net
>> vs fs.
>>> I likely failed to explain that.
>> see above, anyway you need to define them, how about starting form virito FS?
>>>>> In fact virtio-fs device already discusses the migrating the device
>>>>> side state, as
>>>> listed in device context.
>>>>> So virtio-fs device will have its own device-context defined.
>>>> if you want to migrate it, you need to define it
>>> Sure.
>>> Only device specific things to be defined in future.
>> Now, not future if you want to migrate device context.
> It is not mandatory, and it is impractical do everything in one series.
> It is planned for 1.4.
really, you want to define device context for every device time?

Remember don't migrate device-context before you define them or how can 
the HW
implementions know how to do.
>
>>> Rest is already present.
>>> We are not going to define all the device context in one patch series that no
>> one can review reliably.
>>> It will be done incrementally.
>> so you agree at least for now we should migrate stateless devices, right?
>>> But the feedback, I am taking is, we need to add a command that indicates
>> which TLVs are supported in the device migration.
>>> So virtio-fs or other device migration capabilities can be discovered.
>>> I will cover this in v2.
>> so you propose a solution as "virtio migration", but only migrate selective types
>> of devices?
>> You should rename it to be "virtio-net live migration".
> Sorry, I wont. Because infrastructure is for majority device types.
>
> Which field did you observe which is net specific?
> We want to cover all the device types.
> Don’t need to cook their context in one series.
so, not work for all device types? limited to some specific types?
you still need to rename it what ever.
>
>>> Thanks a lot for this thoughts.
>>>
>>>>> The infrastructure and basic facilities are setup in this series,
>>>>> that one can
>>>> easily extend for all the current and new device types.
>>>> really? how?
>>>>>> And we are migrating stateless devices, or no? How do you migrate virtio-
>> fs?
>>>>>>> 2. sharing such large context and write addresses in parallel for
>>>>>>> multiple devices cannot be done using single register file
>>>>>> see above
>>>>>>> 3. These registers cannot be residing in the VF because VF can
>>>>>>> undergo FLR, and device reset which must clear these registers
>>>>>> do you mean you want to audit all PCI features? When FLR, the
>>>>>> device is rested, do you expect a device remember anything after FLR?
>>>>> Not at all. VF member device will not remember anything after FLR.
>>>>>> Do you want to trap FLR? Why?
>>>>> This proposal does _not_ want to trap the FLR in the hypervisor virtio driver.
>>>>>
>>>>> When one does the mediation-based design, it must trap/emulate/fake
>>>>> the
>>>> FLR.
>>>>> It helps to address the case of nested as you mentioned.
>>>> once passthrough, the guest driver can access the config space to
>>>> reset the device, right?
>>>>>> Why FLR block or conflict with live migration?
>>>>> It does not block or conflict.
>>>> OK, cool, so let's make this a conclusion
>>>>> The whole point is, when you put live migration functionality on the
>>>>> VF itself,
>>>> you just cannot FLR this device.
>>>>> One must trap the FLR and do fake FLR and build the whole
>>>>> infrastructure to
>>>> not FLR The device.
>>>>> Above is not passthrough device.
>>>> No, the guest can reset the device, even causing a failed live migration.
>>> Not in the proposal here.
>>> Can you please prove how in the current v1 proposal, device reset will fail the
>> migration?
>>> I would like to fix it.
>> if the device is reset, it forgets everything right?
> Right. This is why all dirty page track; device context is lost on device reset.
> Hence, the controlling function and controlled function are two different entities.
so there can be inconsistent migrations and races, right? And if the 
guest reset the
device, actually the hypervisor should let it be, right?
>
>>>>>>> 4. When VF does the DMA, all dma occurs in the guest address
>>>>>>> space, not in
>>>>>> hypervisor space; any flr and device reset must stop such dma.
>>>>>>> And device reset and flr are controlled by the guest (not mediated
>>>>>>> by
>>>>>> hypervisor).
>>>>>> if the guest reset the device, it is totally reasonable operation,
>>>>>> and the guest own the risk, right?
>>>>> Sure, but the guest still expects its dirty pages and device context
>>>>> to be
>>>> migrated across device_reset.
>>>>> Device_reset will lose all this information within the device if
>>>>> done without
>>>> mediation and special care.
>>>> No, if the guest reset a device, that means the device should be
>>>> RESET, to forget its config, that would be really wired to migrate a
>>>> fresh device at the source side, to be a running device at the destination
>> side.
>>> Device reset not doing the role of reset is just a plain broken spec.
>> why? The reset behavior is well defined in the spec, and works fine for years.
> So any new construct that one adds, it will be reset as well and dirty page track is lost.
Yes and do you want to prevent that? You may surprise the guest.
>
>>>>> So, to avoid that now one needs to have fake device reset too and
>>>>> build that
>>>> infrastructure to not reset.
>>>>> The passthrough proposal fundamental concept is:
>>>>>
>>>>> all the native virtio functionalities are between guest driver and
>>>>> the actual
>>>> device.
>>>> see above.
>>>>>> and still, do you want to audit every PCI features? at least you
>>>>>> didn't do that in your series.
>>>>> Can you please list which PCI features audit you are talking about?
>>>> you audit FLR, then do you want to check everyone?
>>>> If no, how to decide which one should be audited, why others not?
>>> I really find it hard to follow your question.
>>>
>>> I explained in patch 5 and 8 about interactions with the FLR and its support.
>>> Not sure what you want me to check.
>>>
>>> You mentioned that "I didn’t audit every PCI features"? So can you please list
>> which one and in relation to which admin commands?
>> Your job to audit everyone if you talk about FLR. Because FLR is PCI spec, not
>> virtio, you need to explain why other PCI features not need to be audited.
>>
> Sure, but when you point figure as I didn’t audit, please mention what is not audited.
well, we are migrating virtio devices, but you keep talking PCI, so do 
you want to
take every PCI functionalities into considerations>
>
>> We have explained why FLR is not a concern for many times, and I don't want
>> to repeat, please refer to previous discussions.
> You seem to ignore the first paragraph of theory of operation that FLR is not trapped.
this is the guest issue FLR, right? If so the guest owns the risks and 
the hypervisor should
not prevent that.
>
>>>>> Keep in mind, that will all the mediation, one now must equally
>>>>> audit all this
>>>> giant software stack too.
>>>>> So maybe it is fine for those who are ok with it.
>>>> so you agree FLR is not a problem, at least for config space solution?
>>> I don’t know what you mean "FLR is not a problem".
>>>
>>> FLR on the VF must work as it works without live migration for passthrough
>> device as today.
>>> And admin commands have some interactions with it.
>>> And this proposal covers it.
>>> I am missing some text that Michael and Jason pointed out.
>>> I am working on v2 to annotate or better word them.
>> When guest reset the device, the device should be reset for sure. then it forgets
>> everything, how do you expect the reset-ed device still work for live migration?
>> is it a race?
> I don’t expect it live migration to work at all with such a approach.
> This is why in my proposal live migration occurs on the owner device, while controlled function (member device) is undergoing the device reset.
see above
>
>>>>>> For migration, you know the hypervisor takes the ownership of the
>>>>>> device in the stop_window.
>>>>> I do not know what stop_window means.
>>>>> Do you mean stop_copy of vfio or it is qemu term?
>>>> when guest freeze.
>>>>>>> 5. Any PASID to separate out admin vq on the VF does not work for
>>>>>>> two
>>>>>> reasons.
>>>>>>> R_1: device flr and device reset must stop all the dmas.
>>>>>>> R_2: PASID by most leading vendors is still not mature enough
>>>>>>> R_3: One also needs to do inversion to not expose PASID capability
>>>>>>> of the member PCI device to not expose
>>>>>> see above and what if guest shutdown? the same answer, right?
>>>>> Not sure, I follow.
>>>>> If the guest shutdown, the guest specific shutdown APIs are called.
>>>>>
>>>>> With passthrough device, R_1 just works as is.
>>>>> R_3 is not needed as they are directly given to the guest.
>>>>> R_2 platform dependency is not needed either.
>>>> I think we already have a concussion for FLR.
>>> I don’t have any concussion.
>>> I wrote what to be supported for the FLR above.
>> OK, again, our discussions has been ignored again, and all start over again.
>>
>> Would you please read our previous discussions?
> You asked the question about why it wont work, I answered.
> I don’t see a point of debating same thing over again.
Is that cut off again?

if still about FLR, so please see above comments.
And I agree if the answers are ignored again, we don't need to repeat.
>
>>>> For PASID, what blocks the solution?
>>> When the device is passthrough, PASID capabilities cannot be emulated.
>>> PASID space is owned fully by the guest.
>>>
>>> There is no single known cpu vendor support splitting pasid between
>> hypervisor and guest.
>>> I can double check, but last I recall that Linux kernel removed such weird
>> support.
>> do you know there is something called vIOMMU?
> Probably yes.


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

