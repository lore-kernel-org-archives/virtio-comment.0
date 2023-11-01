Return-Path: <virtio-comment-return-8094-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49537C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 09:06:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 96AC12ACFD
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 09:06:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 76CA8986BC2
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 09:06:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 52923986BB6; Wed,  1 Nov 2023 09:06:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 42202986BB7
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 09:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: QiWJ0GhnNd6N9fv2w8ox3Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698829570; x=1699434370;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=napzCwA075o1j5Dz7bzouy4tohBLSjkzYDvcf4g5Yk4=;
        b=G2j8wSTwFSYsHxTgWcgi0oyFvuLmkqLzrRt73dcYcuGrxrYdgJxxaB3gu2Wo469Ztj
         aFYYE3pwVQDW3+PvoePOFJR/K3mhQYVGXeiHba1n2skifwbcWxNW33iRv16bpuzOdrgV
         xnyXzwBwa4oJBsvxhvAxPAVGwCuAPiB9wRtaKg6+GMXG/Onw0SE2MM4UxiO7Kw+f0eam
         x1Y75v6I2Xgfd7iaOBHptS9oTSqoTVIBCzIR6fMwdQEUwlATdxZRSdKaF6lP/Y//KQhy
         nzgYwd6OfOE9/vaj4YNWqcADwJvyUOp7OPG7ih5p1/NGuPcxtIqPWXyqFgSV9FNS3gxu
         iKFQ==
X-Gm-Message-State: AOJu0YwayNe9HyLRFujuWgIuKU9NOU3h0enmhhZxOIYlIrmpA2h5lU12
	Qkn5jsM3qRoZ9EAJgJmH29ltu6mjQpJWNZ7HS7Ac3iYGBy0t6q8T9nOuirFb/FV+7/FPla/LeVj
	nqfDeXpr8cWNFpxENCQLfsZgjpCOz9WDKPA==
X-Received: by 2002:a17:907:9804:b0:9bf:1aff:6e03 with SMTP id ji4-20020a170907980400b009bf1aff6e03mr1326489ejc.65.1698829569760;
        Wed, 01 Nov 2023 02:06:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXWkjqxCWkDn1LoZLRrZYRomSnt+aOAdyhTGEk+1BFa+YhqQ2PeeYikF+wyjkdivCxsvvH1A==
X-Received: by 2002:a17:907:9804:b0:9bf:1aff:6e03 with SMTP id ji4-20020a170907980400b009bf1aff6e03mr1326469ejc.65.1698829569333;
        Wed, 01 Nov 2023 02:06:09 -0700 (PDT)
Date: Wed, 1 Nov 2023 05:06:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231101045519-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
 <20231031054617-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54806512D1395AB39C59B821DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101012540-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54802C006C5ADE546783E610DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101023257-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548109F7EDDE8083DFE85167DCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231101041642-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548163CB226907C2172D1BECDCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548163CB226907C2172D1BECDCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Nov 01, 2023 at 08:49:40AM +0000, Parav Pandit wrote:
> > So this:
> > 
> > +struct virtio_dev_ctx_pci_vq_cfg {
> > +        le16 vq_index;
> > +        le16 queue_size;
> > +        le16 queue_msix_vector;
> > +        le64 queue_desc;
> > +        le64 queue_driver;
> > +        le64 queue_device;
> > +};
> > 
> > 
> > duplicates a bunch of fields from this:
> > 
> Not really. Above is current VQ's configuration not visible in the config space directly.
> Below is already captured as part of VIRTIO_DEV_CTX_PCI_COMMON_CFG.

I really wanted to help you understand what I mean when I say
that the spec effort is duplicated.


> > struct virtio_pci_common_cfg {
> >         /* About the whole device. */
> >         __le32 device_feature_select;   /* read-write */
> >         __le32 device_feature;          /* read-only */
> >         __le32 guest_feature_select;    /* read-write */
> >         __le32 guest_feature;           /* read-write */
> >         __le16 msix_config;             /* read-write */
> >         __le16 num_queues;              /* read-only */
> >         __u8 device_status;             /* read-write */
> >         __u8 config_generation;         /* read-only */
> > 
> >         /* About a specific virtqueue. */
> >         __le16 queue_select;            /* read-write */
> >         __le16 queue_size;              /* read-write, power of 2. */
> >         __le16 queue_msix_vector;       /* read-write */
> >         __le16 queue_enable;            /* read-write */
> >         __le16 queue_notify_off;        /* read-only */
> >         __le32 queue_desc_lo;           /* read-write */
> >         __le32 queue_desc_hi;           /* read-write */
> >         __le32 queue_avail_lo;          /* read-write */
> >         __le32 queue_avail_hi;          /* read-write */
> >         __le32 queue_used_lo;           /* read-write */
> >         __le32 queue_used_hi;           /* read-write */
> > };
> > 
> > 
> > Except it's incomplete and I suspect that's actually a bug.
> > 
> It is not a bug.

