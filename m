Return-Path: <virtio-comment-return-8638-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB4CC4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:37:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A080F44550
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:37:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5CAF2986397
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:37:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2F4E598638E; Mon, 27 Nov 2023 11:37:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 20FB6986394
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 11:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: SEDOPM3VNz-675az6a9S0A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701085071; x=1701689871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKFRjqDutHU1BeGfUr0+o0RO1pqEKn0HVH1wCfIpcuw=;
        b=fdZ4IQxCNsvhewAp2Vo/vBq9db3E+t+IhkgMUWaTYAdxL6NsbtMyrt89mj3cH08RqI
         groHiD/u8Eb23rryTs3eIutY9CD54rSpLItdT6qXDT+RiU7suLXpTwuGbgs7LQMJerLX
         D9pCTFs0JYXJ0J2laFLDzX1IwVOlskfZ3stQIs7KX2Gz9ZK0AeICUnlxMpDufJlM+gdT
         QPQSwR3f7siV8X1TZVJl+Ky6W2b2BtLuaPzG9shrBUt6onHkBvMoohnCEKRaW6JKU8ZD
         5AG9DjyFFuYJIYmHwO0NtVn5PPO8GyWFgJ3kBdL5D0eO3CSBXIYtZBhea1jHpzNyGhFA
         /RIQ==
X-Gm-Message-State: AOJu0YwD7/1P+835hX8uFZ6vT3knjiK3C7wJXdjuG2e3AsOrnL7v0q72
	dphn7j6RZHnnWc5U6rU3lEsseDx6kg9RjghLPnyIUtAxp6cgYKIJ+abg9KhpARpILjt91dCWItb
	mRZdRw+nOJ4mvEe6BnNoW1MMhhgRvIeRZXw==
X-Received: by 2002:a05:6402:b9c:b0:54b:2894:d198 with SMTP id cf28-20020a0564020b9c00b0054b2894d198mr4383132edb.4.1701085071712;
        Mon, 27 Nov 2023 03:37:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTArDdVdYJjdycg0S0ceZAxwhWQZF9R8qVyEskz8iOQgCBM3Zd1Ni9BEB4QsN1MSc1XwTR4w==
X-Received: by 2002:a05:6402:b9c:b0:54b:2894:d198 with SMTP id cf28-20020a0564020b9c00b0054b2894d198mr4383118edb.4.1701085071345;
        Mon, 27 Nov 2023 03:37:51 -0800 (PST)
Date: Mon, 27 Nov 2023 06:37:47 -0500
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
Message-ID: <20231127062840-mutt-send-email-mst@kernel.org>
References: <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <20231124003129-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E538B7BBFB907CC6BBE1DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124005921-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54817AC1DD6C5386A138D5BADCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124051534-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481826794DE29ECFF0B5713DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481826794DE29ECFF0B5713DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

On Mon, Nov 27, 2023 at 10:19:51AM +0000, Parav Pandit wrote:
> > runtime configuration, absolutely. We found out writeable config space field
> > are painful for a variety of ways, the main one being device can't report errors.
> > So we generally avoid writeable config space.  But read only - no good reason
> > to avoid them for init time things.
> > 
> The good reason as explained in the doc is to not place them based on the policy of read_only vs read-write, 
> Instead based on the access pattern whether it is needed in early driver initialization time or can it be read at later point over.
> 
> And the based on the access pattern has given more flexibility to implementations across sw and hw based devices without any lose.

Right. Whatever is done in driver probe.
And why? Basically because this makes initialization robust,
simple, and no parallelizm is used during probe anyway, so
a queue makes no sense - it gives 0 advantage.


And if you are going to require that driver allow or disallow ethtool
commands based on this info then it is clearly initialization time
in my book.


> >From the device side it has consistent view of get/set via single channel = cvq when dealing with the guest driver.
> 
> The two non nvidia examples of these devices are Microsoft MANA nic and Amazon ENA nic.
> 
> > 
> > 
> > 
> > > >
> > > > Then hardware offload guys come and say that in PCI spec current
> > > > transport is forcing use of on-device memory, and they want to build
> > > > cheap offload PCI based devices. Fine, let's build a transport variant that
> > does not force this.
> > >
> > > All new capabilities and control is over the cvq. What is baked until 1.2 is sort
> > of legacy.
> > 
> > Just repeating this will not make everyone agree.
> > 
> 
> I see that Satananda also is fine for Marvell to use CVQ.
> 
> > > >  And
> > > > we want optional compatibility, so let's also find a way to do that.
> > > > This makes much more sense than forcing transport specific issues on
> > everyone.
> > > >
> > > Trying to attribute as some transport specific issue is just not aligned to the
> > spec written today.
> > >
> > > > To add to that, what did not historicall scale well is transport-specific
> > registers.
> > > Then you should have put the VQ notification coalescing functionality in a
> > horrible virtio_net_config register like how a queue reset in the common config
> > space.
> > 
> > No because of the 4 commands: VIRTIO_NET_CTRL_NOTF_COAL_TX_SET
> > VIRTIO_NET_CTRL_NOTF_COAL_RX_SET
> > VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET
> > VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET none are initialization time.
> > They are not capabilities: they control and inspec device runtime state.
> > 
> > If we had VIRTIO_NET_CTRL_NOTF_COAL_CAP_GET that would belong in
> > config space.
> > 
> I understood you.
> As we propose above, those caps reading is not must during initialization time phase.

Yes, it is a must initialization time.
In my book initialization time is what happens in probe.

> Hence, cvq delivers better scale like stats and consistent get/set.
> 
> > > Thank God that mistake was not done and many similar mistakes were
> > avoided.
> > 
> > Let's not get emotional here please.
> > 
> > > > That was a bad design, with all transports doing exactly the same
> > > > thing is slightly different ways.  And what you are advocating for
> > > > with CVQ is exactly replicating the bad design not the good one.
> > >
> > > CVQ design is what extends the current spec in good way. Followed by many
> > other non nvidia nics listed in the doc for reference.
> > 
> > I don't know what you are referring to here.  Register maps are all over the
> > place. It's a simple, standard, well understood practice.
> > 
> I provided various examples of virtio and non nvidia devices which prefers to avoid registers.
> Satananda from Marvell also expressed their view.
> 
> > We have some niche uses due to need for extreme VF# counts, this forces
> > DMA for them, not a good reason to force it for everyone.
> PFs are equally benefiting from them. Some of our hw devices has large PF count.
> 
> > The sooner you just stop forcing this down everyone's throat the faster we can
> > make progress on things that matter.
> 
> CVQ is established good configuration channel. So we all want to utilize instead of being forced to grow config space which is very hard to maintain and implement.

Specifically this thing or generally?
This thing - I think I don't understand what this capability is, at this point,
so I am asking you to clarify much more.
If it's a huge array it can't fit in config space by definition
but I don't understand why it needs to be.


Generally - forget it. device config space is one of the few things that
virtio driver writers for different OS-es actually get consistently
right. It is simple, easy to use and understand. Limitations - slow,
serialized and small so only probe time and only little amounts of data.
Stop trying to kill it as a general capability and replace with a hodge
podge of commands I'm not going to support that.


> I will fix your comments in v7 regarding the honoring max limits in driver and device.


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

