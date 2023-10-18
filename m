Return-Path: <virtio-comment-return-7792-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27A2CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:39:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1EFDC85087
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:39:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 036D4986893
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:39:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E164198688C; Wed, 18 Oct 2023 06:39:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C77BB98688D
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 06:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="452422705"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208,217";a="452422705"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="847130997"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208,217";a="847130997"
Content-Type: multipart/alternative;
 boundary="------------aVWjD0TZwv2keiBL0Wyx0O1Z"
Message-ID: <9724a3e4-28ed-4ccb-b2f4-f288e6a3daa0@intel.com>
Date: Wed, 18 Oct 2023 14:39:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <20231008112555.473895-1-parav@nvidia.com>
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
 <ad2900a5-3e11-4c2d-bb5b-be37d42b76e6@intel.com>
 <PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b5e21dd5-1aee-4ad1-9833-ceca8c18c461@intel.com>
In-Reply-To: <b5e21dd5-1aee-4ad1-9833-ceca8c18c461@intel.com>
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

--------------aVWjD0TZwv2keiBL0Wyx0O1Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

resend as Parav requested. This mail format looks fine at my side

On 10/18/2023 2:32 PM, Zhu, Lingshan wrote:
>
>
> On 10/18/2023 1:00 PM, Parav Pandit wrote:
>>> From: Zhu, Lingshan<lingshan.zhu@intel.com>
>>> Sent: Monday, October 16, 2023 3:14 PM
>>>
>>> On 10/13/2023 7:28 PM, Parav Pandit wrote:
>>>>> From: Zhu, Lingshan<lingshan.zhu@intel.com>
>>>>> Sent: Friday, October 13, 2023 2:36 PM
>>>> [..]
>>>>>> Because it does not work for passthrough mode.
>>>>> what are you talking about?
>>>>> Config space does not work passthrough?
>>>> Once the register space of the VF that is supposed to be used by the live
>>> migration is passed to the guest, it is under guest control.
>>>> Hence, live migration driver won't be able to use it.
>>> Does guest control device status to reset itself? harmful?
>> No. it is not harmful.
>> Is owner device reseting itself, harmful? No.
>> Is member device resetting isetlf, harmful? No.
>> Should member device reset
> good
>>> These facilities can be trapped and emulated, even the feature bits, right?
>>> You know the guest actually don't direct access the device config space, there is
>>> a vfio/vdpa driver, right?
>> You can practically trap and emulated everything.
>> If you continue to ignore passthrough requirements and keep repeating that do trap and emulate, this discussion does not go anywhere.
> Clearly I did not ignore passthrough and keep answering your question 
> for many times.
> Maybe you didn't get it, so I would ask how you define your "passthrough"?
>
> You may find that the guest vCPUs(guest vRC) actually are not 
> privileged to access to
> host pci device(host CPU RC), that's why a pass-through driver like 
> vfio is a must.
>
> Therefore the device config space can be trapped. Is that clear now?
>>>>> Have you ever tried pass through a virtio device to a guest?
>>>> :)
>>>> Please explain how the question is relevant to this discussion in separate
>>> thread, so that one can keep technical focus.
>>>> (Please keep your discussion technical, instead of derogatory to other
>>> members).
>>> if you want me to answer your question, at least you SHOULD NOT cut off the
>>> context, or you are trying to confuse everyone.
>>> Or did you try to avoid or hide anything? I am not sure this is a good practice.
>>>
>>> The context in last discussion is:
>>>
>>> me: OK, I pop-ed Jason's proposal to make everything easier, and I see it is
>>> refused.
>>> you: Because it does not work for passthrough mode.
>>> me: what are you talking about?
>>>       Config space does not work passthrough?
>>>       Have you ever tried pass through a virtio device to a guest?
>>>
>>> So I ask you try to pass through a virito-pci device to a guest, then check
>>> whether the config space work for pass-through mode.
>>>
>>> again, don't cut off threads before the discussion is closed.
>>>>> Let me repeat again, these live migration facilities are
>>>>> per-device(per-VF) facility, so it only migrates itself.
>>>>>
>>>> Since they are per device (per VF), they reside in the guest VM. Hence, VMM
>>> cannot live migrate it.
>>> you know the config space can be trapped and emulated, and the hypervisor
>>> takes the ownership of the device once the guest freeze in the stop window.
>> When you say config space, do you mean PCI config space of 4K size?
> you can take an example of virito common config cap.
>>>>> And for pass through, you can try passthrough a virito device to a
>>>>> guest, see how the guest initialize the device through the config space.
>>>>>
>>>>> That is really basic virtualization, not hard to test.
>>>> Repeated points, I am omitting.
>>> ok, if you get it, let's close it.
>>>>>>>>> inflight descriptor tracking will be implemented by Eugenio in V2.
>>>>>>>> When we have near complete proposal from two device vendors, you
>>>>>>>> want to push something to unknown future without reviewing the
>>>>>>>> work; does not
>>>>>>> make sense.
>>>>>>> Didn't I ever provide feedback to you? Really?
>>>>>> No. I didn’t see why you need to post a new patch for dirty page
>>>>>> tracking,
>>>>> when it is already present in this series.
>>>> This is plain ignorance and shows non_cooperative mode of working in
>>> technical committee.
>>> you have cut off the tread again, so I can't read the context.
>> Enjoy long threads. 😊
> you skip finished discussions for sure, but don't do that to on-going 
> discussions.
>>>>>> I would like to understand and review this aspects.
>>>>>> Same for the device context.
>>>>> you will see dirty page tracking in my V2, as I repeated for many times.
>>>> Since you are not co-operative, I have less sympathy to see V2.
>>>> I don’t see a reason to see when, it is fully presented here.
>>> Again, please don't take it personal and please be professional.
>>>
>>> Speaking of collaboration, please at least respect others' time and answers.
>>> Both Jason and I have responded to you multiple times on the same
>>> questions(for example, FLR, nested, passthrough).
>>> If our answers are ignored again and again, and then after a few days or hours
>>> you come back asking the same question again, what's the point?
>>>
>> I didn’t ask questions in area of FLR and passthrough, please check again.
> OK, then please don't force us answer the same questions anymore, for 
> example no FLR anymore.
>>> And please don't cut off any threads before we close the discussion.
>>>>> For device context, we have discussed this in other threads, did you
>>>>> ignored that again?
>>>> No. I didn’t. I replied that the generic infrastructure is built the enables every
>>> device type to migrate by defining their device context.
>>> don't we have a conclusion there or did you miss anything? Since you refuse to
>>> define device context for every device type, how do you migrate stateful
>>> devices?
>>>
>>> So we should implement a stateless live migration solution, right?
>> No. device context is basic facility that intent to cover most virtio devices.
> not most, instead it should be "all", if you are implementing a virtio 
> live migration.
>> I didn’t not refuse to define context.
>> I said, device context will be incrementally defined subsequently.
> just define what we have now, for example, define virito-fs as it is now.
>> Like Michael said, I expect every device to define device context section in coming months for 1.4 time frame.
> as MST said, do you expect the implementation to figure out the device 
> context by themselves?
> If you want to migrate device context, you should define them.
>>>>> Hint: how do you define device context for every device type, e.g, virtio-fs.
>>>>> Don't say you only migrate virito-net or blk.
>>>> I didn’t say it. I said to migrate all 30+ device types.
>>>> And infrastructure is presented here.
>>> so please define device context for all the devices.
>>> how about starting from virtio-fs?
>> Should be done incrementally.
> show me your patch
>>>>>>>> You are still in the mode of _take_ what we did with near zero
>>> explanation.
>>>>>>>> You asked question of why passthrough proposal cannot advantage of
>>>>>>>> in_band
>>>>>>> config registers.
>>>>>>>> I explained technical reason listed here.
>>>>>>> I have answered the questions, and asked questions for many times.
>>>>>>> What do you mean by "why passthrough proposal cannot advantage of
>>>>>>> in_band config registers."?
>>>>>>> Config space work for passthrough for sure.
>>>>>> Config space registers are passthrough the guest VM.
>>>>>> Hence hypervisor messing it with, programming some address would
>>>>>> result in
>>>>> either security issue.
>>>>>> Or functionally broken, to sustain the functionality, each nested
>>>>>> layer needs
>>>>> one copy of these registers for each nest level.
>>>>>> So they must be trapped somehow.
>>>>> trap and emulated are basic virtualization.
>>>> Not for passthrough devices, sorry.
>>>> See the paper that Jason pointed out.
>>>> Control program/vmm is trap is involved only on the privileged operation of
>>> the VMM.
>>>> Virtio cvqs, virtio registers are not the privileged operation of the VMM,
>>> because they are of the native virtio device itself.
>>>> Period.
>>> since the context is cut of again, I failed to read the context.
>>>
>>> But config space can be trapped and emulated, right?
>> Answered above.
>>
>>> When guest accessing device config space, actually it access the hypervisor-
>>> presented config space.
>>>>>> Secondly I don’t see how one can read 1M flows using config registers.
>>>>> Not sure what you are talking about, beyond the spec?
>>>> The spec which is under works for few months by multiple technical
>>> members.
>>>> Please subscribe to virtio-comment mailing list.
>>>> How come you changed your point from cvq to different argument of out
>>>> of spec? :)
>>> I mean, what is your 1M flows? is it beyond spec?
>> No. it is not beyond the spec.
>> It is the spec in work for several months by multiple device, OS and cloud operators.
> then, again, what is your 1M flow? if not defined in the spec, then it 
> is beyond spec.
>>>>>>>> So please don’t jump to conclusions before finishing the
>>>>>>>> discussion on how
>>>>>>> both side can take advantage of each other.
>>>>>>>> Lets please do that.
>>>>>>> We have proposed a solution, right?
>>>>>>>
>>>>>> Which one? To do something in future?
>>>>>> I don’t see a suggestion on how one can use device context and dirty
>>>>>> page
>>>>> tracking for nested and passthrough uniformly.
>>>>>> I see a technical difficulty in making both work with uniform interface.
>>>>> Please don't ignore previous answers, don't force us repeat again and again.
>>>>>
>>>> You didn’t answer, how.
>>>> Your answer was "you will post dirty page tracking without reviewing current"
>>> and Eugenio will post v2....
>>> Yes, will do. and you can check the patch when it posted.
>>>
>> Does not make sense to me at all.
> tracking dirty pages does not make sense to you?
>>   
>>> Eugenio will cook a patch for in-flight descriptors, not dirty page, that is mine.
>>>>> It is Jason's proposal. Please refer to previous threads, also for
>>>>> device context and dirty pages.
>>>>>>> I still need to point out: admin vq LM does not work, one example is
>>> nested.
>>>>>> As Michael said, please don’t confuse between admin commands and
>>>>>> admin
>>>>> vq.
>>>>> anyway, admin vq live migration don't work for nested.
>>>> I am convicned with the paper that Jason pointed out.
>>>>
>>>> A nested solution involves a member device supporting the nesting without
>>> trap and emulation so that it follows the two properties:
>>>> The efficiency property and equivalence property.
>>>>
>>>> Hence a member device which wants to support nested case, should present
>>> itself with attributes to support nesting.
>>> failed to process the sentence, but I am glad you are convinced by the paper.
>>>>>>>>> There are no scale problem as I repeated for many time, they are
>>>>>>>>> per-device basic facilities, just migrate the VF by its own
>>>>>>>>> facility, so there are no 40000 member devices, this is not per PF.
>>>>>>>>>
>>>>>>>> I explained that device reset, flr etc flow cannot work when
>>>>>>>> controlling and
>>>>>>> controlled functions are single entity for passthrough mode.
>>>>>>>> The scale problem is, one needs to duplicate the registers on each VF.
>>>>>>>> The industry is moving away from the register interface in many
>>>>>>>> _real_ hw
>>>>>>> devices implementation.
>>>>>>>> Some of the examples are IMS, SIOV, NVMe and more.
>>>>>>> we have discussed this for many times, please refer to previous
>>>>>>> threads, even with Jason.
>>>>>> I do not agree for any registers to add to the VF which are reset on
>>>>> device_reset and FLR.
>>>>>> As it does not work for passthrough mode.
>>>>> Jason has answered your these FLR questions for many times, I don't
>>>>> want to repeat his words, even myself have answered many times. If
>>>>> you keep ignoring the answers, and ask again and again, what is the point?
>>>>>
>>>>> So please refer to the previous threads.
>>>> I don’t think I asked the question above. Please re-read.
>>> you cut if off again, what question? if about FLR, I believe Jason has answered
>>> for many times.
>> Again, please read. I didn’t ask the question for FLR.
>> You keep saying "what question".
> I failed to read the context because you have cut them off.
>>>>>>>>> The device context can be read from config space or trapped, like
>>>>>>>>> shadow
>>>>>>>> There are 1 million flows of the net device flow filters in progress.
>>>>>>>> Each flow is 64B in size.
>>>>>>>> Total size is 64MB.
>>>>>>>> I don’t see how one can read such amount of memory using config
>>>>> registers.
>>>>>>> control vq?
>>>>>> The control vq and flow filter vqs are owned by the guest driver,
>>>>>> not the
>>>>> hypervisor.
>>>>>> So no, cvq cannot be used.
>>>>> first, don't cut off the threads, don't delete words, that really confusing
>>> readers.
>>>> Your comments are so long that it is hard to follow such a long thread.
>>>> Hence only the related comments are kept.
>>>> But I understand, will try to avoid.
>>>>
>>>>> And I think you misunderstand a lot of virtualization fundamentals,
>>>>> at least have a look at how shadow control vq works.
>>>>>
>>>> In case if you don’t know, the shadow cvq acceleration for Nvidia ConnectX6-
>>> DX is done jointly with Dragos and me, with recent patches from Sie-Wei.
>>>> I don’t think so I missed.
>>>>
>>>> Shadow vq is great when you don’t have underlying support from the device.
>>>>
>>>> When you have passthrough member devices, they are not trapped or
>>> emulated.
>>>> The future hypervisor must not be able to see things of cvq, datavq or
>>> addressed programmed by the guest.
>>>> And hence the infrastructure is geared towards such approach.
>>> I failed to read the full context as you cut off them. I can't even read your
>>> original questions, they are truncated.
>>>
>>> Anyway, lets migrate device without device-context first.
>> Passthrough device cannot migrate without device-context as listed.
> so please define the device context.
>>>>> And the parameters set to config vq are also device context as we
>>>>> discussed for many times.
>>>>>>> Or do you want to migrate non-virtio context?
>>>>>> Every thing is virtio device context.
>>>>> see above
>>>>>>>>> control vq which is already done, that is basic virtualization.
>>>>>>>> There is nothing like "basic virtualization".
>>>>>>>> What is proposed here is fulfilling the requirement of passthrough mode.
>>>>>>>>
>>>>>>>> Your comment is implying, "I don’t care for passthrough
>>>>>>>> requirements, do
>>>>>>> non_passthrough".
>>>>>>> that is your understanding, and you misunderstood it. Config space
>>>>>>> servers passthrough for many years.
>>>>>> "Config space servers" ?
>>>>>> I do not understand it, can you please explain what does that mean?
>>>>>>
>>>>>> I do not see your suggestion on how one can implement passthrough
>>>>>> member
>>>>> device when passthrough device does the dma and migration framework
>>>>> also need to do the dma.
>>>>> Try pass through a virtio device to a guest and learn how the guest
>>>>> take advantage the config space before you comment.
>>>> Right. It does not work. The guest is doing the device_reset and flr.
>>>> Hence, it is resetting everything. All the dirty page log is lost.
>>>> All the device context is lost.
>>>> Hypervisor didn’t see any of this happening, because it didn’t do the trap.
>>>>
>>>> Look, if you are going to continue to argue that you must do trap +
>>>> emulation and don’t talk about passthrough, Please stop here, because
>>> discussion won't go anywhere.
>>>> I made my best to answer the limitations in very first email where you asked.
>>> OK, I see the gap, and I am sure we can help you here.
>>> Try consider a question:
>>> how do you define pass-through?
>> As defined in the cover letter and theory of operation.
>> Repeat here:
>> A device whose virtio interfaces are not intercepted by VMM.
>> In future, may be even MSI-X and MSI-X_v2 or newer interrupt method will be passthrough at device level too.
>> (only cpu level interrupt remapping will be hypercall at interrupt controller level).
>>
>> A PCI spec defined config space to stay as emulated as it is generic and not supposed to have any virtio specific things in it as directed by the PCI-SIG.
> how guest access device config space in your "passthrough"?
>>> Can a guest access the device without a host driver helper?
>> Yes for all the virtio interfaces which includes, virtio device common and device config space, cvq, data vq, flow filter vqs, shared memory and anything new of the future.
> interesting, if so, let me ask you a question, Is a guest privileged 
> to access any devices on the host?
>>>>>> That basic facility is missing dirty page tracking, P2P support,
>>>>>> device context,
>>>>> FLR, device reset support.
>>>>>> Hence, it is unusable right now for passthough member device.
>>>>>> And 6th problemetic thing in it is, it does not scale with member devices.
>>>>> Please refer to previous discussions, it is meaningless if you keep
>>>>> ignoring our answers and keep asking the same questions.
>>>> Again, please re-read, I didn’t ask the question.
>>>> I replied 6 problems that are not solved.
>>> I believe we have answered for many times. The questions are cut off again, but
>>> how about search for previous answers?
>>>>>>>>> If you want to migrate device context, you need to specify device
>>>>>>>>> context for every type of device, net maybe easy, how do you see virtio-
>>> fs?
>>>>>>>> Virtio-fs will have its on device context too.
>>>>>>>> Every device has some sort of backend in varied degree.
>>>>>>>> Net being widely used and moderate complex device.
>>>>>>>> Fs being slightly stateful but less complex than net, as it has
>>>>>>>> far less control
>>>>>>> operations.
>>>>>>> so, do you say you have implement a live migration solution which
>>>>>>> can migrate device context, but only work for net or block?
>>>>>> I don’t think this question about implementation has any relevance.
>>>>>> Frankly feels like a court to me. :( No. I dint say that.
>>>>>> We have implemented net, fs, block devices and single framework
>>>>>> proposed
>>>>> here can support all 3 and rest 28+.
>>>>>> The device context part in this series do not cover special/optional
>>>>>> things of
>>>>> all the device type.
>>>>>> This is something I promised to do gradually, once the framework looks
>>> good.
>>>>> If you don't define them, only talking about "migrate the device
>>>>> context" but don't tell us what do migrate, does this make sense to anybody?
>>>>>>> Then you should call it virtio net/blk migration and implement in
>>>>>>> net/block section.
>>>>>> No. you misunderstood. My point was showing orthogonal complexities
>>>>>> of net
>>>>> vs fs.
>>>>>> I likely failed to explain that.
>>>>> see above, anyway you need to define them, how about starting form virito
>>> FS?
>>>>>>>> In fact virtio-fs device already discusses the migrating the
>>>>>>>> device side state, as
>>>>>>> listed in device context.
>>>>>>>> So virtio-fs device will have its own device-context defined.
>>>>>>> if you want to migrate it, you need to define it
>>>>>> Sure.
>>>>>> Only device specific things to be defined in future.
>>>>> Now, not future if you want to migrate device context.
>>>> It is not mandatory, and it is impractical do everything in one series.
>>>> It is planned for 1.4.
>>> really, you want to define device context for every device time?
>>>
>> Yes.
>>   
>>> Remember don't migrate device-context before you define them or how can
>>> the HW implementions know how to do.
>> I disagree. The infrastructure is defined. And incrementally device context will also be defined.
>> See an example work from Michael, i.e. admin command and aq generic facility is defined.
>> And device migration is able to utilize it incrementally. The lower layer fulfill the requirements.
>> This is exactly what is done here.
>>
>> Device context framework is defined and many device spec owners will be easily define their device context making it migratable.
> see above answers for device context.
>>>>>> Rest is already present.
>>>>>> We are not going to define all the device context in one patch
>>>>>> series that no
>>>>> one can review reliably.
>>>>>> It will be done incrementally.
>>>>> so you agree at least for now we should migrate stateless devices, right?
>>>>>> But the feedback, I am taking is, we need to add a command that
>>>>>> indicates
>>>>> which TLVs are supported in the device migration.
>>>>>> So virtio-fs or other device migration capabilities can be discovered.
>>>>>> I will cover this in v2.
>>>>> so you propose a solution as "virtio migration", but only migrate
>>>>> selective types of devices?
>>>>> You should rename it to be "virtio-net live migration".
>>>> Sorry, I wont. Because infrastructure is for majority device types.
>>>>
>>>> Which field did you observe which is net specific?
>>>> We want to cover all the device types.
>>>> Don’t need to cook their context in one series.
>>> so, not work for all device types? limited to some specific types?
>>> you still need to rename it what ever.
>> No. framework works for all device types.
> without defining them?
>>>>>> Thanks a lot for this thoughts.
>>>>>>
>>>>>>>> The infrastructure and basic facilities are setup in this series,
>>>>>>>> that one can
>>>>>>> easily extend for all the current and new device types.
>>>>>>> really? how?
>>>>>>>>> And we are migrating stateless devices, or no? How do you migrate
>>>>>>>>> virtio-
>>>>> fs?
>>>>>>>>>> 2. sharing such large context and write addresses in parallel
>>>>>>>>>> for multiple devices cannot be done using single register file
>>>>>>>>> see above
>>>>>>>>>> 3. These registers cannot be residing in the VF because VF can
>>>>>>>>>> undergo FLR, and device reset which must clear these registers
>>>>>>>>> do you mean you want to audit all PCI features? When FLR, the
>>>>>>>>> device is rested, do you expect a device remember anything after FLR?
>>>>>>>> Not at all. VF member device will not remember anything after FLR.
>>>>>>>>> Do you want to trap FLR? Why?
>>>>>>>> This proposal does _not_ want to trap the FLR in the hypervisor virtio
>>> driver.
>>>>>>>> When one does the mediation-based design, it must
>>>>>>>> trap/emulate/fake the
>>>>>>> FLR.
>>>>>>>> It helps to address the case of nested as you mentioned.
>>>>>>> once passthrough, the guest driver can access the config space to
>>>>>>> reset the device, right?
>>>>>>>>> Why FLR block or conflict with live migration?
>>>>>>>> It does not block or conflict.
>>>>>>> OK, cool, so let's make this a conclusion
>>>>>>>> The whole point is, when you put live migration functionality on
>>>>>>>> the VF itself,
>>>>>>> you just cannot FLR this device.
>>>>>>>> One must trap the FLR and do fake FLR and build the whole
>>>>>>>> infrastructure to
>>>>>>> not FLR The device.
>>>>>>>> Above is not passthrough device.
>>>>>>> No, the guest can reset the device, even causing a failed live migration.
>>>>>> Not in the proposal here.
>>>>>> Can you please prove how in the current v1 proposal, device reset
>>>>>> will fail the
>>>>> migration?
>>>>>> I would like to fix it.
>>>>> if the device is reset, it forgets everything right?
>>>> Right. This is why all dirty page track; device context is lost on device reset.
>>>> Hence, the controlling function and controlled function are two different
>>> entities.
>>> so there can be inconsistent migrations and races, right? And if the guest reset
>>> the device, actually the hypervisor should let it be, right?
>> No. it should not be in because hypervisor has not composed the member device. It is in the hw controlled function itself.
> interesting, do you mean when the guest reset the device, the 
> hypervisor should refuse?
>
> This actually conflict with your statement of your "passthrough" by " 
> not intercepted by VMM". So you actually understand trap and emulate 
> and passthrough.
>>>>>>>>>> 4. When VF does the DMA, all dma occurs in the guest address
>>>>>>>>>> space, not in
>>>>>>>>> hypervisor space; any flr and device reset must stop such dma.
>>>>>>>>>> And device reset and flr are controlled by the guest (not
>>>>>>>>>> mediated by
>>>>>>>>> hypervisor).
>>>>>>>>> if the guest reset the device, it is totally reasonable
>>>>>>>>> operation, and the guest own the risk, right?
>>>>>>>> Sure, but the guest still expects its dirty pages and device
>>>>>>>> context to be
>>>>>>> migrated across device_reset.
>>>>>>>> Device_reset will lose all this information within the device if
>>>>>>>> done without
>>>>>>> mediation and special care.
>>>>>>> No, if the guest reset a device, that means the device should be
>>>>>>> RESET, to forget its config, that would be really wired to migrate
>>>>>>> a fresh device at the source side, to be a running device at the
>>>>>>> destination
>>>>> side.
>>>>>> Device reset not doing the role of reset is just a plain broken spec.
>>>>> why? The reset behavior is well defined in the spec, and works fine for years.
>>>> So any new construct that one adds, it will be reset as well and dirty page
>>> track is lost.
>>> Yes and do you want to prevent that? You may surprise the guest.
>> Yes, want to prevent that.
>> Not sure what you mean by surprise the guest. Unlikely.
>> Why because guest did the reset, it knows what it is doing.
>> (Keep in mind that guest does not expect to lose its dirty pages).
> Shocked...
>
> This statement conflict with basic virtualization.
>>>>>>>> So, to avoid that now one needs to have fake device reset too and
>>>>>>>> build that
>>>>>>> infrastructure to not reset.
>>>>>>>> The passthrough proposal fundamental concept is:
>>>>>>>>
>>>>>>>> all the native virtio functionalities are between guest driver and
>>>>>>>> the actual
>>>>>>> device.
>>>>>>> see above.
>>>>>>>>> and still, do you want to audit every PCI features? at least you
>>>>>>>>> didn't do that in your series.
>>>>>>>> Can you please list which PCI features audit you are talking about?
>>>>>>> you audit FLR, then do you want to check everyone?
>>>>>>> If no, how to decide which one should be audited, why others not?
>>>>>> I really find it hard to follow your question.
>>>>>>
>>>>>> I explained in patch 5 and 8 about interactions with the FLR and its support.
>>>>>> Not sure what you want me to check.
>>>>>>
>>>>>> You mentioned that "I didn’t audit every PCI features"? So can you
>>>>>> please list
>>>>> which one and in relation to which admin commands?
>>>>> Your job to audit everyone if you talk about FLR. Because FLR is PCI
>>>>> spec, not virtio, you need to explain why other PCI features not need to be
>>> audited.
>>>> Sure, but when you point figure as I didn’t audit, please mention what is not
>>> audited.
>>> well, we are migrating virtio devices, but you keep talking PCI, so do you want to
>>> take every PCI functionalities into considerations>
>> For pci transport, yes.
> First, that is out of virtio spec.
> Second, if so, you should audit every pci feature, state.
> Don't say you want me to define them, this is your statement.
>>>>> We have explained why FLR is not a concern for many times, and I
>>>>> don't want to repeat, please refer to previous discussions.
>>>> You seem to ignore the first paragraph of theory of operation that FLR is not
>>> trapped.
>>> this is the guest issue FLR, right? If so the guest owns the risks and the
>>> hypervisor should not prevent that.
>> Exactly, hypervisor do not prevent it.
>> The owner device still has the ownership to not lose previously logged dirty pages addresses.
>> And device still need to report device reset occurred, so that destination side can wipe off and start fresh.
> OK, so you know the answer now. This answers your own question above.
>>>>>>>> Keep in mind, that will all the mediation, one now must equally
>>>>>>>> audit all this
>>>>>>> giant software stack too.
>>>>>>>> So maybe it is fine for those who are ok with it.
>>>>>>> so you agree FLR is not a problem, at least for config space solution?
>>>>>> I don’t know what you mean "FLR is not a problem".
>>>>>>
>>>>>> FLR on the VF must work as it works without live migration for
>>>>>> passthrough
>>>>> device as today.
>>>>>> And admin commands have some interactions with it.
>>>>>> And this proposal covers it.
>>>>>> I am missing some text that Michael and Jason pointed out.
>>>>>> I am working on v2 to annotate or better word them.
>>>>> When guest reset the device, the device should be reset for sure.
>>>>> then it forgets everything, how do you expect the reset-ed device still work
>>> for live migration?
>>>>> is it a race?
>>>> I don’t expect it live migration to work at all with such a approach.
>>>> This is why in my proposal live migration occurs on the owner device, while
>>> controlled function (member device) is undergoing the device reset.
>>> see above
>>>>>>>>> For migration, you know the hypervisor takes the ownership of the
>>>>>>>>> device in the stop_window.
>>>>>>>> I do not know what stop_window means.
>>>>>>>> Do you mean stop_copy of vfio or it is qemu term?
>>>>>>> when guest freeze.
>>>>>>>>>> 5. Any PASID to separate out admin vq on the VF does not work
>>>>>>>>>> for two
>>>>>>>>> reasons.
>>>>>>>>>> R_1: device flr and device reset must stop all the dmas.
>>>>>>>>>> R_2: PASID by most leading vendors is still not mature enough
>>>>>>>>>> R_3: One also needs to do inversion to not expose PASID
>>>>>>>>>> capability of the member PCI device to not expose
>>>>>>>>> see above and what if guest shutdown? the same answer, right?
>>>>>>>> Not sure, I follow.
>>>>>>>> If the guest shutdown, the guest specific shutdown APIs are called.
>>>>>>>>
>>>>>>>> With passthrough device, R_1 just works as is.
>>>>>>>> R_3 is not needed as they are directly given to the guest.
>>>>>>>> R_2 platform dependency is not needed either.
>>>>>>> I think we already have a concussion for FLR.
>>>>>> I don’t have any concussion.
>>>>>> I wrote what to be supported for the FLR above.
>>>>> OK, again, our discussions has been ignored again, and all start over again.
>>>>>
>>>>> Would you please read our previous discussions?
>>>> You asked the question about why it wont work, I answered.
>>>> I don’t see a point of debating same thing over again.
>>> Is that cut off again?
>>>
>> No it is not cut off here.
>>
>>> if still about FLR, so please see above comments.
>>> And I agree if the answers are ignored again, we don't need to repeat.
>> I didn’t ask questions. Please re-read.
>>
>>>>>>> For PASID, what blocks the solution?
>>>>>> When the device is passthrough, PASID capabilities cannot be emulated.
>>>>>> PASID space is owned fully by the guest.
>>>>>>
>>>>>> There is no single known cpu vendor support splitting pasid between
>>>>> hypervisor and guest.
>>>>>> I can double check, but last I recall that Linux kernel removed such
>>>>>> weird
>>>>> support.
>>>>> do you know there is something called vIOMMU?
>>>> Probably yes.
>

--------------aVWjD0TZwv2keiBL0Wyx0O1Z
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="monospace">resend as Parav requested. This mail format
      looks fine at my side<br>
      <br>
    </font>
    <div class="moz-cite-prefix"><font face="monospace">On 10/18/2023
        2:32 PM, Zhu, Lingshan wrote:<br>
      </font></div>
    <blockquote type="cite"
      cite="mid:b5e21dd5-1aee-4ad1-9833-ceca8c18c461@intel.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <font face="monospace"><br>
      </font> <font face="monospace"><br>
      </font>
      <div class="moz-cite-prefix"><font face="monospace">On 10/18/2023
          1:00 PM, Parav Pandit wrote:<br>
        </font> </div>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: Zhu, Lingshan <a
          class="moz-txt-link-rfc2396E"
          href="mailto:lingshan.zhu@intel.com" moz-do-not-send="true">&lt;lingshan.zhu@intel.com&gt;</a>
Sent: Monday, October 16, 2023 3:14 PM

On 10/13/2023 7:28 PM, Parav Pandit wrote:
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">From: Zhu, Lingshan <a
              class="moz-txt-link-rfc2396E"
              href="mailto:lingshan.zhu@intel.com"
              moz-do-not-send="true">&lt;lingshan.zhu@intel.com&gt;</a>
Sent: Friday, October 13, 2023 2:36 PM
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">[..]
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Because it does not work for passthrough mode.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">what are you talking about?
Config space does not work passthrough?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Once the register space of the VF that is supposed to be used by the live
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">migration is passed to the guest, it is under guest control.
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Hence, live migration driver won't be able to use it.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Does guest control device status to reset itself? harmful?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">No. it is not harmful.
Is owner device reseting itself, harmful? No.
Is member device resetting isetlf, harmful? No.
Should member device reset</pre>
      </blockquote>
      <font face="monospace">good<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">These facilities can be trapped and emulated, even the feature bits, right?
You know the guest actually don't direct access the device config space, there is
a vfio/vdpa driver, right?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">You can practically trap and emulated everything.
If you continue to ignore passthrough requirements and keep repeating that do trap and emulate, this discussion does not go anywhere.</pre>
      </blockquote>
      <font face="monospace">Clearly I did not ignore passthrough and
        keep answering your question for many times.<br>
        Maybe you didn't get it, so I would ask how you define your
        "passthrough"?<br>
      </font> <font face="monospace"><br>
        You may find that the guest vCPUs(guest vRC) actually are not
        privileged to access to<br>
        host pci device(host CPU RC), that's why a pass-through driver
        like vfio is a must.<br>
      </font> <font face="monospace"><br>
        Therefore the device config space can be trapped. Is that clear
        now?<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Have you ever tried pass through a virtio device to a guest?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">:)
Please explain how the question is relevant to this discussion in separate
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">thread, so that one can keep technical focus.
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">(Please keep your discussion technical, instead of derogatory to other
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">members).
if you want me to answer your question, at least you SHOULD NOT cut off the
context, or you are trying to confuse everyone.
Or did you try to avoid or hide anything? I am not sure this is a good practice.

The context in last discussion is:

me: OK, I pop-ed Jason's proposal to make everything easier, and I see it is
refused.
you: Because it does not work for passthrough mode.
me: what are you talking about?
     Config space does not work passthrough?
     Have you ever tried pass through a virtio device to a guest?

So I ask you try to pass through a virito-pci device to a guest, then check
whether the config space work for pass-through mode.

again, don't cut off threads before the discussion is closed.
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Let me repeat again, these live migration facilities are
per-device(per-VF) facility, so it only migrates itself.

</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Since they are per device (per VF), they reside in the guest VM. Hence, VMM
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">cannot live migrate it.
you know the config space can be trapped and emulated, and the hypervisor
takes the ownership of the device once the guest freeze in the stop window.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">When you say config space, do you mean PCI config space of 4K size?</pre>
      </blockquote>
      <font face="monospace">you can take an example of virito common
        config cap.<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">And for pass through, you can try passthrough a virito device to a
guest, see how the guest initialize the device through the config space.

That is really basic virtualization, not hard to test.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Repeated points, I am omitting.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">ok, if you get it, let's close it.
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">inflight descriptor tracking will be implemented by Eugenio in V2.
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">When we have near complete proposal from two device vendors, you
want to push something to unknown future without reviewing the
work; does not
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">make sense.
Didn't I ever provide feedback to you? Really?
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">No. I didn’t see why you need to post a new patch for dirty page
tracking,
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">when it is already present in this series.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">This is plain ignorance and shows non_cooperative mode of working in
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">technical committee.
you have cut off the tread again, so I can't read the context.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Enjoy long threads. 😊</pre>
      </blockquote>
      <font face="monospace">you skip finished discussions for sure, but
        don't do that to on-going discussions.<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">I would like to understand and review this aspects.
Same for the device context.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">you will see dirty page tracking in my V2, as I repeated for many times.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Since you are not co-operative, I have less sympathy to see V2.
I don’t see a reason to see when, it is fully presented here.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Again, please don't take it personal and please be professional.

Speaking of collaboration, please at least respect others' time and answers.
Both Jason and I have responded to you multiple times on the same
questions(for example, FLR, nested, passthrough).
If our answers are ignored again and again, and then after a few days or hours
you come back asking the same question again, what's the point?

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I didn’t ask questions in area of FLR and passthrough, please check again.</pre>
      </blockquote>
      <font face="monospace">OK, then please don't force us answer the
        same questions anymore, for example no FLR anymore.<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">And please don't cut off any threads before we close the discussion.
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">For device context, we have discussed this in other threads, did you
ignored that again?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">No. I didn’t. I replied that the generic infrastructure is built the enables every
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">device type to migrate by defining their device context.
don't we have a conclusion there or did you miss anything? Since you refuse to
define device context for every device type, how do you migrate stateful
devices?

So we should implement a stateless live migration solution, right?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">No. device context is basic facility that intent to cover most virtio devices.</pre>
      </blockquote>
      <font face="monospace">not most, instead it should be "all", if
        you are implementing a virtio live migration.<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <pre class="moz-quote-pre" wrap="">I didn’t not refuse to define context.
I said, device context will be incrementally defined subsequently.</pre>
      </blockquote>
      <font face="monospace">just define what we have now, for example,
        define virito-fs as it is now.<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <pre class="moz-quote-pre" wrap="">Like Michael said, I expect every device to define device context section in coming months for 1.4 time frame.</pre>
      </blockquote>
      <font face="monospace">as MST said, do you expect the
        implementation to figure out the device context by themselves?<br>
        If you want to migrate device context, you should define them.<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Hint: how do you define device context for every device type, e.g, virtio-fs.
Don't say you only migrate virito-net or blk.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I didn’t say it. I said to migrate all 30+ device types.
And infrastructure is presented here.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">so please define device context for all the devices.
how about starting from virtio-fs?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Should be done incrementally.</pre>
      </blockquote>
      <font face="monospace">show me your patch<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">You are still in the mode of _take_ what we did with near zero
</pre>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">explanation.
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">You asked question of why passthrough proposal cannot advantage of
in_band
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">config registers.
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">I explained technical reason listed here.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">I have answered the questions, and asked questions for many times.
What do you mean by "why passthrough proposal cannot advantage of
in_band config registers."?
Config space work for passthrough for sure.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Config space registers are passthrough the guest VM.
Hence hypervisor messing it with, programming some address would
result in
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">either security issue.
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Or functionally broken, to sustain the functionality, each nested
layer needs
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">one copy of these registers for each nest level.
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">So they must be trapped somehow.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">trap and emulated are basic virtualization.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Not for passthrough devices, sorry.
See the paper that Jason pointed out.
Control program/vmm is trap is involved only on the privileged operation of
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">the VMM.
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Virtio cvqs, virtio registers are not the privileged operation of the VMM,
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">because they are of the native virtio device itself.
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Period.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">since the context is cut of again, I failed to read the context.

But config space can be trapped and emulated, right?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Answered above.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">When guest accessing device config space, actually it access the hypervisor-
presented config space.
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Secondly I don’t see how one can read 1M flows using config registers.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Not sure what you are talking about, beyond the spec?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">The spec which is under works for few months by multiple technical
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">members.
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Please subscribe to virtio-comment mailing list.
How come you changed your point from cvq to different argument of out
of spec? :)
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I mean, what is your 1M flows? is it beyond spec?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">No. it is not beyond the spec.
It is the spec in work for several months by multiple device, OS and cloud operators.</pre>
      </blockquote>
      <font face="monospace">then, again, what is your 1M flow? if not
        defined in the spec, then it is beyond spec.<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">So please don’t jump to conclusions before finishing the
