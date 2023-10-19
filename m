Return-Path: <virtio-comment-return-7838-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92946CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 08:18:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 060E6941E7
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 08:18:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D92E49868D2
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 08:18:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C360D9868C9; Thu, 19 Oct 2023 08:18:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B3E1C9868CA
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 08:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="371263827"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="371263827"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="822754858"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="822754858"
Message-ID: <4e812bc4-a90f-4726-948a-d8d04e568be2@intel.com>
Date: Thu, 19 Oct 2023 16:18:42 +0800
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
References: <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com>
 <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018062951-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231018062951-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 10/18/2023 6:47 PM, Michael S. Tsirkin wrote:
> On Wed, Oct 18, 2023 at 10:22:57AM +0000, Parav Pandit wrote:
>>> From: Michael S. Tsirkin <mst@redhat.com>
>>> Sent: Wednesday, October 18, 2023 3:26 PM
>>> For completeness, and to shorten the thread, can you please list known
>>> issues/use cases that are addressed by the status bit interface and how you plan
>>> for them to be addressed?
>> I will avoid listing known issues for a moment for status bit in this email.
>>
>> Status bit interface helps in following good ways.
>> 1. suspend/resume the device fully by the guest by negotiating the new feature.
>> This can be useful in the guest-controlled PM flows of suspend/resume.
>> I still think for this, only feature bit is necessary, and device_status modification is not needed.
>> D0->D3 and D3->D0 transition of the pci can suspend and resume the device which can preserve the last device_status value before entering D3.
>> (Like preserving all rest of the fields of common and other device config).
>> This is orthogonal and needed regardless of device migration.
>>
>> 2. If one does not want to passthrough a member device, but build a mediation-based device on top of existing virtio device,
>> It can be useful with mediating software.
>> Here the mediating software has ample duplicated knowledge of what the member device already has.
>> This can fulfil the nested requirement differently provided a platform support it.
>> (PASID limitation will be practical blocker here).
>>
>> How to I plan to address above two?
>> a. #1 to be addressed by having the _F_PM bit, when the bit is negotiated PCI PM drives the state.
>> This will work orthogonal to VMM side migration and will co-exist with VMM based device migration.
> OK that sounds kind of reasonable. Lingshan, Jason are you interested in
> suspend/resume? Want to start a thread on best way to support that?
suspend/resume a device through PM? why? is the status bit in my series 
better?
>
>> b. nested use case:
>> L0 VMM maps a VF to L1 guest as PF with emulated SR-IOV capability.
>> L1 guest to enable SR-IOV and mapping the VF to L2 guest.
>> Consulting industry ecosystem to support nested outside of virtio.
> Can't say I like this much, *a lot* of things to implement,
> and burning up a VF for control path is not nice.
> As an alternative, I suggest a new admin command pci capability
> with basically a PA and a valid bit. Easy to emulate and add to
> a VF. And maybe some way to suggest a safe place for it that
> won't conflict with anything? Still trying to figure out if
> we should add PASID in there, or what. Maybe optionally?
> If actual hardware does it we'd be burning up 20 bits,
> but for a software implementation it's free.
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

