Return-Path: <virtio-comment-return-8612-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1C1C61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 10:27:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 60BE42CADD
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 10:27:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 39EF79868B3
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 10:27:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1F5359862D9; Fri, 24 Nov 2023 10:27:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 102309868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 10:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: P9e7Zo8rMhiKlDot2HLaDQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821662; x=1701426462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs7B+7Xo8Oa3cJiVOZqogEOGu6SJWdL5LUOGlxguz8w=;
        b=dz9sgR1fjiRJnSgfxMeSwe8Ui9OVHkv7xKc6ZObmclCOBlEEx9JcPCBojbi4PkTCQp
         S1Sysj5XanJB2MeLCi+a7jEBRK7TckQg+ti4VD5vQncF6SwoqNWUj+IuGqBK3xnaUMKz
         v+bJOmTbJ6pg5KPBtYRZ/qzz0iiZfgJdlrMrA3R8jFxwzSjABJWKIkRH+4Ahv13Aczay
         bpr/L9dBwjwFeOv06pYuKbiLMwQEOJruyHb1AkV3S+zaCdRyLOlQO4xyD0D0CBSUtxEH
         s67ViyjHShhkpI7l4wS/L4UF4o919dcHtSeb7366hKDfcipk55LU9cuMJ1+jGJjH2mIH
         /qGg==
X-Gm-Message-State: AOJu0YxQScRDt/KSbBKAkXDNVBUhJstqikQM39FYWlERWFERB1OUtjKp
	7ORyHv5JfIvyNN/lCTw4g/hG87u96YoRogdLun1Qq/ZwbsqMscEZ5AkLbk7oBjH78xs7HbxsKZq
	OGovDHP24MgP8bRtaAqMbE8vVmizM4INLVw==
X-Received: by 2002:a50:99d4:0:b0:53f:a526:779 with SMTP id n20-20020a5099d4000000b0053fa5260779mr1664288edb.12.1700821662323;
        Fri, 24 Nov 2023 02:27:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnGg/G77w29WOvkcUXUfle9esnmL5BWl6F5XkrVMwo6/3wJUG4Ad754YmspCJWo5YhRqcbqA==
X-Received: by 2002:a50:99d4:0:b0:53f:a526:779 with SMTP id n20-20020a5099d4000000b0053fa5260779mr1664267edb.12.1700821661957;
        Fri, 24 Nov 2023 02:27:41 -0800 (PST)
Date: Fri, 24 Nov 2023 05:27:37 -0500
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
Message-ID: <20231124051534-mutt-send-email-mst@kernel.org>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <20231124003129-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E538B7BBFB907CC6BBE1DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124005921-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54817AC1DD6C5386A138D5BADCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54817AC1DD6C5386A138D5BADCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

On Fri, Nov 24, 2023 at 06:27:46AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 24, 2023 11:37 AM
> > 
> > On Fri, Nov 24, 2023 at 05:53:02AM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Friday, November 24, 2023 11:03 AM
> > > >
> > > > On Fri, Nov 24, 2023 at 12:02:23PM +0800, Jason Wang wrote:
> > > > > > > I won't be able to absorb this comment of DMA interface.
> > > > > > > If I discuss further, I will repeat the whole document [1] and
> > > > > > > I will avoid
> > > > that now.
> > > > > > >
> > > > > > > [1]
> > > > > > > https://docs.google.com/document/d/1Iyn-
> > > > l3Nm0yls3pZaul4lZiVj8x1s73
> > > > > > > Ed6rOsmn6LfXc/edit#heading=h.qexbtyc2jpwr
> > > > > >
> > > > > >
> > > > > > I really worry about how provisioning will work. And I do not at
> > > > > > all cherish replicating all of these query capability commands for
> > provisioning.
> > > > >
> > > > > +1
> > > > >
> > > > > There's nothing that prevents the config space from being
> > > > > implemented in a way other than registers.
> > > >
> > > > Care doing it finally? Let's see if what Parav is worrying about is
> > > > then addressed.
> > >
> > > The whole concept that everything must be in one giant config space is just
> > simply bad.
> > > It does not exist either in virtio spec today.
> > 
> > But it does, this is what transports are doing.
> I don't understand what is "it".

"it" here is passing device init time configuration to drivers.


> Transport like pci transport bits.

in a simple, logical and functional manner.

> CVQ is functional object that helps to arrange the bits in logical, functional manner instead of trying to place them in bit array.

In a device specific way.

> > 
> > > once can see that what is presented in the commands cannot be placed in
> > config space at dynamic location.
> > > Same was the case with statistics too.
> > > Same was the case with VQ coaleasing knobs.
> > > Same with hash knobs.
> > > With flow filters,
> > > With rss contexts
> > > With rtc
> > > With new queues creation apis.
> > >
> > > The endless list continues...
> > >
> > > And reserving bits for future (for other than pad bytes) for future addition in
> > config space is equally not elegant design.
> > > Bits will get spread out at random location making things even harder to
> > maintain.
> > >
> > > The device is no longer a simple mac_addr + N queues device with some
> > static rss config anymore.
> > >
> > > With all modern work, every capability query and run time configuration is
> > done over cvq interface today.
> > > Single get/set channel from driver to device all using existing resources.
> > >
> > > The real hw device also does not need to refer to two places of config and
> > cvq when serving cvq commands.
> > > Oh, the list of advantages just continues with what 1.3 spec has done.
> > 
> > I don't see the problem sorry. We've been doing this for many years with many
> > ways to access config space.  It scaled well.
> > 
> I don't see it. sorry.
> The configuration of the device is done using cvq.

runtime configuration, absolutely. We found out writeable config space
field are painful for a variety of ways, the main one being device can't
report errors.  So we generally avoid writeable config space.  But read
only - no good reason to avoid them for init time things.




> > 
> > Then hardware offload guys come and say that in PCI spec current transport is
> > forcing use of on-device memory, and they want to build cheap offload PCI
> > based devices. Fine, let's build a transport variant that does not force this.
> 
> All new capabilities and control is over the cvq. What is baked until 1.2 is sort of legacy.

Just repeating this will not make everyone agree.

> >  And
> > we want optional compatibility, so let's also find a way to do that.  This makes
> > much more sense than forcing transport specific issues on everyone.
> > 
> Trying to attribute as some transport specific issue is just not aligned to the spec written today.
> 
> > To add to that, what did not historicall scale well is transport-specific registers.
> Then you should have put the VQ notification coalescing functionality in a horrible virtio_net_config register like how a queue reset in the common config space.

No because of the 4 commands: VIRTIO_NET_CTRL_NOTF_COAL_TX_SET
VIRTIO_NET_CTRL_NOTF_COAL_RX_SET VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET
VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET none are initialization time.
They are not capabilities: they control and inspec device
runtime state.

If we had VIRTIO_NET_CTRL_NOTF_COAL_CAP_GET that would belong in
config space.

> Thank God that mistake was not done and many similar mistakes were avoided.

Let's not get emotional here please.

> > That was a bad design, with all transports doing exactly the same thing is
> > slightly different ways.  And what you are advocating for with CVQ is exactly
> > replicating the bad design not the good one.
> 
> CVQ design is what extends the current spec in good way. Followed by many other non nvidia nics listed in the doc for reference.

I don't know what you are referring to here.  Register maps are all over
the place. It's a simple, standard, well understood practice.

We have some niche uses due to need for extreme VF# counts, this
forces DMA for them, not a good reason to force it for everyone.
The sooner you just stop forcing this down everyone's throat
the faster we can make progress on things that matter.


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

