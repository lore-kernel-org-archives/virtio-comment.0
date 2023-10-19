Return-Path: <virtio-comment-return-7839-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A4FCDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 08:31:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E2B3CC6105
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 08:31:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BB9679868D4
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 08:31:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A11469868C9; Thu, 19 Oct 2023 08:31:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9147F9868CA
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 08:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: eEY1v8NQOdGHuY_GpnTAWA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697704281; x=1698309081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuWIIBrWpBzhD663+8KonNEpORTi6sJurhwqXSiBZfw=;
        b=caB8NAFFVCHWLcOHI7FCoPr1ueh+Vpohui7Zq1ZwWHWaYHfo5GZS4OhR4STQOYPV3K
         RfkpMHkRrpmFdZPuCeEu/9Az6CzVXS+hFd6NG7NOLFC4ZuYHGr8ZMaFjDqqkB9JK/agZ
         9vxK5eQIopnYQY3L9Fy3Wg7lzODMlxuBFPe3BCxH3s/YyZQIaDmVczbhPQ8o0N+rH9vg
         cl3keXcrlqXUbi2KrPD8huhLFGr11SsbgEbur57iwdN8khvHXorMOiCLcp5xGqhwNazW
         5MmWZBAvjc9MNDXHRX1xHiZGoomKFgzFinurHqSRKhce4ecBc5JE5QQhChX5H61y4l44
         AbpA==
X-Gm-Message-State: AOJu0Yw5M2/eAm+vFQf6YHImabcE+yRnedGJXQKoGR/CB5zXzdxRDT08
	feYRHkgluJR9d2ljWOMEtNreMzf9AV4v3pR8Dy10pCihkwLBT2nX4gcoGyym6AUV8mCyWKlYavw
	EcO1gZxQRBu/0vEiSNInaKlm3WSR7vNr7fA==
X-Received: by 2002:adf:e483:0:b0:317:4ef8:1659 with SMTP id i3-20020adfe483000000b003174ef81659mr818088wrm.28.1697704281526;
        Thu, 19 Oct 2023 01:31:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0wt/Drs+wQQmiqKTZc0fB5QrhyGZ6wahULt0M3XQcdCWTReCgzpyYrREPD01Nt/YDTXXIVg==
X-Received: by 2002:adf:e483:0:b0:317:4ef8:1659 with SMTP id i3-20020adfe483000000b003174ef81659mr818038wrm.28.1697704280002;
        Thu, 19 Oct 2023 01:31:20 -0700 (PDT)
Date: Thu, 19 Oct 2023 04:31:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231019041629-mutt-send-email-mst@kernel.org>
References: <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
 <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
 <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMF4JVEQJ6skT2DrEWjop6wjKS6ad6dW2UNOA1oRuPKQ@mail.gmail.com>
 <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019020413-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810A5AA248384392FC8169DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54810A5AA248384392FC8169DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Thu, Oct 19, 2023 at 07:30:09AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, October 19, 2023 12:05 PM
> > 
> > On Thu, Oct 19, 2023 at 05:31:37AM +0000, Parav Pandit wrote:
> > > > How could we make any agreement without an accurate the definition
> > > > of "passthrough" who is a key to understand each other?
> > >
> > > I replied few times in past emails but since those email threads are so long, it
> > is easy to miss out.
> > >
> > > Passthrough definition:
> > > a. virtio member device mapped to the guest vm b. only pci config
> > > space and msix of a member device is intercepted by hypervisor.
> > > c. virtio config space, virtio cvqs, data vqs of a member device is directly
> > accessed by the guest vm without intercepted by the hypervisor.
> > >
> > > (Why b?, no grand reason, it is how the hypervisors are working where to
> > integrate the virtio member device to).
> > 
> > I think it's a reasonable use-case, though of course not at all the only way to
> > design a system. 
> Sure, there are more ways to bisect the device, specially when underlying device is not a virtio device.
> But one can continue bisecting virtio as well as you listed below.
> > Some more ways:
> > 2- intercept everything except data vqs and cvqs
> > 	I think this is a reasonable way to build the system and has a bunch
> > 	of advantages short term. The main disadvantage as compared to
> > 	passthrough is the need to keep config space coherent with
> > 	device operation - the way to do it is device specific and
> > 	might get fragile.
> > 
> Yes, I agree it has short term advantages.
> This is not future proof as you listed.
> 
> > 4- intercept everything except data vqs
> > 	Here we get another problem in isolating some vqs but not
> >         others. the problem becomes bigger is that you also
> > 	need to communicate control vq to the device.
> > 
> Yes. for non virtio device vendors have easy way to support.
> We supported this for mlx5 devices.
> 
> > also, with both of the above options, we have a question of how are we
> > communicating with the device to keep control path and data path in sync when
> > device's dma is mapped to guest.
> > using PASIDs for isolation might work but again, support is far from universal so
> > we can't really assume it as the only way in the spec.
> > 
> Right.
> 
> > Absent PASID the popular way seems to be shadow vq which basically does
> > 
> > 4- software intercept for everything
> >        clearly that's a lot of CPU overhead, I do not think we can focus on that
> >        as the only way in the spec, though some hypervisors might
> >        already have a lot of migration overhead to the point where
> >        virtio can afford any amount of overhead and it won't be
> >        measureable.
> > 
> > 
> > I also note some or all of the intercepts can always come and go.  For example,
> > a common setup is that if target VCPUs are running then IOMMU will inject
> > interrupts directly into guest - if not you generally trap to hypervisor. Similarly,
> > shadow vq might be active just temporarily.
> > 
> > Which approach is best? I feel ideally virtio would find ways to support them all
> > rather than deciding on a policy in the spec.
> 
> Cooking all the modes seems frankly very daunting to me specially when
> there is no existing software stack to consume all modes and no device
> vendor to sign of for _all_ variations.

Not addressing all the modes.  We are building components not stacks.
Components need to be reusable not stack specific.

Was the whole admin command interface with its levels of indirection
a design mistake then? It was designed exactly to support
all kind of models.
> 
> To me, two stacks are practical and common to target at beginning.
> i.e.
> 1. passthrough mode 
> 
> 2. #2 above,
> I had real technical difficulty to make #2 practically work and build a scalable device and have converged api with #1.
> The option we explored to have admin command in some register of the VF specific for #2 is partially fine targeted for use case #2 only.

Right. So - a way to send admin commands to a VF directly, perhaps in
config space? Do we need more than PA+PASID+some flags?
Want to try to write something like this up?

> A variation of that for the member device, there is owner device, hence admin command on the AQ can be used.
> 
> If we can converge on common virtio interface between #1 and #2, great.
> If we cannot be due to technical issues, we shouldn't step on each other's toes, instead build the two interfaces for two different use cases overcoming its own technical challenges.
> 
> And when in future, someone want to implement different kind of bisections, they can propose the extensions.

Not good at all, this means the interface is very narrow.
Your "propose an extension" just doesn't work practically.
It takes years for things to be widely deployed in the field,
by the time they are there are more use-cases.
We need something universal and admin commands were supposed to be
just this.

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

