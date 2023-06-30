Return-Path: <virtio-comment-return-6640-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5215DEB64D7
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 05:59:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 720362B018
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 05:59:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 58D8D9866EA
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 05:59:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4911A984214; Fri, 30 Jun 2023 05:59:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 34A659866E7
	for <virtio-comment@lists.oasis-open.org>; Fri, 30 Jun 2023 05:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R951e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0VmHA0Ca_1688104734;
Message-ID: <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
Date: Fri, 30 Jun 2023 13:54:24 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: virtio-comment@lists.oasis-open.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
In-Reply-To: <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
Subject: Re: [virtio-comment] About the plan of Admin Queue

On Tue, 20 Jun 2023 16:11:12 +0800, "Zhu, Lingshan" <lingshan.zhu@intel.com> wrote:
>
>
> On 6/20/2023 2:44 PM, Xuan Zhuo wrote:
> > Hi,
> >
> > hi, I would want to know some plans and progress about admin queue.
> >
> > At the current spec, it seems that there is only one framework and no
> > specific commands. I'd like to know if anyone is currently working on this and
> > what the plans are.
> >
> > We also faced some similar issues, and we think admin queue is a good way to
> > manage sr-iov.
> >
> >
> > Thanks.
> I plan to rebase original transport vq on admin vq.
>
> https://lists.oasis-open.org/archives/virtio-comment/202208/msg00140.html


I review the patch, that is for S-IOV, right?

I think it is good.

I would if all is configured by the transport vq/admin vq from the OS?

Can we create a managed dev from the backend?

Such as, the DPU sends a command to the driver, then the driver creates a new
managed dev.

Thanks.


>
> Thanks,
> Zhu Lingshan
> >
> >
> >
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> >
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