discussion on how
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">both side can take advantage of each other.
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">Lets please do that.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">We have proposed a solution, right?

</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Which one? To do something in future?
I don’t see a suggestion on how one can use device context and dirty
page
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">tracking for nested and passthrough uniformly.
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">I see a technical difficulty in making both work with uniform interface.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Please don't ignore previous answers, don't force us repeat again and again.

</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">You didn’t answer, how.
Your answer was "you will post dirty page tracking without reviewing current"
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">and Eugenio will post v2....
Yes, will do. and you can check the patch when it posted.

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Does not make sense to me at all.</pre>
      </blockquote>
      <font face="monospace">tracking dirty pages does not make sense to
        you?<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <pre class="moz-quote-pre" wrap=""> 
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Eugenio will cook a patch for in-flight descriptors, not dirty page, that is mine.
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">It is Jason's proposal. Please refer to previous threads, also for
device context and dirty pages.
</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">I still need to point out: admin vq LM does not work, one example is
</pre>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">nested.
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">As Michael said, please don’t confuse between admin commands and
admin
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">vq.
anyway, admin vq live migration don't work for nested.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I am convicned with the paper that Jason pointed out.

A nested solution involves a member device supporting the nesting without
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">trap and emulation so that it follows the two properties:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">The efficiency property and equivalence property.

