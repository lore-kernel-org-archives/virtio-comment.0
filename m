Return-Path: <virtio-comment-return-8253-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE6BC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 04:08:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B08303E580
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 04:08:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9468F986C9A
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 04:08:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 789CF986C8F; Wed,  8 Nov 2023 04:08:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 659A6986C90
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Nov 2023 04:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="369887768"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="369887768"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="766530732"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="766530732"
Message-ID: <7bbfcf4c-80ec-4ec1-9cf8-9016ebb4801e@intel.com>
Date: Wed, 8 Nov 2023 12:08:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
 stefanha@redhat.com, virtio-comment@lists.oasis-open.org, parav@nvidia.com
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-2-lingshan.zhu@intel.com>
 <20231103065138-mutt-send-email-mst@kernel.org>
 <d2f3c5cd-0376-460a-9230-4098863f1bb7@intel.com>
 <20231106042108-mutt-send-email-mst@kernel.org>
 <dfeba16d-8bfc-438a-8968-ab03d05cce75@intel.com>
 <20231106044347-mutt-send-email-mst@kernel.org>
 <8f3f0112-1ebb-4eda-ba92-46b9941e2e30@intel.com>
 <20231107031405-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231107031405-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: [PATCH V2 1/6] virtio: introduce virtqueue state



On 11/7/2023 4:22 PM, Michael S. Tsirkin wrote:
> On Tue, Nov 07, 2023 at 04:11:25PM +0800, Zhu, Lingshan wrote:
>>
>> On 11/6/2023 5:45 PM, Michael S. Tsirkin wrote:
>>> On Mon, Nov 06, 2023 at 05:42:10PM +0800, Zhu, Lingshan wrote:
>>>> On 11/6/2023 5:35 PM, Michael S. Tsirkin wrote:
>>>>> On Fri, Nov 03, 2023 at 10:49:42PM +0800, Zhu, Lingshan wrote:
>>>>>>            +When SUSPEND is set, the device MUST record the Available State of every enabled splited virtqueue
>>>>>>            +in \field{Available State} field,
>>>>>>            +and correspondingly restore the Available State of every enabled splited virtqueue
>>>>>>            +from \field{Available State} field when DRIVER_OK is set.
>>>>>>            +
>>>>>>            +The device SHOULD reset \field{Available State} field upon a device reset.
>>>>>>
>>>>>>        At this point I have no idea
>>>>>>        - how can a state of a virtqueue at a random time be represented
>>>>>>          by a 16 bit integer
>>>>>>
>>>>>> not sure what is a random time, this is to request the device to reset
>>>>>> its avail state, for example, it is "le16 queue_avail_state" in virtio-pci
>>>>>> common cfg. Resetting this so the device will not recover from a wrong value of
>>>>>> the last run.
>>>>> You simply never bother to say what is "Available State" and what
>>>>> does it mean to restore it.  Not to mention words like "splited"
>>>>> which just adds to the confusion.
>>>> It says:
>>>> +The available state field is two bytes of virtqueue state that is used by
>>>> +the device to read the next available buffer. It is presented in the
>>>> following format:
>>>>
>>>> Do you want me to add more descriptions?
>>> maybe start with an example
>> I think they are already in the spec, I can add:
>> see also "2.7.6 The Virtqueue Available Ring" and "2.7.13.1 Placing Buffers
>> Into The Descriptor Table"
>>>>>>        - if it's not at a random time then why do you even need an integer -
>>>>>>          synchronize queue to memory and then all state is in memory
>>>>>>
>>>>>> Not sure what is a sync queue, but for example, "le16 queue_avail_state" for
>>>>>> PCI transport exists in a cap.
>>>>> I just point out that normally a lot of ring state is in memory.
>>>>> So you need to be much more specific about how you are augmenting that.
>>>>> For example, if buffers are used exactly in order for a split ring
>>>>> then used index seems to be exactly the same as last available index
>>>>> you describe - it's a free running counter. OTOH if they are not
>>>>> used in order then I don't see how is a single index sufficient to
>>>>> describe which ones have been used and which not.
>>>> I am not sure I get it.
>>>>
>>>> Used idx(not like packed vq, no over-writing descriptors) and other states
>>>> are in guest memory, so migrated with guest migration.
>>> yes and so? why is that not enough and what is this available state then?
>> The spec has illustrated how available index work and has given an
>> example(see above cited sections)
>> And this patch even has given a more clear description for it.
>>
>> Other states are in guest memory and migrated with guest memory.
> Yea I wrote large parts of it and I know how the available index works.
>
> And sorry no idea what you are talking about.
>
> At any time, there can be up to 2^16 buffers that have been made
> available, and a random subset of these have been used. There is no
> chance in the world a single 16 bit index describes even that part of
> state, never mind device type specific processing that might be going
> on.
>
> As a wild guest this proposal is making a bunch of unstated assumptions
> about device being in a very specific state where this *is* possible.
> For people to be able to implement devices and drivers these
> need to be spelled out.
Thanks for your advice, I may need more hints to improve this patch.

If it is about when _F_IN_ORDER not negotiated, I found this section 
from the spec:

Some devices always use descriptors in the same order in which they have 
been made available. These
devices can offer the VIRTIO_F_IN_ORDER feature. If negotiated, this 
knowledge allows devices to notify
the use of a batch of buffers to the driver by only writing out a single 
used ring entry with the id corresponding
to the head entry of the descriptor chain describing the last buffer in 
the batch.
The device then skips forward in the ring according to the size of the 
batch. Accordingly, it increments the
used idx by the size of the batch.

This section implies that if _F_IN_ORDER is not negotiated, the device 
may not able to process the descriptors in
order, thus may not write only one used_idx for a batch of buffers. This 
is about how to make buffer used and
used_idx is in the guest memory. If the device selective done processing 
some descriptors, then maybe just
mark them done one by one than batching.

Here I see there are two kind of vq states, on device or in guest 
memory. So this series migrate the on device
state explicitly and others are migrating with guest memory.

Can you be more specific on what parameters of a vq that I should 
address in this patch?

Thanks
>
>


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

