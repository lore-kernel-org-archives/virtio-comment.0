Return-Path: <virtio-comment-return-8578-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478EFC61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:07:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 83F022CAD9
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:07:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 63B7F9868A7
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:07:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4B02D9865ED; Fri, 24 Nov 2023 03:07:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3AD169868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 03:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: E9HzGzyDMT6_Bhl6TzO14g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700795220; x=1701400020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwMgHcV/DKcPIuNb8/owH/rrmI5eK5SVtDjsUIfCBnI=;
        b=SZi/v+eWH4hI7kYZZN1hDuGZ1fNlBoYLhWDzHQEFRQ0gt9g9cKybTy+SLU9hbfFFI2
         wpU+NanjDxTETYOaKNSRWry+ZKdpc0KF841fpOZfgGTFZm6R3Zp4/EvUTblbv4x8G43e
         yED5hTEniakK87lbtDVV04mCO/X5yh0WT0kYgmJLG6OChrnRGLkWGeMxERcXBA7VE4DR
         z0WFLaR2VOSjw0fWadRZ/IRZJPn7v67PZLtU3klZfwxPwVUhi0UtZD/KVYDcgKopvY4f
         8aVfhlyC+Ucgf3i3X3NCoJTQ5so5K7jPBymCwzd1ttM8rpvQ9RaufPMhQbPyKFt5hlyy
         PF3w==
X-Gm-Message-State: AOJu0YwWYdfVbo+h9xaWWXRo/MWaYUtNC8ygYFlDFsPOkRdeaWo0FtoD
	bdCxSAJjYURPZCB6faJSiKwmtVh5cBU3pFXQvJz2sUsw1MDtKyojKJ+/EeNPhuGvp79u8bj1xZY
	RjJeIdKYz68HkVGkoF80n9GDck+jub5P8OJo29ozYl0LdEGBOGA==
X-Received: by 2002:a05:6512:3a84:b0:500:9a29:bcb8 with SMTP id q4-20020a0565123a8400b005009a29bcb8mr935035lfu.4.1700795220084;
        Thu, 23 Nov 2023 19:07:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/iqKkOCB3MQCE6izue9cW5eMAgEt+UHp6ef2no9GCg8bTY+gaRV5g3nu6XscIw/aUqUMkUxB7nCpOrsTyg18=
X-Received: by 2002:a05:6512:3a84:b0:500:9a29:bcb8 with SMTP id
 q4-20020a0565123a8400b005009a29bcb8mr935006lfu.4.1700795219361; Thu, 23 Nov
 2023 19:06:59 -0800 (PST)
MIME-Version: 1.0
References: <20231030131959.1386107-1-parav@nvidia.com> <20231030131959.1386107-7-parav@nvidia.com>
 <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com>
 <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-6Q1NQ9x=Mh_ek8ogLeZXiTMRgHwRk1Bt5Y0XWpQrQw@mail.gmail.com>
 <PH0PR12MB5481A67DD337E7AA76E0D59CDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsTyYX8mhgrSNP9NCc=FqHh8UN=hs374MV8QLMvZifH9w@mail.gmail.com> <PH0PR12MB548175FB534E92B0F10403F3DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548175FB534E92B0F10403F3DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 11:06:48 +0800
Message-ID: <CACGkMEuyG2zurvj1QcYpgZcJsiZsGUaPQJg5quHbaRgyhE4Z-w@mail.gmail.com>
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

On Wed, Nov 22, 2023 at 2:41=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, November 22, 2023 9:59 AM
> >
> > On Wed, Nov 22, 2023 at 12:31=E2=80=AFAM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, November 21, 2023 12:45 PM
> > > >
> > > > On Thu, Nov 16, 2023 at 1:30=E2=80=AFPM Parav Pandit <parav@nvidia.=
com>
> > wrote:
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Thursday, November 16, 2023 9:54 AM
> > > > > >
> > > > > > On Thu, Nov 16, 2023 at 1:39=E2=80=AFAM Parav Pandit <parav@nvi=
dia.com>
> > > > wrote:
> > > > > > >
> > > > > > >
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Monday, November 13, 2023 9:07 AM
> > > > > > > >
> > > > > > > > On Thu, Nov 9, 2023 at 2:25=E2=80=AFPM Parav Pandit
> > > > > > > > <parav@nvidia.com>
> > > > wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > Sent: Tuesday, November 7, 2023 9:34 AM
> > > > > > > > > >
> > > > > > > > > > On Mon, Nov 6, 2023 at 2:54=E2=80=AFPM Parav Pandit
> > > > > > > > > > <parav@nvidia.com>
> > > > > > wrote:
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > Sent: Monday, November 6, 2023 12:04 PM
> > > > > > > > > > > >
> > > > > > > > > > > > On Thu, Nov 2, 2023 at 2:10=E2=80=AFPM Parav Pandit
> > > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > > > Sent: Thursday, November 2, 2023 9:54 AM
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Wed, Nov 1, 2023 at 11:02=E2=80=AFAM Parav P=
andit
> > > > > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > > > wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > > > > > Sent: Wednesday, November 1, 2023 6:00 AM
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Tue, Oct 31, 2023 at 11:27=E2=80=AFAM Pa=
rav
> > > > > > > > > > > > > > > > Pandit <parav@nvidia.com>
> > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > > > > > > > Sent: Tuesday, October 31, 2023 7:13 AM
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > On Mon, Oct 30, 2023 at 9:21=E2=80=AFPM=
 Parav
