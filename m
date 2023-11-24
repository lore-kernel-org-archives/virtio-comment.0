Return-Path: <virtio-comment-return-8609-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767B4C61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 09:05:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BEAB92A89B
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 09:05:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8FB8A9868B1
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 09:05:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7640B9862D9; Fri, 24 Nov 2023 09:05:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 74A099868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 09:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: vHwobNDXPkmpLDVcnC8pSQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700816703; x=1701421503;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lk0dMbzF4AbjiSkgDnYs5PDTKeWF763SKqpoukpBeh8=;
        b=e5YJjpGlUqy5UmdA/kxrpbHWC8KC61Da+7Yiyu3MLUmM1DvKI2mGgw4whgL6Ojipk4
         M6lU+U2aL2mYwF2ELCrlpPw+eMUcfGXGcJ6P3fR+KXCxx75FS/ZhSKkVyaBJwcidLG0D
         Imait/J3nz8+47DMv/0YE7YSB8HsHyEsNP8qlyRwFEYicPGijd+zxYUBXGHWrq5evOSd
         A0Wx70Opd37HI6r2WxTwrlvMH35xcSlFKmzW+3c40tYVaHdijvL5CjhaAdl0Hp60XEn1
         DGX3HktX7HRu0TvzN1X8BIRuwJjIzHrad6fRhMO7jStWTXTSUcu7SYROjRYYLKi7RmGr
         ZVSQ==
X-Gm-Message-State: AOJu0YzTNY/Q3LpsI2BLuUr60fZ/qXBxCrGfJ0qC99kDAnpdDSQ15jPV
	pmwSedKAbj7R1Har25JzMxjNMua2CGli3o1yO69KEFM1PwcYWaDOGilIwZKNBjvHnh50bQdhYzG
	tdAQ/Gv+VvytffZcbnnNjanVO2b511jwm4w==
X-Received: by 2002:a50:fa8f:0:b0:54b:5a7:1435 with SMTP id w15-20020a50fa8f000000b0054b05a71435mr232306edr.4.1700816703667;
        Fri, 24 Nov 2023 01:05:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9vhynmllymWtRqvQMv5W6KmaRH5iExVjxa1GsUJnR7cI3/3q++o5iAty7+fS2GKvgD83nVw==
X-Received: by 2002:a50:fa8f:0:b0:54b:5a7:1435 with SMTP id w15-20020a50fa8f000000b0054b05a71435mr232280edr.4.1700816703276;
        Fri, 24 Nov 2023 01:05:03 -0800 (PST)
Date: Fri, 24 Nov 2023 04:04:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231124035211-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <PH0PR12MB54816D26CE3B22CA84CAAE2ADCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvqB0Q3N6UBuVXad7GLGRWB_YS1rbdNZy8h85jkXGePtg@mail.gmail.com>
 <PH0PR12MB5481EEAEDFECA480BB3D69DCDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3vSyVo6O4TvahiQYqZymnK7m+SWY9nzaQHFBEAbUpMA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEu3vSyVo6O4TvahiQYqZymnK7m+SWY9nzaQHFBEAbUpMA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND

