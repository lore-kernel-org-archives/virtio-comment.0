Return-Path: <virtio-comment-return-7124-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D50C0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 06:29:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 154F2C8C49
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 06:29:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E6A949863A4
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 06:29:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D27E9984035; Tue, 15 Aug 2023 06:29:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C190398633F;
	Tue, 15 Aug 2023 06:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R791e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VpqWyiT_1692080952;
Message-ID: <1692080940.1446962-7-xuanzhuo@linux.alibaba.com>
Date: Tue, 15 Aug 2023 14:29:00 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20230731074945.108883-1-xuanzhuo@linux.alibaba.com>
 <1691388913.8316696-2-xuanzhuo@linux.alibaba.com>
 <1692070761.567899-3-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB54815E430B977F2969C9FAEADC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1692079141.2231495-4-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481A89E24577A0FBC1F8D35DC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481A89E24577A0FBC1F8D35DC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
Subject: [virtio-comment] Re: RE: RE: [virtio-dev] [PATCH v14 RESENT] virtio-net: support device stats

On Tue, 15 Aug 2023 06:17:14 +0000, Parav Pandit <parav@nvidia.com> wrote:
>
> > From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Sent: Tuesday, August 15, 2023 11:29 AM
>
>
> > This version already has the bitmap. I forgot to change the commit log.
>
> Please move to access via DMA interface discussed under subject "virtio-net: support access and control the member devices".
> For virtio net this dma interface of cvq already exists. Please relocate it to a cvq command.


OK.




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

