Return-Path: <virtio-comment-return-7653-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16AECD8C9C
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 14:55:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F3D56F3F46
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 14:55:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E13B29865BA
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 14:55:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CD955986589; Tue, 10 Oct 2023 14:55:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BD6DE98658A
	for <virtio-comment@lists.oasis-open.org>; Tue, 10 Oct 2023 14:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: NshVhdGGNJGSXxcX21_41w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696949718; x=1697554518;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13/dBLq/+U8Cqweic5DLXmXJ1yAZjvV8+3V/2H+yoyg=;
        b=JwuvBzPuRK9ajkujkzz/oL1cCUVXzX2DaB2OgNjxpZvc3Pm3qOBqVrQYdqE1PM8eJP
         /jDzGn+HVXNkfpqB9Gaja+vujhWydfQ1JWWaY3qbUyH+VXwBTY3lWC22mCy1wvkG81aX
         oNAgMG4LWms5UuPSnrbasdsJReZv7k6FOkx2ei5JH8MG9zuDOEsb2d/M9WecfjZh0hul
         PZKgQQrzZF/BSQOYGnm40wYZ5e/MqyLEDo0/LMTmgO58djBSpPDlv/20wwcfUERBCsaG
         GRfD2TKrO1/Fh5B8g4Uceqabg5sHQWKhNq5r6t+gvOdtEQ6ov8sTXPymgXM/udVyZAfL
         IHBw==
X-Gm-Message-State: AOJu0YydDvUin5u8jFbsEB/iYMHvXi9srQYECoNQVBEb3WRCNFt66xQt
	+oj6LHbAX9Ui5fILYl89hlus6Rl21Z35+XX5pELPhUhFw0PHj7yEGb1fRjzHKbVfLNlz95Pn0w5
	mqDgbStnoM+7Daz7rRHnwdyBhU3nYKrYdsQ==
X-Received: by 2002:a05:6000:ccc:b0:32d:4e04:2059 with SMTP id dq12-20020a0560000ccc00b0032d4e042059mr1580599wrb.5.1696949718056;
        Tue, 10 Oct 2023 07:55:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRvKzmrEc+AkrgrCm9E8Z34Z0alDDTzpVZGLYdAGarBPdQSSSwoztj3aprnmszu/FLfdXK8Q==
X-Received: by 2002:a05:6000:ccc:b0:32d:4e04:2059 with SMTP id dq12-20020a0560000ccc00b0032d4e042059mr1580576wrb.5.1696949717706;
        Tue, 10 Oct 2023 07:55:17 -0700 (PDT)
Date: Tue, 10 Oct 2023 10:55:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Message-ID: <20231010105446-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB548029E1AAB8529339D22D4DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEswD2XLjRNzyqo9M-yT77PsOJqJmDLxSKd2ZOgqLYjjZQ@mail.gmail.com>
 <PH0PR12MB548143D2AB83CA90E7F1C9D6DCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231010083331-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E43F008C4BB0A906074FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231010095713-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E7E016CA5B8723D38FFFDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E7E016CA5B8723D38FFFDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Tue, Oct 10, 2023 at 02:09:27PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, October 10, 2023 7:30 PM
> 
> > > The hypervisor driver composes the vPCI device. So there isn’t a need to
> > migrate the pci state.
> > > Only exception is VIRTIO_PCI_CAP_PCI_CFG, which is covered in this v1.
> > >
> > 
> > yes but what seems implicit is that device is in some reasonable state when
> > thing thing happens. e.g. are there no limitations at all e.g. in which order
> > things happen? can you really first configure virtio then pci config? for sure?
> > 
> First pci config is setup, like bus master enable etc.
> After that point, the device is handed to virtio things.
> 
> From device context write perspective, I doubt the order matters.
> For example, if pci bus master and msix are enabled after device context restore or before would not matter much.
> As long as they are done before making the device mode to active.

whatever the requirements, document them.

