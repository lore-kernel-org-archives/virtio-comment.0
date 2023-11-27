Return-Path: <virtio-comment-return-8641-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B350C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:47:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A6BE4EEA0F
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:47:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E43A9863B5
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:47:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 64CA698638E; Mon, 27 Nov 2023 11:47:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 548D6986394
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 11:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: AvUR_4AANwytX2PDceJqhA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701085649; x=1701690449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihNdUI6nDeao0EfKyg8yfuSAn7XKctRQvxfbVUTHtjc=;
        b=dyC0GU2hp2ROcRrainFEYDKOAHM7XV0W+ZHFlM8GhTk2IVY0hEryuu89hBTb8t7GfC
         Trzpm845jCgPII7o0b3RgO9z2gZvSCwaEPvGQg91Xmat3fhDTCGiJ9On2xRT6Yg+iGMJ
         0W2JZ3m6KPAPh7clN028ixxyo5h/o2HrCC28DQo7wEveTeVfU4YSrvQToz2Pa7eQ+CNH
         3jf+6reHE3RhuVu8zPF182+T020A9MD9VFrVP2oIoWMgqXSWss9vKDQllTzN+MLv68v4
         tXrrmHJW6jAbHrBzg912ESNqG/kOv06X1IXahHMVKNAPvXQkcLWqeJW31dM5itULXlrj
         eHBQ==
X-Gm-Message-State: AOJu0YzWwZhGzzxFuNhE3cmSf2vZ9cUrT91SHnHq4VsNLJ8wK5jmwxnu
	/W0WapNylstV+lD0TnOshdPirXQAiToYl9gJ7E123ifGECxEOsve2Tr3uWn90eeL/364TjEr3Zx
	Yaf2Kmslm0hfWNH6vz3dSV7qIuivhDptgSg==
X-Received: by 2002:a05:6402:1a4b:b0:548:5671:b819 with SMTP id bf11-20020a0564021a4b00b005485671b819mr8221407edb.30.1701085649072;
        Mon, 27 Nov 2023 03:47:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUKDtv4FMaEhU+k/kgzfrrDRNXYB+DMzmDkuinqFaTN+61C5Mu4hXfKDf4zYaNxj9ob0n8lA==
X-Received: by 2002:a05:6402:1a4b:b0:548:5671:b819 with SMTP id bf11-20020a0564021a4b00b005485671b819mr8221384edb.30.1701085648714;
        Mon, 27 Nov 2023 03:47:28 -0800 (PST)
Date: Mon, 27 Nov 2023 06:47:23 -0500
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
Message-ID: <20231127064138-mutt-send-email-mst@kernel.org>
References: <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <PH0PR12MB5481592754EE68E6F6A79EEEDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124002357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54812482A68AC708A4E0764BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124011125-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481437B4AA6C4CD4F1CED5BDCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124062907-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548179FEF8CEFA3D509FF471DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127062256-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E0368B0B04D4B43CECD2DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E0368B0B04D4B43CECD2DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

On Mon, Nov 27, 2023 at 11:40:25AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, November 27, 2023 4:58 PM
> > 
> > On Mon, Nov 27, 2023 at 10:19:49AM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Friday, November 24, 2023 5:04 PM
> > > >
> > > > On Fri, Nov 24, 2023 at 06:31:03AM +0000, Parav Pandit wrote:
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Friday, November 24, 2023 11:48 AM
> > > > > >
> > > > > > On Fri, Nov 24, 2023 at 05:40:26AM +0000, Parav Pandit wrote:
> > > > > > > > we
> > > > > > > > strongly suggest that *drivers* support both old and new
> > > > > > > > mechanism, and then *devices* will only implement what's
> > required.
> > > > > > > There are other examples in the same document that makes
> > > > > > > things worst
> > > > > > with old and new.
> > > > > > >
> > > > > > > Also there is literally no way to enforce that driver supports
> > > > > > > both and new. It is just sounds like an excuse to force
> > > > > > > infinite config space.
> > > > > >
> > > > > > There is a very simple method though.  We allow devices to
> > > > > > expose a subset of features when DMA is not used. So drivers
> > > > > > that want maximum features will always opt for DMA. We can also
> > > > > > strongly recommend that all drivers support DMA if available.
> > > > > Yeah, don't see how this is elegant at all with all mixed bits.
> > > >
> > > > It's elegant because simple low end devices can cheaply implement
> > > > MMIO and not worry about DMA.
> > > >
> > > It is not of much help in this case because any low end cheap device which
> > want to support flow filter commands need to have CVQ anyway.
> > > And hence reusing the same CVQ is more elegant that already does the DMA.
> > >
> > > So CVQ is fulfilling all the below needs.
> > > 1. Single interface for the get/set config flow filters 2. DMA the
> > > data 3. Not have any partial issues
> > 
> > I don't know what these are.
> I mean partial writes for fields.

