Return-Path: <virtio-comment-return-8194-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FCAC4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:35:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 727772AEE5
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:35:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4BF80986720
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:35:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2DE6698670A; Mon,  6 Nov 2023 09:35:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 83C63986712
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 09:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="386416582"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="386416582"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="3576190"
Message-ID: <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com>
Date: Mon, 6 Nov 2023 17:34:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "jasowang@redhat.com" <jasowang@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking



On 11/6/2023 12:34 PM, Parav Pandit wrote:
>
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Monday, November 6, 2023 9:22 AM
>>
>>
>> On 11/3/2023 11:47 PM, Parav Pandit wrote:
>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>> Sent: Friday, November 3, 2023 8:33 PM
>>>>
>>>> On 11/3/2023 7:35 PM, Parav Pandit wrote:
>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>> Sent: Friday, November 3, 2023 4:20 PM
>>>>>>
>>>>>> On Fri, Nov 03, 2023 at 06:34:37PM +0800, Zhu Lingshan wrote:
>>>>>>> +\item[\field{bitmap_addr}]
>>>>>>> +	The driver use this to set the address of the bitmap which
>>>>>>> +records the
>>>>>> dirty pages
>>>>>>> +	caused by the device.
>>>>>>> +	Each bit in the bitmap represents one memory page, bit 0 in the bitmap
>>>>>>> +	reprsents page 0 at address 0, bit 1 represents page 1, and so
>>>>>>> +on in a
>>>>>> linear manner.
>>>>>>> +	When \field{enable} is set to 1 and the device writes to a memory page,
>>>>>>> +	the device MUST set the corresponding bit to 1 which indicating
>>>>>>> +the
>>>>>> page is dirty.
>>>>>>> +\item[\field{bitmap_length}]
>>>>>>> +	The driver use this to set the length in bytes of the bitmap.
>>>>>>> +\end{description}
>>>>>>> +
>>>>>>> +\devicenormative{\subsubsection}{Memory Dirty Pages Tracker
>>>>>>> +Capability}{Virtio Transport Options / Virtio Over PCI Bus /
>>>>>>> +Memory Dirty Pages Tracker Capability}
>>>>>>> +
>>>>>>> +The device MUST NOT set any bits beyond bitmap_length when
>>>>>>> +reporting
>>>>>> dirty pages.
>>>>>>> +
>>>>>>> +To prevent a read-modify-write procedure, if a memory page is
>>>>>>> +dirty,
>>>>> It is not to prevent; it is just not possible to do racy RMW. 😊
>>>> if you understand what is a atomic routine, you will not call it racy.
>>>>> Hence to work around you propose to mark all pages dirty. Too bad.
>>>>> This just does not work.
>>>> why? and this is optional.
>>> Because device cannot set individual bits in atomic way for same byte read by
>> the cpu.
>>> 1. device read the byte that had bit 0 and 4 set.
>>> 2. cpu atomically clear these bits.
>>> 3. device wrote bits 0, 4, and new bits 2 and 3.
>>> 4. cpu now transferred page 0 and 4 again.
>>>
>>> Optional thing also needs to work. :)
>> Do you know both CPU and device actually don't read bit, they read bytes????
> Yes. this is why atomic_OR is not possible on pcie.
>
>> Do you know RC connected to memory controller????
> Yes.
>> Do you know there are locked transaction and atomic operations in PCI???
> Can you explain how PCI does RMW locked transaction?
> Is it one TLP or multiple?
>
>> Do you know there are atomic read/write/clear even read and clear and so on in
>> CPU ISA????
> Read is always atomic from cpu.
> I didn’t know about read_and_clear atomic ISA. This combined with pci future support for atomic_or.
> If you already know a Linux kernel api for atomic_read_and_clear, please share.
To answer all questions above, you should read PCI spec and CPU SDM, we 
don't copy and paste the content
here, nobody develop their knowledge this way.
>
>>>>> Secondly the bitmap array is function is for full guest memory size,
>>>>> while
>>>> there is lot of sparce region now and also in future.
>>>>> This is the second problem.
>>>> did you see gra_power and its comments?
>>> gra_power says the page size.
>>> Not the sparce multiple ranges of the guest memory.
>>> Device endup tracking uninterested area as well.
>> increase gra_power can reduce bitmap size, right?
>> Totally up to the hypervisor, right?
> Yes, and that can increase the amount of memory.
> The way I understood is, if gra_power is 2MB, than whole 2MB page to be considered dirty, even if 8KB was dirty.
> Did I understand it right?
Do you know DMA are very likely to write a neighbor page? Do you know 
why huge page is introduced?
Hint: not only for reduce TLB miss.
>
>>>>> This is exactly why I asked you to review the page write recording
>>>>> series of
>>>> admin commands and comment.
>>>>> And you never commented with sheer ignorance.
>>>>>
>>>>> So clearly the start stop method for specific range and without
>>>>> bandwidth
>>>> explosion, admin commands of [1] stands better.
>>>>> If you do [1] on the member device also using its AQ in future, it
>>>>> will work for
>>>> non-passthrough case.
>>>>> If you build non-passthrough live migration using [1], also it will work.
>>>>> So I don’t see any point of this series anymore.
>>>> As Jason pointed out, there are many problems in your proposal, you
>>>> should answer there. I don't need to repeat his words and duplicate the
>> discussions.
>>> Many are already addressed in v3.
>> interesting, does your V3 support nested?
> Not directly.
> Is it similar to cpu PML which does not supported nested.
> One can always implement nested using some emulation.
> The second option for high performance would be allow SR-IOV cap on the VF and support true nesting using existing proposal of v3.
If your proposal does not support nested, then it is incomplete.
>
>>>>> [1]
>>>>> https://lists.oasis-open.org/archives/virtio-comment/202310/msg00475
>>>>> .h
>>>>> tml
>>>> you still need to explain why this does not work for pass-through.
>>> It does not work for following reasons.
>>> 1. Because all the fields that put on the member device are not in direct
>> control of the hypervisor.
>>> The device is directly controlled by the guest including the device status and
>> when it resets the device all the things stored in the device are lost.
>> have you seen PASID? and if the device reset, it has to forget everything as
>> expected, right?
> PASID does not help with the reset. Because as you told reset, resets everything.
> PASID does not bifurcate the device common control which is not linked to any PASID.
PASID means some facilities can be isolated. When reset, the device 
forget everything.
>
>>> 2. the PCI FLR is clearing all the registers you exposed here.
>> see above
>>> 3. Endless expansion of config registers of dirty tracking is not scalable, as they
>> are not init time registers not following the Appendix B guidelines.
>> endless expansion?? It is a complete set of dirty page tracking, right????
>> have you see this cap only controls? The device DMA writes the bitmap, not by
>> registers.
> Device dirty page tracking is start/stop command to be done by the hypervisor.
> So when guest is resetting the device, it stopped the DMA initiated by the hypervisor.
> This fundamentally breaks things.
Why? When device resets, do you want to keep tracking dirty pages????
>
>> Again, if you want to fix Appendix B, OK.
>>> 4. bitmap based dirty tracking is not atomic between cpu and device.
>>> Hence, it is racy.
>> see above, the first reply.
>>> 5. All the device context needed for passthrough based hypervisor for a
>> device type specific is missing.
>>> All of those can be used for non-passthrough as well.
>>> [1]
>>> https://lists.oasis-open.org/archives/virtio-comment/202311/msg00085.h
>>> tml
>> If you want to discuss this again, I don't want to wast time but only asking you
>> whether you want to define virtio-fs device context
> It will be defined in future.
> And if virtio-fs was not written with migration in mind, may be one will invent virtio-fs2.
don't say future, talk is cheap, show me the code.
>
>>>> And I
>>>> remember this is a point-less topic as MST ever wants to mute another
>>>> "pass- through" thread.
>>> No. he did not say that.
>>> He meant to not endlessly debate which one is better.
>>> He clearly said, try to see if you can make multiple hypervisor model work.
>>> And your series shows a clear ignorance of his guidance.
>> Let me quote MST's reply here:
>> "I feel this discussion will keep meandering because the terminology is vague.
>> There's no single thing that is called "passthrough" - vendors just build what is
>> expedient with current hardware and software. Nvidia has a bunch of people
>> working on vfio so they call that passthrough, Red Hat has people working on
>> VDPA and they call that passthrough, etc.
>>
>>
>> Before I mute this discussion for good, does anyone here have any feeling
>> progress is made? What kind of progress? "
>>
>> So please don't discuss on pass-through anymore.
> I don’t want to discuss the pros and cons of passthrough vs, vdpa, as usual.
> V3 covers broader use case of passthrough, hence once can always implement trap+emulation instead of passthrough.
> V3 already indicates that other variants of the passthrough can be done as well or can be extended.
> So please explore if that fits your vdpa need.
So, please no pass-through discussion anymore.
>
>> It seems only you need to develop the knowledge
>>>
>>>>>>> +optionally the device is permitted to set the entire byte, which
>>>>>>> +encompasses
>>>>>> the relevant bit, to 1.
>>>>>>> +
>>>>>>> +The device MAY increase \field{gra_power} to reduce
>>>> \field{bitmap_length}.
>>>>>>> +
>>>>>>> +The device must ignore any writes to \field{pasid} if PASID
>>>>>>> +Extended Capability is absent or the PASID functionality is
>>>>>>> +disabled in PASID Extended Capability
>>>>>> I have to say this is going to work very badly when the number of
>>>>>> dirty pages is
>>>>>> small: you will end up scanning and re-scanning all of bitmap.
>>>>>> And the resolution is apparently 8 pages? You have just multiplied
>>>>>> the migration bandwidth by a factor of 8.
>>>>> Yeah.
>>>>> And device does not even know previously reported pages are read by
>>>>> driver
>>>> or not. All guess work game for driver and device.
>>>> see my reply to him
>>> Please see above reply.
>> see above


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