> > > > > > > > > > > > > > > > > > Pandit <parav@nvidia.com>
> > > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > During a device migration flow
> > > > > > > > > > > > > > > > > > > (typically in a precopy phase of the
> > > > > > > > > > > > > > > > > > > live migration), a device may write t=
o the guest
> > memory.
> > > > > > > > > > > > > > > > > > > Some iommu/hypervisor may not be able
> > > > > > > > > > > > > > > > > > > to track these
> > > > > > > > > > > > > > written pages.
> > > > > > > > > > > > > > > > > > > These pages to be migrated from sourc=
e
> > > > > > > > > > > > > > > > > > > to destination
> > > > > > > > > > hypervisor.
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > A device which writes to these pages,
> > > > > > > > > > > > > > > > > > > provides the page address record of
> > > > > > > > > > > > > > > > > > > the to the owner
> > > > device.
> > > > > > > > > > > > > > > > > > > The owner device starts write
> > > > > > > > > > > > > > > > > > > recording for the device and queries
> > > > > > > > > > > > > > > > > > > all the page addresses written by the
> > > > > > > > device.
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > Fixes:
> > > > > > > > > > > > > > > > > > > https://github.com/oasis-tcs/virtio-s=
p
> > > > > > > > > > > > > > > > > > > ec/i
> > > > > > > > > > > > > > > > > > > ssue
> > > > > > > > > > > > > > > > > > > s/17
> > > > > > > > > > > > > > > > > > > 6
> > > > > > > > > > > > > > > > > > > Signed-off-by: Parav Pandit
> > > > > > > > > > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > > > > > > > > > > > > Signed-off-by: Satananda Burla
> > > > > > > > > > > > > > > > > > > <sburla@marvell.com>
> > > > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > > > > changelog:
> > > > > > > > > > > > > > > > > > > v1->v2:
> > > > > > > > > > > > > > > > > > > - addressed comments from Michael
> > > > > > > > > > > > > > > > > > > - replaced iova with physical address
> > > > > > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > > > > >  admin-cmds-device-migration.tex | 15
> > > > > > > > > > > > > > > > > > > +++++++++++++++
> > > > > > > > > > > > > > > > > > >  1 file changed, 15 insertions(+)
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > > > > > > a/admin-cmds-device-migration.tex
> > > > > > > > > > > > > > > > > > > b/admin-cmds-device-migration.tex
> > > > > > > > > > > > > > > > > > > index ed911e4..2e32f2c
> > > > > > > > > > > > > > > > > > > 100644
> > > > > > > > > > > > > > > > > > > --- a/admin-cmds-device-migration.tex
> > > > > > > > > > > > > > > > > > > +++ b/admin-cmds-device-migration.tex
> > > > > > > > > > > > > > > > > > > @@ -95,6 +95,21 @@
> > > > > > > > > > > > > > > > > > > \subsubsection{Device
> > > > > > > > > > > > > > > > > > > Migration}\label{sec:Basic Facilities
> > > > > > > > > > > > > > > > > > > of a Virtio Device / The owner driver
> > > > > > > > > > > > > > > > > > > can discard any partially read or
> > > > > > > > > > > > > > > > > > > written device context when  any of
> > > > > > > > > > > > > > > > > > > the device migration flow
> > > > > > > > > > > > > > > > > > should be aborted.
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > +During the device migration flow, a
> > > > > > > > > > > > > > > > > > > +passthrough device may write data to
> > > > > > > > > > > > > > > > > > > +the guest virtual machine's memory, =
a
> > > > > > > > > > > > > > > > > > > +source hypervisor needs to keep trac=
k
> > > > > > > > > > > > > > > > > > > +of these written memory to migrate
> > > > > > > > > > > > > > > > > > > +such memory to destination
> > > > > > > > > > > > > > > > > > hypervisor.
> > > > > > > > > > > > > > > > > > > +Some systems may not be able to keep
> > > > > > > > > > > > > > > > > > > +track of such memory write addresses
> > > > > > > > > > > > > > > > > > > +at hypervisor
> > > > level.
> > > > > > > > > > > > > > > > > > > +In such a scenario, a device records
> > > > > > > > > > > > > > > > > > > +and reports these written memory
> > > > > > > > > > > > > > > > > > > +addresses to the owner device. The
> > > > > > > > > > > > > > > > > > > +owner driver enables write recording
> > > > > > > > > > > > > > > > > > > +for one or more physical address
> > > > > > > > > > > > > > > > > > > +ranges per device during device
> > > > > > > > > > > > > > migration flow.
> > > > > > > > > > > > > > > > > > > +The owner driver periodically querie=
s
> > > > > > > > > > > > > > > > > > > +these written physical address
> > > > > > > > > > > > > > > > records from the device.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > I wonder how PA works in this case.
> > > > > > > > > > > > > > > > > > Device uses untranslated requests so it=
 can only see
> > IOVA.
> > > > > > > > > > > > > > > > > > We can't mandate
> > > > > > > > > > ATS anyhow.
> > > > > > > > > > > > > > > > > Michael suggested to keep the language
> > > > > > > > > > > > > > > > > uniform as PA as this is ultimately
> > > > > > > > > > > > > > > > what the guest driver is supplying during v=
q
> > > > > > > > > > > > > > > > creation and in posting buffers as physical=
 address.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > This seems to need some work. And, can you
> > > > > > > > > > > > > > > > show me how it can
> > > > > > > > > > work?
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > 1) e.g if GAW is 48 bit, is the hypervisor
> > > > > > > > > > > > > > > > expected to do a bisection of the whole ran=
ge?
> > > > > > > > > > > > > > > > 2) does the device need to reserve
> > > > > > > > > > > > > > > > sufficient internal resources for logging
> > > > > > > > > > > > > > > > the dirty page and why
> > > > (not)?
> > > > > > > > > > > > > > > No when dirty page logging starts, only at
> > > > > > > > > > > > > > > that time, device will reserve
> > > > > > > > > > > > > > enough resources.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > GAW is 48bit, how large would it have then?
> > > > > > > > > > > > > Dirty page tracking is not dependent on the size =
of the GAW.
> > > > > > > > > > > > > It is function of address ranges for the amount o=
f
> > > > > > > > > > > > > guest memory regardless of
> > > > > > > > > > > > GAW.
> > > > > > > > > > > >
> > > > > > > > > > > > The problem is, e.g when vIOMMU is enabled, you
> > > > > > > > > > > > can't know which IOVA is actually used by guests.
> > > > > > > > > > > > And even for the case when vIOMMU is not enabled,
> > > > > > > > > > > > the guest may have
> > > > several TBs.
> > > > > > > > > > > > Is it easy to reserve sufficient resources by the d=
evice itself?
> > > > > > > > > > > >
> > > > > > > > > > > When page tracking is enabled per device, it knows
> > > > > > > > > > > about the range and it can
> > > > > > > > > > reserve certain resource.
> > > > > > > > > >
> > > > > > > > > > I didn't see such an interface in this series. Anything=
 I miss?
