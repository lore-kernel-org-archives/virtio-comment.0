Return-Path: <virtio-comment-return-8655-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5064CC07CB1
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 13:12:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AA204216A7
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 13:12:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 81C0C98640C
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 13:12:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6ABB398639C; Mon, 27 Nov 2023 13:12:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5CD009863A1
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 13:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 2z0RkQCPPk6luUVL27s8dw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701090736; x=1701695536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFLLuyeSFt6yk+dMdXbDHShUUB/y1sdTzCLkbjt1xRI=;
        b=PrZt+Lb8Yy5llJ4/kzc6wJ7ckygJGmmYDGB1+2t1qKppvl4Bq2xvb75oJUdYQT04fa
         iKJF2/GBfA6BTvHRS0BrocccJQX4jZBrpoHAtM55+k2S9NSruv+PSEHrTpkMSVnNz7Rk
         erl08sPS1R83VVbaGKcMnhk774E6uKzpV8/KxWqvbINMzMYNyiXqkUfbTmM+E0UpVAMM
         OXLdl7IE5E+wClPO2rxClIq8oWl+toZUJ/hJw1DkzVe1Qc9HiUkn9pfkTAREXeicDg4F
         QuL9zOW3bdHgvy2QR07s2FJzhLubXNLmODppZrzQOP1+tt3ZIspJom7ROxGuH91/9/97
         P4Vg==
X-Gm-Message-State: AOJu0YxBR84/60uFHID+6lGEbAFcWxtGjiSfTTtxwq+wIZabiMa1jDQ/
	qbuqf3gJ7b5QsW5Q53wQ2q8vN4nyTsZAt76OJVMpfmJgaUlOwVLRwIANBrVuQcAvLgmK+IHaIMN
	m0ms1c/5Yz5kz8YxHQKbIwkvIYT0/mJWZ0Q==
X-Received: by 2002:a17:906:fa90:b0:9b2:be5e:7545 with SMTP id lt16-20020a170906fa9000b009b2be5e7545mr8438933ejb.36.1701090736491;
        Mon, 27 Nov 2023 05:12:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI/wETnJEK1CFnMLpXKMgvIZEp/cVqkknAen+DPlU2m1f/HlsBMMDXkD1yWXAlPWJgWdQ1MA==
X-Received: by 2002:a17:906:fa90:b0:9b2:be5e:7545 with SMTP id lt16-20020a170906fa9000b009b2be5e7545mr8438907ejb.36.1701090736090;
        Mon, 27 Nov 2023 05:12:16 -0800 (PST)
Date: Mon, 27 Nov 2023 08:12:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231127080608-mutt-send-email-mst@kernel.org>
References: <20231124011125-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481437B4AA6C4CD4F1CED5BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124062907-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548179FEF8CEFA3D509FF471DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127062256-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E0368B0B04D4B43CECD2DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127064138-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481621EA37B28FA7450A113DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127073416-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C3EAAE002B10EEA20008DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481C3EAAE002B10EEA20008DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

