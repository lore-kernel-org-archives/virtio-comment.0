Return-Path: <virtio-comment-return-6715-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFACEB64DD
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Jul 2023 04:37:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 58B5A9916B
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Jul 2023 04:37:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 40B0F98670E
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Jul 2023 04:37:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 378C0983FE5; Wed,  5 Jul 2023 04:37:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2615D986637
	for <virtio-comment@lists.oasis-open.org>; Wed,  5 Jul 2023 04:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VmfEr0v_1688531822;
Message-ID: <1688531789.4036283-2-xuanzhuo@linux.alibaba.com>
Date: Wed, 5 Jul 2023 12:36:29 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
 <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEtNPGneB0E1sVqmpe9fGwMp=_2vmepy3Bm9r=5=5r=ZXQ@mail.gmail.com>
 <1688372430.0519888-1-xuanzhuo@linux.alibaba.com>
 <20230703071106-mutt-send-email-mst@kernel.org>
 <1688472851.555355-2-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481F6EA4699382DB041A880DC2EA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1688531407.740055-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB54814124F8CD6E90AC8F0F47DC2FA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54814124F8CD6E90AC8F0F47DC2FA@PH0PR12MB5481.namprd12.prod.outlook.com>
Subject: Re: RE: RE: [virtio-comment] About the plan of Admin Queue

On Wed, 5 Jul 2023 04:35:36 +0000, Parav Pandit <parav@nvidia.com> wrote:
>
>
> > From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Sent: Wednesday, July 5, 2023 12:30 AM
> >
> > On Tue, 4 Jul 2023 13:15:23 +0000, Parav Pandit <parav@nvidia.com> wrote:
> > >
> > > > From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > Sent: Tuesday, July 4, 2023 8:14 AM
> > >
> > > > But in the scenario I mentioned, the vendor's management software
> > > > runs on the DPU, and all hosts belong to the user.
> > > >
> > > How did vendor management software configure the parameters on the src
> > side?
> >
> >
> > Sorry, the src side you mean the host, right?
> >
> No. in your live migration (LM) example src side mean src side of hypervisor where a virtio device is used for the first time.


Oh, I mistake.


>
> >
> > > Same channel can be used on destination side, right?
> >
> > Do you mean that the bandwidth of the net device can be configured by the
> > user?
>
> No no.
> > I think the user can only do this on the platform.
> >
> Right, only by the platform.

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

