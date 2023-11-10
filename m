Return-Path: <virtio-comment-return-8306-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C97C4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 06:22:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7DF0F3884
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 06:22:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 569FE986D00
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 06:22:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3836C986CF7; Fri, 10 Nov 2023 06:22:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24541986CF8
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 06:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="8793233"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="8793233"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792783891"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="792783891"
Message-ID: <8e92a16e-2a5d-4c9c-bb85-5a5c6fecbe05@intel.com>
Date: Fri, 10 Nov 2023 14:22:04 +0800
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
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH V2 3/6] virtio: dont reset vqs when SUSPEND



On 11/9/2023 6:15 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Thursday, November 9, 2023 3:28 PM
>>
>> On 11/9/2023 1:46 AM, Michael S. Tsirkin wrote:
>>> On Tue, Nov 07, 2023 at 05:27:23PM +0800, Zhu, Lingshan wrote:
>>>> On 11/6/2023 5:49 PM, Michael S. Tsirkin wrote:
>>>>> On Fri, Nov 03, 2023 at 06:34:34PM +0800, Zhu Lingshan wrote:
>>>>>> When SUSPEND is set, device states and virtqueue states should be
>>>>>> stablized, therefore the driver should not reset vqs when SUSPEND
>>>>>> is set in device status.
>>>>>>
>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>> ---
>>>>>>     content.tex | 3 +++
>>>>>>     1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/content.tex b/content.tex index bcc9d4b..060b5c2
>>>>>> 100644
>>>>>> --- a/content.tex
>>>>>> +++ b/content.tex
>>>>>> @@ -444,6 +444,9 @@ \subsubsection{Virtqueue Reset}\label{sec:Basic
>> Facilities of a Virtio Device /
>>>>>>     The device MUST reset any state of a virtqueue to the default state,
>>>>>>     including the available state and the used state.
>>>>>> +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set in
>>>>>> +\field{device status}, the driver SHOULD NOT reset any virtqueues.
>>>>>> +
>>>>>>     \drivernormative{\paragraph}{Virtqueue Reset}{Basic Facilities of a
>> Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
>>>>>>     After the driver tells the device to reset a queue, the driver
>>>>>> MUST verify that
>>>>> Seems somewhat arbitrary and breaks the claim that the feature is
>>>>> orthogonal and can have uses besides migration.
>>>> when suspended, the device is frozen.
>>>> The driver is aware of this process and so should not reset the vqs I think.
>>> Again that is only true because you want to use it for migration.
>>> But then you can't claim it's a generic facility.
>> I don't get it. The device status is a basic facility.
>>
>> We need to SUSPEND the device by setting SUSPEND bit, to stabilize the device
>> states for migration.
> Is the PCI's PM time not enough to suspend the device?
> For large device I could imagine it could be short.
As you see, PCI PM, so this is a layer violation, virtio should be self 
contained, and what about MMIO and CCW?
This should be a basic facility.
>
> In that case if there is suspend the device available, it will be used by the guest driver itself, hypervisor wouldn’t know about it when those registers are not trapped.
> So we need two ways to suspend.
> One is guest visible, and guest controlled.
> Second is hypervisor control to fulfill the device migration needs.
The guest can eve reset the device.
>
> So if you can please take a look if the proposed admin command to freeze/stop mode can be used in the emulated register case or not.
> It helps to have the suspend bit in guest control as well with/without emulation mode.
Parav, please believe I have read your series, I didn't comment there 
because I want to avoid further
conflicts/debating, we have done these enough.

As explained before, freeze/stop the device by PCI is a layer violation.

And device status can be pass-through(without emulation, just map it to 
guest) to the guest or trapped(trap and emulate by the hypervisor, for 
example set_status in vDPA).
>
>> This can also be used for debugging I think.
> As Michael listed, a dedicated debug interface is usually more useful instead of in-band.
re-using another facility without extra efforts is not a bad thing anyway.


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

