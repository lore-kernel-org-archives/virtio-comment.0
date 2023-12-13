Return-Path: <virtio-comment-return-8790-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DBFC4332F
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:33:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6698860D2F
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:33:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4DEFC9866E8
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:33:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3A4F498669C; Wed, 13 Dec 2023 06:33:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1BBA59866B2
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Dec 2023 06:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VyP6l6V_1702449218;
Message-ID: <1702449025.265035-5-xuanzhuo@linux.alibaba.com>
Date: Wed, 13 Dec 2023 14:30:25 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Shahaf Shuler <shahafs@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>
References: <20231110124040.2093394-1-parav@nvidia.com>
 <20231110124040.2093394-3-parav@nvidia.com>
 <1702447371.5899365-3-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB54818BCA16901BBF7668788DDC8DA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54818BCA16901BBF7668788DDC8DA@PH0PR12MB5481.namprd12.prod.outlook.com>
Subject: Re: RE: [virtio-comment] [PATCH 2/2] virtio-net: Clarify the size of the struct virtio_net_hdr for tx

On Wed, 13 Dec 2023 06:23:35 +0000, Parav Pandit <parav@nvidia.com> wrote:
>
> > From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Sent: Wednesday, December 13, 2023 11:33 AM
> >
> > On Fri, 10 Nov 2023 14:40:40 +0200, Parav Pandit <parav@nvidia.com>
> > wrote:
> > > The feature VIRTIO_NET_F_HASH_REPORT only applies to the receive side.
> > > However, when VIRTIO_NET_F_HASH_REPORT feature was introduced, it
> > was
> > > not clarified that the size of the struct virtio_net_hdr on the packet
> > > transmission also uses higher size when VIRTIO_NET_F_HASH_REPORT is
> > > negotiated.
> > >
> > > Explicitly clarify this.
> > >
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > ---
> > >  device-types/net/description.tex | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/device-types/net/description.tex
> > > b/device-types/net/description.tex
> > > index f5647d4..00ea58d 100644
> > > --- a/device-types/net/description.tex
> > > +++ b/device-types/net/description.tex
> > > @@ -531,6 +531,12 @@ \subsubsection{Packet
> > > Transmission}\label{sec:Device Types / Network Device / De
> > >
> > >  \drivernormative{\paragraph}{Packet Transmission}{Device Types /
> > > Network Device / Device Operation / Packet Transmission}
> > >
> > > +If VIRTIO_NET_F_HASH_REPORT is not negotiated, the size of the field
> > > +\field{struct virtio_net_hdr} is 12 bytes.
> > > +
> > > +If VIRTIO_NET_F_HASH_REPORT is negotiated, the size of the field
> > > +\field{struct virtio_net_hdr} is 20 bytes.
> > > +
> >
> > If we need a new feature, because that the implement of the current linux
> > kernel has the same size on the tx patch.
>
> I didn't understand your comment -  "if we need a new feature" part.
>
> Current Linux kernel has same size for tx and rx, snippet below.
>
>         if (vi->has_rss_hash_report)
>                 vi->hdr_len = sizeof(struct virtio_net_hdr_v1_hash);
>
> So if you are asking if we need a new feature bit? I believe, we don't need a new feature bit for current implementations and behavior.
>
> We will new feature bit in future to have shorter virtio_net_hdr on tx, however we better consume it as part of new inline descriptor format.

Sorry, I missed something.

One question, for "If VIRTIO_NET_F_HASH_REPORT is not negotiated", should we
consider the legacy mode.

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

