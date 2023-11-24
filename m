Return-Path: <virtio-comment-return-8606-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50895C61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:43:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A67853E570
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:43:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7A5AE9868A6
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:43:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5DEEA9862D9; Fri, 24 Nov 2023 06:43:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4E5B89868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 06:43:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="396285383"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="396285383"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1099001172"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="1099001172"
Message-ID: <f2a90f19-8a57-4e67-b0c3-2cd56111f1a9@intel.com>
Date: Fri, 24 Nov 2023 14:43:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "eperezma@redhat.com"
 <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <20231121161218-mutt-send-email-mst@kernel.org>
 <CACGkMEuLFxsAZ6W0SdJSEHw4gtgM-aehfC+oTLxH4zHxjMw3vw@mail.gmail.com>
 <PH0PR12MB5481CCD71A032A6590F14D8FDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsqasttUGjOJwogPoU2+HFurFK+gxY1gO9Pg8+s4JReZQ@mail.gmail.com>
 <20231124011846-mutt-send-email-mst@kernel.org>
 <CACGkMEusUPTFfi5Gmu=Fg2vFF5i71e7rfsk_21HabqCq_06suQ@mail.gmail.com>
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <CACGkMEusUPTFfi5Gmu=Fg2vFF5i71e7rfsk_21HabqCq_06suQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND



On 11/24/2023 2:28 PM, Jason Wang wrote:
> On Fri, Nov 24, 2023 at 2:20 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Fri, Nov 24, 2023 at 11:25:41AM +0800, Jason Wang wrote:
>>> On Wed, Nov 22, 2023 at 2:32 PM Parav Pandit <parav@nvidia.com> wrote:
>>>>
>>>>> From: Jason Wang <jasowang@redhat.com>
>>>>> Sent: Wednesday, November 22, 2023 10:59 AM
>>>>>
>>>>> On Wed, Nov 22, 2023 at 5:18 AM Michael S. Tsirkin <mst@redhat.com>
>>>>> wrote:
>>>>>> On Tue, Nov 21, 2023 at 03:33:07PM +0800, Jason Wang wrote:
>>>>>>>> Lingshan claimed that suspending device is for live migration in commit
>>>>> log and in discussion he portray it as some basic facility unrelated to device
>>>>> migration such as debug etc.
>>>>>>>> Instead of claiming it as some non_device_migration facility does not
>>>>> make sense.
>>>>>>> It is used for migration for sure.
>>>>>> Well having a generic facility to stop device sounds like a nice thing.
>>>>>> However the devil is in the detail. A lot of detail here seems very
>>>>>> much tailored to a very specific implementation in mind.
>>>>>> So thinking through how it will work e.g. for power management would
>>>>>> be a good excercise to figure out how it should work in detail.
>>>>> It might work in the case where there's no PM support in the transport. E.g for
>>>>> MMIO devices.
>>>>>
>>>> MMIO should implement PM like other transport. That brings the equivalency principle.
>>>>
>>> MMIO are usually platform devices. I don't see the point.
>>>
>>> Thanks
>> I don't understand what you are saying. Why does it make sense to
>> suspend individual platform devices when they are suspended
>> with the whole platform?
> It is because we don't need to suspend the whole platform to migrate
> the virtio-MMIO device.
I agree, should only need to suspend the device
>
> Thanks
>
>> --
>> MST
>>


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

