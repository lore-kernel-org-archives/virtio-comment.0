Return-Path: <virtio-comment-return-8239-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956D6C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:44:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0880021130
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:44:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F3B27986B5D
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:44:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EA6549867FB; Tue,  7 Nov 2023 10:44:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DDC2C9867FC
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 10:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="392355039"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="392355039"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="879754525"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="879754525"
Message-ID: <82295873-4b56-4884-90b2-f5072813e114@intel.com>
Date: Tue, 7 Nov 2023 18:44:46 +0800
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
 <e139335c-3d51-4f75-b686-34681120e4ff@intel.com>
 <20231106051550-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231106051550-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty
 page tracking



On 11/6/2023 6:22 PM, Michael S. Tsirkin wrote:
> On Mon, Nov 06, 2023 at 12:06:39PM +0800, Zhu, Lingshan wrote:
>>>> Intel production work with similar bitmap
>>>> based dirty page tracking solution for years.
>>> and then VMs became bigger and PML was introduced.
>> So you agree we should track dirty pages through the platform facilities?
>> I am glad to hear that!
> I just said that I thought there's no PML in platform facilities and that
> might be a problem. Am I wrong?
That's thru some platform may don't have PML.
The thing is most of platform have PML and this is a tradeoff:
1)don't implement dirty page tracking in virtio, but use platform. Then 
some platform
can not track dirty pages by HW
2)implement dirty page tracking in virtio, but most platform don't use it.

As you see, I have post this virito dirty page tracking as a backup here,
so this should be your call anyway.
>
>>>> Otherwise the device should report PFN which is not very practical.
>>> Why not?
>> Really? the device report PFN?
>> What can happen if the device keep writing a small piece of memory???
> then you just report the PFN once. Should work like PML really -
> IOW devices maintains a bit per page internally and reports
> PFN when bit is set.
Yes, it is a/d bit. by bitmap, when the device keep writing a small 
region of memory,
only needs to mark the bits as dirty once.

when reporting PFN, the device need to repeating report the same bunch 
of PFNs(0x1234abcd..),
which is not very efficient.

And we need to merge the device dirty page into QEMU dirty page bit map 
anyway.
>
>>>>       And the resolution is apparently 8 pages? You have just multiplied
>>>>       the migration bandwidth by a factor of 8.
>>>>
>>>> No, as described in the comments, the tacking granularity is controlled by \
>>>> field{gra_power}, one bit represents a page with page_size = 2^(12 +
>>>> gra_power). This can also be used to reduce the size of the bitmap.
>>> .. at the cost of increasing migration bandwidth.
>> The device is very likely to write a neighbor page,
> how likely? and e.g. with slab randomization too? please collect some
> data and show it.
DMA writes continuous memory and take an example of DMA writing the ring 
buffer,
it likely to write a neighbor page. This is called memory locality.
>
>> and this happens
>> everywhere for example CPU read 64 bytes aligned data.
> CPUs don't need to send their cache across a bandwidth constrained
> shared network.
This is not about cacheline size, just saying it is 64bytes aligned.
>
>> This is a tradeoff
> tradeoff between which two options?
1) small tracking granularity and big bitmap
2) big tracking granularity and smaller bitmap(with memory locality)
>
>>>> "To prevent a read-modify-write procedure, if a memory page is dirty,
>>>> optionally the device is permitted to set the entire byte, which encompasses the relevant bit, to 1."
>>>>
>>>> This is optional and DMA is very likely to write a neighbor page, and the device transmit a whole byte anyway
>>>> when a bit is dirty.
>>>>
>>>> How about we use platform dirty page tracking facility then implement this in virtio, as Jason suggested?
>>>>
>>> Without something like PML it likely won't scale either.
>> So that would be platform issue which we don't need to take care of?
>> Intel VT-d can do this for sure.
> Intel VT-d supports PML from the IOMMU? I didn't realize. Could you help
> me find it in the doc please? Which hardware supports this in the field?
> What about other vendors?
Please refer to intel vt-d spec: 
https://cdrdv2-public.intel.com/774206/vt-directed-io-spec%20.pdf

As far as I know, AMD and ARM support this too.

Anyway, as said above, this should be your call whether implement dirty 
page tracking in virtio.
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

