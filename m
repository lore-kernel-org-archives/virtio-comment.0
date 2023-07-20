Return-Path: <virtio-comment-return-6874-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA7CC001B0
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:40:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 218AA370E9
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:40:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0F43C98680D
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Jul 2023 02:40:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F20449867FC; Thu, 20 Jul 2023 02:40:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DF3E99867FE;
	Thu, 20 Jul 2023 02:40:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Vno6deh_1689820832;
Message-ID: <1689820586.8879051-7-xuanzhuo@linux.alibaba.com>
Date: Thu, 20 Jul 2023 10:36:26 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Shahaf Shuler <shahafs@nvidia.com>,
 "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <20230702234410.47546-1-parav@nvidia.com>
 <1689819649.59188-3-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB54813F5714937C95A208CF13DC3EA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54813F5714937C95A208CF13DC3EA@PH0PR12MB5481.namprd12.prod.outlook.com>
Subject: Re: RE: [virtio-comment] [PATCH REQUIREMENTS v2 0/7] virtio net new features requirements

On Thu, 20 Jul 2023 02:28:26 +0000, Parav Pandit <parav@nvidia.com> wrote:
>
>
> > From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Sent: Wednesday, July 19, 2023 10:21 PM
>
> > Under your promotion, I think the advancement of these tasks has been
> > relatively fast. But I'm wondering when we expect these things to be done.
> >
> There has been delay in last 10 days due to some unplanned tasks.
>
> Device counters and ntuple is very clear multi-vendor and multi-user requirements.
> So lets finish both the requirements by 26th of July.
> By mid august we can complete the design and draft for both by 1st week of sept.

OK. we will do these firstly.

>
> > I also want to know, do you plan to release specs one by one, or these related
> > specs together. I would like to know about related plans.
> >
> Yes, we don't need to put all in one patchset.
> In last few meetings we already identified requirements that can be divisible as individual one to progress.
> Counters and ntuple are on top.

OK.


>
> > We very much hope that these tasks, especially features such as device counter,
> > n-tuple receive flow filters requirements, and packet timestamp can be
> > completed within this year. The sooner the better.
>
> Packet timestamp requires new VQ desc format because it has direct impact on how many DMAs are done and how we pack them.
> So how about we get to this after, we finish the ntuple and counters, in mid sept?


Great.

> We can design new VQ format for latency + timestamp in one go from Sept onwards before Dec.
>

We are more than happry to help.

Thanks.

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

