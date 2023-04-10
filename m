Return-Path: <virtio-comment-return-5335-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04688C77B61
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 10:07:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BFCD926A59
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 10:06:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A550B986366
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 10:06:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9AC77986319; Mon, 10 Apr 2023 10:06:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8396D98631E
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Apr 2023 10:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 1NEuKSaPNFSBsOyVl2VPqA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681121213;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SIuPh0Q7aaEGGPtMDp8rtCrHeHZutODr6kSvT7g9XWY=;
        b=I+c253FzvwVdGkwr8LjZmTTs3JGP9iWaTDD/LDb0HXtyII1i7z89g4Bg5ki93WlcAM
         fLlkLrvPicdKuB9YgNwNa9MfwsjOIHvZmZ2EmVap7IiA0f99yNIudbAZAI3fi14hzlce
         mD6eU/SXYPMBgOAsnWonI++I+7c8N/71nibi4qdYzBVeAza6cbsZSbCJnKEl097kIRpz
         PWIe4YlJ1f3ovRVEZEnT9FTZLujiR4rDRXjMD8nKB/naHES6bkHG5Hr/AIkmaIOCi1vc
         8G/u6kKjRnIYi80cyFTUHNugek+n8TSQu5siF6xfGOn+RKjpQWsh/XUX8y1Wyn9r1lDR
         pYqg==
X-Gm-Message-State: AAQBX9c/YBv2dAkweVahxoGvi6efUTo7/djZzK0pvsoyRYoywsmh5iTH
	lvgk/2hcYDS0L2VCxfTjN4XUrb1+jAg2l1mv0qljCkYrN9cYp8M1wqW2Clp30s1ylFS66Xoh7fX
	7UiB+zdA9oVD54S2hhzq27VhNJdESc7hZpw==
X-Received: by 2002:a7b:cd8f:0:b0:3ef:67fc:fef1 with SMTP id y15-20020a7bcd8f000000b003ef67fcfef1mr7367802wmj.26.1681121213673;
        Mon, 10 Apr 2023 03:06:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z3hwEKUTi1MmJ6HRJ+Rkj89Kq0S+EultviAtUCSE5ycoOtzNa2wHaGq3Rap/lXfHzhxzkS+Q==
X-Received: by 2002:a7b:cd8f:0:b0:3ef:67fc:fef1 with SMTP id y15-20020a7bcd8f000000b003ef67fcfef1mr7367786wmj.26.1681121213384;
        Mon, 10 Apr 2023 03:06:53 -0700 (PDT)
Date: Mon, 10 Apr 2023 06:06:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-dev@lists.oasis-open.org,
	cohuck@redhat.com, virtio-comment@lists.oasis-open.org,
	shahafs@nvidia.com, Satananda Burla <sburla@marvell.com>
Message-ID: <20230410060417-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230330225834.506969-10-parav@nvidia.com>
 <20230407043841-mutt-send-email-mst@kernel.org>
 <CACGkMEtkOdwixxaRz2Pv9xP75vb13ncboX5XRs8NqFCUsS16aQ@mail.gmail.com>
 <20230410020906-mutt-send-email-mst@kernel.org>
 <CACGkMEtiROwuB+ECJqd13qdpMJSTMoDOzi1u_i85==42C0XSXw@mail.gmail.com>
 <20230410023715-mutt-send-email-mst@kernel.org>
 <CACGkMEs+E_OarQxP3NmLk3iSi7U0WgAn-m3b4eX7ULu1+v=sOw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEs+E_OarQxP3NmLk3iSi7U0WgAn-m3b4eX7ULu1+v=sOw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Mon, Apr 10, 2023 at 03:20:52PM +0800, Jason Wang wrote:
> On Mon, Apr 10, 2023 at 2:40 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Apr 10, 2023 at 02:20:16PM +0800, Jason Wang wrote:
> > > On Mon, Apr 10, 2023 at 2:15 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Mon, Apr 10, 2023 at 09:33:32AM +0800, Jason Wang wrote:
> > > > > This is fine for vDPA but not for virtio if the design can only work
> > > > > for some specific setups (OSes/archs).
> > > > >
> > > > > Thanks
> > > >
> > > > Well virtio legacy has a long history of documenting existing hacks :)
> > >
> > > Exactly, so the legacy behaviour is not (or can't be) defined by the
> > > spec but the codes.
> >
> > I mean driver behaviour derives from the code but we do document it in
> > the spec to help people build devices.
> >
> >
> > > > But yes, VIRTIO_F_ORDER_PLATFORM has to be documented.
> > > > And we have to decide what to do about ACCESS_PLATFORM since
> > > > there's a security problem if device allows not acking it.
> > > > Two options:
> > > > - relax the rules a bit and say device will assume ACCESS_PLATFORM
> > > >   is acked anyway
> > >
> > > This will break legacy drivers which assume physical addresses.
> >
> > not that they are not already broken.
> 
> I may miss something, the whole point is to allow legacy drivers to
> run otherwise a modern device is sufficient?

yes and if legacy drivers don't work in a given setup then we
should not worry.

> >
> > > > - a new flag that is insecure (so useful for sec but useless for dpdk) but optional
> > >
> > > This looks like a new "hack" for the legacy hacks.
> >
> > it's not just for legacy.
> 
> We have the ACCESS_PLATFORM feature bit, what is the useage for this new flag?


ACCESS_PLATFORM is also a security boundary. so devices must fail
negotiation if it's not there. this new one won't be.


> >
> > > And what about ORDER_PLATFORM, I don't think we can modify legacy drivers...
> > >
> > > Thanks
> >
> > You play some tricks with shadow VQ I guess.
> 
> Do we really want to add a new feature in the virtio spec that can
> only work with the datapath mediation?
> 
> Thanks

As long as a feature is useful and can't be supported otherwise
we are out of options. Keeping field practice things out of the
spec helps no one.

> >
> > --
> > MST
> >


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

