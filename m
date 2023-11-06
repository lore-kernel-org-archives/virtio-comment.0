Return-Path: <virtio-comment-return-8180-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F3AC4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 04:06:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AF1ED6846B
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 04:06:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9A6BF9866FE
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 04:06:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 862DB9866FC; Mon,  6 Nov 2023 04:06:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 76EA39866FF
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 04:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455687634"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="455687634"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="791341543"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="791341543"
Message-ID: <e139335c-3d51-4f75-b686-34681120e4ff@intel.com>
Date: Mon, 6 Nov 2023 12:06:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
 stefanha@redhat.com, virtio-comment@lists.oasis-open.org, parav@nvidia.com
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <a9103f82-c95e-47a6-9284-667c1c991aba@intel.com>
 <20231105111232-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231105111232-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty
 page tracking



On 11/6/2023 12:16 AM, Michael S. Tsirkin wrote:
> On Fri, Nov 03, 2023 at 10:32:59PM +0800, Zhu, Lingshan wrote:
>>
>> On 11/3/2023 6:50 PM, Michael S. Tsirkin wrote:
>>
>>      On Fri, Nov 03, 2023 at 06:34:37PM +0800, Zhu Lingshan wrote:
>>
>>          +\item[\field{bitmap_addr}]
>>          +       The driver use this to set the address of the bitmap which records the dirty pages
>>          +       caused by the device.
>>          +       Each bit in the bitmap represents one memory page, bit 0 in the bitmap
>>          +       reprsents page 0 at address 0, bit 1 represents page 1, and so on in a linear manner.
>>          +       When \field{enable} is set to 1 and the device writes to a memory page,
>>          +       the device MUST set the corresponding bit to 1 which indicating the page is dirty.
>>          +\item[\field{bitmap_length}]
>>          +       The driver use this to set the length in bytes of the bitmap.
>>          +\end{description}
>>          +
>>          +\devicenormative{\subsubsection}{Memory Dirty Pages Tracker Capability}{Virtio Transport Options / Virtio Over PCI Bus / Memory Dirty Pages Tracker Capability}
>>          +
>>          +The device MUST NOT set any bits beyond bitmap_length when reporting dirty pages.
>>          +
>>          +To prevent a read-modify-write procedure, if a memory page is dirty,
>>          +optionally the device is permitted to set the entire byte, which encompasses the relevant bit, to 1.
>>          +
>>          +The device MAY increase \field{gra_power} to reduce \field{bitmap_length}.
>>          +
>>          +The device must ignore any writes to \field{pasid} if PASID Extended Capability is absent or
>>          +the PASID functionality is disabled in PASID Extended Capability
>>
>>
>>      I have to say this is going to work very badly when the number of dirty
>>      pages is small: you will end up scanning and re-scanning all of bitmap.
>>
>> The driver needs to scan anyway,
> Not with e.g. Parav's proposal - device reports individual pages
> changed. This is analogous to PML.
In this proposal, the device DMA writes the bitmap to recording dirty pages,
this can easily be merged into QEMU migration flow.
>
>> Intel production work with similar bitmap
>> based dirty page tracking solution for years.
> and then VMs became bigger and PML was introduced.
So you agree we should track dirty pages through the platform facilities?
I am glad to hear that!
>
>> Otherwise the device should report PFN which is not very practical.
> Why not?
Really? the device report PFN?
What can happen if the device keep writing a small piece of memory???
>
>>      And the resolution is apparently 8 pages? You have just multiplied
>>      the migration bandwidth by a factor of 8.
>>
>> No, as described in the comments, the tacking granularity is controlled by \
>> field{gra_power}, one bit represents a page with page_size = 2^(12 +
>> gra_power). This can also be used to reduce the size of the bitmap.
> .. at the cost of increasing migration bandwidth.
The device is very likely to write a neighbor page, and this happens
everywhere for example CPU read 64 bytes aligned data.

This is a tradeoff
>
>> "To prevent a read-modify-write procedure, if a memory page is dirty,
>> optionally the device is permitted to set the entire byte, which encompasses the relevant bit, to 1."
>>
>> This is optional and DMA is very likely to write a neighbor page, and the device transmit a whole byte anyway
>> when a bit is dirty.
>>
>> How about we use platform dirty page tracking facility then implement this in virtio, as Jason suggested?
>>
> Without something like PML it likely won't scale either.
So that would be platform issue which we don't need to take care of?
Intel VT-d can do this for sure.
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

