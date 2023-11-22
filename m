Return-Path: <virtio-comment-return-8516-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670F8C072A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:13:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AD46322373
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:13:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 814D49868A4
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:13:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6A785986893; Wed, 22 Nov 2023 04:13:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5AC32986894
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 04:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: zRVkUO5LMGqhCOaqULaLOQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700626425; x=1701231225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=By0yR90ICBaV22DZcQC0PB/6+6n4y9KnW0UJDYa3iHU=;
        b=dp21PuOsHQQrV1iQhlE8c7ITNfc3oOpwbys+cB7G0xCAtrgho1noguC9QN81ztI0pU
         LsMmui+V8omlB3nck1VM5hF7FsLI/IzEP61xQdLOoAQkQ/d4ZQA7Jax2Qyw/rFCnXesh
         qAQGBsBQlvR/EudAuC/2If3OfRXiA02lHWiO+pXbmN2LKaqS//bOjNIwm5Apqrsbf33k
         6IJs66fsRjOYRwcynyt6ChASW59KuAVBmfitkPTmWXUJAZIlnW1gYZs4wcwswd27dsnu
         0jymkhO/AqGuCfyBLZVxrErlMC8RMvgKw8qNvVIktZ0VJISLCZZuVN7ePKfDxV/GL8Zk
         UA+g==
X-Gm-Message-State: AOJu0Yyo9p0glkrw0NsD0DYbD5D6xEQHJ3Z74PR7Ac4PPXgTBam9NCIJ
	PBw8M+ImcpbzwsfNMb+kXyXLYOzw0y5d98XbAfD/pqaUqcWf5SzUcJWCKout1U+hH+iYaaYe/R4
	Y/UUZHC5+hBjVMU8bFuIDQbDMbOGRuRH5U8ngH7rdXTuy41qlUQ==
X-Received: by 2002:ac2:44a6:0:b0:509:4aae:f2b1 with SMTP id c6-20020ac244a6000000b005094aaef2b1mr787461lfm.8.1700626425718;
        Tue, 21 Nov 2023 20:13:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBksxnlJ091t23dTA2Id4jFoQZarascZPzW76fK+bwl2HPyJZx84NAb9NREsBkKT2Wfb6FxH21OrJ8z4KDtXM=
X-Received: by 2002:ac2:44a6:0:b0:509:4aae:f2b1 with SMTP id
 c6-20020ac244a6000000b005094aaef2b1mr787458lfm.8.1700626425336; Tue, 21 Nov
 2023 20:13:45 -0800 (PST)
MIME-Version: 1.0
References: <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com>
 <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com>
 <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116012208-mutt-send-email-mst@kernel.org> <PH0PR12MB54811F4CE5686AE4BEA826C1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvU2sqVXAeEUykia2M-6rP1_nMemPH8eNZTEoHR0wUfog@mail.gmail.com> <PH0PR12MB5481FEDBA21656E29452AC78DCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481FEDBA21656E29452AC78DCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 22 Nov 2023 12:13:34 +0800
Message-ID: <CACGkMEudhoDfY2ZcuA3J0ww=9Pm7qcMRasvZ8CvBeGVL9SPMDw@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Wed, Nov 22, 2023 at 12:25=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, November 21, 2023 9:53 AM
> > On Thu, Nov 16, 2023 at 2:34=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Thursday, November 16, 2023 11:53 AM
> > > >
> > > > On Thu, Nov 16, 2023 at 05:28:19AM +0000, Parav Pandit wrote:
> > > > > You continue to want to overload admin commands for dual purpose,
> > > > > does
> > > > not make sense to me.
> > > >
> > > > dual -> as a transport and for migration? why can't they be used fo=
r
> > > > this? I was really hoping to cover these two cases when I proposed =
them.
> > > For following reasons.
> > >
> > > 1. migration needs incremental reads of only changed context between
> > > two reads
> >
> > This is wrong. We need to invent general facilities. I've pointed out s=
ufficient
> > issues, and what's more delta doesn't work for the following cases:
> >
> I disagree to your above comments. Please read below.
> It works.
>
> > 1) migration but fail the another try for migration
>
> When hypervisor wants to retry the migration, it invokes the DISCARD comm=
and present in v4.

Well, I've explained in your first version, your design introduce
unnecessary complexities:

1) there's no requirement for live migrate the device state, that is,
one or two rounds at most are sufficient
2) there's no much data that needs to be migrated

So it doesn't behave like RAM, having things like DISCARD might
complicate the implementation of both software and hardware.

> And starts reading the device context again.
>
> > 2) save vm state twice
> >
> This can be saved twice when needed.
>
> > It request a lot of tricks in hypervisor to do that (e.g cache the last=
 state?).
> Not really.
> Hypervisor can always discard what it read and re-read it again as fresh =
device context.

Why not leave the policy in the software?

>
> >
> > >
> > > 2. migration writes covers large part of the configurations not just =
virtio
> > common config and device config.
> >
> > You invent a duplication of common_cfg structure no?
> >
> Nop.
> Common configuration is written using a MMIO, byte/word etc boundary by t=
he guest directly in guest owned area.

We are discussing the function no?

>
> > What's wrong if we just allow them to be R/W over adminq/cmmands?
> >
> As explained before,
> Each guest has its own dedicated non mediated interface as defined in vir=
tio spec to not involve hypervisor.

So what's wrong with inventing per VF queue to do that? For example
transport virtqueue.

> This is uniform for PF and SR-IOV VFs.
> And it will be uniform for backward compatible SIOV tomorrow, one the per=
formance numbers for SIOV are available.
> For non-backward compatible SIOV, there is better way to not have such a =
large config space anyway.
>
> > > Such as configuration occurred through the CVQ. All of these is not n=
eeded
> > when done from guest directly via member's own CVQ.
> >
> > That's the device type specific state which requires new commands forsu=
re. I
> > don't see any connection. The SIOV device needs to be migrated as well.
> >
> And they will use all majority of the device context as presented here.
>
> > >
> > > For backward compatible SIOV transport, one may need them to transpor=
t
> > without above two properties.
> >
> > Why, just mediate between virtual PCI and adminq.
> >
> I don=E2=80=99t understand this.

I mean, in order to run "legacy" guest that can only recognize
virtio-pci, a hypervisor can mediate between it and transport.

>
> > >
> > > 3. None of this transport is needed for PFs, VFs and non-backward
> > compatible SIOVs.
> > > Each device to have its own transport that is not intercepted by the
> > hypervisor and follow the equivalency principle uniformly for all 3 dev=
ice types.
> >
> > You can have per VF transport q, what's wrong with that?
> As explained in the doc and in multiple emails, it is inefficient. CVQ is=
 just enough.

Let me repeat again, transport q is not intended to replace CVQ. Where
did you see or get such a wrong conclusion in the series of transport
q?

One of its goals is to have a transport where the register doesn't scale.

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

