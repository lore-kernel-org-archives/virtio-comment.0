Return-Path: <virtio-comment-return-8235-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FCEC4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:01:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 303D42B07D
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:01:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 19613986800
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:01:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 070939867F9; Tue,  7 Nov 2023 10:01:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EBCE89867FA
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 10:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="455956829"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="455956829"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="906367062"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="906367062"
Message-ID: <431c0495-f0d9-46d6-8336-cc2bd293cc35@intel.com>
Date: Tue, 7 Nov 2023 18:01:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "jasowang@redhat.com" <jasowang@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com>
 <PH0PR12MB54810847007367DD75FA3D60DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54810847007367DD75FA3D60DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking



On 11/6/2023 7:13 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Monday, November 6, 2023 3:04 PM
>> So, please no pass-through discussion anymore.
> If you comment like this, nothing can progress.
>
> What you are implying with above language is:
> "hey a virtio can do live migration ONLY by creating vdpa device on top of ALREADY virtio device, and you get another virtio device by running through 3 layers of stack you get virtio device on other side!".
I never say that right? I keep explaining how pass-through and "trap and 
emulate work", I even explained how PASID work.
>
> Then for sure, I disagree to it for 100% for such a single-minded design.
>
> At least I am trying to propose if a solution can work for generic passthrough where least amount of hypervisor mediation is done.
>
> And an extension where hypervisor has choice to more medication layers as it finds suitable.
> And if there are technical issues, may be two different interfaces or more admin commands needed for two modes.
> The idea is to attempt to converge and discuss those details, not the opposite.
>
> Your above comment shows a clear sign of non-collaboration to make both mode works.
Well, I see you are emotional, please take a deep breath and calm down, 
to be professional,
give yourself a break, and really not necessary to be mad at me.

As you know I am just a Junior Engineer in Intel, not like you a Senior 
Principle Engineer who has spent many years and
have developed knowledge in this area. So I am quite technical focusing, 
they are all technical discussions till now.

We always welcome collaboration, remember Jason has proposed a solution 
to build admin vq based on these basic facilities,
and I am fully agree on his proposal.
> At one point I may probably stop responding to your comments that repeatedly says:
>
> "Go read QEMU code, Do you know what is PASID?, Do you know num_queues, Go read PCI spec"...
With all respect, you should do these because they are text book knowledge.
>
> Taking deep breath now to do some productive work in TC...


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

