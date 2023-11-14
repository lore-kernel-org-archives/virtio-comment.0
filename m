Return-Path: <virtio-comment-return-8349-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C350CC4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 02:05:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 09EE52AC54
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 02:05:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D0927986D63
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 02:05:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B050D986D60; Tue, 14 Nov 2023 02:05:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 31142986D61
	for <virtio-comment@lists.oasis-open.org>; Tue, 14 Nov 2023 02:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="476767867"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="476767867"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="830409285"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="830409285"
Message-ID: <3e83842d-edb5-4d3c-983a-b9d03f8d9497@intel.com>
Date: Tue, 14 Nov 2023 10:03:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org>
 <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813C84CFA5601DB1B47885DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu-Zs-dxcYRjtV+hLBVy5Tv9JzgT2c83Zjzt7A-a1QR2A@mail.gmail.com>
 <20231113015854-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231113015854-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands



On 11/13/2023 10:30 PM, Michael S. Tsirkin wrote:
> On Mon, Nov 13, 2023 at 11:41:07AM +0800, Jason Wang wrote:
>> On Fri, Nov 10, 2023 at 2:46 PM Parav Pandit <parav@nvidia.com> wrote:
>>> Hi Michael,
>>>
>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>> Sent: Thursday, November 9, 2023 1:29 PM
>>> [..]
>>>>> Besides the issue of performance, it's also racy, assuming we are logging
>>>> IOVA.
>>>>> 0) device log IOVA
>>>>> 1) hypervisor fetches IOVA from log buffer
>>>>> 2) guest map IOVA to a new GPA
>>>>> 3) hypervisor traverse guest table to get IOVA to new GPA
>>>>>
>>>>> Then we lost the old GPA.
>>>> Interesting and a good point. And by the way e.g. vhost has the same issue.  You
>>>> need to flush dirty tracking info when changing the mappings somehow.  Parav
>>>> what's the plan for this? Should be addressed in the spec too.
>>>>
>>> As you listed the flush is needed for vhost or device-based DPT.
>> What does DPT mean? Device Page Table? Let's not invent terminology
>> which is not known by others please.
>>
>> We have discussed it many times. You can't just depend on ATS or
>> reinventing wheels in virtio.
>>
>> What's more, please try not to give me the impression that the
>> proposal is optimized for a specific vendor (like device IOMMU
>> stuffs).
> Devices with IOMMU exist.
> So if it's for device IOMMU that's fine, as long as it's well isolated.
device side IOMMU is not a must and I hope virito features don't depend 
on it.
>
>
>>> The necessary plumbing is already covered for this in the query (read and clear) command of this v3 proposal.
>> The issue is logging via IOVA ... I don't see how "read and clear" can help.
>>
>>> It is listed in Device Write Records Read Command.
>> Please explain how your proposal can solve the above race.
>>
>>> When the page write record is fully read, it is flushed.
>>> How/when to use, I think its hypervisor specific, so we probably better off not documenting those details.
>> Well, as the author of this proposal, at least you need to know how a
>> hypervisor can work with your proposal, no?
>>
>>> May be such read is needed in some other path too depending on how hypervisor implemented.
>> What do you mean by "May be ... some other path" here? You're
>> inventing a mechanism that you don't know how a hypervisor can use?
>>
>> Thanks
>
> It seems like a subtle enough race that it really should be documented.
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