> > > > > > > > > >
> > > > > > > > > Yes, this patch and the next patch is covering the page
> > > > > > > > > tracking start,stop and
> > > > > > > > query commands.
> > > > > > > > > They are named as write recording commands.
> > > > > > > >
> > > > > > > > So I still don't see how the device can reserve sufficient =
resources?
> > > > > > > > Guests may map a very large area of memory to IOMMU (or whe=
n
> > > > > > > > vIOMMU is disabled, GPA is used). It would be several TBs,
> > > > > > > > how can the device reserve sufficient resources in this cas=
e?
> > > > > > > When the map is established, the ranges are supplied to the
> > > > > > > device to know
> > > > > > how much to reserve.
> > > > > > > If device does not have enough resource, it fails the command=
.
> > > > > > >
> > > > > > > One can advance it further to provision for the desired range=
..
> > > > > >
> > > > > > Well, I think I've asked whether or not a bisection is needed,
> > > > > > and you told me not ...
> > > > > >
> > > > > > But at least we need to document this in the proposal, no?
> > > > > >
> > > > > We should expose a limit of the device in the proposed
> > > > WRITE_RECORD_CAP_QUERY command, that how much range it can track.
> > > > > So that future provisioning framework can use it.
> > > > >
> > > > > I will cover this in v5 early next week.
> > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > Btw, the IOVA is allocated by the guest actually, how
> > > > > > > > > > can we know the
> > > > > > > > range?
> > > > > > > > > > (or using the host range?)
> > > > > > > > > >
> > > > > > > > > Hypervisor would have mapping translation.
> > > > > > > >
> > > > > > > > That's really tricky and can only work in some cases:
> > > > > > > >
> > > > > > > > 1) It requires the hypervisor to traverse the guest I/O pag=
e
> > > > > > > > tables which could be very large range
> > > > > > > > 2) It requests the hypervisor to trap the modification of
> > > > > > > > guest I/O page tables and synchronize with the range
> > > > > > > > changes, which is inefficient and can only be done when we =
are
> > doing shadow PTEs.
> > > > > > > > It won't work when the nesting translation could be
> > > > > > > > offloaded to the hardware
> > > > > > > > 3) It is racy with the guest modification of I/O page table=
s
> > > > > > > > which is explained in another thread
> > > > > > > Mapping changes with more hw mmu's is not a frequent event an=
d
> > > > > > > IOTLB
> > > > > > flush is done using querying the dirty log for the smaller rang=
e.
> > > > > > >
> > > > > > > > 4) No aware of new features like PASID which has been
> > > > > > > > explained in another thread
> > > > > > > For all the pinned work with non sw based IOMMU, it is
> > > > > > > typically small
> > > > subset.
> > > > > > > PASID is guest controlled.
> > > > > >
> > > > > > Let's repeat my points:
> > > > > >
> > > > > > 1) vq1 use untranslated request with PASID1
> > > > > > 2) vq2 use untranslated request with PASID2
> > > > > >
> > > > > > Shouldn't we log PASID as well?
> > > > > >
> > > > > Possibly yes, either to request the tracking per PASID or to log =
the PASID.
> > > > > When in future PASID based VQ are supported, this part should be
> > > > extended.
> > > >
> > > > Who is going to do the extension? They are orthogonal features for =
sure.
> > > Whoever extends the VQ for PASID programming.
> > >
> > > I plan to have generic command for VQ creation over CVQ
> >
> > Another unrelated issue.
> I disagree.
>
> >
> > > for the wider use cases we discussed.
> >
> > CVQ might want a dedicated PASID.
> Why? For one off queue like that may be additional register because this =
is still bootstrap phase.