Hence a member device which wants to support nested case, should present
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">itself with attributes to support nesting.
failed to process the sentence, but I am glad you are convinced by the paper.
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">There are no scale problem as I repeated for many time, they are
per-device basic facilities, just migrate the VF by its own
facility, so there are no 40000 member devices, this is not per PF.

</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">I explained that device reset, flr etc flow cannot work when
controlling and
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">controlled functions are single entity for passthrough mode.
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">The scale problem is, one needs to duplicate the registers on each VF.
The industry is moving away from the register interface in many
_real_ hw
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">devices implementation.
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">Some of the examples are IMS, SIOV, NVMe and more.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">we have discussed this for many times, please refer to previous
threads, even with Jason.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">I do not agree for any registers to add to the VF which are reset on
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">device_reset and FLR.
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">As it does not work for passthrough mode.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Jason has answered your these FLR questions for many times, I don't
want to repeat his words, even myself have answered many times. If
you keep ignoring the answers, and ask again and again, what is the point?

So please refer to the previous threads.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I don’t think I asked the question above. Please re-read.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">you cut if off again, what question? if about FLR, I believe Jason has answered
for many times.
</pre>
          <blockquote type="cite"> </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Again, please read. I didn’t ask the question for FLR.
You keep saying "what question".</pre>
      </blockquote>
      <font face="monospace">I failed to read the context because you
        have cut them off.<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">The device context can be read from config space or trapped, like
