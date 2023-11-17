Return-Path: <virtio-comment-return-8424-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6DAC197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:54:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 203551318C6
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:54:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 11D85986E1F
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:54:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 05FBC986E1A; Fri, 17 Nov 2023 09:54:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ECA62986E1B
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 09:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="388423677"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="388423677"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="831569229"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="831569229"
Message-ID: <8e85fb6a-2a45-46fe-b9e2-3c29a1718068@intel.com>
Date: Fri, 17 Nov 2023 17:54:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117044428-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231117044428-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands



On 11/17/2023 5:51 PM, Michael S. Tsirkin wrote:
> On Fri, Nov 17, 2023 at 09:41:40AM +0000, Parav Pandit wrote:
>>
>>> From: Michael S. Tsirkin <mst@redhat.com>
>>> Sent: Friday, November 17, 2023 3:08 PM
>>>
>>> On Fri, Nov 17, 2023 at 09:14:21AM +0000, Parav Pandit wrote:
>>>>
>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>> Sent: Friday, November 17, 2023 2:16 PM In any case you can safely
>>>>> assume that many users will have migration that takes seconds and
>>>>> minutes.
>>>> Strange, but ok. I don't see any problem with current method.
>>>> 8MB is used for very large VM of 1TB takes minutes. Should be fine.
>>> The problem is simple: vendors selling devices have no idea how large the VM
>>> will be. So you have to over-provision for the max VM size.
>>> If there was a way to instead allocate that in host memory, that would improve
>>> on this.
>> Not sure what to over provision for max VM size.
>> Vendor does not know how many vcpus will be needed. It is no different problem.
>>
>> When the VM migration is started, the individual tracking range is supplied by the hypervisor to device.
>> Device allocates necessary memory on this instruction.
>>
>> When the VM with certain size is provisioned, the member device can be provisioned for the VM size.
>> And if it cannot be provisioned, possibly this may not the right member device to use at that point in time.
> For someone who keeps arguing against adding single bit registers
> "because it does not scale" you seem very nonchalant about adding
> 8Mbytes.
>
> I thought we have a nicely contained and orthogonal feature, so if it's
> optional it's not a problem.
>
> But with such costs and corner cases what exactly is the motivation for
> the feature here?  Do you have a PoC showing how this works better than
> e.g. shadow VQ?
>
> Maybe IOMMU based and shadow VQ based tracking are the way to go
> initially, and if there's a problem then we should add this later, on
> top.
I agree.
>
> I really want us to finally make progress merging features and anything
> that reduces scope initially is good for that.
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