For many reasons. Hypervisor may want to control CVQ.

> But using that as argument point to generalize for rest of the queue is w=
rong.
>
> >
> > > It can have PASID parameter in future when one wants to add it.
> > >
> > > >
> > > > >
> > > > > > And
> > > > > >
> > > > > > 1) vq1 is using translated request
> > > > > > 2) vq2 is using untranslated request
> > > > > >
> > > >
> > > > How about this?
> > > How did driver program the device for vq1 to translated request and v=
q2 to
> > not.
> > > And for which use case?
> >
> > Again, it is allowed by the PCI spec, no? You've explained yourself tha=
t your
> > design needs to obey PCI spec.
> >
> How did the guest driver program this in the device?

It doesn't. When ATS is enabled, the device can use untranslated
requests as well as translated requests. No?

>
> > And, if you want to ask. for use case, there are handy:
> >
> > - ATS
> > - When IOMMU_PLATFORM is not negotiated
> > - MSI
> >
> So why and how driver did it differently for two vqs?

I hope this is your serious answer but it looks like it is not. It has
nothing to do with the driver.

Vq1 is doing DMA
Vq2 is doing MSI-X

>
> > Let's make sure the function of your proposal is correct before talking=
 about
> > any use cases.
> This proposal as nothing to do with vqs.

See above.