shadow
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">There are 1 million flows of the net device flow filters in progress.
Each flow is 64B in size.
Total size is 64MB.
I don’t see how one can read such amount of memory using config
</pre>
                  </blockquote>
                </blockquote>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">registers.
</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">control vq?
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">The control vq and flow filter vqs are owned by the guest driver,
not the
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">hypervisor.
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">So no, cvq cannot be used.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">first, don't cut off the threads, don't delete words, that really confusing
</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">readers.
</pre>
          <blockquote type="cite">
            <blockquote type="cite"> </blockquote>
            <pre class="moz-quote-pre" wrap="">Your comments are so long that it is hard to follow such a long thread.
Hence only the related comments are kept.
But I understand, will try to avoid.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">And I think you misunderstand a lot of virtualization fundamentals,
at least have a look at how shadow control vq works.

</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">In case if you don’t know, the shadow cvq acceleration for Nvidia ConnectX6-
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">DX is done jointly with Dragos and me, with recent patches from Sie-Wei.
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">I don’t think so I missed.

Shadow vq is great when you don’t have underlying support from the device.

When you have passthrough member devices, they are not trapped or
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">emulated.
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">The future hypervisor must not be able to see things of cvq, datavq or
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">addressed programmed by the guest.
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">And hence the infrastructure is geared towards such approach.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I failed to read the full context as you cut off them. I can't even read your
original questions, they are truncated.

