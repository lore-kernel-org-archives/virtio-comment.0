Return-Path: <virtio-comment-return-8541-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7066CC61D92
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:31:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A8B442A838
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:31:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E6549868A6
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 07:31:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 60C90986894; Wed, 22 Nov 2023 07:31:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 509A5986895
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 07:31:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: j6ZZ8GHnPVeRCSGVoP6Zzg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700638259; x=1701243059;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSZsPaxDn2HkuBo09XKrRoeri6cdOoY95FczDTLhCME=;
        b=FHJlmzQVW+0B7mY7Nc51FRo2Wep82xR4BZDIZja1Ad6dyKlmQqdZ4YVrW4LQfGjq3K
         481xsoC9BgS1+HYeDYmsobvBhnL+tSzpe74LJKvwTmKHSB5BUzOzGst9+R/DJWCjJY7S
         v1SqFTR01L8aQ+RQ/aF8rJvow0UpImSDVFzwdu1/hdwsJHftIv6s9T0CKcxZlskAKGGn
         RwCC7MNxdG3A0/88OxfGoXZ3PiPhYa8zuEefYh6ROlT7ijeXpU4ud0CVr8lVc750D4wh
         32+ZhgwV0BoUlQ4IrT055ksk9X+jAwDRpECqZiJ4tQIqKwZQxryYmWxLB3RXr1+i3Ykl
         vfyg==
X-Gm-Message-State: AOJu0YwyDjT8FpuR8sbwzCRUSh8JnWBzqiAWJOPgdPDtjrBda5He6uwJ
	V0hGArECAebIq60HgB781T6ZxYu/sJx2cP/p0TvfKN8p09Qjfwa4Ub0RS+F/I2NfNA9Ji2lc3P3
	WZ65r5mryydyCkdwut0HI23fVV6wkyNGOBA==
X-Received: by 2002:aa7:cd14:0:b0:548:ce19:4c8f with SMTP id b20-20020aa7cd14000000b00548ce194c8fmr1114013edw.42.1700638259626;
        Tue, 21 Nov 2023 23:30:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWOftgkIZ7pzeCrKxq/n37uT4Ux/OTY+15ybOsayuFNX5tC+XYs0OqXGxqM8u3wpN1BYk0nA==
X-Received: by 2002:aa7:cd14:0:b0:548:ce19:4c8f with SMTP id b20-20020aa7cd14000000b00548ce194c8fmr1114001edw.42.1700638259281;
        Tue, 21 Nov 2023 23:30:59 -0800 (PST)
Date: Wed, 22 Nov 2023 02:30:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231122021551-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <8e92a16e-2a5d-4c9c-bb85-5a5c6fecbe05@intel.com>
 <PH0PR12MB5481C31027CE6716503F3F24DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <a28b2c22-a03f-473d-b672-d54e0390b76a@intel.com>
 <PH0PR12MB5481ED082C94A9603DC6BDC8DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6949173c-29cf-4c49-af82-562c050e40ae@intel.com>
 <20231116070024-mutt-send-email-mst@kernel.org>
 <cd3e331c-8fc0-4f96-b049-dee3c09829c9@intel.com>
 <20231117060053-mutt-send-email-mst@kernel.org>
 <4d1500cf-4802-4a66-840c-1b7518c08522@intel.com>
MIME-Version: 1.0
In-Reply-To: <4d1500cf-4802-4a66-840c-1b7518c08522@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND

On Wed, Nov 22, 2023 at 09:41:10AM +0800, Zhu, Lingshan wrote:
> > > I mean enable 100 queues cost more time then enable 1 vq no matter
> > > how we enable it. that is O(N)
> > Depends on what "that" is. Number of VM exits does not have to be O(N),
> > you can pass these 100 queues in memory.
> For batching, yest. But I don't see this as a problem because we enable
> vqs by this way for many years, so far so good.

Well boot time is less contrained than migration time
because it often involves a ton of IO to load guest software.



> > 
> > 
> > > 
> > > 
> > >                          This should be a basic facility.
> > > 
> > >                      Other transport can also offer like PCI.
> > > 
> > >                  Do you want to work for these transport? Implementing the new features as
> > >                  PCI?
> > > 
> > >              Not presently as PCI as more features than rest of the two.
> > >              What I read about ccw is: " S/390 based virtual machines support neither PCI nor MMIO".
> > > 
> > >              And I also read, "The IBM System/390 is a discontinued mainframe product family implementing".
> > > 
> > >              So I don’t know who needs to extend ccw.
> > >              And if one needs, those maintainers will extend it to match to PCI standard.
> > > 
> > >          So these features are even not planned, so don't depend on them.
> > > 
> > >      But again can one suspend ccw device? If you are adding this feature and
> > >      claiming it's supported for all transports you better find out
> > >      what does it do.
> > > 
> > > I am not an expert on CCW, anything block we suspend a CCW device by this bit?
> > I don't think CCW supports suspend at all.
> I think it is not a transport feature but a device feature,
> the device can always suspend it self, like don't process data
> and stop responding until a specific signal.

If guest keeps going but device just stop then guest has
a decent chance to crash.

> > 
> > > This seems only controlled by the device itself.
> > > 
> > And? What it the point of suspending only the device if rest of system
> > is still going?
> That is an orchestration issue, totally up to the administrators.
> Normally when suspending the device, the guest are very likely
> to be suspended already.