For example. queue_enable is not there.

> There is some information duplicated. Above struct virtio_pci_common_cfg is the snapshot of registers being updated.
> While struct virtio_dev_ctx_pci_vq_cfg is capturing what is not visible in above config snapshot.
> i.e. queues which are already configured.
> For at that rare instance there is some duplication of some fields. but this is the exception part not be too much worried about.

Seems more of a rule than an exception - I don't see any fields that are
not also in config space.

> > 
> > Here's an idea: have a record per field. Use transport offsets as tags.
> > 
> There are just too many of them.
> They are logically clubbed in their native structures which are already defined.

Too many for what? If you don't like what I suggested find some way to
avoid duplicating everything please.


> > 
> > 
> > 
> > > > > > We need a stronger compatiblity story here I think.
> > > > > >
> > > > > > One way to show how it's designed to work would be to split the
> > > > > > patches. For example, add queue notify data and queue reset separately.
> > > > > I didn't follow the suggestion. Can you explain splitting patches
> > > > > and its relation
> > > > to the structure?
> > > Did I miss your response? Or it is in below msix?
> > 
> > exactly.
> > 
> > > > >
> > > > > >
> > > > > > Another is to add MSIX table migration option for when MSIX
> > > > > > table is passed through to guest.
> > > > > Yes, this will be added in future when there is actual hypervisor for it.
> > > >
> > > > You are tying the architecture to an extremely implementation specific
> > detail.
> > > >
> > > Which part?
> > >
> > > Not really. can you please which software will use MSI-X table migration?
> > 
> > Like, all and any? All hypervisors migrate the msi-x table.
> > 
> > > > Hypervisors *already* have migrate the MSIX table. Just in a
> > > > hypervisor specific way.
> > > MSI-X table is in the PCI BAR memory.
> > 
> > Exactly. And that means hypervisor should not read it from the device directly -
> > e.g. with an encrypted device it won't be able to.
> > 
> Yep.

And it follows device needs to include 

> > > > queue vector is an index into this table. So the index is migrated
> > > > through the device but the table itself has to be trapped and emulated by
> > hypervisor?
> > > Do you have a hypervisor and a platform that has not done MSI-X table
> > emulation for which you are asking to add?
> > > I don't know any.
> > > I am asking to add it when there is a _real_ user of it. Why it cannot be added
> > when the _real_ user arrive?
> > 
> > Real meaning actual hardware and software implementing it?  By this definition
> > there's no real user for migration in the spec at all - all of it can be done by
> > device specific means. 
> This is also an option if vendor specific commands are allowed.

Once you do that you can just throw all this spec effort out the window,
and do vdpa. I thought the point was to allow control plane in standard
hardware, so vendors can compete on best hardware and software is shared?

> > What's your point? By now we have a reasonably good
> > idea what hypervisors need to make migration portable. Let's either put all of it
> > in the spec or not bother at all.
> > 
> Maybe I was not clear.
> I am saying lets put the msix table when a user will find it useful in incremental manner.
> For example, lets say we put in the spec in 1.4 version Nov 23, will device implement it? mostly yes.
> Will existing software use it in 2024-25? mostly no, because most platform has complexity in this area as cpus have hard coded certain values.
> 
> So we are asking device to implement something that is not going to be used by any forcible future.
> 
> Hence, the request is, when the hypervisor/cpu vendor asks for it, it will be possible to add into the device.

If it is there then I expect hypervisors will use it, yes.

> > In other words, we need a bright line. I suggest a simple one: memory is
> > migrated by device, config space by hypervisor.  If not, suggest another one -
> > but it needs a reasonable rule based on a hardware not whatever software
> > found expedient to use.
> > 
> I really liked this bright line.
> Msix table like rest of the memory area of common config and device config will become part of this memory area.
> 
> I wish we also draw a good bright line between for near term vs long term to be practical.
>
> Adding MSI-X table in the spec is not hard now or in future, frankly.

Show me the patch.

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

