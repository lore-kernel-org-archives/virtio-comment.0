Return-Path: <virtio-comment-return-7109-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639C2C001DB
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 02:51:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A25E07532C
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 02:51:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 89B8298637D
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 02:51:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 76B13983C28; Tue, 15 Aug 2023 02:51:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 658E398633F;
	Tue, 15 Aug 2023 02:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R831e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VppslNs_1692067858;
Message-ID: <1692067643.3169255-1-xuanzhuo@linux.alibaba.com>
Date: Tue, 15 Aug 2023 10:47:23 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Shahaf Shuler <shahafs@nvidia.com>,
 "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-7-parav@nvidia.com>
 <1691570137.0487022-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB548163BBE78CF4E43EF6806FDC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548163BBE78CF4E43EF6806FDC17A@PH0PR12MB5481.namprd12.prod.outlook.com>
Subject: [virtio-comment] Re: RE: [virtio] [PATCH requirements 6/7] net-features: Add packet timestamp requirements

On Mon, 14 Aug 2023 13:06:03 +0000, Parav Pandit <parav@nvidia.com> wrote:
>
>
> > From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Sent: Wednesday, August 9, 2023 2:06 PM
> >  struct vring_used_elem {
> >  	/* Index of start of used descriptor chain. */
> >  	__virtio32 id;
> >  	/* Total length of the descriptor chain which was used (written to) */
> >  	__virtio32 len;
> >
> > +	__virtio64 timestamp;
> >  };
> >
> >
> > Then, the existing devices can support this easily. If we introduce this by the
> > new desc structure, we can foresee that this function will not be implemented
> > by many existing machines. But this function is useful. So we want support this
> > by a simple way.
>
> This only works for split q.

YES.


> Packed q needs yet another format.
> And even after that we still have to live with other limitations listed in other requirements.

I would like some simple changes for the tx timestamp.

>
> Therefore its better to do the new desc definition one time which enables to optionally support timestamp, using single descriptor format.


I agree.

But we can have too. In addition to your plans, I would like to introduce a
simple method that can be used with existing machines.

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

