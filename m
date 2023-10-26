Return-Path: <virtio-comment-return-7963-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEEEC0032E
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 00:57:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1DDBB2B070
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 00:57:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F2868986A42
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 00:57:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D77E3986A38; Thu, 26 Oct 2023 00:57:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8941986A39
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 00:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: VPIy5ADUPHSjxZYxvl1fNg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698281819; x=1698886619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fg7IJzOgd47pT0Cwlyi/BnUo1MQWRtxTow/DNQk/nek=;
        b=qOiNmYDCJLxhB4Y7vrDakyZs+Op8qDrmrZ5pK28HhRhiidUtl+vxRMwHP0JSNC6ja7
         YbGketFRZoJsBAlqb5c65I/P9u8FtrMHL6Z3MrZR12rX7JXt2hRsUFLahLdtO3Nxe+kx
         L+kr3y6EEPJmFkCVy3tjvxy1NqTNg7FgKejd5DzT/Is2GCLYLCKqlbZO7LXFh6xyup10
         B1Tck0q28Z+KjyjC8P/YWys61Y0zdiTZvJfT20k58lxVL3A09AiAXxYDFwBV+48y94xg
         SSoI0NU3l+zFr+1D0afaTzEtJlbJACIK1EKXOlmOtnaKsWrbKdGcMOOCTuyFBvtyGXwG
         G+pg==
X-Gm-Message-State: AOJu0YwRDGB+AN5PEhTl/+oq4dW67KSmoZgMN4+EIaGVSyYTbNKy5N3X
	QGZMA+Rrjy6t4hpOkD6x77rHRYZgWqVaaXJsFJDLZ+C4DLBmEdof7PFP82HlDWF8hXwK4Ia9w9d
	NwZR1PS201KqNAErRGTUpbdIHuSRXRaY+hyKrFKHOLCIi+cqpEg==
X-Received: by 2002:a05:6512:23a4:b0:508:12f4:34e2 with SMTP id c36-20020a05651223a400b0050812f434e2mr446217lfv.12.1698281819128;
        Wed, 25 Oct 2023 17:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGanwvP0f25ocoPziBl5Ivhom0MBdlKtm5CM2gw3OAg9tpVyft3i7v5pHu9Z1uULm7uDREPrE70sI29NxQWyBM=
X-Received: by 2002:a05:6512:23a4:b0:508:12f4:34e2 with SMTP id
 c36-20020a05651223a400b0050812f434e2mr446210lfv.12.1698281818814; Wed, 25 Oct
 2023 17:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com> <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com> <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com> <20231021112420-mutt-send-email-mst@kernel.org>
 <2cc0d8fc-8ed5-4b98-b5e7-3a86d3da80b0@intel.com> <20231023072519-mutt-send-email-mst@kernel.org>
 <8d601578-2083-4f45-a700-6b67d0c5b789@intel.com> <20231025042512-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231025042512-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 26 Oct 2023 08:56:47 +0800
Message-ID: <CACGkMEtaw-DKy7vwWj8wgG8-_9Kg4SV3=pS1djntOEYM62Dg-g@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Parav Pandit <parav@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Oct 25, 2023 at 4:33=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Oct 24, 2023 at 06:27:04PM +0800, Zhu, Lingshan wrote:
> >
> >
> > On 10/23/2023 7:32 PM, Michael S. Tsirkin wrote:
> >
> >     On Mon, Oct 23, 2023 at 06:03:10PM +0800, Zhu, Lingshan wrote:
> >
> >         config space, MMIO, registers work for years, what is wrong wit=
h them?
> >
> >     Nothing as such. They don't seem to be appropriate for all use-case
> >     where people want to utilize virtio. I think a new transport
> >     will be needed to address these.
> >
> > New transport for new type of devices for sure, like transport vq for S=
IOV.
> >
> > I agree admin vq or admin cmds are useful in some use cases, that is
> > another story, should be case by case.
> >
> > For now, let's don't talk about all-use cases, just for current task, f=
or live
> > migration.
> >
> > So IMHO, I still think we should use config space registers to control =
live
> > migration process.
> >
> >
>
> No because it forces integrating migration process with device driver.
> Which is ok for some use-cases but not all of them.  Find some other
> control plane for this.
>
>
> >                 Config space is control path, DMA is data-path, let's b=
etter not mix them,
> >                 we never expect to use config space to transfer data.
> >
> >                 So we need DMA to transfer data, for example I take adv=
antages of device DMA
> >                 to logging dirty pages, This also applies to in-flight =
descriptors.
> >
> >             As long as you do, I personally see little benefit to retri=
eve parts of
> >             state with memory mapped accesses.
> >
> >         registers only control, and I personally believe a single regis=
ter is much
> >         better
> >         than processing admin commands, more light-weight, more reliabl=
e, working
> >         for years.
> >
> >     Yea. It would be, if we could do everything through that register.
> >     But we can't really. Migration has too much data to pass around
> >     for that to be reasonable.
> >
> > data are not transferred by registers, they only control.
> >
> > We transfer data by DMA, the device writes DMA dirty pages information(=
bitmap)
> > to host isolated memory region.
> >
>
>
> If you do that then I don't see any reason not to use admin
> commands for that - either through a vq or a simpler
> interface.

I think we need to agree that admin commands are the only interface
for any future features before we can have an agreement here.

My understanding is that it is optional for the transport that
requires administrative commands like provisioning etc. It is not
necessarily the interface for new features.

>
>
> >
> >         Config space interfaces are fundamental for virtio-pci.
> >
> >
> >     They are in fact fundamental to virtio. Multiple transports to
> >     use config space are also fundamental.
> >
> > I agree. So I also agree to build admin vq live migration solution base=
d on our
> > basic facilities, as Jason ever proposed.
>
>
> I'm not sure it's even a vq. I suggest a minimal interface to send
> admin commands. Could be used by migration, as transport, and more.
>

It's better if we can do that below the layer of admin commands. For
example, we don't stick device status with any specific interface. We
can keep doing things like this.

Thanks


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