If you need an orchestration system to suspend your laptop or your
phone things are very bad indeed.

> > 
> > > 
> > >                              In that case if there is suspend the device available, it will be
> > >                              used by the
> > > 
> > >                          guest driver itself, hypervisor wouldn’t know about it when those
> > >                          registers are not trapped.
> > > 
> > >                              So we need two ways to suspend.
> > >                              One is guest visible, and guest controlled.
> > >                              Second is hypervisor control to fulfill the device migration needs.
> > > 
> > >                          The guest can eve reset the device.
> > > 
> > >                              So if you can please take a look if the proposed admin command to
> > > 
> > >                          freeze/stop mode can be used in the emulated register case or not.
> > > 
> > >                              It helps to have the suspend bit in guest control as well
> > >                              with/without
> > > 
> > >                          emulation mode.
> > >                          Parav, please believe I have read your series, I didn't comment there
> > >                          because I want to avoid further conflicts/debating, we have done these
> > > 
> > >                  enough.
> > > 
> > >                      I believe the series posted in v3 can support vdpa use case as well.
> > >                      So I will progress to post v4.
> > > 
> > > 
> > >                          As explained before, freeze/stop the device by PCI is a layer violation.
> > > 
> > >                      I am afraid, we have different vision.
> > >                      I don’t see any layer violation.
> > >                      Suspend is enough in the PCI PM.
> > >                      Our vision is more aligned with rest of the hypervisor knobs that owns the
> > > 
> > >                  migration framework.
> > >                  I think I have explained, virito builds on other transport and it should be self-
> > >                  contained, so far so good.
> > > 
> > >              Virtio without any transport binding is just blank paper discussion.
> > > 
> > >          virtio is built on some transports, but not bind to any.
> > > 
> > >      Binding is an OS specific thing, but e.g. under Linux transport drivers bind to
> > >      devices then virtio drivers bind to virtio bus. No binding -> nothing
> > >      works.
> > > 
> > > I think general facilities are better not only work on a specific transport
> > > 
> > But platform facilities are even better we don't need to work on them at
> > all.
> Yes, so I also agree to track dirty pages by the platform, on-CPU dirty page
> tracking facilities serving all transport, not only PCI.

If available. Both you and Parav should stop just repeating your
preference and start showing some actual info on which systems
support this platform tracking, how recent they have to be,
are all of server/desktop/mobile covered, etc.

> > 
> > 
> > >                          And device status can be pass-through(without emulation, just map it
> > >                          to
> > >                          guest) to the guest or trapped(trap and emulate by the hypervisor,
> > >                          for example set_status in vDPA).
> > > 
> > >                      When it is pass-through, it is controlled by the guest, so for example, if the
> > > 
> > >                  guest resets the device, hypervisor has lost the control of migration context etc.
> > > 
> > >                      Hence, hypervisor needs a channel which is not guest owned.
> > > 
> > >                      Same channel can work when trap+emulation is done.
> > > 
> > >                  It is the guest owns the device, it can reset the device, once reset, the device
> > >                  context are cleared.
> > > 
> > >              Hypervisor do not have the ability to read/write the device context. It lost the channel as hypervisor is not involved in trap+emulation.
> > >              So it is not helpful in one use case.
> > > 
> > >              Admin commands can work even with trap+emulation mode.
> > > 
> > >              What is missing, that should be added?
> > > 
> > >          as explained above, when live migration, the guest should be suspended
> > >          first, at this point,
> > >          the host owns the device, it has access to the device.
> > > 
> > >      Where do you say this in the spec patch?
> > > 
> > > VM live migration is not in this spec.
> > Then it should be.
> > 
> > > If we suspend the device first, then the guest may detect IO errors.
> > > 
> > That's bad. So you need to tell driver what not to do so as not to get
> > errors.
> I think the process should be suspending the guest first, then the host
> owns the device, so it can suspend the guest and collect the necessary data
> for live migration.

So you need to say what is and what is not allowed.
Because in your model, device has no idea whether it's
host or guest accessing it and so you can not just say
"don't access device at all". And this by the way is
a big plus in Parav's approach - since host uses a
distinct channel for state retrieval it is possible
to simply say "don't access device" and we are done.

> > 
> > > 
> > >                                  This can also be used for debugging I think.
> > > 
> > >                              As Michael listed, a dedicated debug interface is usually more
> > >                              useful instead
> > > 
> > >                          of in-band.
> > >                          re-using another facility without extra efforts is not a bad thing anyway.
> > > 
> > >                      I just don’t see how a suspend bit some debug feature.
> > >                      Almost everything with that regard is a debug feature to me.
> > > 
> > >                  suspend then check the device states?
> > > 
> > >              You already suspended the device, so device state is already changed.
> > >              All debug information is changed, so not useful now.
> > > 
> > >          When suspended, the device should keep and stabilize its device states,
> > >          at least in my series it should behave like this.
> > > 
> > >      That's vague. What does it mean exactly and what happens if
> > >      some external event causes state change?
> > > 
> > > it is suspended, somehow like powered-down, so it should not
> > > respond to the events until resume.
> > "somehow" is too vague for the spec.
> Yeah, in spec, we have a section to describe what the device should do when
> SUSPEND.
> > 

maybe I missed it. generally I think the whole SUSPEND feature
should be in one patch, no real reason to split it up.
queue state thing is a different matter.

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

