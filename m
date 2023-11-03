Return-Path: <virtio-comment-return-8163-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E1AC4332F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 15:02:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CC3ED2A88E
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 15:02:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A85D2986C42
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 15:02:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 92937983EB2; Fri,  3 Nov 2023 15:02:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 82928986C3C
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 15:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="373995652"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="373995652"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="796640819"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="796640819"
Message-ID: <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
Date: Fri, 3 Nov 2023 23:02:34 +0800
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
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking



On 11/3/2023 7:35 PM, Parav Pandit wrote:
>> From: Michael S. Tsirkin <mst@redhat.com>
>> Sent: Friday, November 3, 2023 4:20 PM
>>
>> On Fri, Nov 03, 2023 at 06:34:37PM +0800, Zhu Lingshan wrote:
>>> +\item[\field{bitmap_addr}]
>>> +	The driver use this to set the address of the bitmap which records the
>> dirty pages
>>> +	caused by the device.
>>> +	Each bit in the bitmap represents one memory page, bit 0 in the bitmap
>>> +	reprsents page 0 at address 0, bit 1 represents page 1, and so on in a
>> linear manner.
>>> +	When \field{enable} is set to 1 and the device writes to a memory page,
>>> +	the device MUST set the corresponding bit to 1 which indicating the
>> page is dirty.
>>> +\item[\field{bitmap_length}]
>>> +	The driver use this to set the length in bytes of the bitmap.
>>> +\end{description}
>>> +
>>> +\devicenormative{\subsubsection}{Memory Dirty Pages Tracker
>>> +Capability}{Virtio Transport Options / Virtio Over PCI Bus / Memory
>>> +Dirty Pages Tracker Capability}
>>> +
>>> +The device MUST NOT set any bits beyond bitmap_length when reporting
>> dirty pages.
>>> +
>>> +To prevent a read-modify-write procedure, if a memory page is dirty,
> It is not to prevent; it is just not possible to do racy RMW. 😊
if you understand what is a atomic routine, you will not call it racy.
> Hence to work around you propose to mark all pages dirty. Too bad.
> This just does not work.
why? and this is optional.
>
> Secondly the bitmap array is function is for full guest memory size, while there is lot of sparce region now and also in future.
> This is the second problem.
did you see gra_power and its comments?
>
> This is exactly why I asked you to review the page write recording series of admin commands and comment.
> And you never commented with sheer ignorance.
>
> So clearly the start stop method for specific range and without bandwidth explosion, admin commands of [1] stands better.
>
> If you do [1] on the member device also using its AQ in future, it will work for non-passthrough case.
> If you build non-passthrough live migration using [1], also it will work.
> So I don’t see any point of this series anymore.
As Jason pointed out, there are many problems in your proposal,
you should answer there. I don't need to repeat his words and duplicate 
the discussions.
>
> [1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00475.html
you still need to explain why this does not work for pass-through. And I 
remember this is a point-less topic as MST ever wants to mute
another "pass-through" thread.
>
>>> +optionally the device is permitted to set the entire byte, which encompasses
>> the relevant bit, to 1.
>>> +
>>> +The device MAY increase \field{gra_power} to reduce \field{bitmap_length}.
>>> +
>>> +The device must ignore any writes to \field{pasid} if PASID Extended
>>> +Capability is absent or the PASID functionality is disabled in PASID
>>> +Extended Capability
>>
>> I have to say this is going to work very badly when the number of dirty pages is
>> small: you will end up scanning and re-scanning all of bitmap.
>> And the resolution is apparently 8 pages? You have just multiplied the migration
>> bandwidth by a factor of 8.
> Yeah.
> And device does not even know previously reported pages are read by driver or not. All guess work game for driver and device.
see my reply to him


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

