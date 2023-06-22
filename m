Return-Path: <virtio-comment-return-6482-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35AFEB64D8
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 18:11:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 07E1285090
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 18:11:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F40AA986649
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 18:11:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E95759865E9; Thu, 22 Jun 2023 18:11:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D89389865EB
	for <virtio-comment@lists.oasis-open.org>; Thu, 22 Jun 2023 18:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: fgpbsNhoO368sbPab1WbOQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687457502; x=1690049502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6gTNriAWV/UJ+KA7HOoElB8oUuEhtgwTIlQs3zCWhs=;
        b=AGu5XWmKIyi7OSWltQGQvLMiHBuRkNt6KCZ6lA0VDO1AhfDIobmTx9GMAjjayRhZAG
         jMjtfJvb2MeaO+E30QPADWIP4OZ2vM5urotbW+fuZLqBKKMUllOgMu7soJaw8PtBK2Fk
         fG8LftY4l7TK84kBzGavDJ4QNl8kdANO1bdb520b9JCZnwvk/gfYKYxzUvcumblDxetf
         mBOx8hCNuiPlJO2ypQVLwZlI8LKH1LPLrpn8Nv8ZNJykgZ/Xg92rnDIV3GZEGptuOf0Z
         zowPECzxyCxZiexz75Ks+jJJ17p6s6jQUYjuam+OC+PBqjcrP2m9CZwTFyNKs4kJR6fn
         aFng==
X-Gm-Message-State: AC+VfDx+NxcKT3PzTH3XSwit8kI+pYm/phHBFtQV40rZDQEzMqrAun4k
	NhIMSWTCcRrTD0fXx8hGrXKZ740sP1sUY1zHcHGWqTnFX4iLH7lUu2wRwifRlRmHxkeN6/2EjhF
	AMPxjWFgYZwTolA28SdcpztuNKDZPtlRfyA==
X-Received: by 2002:a05:6402:1287:b0:51b:ef40:ba37 with SMTP id w7-20020a056402128700b0051bef40ba37mr299536edv.28.1687457502030;
        Thu, 22 Jun 2023 11:11:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5I17NNbV1Lnr/KhF9BbHLqd1mtQZIrPuZwifyVCFWBrxDE1Vc2V2no6DvbtZz4owWZ5nl+sg==
X-Received: by 2002:a05:6402:1287:b0:51b:ef40:ba37 with SMTP id w7-20020a056402128700b0051bef40ba37mr299523edv.28.1687457501737;
        Thu, 22 Jun 2023 11:11:41 -0700 (PDT)
Date: Thu, 22 Jun 2023 14:11:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>
Message-ID: <20230622140412-mutt-send-email-mst@kernel.org>
References: <20230621161157-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C99B8504F02D39B3A6F0DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621163116-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C4EA5D0614E1289DFC77DC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230622021932-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815D6D07A49CE775620088DC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230622130359-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481367BAA5DE0BAA33DBAA8DC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230622132837-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B65F624B16200B91B0AADC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481B65F624B16200B91B0AADC22A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment] Re: [PATCH v18] virtio-net:
 support inner header hash

On Thu, Jun 22, 2023 at 05:51:41PM +0000, Parav Pandit wrote:
> 
> > From: virtio-dev@lists.oasis-open.org <virtio-dev@lists.oasis-open.org> On
> > Behalf Of Michael S. Tsirkin
> > Sent: Thursday, June 22, 2023 1:38 PM
> > 
> > On Thu, Jun 22, 2023 at 05:15:50PM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Thursday, June 22, 2023 1:11 PM
> > >
> > > > > Provisioning driver usually do not attach to the member device directly.
> > > > > This requires device reset, followed by reaching _DRIVER stage,
> > > > > querying
> > > > features etc and config area.
> > > > > And unbinding it and second reset by member driver. Ugh.
> > > > > Provisioning driver also needs to get the state or capabilities
> > > > > even when
> > > > member driver is already attached.
> > > > > So config space is not much a gain either.
> > > >
> > > > Actually it's RO so you *can* read it without any issues:
> > >
> > > It is RO but not same across all devices.
> > 
> > If you provision VFs differently. I got it.
> > 
> > > > - block guest access to status
> > > > - check DRIVER.
> > > > If set:
> > > > 	- read features, config
> > > > If not set:
> > > > 	- read features, config
> > > > 	- reset
> > > >
> > > This is what I explained.
> > > It is more messy if you equate to GET command has mess.
> > 
> > At least it works.
> >
> And new GET command also works when CVQ is trapped.

Not just trapped. You need to issue these commands.
That will require
- driving cvq at guest boot, sending commands, then reset
- poking at guest memory to change CVQ contents on
  the fly to mask commands.

How bad or hard is that? I'll need to ponder this a bit.


> And also works when AQ is querying capabilities of a member device using WIP cmd.

yes that's the way forward in 1.4.

> > > > I am not saying it is elegant but then all of vdpa pile of hacks is not elegant.
> > > >
> > > I don't want to comment for vdpa. But it is not part of the spec...
> > 
> > Neither is QEMU.  It's one of spec implementations. Yes, we care about not
> > adding blockers for features that, superficially, might make sense for them.
> > 
> > > > And I am all for building something better but we didn't build it yet.
> > >
> > > The proposal for 1.4 is literally very simple as below.
> > > 1. All existing fields of cfg space stays in cfg space 2. Any new
> > > capabilities to be queried, query using a vq (aq, cfgvq, whatevervq).
> > > 3. Optionally existing fields can be queries over vq of #2 Once this
> > > arrive, no need for new GET commands.
> > > Till that time, don't keep infinitely grow the cfg space.
> > > Any next addition to cfg space, should work on defining the cfgvq.
> > 
> > Simple, but short sighted. I know you guys don't support your hardware for 10-
> > 20 years but for software people do.
> > And so "All existing fields of cfg space stays in cfg space" is a bad idea simply
> > because this does not allow removing things from config space not in 10 not in
> > 20 years not ever.
> >
> #1 is for backward compat for existing drivers.
>  You missed about #3. Existing cfg space fields can be queries using the cfgvq too.

Then #1 does not matter. We can give devices choice.

> > 
> > Instead we need to allow two ways to access config space.  Teach drivers about
> > both, actually mandate supporting both.  And then devices will make their own
> > cost/benefit decision about which features they want to support in MMIO.
> 
> If both method is mandated, I don't see benefit at all of two methods.

Mandated for driver.
Benefit is for devices, they will have the choice which drivers to
support. In 10-20 years all drivers support cfg command and then
people can start shipping devices without MMIO access to any
registers.

> VQ is generic part of the spec for slow and fast operation, so it is not at all a cost for config reading.

This will depend. E.g. if there's a single command to get all of config
in one go, then it actually can be a speedup, reducing the # of VM
exits.

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

