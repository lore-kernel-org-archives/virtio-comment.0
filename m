Return-Path: <virtio-comment-return-6115-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340B7C7EE23
	for <virtio-comment@archiver.kernel.org>; Sun,  4 Jun 2023 21:48:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 44E9933564
	for <virtio-comment@archiver.kernel.org>; Sun,  4 Jun 2023 21:48:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2DAB898633E
	for <virtio-comment@archiver.kernel.org>; Sun,  4 Jun 2023 21:48:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1C2D7986332; Sun,  4 Jun 2023 21:48:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 02F41986337
	for <virtio-comment@lists.oasis-open.org>; Sun,  4 Jun 2023 21:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: j4gAHtCGOOiG-MIhTqzi2A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685915326; x=1688507326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zM4MBuaOjPWY4i0uk31x0vSdHxxWw6+xoTnl8aTmA+w=;
        b=jhguN6jzzUR8wnb04y1GqcpDLoo2cRWwjXz/E06ao22feJ5SMutWDF8ULAyjq+5tmM
         TF2xLUh8kgCbqFNH3V0flwnp9VfBthDwZhhJUbhbTctr15NZDVCEMXF/8V+olmo+ImpI
         wM3RN9zrev7G+71N3JO2cu6vm2EvJhdlWlavsrSu6GhZn7/1dErAQJpP1NQ4YNrx88PL
         wZLvUQwnYiOfQzLAaGCzZI0GNEupoZh1eWhwSoZ53ICi+pCtu5m/HGe0T5kRjbZG3NyV
         tEAQjhVogy2Hb7ELLEYj4CpiSMIdI2kvdyu7cIHin1+gG+TqKDgwMMOugC2Ej6AO7sBA
         uw1g==
X-Gm-Message-State: AC+VfDyDkOJvzu79Rs81ygqIX4o2mxQ2DK8pb39nw200OaMbo8HgO7z3
	YiaiIR6iJ0sB2WwYx/4vGFYK+1UWyqR7pXfoIrWQ+UfFAf8IS6ATVq0RIRjqe6JpHiZ15ISGZ90
	GRIx8NN1nCuiFAVtwhAmqll3B6tX/LGZEqw==
X-Received: by 2002:adf:ec85:0:b0:30a:bf2b:e03c with SMTP id z5-20020adfec85000000b0030abf2be03cmr3267551wrn.23.1685915326751;
        Sun, 04 Jun 2023 14:48:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ERRn4M8Phyq0TxPVVbtgOxLl23o8VY4b3RbOjjfRZVAvo1bNaOMvV8KifvqIbx8TzSwq2cg==
X-Received: by 2002:adf:ec85:0:b0:30a:bf2b:e03c with SMTP id z5-20020adfec85000000b0030abf2be03cmr3267542wrn.23.1685915326434;
        Sun, 04 Jun 2023 14:48:46 -0700 (PDT)
Date: Sun, 4 Jun 2023 17:48:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230604174224-mutt-send-email-mst@kernel.org>
References: <20230602203604.627661-1-parav@nvidia.com>
 <20230604092441-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815C9677C9E1F3EDE032A9DC4CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230604094535-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481443CD383D9BFA0369151DC4CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230604101351-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548139ACEC00E7CA6D988182DC4CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230604105027-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B721C34D85D63FCC1F3DDC4CA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481B721C34D85D63FCC1F3DDC4CA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 0/3] transport-pci: Introduce legacy registers access
 using AQ

On Sun, Jun 04, 2023 at 03:07:27PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Sunday, June 4, 2023 10:54 AM
> 
> > > Each VF has its own available buffer notification in hardware like 1.x.
> > > We do not want to duplicate (and add) such functionality on the PF BAR
> > hardware when it already exists on the VF.
> > 
> > yes but here we are talking about legacy notifications, not 1.x
> >
> Legacy can utilize the 1.x hw plumbing without building new hypothetical PF hardware.

Maybe.
Whether 1.x BAR can be reused for legacy would depend on a bunch
of factors. E.g. with 1.x using VIRTIO_F_NOTIF_CONFIG_DATA - probably not.

> > > > We are talking about an interface that will be used tens of years
> > > > from now. If the interface is awkward to use on some platforms let's
> > > > make it easier not hide behind excuses of no demand to fix it as of last
> > Friday.
> > > It is not hiding.
> > > The fact that virtio drivers are not inbox. I don't see an actual user by the OS
> > vendor for the decade passed.
> > 
> > But why does it matter? There are a bunch of users of virtio, I know that.
> > 
> > > And, I do not anticipate use of legacy for tens of years from now.
> > >
> > > It is not even a conclusion that it is awkward to use.
> > > You are concluding that one OS may never want to evolve their kernel APIs.
> > 
> > They might. That takes many years too.
> >
> By that time legacy may not be even a use case for them.
> If an OS vendor evolves slowly compare to other two OS, such OS may have to change their process, not the virtio-spec.

Let's just say, we are not in the position where we dictate these things
to OS vendors yet.  One of motivations of the spec is making writing
drivers easier so let's add an option for that pls.

> > > So, when a 2nd OS vendor cannot use IPR scheme that they have, and they
> > MUST have everything through ONLY VF, to support them, a HW vendor will
> > build PCI device with VF legacy access registers stay in the VF.
> > > And spec update will be done.
> > >
> > > We really don't see this happening. So better to build a practical spec.
> > >
> > > And if this was important, I am still puzzled why you say "Just AQ is fine" in v2
> > and why you wait for next 2 weeks for v3 to show up to raise the concern now
> > contradicting your ACK.
> > 
> > Because this is just AQ. All I am asking is that the BAR refers to PF, same AQ
> > command.
> 
> VF has BAR for driver notifications. This BAR is used for 1.x and legacy.

But it's the same piece of silicon - be it in PF or in VF.
I really don't see why it matters.

> There is no need to ask vendors to build new HW to put driver notifications on the PF BAR for VFs, when it already exists on the VF.
I'm talking about giving vendors an option not asking them.

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

