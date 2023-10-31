Return-Path: <virtio-comment-return-8061-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871B6C4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 09:42:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E3053613D0
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 09:42:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C3B99986B74
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 09:42:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B807F986B68; Tue, 31 Oct 2023 09:42:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A9AF6986B69
	for <virtio-comment@lists.oasis-open.org>; Tue, 31 Oct 2023 09:42:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="392115797"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="392115797"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="904289823"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="904289823"
Message-ID: <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
Date: Tue, 31 Oct 2023 17:42:29 +0800
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
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <PH0PR12MB54819C3A4BC9BB419715AB73DCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f2707430-bb1e-4dcd-b0b3-2b9a705e555a@intel.com>
 <PH0PR12MB5481033BB7C0BCABAE329B13DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f9a604b2-7bc9-49ce-bd28-59909f0a5fec@intel.com>
 <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9604eb82-8efd-46cd-8b15-90fc637eff0c@intel.com>
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 10/30/2023 6:23 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Monday, October 30, 2023 3:33 PM
>>
>> On 10/30/2023 12:17 PM, Parav Pandit wrote:
>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>> Sent: Monday, October 30, 2023 9:15 AM
>>>>
>>>> On 10/26/2023 3:04 PM, Parav Pandit wrote:
>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>> Sent: Thursday, October 26, 2023 12:14 PM
>>>>>>
>>>>>>
>>>>>> On 10/24/2023 6:37 PM, Parav Pandit wrote:
>>>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>>>> Sent: Tuesday, October 24, 2023 4:00 PM
>>>>>>>>
>>>>>>>> On 10/23/2023 6:14 PM, Parav Pandit wrote:
>>>>>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>> Sent: Monday, October 23, 2023 3:39 PM
>>>>>>>>>>
>>>>>>>>>> On 10/20/2023 8:54 PM, Parav Pandit wrote:
>>>>>>>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>>>> Sent: Friday, October 20, 2023 3:01 PM
>>>>>>>>>>>>
>>>>>>>>>>>> On 10/19/2023 6:33 PM, Parav Pandit wrote:
>>>>>>>>>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>>>>>> Sent: Thursday, October 19, 2023 2:48 PM
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On 10/19/2023 5:14 PM, Michael S. Tsirkin wrote:
>>>>>>>>>>>>>>> On Thu, Oct 19, 2023 at 09:13:16AM +0000, Parav Pandit
>> wrote:
>>>>>>>>>>>>>>>>> Oh, really? Quite interesting, do you want to move all
>>>>>>>>>>>>>>>>> config space fields in VF to admin vq? Have a plan?
>>>>>>>>>>>>>>>> Not in my plan for spec 1.4 time frame.
>>>>>>>>>>>>>>>> I do not want to divert the discussion, would like to
>>>>>>>>>>>>>>>> focus on device
>>>>>>>>>>>>>> migration phases.
>>>>>>>>>>>>>>>> Lets please discuss in some other dedicated thread.
>>>>>>>>>>>>>>> Possibly, if there's a way to send admin commands to vf
>>>>>>>>>>>>>>> itself then Lingshan will be happy?
>>>>>>>>>>>>>> still need to prove why admin commands are better than
>> registers.
>>>>>>>>>>>>> Virtio spec development is not proof based approach. Please
>>>>>>>>>>>>> stop asking for
>>>>>>>>>> it.
>>>>>>>>>>>>> I tried my best to have technical answer in [1].
>>>>>>>>>>>>> I explained that registers simply do not work for
>>>>>>>>>>>>> passthrough mode (if this is what you are asking when you
>>>>>>>>>>>>> are asking prove its
>>>>>> better).
>>>>>>>>>>>>> They can work for non_passthrough mediated mode.
>>>>>>>>>>>>>
>>>>>>>>>>>>> A member device may do admin commands using registers.
>>>>>>>>>>>>> Michael and I are
>>>>>>>>>>>> discussing presently in the same thread.
>>>>>>>>>>>>> Since there are multiple things to be done for device
>>>>>>>>>>>>> migration, dedicated
>>>>>>>>>>>> register set for each functionality do not scale well, hard
>>>>>>>>>>>> to maintain and extend.
>>>>>>>>>>>>> A register holding a command content make sense.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Now, with that, if this can be useful only for
>>>>>>>>>>>>> non_passthrough, I made humble
>>>>>>>>>>>> request to transport them using AQ, this way, you get all
>>>>>>>>>>>> benefits of
>>>> AQ.
>>>>>>>>>>>>> And trying to understand, why AQ cannot possible or inferior?
>>>>>>>>>>>>>
>>>>>>>>>>>>> If you have commands like suspend/resume device, register or
>>>>>>>>>>>>> queue
>>>>>>>>>>>> transport simply don’t work, because it's wrong to bifurcate
>>>>>>>>>>>> the device with such weird API.
>>>>>>>>>>>>> If you want to biferacate for mediation software, it
>>>>>>>>>>>>> probably makes sense to
>>>>>>>>>>>> operate at each VQ level, config space level. Such are very
>>>>>>>>>>>> different commands than passthrough.
>>>>>>>>>>>>> I think vdpa has demonstrated that very well on how to do
>>>>>>>>>>>>> specific work for
>>>>>>>>>>>> specific device type. So some of those work can be done using AQ.
>>>>>>>>>>>>> [1]
>>>>>>>>>>>>> https://lore.kernel.org/virtio-comment/870ace02-f99c-4582-93
>>>>>>>>>>>>> 2f
>>>>>>>>>>>>> -b
>>>>>>>>>>>>> d1
>>>>>>>>>>>>> 03
>>>>>>>>>>>>> 36
>>>>>>>>>>>>>
>>>>>> 2dae9@intel.com/T/#m37743aa924536d0256d6b3b8e83a11c750f28794
>>>>>>>>>>>> We have been through your statement for many times.
>>>>>>>>>>>> This is not about how many times you repeated, if you think
>>>>>>>>>>>> this is true, you need to prove that with solid evidence.
>>>>>>>>>>>>
>>>>>>>>>>> I will not respond to this comment anymore.
>>>>>>>>>> Ok if you choose not to respond.
>>>>>>>>>>>> For pass-through, I still recommend you to take a reference
>>>>>>>>>>>> of current virito-pci implementation, it works for pass-through,
>> right?
>>>>>>>>>>> What do you mean by current virtio-pci implementation?
>>>>>>>>>> current virito-pci works for pass-through
>>>>>>>>> I still don’t understand what is "current virtio-pci".
>>>>>>>>> Do you mean qemu implementation of emulated virtio-pci or you
>>>>>>>>> mean
>>>>>>>> virtio-pci specification for passthrough?
>>>>>>>>> What do you want me to refer to for passthrough? Please clarify.
>>>>>>>> you know guest vcpu and its vRC can not access host side devices,
>>>>>>>> and there must be a driver helping the pass-through use cases,
>>>>>>>> like vDPA and vfio
>>>>>>> I am not sure how to corelate this answer to the question of
>>>>>>> "virtio-pci for
>>>>>> passthrough".
>>>>>>> :(
>>>>>>>
>>>>>>> Today when a virtio-pci member device is passthrough to the guest
>>>>>>> VM,
>>>>>> hypervisor is not involved in virtio interface such as config
>>>>>> space, cvq, data vq etc.
>>>>>>> Do you agree?
>>>>> You didn’t respond yet to this question.
>>>>> Can you please respond?
>>>> Not sure which question you refer to that not answered, Agree what?
>>> What is listed above.
>>>
>>>> Please don't cut off the thread until the issue closed.
>>>>
>>> I didn’t cut off the thread. Please check your email client.
>>>
>>>> If you are asking whether hypervisor is involved in accessing virtio
>> interfaces.
>>>> For passthrough, guest needs a host side help driver to access
>>>> hardware, and explained below.
>>> Not an accurate answer. Please answer above.
>>> Repeating the question again.
>>> For passthrough device virtio interfaces such as common and device config
>> space, cvq, data vqs, are NOT accessed by the hypervisor.
>>> Do you agree?
>> Did you failed to process the answer?
>>
> Yes, there was no answer the above simple question.
> You did counter question.
>
>> Let me repeat again, for the last time.
>>
>> The guest can not access any host side devices without a "pass-through helper
>> driver".
> He he, now you generalize it as "guest" when the question came to discuss the exact definition of passthrough.
> Ofcourse there is helper driver for pci config space.
> But you took that granted saying X trap+emulated so X+Y is also trap+emulated.
>
>> And the helper driver could be considered as a part of the hypervisor, or the
>> guest vCPU can not access the host side devices.
>>
>> For example, the path is hw-->vfio_pci-->qemu-->guest. IT IS NOT hw-->guest.
>>
> In virtio spec we only talk about the driver, and the device in context of passthrough device.
> So for virtio common config, dev config, cvq, data vqs are guest driver -> device.
> There is no other entity inbetween.
>
>> You can try to take a loot at how virtio-pci work for QEMU.
>>
> When I asked you what is virtio-pci in context of passthrough, you couldn’t answer what that component is.
well, pci is quite clear here to be a transport.

To all above questions, As MST suggested, we agree the definition and 
usecase of "pass-through" is clear to us,
so I will stop repeating the answers. If you still fail to understand, 
sorry and can not help.
>
>> If you failed to understand this, then I don't see any necessities to discuss on this
>> topic anymore.
> The discussion is about passthrough. 😊
> You are talking about some vpci composition.
see above
>
>>>
>>>>>> Can vCPU access host side device config space? It needs a
>>>>>> pass-through helper driver like vfio, right?
>>>>> Right.
>>>>> And if you are implying that, because generic pci config space is
>>>>> intercepted
>>>> hence, all virtio common and device specific things MUST BE ALWAYS
>>>> intercepted as well.
>>>>> Then I do not agree with such derivation.
>>>> This is not only virtio, guest needs a helper to access host devices.
>>> Does not make sense until you reply above.
>> see above
> Still not not make sense with your implied reply.
>
>>>>> The main reasons are:
>>>>> 1. It breaks the future TDISP model
>>>> Not sure why you bring TDISP again, I thought we agree this is closed.
>>>>
>>> Not to include TDISP in current spec, but the mechanism/infrastructure built
>> applies to the future mode as well.
>> then discuss in future.
>>>> How it break TDISP? Can you let guest driver access host device
>>>> whiteout a host side helper like VFIO?
>>> Yes, once it is passthrough virtio interface is a secure channel.
>>> In TDISP config space is still communicated via hypervisor and it contains all
>> the data that is not critical.
>>> Hence, there must not be any virtio registers to place in there.
>>> In future if one discovers config space as problematic, one will find generic
>> solution for all the pci devices, not just virtio.
>> interesting, how does guest vCPU access host side devices without a helper
>> driver, even a secure channel?
> A helper driver maps the PCI memory of passthrough device to the guest VM for direct access.
> And locks the TDISP so that hypervisor cannot change this mapping in the future.
>
> After this control plane driver, it is no longer in the picture.
>
>> So do you mean even queue_enable should not be there??? really interesting.
>>
> 100% yes, it must not be there.
>
>>>> And TDISP says you should not trust PF, thus you should not use admin
>>>> vq on PF for live migration.
>>> There are few options which will evolve.
>>> 1. PF will be handed over to the TVM instead of hypervisor 2. PF aq
>>> communication will be encrypted hence not visible to hypervisor, also
>>> supported by PCI-SIG already 3. Some other options Since this is the
>>> generic solution across virtio and non_virtio, we can rely on wider wisdom of
>> PCI-SIG.
>> TDISP says don't trust PF anyway.
> Ok. this is why it will be encrypted or will be dedicated to a live migration portion of the device.
>
>>>>> 2. Without hypervisor getting involved, all the member device MMIO
>>>>> space is accessible which follows the efficiency and equivalency
>>>>> principle of Jason listed paper
>>>>>
>>>>> I hope you are not implying to trap+emulate virtio interfaces (which
>>>>> is not
>>>> listed in the pci-spec) in hypervisor for member passthrough devices.
>>>> Do you agree mmap the bars(interfaces) without doing anything is also
>>>> a type of "trap and emulate"?
>>> Certainly not.
>>> Memory mapping enables guest to _directly_ communicate with the device
>> without any VMEXITS.
>>> In TDISP world this is also even secured already.
>>> So no, it is not trap and emulate.
>> Interesting. do you know virtualization is built on "trap and emulate"?
>> and pass-through is a special case of "trap and emulate"
>>
> Huh, there is no such definition like that.
> And not relevant here anyway, I am not going to discuss anything like this which is outside the scope of this discussion.
>
> As I repeatedly said, you continue to think that trap+emultion is the _only_ way to make progress for member devices.
> And that is already out of question as TC has already long ago embraced the rest the industry to have hw based devices.
> Sriov member based devices is first of its kind.
see above.
>
>> If you want to discuss TDISP, then TDISP secured device only accepts TLP from
>> the owner, that means it only support the special case, and that is an limitation
>> of TDISP.
>>
>> But generally speaking, you can always choose to trap and emulate any fields in
>> the bar.
> Generally yes.
> For passthrough, there is no such need of extra layers when the member device already has it.
see above.
>
>> Why is TDISP related to current live migration proposal?
>> Why we are discussing this?
> The scheme propose here aligns to the future where trap+emulation of bifurcating the device is not there.
well, then let's talk in the future when it comes true.
>
>>>>>>>>>>>> For scale, I already told you for many times that they are
>>>>>>>>>>>> per-device facilities. How can a per-device facility not scale?
>>>>>>>>>>> Each VF device must implement new set of on-chip memory-based
>>>>>>>>>>> registers
>>>>>>>>>> which demands more power, die area which does not scale
>>>>>>>>>> efficiently to thousands of VFs.
>>>>>>>>>> that can be fpga gates or SOC implementing new features, you
>>>>>>>>>> think that is a waste?
>>>>>>>>> It is waste in hw, if there is a better approach possible to not
>>>>>>>>> burn them as
>>>>>>>> gates and save on resources for rarely used items.
>>>>>>>> Is a new entry in MSIX table a waste of HW?
>>>>>>> Not as must as existing MSI-X table entries which requires linear
>>>>>>> amount of
>>>>>> on-chip memory.
>>>>>> anyway, even only one MSIX entry cost my HW resource than the
>>>>>> amount of new registers in my proposal.
>>>>> Yes, this is why new MSI-X proposals are on table to improve, the
>>>>> first known
>>>> approach to me was from Intel using IMS.
>>>>> Hence, virtio already learnt it seen in the Appendix to not keep
>>>>> adding non init
>>>> time registers.
>>>> non-sense to me, IMS still uses MSI
>>> Clearly not.
>>> May be you missed something.
>>>
>>> IMS enables once to use non registers for the interrupt store unlike MSI/MSI-
>> X.
>>> Please see the commit log comment, snippet here about "queue memory".
>>>
>>>          - The interrupt chip must provide the following optional callbacks
>>>            when the irq_mask(), irq_unmask() and irq_write_msi_msg() callbacks
>>>            cannot operate directly on hardware, e.g. in the case that the
>>>            interrupt message store is in queue memory:
>>>
>>> IRQ chips callback irq_write_msi_msg() has no such limitation to store in
>> registers.
>> Please re-read my answer, I said: IMS uses MSI, I didn't say re-use PCI msi
>> entries.
> Your answer is not relevant to this discussion at all.
> Why?
> Because we were discussing the schemes where registers are not used.
> One example of that was IMS. It does not matter MSI or MSIX.
> As explained in Intel's commit message, the key to focus for IMS is "queue memory" not some hw register like MSI or MSI-X.
you know the device always need to know a address and the data to send a 
MSI, right?

If you think this is not relevant to the discussion, OK.
>
>>>>>>>> Can I say implementing admin vq in SOC is a waste of cores?
>>>>>>> Which cores in the SoC?
>>>>>>> If it is on the PF, there is only handful of AQs for scale of N VFs.
>>>>>> I see you got the point anyway, new features cost extra resource
>>>>>>>>>>>> vDPA works fine on config space.
>>>>>>>>>>>>
>>>>>>>>>>>> So, if you still insist admin vq is better than config space
>>>>>>>>>>>> like in other thread you have concluded, you may imply that
>>>>>>>>>>>> config space interfaces should be re-factored to admin vq.
>>>>>>>>>>> Whatever is done in past is done, there is no way to change history.
>>>>>>>>>>> An new non init time registers should not be placed in device
>>>>>>>>>>> specific config
>>>>>>>>>> space as virtio spec has clear guideline on it for good.
>>>>>>>>>>> Device context reading, dirty page address reading, changing
>>>>>>>>>>> vf device modes,
>>>>>>>>>> all of these are clearly not a init time settings.
>>>>>>>>>>> Hence, they do not belong to the registers.
>>>>>>>>>> reset vq? and you get it from Appendix B. Creating New Device
>>>>>>>>>> Types, are we implementing a new type of device???
>>>>>>>>> I don’t understand your question.
>>>>>>>>> I replied the history of reset_vq.
>>>>>>>>> Take good examples to follow, reset_vq clearly is not the one.
>>>>>>>> so again, we are not implementing new device type, so your
>>>>>>>> citation doesn't apply.
>>>>>>> I disagree.
>>>>>>> I am engineer to build practical systems considering limitations
>>>>>>> and also advancements of the transport; while listening to other
>>>>>>> industry efforts, I
>>>>>> am no from legal department.
>>>>>>> Hence, Appendix B makes a sense to me to apply to the existing
>>>>>>> device which
>>>>>> also has the section for "device improvements".
>>>>>> it titled as "new device", and I think this discussion is non-sense.
>>>>>> So if you want to fix this statement, works for me.


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

