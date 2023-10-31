Return-Path: <virtio-comment-return-8059-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDF1C4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 09:35:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CCB9C41F2E
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 09:35:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A4C66986B6B
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 09:35:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 91326986B68; Tue, 31 Oct 2023 09:35:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BB749986B69
	for <virtio-comment@lists.oasis-open.org>; Tue, 31 Oct 2023 09:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="9782904"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="9782904"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="8649021"
Message-ID: <c84d7b6b-b1c7-40c3-998f-fcf27e04f8cd@intel.com>
Date: Tue, 31 Oct 2023 17:35:23 +0800
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
References: <f2707430-bb1e-4dcd-b0b3-2b9a705e555a@intel.com>
 <PH0PR12MB5481033BB7C0BCABAE329B13DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f9a604b2-7bc9-49ce-bd28-59909f0a5fec@intel.com>
 <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9604eb82-8efd-46cd-8b15-90fc637eff0c@intel.com>
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231030072937-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231030072937-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 10/30/2023 7:34 PM, Michael S. Tsirkin wrote:
> On Mon, Oct 30, 2023 at 10:23:14AM +0000, Parav Pandit wrote:
>>> And the helper driver could be considered as a part of the hypervisor, or the
>>> guest vCPU can not access the host side devices.
>>>
>>> For example, the path is hw-->vfio_pci-->qemu-->guest. IT IS NOT hw-->guest.
> I think above makes sense. Nvidia decided to standardize on VFIO and
> that's ok, but there's no point in calling specifically VFIO "true
> passthrough" or whatever the marketing term du jour is. This is
> not a VFIO TC here. I do wish one of the sides in this discussion
> stopped promoting their architecture and the one true way and
> tried to actually build interfaces addressing multiple architectures,
> though. Otherwise we'll keep getting stuck.
I agree, pass-through is clear and I don't think this worth arguing.
>
>> In virtio spec we only talk about the driver, and the device in context of passthrough device.
>> So for virtio common config, dev config, cvq, data vqs are guest driver -> device.
>> There is no other entity inbetween.
> No longer true - with admin commands we have 2 devices: owner and
> member, and each has its own driver.
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