> > > > > > >
> > > > > > > > >and device configuration space may change. \\
> > > > > > > > > +\hline
> > > > > > > >
> > > > > > > > I still don't get why we need a "stop" state in the middle.
> > > > > > > >
> > > > > > > All pci devices which belong to a single guest VM are not
> > > > > > > stopped
> > > > atomically.
> > > > > > > Hence, one device which is in freeze mode, may still receive
> > > > > > > driver notifications from other pci device,
> > > > > >
> > > > > > Device may choose to ignore those notifications, no?
> > > > > >
> > > > > > > or it may experience a read from the shared memory and get
> > > > > > > garbage
> > > > data.
> > > > > >
> > > > > > Could you give me an example for this?
> > > > > >
> > > > > Section 2.10 Shared Memory Regions.
> > > > >
> > > > > > > And things can break.
> > > > > > > Hence the stop mode, ensures that all the devices get enough
> > > > > > > chance to stop
> > > > > > themselves, and later when freezed, to not change anything internally.
> > > > > > >
> > > > > > > > > +0x2   & Freeze &
> > > > > > > > > + In this mode, the member device does not accept any
> > > > > > > > > +driver notifications,
> > > > > > > >
> > > > > > > > This is too vague. Is the device allowed to be freezed in
> > > > > > > > the middle of any virtio or PCI operations?
> > > > > > > >
> > > > > > > > For example, in the middle of feature negotiation etc. It
> > > > > > > > may cause implementation specific sub-states which can't be
> > migrated easily.
> > > > > > > >
> > > > > > > Yes. it is allowed in middle of feature negotiation, for sure.
> > > > > > > It is passthrough device, hence hypervisor layer do not get to
> > > > > > > see sub-
> > > > state.
> > > > > > >
> > > > > > > Not sure why you comment, why it cannot be migrated easily.
> > > > > > > The device context already covers this sub-state.
> > > > > >
> > > > > > 1) driver writes driver_features
> > > > > > 2) driver sets FEAUTRES_OK
> > > > > >
> > > > > > 3) device receive driver_features
> > > > > > 4) device validating driver_features
> > > > > > 5) device clears FEATURES_OK
> > > > > >
> > > > > > 6) driver read stats and realize FEATURES_OK is being cleared
> > > > > >
> > > > > > Is it valid to be frozen of the above?
> > > > > No. device mode is frozen when hypervisor is sure that no more
> > > > > access by the
> > > > guest will be done.
> > > > > What can happen between #2 and #3, is device mode may change to stop.
> > > > > And in stop mode, device context would capture #5 or #4, depending
> > > > > where is
> > > > device at that point.
> > > > >
> > > > > > >
> > > > > > > > And what's more, the above state machine seems to be virtio
> > > > > > > > specific, but you don't explain the interaction with the
> > > > > > > > device status state
> > > > > > machine.
> > > > > > > First, above is not a state machine.
> > > > > >
> > > > > > So how do readers know if a state can go to another state and when?
> > > > > >
> > > > > Not sure what you mean by reader. Can you please explain.
> > > > >
> > > > > > > Second, it is not virtio specific.
> > > > > >
> > > > > > It's somehow for sure, for example you said device context need
> > > > > > to be preserved. And as far as I see the device context is all
> > > > > > virtio specific in
> > > > patch 3.
> > > > > >
> > > > > Sure, device context is virtio specific. :) Device context will
> > > > > reflect if things changed in the stop mode.
> > > > >
> > > > > > > It is present in leading OS that has fundamental requirement
> > > > > > > to support P2P
> > > > > > devices.
> > > > > >
> > > > > > If it's PCI specific, instead of trying to do a workaround in
> > > > > > virtio, why not invent a mechanism there?
> > > > > >
> > > > > It is not a workaround in virtio.
> > > > > It is the way pci p2p devices work for which one needs to be
> > > > > receptive to
> > > > handle the interaction.
> > > > >
> > > > >
> > > > > > > Third, it is not, interacing with the _actua_ device status.
> > > > > > >
> > > > > > > In "SUSPEND" patch-5, you already asked this question. I
> > > > > > > assume you asked
> > > > > > again so that this series is complete.
> > > > > > >
> > > > > > > > For example,
> > > > > > > > what happens if the driver wants to reset but the device is
> > > > > > > > in stop mode? You told me it is addressed in your series but
> > > > > > > > looks not. Once you try to describe that, you're actually
> > > > > > > > try to connect states between the
> > > > > > two state machines.
> > > > > > > >
> > > > > > > As listed in the definition of the stop mode, the device do
> > > > > > > not act on the
> > > > > > incoming writes, it only keep tracks of its internal device
> > > > > > context change as part of this.
> > > > > >
> > > > > > So only the driver notification is allowed by not config write?
> > > > > > What's the consideration for allowing driver notification?
> > > > > >
> > > > > Because for most practical purposes, peer device wants to queue
> > > > > blk, net
> > > > other requests and not do device configuration.
> > > > >
> > > > > Do you know any device configuration space which is RW?
> > > > > For net and blk I recall it as RO?
> > > >
> > > > No it isn't. Pls look at the spec if you need to check that ;)
> > > >
> > > Ok. will check. But regardless, it is fine, because when STOP is done, config
> > writes should not occur anyway.
> > 
> > 
> > i don't see a statement like this but maybe i missed it.
> >
> I am missing it, will add.


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

