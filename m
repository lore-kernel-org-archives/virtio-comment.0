Return-Path: <virtio-comment-return-7853-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F666CDB483
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:18:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8A814790E5
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:18:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 776BD9868D6
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:18:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6920A9868CE; Thu, 19 Oct 2023 09:18:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5AA119868CF
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 09:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="365561695"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="365561695"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="786288958"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="786288958"
Message-ID: <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
Date: Thu, 19 Oct 2023 17:18:28 +0800
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
References: <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231019051406-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 10/19/2023 5:14 PM, Michael S. Tsirkin wrote:
> On Thu, Oct 19, 2023 at 09:13:16AM +0000, Parav Pandit wrote:
>>> Oh, really? Quite interesting, do you want to move all config space fields in VF
>>> to admin vq? Have a plan?
>> Not in my plan for spec 1.4 time frame.
>> I do not want to divert the discussion, would like to focus on device migration phases.
>> Lets please discuss in some other dedicated thread.
> Possibly, if there's a way to send admin commands to vf itself then
> Lingshan will be happy?
still need to prove why admin commands are better than registers.

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

