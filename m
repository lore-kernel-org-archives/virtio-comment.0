Return-Path: <virtio-comment-return-8221-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02638C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 07:57:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3ED3F2B142
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 07:57:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2755C9867FD
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 07:57:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 10B349867E8; Tue,  7 Nov 2023 07:57:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F3FBF9867EA
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 07:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="392328336"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="392328336"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="3902593"
Message-ID: <d22ca64a-8034-457a-b1ec-4afdc6726bfa@intel.com>
Date: Tue, 7 Nov 2023 15:57:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <PH0PR12MB548175CD39FA20BE2727E5B6DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuJySOAGguGvnBA7ftD0mwwM_M0SO0266M1+7d+XRXQ=g@mail.gmail.com>
 <PH0PR12MB5481ABD71DAF7D82931D57D2DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu0gfw4zNc9KTLm9ekhuWgsgzHLVya_68HajQZObtr3-w@mail.gmail.com>
 <DM8PR12MB54808B71AA9C0A945D0A3226DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com>
 <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <20231107021917-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231107021917-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration



On 11/7/2023 3:22 PM, Michael S. Tsirkin wrote:
> On Tue, Nov 07, 2023 at 12:05:12PM +0800, Jason Wang wrote:
>>>>>> One thing that you ignore is that, hypervisor can use what you
>>>>>> invented as a transport for VF, no?
>>>>>>
>>>>> No. by design,
>>>> It works like hypervisor traps the virito config and forwards it to admin
>>>> virtqueue and starts the device via device context.
>>> It needs more granular support than the management framework of device context.
>> It doesn't otherwise it is a design defect as you can't recover the
>> device context in the destination.
>>
>> Let me give you an example:
>>
>> 1) in the case of live migration, dst receive migration byte flows and
>> convert them into device context
>> 2) in the case of transporting, hypervisor traps virtio config and
>> convert them into the device context
>>
>> I don't see anything different in this case. Or can you give me an example?
> "trap virtio config" means "trap writes into virtio config" presumably?
> config can change itself without driver doing anything. Hypervisor
> can't trap it then. This is one of the problems with Lingshan's
> SUSPEND bit - what happens with these config changes in underspecified.
It should send a config interrupt and increase its generation.

By the way, is it buggy if a device suspend itself?
Is needs_reset better even not properly handled by virito driver
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

