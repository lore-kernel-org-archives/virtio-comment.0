Return-Path: <virtio-comment-return-8657-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91693C07CB1
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 13:15:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0B1386846D
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 13:15:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F2C009863BE
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 13:14:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E83C298639C; Mon, 27 Nov 2023 13:14:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DB2EF9863A1
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 13:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ROaz2thIN4Kxjm7IXO-vWA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701090896; x=1701695696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucLx9TMIAKRE9xGOwyG0JHIcs24usxbv0cB+EtnOjGo=;
        b=WP1qgHMKTuy9iFvY5Ajeah3gbs7WXWzRtHl8EkvGsyBcvxlzMT2AJSj+uc72/7WsFC
         yIBrw8XiCuc6+2ScbS6KlbBYrEI4060l8APSyJPd2tlDNxWnBXkOqdUWDeP6G9B+bR1s
         XCCkID1L+xl5WYjLs7RpXsYMr5mBRH4vzf7EwZUapuX5SCBVMHQ0WAP1/s7pNkUtCmgY
         cMVTWNqg+fOOOEsm8NaVmJRXQvMw7OVdKxdvHc9c/OzfsW2lDomwv+7TCoPiTbCXjb1x
         ATHDPR9FGSZUSCtMDXBUexm29zqlj/0gNKFECFIC9y8i96TYdd8zg73I7LDsy3G8RsOQ
         ZCNQ==
X-Gm-Message-State: AOJu0Ywv2Net72W1H2cUps5IXW9ixRyaZyLidKL5FJ626fBgwPkO0gjs
	THoZy1D532y5AoNLss0Yv9Jo9aa4fZ/M9VR8NG4Qkwwt/aOcHY1aqLA4C2iJdLN6XYvjuc/qmEM
	b4DmVXczJl7+dmSjryDLutukZfMn/n7KcFg==
X-Received: by 2002:a05:600c:4f42:b0:40a:28b1:70f8 with SMTP id m2-20020a05600c4f4200b0040a28b170f8mr9142020wmq.21.1701090896442;
        Mon, 27 Nov 2023 05:14:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmsUwHcO6bn5rlQiUUmQisi80sQZEitoO3+Ql0cog+NhV1oTSPhXHohrIKrzwZEFTfBVVz3w==
X-Received: by 2002:a05:600c:4f42:b0:40a:28b1:70f8 with SMTP id m2-20020a05600c4f4200b0040a28b170f8mr9141989wmq.21.1701090896000;
        Mon, 27 Nov 2023 05:14:56 -0800 (PST)
Date: Mon, 27 Nov 2023 08:14:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231127081255-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124011125-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481437B4AA6C4CD4F1CED5BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124062907-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548179FEF8CEFA3D509FF471DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127062256-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E0368B0B04D4B43CECD2DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127064138-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481621EA37B28FA7450A113DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87leajxs4s.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87leajxs4s.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

