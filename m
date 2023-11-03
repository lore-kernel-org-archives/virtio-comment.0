Return-Path: <virtio-comment-return-8156-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE9FC4332F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:12:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C6650339B7
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:12:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A22DA986C3D
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:12:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 89797986C3B; Fri,  3 Nov 2023 14:12:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 79BA3986C3C
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 14:12:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1887091"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1887091"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765253932"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="765253932"
Message-ID: <5ae7a777-37fc-403b-9154-870c9bc7d775@intel.com>
Date: Fri, 3 Nov 2023 22:11:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Parav Pandit <parav@nvidia.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-6-lingshan.zhu@intel.com>
 <PH0PR12MB54811A05FDE5F20FBC7DC268DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54811A05FDE5F20FBC7DC268DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: [PATCH V2 5/6] virtio: introduce dirty page tracking facility



On 11/3/2023 7:35 PM, Parav Pandit wrote:
> Hi Jason,
>
>> From: Zhu Lingshan <lingshan.zhu@intel.com>
>> Sent: Friday, November 3, 2023 4:05 PM
>> This commit introduce a new virtio facility to track device dirty pages, a typical
>> use case is live migration.
>>
>> The implementation of this facility is transport specific.
>>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
> In my series of dirty page tracking (aka write recording), you kept insisting until Thu, that it is optional, and platform will do it.
> Why do you propose this facility now?
> Can you please explain as commit log says typical use case is "live migration"? :)
You misunderstood us.

If you remember, it is you challenge our config space proposal (v1) is 
incomplete without dirty page tracking facility.

This is to answer your challenge, as an optional backup.

We still believe dirty page tracking should be better done by platform 
facilities, like vt-d.



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