> It is simply that tracking does not involve PASID at the moment, and it c=
an be added in future.
>
> >
> > >
> > > >
> > > > >
> > > > > > How could we differ?
> > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > Host should always have more resources than device,
> > > > > > > > > > > > in that sense there could be several methods that
> > > > > > > > > > > > tries to utilize host memory instead of the one in
> > > > > > > > > > > > the device. I think we've discussed this when going
> > > > > > > > > > > > through the doc prepared
> > > > by Eugenio.
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > What happens if we're trying to migrate more th=
an 1
> > device?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > That is perfectly fine.
> > > > > > > > > > > > > Each device is updating its log of pages it wrote=
.
> > > > > > > > > > > > > The hypervisor is collecting their sum.
> > > > > > > > > > > >
> > > > > > > > > > > > See above.
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > 3) DMA is part of the transport, it's
> > > > > > > > > > > > > > > > natural to do logging there, why duplicate =
efforts in the
> > virtio layer?
> > > > > > > > > > > > > > > He he, you have funny comment.
> > > > > > > > > > > > > > > When an abstract facility is added to virtio
> > > > > > > > > > > > > > > you say to do in
> > > > > > > > transport.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > So it's not done in the general facility but
> > > > > > > > > > > > > > tied to the admin
> > > > part.
> > > > > > > > > > > > > > And we all know dirty page tracking is a
> > > > > > > > > > > > > > challenge and Eugenio has a good summary of
> > > > > > > > > > > > > > pros/cons. A revisit of those docs make me thin=
k
> > > > > > > > > > > > > > virtio is not the good place for doing that for
> > > > > > > > may reasons:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > 1) as stated, platform will evolve to be able t=
o
> > > > > > > > > > > > > > tracking dirty pages, actually, it has been
> > > > > > > > > > > > > > supported by a lot of major IOMMU vendors
> > > > > > > > > > > > >
> > > > > > > > > > > > > This is optional facility in virtio.
> > > > > > > > > > > > > Can you please point to the references? I don=E2=
=80=99t
> > > > > > > > > > > > > see it in the common Linux
> > > > > > > > > > > > kernel support for it.
> > > > > > > > > > > >
> > > > > > > > > > > > Note that when IOMMUFD is being proposed, dirty pag=
e
> > > > > > > > > > > > tracking is one of the major considerations.
> > > > > > > > > > > >
> > > > > > > > > > > > This is one recent proposal:
> > > > > > > > > > > >
> > > > > > > > > > > > https://www.spinics.net/lists/kvm/msg330894.html
> > > > > > > > > > > >
> > > > > > > > > > > Sure, so if platform supports it. it can be used from=
 the
