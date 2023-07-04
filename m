Return-Path: <virtio-comment-return-6697-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CB8EB64D9
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Jul 2023 12:13:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 713DB157EEB
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Jul 2023 12:13:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 59741986597
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Jul 2023 12:13:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 47389986593; Tue,  4 Jul 2023 12:13:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 32D6C986595
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Jul 2023 12:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Vmcr6LA_1688472775;
Message-ID: <1688472687.2108436-1-xuanzhuo@linux.alibaba.com>
Date: Tue, 4 Jul 2023 20:11:27 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 virtio-comment@lists.oasis-open.org,
 parav@nvidia.com
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
 <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEtNPGneB0E1sVqmpe9fGwMp=_2vmepy3Bm9r=5=5r=ZXQ@mail.gmail.com>
 <1688372430.0519888-1-xuanzhuo@linux.alibaba.com>
 <20230703071106-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230703071106-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] About the plan of Admin Queue

On Mon, 3 Jul 2023 09:05:09 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> OK it looks like at least Parav and Jason understand what's
> going on, maybe one of you can explain:
>
> 1- there's a management stack that can bind an ID
>   to a group of properties
> 2- the proposed command then binds an ID to a VF
> 3- after this, VF can be assigned to a VM
>
> Is this a fair summary?

This sounds like what I need.

This thread discusses another point, the device notifies the pf driver that
there is a new device.

Thanks.


>
> In that case what is gained compared to
> configuring properties on the VF directly?
> Why is not the ID an internal property of the management?
>
> --
> MST
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

