Return-Path: <virtio-comment-return-8263-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E85C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 09:30:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C7693217DB
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 09:30:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 952B2986CA3
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 09:30:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 75023986C97; Wed,  8 Nov 2023 09:30:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5BDFA986C98
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Nov 2023 09:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="388586216"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="388586216"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="10742773"
Message-ID: <033cad04-6840-420e-a320-051894eb484c@intel.com>
Date: Wed, 8 Nov 2023 17:30:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com>
 <PH0PR12MB54813004E47B8F18DFAC1D57DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <c44782d2-6a87-4536-bd03-cd40d492ee8c@intel.com>
 <20231107063139-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231107063139-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking



On 11/7/2023 7:33 PM, Michael S. Tsirkin wrote:
> On Tue, Nov 07, 2023 at 05:52:41PM +0800, Zhu, Lingshan wrote:
>>>>>>> 2. the PCI FLR is clearing all the registers you exposed here.
>>>>>> see above
>>>>>>> 3. Endless expansion of config registers of dirty tracking is not
>>>>>>> scalable, as they
>>>>>> are not init time registers not following the Appendix B guidelines.
>>>>>> endless expansion?? It is a complete set of dirty page tracking, right????
>>>>>> have you see this cap only controls? The device DMA writes the
>>>>>> bitmap, not by registers.
>>>>> Device dirty page tracking is start/stop command to be done by the
>>>> hypervisor.
>>>>> So when guest is resetting the device, it stopped the DMA initiated by the
>>>> hypervisor.
>>>>> This fundamentally breaks things.
>>>> Why? When device resets, do you want to keep tracking dirty pages????
>>> Yes, when the device resets, before that event occurred, all the pages which were dirtied, must be migrated.
>>> And after reset also new page tracking to continue.
>> That depends on whether there is an interrupt for the dirty pages.
>> If there is an interrupt, then the guest owns the pages
> Not in the virtio model, guest owns the memory once buffer has been used.
Yes and even better, interrupt happens after buffers marked as used.
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

