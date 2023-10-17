Return-Path: <virtio-comment-return-7751-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BCECDB474
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 07:42:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 65A357DD69
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 07:42:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4972798684F
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 07:42:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 32EE6986847; Tue, 17 Oct 2023 07:42:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 23A7A986848
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 07:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VuMTYYB_1697528523;
Message-ID: <b4db864a-a35d-4e97-ade5-feb417df6385@linux.alibaba.com>
Date: Tue, 17 Oct 2023 15:42:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Heng Qi <hengqi@linux.alibaba.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S . Tsirkin"
 <mst@redhat.com>, Parav Pandit <parav@nvidia.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <40b847baf9158cac8c23cb97dd643f768e3a6e05.1697006458.git.hengqi@linux.alibaba.com>
 <CACGkMEtWifs4gwU83-_x_5xKysVpyEsvxT0dcTOyPeOQGVVu-w@mail.gmail.com>
 <57e3990a-1108-4327-86e3-acce30779baa@linux.alibaba.com>
In-Reply-To: <57e3990a-1108-4327-86e3-acce30779baa@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH] virtio-net: support distinguishing
 between partial and full checksum

Hi, Jason.

在 2023/10/16 下午4:53, Heng Qi 写道:
>
> then I think this feature conflicts with GUEST_GSO_xx. Because XDP 
> currently cannot coexist with GRO_HW etc.

That last sentence may be a little confusing. What I mean is that 
FULL_CSUM is not
mutually exclusive with GUEST_GSO_xx, even if dynamically enabled.

It's just that XDP and GUEST_GSO_xx are mutually exclusive(even with 
FULL_CSUM).

Thanks!


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