Anyway, lets migrate device without device-context first.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Passthrough device cannot migrate without device-context as listed.</pre>
      </blockquote>
      <font face="monospace">so please define the device context.<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">And the parameters set to config vq are also device context as we
discussed for many times.
</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Or do you want to migrate non-virtio context?
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Every thing is virtio device context.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">see above
</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">control vq which is already done, that is basic virtualization.
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">There is nothing like "basic virtualization".
What is proposed here is fulfilling the requirement of passthrough mode.

Your comment is implying, "I don’t care for passthrough
requirements, do
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">non_passthrough".
that is your understanding, and you misunderstood it. Config space
servers passthrough for many years.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">"Config space servers" ?
I do not understand it, can you please explain what does that mean?

I do not see your suggestion on how one can implement passthrough
member
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">device when passthrough device does the dma and migration framework
also need to do the dma.
Try pass through a virtio device to a guest and learn how the guest
take advantage the config space before you comment.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Right. It does not work. The guest is doing the device_reset and flr.
Hence, it is resetting everything. All the dirty page log is lost.
All the device context is lost.
Hypervisor didn’t see any of this happening, because it didn’t do the trap.

Look, if you are going to continue to argue that you must do trap +
emulation and don’t talk about passthrough, Please stop here, because
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">discussion won't go anywhere.
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">I made my best to answer the limitations in very first email where you asked.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">OK, I see the gap, and I am sure we can help you here.
Try consider a question:
how do you define pass-through? 
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">As defined in the cover letter and theory of operation.
Repeat here:
A device whose virtio interfaces are not intercepted by VMM.
In future, may be even MSI-X and MSI-X_v2 or newer interrupt method will be passthrough at device level too.
(only cpu level interrupt remapping will be hypercall at interrupt controller level).

