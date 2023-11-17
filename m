Return-Path: <virtio-comment-return-8454-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DAFC197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:43:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 58A40183450
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:43:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2D17A986E2A
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:43:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0D02C986E1D; Fri, 17 Nov 2023 11:43:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F0C92986E1E
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 11:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: D0c_1LYWOXy-l6ELcanw5w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700221414; x=1700826214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gY03DT7ehd6OS9gy65C8w1+CfVNa2AZZc3Xp9SFc378=;
        b=pqbrx0VbDg+qVCtTI2S2bqNySZy2s47COKJElOJ4KmqVSEN7k89Ji4dNuQGg6/QQC1
         PzRcyww/qUNY+q9Z8abzrZjw5/A+YG20ZjLEy0+VM6VeD5BAYS8xS2hgMYZ9MkToFSFV
         lUp/7xDMirgHCBxeNaabOkhvsZH2mpXf614Gv24qEHdjk9OvPlg9wJn8pv4Qfw6UZbIr
         Y7TNMlFNguSOK4ScaXyJytzswSE6HnHhrmHTv/S9FT6DabzwLwL/EEtloCn0Kg/Fv5tZ
         bIHDGqQWfsRQU9dph3zxpZIMiUUq9UJ5cqMDwgc17wUrjAAHFYdnH5n5nNVQ6Q7dNBIt
         Y6cQ==
X-Gm-Message-State: AOJu0Yxs112PKAfPZ9f7TFUYCqbhfvJKyKHK93hLaNtdElO4EB/Ihk4H
	bM2aDuu+eKtRI5BFO8LgpoKIhyh88fSPuEHPTUqWl0THLuKxDPp3UCUG8lMAMm8HA4/HXSmzHRO
	42VyYLoO+CQe5t/4zI0dAccq7JRYct2BR7w==
X-Received: by 2002:a05:600c:4715:b0:40a:42dd:c82c with SMTP id v21-20020a05600c471500b0040a42ddc82cmr4033255wmo.27.1700221414328;
        Fri, 17 Nov 2023 03:43:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJkZ8YS1S6cjFohE1jgj3KKBkQl8pFubqNoTd2k9tvnQBvk5cdvhGDd0C9ccOQoyfneVR1/A==
X-Received: by 2002:a05:600c:4715:b0:40a:42dd:c82c with SMTP id v21-20020a05600c471500b0040a42ddc82cmr4033231wmo.27.1700221413852;
        Fri, 17 Nov 2023 03:43:33 -0800 (PST)
Date: Fri, 17 Nov 2023 06:43:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231117063406-mutt-send-email-mst@kernel.org>
References: <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117050357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810D15E0897C2435697E39DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117060456-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481AB5ECF613D806C338C54DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481AB5ECF613D806C338C54DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Nov 17, 2023 at 11:20:14AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 17, 2023 4:41 PM
> > 
> > On Fri, Nov 17, 2023 at 10:20:45AM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Friday, November 17, 2023 3:38 PM
> > > >
> > > > On Wed, Nov 15, 2023 at 05:39:43PM +0000, Parav Pandit wrote:
> > > > > > >
> > > > > > > Additionally, if hypervisor has put the trap on virtio config,
> > > > > > > and because the memory device already has the interface for
> > > > > > > virtio config,
> > > > > > >
> > > > > > > Hypervisor can directly write/read from the virtual config to
> > > > > > > the member's
> > > > > > config space, without going through the device context, right?
> > > > > >
> > > > > > If it can do it or it can choose to not. I don't see how it is
> > > > > > related to the discussion here.
> > > > > >
> > > > > It is. I don’t see a point of hypervisor not using the native
> > > > > interface provided
> > > > by the member device.
> > > >
> > > > So for example, it seems reasonable to a member supporting both
> > > > existing pci register interface for compatibility and the future DMA
> > > > based one for scale. In such a case, it seems possible that DMA will
> > > > expose more features than pci. And then a hypervisor might decide to use
> > that in preference to pci registers.
> > >
> > > We don’t find it right to involve owner device for mediating at
> > > current scale
> > 
> > In this model, device will be its own owner. Should not be a problem.
> >
> I didn’t understand above comment.

We'd add a new group type "self". You can then send admin commands
through VF itself not through PF.


> > > and to not break TDISP efforts in upcoming time by such design.
> > 
> > Look you either stop mentioning TDISP as motivation or actually try to address
> > it. Safe migration with TDISP is really hard.
> But that is not an excuse to say that TDISP migration is not present, hence involve the owner device for config space access.
> This is another hurdle added that further blocks us away from TDISP.
> Hence, we don’t want to take the route of involving owner device for any config access.

This "blocks" is all just wild hunches. hypervisor controls some
aspects of TDISP devices for sure - maybe we actually should use
pci config space as that is generally hypervisor controlled.

> > For example, your current patches are clearly broken for TDISP:
> > owner can control queue state at any time making device modify memory in
> > any way it wants.
> >
> When TDISP migration is needed, the admin device can be another TVM outside the HV scope.
> Or an alternative would have device context encrypted not visible to HV at all.

Maybe. Fact remains your patches do conflict with TDISP and you seem to
be fine with it because you have a hunch you can fix it. But we can't
do development based on your hunches.


> Such encryption is not possible, with the trap+emulation method, where HV will have to decrypt the data coming over MMIO writes.

I don't how what trap+emulation has to do with it. Do you refer to the
shadow vq thing? I am guessing modern platforms with TDISP support are
likely to also support dirty bit in the IOMMU.


> > > And for future scale, having new SIOV interface makes more sense which has
> > its own direct interface to device.
> > >
> > > I finally captured all past discussions in form of a FAQ at [1].
> > >
> > > [1]
> > > https://docs.google.com/document/d/1Iyn-l3Nm0yls3pZaul4lZiVj8x1s73Ed6r
> > > Osmn6LfXc/edit?usp=sharing
> > 
> > Yea skimmed that, "Cons: None". Are you 100% sure? Anyway, discussion will
> > take place on the mailing list please.
> 
> We cannot keep discussing the register interface every week.
> I remember we have discussed this many times already in following series.
> 
> 1. legacy series
> 2. tvq v4 series
> 3. dynamic vq creation series
> 4. again during suspend series under tvq head
> 5. right now
> 6. May be more that I forgot.
> 
> I captured all the direction and options in the doc. One can refer when those questions arise there.
> If we don’t work cohesively same reasoning repetition does not help.

It's still the same too, doc or no doc. You want to build a device
without registers fine but don't force it down everyone's throat. And
now with 8MBytes of on-device memory that's needed for migration and
that's apparently fine I am even less interested in saving 256 bytes for
config space.

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

