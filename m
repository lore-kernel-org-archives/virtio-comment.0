Return-Path: <virtio-comment-return-8096-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A9FC4167B
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 09:42:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 52A512AC5B
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 09:42:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 28A66986BBA
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 09:42:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 08B58986BB6; Wed,  1 Nov 2023 09:42:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EBCA4986BB7
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 09:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="387350011"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="387350011"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="877820278"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="877820278"
Message-ID: <d31980f0-caed-4f4e-a46d-9c1325024fb0@intel.com>
Date: Wed, 1 Nov 2023 17:42:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <20231101012540-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54802C006C5ADE546783E610DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101023257-mutt-send-email-mst@kernel.org>
 <0bc21f96-486d-481f-8676-5144225e43bc@intel.com>
 <PH0PR12MB5481DCAAFA84932C9D826C4ADCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7b130c22-3c07-4f3d-80bc-7ee4fb7dea70@intel.com>
 <PH0PR12MB54810FE590680689D3140911DCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <534d3350-ebe8-42f0-a961-a9675c76f984@intel.com>
 <PH0PR12MB54811086EF9D3E96628DEF02DCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0080c62c-7516-452b-8b14-0a0871de6574@intel.com>
 <20231101050628-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231101050628-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 11/1/2023 5:07 PM, Michael S. Tsirkin wrote:
> On Wed, Nov 01, 2023 at 04:55:01PM +0800, Zhu, Lingshan wrote:
>>> So do you want MSIX table as part of device context or not?
>> MSI is a part of device context as I suggest you to read QEMU code for the
>> answers.
>>
>> You will also found that part is already done.
>>
>> So I don't know why this is a topic worthy discussions.
>>
>> If you have questions, I still suggest you read QEMU code.
> Frankly at this point I don't know what you are trying to say either.
MSI table is R/W, so the hypervisor can migrate it now
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