A PCI spec defined config space to stay as emulated as it is generic and not supposed to have any virtio specific things in it as directed by the PCI-SIG.</pre>
      </blockquote>
      <font face="monospace">how guest access device config space in
        your "passthrough"? <br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Can a guest access the device without a host driver helper?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Yes for all the virtio interfaces which includes, virtio device common and device config space, cvq, data vq, flow filter vqs, shared memory and anything new of the future.</pre>
      </blockquote>
      <font face="monospace">interesting, if so, let me ask you a
        question, Is a guest privileged to access any devices on the
        host?<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">That basic facility is missing dirty page tracking, P2P support,
device context,
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">FLR, device reset support.
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Hence, it is unusable right now for passthough member device.
And 6th problemetic thing in it is, it does not scale with member devices.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Please refer to previous discussions, it is meaningless if you keep
ignoring our answers and keep asking the same questions.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Again, please re-read, I didn’t ask the question.
I replied 6 problems that are not solved.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I believe we have answered for many times. The questions are cut off again, but
how about search for previous answers?
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">If you want to migrate device context, you need to specify device
context for every type of device, net maybe easy, how do you see virtio-
</pre>
                    </blockquote>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">fs?
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">Virtio-fs will have its on device context too.
Every device has some sort of backend in varied degree.
Net being widely used and moderate complex device.
Fs being slightly stateful but less complex than net, as it has
far less control
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">operations.
so, do you say you have implement a live migration solution which
can migrate device context, but only work for net or block?
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">I don’t think this question about implementation has any relevance.
Frankly feels like a court to me. :( No. I dint say that.
We have implemented net, fs, block devices and single framework
proposed
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">here can support all 3 and rest 28+.
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">The device context part in this series do not cover special/optional
things of
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">all the device type.
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">This is something I promised to do gradually, once the framework looks
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">good.
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">If you don't define them, only talking about "migrate the device
context" but don't tell us what do migrate, does this make sense to anybody?
</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Then you should call it virtio net/blk migration and implement in
net/block section.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">No. you misunderstood. My point was showing orthogonal complexities
of net
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">vs fs.
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">I likely failed to explain that.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">see above, anyway you need to define them, how about starting form virito
</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">FS?
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">In fact virtio-fs device already discusses the migrating the
device side state, as
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">listed in device context.
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">So virtio-fs device will have its own device-context defined.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">if you want to migrate it, you need to define it
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Sure.
Only device specific things to be defined in future.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Now, not future if you want to migrate device context.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">It is not mandatory, and it is impractical do everything in one series.
It is planned for 1.4.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">really, you want to define device context for every device time?

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Yes.
 
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Remember don't migrate device-context before you define them or how can
the HW implementions know how to do.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I disagree. The infrastructure is defined. And incrementally device context will also be defined.
See an example work from Michael, i.e. admin command and aq generic facility is defined.
And device migration is able to utilize it incrementally. The lower layer fulfill the requirements.
This is exactly what is done here.

Device context framework is defined and many device spec owners will be easily define their device context making it migratable.</pre>
      </blockquote>
      <font face="monospace">see above answers for device context.<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Rest is already present.
We are not going to define all the device context in one patch
series that no
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">one can review reliably.
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">It will be done incrementally.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">so you agree at least for now we should migrate stateless devices, right?
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">But the feedback, I am taking is, we need to add a command that
indicates
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">which TLVs are supported in the device migration.
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">So virtio-fs or other device migration capabilities can be discovered.
I will cover this in v2.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">so you propose a solution as "virtio migration", but only migrate
selective types of devices?
You should rename it to be "virtio-net live migration".
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Sorry, I wont. Because infrastructure is for majority device types.

Which field did you observe which is net specific?
We want to cover all the device types.
Don’t need to cook their context in one series.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">so, not work for all device types? limited to some specific types?
you still need to rename it what ever.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">No. framework works for all device types.</pre>
      </blockquote>
      <font face="monospace">without defining them?<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Thanks a lot for this thoughts.

</pre>
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">The infrastructure and basic facilities are setup in this series,
that one can
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">easily extend for all the current and new device types.
really? how?
</pre>
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">And we are migrating stateless devices, or no? How do you migrate
virtio-
</pre>
                    </blockquote>
                  </blockquote>
                </blockquote>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">fs?
</pre>
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <blockquote type="cite">
                        <pre class="moz-quote-pre" wrap="">2. sharing such large context and write addresses in parallel
for multiple devices cannot be done using single register file
</pre>
                      </blockquote>
                      <pre class="moz-quote-pre" wrap="">see above
</pre>
                      <blockquote type="cite">
                        <pre class="moz-quote-pre" wrap="">3. These registers cannot be residing in the VF because VF can
undergo FLR, and device reset which must clear these registers
</pre>
                      </blockquote>
                      <pre class="moz-quote-pre" wrap="">do you mean you want to audit all PCI features? When FLR, the
device is rested, do you expect a device remember anything after FLR?
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">Not at all. VF member device will not remember anything after FLR.
</pre>
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">Do you want to trap FLR? Why?
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">This proposal does _not_ want to trap the FLR in the hypervisor virtio
</pre>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">driver.
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">When one does the mediation-based design, it must
trap/emulate/fake the
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">FLR.
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">It helps to address the case of nested as you mentioned.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">once passthrough, the guest driver can access the config space to
reset the device, right?
</pre>
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">Why FLR block or conflict with live migration?
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">It does not block or conflict.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">OK, cool, so let's make this a conclusion
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">The whole point is, when you put live migration functionality on
the VF itself,
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">you just cannot FLR this device.
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">One must trap the FLR and do fake FLR and build the whole
infrastructure to
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">not FLR The device.
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">Above is not passthrough device.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">No, the guest can reset the device, even causing a failed live migration.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Not in the proposal here.
Can you please prove how in the current v1 proposal, device reset
will fail the
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">migration?
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">I would like to fix it.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">if the device is reset, it forgets everything right?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Right. This is why all dirty page track; device context is lost on device reset.
Hence, the controlling function and controlled function are two different
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">entities.
so there can be inconsistent migrations and races, right? And if the guest reset
the device, actually the hypervisor should let it be, right?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">No. it should not be in because hypervisor has not composed the member device. It is in the hw controlled function itself.</pre>
      </blockquote>
      <font face="monospace">interesting, do you mean when the guest
        reset the device, the hypervisor should refuse?<br>
      </font> <font face="monospace"><br>
        This actually conflict with your statement of your "passthrough"
        by " <span style="white-space: pre-wrap">not intercepted by VMM<font
        style="white-space: normal;">".

So you actually understand trap and emulate and passthrough.
</font></span></font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <blockquote type="cite">
                        <pre class="moz-quote-pre" wrap="">4. When VF does the DMA, all dma occurs in the guest address
space, not in
</pre>
                      </blockquote>
                      <pre class="moz-quote-pre" wrap="">hypervisor space; any flr and device reset must stop such dma.
</pre>
                      <blockquote type="cite">
                        <pre class="moz-quote-pre" wrap="">And device reset and flr are controlled by the guest (not
mediated by
</pre>
                      </blockquote>
                      <pre class="moz-quote-pre" wrap="">hypervisor).
if the guest reset the device, it is totally reasonable
operation, and the guest own the risk, right?
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">Sure, but the guest still expects its dirty pages and device
context to be
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">migrated across device_reset.
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">Device_reset will lose all this information within the device if
done without
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">mediation and special care.
No, if the guest reset a device, that means the device should be
RESET, to forget its config, that would be really wired to migrate
a fresh device at the source side, to be a running device at the
destination
</pre>
                </blockquote>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">side.
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Device reset not doing the role of reset is just a plain broken spec.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">why? The reset behavior is well defined in the spec, and works fine for years.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">So any new construct that one adds, it will be reset as well and dirty page
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">track is lost.
Yes and do you want to prevent that? You may surprise the guest.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Yes, want to prevent that.
Not sure what you mean by surprise the guest. Unlikely.
Why because guest did the reset, it knows what it is doing.
(Keep in mind that guest does not expect to lose its dirty pages).</pre>
      </blockquote>
      <font face="monospace">Shocked...<br>
      </font> <font face="monospace"><br>
        This statement conflict with basic virtualization. <br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">So, to avoid that now one needs to have fake device reset too and
build that
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">infrastructure to not reset.
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">The passthrough proposal fundamental concept is:

all the native virtio functionalities are between guest driver and
the actual
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">device.
see above.
</pre>
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">and still, do you want to audit every PCI features? at least you
didn't do that in your series.
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">Can you please list which PCI features audit you are talking about?
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">you audit FLR, then do you want to check everyone?
If no, how to decide which one should be audited, why others not?
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">I really find it hard to follow your question.

I explained in patch 5 and 8 about interactions with the FLR and its support.
Not sure what you want me to check.

You mentioned that "I didn’t audit every PCI features"? So can you
please list
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">which one and in relation to which admin commands?
Your job to audit everyone if you talk about FLR. Because FLR is PCI
spec, not virtio, you need to explain why other PCI features not need to be
</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">audited.
</pre>
          <blockquote type="cite">
            <blockquote type="cite"> </blockquote>
            <pre class="moz-quote-pre" wrap="">Sure, but when you point figure as I didn’t audit, please mention what is not
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">audited.
well, we are migrating virtio devices, but you keep talking PCI, so do you want to
take every PCI functionalities into considerations&gt;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">For pci transport, yes.</pre>
      </blockquote>
      <font face="monospace">First, that is out of virtio spec.<br>
        Second, if so, you should audit every pci feature, state.<br>
        Don't say you want me to define them, this is your statement.<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">We have explained why FLR is not a concern for many times, and I
don't want to repeat, please refer to previous discussions.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">You seem to ignore the first paragraph of theory of operation that FLR is not
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">trapped.
this is the guest issue FLR, right? If so the guest owns the risks and the
hypervisor should not prevent that.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Exactly, hypervisor do not prevent it.
The owner device still has the ownership to not lose previously logged dirty pages addresses.
And device still need to report device reset occurred, so that destination side can wipe off and start fresh.</pre>
      </blockquote>
      <font face="monospace">OK, so you know the answer now. This
        answers your own question above.<br>
      </font>
      <blockquote type="cite"
cite="mid:PH0PR12MB5481EBA856D74951069F3DD1DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">Keep in mind, that will all the mediation, one now must equally
audit all this
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">giant software stack too.
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">So maybe it is fine for those who are ok with it.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">so you agree FLR is not a problem, at least for config space solution?
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">I don’t know what you mean "FLR is not a problem".

FLR on the VF must work as it works without live migration for
passthrough
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">device as today.
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">And admin commands have some interactions with it.
And this proposal covers it.
I am missing some text that Michael and Jason pointed out.
I am working on v2 to annotate or better word them.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">When guest reset the device, the device should be reset for sure.
then it forgets everything, how do you expect the reset-ed device still work
</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">for live migration?
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">is it a race?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I don’t expect it live migration to work at all with such a approach.
This is why in my proposal live migration occurs on the owner device, while
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">controlled function (member device) is undergoing the device reset.
see above
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <pre class="moz-quote-pre" wrap="">For migration, you know the hypervisor takes the ownership of the
device in the stop_window.
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">I do not know what stop_window means.
Do you mean stop_copy of vfio or it is qemu term?
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">when guest freeze.
</pre>
                  <blockquote type="cite">
                    <blockquote type="cite">
                      <blockquote type="cite">
                        <pre class="moz-quote-pre" wrap="">5. Any PASID to separate out admin vq on the VF does not work
for two
</pre>
                      </blockquote>
                      <pre class="moz-quote-pre" wrap="">reasons.
</pre>
                      <blockquote type="cite">
                        <pre class="moz-quote-pre" wrap="">R_1: device flr and device reset must stop all the dmas.
R_2: PASID by most leading vendors is still not mature enough
R_3: One also needs to do inversion to not expose PASID
capability of the member PCI device to not expose
</pre>
                      </blockquote>
                      <pre class="moz-quote-pre" wrap="">see above and what if guest shutdown? the same answer, right?
</pre>
                    </blockquote>
                    <pre class="moz-quote-pre" wrap="">Not sure, I follow.
If the guest shutdown, the guest specific shutdown APIs are called.

With passthrough device, R_1 just works as is.
R_3 is not needed as they are directly given to the guest.
R_2 platform dependency is not needed either.
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">I think we already have a concussion for FLR.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">I don’t have any concussion.
I wrote what to be supported for the FLR above.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">OK, again, our discussions has been ignored again, and all start over again.

Would you please read our previous discussions?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">You asked the question about why it wont work, I answered.
I don’t see a point of debating same thing over again.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Is that cut off again?

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">No it is not cut off here.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">if still about FLR, so please see above comments.
And I agree if the answers are ignored again, we don't need to repeat.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I didn’t ask questions. Please re-read.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">For PASID, what blocks the solution?
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">When the device is passthrough, PASID capabilities cannot be emulated.
PASID space is owned fully by the guest.

There is no single known cpu vendor support splitting pasid between
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">hypervisor and guest.
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">I can double check, but last I recall that Linux kernel removed such
weird
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">support.
do you know there is something called vIOMMU?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Probably yes.
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <font face="monospace"><br>
      </font> </blockquote>
    <font face="monospace"><br>
    </font>
  </body>
</html>

--------------aVWjD0TZwv2keiBL0Wyx0O1Z--

