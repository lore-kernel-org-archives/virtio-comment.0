Return-Path: <virtio-comment-return-8400-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D63C47071
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 10:09:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2FFA7866BD
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 10:09:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E5849986DEE
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 10:09:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C3DB0986DDA; Thu, 16 Nov 2023 10:09:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B3992986DDB
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 10:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370418713"
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="370418713"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="794457098"
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="794457098"
Message-ID: <6949173c-29cf-4c49-af82-562c050e40ae@intel.com>
Date: Thu, 16 Nov 2023 18:09:38 +0800
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
 <20231103103437.72784-4-lingshan.zhu@intel.com>
 <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com>
 <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com>
 <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <8e92a16e-2a5d-4c9c-bb85-5a5c6fecbe05@intel.com>
 <PH0PR12MB5481C31027CE6716503F3F24DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <a28b2c22-a03f-473d-b672-d54e0390b76a@intel.com>
 <PH0PR12MB5481ED082C94A9603DC6BDC8DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB5481ED082C94A9603DC6BDC8DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND



On 11/16/2023 1:35 AM, Parav Pandit wrote:
>
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Monday, November 13, 2023 2:53 PM
>>
>> On 11/10/2023 2:31 PM, Parav Pandit wrote:
>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>> Sent: Friday, November 10, 2023 11:52 AM
>>>>
>>>> On 11/9/2023 6:15 PM, Parav Pandit wrote:
>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>> Sent: Thursday, November 9, 2023 3:28 PM
>>>>>>
>>>>>> On 11/9/2023 1:46 AM, Michael S. Tsirkin wrote:
>>>>>>> On Tue, Nov 07, 2023 at 05:27:23PM +0800, Zhu, Lingshan wrote:
>>>>>>>> On 11/6/2023 5:49 PM, Michael S. Tsirkin wrote:
>>>>>>>>> On Fri, Nov 03, 2023 at 06:34:34PM +0800, Zhu Lingshan wrote:
>>>>>>>>>> When SUSPEND is set, device states and virtqueue states should
>>>>>>>>>> be stablized, therefore the driver should not reset vqs when
>>>>>>>>>> SUSPEND is set in device status.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>> ---
>>>>>>>>>>       content.tex | 3 +++
>>>>>>>>>>       1 file changed, 3 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/content.tex b/content.tex index bcc9d4b..060b5c2
>>>>>>>>>> 100644
>>>>>>>>>> --- a/content.tex
>>>>>>>>>> +++ b/content.tex
>>>>>>>>>> @@ -444,6 +444,9 @@ \subsubsection{Virtqueue
>>>>>>>>>> Reset}\label{sec:Basic
>>>>>> Facilities of a Virtio Device /
>>>>>>>>>>       The device MUST reset any state of a virtqueue to the default
>> state,
>>>>>>>>>>       including the available state and the used state.
>>>>>>>>>> +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set in
>>>>>>>>>> +\field{device status}, the driver SHOULD NOT reset any virtqueues.
>>>>>>>>>> +
>>>>>>>>>>       \drivernormative{\paragraph}{Virtqueue Reset}{Basic
>>>>>>>>>> Facilities of a
>>>>>> Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
>>>>>>>>>>       After the driver tells the device to reset a queue, the
>>>>>>>>>> driver MUST verify that
>>>>>>>>> Seems somewhat arbitrary and breaks the claim that the feature
>>>>>>>>> is orthogonal and can have uses besides migration.
>>>>>>>> when suspended, the device is frozen.
>>>>>>>> The driver is aware of this process and so should not reset the vqs I
>> think.
>>>>>>> Again that is only true because you want to use it for migration.
>>>>>>> But then you can't claim it's a generic facility.
>>>>>> I don't get it. The device status is a basic facility.
>>>>>>
>>>>>> We need to SUSPEND the device by setting SUSPEND bit, to stabilize
>>>>>> the device states for migration.
>>>>> Is the PCI's PM time not enough to suspend the device?
>>>>> For large device I could imagine it could be short.
>>>> As you see, PCI PM, so this is a layer violation, virtio should be
>>>> self contained,
>>> If you think it is layer violation, than suspend bit for sure is not needed. PCI
>> PM interface should suspend/resume the device on D0<->D3 state transitions.
>> Doesn't make sense logically, because it is layer violation, so you want it to be
>> worse? For example, virito writes 0 to device status to reset a device, not by PCI.
> All these layer violation thing is just abstract to me.
> Your argument contradicts with your fellow author and yourself.
I don't see how, we keep telling you virtio should be self contained, 
and suspend by PCI PM is a
layer volition, this is a fact, right?
>
> I don’t want to make it worse.
> If you think its layer violation, just depend on the PCI PM, no need to include new suspend bit.
Again, virtio should be self-contained, not layer volited, for example, 
we reset virito devices
by writing 0 to device status, not by PCI FLR.
>
>>>> and what about MMIO and CCW?
>>> They have largely lacked the richness of PCI transport. So those transport
>> needs to evolve.
>> I am not sure CCW and MMIO maintainers want to hear this.
>>> Otherwise, PCI offers rich transport facilities compared to MMIO, hence, it will
>> continue wider use.
>> you know this SUSPEND bit work fine on all transport, right? Because
>> device_status is transport independent.
> I want to emphasize that I am not against the suspend bit as long as it is guest driver controlled without interfering the device migration flow (like rest of the state).
When migrate a device, it is the host who suspends the device. The 
reason is the live migration process should be transparent to
the guest, so we should suspend the guest first, then suspend the 
device(by host).
>
> The practical reason for suspending functionality under guest control is, that resuming/suspending the large device can take time.
> So let it be in guest driver control. No need to muddy with device migration flow.
The time cost is reasonable in O(N) no matter how you suspend/resume the 
device.
>
>>>> This should be a basic facility.
>>> Other transport can also offer like PCI.
>> Do you want to work for these transport? Implementing the new features as
>> PCI?
> Not presently as PCI as more features than rest of the two.
> What I read about ccw is: " S/390 based virtual machines support neither PCI nor MMIO".
>
> And I also read, "The IBM System/390 is a discontinued mainframe product family implementing".
>
> So I don’t know who needs to extend ccw.
> And if one needs, those maintainers will extend it to match to PCI standard.
So these features are even not planned, so don't depend on them.
>
>>>>> In that case if there is suspend the device available, it will be
>>>>> used by the
>>>> guest driver itself, hypervisor wouldn’t know about it when those
>>>> registers are not trapped.
>>>>> So we need two ways to suspend.
>>>>> One is guest visible, and guest controlled.
>>>>> Second is hypervisor control to fulfill the device migration needs.
>>>> The guest can eve reset the device.
>>>>> So if you can please take a look if the proposed admin command to
>>>> freeze/stop mode can be used in the emulated register case or not.
>>>>> It helps to have the suspend bit in guest control as well
>>>>> with/without
>>>> emulation mode.
>>>> Parav, please believe I have read your series, I didn't comment there
>>>> because I want to avoid further conflicts/debating, we have done these
>> enough.
>>> I believe the series posted in v3 can support vdpa use case as well.
>>> So I will progress to post v4.
>>>
>>>> As explained before, freeze/stop the device by PCI is a layer violation.
>>> I am afraid, we have different vision.
>>> I don’t see any layer violation.
>>> Suspend is enough in the PCI PM.
>>> Our vision is more aligned with rest of the hypervisor knobs that owns the
>> migration framework.
>> I think I have explained, virito builds on other transport and it should be self-
>> contained, so far so good.
> Virtio without any transport binding is just blank paper discussion.
virtio is built on some transports, but not bind to any.
>
>>>> And device status can be pass-through(without emulation, just map it
>>>> to
>>>> guest) to the guest or trapped(trap and emulate by the hypervisor,
>>>> for example set_status in vDPA).
>>> When it is pass-through, it is controlled by the guest, so for example, if the
>> guest resets the device, hypervisor has lost the control of migration context etc.
>>> Hence, hypervisor needs a channel which is not guest owned.
>>>
>>> Same channel can work when trap+emulation is done.
>> It is the guest owns the device, it can reset the device, once reset, the device
>> context are cleared.
> Hypervisor do not have the ability to read/write the device context. It lost the channel as hypervisor is not involved in trap+emulation.
> So it is not helpful in one use case.
>
> Admin commands can work even with trap+emulation mode.
>
> What is missing, that should be added?
as explained above, when live migration, the guest should be suspended 
first, at this point,
the host owns the device, it has access to the device.
>
>>>>>> This can also be used for debugging I think.
>>>>> As Michael listed, a dedicated debug interface is usually more
>>>>> useful instead
>>>> of in-band.
>>>> re-using another facility without extra efforts is not a bad thing anyway.
>>> I just don’t see how a suspend bit some debug feature.
>>> Almost everything with that regard is a debug feature to me.
>> suspend then check the device states?
> You already suspended the device, so device state is already changed.
> All debug information is changed, so not useful now.
When suspended, the device should keep and stabilize its device states,
at least in my series it should behave like this.


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

