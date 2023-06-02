Return-Path: <virtio-comment-return-6087-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B527DC7EE23
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 03:06:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E39B92AF86
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 03:06:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D0D659867E0
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 03:06:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BEDE79867DA; Fri,  2 Jun 2023 03:06:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AC9889867DB;
	Fri,  2 Jun 2023 03:06:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0Vk88bSx_1685675199;
Message-ID: <2b507bb6-a5ca-a199-a210-a6de38d1410c@linux.alibaba.com>
Date: Fri, 2 Jun 2023 11:06:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
To: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.oasis-open.org
Cc: shahafs@nvidia.com, virtio@lists.oasis-open.org
References: <20230601220305.587034-1-parav@nvidia.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <20230601220305.587034-1-parav@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio] [PATCH requirements 0/7] virtio net new features
 requirements



在 2023/6/2 上午6:02, Parav Pandit 写道:
> Hi All,
>
> This document captures the virtio net device requirements for the upcoming
> release 1.4 that some of us are currently working on.
>
> I would like to capture if there are any other requirements linked to the
> features captured in this document to consider in the interface design.
>
> The objectives are:
> 1. to consider these requirements in introducing new features
> listed in the document and work towards the interface design followed
> by drafting the specification changes.
>
> 2. Define practical list of requirements that can be achieved in 1.4
> timeframe incrementally and also have the ability to implement them.
>
> This is not a specification document. It is a pre-work document
> that helps to understand the draft specification addressing these
> requirements.
>
> Please review.
>
> Parav Pandit (7):
>    net-features: Add requirements document for release 1.4
>    net-features: Add low latency transmit queue requirements
>    net-features: Add low latency receive queue requirements
>    net-features: Add notification coalescing requirements
>    net-features: Add n-tuple receive flow steering requirements
>    net-features: Add packet timestamp requirements
>    net-features: Add header data split requirements

Hi, Parav.

This 1.4 job listing is pretty cool! And I believe that these work plans 
overlap a lot with our/your needs,
it would be interesting if we could work together to push these new 
features to make them actually available on VirtIO!

Thanks!

>
>   net-workstream/features-1.4.md | 224 +++++++++++++++++++++++++++++++++
>   1 file changed, 224 insertions(+)
>   create mode 100644 net-workstream/features-1.4.md
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