> > platform.
> > > > > > > > > > > If it does not, the device supplies it.
> > > > > > > > > > >
> > > > > > > > > > > > > Instead Linux kernel choose to extend to the devi=
ces.
> > > > > > > > > > > >
> > > > > > > > > > > > Well, as I stated, tracking dirty pages is
> > > > > > > > > > > > challenging if you want to do it on a device, and
> > > > > > > > > > > > you can't simply invent dirty page tracking for eac=
h type of
> > the devices.
> > > > > > > > > > > >
> > > > > > > > > > > It is not invented.
> > > > > > > > > > > It is generic framework for all virtio device types a=
s proposed
> > here.
> > > > > > > > > > > Keep in mind, that it is optional already in v3 serie=
s.
> > > > > > > > > > >
> > > > > > > > > > > > > At least not seen to arrive this in any near term
> > > > > > > > > > > > > in start of
> > > > > > > > > > > > > 2024 which is
> > > > > > > > > > > > where users must use this.
> > > > > > > > > > > > >
> > > > > > > > > > > > > > 2) you can't assume virtio is the only device
> > > > > > > > > > > > > > that can be used by the guest, having dirty
> > > > > > > > > > > > > > pages tracking to be implemented in each type o=
f
> > > > > > > > > > > > > > device is unrealistic
> > > > > > > > > > > > > Of course, there is no such assumption made. Wher=
e
> > > > > > > > > > > > > did you see a text that
> > > > > > > > > > > > made such assumption?
> > > > > > > > > > > >
> > > > > > > > > > > > So what happens if you have a guest with virtio and
> > > > > > > > > > > > other devices
> > > > > > > > assigned?
> > > > > > > > > > > >
> > > > > > > > > > > What happens? Each device type would do its own dirty
> > > > > > > > > > > page
> > > > tracking.
> > > > > > > > > > > And if all devices does not have support, hypervisor
> > > > > > > > > > > knows to fall back to
> > > > > > > > > > platform iommu or its own.
> > > > > > > > > > >
> > > > > > > > > > > > > Each virtio and non virtio devices who wants to
> > > > > > > > > > > > > report their dirty page report,
> > > > > > > > > > > > will do their way.
> > > > > > > > > > > > >
> > > > > > > > > > > > > > 3) inventing it in the virtio layer will be
> > > > > > > > > > > > > > deprecated in the future for sure, as platform
> > > > > > > > > > > > > > will provide much rich features for logging e.g
> > > > > > > > > > > > > > it can do it per PASID etc, I don't see any
> > > > > > > > > > > > > > reason virtio need to compete with the features
> > > > > > > > > > > > > > that will be provided by the platform
> > > > > > > > > > > > > Can you bring the cpu vendors and committement to
> > > > > > > > > > > > > virtio tc with timelines
> > > > > > > > > > > > so that virtio TC can omit?
> > > > > > > > > > > >
> > > > > > > > > > > > Why do we need to bring CPU vendors in the virtio T=
C?
> > > > > > > > > > > > Virtio needs to be built on top of transport or
> > > > > > > > > > > > platform. There's no need to duplicate
> > > > > > > > > > their job.
> > > > > > > > > > > > Especially considering that virtio can't do better =
than them.
> > > > > > > > > > > >
> > > > > > > > > > > I wanted to see a strong commitment for the cpu
> > > > > > > > > > > vendors to support dirty
> > > > > > > > > > page tracking.
> > > > > > > > > >
> > > > > > > > > > The RFC of IOMMUFD support can go back to early 2022.
> > > > > > > > > > Intel, AMD and ARM are all supporting that now.
> > > > > > > > > >
> > > > > > > > > > > And the work seems to have started for some platforms=
.
> > > > > > > > > >
> > > > > > > > > > Let me quote from the above link:
> > > > > > > > > >
> > > > > > > > > > """
> > > > > > > > > > Today, AMD Milan (or more recent) supports it while ARM
> > > > > > > > > > SMMUv3.2 alongside VT-D rev3.x also do support.
> > > > > > > > > > """
> > > > > > > > > >
> > > > > > > > > > > Without such platform commitment, virtio also skippin=
g
> > > > > > > > > > > it would not
> > > > > > work.
> > > > > > > > > >
> > > > > > > > > > Is the above sufficient? I'm a little bit more familiar
> > > > > > > > > > with vtd, the hw feature has been there for years.
> > > > > > > > > >
> > > > > > > > > Vtd has a sticky D bit that requires synchronization with
> > > > > > > > > IOPTE page caches
> > > > > > > > when sw wants to clear it.
> > > > > > > >
> > > > > > > > This is by design.
> > > > > > > >
> > > > > > > > > Do you know if is it reliable when device does multiple
> > > > > > > > > writes, ie,
> > > > > > > > >
> > > > > > > > > a. iommu write D bit
> > > > > > > > > b. software read it
> > > > > > > > > c. sw synchronize cache
> > > > > > > > > d. iommu write D bit on next write by device
> > > > > > > >
> > > > > > > > What issue did you see here? But that's not even an excuse,
> > > > > > > > if there's a bug, let's report it to IOMMU vendors and let =
them fix it.
> > > > > > > > The thread I point to you is actually a good space.
> > > > > > > >
> > > > > > > So we cannot claim that it is there in the platform.
> > > > > >
> > > > > > I'm confused, the thread I point to you did the cache
> > > > > > synchronization which has been explained in the changelog, so
> > > > > > what's the
> > > > issue?
> > > > > >
> > > > > If the ask is for IOMMU chip to fix something, we cannot claim
> > > > > that dirty
> > > > page tracking is available already in platform.
> > > >
> > > > Again, can you describe the issue? Why do you think the sticky part
> > > > is an issue? IOTLB needs to be sync with IO page tables, what's wro=
ng with
> > this?
> > > Nothing wrong with it.
> > > The text is not affirmative to say it works if the sw clears it.
> > >
> > > >
> > > > >
> > > > > > >
> > > > > > > > Again, the point is to let the correct role play.
> > > > > > > >
> > > > > > > How many more years should we block the virtio device
> > > > > > > migration when
> > > > > > platform do not have it?
> > > > > >
> > > > > > At least for VT-D, it has been used for years.
> > > > > Is this device written pages tracked by KVM for VT-d as dirty pag=
e
> > > > > log,
> > > > instead through vfio?
> > > >
> > > > I don't get this question.
> > > You said the VT-d has dirty page tracking for years so it must be use=
d by the
> > sw during device migration.
> >
> > It's the best way if the platform has the support for that.
> >
> > > And if that is there, how is these dirty pages of iommu are merged wi=
th the
> > cpu side?
> > > Is this done by KVM for passthrough devices for vfio?
> >
> > I don't see how it is related to the discussion here. IOMMU support is
> > sufficient as a start. If you requires CPU support, virtio is clearly t=
he wrong
> > forum.
> You made point that VT-d dirty tracking is in use for years.
> I am asking how kernel consumed it for passthrough devices like vfio?

I've shown you the RFC in the past, and I've explained why it is
delayed because of the work of IOMMUFD. What else do you want?

Where is the code of supporting TDISP in the kernel? Is it supported
by any kernel now?

[...]

> > It helps the reviewers, it doesn't harm to have a summary in the change=
log. Or
> > people may ask the same questions endlessly.
> >
> At least the current reviewers who discussed should stop asking endlessly=
. :)
>