On Fri, Nov 24, 2023 at 11:35:59AM +0800, Jason Wang wrote:
> > > > > > I don’t see a need for hypervisor to reset the device in passthrough
> > > mode.
> > > > > Can you explain why is it needed?
> > > > >
> > > > > Qemu has a command "system_reset".
> > > > >
> > > > I mean, what does this translate to reset the device in passthrough mode?
> > >
> > > It needs to reset the virtio device.
> > >
> > > > If this is FLR, it is there.
> > >
> > > Please explain how it works. (It's not only a FLR, it also need virtio level reset)
> > >
> > FLR obviously covers the virtio level reset as FLR covers the PCI + virtio reset.
> 
> Which part of the spec says this? And at least Qemu is not implemented
> in this way.

PCI spec says this. And yes I believe qemu will fully reset the function
on FLR.


> And there's another conflict, you said FLR is under the control of guests ...
> 
> >
> > > >
> > > > > > Do you mean, it is needed in vdpa mode? If yes, the registers are
> > > > > > emulated
> > > > > anyway, so why the member device's native channel cannot be used in
> > > > > vdpa mode?
> > > > > >
> > > > > > > >
> > > > > > > > > > For large device I could imagine it could be short.
> > > > > > > > > >
> > > > > > > > > > In that case if there is suspend the device available, it
> > > > > > > > > > will be used by the guest
> > > > > > > > > driver itself, hypervisor wouldn’t know about it when those
> > > > > > > > > registers are not trapped.
> > > > > > > > > > So we need two ways to suspend.
> > > > > > > > > > One is guest visible, and guest controlled.
> > > > > > > > > > Second is hypervisor control to fulfill the device migration needs.
> > > > > > > > >
> > > > > > > > > Can you explain why suspend is special but not reset or why
> > > > > > > > > reset can work but not suspend? If reset can work, so does
> > > > > > > > > suspend. If reset can't, neither does suspend.
> > > > > > > > >
> > > > > > > > As long as reset and suspend both are under guest control, I am fine.
> > > > > > >
> > > > > > > Well, you seem to ignore my question below. Hypervisor needs to
> > > > > > > reset the device as well.
> > > > > > >
> > > > > > Why is it needed in passthrough mode?
> > > > > >
> > > > > > > >
> > > > > > > > > For example, can you explain how a system_reset in Qemu can
> > > > > > > > > work with your proposal?
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > So if you can please take a look if the proposed admin
> > > > > > > > > > command to
> > > > > > > > > freeze/stop mode can be used in the emulated register case or not.
> > > > > > > > >
> > > > > > > > > Again, if you design those for PCI, it's a layer violation.
> > > > > > > > > You have answered
> > > > > > > > They are used by the PCI layer, just like your suspend bit.
> > > > > > > > Andy other transport can also use it.
> > > > > > > >
> > > > > > > > > yourself that PM is the right way to go.
> > > > > > > > >
> > > > > > > > > > It helps to have the suspend bit in guest control as well
> > > > > > > > > > with/without
> > > > > > > > > emulation mode.
> > > > > > > > >
> > > > > > > > > I won't repeat it again. You will find you need a full
> > > > > > > > > transport to satisfy all the requirements.
> > > > > > > > I disagree for full transport.
> > > > > > >
> > > > > > > See above and the discussion in another thread.
> > > > > > >
> > > > > > > > If you want to get discuss transport for sure it is some other
> > > > > > > > thread and I want to see "driver notifications via such
> > > > > > > > transport VQ" to fully qualify it
> > > > > > > as transport, And that would be just sub-optimal for actual working.
> > > > > > >
> > > > > > > Sub-optimal since the function is duplicated with a transport
> > > > > > > but it doesn't claim or design as a transport.
> > > > > > >
> > > > > > It is not sub-optimal because of duplication. It is because you
> > > > > > want to
> > > > > transport notifications via virtqueue.
> > > > >
> > > > > Have you ever read the series of tvq? You won't get this conclusion
> > > > > if you do that.
> > > > >
> > > > I have read those 4 patches and I have seen that transportvq do not want to
> > > transport notifications.
> > > > Hence it does not qualify as transport vq.
> > >
> > > It exposes the platform MMIO area for driver notification. This is sufficient.
> > > Any issue you see?
> > Yes, the issue is, it is not transporting the driver notifications.
> > Hence, it is not a transport virtqueue.
> 
> Please read how driver/device notification is done in the spec for
> existing transports.

Yea Parav I don't really see what you are driving at here.
But the bigger problem with tvq is that it was supposed to
add a new group type and be reworked on top of admin command
infrastructure and it never was.

> >
> > >
> > > >
> > > > Frankly, transport vq seems a way to formalize mediation forever in virtio.
> > >
> > > Nope, it can be accessed by a guest driver directly.
> > >
> > > > It is very weird way to build new SIOV device.
> > > > For most things it should be the direct channel that virtio has already from
> > > driver to the device.
> > >
> > > See above. SIOV might require a new transport or not.
> > >
> > It depends on the performance tests that Lingshan will show at scale.
> >
> > > >
> > > >
> > > > > >
> > > > > > > > And hence, I wouldn’t call it a transport anymore.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > This can also be used for debugging I think.
> > > > > > > > > >
> > > > > > > > > > As Michael listed, a dedicated debug interface is usually
> > > > > > > > > > more useful instead
> > > > > > > > > of in-band.
> > > > > > > > >
> > > > > > > > > Well, I've shown you the in-band facilities like debugging
> > > > > > > > > via ethtool and kernel has a lot of other ones. If you have
> > > > > > > > > ever tried to debug in a real production environment, you
> > > > > > > > > will find how useful such handy information is where out-of-
> > > > > > > > > band facilities are often dangerous
> > > > > > > and usually prohibited or even unsupported.
> > > > > > > > Guest driver can always read and write the device status
> > > > > > > > without adding a
> > > > > > > suspend bit.
> > > > > > >
> > > > > > > I don't get here. Suspend make sure the device state is frozen
> > > > > > > which helps for debugging for sure.
> > > > > > You wanted to debug some vq live, you suspend the device, the vq
> > > > > > state got
> > > > > changed.
> > > > > >
> > > > > > I just don’t see that suspend is a debug tool.
> > > > >
> > > > > It's not a tool, it's a function that can be used as a debug tool.
> > > > >
> > > > > > Every feature is a debug feature literally.
> > > > > > Classic heisenbug effect.
> > > > > >
> > > > > > Once can change driver notification frequency to see if interrupt
> > > > > > rate
> > > > > changed for debugging.
> > > > > > One can disabled few RQs and see RSS...
> > > > > > Blk can change blk_size to higher value to perf debug..
> > > > > > The list continues..
> > > > >
> > > > > Let's not shift concepts.
> > > > >
> > > > Your comment to attribute device migration as debug feature is actually
> > > shifting the concept.
> > >
> > > It's not.
> > >
> > > Ling Shan put it in the basic facilities as part of device status. You wonder why,
> > > we explained it can be used beyond migration. You asked where, we told you
> > > for example things like debugging. We never claim it can only be used in debug.
> > > Then you shift the concept to say debug could be achieved by a lot of other
> > > facilities. For sure this is correct, but it doesn't have any relationship with the
> > > discussion here.

I frankly don't see how a bit which is completely non-orthogonal with
device and driver state can be useful for debug.
For debug you want something that just always works.
Not an interface that has so many requirements it will break if
you look at it sidewise.


> > >
> > I don’t see wasting time here.
> > If its debug, its debug.
> > If its migration, it is migration.
> > If its pm, its pm.
> 
> Obviously not. Migration should leverage existing facilities as much
> as possible instead of duplicating them.

I don't think there's anything obvious here.  A lot of device state
can't be easily accessed with existing facilities. The logical
continuation of your reasoning would be to add state introspection
commands e.g. to cvq in virtio net and then use tricks like shadow vq to
issue these.  Yea, possible, but can we not go there please?  Nothing is
wrong with just building commands that do exactly what we want them to
do instead of trying to build a ship in a bottle.

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

