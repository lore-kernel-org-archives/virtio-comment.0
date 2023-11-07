Return-Path: <virtio-comment-return-8224-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794FEC4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:11:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D15856E6CD
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:11:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AF8659867FE
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:11:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9A7139867EA; Tue,  7 Nov 2023 08:11:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8B4829867F0
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 08:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="8106128"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="8106128"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="766230387"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="766230387"
Message-ID: <8f3f0112-1ebb-4eda-ba92-46b9941e2e30@intel.com>
Date: Tue, 7 Nov 2023 16:11:25 +0800
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
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231106044347-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: [PATCH V2 1/6] virtio: introduce virtqueue state



On 11/6/2023 5:45 PM, Michael S. Tsirkin wrote:
> On Mon, Nov 06, 2023 at 05:42:10PM +0800, Zhu, Lingshan wrote:
>>
>> On 11/6/2023 5:35 PM, Michael S. Tsirkin wrote:
>>> On Fri, Nov 03, 2023 at 10:49:42PM +0800, Zhu, Lingshan wrote:
>>>>           +When SUSPEND is set, the device MUST record the Available State of every enabled splited virtqueue
>>>>           +in \field{Available State} field,
>>>>           +and correspondingly restore the Available State of every enabled splited virtqueue
>>>>           +from \field{Available State} field when DRIVER_OK is set.
>>>>           +
>>>>           +The device SHOULD reset \field{Available State} field upon a device reset.
>>>>
>>>>       At this point I have no idea
>>>>       - how can a state of a virtqueue at a random time be represented
>>>>         by a 16 bit integer
>>>>
>>>> not sure what is a random time, this is to request the device to reset
>>>> its avail state, for example, it is "le16 queue_avail_state" in virtio-pci
>>>> common cfg. Resetting this so the device will not recover from a wrong value of
>>>> the last run.
>>> You simply never bother to say what is "Available State" and what
>>> does it mean to restore it.  Not to mention words like "splited"
>>> which just adds to the confusion.
>> It says:
>> +The available state field is two bytes of virtqueue state that is used by
>> +the device to read the next available buffer. It is presented in the
>> following format:
>>
>> Do you want me to add more descriptions?
> maybe start with an example
I think they are already in the spec, I can add:
see also "2.7.6 The Virtqueue Available Ring" and "2.7.13.1 Placing 
Buffers Into The Descriptor Table"
>
>>>>       - if it's not at a random time then why do you even need an integer -
>>>>         synchronize queue to memory and then all state is in memory
>>>>
>>>> Not sure what is a sync queue, but for example, "le16 queue_avail_state" for
>>>> PCI transport exists in a cap.
>>> I just point out that normally a lot of ring state is in memory.
>>> So you need to be much more specific about how you are augmenting that.
>>> For example, if buffers are used exactly in order for a split ring
>>> then used index seems to be exactly the same as last available index
>>> you describe - it's a free running counter. OTOH if they are not
>>> used in order then I don't see how is a single index sufficient to
>>> describe which ones have been used and which not.
>> I am not sure I get it.
>>
>> Used idx(not like packed vq, no over-writing descriptors) and other states
>> are in guest memory, so migrated with guest migration.
> yes and so? why is that not enough and what is this available state then?
The spec has illustrated how available index work and has given an 
example(see above cited sections)
And this patch even has given a more clear description for it.

Other states are in guest memory and migrated with guest memory.
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

