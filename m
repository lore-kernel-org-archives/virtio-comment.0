Return-Path: <virtio-comment-return-8401-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570FBC197A0
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 10:12:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A550494EEA
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 10:12:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 99D85986DE4
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 10:12:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8F226986DDA; Thu, 16 Nov 2023 10:12:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 81650986DDB
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 10:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="12609806"
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="12609806"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="13506315"
Message-ID: <ae131832-7e6e-458a-8dde-c4eacddc8d8d@intel.com>
Date: Thu, 16 Nov 2023 18:12:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-4-lingshan.zhu@intel.com>
 <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com>
 <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com>
 <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND



On 11/16/2023 1:27 PM, Parav Pandit wrote:
>> From: Jason Wang <jasowang@redhat.com>
>> Sent: Thursday, November 16, 2023 9:50 AM
>>
>> On Thu, Nov 16, 2023 at 1:39 AM Parav Pandit <parav@nvidia.com> wrote:
>>>
>>>
>>>> From: Jason Wang <jasowang@redhat.com>
>>>> Sent: Monday, November 13, 2023 9:05 AM
>>>>
>>>> On Thu, Nov 9, 2023 at 6:16 PM Parav Pandit <parav@nvidia.com> wrote:
>>>>>
>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>> Sent: Thursday, November 9, 2023 3:28 PM
>>>>>>
>>>>>> On 11/9/2023 1:46 AM, Michael S. Tsirkin wrote:
>>>>>>> On Tue, Nov 07, 2023 at 05:27:23PM +0800, Zhu, Lingshan wrote:
>>>>>>>> On 11/6/2023 5:49 PM, Michael S. Tsirkin wrote:
>>>>>>>>> On Fri, Nov 03, 2023 at 06:34:34PM +0800, Zhu Lingshan wrote:
>>>>>>>>>> When SUSPEND is set, device states and virtqueue states
>>>>>>>>>> should be stablized, therefore the driver should not reset
>>>>>>>>>> vqs when SUSPEND is set in device status.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>> ---
>>>>>>>>>>     content.tex | 3 +++
>>>>>>>>>>     1 file changed, 3 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/content.tex b/content.tex index
>>>>>>>>>> bcc9d4b..060b5c2
>>>>>>>>>> 100644
>>>>>>>>>> --- a/content.tex
>>>>>>>>>> +++ b/content.tex
>>>>>>>>>> @@ -444,6 +444,9 @@ \subsubsection{Virtqueue
>>>>>>>>>> Reset}\label{sec:Basic
>>>>>> Facilities of a Virtio Device /
>>>>>>>>>>     The device MUST reset any state of a virtqueue to the default
>> state,
>>>>>>>>>>     including the available state and the used state.
>>>>>>>>>> +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set in
>>>>>>>>>> +\field{device status}, the driver SHOULD NOT reset any
>> virtqueues.
>>>>>>>>>> +
>>>>>>>>>>     \drivernormative{\paragraph}{Virtqueue Reset}{Basic
>>>>>>>>>> Facilities of a
>>>>>> Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
>>>>>>>>>>     After the driver tells the device to reset a queue, the
>>>>>>>>>> driver MUST verify that
>>>>>>>>> Seems somewhat arbitrary and breaks the claim that the
>>>>>>>>> feature is orthogonal and can have uses besides migration.
>>>>>>>> when suspended, the device is frozen.
>>>>>>>> The driver is aware of this process and so should not reset the vqs I
>> think.
>>>>>>> Again that is only true because you want to use it for migration.
>>>>>>> But then you can't claim it's a generic facility.
>>>>>> I don't get it. The device status is a basic facility.
>>>>>>
>>>>>> We need to SUSPEND the device by setting SUSPEND bit, to
>>>>>> stabilize the device states for migration.
>>>>> Is the PCI's PM time not enough to suspend the device?
>>>> Are you saying we don't need virtio reset assuming we had FLR?
>>>>
>>> No. often FLR timing is not enough. Hence every PCI level device has some
>> sort of its own reset mechanism.
>>>> Suspending at different layers like rest at different layers.
>>>>
>>>> We have both FLR and virtio reset. The Virtio level function could
>>>> be reset without FLR. So did suspend.
>>>>
>>>> That's it.
>>> Sure, but wrapping it under some "basic facility" is just does not make sense.
>> Why, device status (e.g reset) belongs to that part.
>>
> Lingshan claimed that suspending device is for live migration in commit log and in discussion he portray it as some basic facility unrelated to device migration such as debug etc.
> Instead of claiming it as some non_device_migration facility does not make sense.
I said live migration is a use-case of the SUSPEND bit. I did not say 
the SUSPEND bit is only for live migration.
>   
>>>> And if you want to rule P2P behaviours, PCI PM is really the correct
>>>> way to go instead of trying to do it at the virtio layer.
>>>>
>>> PCI PM is supposed to be controlled by the guest and so the suspend.
>> I've listed issues about D3cold and others, I can't believe it can't be controlled
>> totally by guests.
>>
> D3cold is not controlled by the driver as defined by the PCI spec hence it is not applicable.
> D3hot is controlled by the driver.
>>> Hypervisor needs its channel to suspend the device, as fundamentally guest is
>> unaware of device migration flow.
>>
>> That's pretty fine, the hypervisor also needs its channel to reset the device. If
>> you think there's a conflict with suspend, there should be one for reset as well.
>>
> I don’t see a need for hypervisor to reset the device in passthrough mode. Can you explain why is it needed?
> Do you mean, it is needed in vdpa mode? If yes, the registers are emulated anyway, so why the member device's native channel cannot be used in vdpa mode?
>
>>>>> For large device I could imagine it could be short.
>>>>>
>>>>> In that case if there is suspend the device available, it will be
>>>>> used by the guest
>>>> driver itself, hypervisor wouldn’t know about it when those
>>>> registers are not trapped.
>>>>> So we need two ways to suspend.
>>>>> One is guest visible, and guest controlled.
>>>>> Second is hypervisor control to fulfill the device migration needs.
>>>> Can you explain why suspend is special but not reset or why reset
>>>> can work but not suspend? If reset can work, so does suspend. If
>>>> reset can't, neither does suspend.
>>>>
>>> As long as reset and suspend both are under guest control, I am fine.
>> Well, you seem to ignore my question below. Hypervisor needs to reset the
>> device as well.
>>
> Why is it needed in passthrough mode?
>
>>>> For example, can you explain how a system_reset in Qemu can work
>>>> with your proposal?
>>>>
>>>>> So if you can please take a look if the proposed admin command to
>>>> freeze/stop mode can be used in the emulated register case or not.
>>>>
>>>> Again, if you design those for PCI, it's a layer violation. You have
>>>> answered
>>> They are used by the PCI layer, just like your suspend bit.
>>> Andy other transport can also use it.
>>>
>>>> yourself that PM is the right way to go.
>>>>
>>>>> It helps to have the suspend bit in guest control as well
>>>>> with/without
>>>> emulation mode.
>>>>
>>>> I won't repeat it again. You will find you need a full transport to
>>>> satisfy all the requirements.
>>> I disagree for full transport.
>> See above and the discussion in another thread.
>>
>>> If you want to get discuss transport for sure it is some other thread
>>> and I want to see "driver notifications via such transport VQ" to fully qualify it
>> as transport, And that would be just sub-optimal for actual working.
>>
>> Sub-optimal since the function is duplicated with a transport but it doesn't
>> claim or design as a transport.
>>
> It is not sub-optimal because of duplication. It is because you want to transport notifications via virtqueue.
>   
>>> And hence, I wouldn’t call it a transport anymore.
>>>
>>>>>> This can also be used for debugging I think.
>>>>> As Michael listed, a dedicated debug interface is usually more
>>>>> useful instead
>>>> of in-band.
>>>>
>>>> Well, I've shown you the in-band facilities like debugging via
>>>> ethtool and kernel has a lot of other ones. If you have ever tried
>>>> to debug in a real production environment, you will find how useful
>>>> such handy information is where out-of- band facilities are often dangerous
>> and usually prohibited or even unsupported.
>>> Guest driver can always read and write the device status without adding a
>> suspend bit.
>>
>> I don't get here. Suspend make sure the device state is frozen which helps for
>> debugging for sure.
> You wanted to debug some vq live, you suspend the device, the vq state got changed.
>
> I just don’t see that suspend is a debug tool. Every feature is a debug feature literally.
> Classic heisenbug effect.
>
> Once can change driver notification frequency to see if interrupt rate changed for debugging.
> One can disabled few RQs and see RSS...
> Blk can change blk_size to higher value to perf debug..
> The list continues..
>
>> Thanks
>>


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

