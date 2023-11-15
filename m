Return-Path: <virtio-comment-return-8357-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48C9C07548
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 04:06:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DD08E2168A
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 04:06:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B8E92986D9B
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 04:06:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A2987986D93; Wed, 15 Nov 2023 04:06:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8E3B8986D94
	for <virtio-comment@lists.oasis-open.org>; Wed, 15 Nov 2023 04:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="370156256"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="370156256"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="830828445"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="830828445"
Message-ID: <b9b8a564-b2eb-4c1c-9ada-975f3833e282@intel.com>
Date: Wed, 15 Nov 2023 12:05:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org>
 <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org>
 <CACGkMEuSpZ0Y8kxXv26b38pvX--OCdvWm5KvMniqo=W10ruBTA@mail.gmail.com>
 <20231113013016-mutt-send-email-mst@kernel.org>
 <9952859f-1b72-46bf-b386-7c3f5c69269f@intel.com>
 <20231114032553-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231114032553-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording
 commands



On 11/14/2023 4:27 PM, Michael S. Tsirkin wrote:
> On Tue, Nov 14, 2023 at 03:34:32PM +0800, Zhu, Lingshan wrote:
>>>> So I can't
>>>> believe it has good performance overall. Logging via IOMMU or using
>>>> shadow virtqueue doesn't need any extra PCI transactions at least.
>>> On the other hand they have an extra CPU cost.  Personally if this is
>>> coming from a hardware vendor, I am inclined to trust them wrt PCI
>>> transactions.  But anyway, discussing this at a high level theoretically
>>> is pointless - whoever bothers with actual prototyping for performance
>>> testing wins, if no one does I'd expect a back of a napkin estimate
>>> to be included.
>> if so, Intel has released productions implementing these interfaces years
>> ago,
>> see live migration in 4.1. IFCVF vDPA Implementation,
>> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.html
>> and
> That one is based on shadow queue, right? Which I think this shows
> is worth supporting.
Yes, it is shadow virtqueue, I assume this is already mostly done,
do you see any gaps we need to address in our series that we should work on?

Thanks
>
>> But I still believe we are here try our best to work out an industrial spec
>> with better quality, to serve broad interest. This is not competition
>> between companies,
>> and the spec is not a FIFO, not like a early bird can catch all the worm.


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

