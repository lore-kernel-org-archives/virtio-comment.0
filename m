Return-Path: <virtio-comment-return-8429-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31A9C072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:01:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 54D0019A8EC
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:01:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 49999986E25
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:01:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3E530986E1A; Fri, 17 Nov 2023 10:01:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 309A9986E1B
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 10:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="388424557"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="388424557"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="13873763"
Message-ID: <befbecf0-93fb-4196-a287-b78f5d748c12@intel.com>
Date: Fri, 17 Nov 2023 18:00:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <8e87db22-f24f-4f43-86e2-cdb5ef23acad@intel.com>
 <PH0PR12MB54818900F3FADA4CFE435E9BDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54818900F3FADA4CFE435E9BDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands



On 11/17/2023 5:59 PM, Parav Pandit wrote:
>
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Friday, November 17, 2023 3:23 PM
>>
>>
>> On 11/17/2023 5:41 PM, Parav Pandit wrote:
>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>> Sent: Friday, November 17, 2023 3:08 PM
>>>>
>>>> On Fri, Nov 17, 2023 at 09:14:21AM +0000, Parav Pandit wrote:
>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>>> Sent: Friday, November 17, 2023 2:16 PM In any case you can safely
>>>>>> assume that many users will have migration that takes seconds and
>>>>>> minutes.
>>>>> Strange, but ok. I don't see any problem with current method.
>>>>> 8MB is used for very large VM of 1TB takes minutes. Should be fine.
>>>> The problem is simple: vendors selling devices have no idea how large
>>>> the VM will be. So you have to over-provision for the max VM size.
>>>> If there was a way to instead allocate that in host memory, that
>>>> would improve on this.
>>> Not sure what to over provision for max VM size.
>>> Vendor does not know how many vcpus will be needed. It is no different
>> problem.
>>> When the VM migration is started, the individual tracking range is supplied by
>> the hypervisor to device.
>>> Device allocates necessary memory on this instruction.
>>>
>>> When the VM with certain size is provisioned, the member device can be
>> provisioned for the VM size.
>>> And if it cannot be provisioned, possibly this may not the right member device
>> to use at that point in time.
>> I think Michael means the guest memory can be large, and the device may DMA
>> anywhere, so the device should prepare for the worst case, that could be U64
>> size which can be over-provision.
> No. that is not true.
> The hypervisor supplies the range of addresses on which to track the dirty pages.
> So for sure it is not u64.
hypervisor provides GPA to the guest, but the VA can be very high 
address, means can be u64.
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

