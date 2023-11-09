Return-Path: <virtio-comment-return-8293-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84F7C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:00:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3EA1B2CAFB
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:00:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1DB92986CD5
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:00:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0956F986CCD; Thu,  9 Nov 2023 10:00:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE880986CCE
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 10:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="454258092"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="454258092"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="1094813236"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="1094813236"
Message-ID: <b3ac6cd9-a04e-4cf4-9fce-a9d687191522@intel.com>
Date: Thu, 9 Nov 2023 18:00:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-5-lingshan.zhu@intel.com>
 <PH0PR12MB5481085F6E84FD2786FCD60BDCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <705607e3-39c3-47da-a688-80bbee31c48d@intel.com>
 <PH0PR12MB54814F9EEDD69ED434BF7994DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b0506d9f-37de-43c9-b99d-b00bb88c0d36@intel.com>
 <PH0PR12MB548174AF58B6ADDDA215123DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b8d51cd3-33fe-4167-a87b-ae662609c5d8@intel.com>
 <PH0PR12MB5481BCA941D86E1031D7A5D9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7a0e7cef-434c-4049-b72f-b8188ecedbaf@intel.com>
 <20231108124402-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231108124402-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE



On 11/9/2023 1:44 AM, Michael S. Tsirkin wrote:
> On Tue, Nov 07, 2023 at 05:31:38PM +0800, Zhu, Lingshan wrote:
>>
>> On 11/6/2023 6:52 PM, Parav Pandit wrote:
>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>> Sent: Monday, November 6, 2023 2:57 PM
>>>>
>>>> On 11/6/2023 12:12 PM, Parav Pandit wrote:
>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>> Sent: Monday, November 6, 2023 9:01 AM
>>>>>>
>>>>>> On 11/3/2023 11:50 PM, Parav Pandit wrote:
>>>>>>>> From: virtio-comment@lists.oasis-open.org
>>>>>>>> <virtio-comment@lists.oasis- open.org> On Behalf Of Zhu, Lingshan
>>>>>>>> Sent: Friday, November 3, 2023 8:27 PM
>>>>>>>>
>>>>>>>> On 11/3/2023 7:35 PM, Parav Pandit wrote:
>>>>>>>>>> From: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>> Sent: Friday, November 3, 2023 4:05 PM
>>>>>>>>>>
>>>>>>>>>> This patch adds two new le16 fields to common configuration
>>>>>>>>>> structure to support VIRTIO_F_QUEUE_STATE in PCI transport layer.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>>>>>> ---
>>>>>>>>>>       transport-pci.tex | 18 ++++++++++++++++++
>>>>>>>>>>       1 file changed, 18 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/transport-pci.tex b/transport-pci.tex index
>>>>>>>>>> a5c6719..3161519 100644
>>>>>>>>>> --- a/transport-pci.tex
>>>>>>>>>> +++ b/transport-pci.tex
>>>>>>>>>> @@ -325,6 +325,10 @@ \subsubsection{Common configuration
>>>>>> structure
>>>>>>>>>> layout}\label{sec:Virtio Transport
>>>>>>>>>>               /* About the administration virtqueue. */
>>>>>>>>>>               le16 admin_queue_index;         /* read-only for driver */
>>>>>>>>>>               le16 admin_queue_num;         /* read-only for driver */
>>>>>>>>>> +
>>>>>>>>>> +	/* Virtqueue state */
>>>>>>>>>> +        le16 queue_avail_state;         /* read-write */
>>>>>>>>>> +        le16 queue_used_state;          /* read-write */
>>>>>>>>> This tiny interface for 128 virtio net queues through register
>>>>>>>>> read writes, does
>>>>>>>> not work effectively.
>>>>>>>>> There are inflight out of order descriptors for block also.
>>>>>>>>> Hence toy registers like this do not work.
>>>>>>>> Do you know there is a queue_select? Why this does not work? Do you
>>>>>>>> know how other queue related fields work?
>>>>>>> :)
>>>>>>> Yes. If you notice queue_reset related critical spec bug fix was
>>>>>>> done when it
>>>>>> was introduced so that live migration can _actually_ work.
>>>>>>> When queue_select is done for 128 queues serially, it take a lot of
>>>>>>> time to
>>>>>> read those slow register interface for this + inflight descriptors + more.
>>>>>> interesting, virtio work in this pattern for many years, right?
>>>>> All these years 400Gbps and 800Gbps virtio was not present, number of
>>>> queues were not in hw.
>>>> The registers are control path in config space, how 400G or 800G affect??
>>> Because those are the one in practice requires large number of VQs.
>>>
>>> You are asking per VQ register commands to modify things dynamically via this one vq at a time, serializing all the operations.
>>> It does not scale well with high q count.
>> This is not dynamically, it only happens when SUSPEND and RESUME.
>> This is the same mechanism how virtio initialize a virtqueue, working for
>> many years.
> I wish we just had a transport vq already. That's the way to solve this
> not fighting individual bits.
Yeah, I agree, transport is a queued task(sent out V4 months ago...), 
one by one... hard and tough work...
>
>>>> See the virtio common cfg, you will find the max number of vqs is there,
>>>> num_queues.
>>> :)
>>> Sure. those values at high q count affects.
>> the driver need to initialize them anyway.
>>>>> Device didn’t support LM.
>>>>> Many limitations existed all these years and TC is improving and expanding
>>>> them.
>>>>> So all these years do not matter.
>>>> Not sure what are you talking about, haven't we initialize the device and vqs in
>>>> config space for years?????? What's wrong with this mechanism?
>>>> Are you questioning virito-pci fundamentals???
>>> Don’t point to in-efficient past to establish similar in-efficient future.
>> interesting, you know this is a one-time thing, right?
>> and you are aware of this has been there for years.
>>>>>>>> Like how to set a queue size and enable it?
>>>>>>> Those are meant to be used before DRIVER_OK stage as they are init
>>>>>>> time
>>>>>> registers.
>>>>>>> Not to keep abusing them..
>>>>>> don't you need to set queue_size at the destination side?
>>>>> No.
>>>>> But the src/dst does not matter.
>>>>> Queue_size to be set before DRIVER_OK like rest of the registers, as all
>>>> queues must be created before the driver_ok phase.
>>>>> Queue_reset was last moment exception.
>>>> create a queue? Nvidia specific?
>>>>
>>> Huh. No.
>>> Do git log and realize what happened with queue_reset.
>> You didn't answer the question, does the spec even has defined "create a
>> vq"?
>>>> For standard virtio, you need to read the number of enabled vqs at the source
>>>> side, then enable them at the dst, so queue_size matters, not to create.
>>> All that happens in the pre-copy phase.
>> Yes and how your answer related to this discussion?


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

