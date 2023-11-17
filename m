Return-Path: <virtio-comment-return-8439-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE029C072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:37:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 156CA71C92
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:37:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D5ECD986E2A
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:37:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B2D9D986E1C; Fri, 17 Nov 2023 10:37:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A3868986E1D
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 10:37:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: afeZ2mlmMmut2Aq6eq7lgw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700217462; x=1700822262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8v/zp+FtWOFztneE2R2rZP34GdAfxIQo82sVw0hkff8=;
        b=OAug6fTeDBIyzpHqucc4ae7x2RzXUv4nYxjeajJraxNVn+xgo5dMGgeAzcna6syi4p
         5IOD89lU5wwpCPt/dM02R1CQqADlw1RWgihZRLXbGYDL7G2r0RGfQAx4vEA2Y/CujkaL
         mIoYn2yD30DwGEd94uHrYX7dPKfLXlQJd3ChKLYki2StX3xTqBSB1tQHf7Y+pDe83/Yn
         Gaww0K+4sMOyT5FAuEc3Ws2CfGjpkmnFQEpZ8629+WqY5WhzdERdEjB+m0JCSz6THwQ/
         9Vq5PIRLrwrjSORAPNr5VcQkAhU5d6DEBgl32ZbZHbo/ZjYvjiRCMNKSNwMnztmjj7No
         MxtQ==
X-Gm-Message-State: AOJu0YyojT/GDGi/X5nC8QvZffdKQSA/qrGLcOyHinYQ1bdbmHVxyTF0
	6N0In5hlg5B5xzbOKQnTNbAkhHc9UJNPKA5eiUOJo0kw/aid/r25JGMzyQxXRdiTs9EAi1e/u10
	h7N3M+arO75FLPKpK8TekZiixzrNb0Jj75g==
X-Received: by 2002:a7b:c057:0:b0:408:53d6:10b3 with SMTP id u23-20020a7bc057000000b0040853d610b3mr15156638wmc.22.1700217461850;
        Fri, 17 Nov 2023 02:37:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvVgGvP0zZepPvMocZU68XmpggdvflB95LtnQnu7a3LZsjIHKSBDx1Kv8rNjEQ78CieUTbCQ==
X-Received: by 2002:a7b:c057:0:b0:408:53d6:10b3 with SMTP id u23-20020a7bc057000000b0040853d610b3mr15156626wmc.22.1700217461501;
        Fri, 17 Nov 2023 02:37:41 -0800 (PST)
Date: Fri, 17 Nov 2023 05:37:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231117053117-mutt-send-email-mst@kernel.org>
References: <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117044428-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E8342B26739B852B592FDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E8342B26739B852B592FDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Fri, Nov 17, 2023 at 09:57:52AM +0000, Parav Pandit wrote:
> 
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Michael S. Tsirkin
> > Sent: Friday, November 17, 2023 3:21 PM
> > 
> > On Fri, Nov 17, 2023 at 09:41:40AM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Friday, November 17, 2023 3:08 PM
> > > >
> > > > On Fri, Nov 17, 2023 at 09:14:21AM +0000, Parav Pandit wrote:
> > > > >
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Friday, November 17, 2023 2:16 PM In any case you can
> > > > > > safely assume that many users will have migration that takes
> > > > > > seconds and minutes.
> > > > >
> > > > > Strange, but ok. I don't see any problem with current method.
> > > > > 8MB is used for very large VM of 1TB takes minutes. Should be fine.
> > > >
> > > > The problem is simple: vendors selling devices have no idea how
> > > > large the VM will be. So you have to over-provision for the max VM size.
> > > > If there was a way to instead allocate that in host memory, that
> > > > would improve on this.
> > >
> > > Not sure what to over provision for max VM size.
> > > Vendor does not know how many vcpus will be needed. It is no different
> > problem.
> > >
> > > When the VM migration is started, the individual tracking range is supplied by
> > the hypervisor to device.
> > > Device allocates necessary memory on this instruction.
> > >
> > > When the VM with certain size is provisioned, the member device can be
> > provisioned for the VM size.
> > > And if it cannot be provisioned, possibly this may not the right member device
> > to use at that point in time.
> > 
> > For someone who keeps arguing against adding single bit registers "because it
> > does not scale" you seem very nonchalant about adding 8Mbytes.
> > 
> There is fundamental difference on how/when a bit is used.
> One wants to use a bit for non-performance part and keep it always available vs data path.
> Not same comparison.
> 
> > I thought we have a nicely contained and orthogonal feature, so if it's optional
> > it's not a problem.
> It is optional as always.
> 
> > 
> > But with such costs and corner cases what exactly is the motivation for the
> > feature here?  
> New generations DPUs have memory for device data path workloads but not for bits.
> 
> > Do you have a PoC showing how this works better than e.g.
> > shadow VQ?
> > 
> Not yet.
> But I don't think this can be even a criteria to consider as dependency on PASID is nonstarter with other limitations.

You just need dirty bit in PTE, whether that is tied to PASID depends
very much on the platform.  For VTD I think it is.  And if shadow vq
works as a fallback, it just might be reasonable not to do any tracking
in virtio.

> > Maybe IOMMU based and shadow VQ based tracking are the way to go initially,
> > and if there's a problem then we should add this later, on top.
> >
> For the cpus that does not support IOMMU cannot shift to shadow VQ either.

I don't know what this means (no IOMMU at all?) but it looks like shadow
vq and similar approaches are in production with vdpa and have been
demonstrated for a while. All we are doing is supporting them in
virtio proper.

> > I really want us to finally make progress merging features and anything that
> > reduces scope initially is good for that.
> >
> Yes, if you prefer to split the last three patches, I am fine.
> Please let me know.

As here have not been any comments on 1-5 I don't think there's
need to repost this just yet. I'll review 1-5 next week.
I think in the next version it might be wise to split this and post
as two series, yes.

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

