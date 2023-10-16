Return-Path: <virtio-comment-return-7734-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A311CDB465
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 09:48:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 801CE1CA248
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 09:48:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 58EDF98648C
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 09:48:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 42C68986412; Mon, 16 Oct 2023 09:48:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 32B0498643F
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 Oct 2023 09:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382711738"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="382711738"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790737460"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="790737460"
Message-ID: <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com>
Date: Mon, 16 Oct 2023 17:47:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
 <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>,
 Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com>
 <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <PH0PR12MB548139B50AD2D1B86AC9A127DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB548139B50AD2D1B86AC9A127DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 10/13/2023 7:54 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Friday, October 13, 2023 3:14 PM
>>>>>> How do you transfer the ownership?
>>>>> An additional ownership deletgation by a new admin command.
>>>> if you think this can work, do you want to cook a patch to implement
>>>> this before you submitting this live migration series?
>>> I answered this already above.
>> talk is cheap, show me your patch
> Huh. We presented the infrastructure that migrates, 30+ device types, covering device context ideas from Oracle.
> Covering P2P, supporting device_reset, FLR, dirty page tracking.
>
> Please have some respect for other members who covered more ground than your series.
>
> What more? Apply the same nested concept on the member device as Michael suggested, it is nested virtualization maintain exact same semantics.
> So a VF is mapped as PF to the L1 guest.
> L1 guest can enable SR-IOV on it, and map one VF to L2 guest.
>
> This nested work can be extended in future, once first level nesting is covered.
>
>> Answer all questions above, if you think a management VF can work, please
>> show me your patch.
> The idea evolves from technical debate then pointing fingers like your comment.
>
> I think a positive discussion with Michael and a pointer to the paper from Jason gave a good direction of doing _right_ nesting that follows two principles.
> a. efficiency property
> b. equivalence property
>
> (c. resource control is natural already)
>
> Both apply at VMM and at VM level enabling recursive virtualization, by having VF that can act as PF inside the guest.
>
> [1] https://dl.acm.org/doi/pdf/10.1145/361011.361073
Please just show me your patch resolving these opens, how about start 
from defining virito-fs device context and your management VF?

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

