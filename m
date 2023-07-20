Return-Path: <virtio-comment-return-6870-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BB9C0015E
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:21:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 827F62B00E
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:21:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6DA9B98680F
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:21:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 53ABC9867FC; Thu, 20 Jul 2023 02:21:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 411E29867FD;
	Thu, 20 Jul 2023 02:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R811e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Vnnvkb9_1689819695;
Message-ID: <1689819649.59188-3-xuanzhuo@linux.alibaba.com>
Date: Thu, 20 Jul 2023 10:20:49 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: <shahafs@nvidia.com>,
 <hengqi@linux.alibaba.com>,
 <virtio@lists.oasis-open.org>,
 Parav Pandit <parav@nvidia.com>,
 <virtio-comment@lists.oasis-open.org>
References: <20230702234410.47546-1-parav@nvidia.com>
In-Reply-To: <20230702234410.47546-1-parav@nvidia.com>
Subject: Re: [virtio-comment] [PATCH REQUIREMENTS v2 0/7] virtio net new features requirements

On Mon, 3 Jul 2023 02:44:03 +0300, Parav Pandit <parav@nvidia.com> wrote:
> Hi All,
>
> This document captures the virtio net device requirements for the upcoming
> release 1.4 that some of us are currently working on.
>
> This is live document to be updated in coming time and work towards it for
> its design which can result in a draft specification.
>
> The objectives are:
> 1. to consider these requirements in introducing new features
> listed in the document and otherwise and work towards the interface
> design followed by drafting the specification changes.
>
> 2. Define practical list of requirements that can be achieved in 1.4
> timeframe incrementally and also have the ability to implement them.
>
> Please review.

First of all, I want to pay tribute to you.

Under your promotion, I think the advancement of these tasks has been relatively
fast. But I'm wondering when we expect these things to be done.

I also want to know, do you plan to release specs one by one, or these related
specs together. I would like to know about related plans.

We very much hope that these tasks, especially features such as device counter,
n-tuple receive flow filters requirements, and packet timestamp can be
completed within this year. The sooner the better.

Thanks.


>
> TODO:
> 1. Some more refinement needed for rx low latency and header data split
>    requirements.
>
> ---
> changelog:
> v1->v2:
> - major update of receive flow filter requirements updated based on last
>   two design discussions in community and offline research
> - examples added
> - link to use case and design goal added
> - control and operation side requirements split
> - more verbose
> v0->v1:
> - addressed comments from Heng Li
> - addressed few (not all) comments from Michael
> - per patch changelog
>
>
> Parav Pandit (7):
>   net-features: Add requirements document for release 1.4
>   net-features: Add low latency transmit queue requirements
>   net-features: Add low latency receive queue requirements
>   net-features: Add notification coalescing requirements
>   net-features: Add n-tuple receive flow filters requirements
>   net-features: Add packet timestamp requirements
>   net-features: Add header data split requirements
>
>  net-workstream/features-1.4.md | 308 +++++++++++++++++++++++++++++++++
>  1 file changed, 308 insertions(+)
>  create mode 100644 net-workstream/features-1.4.md
>
> --
> 2.26.2
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
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