We don't allow these and in any case, writeble fields are best avoided.


> > 
> > > 4. provides consistent structures that provisioning side will be able
> > > to use
> > 
> > Problem for provisioning is extra definitions will be needed, in a device specific
> > way.
> In vdpa tool and other OS tools of iproute2 developed, setting and getting those device specific values are useful.
> It is ok.

It does not become ok just by saying so. You are taking a single RO
value and instead of it having an address there are now 2 other ways
to address it. And you fail to see the problem and the pain you are
inflicting on software developers. Just stick with an address if you
can.

> > 
> > > > > Nor do I see any enforcement, single method via cvq still holds strong.
> > > >
> > > > You don't need to enforce things, if people want to put a lot of RAM
> > > > on device and put it in a register let them.
> > > >
> > > Not enforced. It uses the CVQ for flow group and flow filter life cycles and for
> > the sharing this config as well.
> > > Also aligns with stats that rest also agreed on.
> > 
> > I am talking about your attempt to generally say "no more config fields
> > everything must be in CVQ". 
> Config fields for initialization time is fine as the spec allows it today.
> Things which can differ, it is ok to use cvq interface.

I don't know what does "Things that can differ" means. Generally
device caps are perfect for config space. Accessed at init time only,
RO.

> > I think it's wrong definitiely for non network
> > devices must sometimes for network too and generally we need a solution for
> > config over DMA. This specific thing - whether it fits in CVQ is a separate
> > discussion.
> > 
> I explained it before, that 6 out of 19 devices has cvq which are complex enough doing things over cvq.
> These are non-network devices already.
> 
> If one of those remaining device becomes complex, it is likely it will need a cvq to suffice for the dma interface and it can just do with depth = 1.

Using generic caps and not net specific ones is a good idea.



> > 
> > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > > The method proposed here is elegant and clearly promote one
> > > > > > > way to do
> > > > > > things for driver and device with predictability.
> > > > > > >
> > > > > >
> > > > > > I don't see it as elegant at all. What is elegant is *a single
> > > > > > tag* that describes each property of the device. And this single
> > > > > > tag should be
> > > > good for everything:
> > > > > > driver, provisioning, migration. And config space offset serves as such.
> > > > > The single tag is the set of structures.
> > > >
> > > > I have no idea how this will work. If migration format i started
> > > > reviewing is anything to go by then there will be a huge elaborate
> > > > structure nothing single or simple. By comparison there's already a
> > > > proposal how provisioning can work by supplying config space.
> > > > it is just a clean model to grasp.
> > > >
> > > The provisioning model is simple is to supply all the configuration.
> > > To draw parallels to some sw side,
> > >
> > > There is per functionality socket option to set things, instead of one giant
> > structure.
> > > There is per functionality ethtool option/cmd instead of Set ALL/get ALL
> > enforcement.
> > 
> > I'm not sure how much of a parallel one can draw.
> > Do not see a lot of similarity.
> For lot of configuration they are similar that happens at slow pace.
> 
> > Devices commonly use register map. Everyone understands this paradigm.
> > 
> For initialization early device setup time, yes.
> 
> > 
> > I am not altogether happy with the way you are making migration generate
> > duplicate definitions for lots of things we already have definitions for.
> > Having a 3rd one for provisioning? Gimme a break.
> 
> For migration, we are not duplicating. Some structures are not well defined, it has some duplication.

And fyi it's already making people unhappy.

> But large part seems be able to utilized pre-defined structs.
> And here for flow filter also same structs will be used.

So if there's a 64 bit bitmap in config space, then provisioning
command which already gets config space can just use its offset.
Simpler, better.


> > 
> > 
> > > > > Provisioning access them via owner device.
> > > > > Member driver access them via CVQ or 1.2 legacy config space.
> > > >


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

