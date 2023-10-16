Return-Path: <virtio-comment-return-7729-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065F3CDB482
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 08:46:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4C495F3F48
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 08:46:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 29E3498648C
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 08:46:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 15936986412; Mon, 16 Oct 2023 08:46:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 068D298643F
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 Oct 2023 08:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="384351677"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="384351677"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="705530040"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="705530040"
Message-ID: <ca1c00f0-e436-4ebe-8815-1dadb1fa4e1f@intel.com>
Date: Mon, 16 Oct 2023 16:46:14 +0800
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
References: <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <4a8bf09e-9aa3-4aec-a20e-8c92f3da3d3c@intel.com>
 <PH0PR12MB5481F0C9549BFCD2EF1C175BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231013074226-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231013074226-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration



On 10/13/2023 7:49 PM, Michael S. Tsirkin wrote:
> On Fri, Oct 13, 2023 at 11:28:50AM +0000, Parav Pandit wrote:
>>>>>>> inflight descriptor tracking will be implemented by Eugenio in V2.
>>>>>> When we have near complete proposal from two device vendors, you
>>>>>> want to push something to unknown future without reviewing the work;
>>>>>> does not
>>>>> make sense.
>>>>> Didn't I ever provide feedback to you? Really?
>>>> No. I didn’t see why you need to post a new patch for dirty page tracking,
>>> when it is already present in this series.
>> This is plain ignorance and shows non_cooperative mode of working in technical committee.
>
> I personally think it's fine to have multiple proposals on the table.
> For example, current Zhu Lingshan's patch is clearly incomplete without
> memory change tracking.
> Why shouldn't he post a patchset demonstrating
> how that is supposed to work in his view?
> I am personally interested in seeing how is that
> supposed to work   - his latest proposal relies on migrating by
> trapping memory accesses but DMA can't be trapped like this generally.
Yes, dirty page tracking will be included in V2, the config space bar/cap
look like the draft I present before, and the dirty page bitmap placed in
host memory that isolated by the PASID, device DMA writing to the bitmap,
and that can avoid RMW process.

Let me sycn with Eugenio, see whether we can include his "inflight 
descriptors tracking"
in this V2.

Thanks
>
> In the end we want something addressing all use cases though
> and integrating reasonably well with existing ecosystem.
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

