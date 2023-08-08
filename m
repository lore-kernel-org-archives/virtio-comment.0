Return-Path: <virtio-comment-return-7058-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF864C001DB
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 08:18:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 087F560351
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 08:18:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EF917986490
	for <virtio-comment@archiver.kernel.org>; Tue,  8 Aug 2023 08:18:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E59E8986461; Tue,  8 Aug 2023 08:18:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D44F0986460;
	Tue,  8 Aug 2023 08:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VpKMZFs_1691482714;
Date: Tue, 8 Aug 2023 16:18:34 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Message-ID: <20230808081834.GD11361@h68b04307.sqa.eu95>
References: <20230724033421.249893-6-parav@nvidia.com>
 <20230802152525.GA13690@h68b04307.sqa.eu95>
 <PH0PR12MB5481538EEC183EBE3FF16234DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230803130725.GA47086@h68b04307.sqa.eu95>
 <PH0PR12MB54811B738594B741F8F8D723DC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230804071728.GA7515@h68b04307.sqa.eu95>
 <PH0PR12MB54814571128E5D313192D4EFDC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <47dd90a2-3be6-5bab-a423-08d8d5a63be9@linux.alibaba.com>
 <20230807072242.GA11361@h68b04307.sqa.eu95>
 <PH0PR12MB54812105643D9771FF4C8EDEDC0DA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH0PR12MB54812105643D9771FF4C8EDEDC0DA@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [virtio-comment] Re: [virtio] RE: [virtio-comment] Re: [virtio] RE: [PATCH
 requirements 5/7] net-features: Add n-tuple receive flow filters
 requirements

On Tue, Aug 08, 2023 at 07:13:13AM +0000, Parav Pandit wrote:
> 
> 
> > From: Heng Qi <hengqi@linux.alibaba.com>
> > Sent: Monday, August 7, 2023 12:53 PM
> 
> > > >Once RSS context is done, at that point in future to enhance RFF.
> > Hi, Parav.
> > 
> > We need the RSS context, which can be combined with 'ethtool -X .. equal'
> > to achieve the purpose of traffic isolation, so please keep the RSS context. To
> > allay your concerns that an RSS context might be blocking the work of n-tuples,
> > I'll be issuing a spec this week (or next
> > week) for virtio support for the RSS context. For n-tuple RFF context, we can
> > support it after RFF, as a point to enhance RFF.
> >
> Ok. sounds good.
>  
> > > >[..]
> > 
> > > +9. The filter rule add/delete entries are usually short in size of few tens of
> > > +   bytes, for example IPv6 + TCP tuple would be 36 bytes, and ops/sec rate is
> > > +   high, hence supplying fields inside the queue descriptor is preferred for
> > > +   up to a certain fixed size, say 56 bytes.
> > 
> > '56B' does not seem to be enough. For example, src mac + dst mac + src-ip6 +
> > dst-ip6 + src-port + dst-port + user-define (packet byte offset pattern, length
> > and mask) + flow id + rule priority + destination + action =
> > 6 + 6 + 16 + 16 + 2 + 2 + 8 + 4 + 1 + 2 + 1 = 64 B, we also have structure alignment
> > and quintuple mask, etc.
> > 
> Yes, 64B also need to add group id to it.

Yes, there are also fields such as vlan, I just did a rough
calculation:)

> A practical finite limit would be fine, I took 56B example based on ipv4 case.
> I think 96B at higher upper limit looks reasonable without considering mask.

96B is enough without mask.

> As ARFS kind of use cases usually are exact match, hence mask is optional that doest need to be inline.

Yes, But RFF will carry the mask, so we need to consider the mask field when
considering the maximum fixed length.

> 
> > > [..]
> > > +5. The device should be able to expose if it support filter masks.
> > > [..]
> > > +7. Flow filter capabilities to query using a DMA interface:
> > > +
> > > +```
> > > +struct flow_filter_capabilities {
> > > +	u8 flow_groups;
> > > +	u16 num_flow_filter_vqs;
> > > +	u16 start_vq_index;
> > > +	u32 max_flow_filters_per_group;
> > > +	u32 max_flow_filters;
> > > +	u64 supported_packet_field_mask_bmap[4];
> > 
> > I think the function here is that after the user sends the mask, the driver should
> > do an 'AND' operation with the mask supported by the device first?
> > Meanwhile, is 32B enough:) :
> >   src-port + dst-port + src mac + dst mac + src-ip6 + dst-ip6 =
> >     2 + 2 + 6 + 6 + 16 + 16 = 48B
> > 
> Oh I didn’t document well.
> The field supported_packet_field_mask_bmap is bitmap of well defined fields, one bit for each field.
> Such as,
> Bit_0 = dst_mac
> Bit_1 = src_mac
> Bit_2 = eth_type
> Bit_3 = vlan_tag
> Bit_4 = dst_ip 
> And so on.

Ok, I got it. Then we don't need to reserve 256B for
supported_packet_field_mask_bmap. 64 bits represent 64 different fields,
and I think it seems enough, or 128 bits?

Considering the alignment of the structure, it should look like this:
	struct flow_filter_capabilities {
		u8 flow_groups;
		u8 padding1;
		u16 num_flow_filter_vqs;
		u16 start_vq_index;
		u16 padding2;
		u32 max_flow_filters_per_group;
		u32 max_flow_filters;
		u64 supported_packet_field_mask_bmap;
	};

> 
> So yes, the actual content like src-port does not need to mask, but yes, 
> when the filter rule arrives from ARFS or FC side, that metdata info coming in ethtool_rx_flow_spec to be masked.
> 

Yes.

> It would make more sense to have a dedicated command for the bitmap for two reasons.
> 1. It doesn't get sandwiched in the future when new fields are added after the bitmap.
> 2. When bitmap needs to extend, it is not fragmented at two or more places.

Agree! Allowing field extensions is good, especially the supported mask fields.

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

