Return-Path: <virtio-comment-return-7030-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2B9C001B0
	for <virtio-comment@archiver.kernel.org>; Mon,  7 Aug 2023 07:22:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 51A4C1FF80
	for <virtio-comment@archiver.kernel.org>; Mon,  7 Aug 2023 07:22:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 399C198644B
	for <virtio-comment@archiver.kernel.org>; Mon,  7 Aug 2023 07:22:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 271B4984033; Mon,  7 Aug 2023 07:22:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 13E2F98612D;
	Mon,  7 Aug 2023 07:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VpANfC-_1691392962;
Date: Mon, 7 Aug 2023 15:22:42 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Message-ID: <20230807072242.GA11361@h68b04307.sqa.eu95>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <20230802152525.GA13690@h68b04307.sqa.eu95>
 <PH0PR12MB5481538EEC183EBE3FF16234DC08A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230803130725.GA47086@h68b04307.sqa.eu95>
 <PH0PR12MB54811B738594B741F8F8D723DC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230804071728.GA7515@h68b04307.sqa.eu95>
 <PH0PR12MB54814571128E5D313192D4EFDC09A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <47dd90a2-3be6-5bab-a423-08d8d5a63be9@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47dd90a2-3be6-5bab-a423-08d8d5a63be9@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [virtio-comment] Re: [virtio] RE: [PATCH requirements 5/7]
 net-features: Add n-tuple receive flow filters requirements

On Fri, Aug 04, 2023 at 03:51:16PM +0800, Heng Qi wrote:
> 
> 
> 在 2023/8/4 下午3:30, Parav Pandit 写道:
> >>From: Heng Qi <hengqi@linux.alibaba.com>
> >>Sent: Friday, August 4, 2023 12:47 PM
> >>Yes, but a small update:
> >>If flowvq is created, RFF must be done only on flowvq by the driver.
> >>If flowvq is supported, but not created, cvq can be used.
> >>If flowvq is not supported, cvq is used.
> >>
> >Looks fine, I want to think little more on the last point to make sure we are not missing something.
> >Will respond by Monday on it.
> 
> Ok.
> 
> >[..]
> >
> >>Oh, I got it, I think we should let people see more details in the next version.:)
> >>
> >>>For any new/undefined protocol, if user wants to say, In a packet at
> >>>byte offset A, if you find pattern == 0x800, drop the packet.
> >>>In a packet at byte offset B, if you find pattern == 0x8100, forward to rq 10.
> >>>
> >>>I didn't consider multiple matching patterns for now, though it is very useful.
> >>>I am inclined to keep the option of _any_match to take up later, for now to do
> >>only well defined match?
> >>>WDYT?
> >>I think it's ok, but we don't seem to need the length here. But in any case, I
> >>don't think it's that important to have or not ^^
> >>
> >Length will be needed to indicate how many bytes to match to.
> >Lets do this rule incrementally after we get the base line done for known RFC defined fields.
> >
> >>>Lets keep rss context in future work as its orthogonal to it.
> >>>Yes, your help for rss context will be good.
> >>>Lets first finish RFF as its bit in the advance stage.
> >>Yes! But I worry that a spec that references a concept that doesn't exist in the
> >>existing spec may be blocked, so if you have no objections, I will push this work
> >>forward in the near future to help RFF possible blocking.
> >I was probably not clear enough, I propose that lets remove the RSS context for now in the RFF.
> >Once RSS context is done, at that point in future to enhance RFF.
Hi, Parav.

We need the RSS context, which can be combined with 'ethtool -X .. equal'
to achieve the purpose of traffic isolation, so please keep the
RSS context. To allay your concerns that an RSS context might be
blocking the work of n-tuples, I'll be issuing a spec this week (or next
week) for virtio support for the RSS context. For n-tuple RFF context,
we can support it after RFF, as a point to enhance RFF.

> >[..]

> +9. The filter rule add/delete entries are usually short in size of few tens of
> +   bytes, for example IPv6 + TCP tuple would be 36 bytes, and ops/sec rate is
> +   high, hence supplying fields inside the queue descriptor is preferred for
> +   up to a certain fixed size, say 56 bytes.

'56B' does not seem to be enough. For example,
src mac + dst mac + src-ip6 + dst-ip6 + src-port + dst-port + user-define
(packet byte offset pattern, length and mask) + flow id + rule priority + destination + action =
6 + 6 + 16 + 16 + 2 + 2 + 8 + 4 + 1 + 2 + 1 = 64 B,
we also have structure alignment and quintuple mask, etc.

> [..]
> +5. The device should be able to expose if it support filter masks.
> [..]
> +7. Flow filter capabilities to query using a DMA interface:
> +
> +```
> +struct flow_filter_capabilities {
> +	u8 flow_groups;
> +	u16 num_flow_filter_vqs;
> +	u16 start_vq_index;
> +	u32 max_flow_filters_per_group;
> +	u32 max_flow_filters;
> +	u64 supported_packet_field_mask_bmap[4];

I think the function here is that after the user sends the mask, the
driver should do an 'AND' operation with the mask supported by the device first?
Meanwhile, is 32B enough:) :
  src-port + dst-port + src mac + dst mac + src-ip6 + dst-ip6 =
    2 + 2 + 6 + 6 + 16 + 16 = 48B

Thanks!

> +};
> +
> +```



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