It's just because you still didn't explain it. Is this kind of summary
somewhere in V4?

> > >
> > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > > There is no requirement for mandating PRI either.
> > > > > > > > > > > > > So it is unusable.
> > > > > > > > > > > >
> > > > > > > > > > > > It's not about mandating, it's about doing things i=
n
> > > > > > > > > > > > the correct layer. If PRI is slow, PCI can evolve f=
or sure.
> > > > > > > > > > > You should try.
> > > > > > > > > >
> > > > > > > > > > Not my duty, I just want to make sure things are done i=
n
> > > > > > > > > > the correct layer, and once it needs to be done in the
> > > > > > > > > > virtio, there's nothing obviously
> > > > > > > > wrong.
> > > > > > > > > >
> > > > > > > > > At present, it looks all platforms are not equally ready
> > > > > > > > > for page
> > > > tracking.
> > > > > > > >
> > > > > > > > That's not an excuse to let virtio support that.
> > > > > > > It is wrong attribution as excuse.
> > > > > > >
> > > > > > > > And we need also to figure out if virtio can do that easily=
.
> > > > > > > > I've pointed out sufficient issues, I'm pretty sure there
> > > > > > > > would be more as the platform evolves.
> > > > > > > >
> > > > > > > I am not sure if virtio feeds the log into the platform.
> > > > > >
> > > > > > I don't understand the meaning here.
> > > > > >
> > > > > I mistakenly merged two sentences.
> > > > >
> > > > > Virtio feeds the dirty page details to the hypervisor platform
> > > > > which collects
> > > > and merges the page record.
> > > > > So it is platform choice to use iommu based tracking or device ba=
sed.
> > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > > In the current state, it is mandating.
> > > > > > > > > > > And if you think PRI is the only way,
> > > > > > > > > >
> > > > > > > > > > I don't, it's just an example where virtio can leverage
> > > > > > > > > > from either transport or platform. Or if it's the fault
> > > > > > > > > > in virtio that slows down the PRI, then it is something=
 we can do.
> > > > > > > > > >
> > > > > > > > > Yea, it does not seem to be ready yet.
> > > > > > > > >
> > > > > > > > > > >  than you should propose that in the dirty page
> > > > > > > > > > > tracking series that you listed
> > > > > > > > > > above to not do dirty page tracking. Rather depend on P=
RI, right?
> > > > > > > > > >
> > > > > > > > > > No, the point is to not duplicate works especially
> > > > > > > > > > considering virtio can't do better than platform or tra=
nsport.
> > > > > > > > > >
> > > > > > > > > Both the platform and virtio work is ongoing.
> > > > > > > >
> > > > > > > > Why duplicate the work then?
> > > > > > > >
> > > > > > > Not all cpu platforms support as far as I know.
> > > > > >
> > > > > > Yes, but we all know the platform is working to support this.
> > > > > >
> > > > > > Supporting this on the device is hard.
> > > > > >
> > > > > This is optional, whichever device would like to implement it, wi=
ll support
> > it.
> > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > When one does something in transport, you say=
,
> > > > > > > > > > > > > > > this is transport specific, do
> > > > > > > > > > > > > > some generic.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Here the device is being tracked is virtio de=
vice.
> > > > > > > > > > > > > > > PCI-SIG has told already that PCIM interface
> > > > > > > > > > > > > > > is outside the scope of
> > > > > > > > it.
> > > > > > > > > > > > > > > Hence, this is done in virtio layer here in a=
bstract way.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > You will end up with a competition with the
> > > > > > > > > > > > > > platform/transport one that will fail.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > I don=E2=80=99t see a reason. There is no competi=
tion.
> > > > > > > > > > > > > Platform always have a choice to not use device
> > > > > > > > > > > > > side page tracking when it is
> > > > > > > > > > > > supported.
> > > > > > > > > > > >
> > > > > > > > > > > > Platform provides a lot of other functionalities fo=
r dirty
> > logging:
> > > > > > > > > > > > e.g per PASID, granular, etc. So you want to
> > > > > > > > > > > > duplicate them again in the virtio? If not, why cho=
ose this
> > way?
> > > > > > > > > > > >
> > > > > > > > > > > It is optional for the platforms where platform do no=
t have it.
> > > > > > > > > >
> > > > > > > > > > We are developing new virtio functionalities that are
> > > > > > > > > > targeted for future platforms. Otherwise we would end u=
p
> > > > > > > > > > with a feature with a very narrow use case.
> > > > > > > > > In general I agree that platform is an option too.
> > > > > > > > > Hypervisor will be able to make the decision to use
> > > > > > > > > platform when available
> > > > > > > > and fallback to device method when platform does not have i=
t.
> > > > > > > > >
> > > > > > > > > Future and to be equally usable in near term :)
> > > > > > > >
> > > > > > > > Please don't double standard again:
> > > > > > > >
> > > > > > > > When you are talking about TDISP, you want virtio to be
> > > > > > > > designed to fit for the future where the platform is ready
> > > > > > > > in the future When you are talking about dirty tracking, yo=
u
> > > > > > > > want it to work now even if
> > > > > > > >
> > > > > > > The proposal of transport VQ is anti-TDISP.
> > > > > >
> > > > > > It's nothing about transport VQ, it's about you're saying the
> > > > > > adminq based device context. There's a comment to point out tha=
t
> > > > > > the current TDISP spec forbids modifying device state when TVM
> > > > > > is attached. Then you told us the TDISP may evolve for that.
> > > > > So? That is not double standard.
> > > > > The proposal is based on main principle that it is not depending
> > > > > on hypervisor traping + emulating which is the baseline of TDISP
> > > > >
> > > > > >
> > > > > > > The proposal of dirty tracking is not anti-platform. It is
> > > > > > > optional like rest of the
> > > > > > platform.
> > > > > > >
> > > > > > > > 1) most of the platform is ready now
> > > > > > > Can you list a ARM server CPU in production that has it? (not
> > > > > > > in some pdf
> > > > > > spec).
> > > > > >
> > > > > > Then in the context of a dirty page, I've proved you dirty page
> > > > > > tracking has been supported by all major vendors.
> > > > > Major IP vendor !=3D major cpu chip vendor.
> > > > > I don=E2=80=99t agree with the proof.
> > > >
> > > > So this will be an endless debate. Did I ever ask you about ETA or
> > > > any product for TDISP?
> > > >
> > > ETA for TDISP is not relevant.
> > > You claimed for _major_ vendor support based on nonphysical cpu, henc=
e
> > the disagreement.
> >
> > How did you define "support"?
> >
> You defined that it is supported. So, I think you deserve to define "supp=
ort". :)