On Mon, Nov 27, 2023 at 01:05:15PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, November 27, 2023 6:13 PM
> > 
> > On Mon, Nov 27, 2023 at 11:54:52AM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Monday, November 27, 2023 5:17 PM
> > > >
> > > > On Mon, Nov 27, 2023 at 11:40:25AM +0000, Parav Pandit wrote:
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Monday, November 27, 2023 4:58 PM
> > > > > >
> > > > > > On Mon, Nov 27, 2023 at 10:19:49AM +0000, Parav Pandit wrote:
> > > > > > >
> > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > Sent: Friday, November 24, 2023 5:04 PM
> > > > > > > >
> > > > > > > > On Fri, Nov 24, 2023 at 06:31:03AM +0000, Parav Pandit wrote:
> > > > > > > > >
> > > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > Sent: Friday, November 24, 2023 11:48 AM
> > > > > > > > > >
> > > > > > > > > > On Fri, Nov 24, 2023 at 05:40:26AM +0000, Parav Pandit wrote:
> > > > > > > > > > > > we
> > > > > > > > > > > > strongly suggest that *drivers* support both old and
> > > > > > > > > > > > new mechanism, and then *devices* will only
> > > > > > > > > > > > implement what's
> > > > > > required.
> > > > > > > > > > > There are other examples in the same document that
> > > > > > > > > > > makes things worst
> > > > > > > > > > with old and new.
> > > > > > > > > > >
> > > > > > > > > > > Also there is literally no way to enforce that driver
> > > > > > > > > > > supports both and new. It is just sounds like an
> > > > > > > > > > > excuse to force infinite config space.
> > > > > > > > > >
> > > > > > > > > > There is a very simple method though.  We allow devices
> > > > > > > > > > to expose a subset of features when DMA is not used. So
> > > > > > > > > > drivers that want maximum features will always opt for
> > > > > > > > > > DMA. We can also strongly recommend that all drivers support
> > DMA if available.
> > > > > > > > > Yeah, don't see how this is elegant at all with all mixed bits.
> > > > > > > >
> > > > > > > > It's elegant because simple low end devices can cheaply
> > > > > > > > implement MMIO and not worry about DMA.
> > > > > > > >
> > > > > > > It is not of much help in this case because any low end cheap
> > > > > > > device which
> > > > > > want to support flow filter commands need to have CVQ anyway.
> > > > > > > And hence reusing the same CVQ is more elegant that already
> > > > > > > does the
> > > > DMA.
> > > > > > >
> > > > > > > So CVQ is fulfilling all the below needs.
> > > > > > > 1. Single interface for the get/set config flow filters 2. DMA
> > > > > > > the data 3. Not have any partial issues
> > > > > >
> > > > > > I don't know what these are.
> > > > > I mean partial writes for fields.
> > > >
> > > > We don't allow these and in any case, writeble fields are best avoided.
> > > >
> > > Right. This is why flow filter objects are created using cvq, and its associated
> > caps also comes via same cvq channel.
> > >
> > > >
> > > > > >
> > > > > > > 4. provides consistent structures that provisioning side will
> > > > > > > be able to use
> > > > > >
> > > > > > Problem for provisioning is extra definitions will be needed, in
> > > > > > a device specific way.
> > > > > In vdpa tool and other OS tools of iproute2 developed, setting and
> > > > > getting
> > > > those device specific values are useful.
> > > > > It is ok.
> > > >
> > > > It does not become ok just by saying so. You are taking a single RO
> > > > value and instead of it having an address there are now 2 other ways
> > > > to address it. And you fail to see the problem and the pain you are
> > > > inflicting on software developers. Just stick with an address if you can.
> > > There is zero problem with sw.
> > > Sw just need to issue send_command() and done with it, like rest of the
> > commands.
> > > A pain would be create yet another DMA interface.
> > 
> > No because it will be a generic thing for all types.
> > 
> That does not make pain of one device go away.

This gateway will be needed sooner or later.

Or devices can also build a register map. All this is really just so you
can stop beating the "infinite registers!" drum.
I suspect after looking at it, in the end practically hardware designers
will go "oh it's 0.002$ per device let's just keep it simple".
But yea, let's add an option.


> > 
> > > >
> > > > > >
> > > > > > > > > Nor do I see any enforcement, single method via cvq still holds
> > strong.
> > > > > > > >
> > > > > > > > You don't need to enforce things, if people want to put a
> > > > > > > > lot of RAM on device and put it in a register let them.
> > > > > > > >
> > > > > > > Not enforced. It uses the CVQ for flow group and flow filter
> > > > > > > life cycles and for
> > > > > > the sharing this config as well.
> > > > > > > Also aligns with stats that rest also agreed on.
> > > > > >
> > > > > > I am talking about your attempt to generally say "no more config
> > > > > > fields everything must be in CVQ".
> > > > > Config fields for initialization time is fine as the spec allows it today.
> > > > > Things which can differ, it is ok to use cvq interface.
> > > >
> > > > I don't know what does "Things that can differ" means. Generally
> > > > device caps are perfect for config space. Accessed at init time only, RO.
> > > >
> > > You ignore the comment I answered before that proposal here is not based
> > on RO/RW.
> > > It is based on initialization time vs run time.
> > 
> > initialization time is really probe. That thing which only happens once when
> > driver is setup. Clearly there is no reason to check capabilities many times so it
> > will be done during setup, once.
> > 
> Capabilities will be queried once the valid id ranges are learnt by the driver during driver initialization time.
>

right. And being initialization time, it belongs in config space.
 
