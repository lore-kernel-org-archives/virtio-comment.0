Return-Path: <virtio-comment-return-8065-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F22CC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 00:29:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 63B4D2AEF5
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 00:29:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4AF54986B9E
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 00:29:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 362EC986B95; Wed,  1 Nov 2023 00:29:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 23000986B96
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 00:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: jPwbnrG0MlGNC2ygXXc6qQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698798587; x=1699403387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqc1uJ+rCYnZ/pdCbrg65fMwhKSkkwj2kBAacJwQ+e8=;
        b=pg+shh5WIvsBE6hKE/NSS2uA28xvYcgIqhq/GjUvwx0X8WYwu3AkE3ofyScR7mpmsH
         ksXBC9HlJvbDLtedZjjxlrDNRuVgQSR/iRLeoXo1ZeEH298KQ+EwN+c95O15P9vS+rUD
         XsD2sFEyyu0SJwTS3tL+g1dq0Q3gZrURIL27DgXoXXk2nqAsujzzuS3s7p1Fu7M/QwLe
         4q3EMcliCk+7e7Zz3u3EqqR7XRnRUuBs7tj4oAgGs7hTUF53Vvcy0wMmbyahzYzUIOgG
         TSgG07AS64iXTYO59BxSjoV/W6p9FqCahtFXcYsZkt1ghzlly9+wes7QTjvTSe66kRJX
         bwnA==
X-Gm-Message-State: AOJu0YwjXc+2Q7fWW8sAOzb1/Wm8dYX9J3UyDa4AFfrGyuXuHgvZ0qUZ
	enkSyt5y+Pc7z4Sn9sS09oyO2pt67QbU6fjq3ndRnAwRZ7Fvqj9fC4C0QKLz89z4jyod6cJ5idV
	cSpfKLFCYLbB82nPBR5Iyuhg2imU0nkWGJ5eUGNnRM+gq6zE1cA==
X-Received: by 2002:a05:6512:20ca:b0:507:a8d1:6e56 with SMTP id u10-20020a05651220ca00b00507a8d16e56mr9605087lfr.35.1698798586753;
        Tue, 31 Oct 2023 17:29:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY5lgfQKdSj91K0wGUBdyYTVbV1gNRc6qeaefwQr2i0cX8qhD+XXrDLhJu6qCP2TzVRP3U8OG4HHD1K3HwkvQ=
X-Received: by 2002:a05:6512:20ca:b0:507:a8d1:6e56 with SMTP id
 u10-20020a05651220ca00b00507a8d16e56mr9605073lfr.35.1698798586427; Tue, 31
 Oct 2023 17:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231030131959.1386107-1-parav@nvidia.com> <20231030131959.1386107-7-parav@nvidia.com>
 <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com> <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 1 Nov 2023 08:29:35 +0800
Message-ID: <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording commands

On Tue, Oct 31, 2023 at 11:27=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, October 31, 2023 7:13 AM
> >
> > On Mon, Oct 30, 2023 at 9:21=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > > During a device migration flow (typically in a precopy phase of the
> > > live migration), a device may write to the guest memory. Some
> > > iommu/hypervisor may not be able to track these written pages.
> > > These pages to be migrated from source to destination hypervisor.
> > >
> > > A device which writes to these pages, provides the page address recor=
d
> > > of the to the owner device. The owner device starts write recording
> > > for the device and queries all the page addresses written by the
> > > device.
> > >
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > Signed-off-by: Satananda Burla <sburla@marvell.com>
> > > ---
> > > changelog:
> > > v1->v2:
> > > - addressed comments from Michael
> > > - replaced iova with physical address
> > > ---
> > >  admin-cmds-device-migration.tex | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/admin-cmds-device-migration.tex
> > > b/admin-cmds-device-migration.tex index ed911e4..2e32f2c 100644
> > > --- a/admin-cmds-device-migration.tex
> > > +++ b/admin-cmds-device-migration.tex
> > > @@ -95,6 +95,21 @@ \subsubsection{Device Migration}\label{sec:Basic
> > > Facilities of a Virtio Device /  The owner driver can discard any
> > > partially read or written device context when  any of the device migr=
ation flow
> > should be aborted.
> > >
> > > +During the device migration flow, a passthrough device may write dat=
a
> > > +to the guest virtual machine's memory, a source hypervisor needs to
> > > +keep track of these written memory to migrate such memory to destina=
tion
> > hypervisor.
> > > +Some systems may not be able to keep track of such memory write
> > > +addresses at hypervisor level. In such a scenario, a device records
> > > +and reports these written memory addresses to the owner device. The
> > > +owner driver enables write recording for one or more physical addres=
s
> > > +ranges per device during device migration flow. The owner driver
> > > +periodically queries these written physical address records from the=
 device.
> >
> > I wonder how PA works in this case. Device uses untranslated requests s=
o it can
> > only see IOVA. We can't mandate ATS anyhow.
> Michael suggested to keep the language uniform as PA as this is ultimatel=
y what the guest driver is supplying during vq creation and in posting buff=
ers as physical address.

This seems to need some work. And, can you show me how it can work?

1) e.g if GAW is 48 bit, is the hypervisor expected to do a bisection
of the whole range?
2) does the device need to reserve sufficient internal resources for
logging the dirty page and why (not)?
3) DMA is part of the transport, it's natural to do logging there, why
duplicate efforts in the virtio layer? I can't see how it can compete
with the functionality that is provided by the platform. And what's
more, we can't assume virtio is the only device that is used by the
guest.

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