Support in the spec. If you don't think it can be called "support".
Please explain why.

>
> > Dirty tracking has been wroted into the IOMMU manual for Intel, AMD and
> > ARM for years. So you think it's not supported now? I've told you it ha=
s been
> > shipped by Intel at least then you ask me which ARM vendor ships those
> > vIOMMU.
> >
> I wish that spec manual date =3D server in the cloud operator data center=
 availability date.

Any new feature needs time to land. So do the live migration. You are
doubling the standard again.

>
> > For TDISP live migration, PCI doesn't even have a draft, no? I never as=
k which
> > chip vendor ships the platform.
> >
>
> > You want to support dirty page tracking in virtio and keep asking when =
it is
> > supported by all platform vendors.
> Because you claim that all physical cpu vendors support it without enlist=
ing who is 'all' and 'major'.

Major means Intel, AMD and ARM. Does it sound good?

>
> >
> > You want to prove your proposal can work for TDISP and TDISP migration =
but
> > never explain when it would be supported by at least one vendor.
> >
> Part of the spec work is done keeping s

What's the meaning of this?

> > Let's have a unified standard please.
> The standard is unified.
> The base line tenet in the proposal is not put any interface on the TDISP=
 itself for migration that needs to be accessed by some other entity.

Can you explain why we can wait for the platform support for TDISP but
not dirty page tracking?

>
> >
> > > And that is not the reality.
> > >
> > > > >
> > > > > I already acknowledged that I have seen internal test report for
> > > > > dirty tracking
> > > > with one cpu and nic.
> > > > >
> > > > > I just don=E2=80=99t see all cpus have support for it.
> > > > > Hence, this optional feature.
> > > >
> > > > Repeat myself again.
> > > >
> > > > If it can be done easily and efficiently in virtio, I agree. But
> > > > I've pointed out several issues where it is not answered.
> > >
> > > I have answered most of your questions.
> > >
> > > The definition of 'easy' is very subjective.
> >
> > The reason why I don't think it is easy is because I can easily see sev=
eral issues
> > that can't be solved easily.
> >
> > > At one point RSS was also not easy in some devices and IOMMU dirty pa=
ge
> > tracking was also not easy.
> >
> > Yes, but we can offload the IOMMU part to the vendor. Virtio can't do
> > anything especially the part that duplicates with the function provided=
 by the
> > transport or platform.
> And when platform does not provide, virtio device can.

Platform doesn't support TDISP now, why don't you invent that?

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