> > 
> > > > > > I think it's wrong definitiely for non network devices must
> > > > > > sometimes for network too and generally we need a solution for
> > > > > > config over DMA. This specific thing - whether it fits in CVQ is
> > > > > > a separate discussion.
> > > > > >
> > > > > I explained it before, that 6 out of 19 devices has cvq which are
> > > > > complex
> > > > enough doing things over cvq.
> > > > > These are non-network devices already.
> > > > >
> > > > > If one of those remaining device becomes complex, it is likely it
> > > > > will need a
> > > > cvq to suffice for the dma interface and it can just do with depth = 1.
> > > >
> > > > Using generic caps and not net specific ones is a good idea.
> > > >
> > > context here is cvq and net.
> > 
> > yes, you can use cvq command for this.  this will only serve net.  I am saying a
> > generic interface for config over DMA is better and will serve everyone.
> > 
> 6 out of 19 device do not need them.
> And when those remaining devices needs complexity, they will likely need more than just this.
> 
> > We are doing this commonly, and when we did not push for a generic interface
> > like with e.g. s/g limits for blk we later regret it.
> > 
> 
> > 
> > > >
> > > >
> > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > The method proposed here is elegant and clearly
> > > > > > > > > > > promote one way to do
> > > > > > > > > > things for driver and device with predictability.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > I don't see it as elegant at all. What is elegant is *a
> > > > > > > > > > single
> > > > > > > > > > tag* that describes each property of the device. And
> > > > > > > > > > this single tag should be
> > > > > > > > good for everything:
> > > > > > > > > > driver, provisioning, migration. And config space offset
> > > > > > > > > > serves as
> > > > such.
> > > > > > > > > The single tag is the set of structures.
> > > > > > > >
> > > > > > > > I have no idea how this will work. If migration format i
> > > > > > > > started reviewing is anything to go by then there will be a
> > > > > > > > huge elaborate structure nothing single or simple. By
> > > > > > > > comparison there's already a proposal how provisioning can
> > > > > > > > work by supplying
> > > > config space.
> > > > > > > > it is just a clean model to grasp.
> > > > > > > >
> > > > > > > The provisioning model is simple is to supply all the configuration.
> > > > > > > To draw parallels to some sw side,
> > > > > > >
> > > > > > > There is per functionality socket option to set things,
> > > > > > > instead of one giant
> > > > > > structure.
> > > > > > > There is per functionality ethtool option/cmd instead of Set
> > > > > > > ALL/get ALL
> > > > > > enforcement.
> > > > > >
> > > > > > I'm not sure how much of a parallel one can draw.
> > > > > > Do not see a lot of similarity.
> > > > > For lot of configuration they are similar that happens at slow pace.
> > > > >
> > > > > > Devices commonly use register map. Everyone understands this
> > paradigm.
> > > > > >
> > > > > For initialization early device setup time, yes.
> > > > >
> > > > > >
> > > > > > I am not altogether happy with the way you are making migration
> > > > > > generate duplicate definitions for lots of things we already
> > > > > > have definitions
> > > > for.
> > > > > > Having a 3rd one for provisioning? Gimme a break.
> > > > >
> > > > > For migration, we are not duplicating. Some structures are not
> > > > > well defined,
> > > > it has some duplication.
> > > >
> > > > And fyi it's already making people unhappy.
> > > >
> > > Those exceptions are not the interesting one to take as example here.
> > >
> > > > > But large part seems be able to utilized pre-defined structs.
> > > > > And here for flow filter also same structs will be used.
> > > >
> > > > So if there's a 64 bit bitmap in config space, then provisioning
> > > > command which already gets config space can just use its offset.
> > > > Simpler, better.
> > > >
> > > It is not simple to implement per device unique config space as we discussed
> > already.
> > 
> > we did it for many years and many device types.
> > 99% of devices do config over a register map of some kind.
> > It is not as *flexible* true but flexibility here is an enemy, too easy to make a
> > mess.
> > 
> > 
> Don't see it this mess, otherwise it should apply to rest of the cvq commands.

yes, they are kind of messy, at that.  we don't use cvq by choice. We
use it because for things that need to keep changing at runtime config
space turned out to be a bad choice. But this query, is not.


> > And your array of types where a single field would suffice is a classical case in
> > point. config space keeps us disciplined.
> > 
> > > And no need another DMA interface either as cvq service that need already.
> > 
> > This is too focused on net and short term, for my taste.
> > we need it so we
> > 1. don't need to have this discussion every time 2. can begin to save on
> > registers for config space in X years and
> >    for new device types
> > 
> > 
> > And, while apparently focusing on short term people also somehow manage
> > to make a point out of every bikeshed instead of the "let's just ship it"
> > attitude that would be consistent. I find this baffling.
> 
> Not really. using CVQ for the dma interface seems to fit all the needs without defining new interface across all device types.

Of course, because you just ignore all other needs declaring them out of
scope. Really not merging patches is the only tool we have to make
people work on generic infra, otherwise each vendor only wants to work
on device specific things.

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

