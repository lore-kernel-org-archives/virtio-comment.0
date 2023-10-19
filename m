Return-Path: <virtio-comment-return-7832-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614BBCDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 06:51:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A007A45B26
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 06:51:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8BF599868CF
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 06:51:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 778899868C7; Thu, 19 Oct 2023 06:51:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 674679868C8
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 06:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VuT97Nw_1697698282;
Message-ID: <d869de9e-4de0-47f9-9637-f4bd18dee29e@linux.alibaba.com>
Date: Thu, 19 Oct 2023 14:51:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Parav Pandit <parav@nvidia.com>
Cc: sburla@marvell.com, shahafs@nvidia.com, si-wei.liu@oracle.com,
 xuanzhuo@linux.alibaba.com,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20231007051443.460148-1-parav@nvidia.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <20231007051443.460148-1-parav@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 0/7] virtio-net: Support flow filter
 for receive packets

Hi Parav.

Please fix some minor typos in the next version. More below.

Thanks!

在 2023/10/7 下午1:14, Parav Pandit 写道:
> Summary:
> ========
> This series improves virtio net receive packet steering to forward/steer
> packets to specific RQ.
>
> This basic functionality will enable Linux ethtool steering, Accelerated
> receive flow steering (ARFS) as starting point, and more use cases in
> future.
>
> Problem statement:
> ==================
> Currently packet allow/drop interface has few limitations.

s/has few limitations/has a few limitations/

>
> 1. Driver cannot add or delete an individual entry for mac and vlan.
> 2. Driver cannot select mac+vlan combination for which
>      to allow/drop packet.

s/packet/packets

> 3. Driver cannot not set other commonly used packet match fields

Remove 'not'.

>      such as IP header fields, TCP, UDP, SCP header fields.
> 4. Driver cannot steer specific packets based on the match
>     fields to specific receiveq.
> 5. Driver do not have multiple or dedicated virtqueues to
>      perform flow filter requests in accelerated manner in

in an accelerated manner

>      the device.
>
> Solution:
> =========
> Flow filter as generic framework to overcome above limitations.

as a generic framework

>
> Overview:
> =========
> A flow filter defines the flow based on one or more match fields
> of the packet, defines an action like drop/forward to RQ.
>
> The flow filters are organized in flow filter groups so that they
> can be ordered when multiple applications wants to use it.

s/wants/want

>
> Flow filters requests can be transported via control vq or dedicated
> flow filter virtqueue so that it does not get intermixed with other
> slow operations of cvq.
>
> Flow filter requirements addressed by this series is worked by virtio community at
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
>
> This series utilizes enhancements proposed in [2] and [3].
> It uses updated control vq command format from [3].
> It uses new _DYNAMIC feature to create queues when needed and
> saves guest and device resources.
>
> [1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html
> [2] https://lists.oasis-open.org/archives/virtio-comment/202309/msg00236.html
> [3] https://lists.oasis-open.org/archives/virtio-comment/202309/msg00227.html
>
> Patch summary:
> ==============
> patch-1 adds theory of operation description for flow filter
> patch-2 adds device capabilities cvq commands
> patch-3 adds group add/delete commands
> patch-4 adds transport set command
> patch-5 adds packet match fields and values
> patch-6 adds flow filter requests to transport via vq
> patch-7 adds device and driver requirements
>
> Please review.
>
> Changelog:
> ==========
> v0->v1:
> - addressed comments from Satananda
> - added device requirement to return non zero value in fields_bmap
> - added device requirement to not repeat filter type in response
> - added driver requirement to order filter match field as it
>    appears in the packet
> - added device requirement to fail group delete command on existing
>    flow entries
> - added mask field in the type to indicate supported mask by device
>    and also in later patch to use it to indicate mask on adding
>    flow filter. As a result removed the mask_supported capability
>    field
>
> Parav Pandit (7):
>    virtio-net: Add theory of operation for flow filter
>    virtio-net: Add flow filter capabilities read commands
>    virtio-net: Add flow filter group life cycle commands
>    virtio-net: Add flow filter transport set command
>    virtio-net: Add flow filter match values
>    virtio-net: Add flow filter requests
>    virtio-net: Add flow filter device and driver requirements
>
>   device-types/net/description.tex | 687 ++++++++++++++++++++++++++++++-
>   1 file changed, 686 insertions(+), 1 deletion(-)
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