On Mon, Nov 27, 2023 at 02:06:27PM +0100, Cornelia Huck wrote:
> >> > > > 4. provides consistent structures that provisioning side will be
> >> > > > able to use
> >> > >
> >> > > Problem for provisioning is extra definitions will be needed, in a
> >> > > device specific way.
> >> > In vdpa tool and other OS tools of iproute2 developed, setting and getting
> >> those device specific values are useful.
> >> > It is ok.
> >> 
> >> It does not become ok just by saying so. You are taking a single RO value and
> >> instead of it having an address there are now 2 other ways to address it. And
> >> you fail to see the problem and the pain you are inflicting on software
> >> developers. Just stick with an address if you can.
> > There is zero problem with sw.
> > Sw just need to issue send_command() and done with it, like rest of the commands.
> > A pain would be create yet another DMA interface.
> >
> >> 
> >> > >
> >> > > > > > Nor do I see any enforcement, single method via cvq still holds strong.
> >> > > > >
> >> > > > > You don't need to enforce things, if people want to put a lot of
> >> > > > > RAM on device and put it in a register let them.
> >> > > > >
> >> > > > Not enforced. It uses the CVQ for flow group and flow filter life
> >> > > > cycles and for
> >> > > the sharing this config as well.
> >> > > > Also aligns with stats that rest also agreed on.
> >> > >
> >> > > I am talking about your attempt to generally say "no more config
> >> > > fields everything must be in CVQ".
> >> > Config fields for initialization time is fine as the spec allows it today.
> >> > Things which can differ, it is ok to use cvq interface.
> >> 
> >> I don't know what does "Things that can differ" means. Generally device caps
> >> are perfect for config space. Accessed at init time only, RO.
> >> 
> > You ignore the comment I answered before that proposal here is not based on RO/RW.
> > It is based on initialization time vs run time.
> >
> >> > > I think it's wrong definitiely for non network devices must
> >> > > sometimes for network too and generally we need a solution for
> >> > > config over DMA. This specific thing - whether it fits in CVQ is a
> >> > > separate discussion.
> >> > >
> >> > I explained it before, that 6 out of 19 devices has cvq which are complex
> >> enough doing things over cvq.
> >> > These are non-network devices already.
> >> >
> >> > If one of those remaining device becomes complex, it is likely it will need a
> >> cvq to suffice for the dma interface and it can just do with depth = 1.
> >> 
> >> Using generic caps and not net specific ones is a good idea.
> >> 
> > context here is cvq and net.
> >
> >> 
> >> 
> >> > >
> >> > > > > >
> >> > > > > > >
> >> > > > > > >
> >> > > > > > >
> >> > > > > > > > The method proposed here is elegant and clearly promote
> >> > > > > > > > one way to do
> >> > > > > > > things for driver and device with predictability.
> >> > > > > > > >
> >> > > > > > >
> >> > > > > > > I don't see it as elegant at all. What is elegant is *a
> >> > > > > > > single
> >> > > > > > > tag* that describes each property of the device. And this
> >> > > > > > > single tag should be
> >> > > > > good for everything:
> >> > > > > > > driver, provisioning, migration. And config space offset serves as
> >> such.
> >> > > > > > The single tag is the set of structures.
> >> > > > >
> >> > > > > I have no idea how this will work. If migration format i started
> >> > > > > reviewing is anything to go by then there will be a huge
> >> > > > > elaborate structure nothing single or simple. By comparison
> >> > > > > there's already a proposal how provisioning can work by supplying
> >> config space.
> >> > > > > it is just a clean model to grasp.
> >> > > > >
> >> > > > The provisioning model is simple is to supply all the configuration.
> >> > > > To draw parallels to some sw side,
> >> > > >
> >> > > > There is per functionality socket option to set things, instead of
> >> > > > one giant
> >> > > structure.
> >> > > > There is per functionality ethtool option/cmd instead of Set
> >> > > > ALL/get ALL
> >> > > enforcement.
> >> > >
> >> > > I'm not sure how much of a parallel one can draw.
> >> > > Do not see a lot of similarity.
> >> > For lot of configuration they are similar that happens at slow pace.
> >> >
> >> > > Devices commonly use register map. Everyone understands this paradigm.
> >> > >
> >> > For initialization early device setup time, yes.
> >> >
> >> > >
> >> > > I am not altogether happy with the way you are making migration
> >> > > generate duplicate definitions for lots of things we already have definitions
> >> for.
> >> > > Having a 3rd one for provisioning? Gimme a break.
> >> >
> >> > For migration, we are not duplicating. Some structures are not well defined,
> >> it has some duplication.
> >> 
> >> And fyi it's already making people unhappy.
> >> 
> > Those exceptions are not the interesting one to take as example here.
> >
> >> > But large part seems be able to utilized pre-defined structs.
> >> > And here for flow filter also same structs will be used.
> >> 
> >> So if there's a 64 bit bitmap in config space, then provisioning command which
> >> already gets config space can just use its offset.
> >> Simpler, better.
> >> 
> > It is not simple to implement per device unique config space as we discussed already.
> > And no need another DMA interface either as cvq service that need already.
> 
> A general injection from me.
> 
> We're seeing more and more of those monster threads on the list, where
> everything is going in circles, sometimes spawning new versions, which
> create their own monster threads... I really dread looking at
> virtio-comment nowadays. This is drowning out other things on the list,
> which have a tendency to just get lost in the noise.
> 
> We should stop and think, figure out why that happens, and how we can
> get back to a productive environment.
> 
> >From what I've seen in this discussion here (and it seems to mirror
> other discussions I've browsed), it seems to boil down to narrow
> viewpoints and problematic ways of discussing the design.
> 
> Is PCI important? Of course. Is virtio-net important? Nobody disputes
> that. Are hardware implementations something we want to support well?
> Sure. But that does not mean other use cases are not important as
> well. Having a particular use case in mind is completely fine, treating
> other use cases as second-class citizens is not.
> 
> What has also stuck out to me in many of those discussions is something
> I'll call "argument by assertion", i.e. statements that something is
> this-and-that, without qualifiers like "I think that..." or "we've seen
> in other instances that...". From what I've seen, this tends to make
> people on the other side of the argument defensive instead of
> considering the arguments -- it certainly does not seem to foster a
> productive discussion, or at least that's my impression. I've also seen
> a tendency to reduce arguments to absolutes, which tends to bring out
> defensiveness as well.
> 
> Last but not least, I don't think rapid posting is helping -- it rather
> just seems to speed up ping-pong posting with each side becoming
> entrenched in their point of view even more. It's certainly not
> pleasurable to try to follow these threads. Can we try to calm down a
> bit, please?


Thanks for bringing this up Cornelia, I agree and think I've been
guilty of being too assertive and posting too fast recently, too.
I'll try to address that.

Thanks,
-- 
MST


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

