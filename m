Return-Path: <virtio-comment-return-8378-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6BFC197A0
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 04:24:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C542E7410D
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 04:24:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A987F986DD4
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 04:24:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9208F986DCB; Thu, 16 Nov 2023 04:24:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 82E7A986DCC
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 04:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: fe9NHeG9MyGv4ewaUrBEtQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700108646; x=1700713446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+aK5iHoW2MYNqRJwlY0TRaFX+ddN5E7pBO/MJABpts=;
        b=VQ72iCnERvtNV+5e9VpHLAsMqjaCMzl45abOH4vhp7Gpz6CMfXYkfuoJ99TzgSJ1hO
         2cjX7HFnrWaW0jwf8p4Skqrwoxaf5haQPy5h0RU3TSPg4UfeO6dv4T2JOpVwAulPoWOS
         7K8X8JbeoI4pzSU9zchSPo3p4AxZnxyD0uY21TX4jfgtiwegnSqSNpT8qAgPuoH5J9Wi
         h0E4MmBQw4h7ZOWt2p3ewnE11sAQZG7jueM1hbdFhzCoufB1bQk0Eoo4XZZzZJU6Hxgc
         hNiMTMuviEwpTgoeOeQGz2EFl7apTxEw2J70kR76oO6yNH4Q35Am63lRrs/KDefXXYuG
         bkeQ==
X-Gm-Message-State: AOJu0Yz10WBsc6PbyhiIeR/njwQmK1rKl/mHrqYeX6v2elHTNuh+4lPm
	WeAkopV69b2xVInwHMbxPn9w5mo29Hq+ihKF8nTruEM+CxiEg0VNTy6QDlk3zxyMOKKGjYXEom7
	csSHUGoAi8W+tpNBmU1Ii2Zjk9oM+/G7ZBOoViPxahxzzuUrpQQ==
X-Received: by 2002:a05:6512:128c:b0:503:2941:3a14 with SMTP id u12-20020a056512128c00b0050329413a14mr225092lfs.27.1700108645568;
        Wed, 15 Nov 2023 20:24:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoRfxLN/+n4K+Uh9FwmZKJjXSlPA2rezHKIvkzBgOwS4H1AWyKczUIn3zrJqyrUSQM/KpfMrK3egziQnIHz1c=
X-Received: by 2002:a05:6512:128c:b0:503:2941:3a14 with SMTP id
 u12-20020a056512128c00b0050329413a14mr225087lfs.27.1700108645012; Wed, 15 Nov
 2023 20:24:05 -0800 (PST)
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
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com> <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 16 Nov 2023 12:23:53 +0800
Message-ID: <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
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

On Thu, Nov 16, 2023 at 1:39=E2=80=AFAM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, November 13, 2023 9:07 AM
> >
> > On Thu, Nov 9, 2023 at 2:25=E2=80=AFPM Parav Pandit <parav@nvidia.com> =
wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, November 7, 2023 9:34 AM
> > > >
> > > > On Mon, Nov 6, 2023 at 2:54=E2=80=AFPM Parav Pandit <parav@nvidia.c=
om> wrote:
> > > > >
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Monday, November 6, 2023 12:04 PM
> > > > > >
> > > > > > On Thu, Nov 2, 2023 at 2:10=E2=80=AFPM Parav Pandit <parav@nvid=
ia.com>
> > wrote:
> > > > > > >
> > > > > > >
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Thursday, November 2, 2023 9:54 AM
> > > > > > > >
> > > > > > > > On Wed, Nov 1, 2023 at 11:02=E2=80=AFAM Parav Pandit
> > > > > > > > <parav@nvidia.com>
> > > > wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > Sent: Wednesday, November 1, 2023 6:00 AM
> > > > > > > > > >
> > > > > > > > > > On Tue, Oct 31, 2023 at 11:27=E2=80=AFAM Parav Pandit
> > > > > > > > > > <parav@nvidia.com>
> > > > > > wrote:
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > Sent: Tuesday, October 31, 2023 7:13 AM
> > > > > > > > > > > >
> > > > > > > > > > > > On Mon, Oct 30, 2023 at 9:21=E2=80=AFPM Parav Pandi=
t
> > > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > During a device migration flow (typically in a
> > > > > > > > > > > > > precopy phase of the live migration), a device ma=
y
> > > > > > > > > > > > > write to the guest memory. Some iommu/hypervisor
> > > > > > > > > > > > > may not be able to track these
> > > > > > > > written pages.
> > > > > > > > > > > > > These pages to be migrated from source to
> > > > > > > > > > > > > destination
> > > > hypervisor.
> > > > > > > > > > > > >
> > > > > > > > > > > > > A device which writes to these pages, provides th=
e
> > > > > > > > > > > > > page address record of the to the owner device.
> > > > > > > > > > > > > The owner device starts write recording for the
> > > > > > > > > > > > > device and queries all the page addresses written=
 by the
> > device.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Fixes:
> > > > > > > > > > > > > https://github.com/oasis-tcs/virtio-spec/issues/1=
7
> > > > > > > > > > > > > 6
> > > > > > > > > > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > > > > > > > > > Signed-off-by: Satananda Burla
> > > > > > > > > > > > > <sburla@marvell.com>
> > > > > > > > > > > > > ---
> > > > > > > > > > > > > changelog:
> > > > > > > > > > > > > v1->v2:
> > > > > > > > > > > > > - addressed comments from Michael
> > > > > > > > > > > > > - replaced iova with physical address
> > > > > > > > > > > > > ---
> > > > > > > > > > > > >  admin-cmds-device-migration.tex | 15
> > > > > > > > > > > > > +++++++++++++++
> > > > > > > > > > > > >  1 file changed, 15 insertions(+)
> > > > > > > > > > > > >
> > > > > > > > > > > > > diff --git a/admin-cmds-device-migration.tex
> > > > > > > > > > > > > b/admin-cmds-device-migration.tex index
> > > > > > > > > > > > > ed911e4..2e32f2c
> > > > > > > > > > > > > 100644
> > > > > > > > > > > > > --- a/admin-cmds-device-migration.tex
> > > > > > > > > > > > > +++ b/admin-cmds-device-migration.tex
> > > > > > > > > > > > > @@ -95,6 +95,21 @@ \subsubsection{Device
> > > > > > > > > > > > > Migration}\label{sec:Basic Facilities of a Virtio
> > > > > > > > > > > > > Device / The owner driver can discard any
> > > > > > > > > > > > > partially read or written device context when  an=
y
> > > > > > > > > > > > > of the device migration flow
> > > > > > > > > > > > should be aborted.
> > > > > > > > > > > > >
> > > > > > > > > > > > > +During the device migration flow, a passthrough
> > > > > > > > > > > > > +device may write data to the guest virtual
> > > > > > > > > > > > > +machine's memory, a source hypervisor needs to
> > > > > > > > > > > > > +keep track of these written memory to migrate
> > > > > > > > > > > > > +such memory to destination
> > > > > > > > > > > > hypervisor.
> > > > > > > > > > > > > +Some systems may not be able to keep track of
> > > > > > > > > > > > > +such memory write addresses at hypervisor level.
> > > > > > > > > > > > > +In such a scenario, a device records and reports
> > > > > > > > > > > > > +these written memory addresses to the owner
> > > > > > > > > > > > > +device. The owner driver enables write recording
> > > > > > > > > > > > > +for one or more physical address ranges per
> > > > > > > > > > > > > +device during device
> > > > > > > > migration flow.
> > > > > > > > > > > > > +The owner driver periodically queries these
> > > > > > > > > > > > > +written physical address
> > > > > > > > > > records from the device.
> > > > > > > > > > > >
> > > > > > > > > > > > I wonder how PA works in this case. Device uses
> > > > > > > > > > > > untranslated requests so it can only see IOVA. We
> > > > > > > > > > > > can't mandate
> > > > ATS anyhow.
> > > > > > > > > > > Michael suggested to keep the language uniform as PA
> > > > > > > > > > > as this is ultimately
> > > > > > > > > > what the guest driver is supplying during vq creation
> > > > > > > > > > and in posting buffers as physical address.
> > > > > > > > > >
> > > > > > > > > > This seems to need some work. And, can you show me how
> > > > > > > > > > it can
> > > > work?
> > > > > > > > > >
> > > > > > > > > > 1) e.g if GAW is 48 bit, is the hypervisor expected to
> > > > > > > > > > do a bisection of the whole range?
> > > > > > > > > > 2) does the device need to reserve sufficient internal
> > > > > > > > > > resources for logging the dirty page and why (not)?
> > > > > > > > > No when dirty page logging starts, only at that time,
> > > > > > > > > device will reserve
> > > > > > > > enough resources.
> > > > > > > >
> > > > > > > > GAW is 48bit, how large would it have then?
> > > > > > > Dirty page tracking is not dependent on the size of the GAW.
> > > > > > > It is function of address ranges for the amount of guest
> > > > > > > memory regardless of
> > > > > > GAW.
> > > > > >
> > > > > > The problem is, e.g when vIOMMU is enabled, you can't know whic=
h
> > > > > > IOVA is actually used by guests. And even for the case when
> > > > > > vIOMMU is not enabled, the guest may have several TBs. Is it
> > > > > > easy to reserve sufficient resources by the device itself?
> > > > > >
> > > > > When page tracking is enabled per device, it knows about the rang=
e
> > > > > and it can
> > > > reserve certain resource.
> > > >
> > > > I didn't see such an interface in this series. Anything I miss?
> > > >
> > > Yes, this patch and the next patch is covering the page tracking star=
t,stop and
> > query commands.
> > > They are named as write recording commands.
> >
> > So I still don't see how the device can reserve sufficient resources?
> > Guests may map a very large area of memory to IOMMU (or when vIOMMU is
> > disabled, GPA is used). It would be several TBs, how can the device res=
erve
> > sufficient resources in this case?
> When the map is established, the ranges are supplied to the device to kno=
w how much to reserve.
> If device does not have enough resource, it fails the command.
>
> One can advance it further to provision for the desired range..

Well, I think I've asked whether or not a bisection is needed, and you
told me not ...

But at least we need to document this in the proposal, no?

> >
> > >
> > > > Btw, the IOVA is allocated by the guest actually, how can we know t=
he
> > range?
> > > > (or using the host range?)
> > > >
> > > Hypervisor would have mapping translation.
> >
> > That's really tricky and can only work in some cases:
> >
> > 1) It requires the hypervisor to traverse the guest I/O page tables whi=
ch could
> > be very large range
> > 2) It requests the hypervisor to trap the modification of guest I/O pag=
e tables
> > and synchronize with the range changes, which is inefficient and can on=
ly be
> > done when we are doing shadow PTEs. It won't work when the nesting
> > translation could be offloaded to the hardware
> > 3) It is racy with the guest modification of I/O page tables which is e=
xplained in
> > another thread
> Mapping changes with more hw mmu's is not a frequent event and IOTLB flus=
h is done using querying the dirty log for the smaller range.
>
> > 4) No aware of new features like PASID which has been explained in anot=
her
> > thread
> For all the pinned work with non sw based IOMMU, it is typically small su=
bset.
> PASID is guest controlled.

Let's repeat my points:

1) vq1 use untranslated request with PASID1
2) vq2 use untranslated request with PASID2

Shouldn't we log PASID as well?

And

1) vq1 is using translated request
2) vq2 is using untranslated request

How could we differ?

>
> >
> > >
> > > > >
> > > > > > Host should always have more resources than device, in that
> > > > > > sense there could be several methods that tries to utilize host
> > > > > > memory instead of the one in the device. I think we've discusse=
d
> > > > > > this when going through the doc prepared by Eugenio.
> > > > > >
> > > > > > >
> > > > > > > > What happens if we're trying to migrate more than 1 device?
> > > > > > > >
> > > > > > > That is perfectly fine.
> > > > > > > Each device is updating its log of pages it wrote.
> > > > > > > The hypervisor is collecting their sum.
> > > > > >
> > > > > > See above.
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > 3) DMA is part of the transport, it's natural to do
> > > > > > > > > > logging there, why duplicate efforts in the virtio laye=
r?
> > > > > > > > > He he, you have funny comment.
> > > > > > > > > When an abstract facility is added to virtio you say to d=
o in
> > transport.
> > > > > > > >
> > > > > > > > So it's not done in the general facility but tied to the ad=
min part.
> > > > > > > > And we all know dirty page tracking is a challenge and
> > > > > > > > Eugenio has a good summary of pros/cons. A revisit of those
> > > > > > > > docs make me think virtio is not the good place for doing t=
hat for
> > may reasons:
> > > > > > > >
> > > > > > > > 1) as stated, platform will evolve to be able to tracking
> > > > > > > > dirty pages, actually, it has been supported by a lot of
> > > > > > > > major IOMMU vendors
> > > > > > >
> > > > > > > This is optional facility in virtio.
> > > > > > > Can you please point to the references? I don=E2=80=99t see i=
t in the
> > > > > > > common Linux
> > > > > > kernel support for it.
> > > > > >
> > > > > > Note that when IOMMUFD is being proposed, dirty page tracking i=
s
> > > > > > one of the major considerations.
> > > > > >
> > > > > > This is one recent proposal:
> > > > > >
> > > > > > https://www.spinics.net/lists/kvm/msg330894.html
> > > > > >
> > > > > Sure, so if platform supports it. it can be used from the platfor=
m.
> > > > > If it does not, the device supplies it.
> > > > >
> > > > > > > Instead Linux kernel choose to extend to the devices.
> > > > > >
> > > > > > Well, as I stated, tracking dirty pages is challenging if you
> > > > > > want to do it on a device, and you can't simply invent dirty
> > > > > > page tracking for each type of the devices.
> > > > > >
> > > > > It is not invented.
> > > > > It is generic framework for all virtio device types as proposed h=
ere.
> > > > > Keep in mind, that it is optional already in v3 series.
> > > > >
> > > > > > > At least not seen to arrive this in any near term in start of
> > > > > > > 2024 which is
> > > > > > where users must use this.
> > > > > > >
> > > > > > > > 2) you can't assume virtio is the only device that can be
> > > > > > > > used by the guest, having dirty pages tracking to be
> > > > > > > > implemented in each type of device is unrealistic
> > > > > > > Of course, there is no such assumption made. Where did you se=
e
> > > > > > > a text that
> > > > > > made such assumption?
> > > > > >
> > > > > > So what happens if you have a guest with virtio and other devic=
es
> > assigned?
> > > > > >
> > > > > What happens? Each device type would do its own dirty page tracki=
ng.
> > > > > And if all devices does not have support, hypervisor knows to fal=
l
> > > > > back to
> > > > platform iommu or its own.
> > > > >
> > > > > > > Each virtio and non virtio devices who wants to report their
> > > > > > > dirty page report,
> > > > > > will do their way.
> > > > > > >
> > > > > > > > 3) inventing it in the virtio layer will be deprecated in
> > > > > > > > the future for sure, as platform will provide much rich
> > > > > > > > features for logging e.g it can do it per PASID etc, I don'=
t
> > > > > > > > see any reason virtio need to compete with the features tha=
t
> > > > > > > > will be provided by the platform
> > > > > > > Can you bring the cpu vendors and committement to virtio tc
> > > > > > > with timelines
> > > > > > so that virtio TC can omit?
> > > > > >
> > > > > > Why do we need to bring CPU vendors in the virtio TC? Virtio
> > > > > > needs to be built on top of transport or platform. There's no
> > > > > > need to duplicate
> > > > their job.
> > > > > > Especially considering that virtio can't do better than them.
> > > > > >
> > > > > I wanted to see a strong commitment for the cpu vendors to suppor=
t
> > > > > dirty
> > > > page tracking.
> > > >
> > > > The RFC of IOMMUFD support can go back to early 2022. Intel, AMD an=
d
> > > > ARM are all supporting that now.
> > > >
> > > > > And the work seems to have started for some platforms.
> > > >
> > > > Let me quote from the above link:
> > > >
> > > > """
> > > > Today, AMD Milan (or more recent) supports it while ARM SMMUv3.2
> > > > alongside VT-D rev3.x also do support.
> > > > """
> > > >
> > > > > Without such platform commitment, virtio also skipping it would n=
ot work.
> > > >
> > > > Is the above sufficient? I'm a little bit more familiar with vtd,
> > > > the hw feature has been there for years.
> > > >
> > > Vtd has a sticky D bit that requires synchronization with IOPTE page =
caches
> > when sw wants to clear it.
> >
> > This is by design.
> >
> > > Do you know if is it reliable when device does multiple writes, ie,
> > >
> > > a. iommu write D bit
> > > b. software read it
> > > c. sw synchronize cache
> > > d. iommu write D bit on next write by device
> >
> > What issue did you see here? But that's not even an excuse, if there's =
a bug,
> > let's report it to IOMMU vendors and let them fix it. The thread I poin=
t to you is
> > actually a good space.
> >
> So we cannot claim that it is there in the platform.

I'm confused, the thread I point to you did the cache synchronization
which has been explained in the changelog, so what's the issue?

>
> > Again, the point is to let the correct role play.
> >
> How many more years should we block the virtio device migration when plat=
form do not have it?

At least for VT-D, it has been used for years.

>
> > >
> > > ARM SMMU based servers to be present with D bit tracking.
> > > It is still early to say platform is ready.
> >
> > This is not what I read from both the series I posted and the spec, dir=
ty bit has
> > been supported several years ago at least for vtd.
> Supported, but spec listed it as sticky bit that may require special hand=
ling.

Please explain why this is "special handling". IOMMU has several
different layers of caching, by design, it can't just open a window
for D bit.

> May be it is working, but not all cpu platforms have it.

I don't see the point. Migration is not supported for virito as well.

>
> >
> > >
> > > It is optional so whichever has the support it will be used.
> >
> > I can't see the point of this, it is already available. And migration d=
oesn't exist in
> > virtio spec yet.
> >
> > >
> > > > >
> > > > > > > i.e. in first year of 2024?
> > > > > >
> > > > > > Why does it matter in 2024?
> > > > > Because users needs to use it now.
> > > > >
> > > > > >
> > > > > > > If not, we are better off to offer this, and when/if platform
> > > > > > > support is, sure,
> > > > > > this feature can be disabled/not used/not enabled.
> > > > > > >
> > > > > > > > 4) if the platform support is missing, we can use software
> > > > > > > > or leverage transport for assistance like PRI
> > > > > > > All of these are in theory.
> > > > > > > Our experiment shows PRI performance is 21x slower than page
> > > > > > > fault rate
> > > > > > done by the cpu.
> > > > > > > It simply does not even pass a simple 10Gbps test.
> > > > > >
> > > > > > If you stick to the wire speed during migration, it can converg=
e.
> > > > > Do you have perf data for this?
> > > >
> > > > No, but it's not hard to imagine the worst case. Wrote a small
> > > > program that dirty every page by a NIC.
> > > >
> > > > > In the internal tests we don=E2=80=99t see this happening.
> > > >
> > > > downtime =3D dirty_rates * PAGE_SIZE / migration_speed
> > > >
> > > > So if we get very high dirty rates (e.g by a high speed NIC), we
> > > > can't satisfy the requirement of the downtime. Or if you see the
> > > > converge, you might get help from the auto converge support by the
> > > > hypervisors like KVM where it tries to throttle the VCPU then you c=
an't reach
> > the wire speed.
> > > >
> > > Once PRI is enabled, even without migration, there is basic perf issu=
es.
> >
> > The context is not PRI here...
> >
> > It's about if you can stick to wire speed during live migration. Based =
on the
> > analysis so far, you can't achieve wirespeed and downtime at the same t=
ime.
> > That's why the hypervisor needs to throttle VCPU or devices.
> >
> So?
> Device also may throttle itself.

That's perfectly fine. We are on the same page, no? It's wrong to
judge the dirty page tracking in the context of live migration by
measuring whether or not the device can work at wire speed.

>
> > For PRI, it really depends on how you want to use it. E.g if you don't =
want to pin
> > a page, the performance is the price you must pay.
> PRI without pinning does not make sense for device to make large mapping =
queries.

That's also fine. Hypervisors can choose to enable and use PRI
depending on the different cases.

>
> >
> > >
> > > > >
> > > > > >
> > > > > > > There is no requirement for mandating PRI either.
> > > > > > > So it is unusable.
> > > > > >
> > > > > > It's not about mandating, it's about doing things in the correc=
t
> > > > > > layer. If PRI is slow, PCI can evolve for sure.
> > > > > You should try.
> > > >
> > > > Not my duty, I just want to make sure things are done in the correc=
t
> > > > layer, and once it needs to be done in the virtio, there's nothing =
obviously
> > wrong.
> > > >
> > > At present, it looks all platforms are not equally ready for page tra=
cking.
> >
> > That's not an excuse to let virtio support that.
> It is wrong attribution as excuse.
>
> > And we need also to figure out if
> > virtio can do that easily. I've pointed out sufficient issues, I'm pret=
ty sure there
> > would be more as the platform evolves.
> >
> I am not sure if virtio feeds the log into the platform.

I don't understand the meaning here.

>
> > >
> > > > > In the current state, it is mandating.
> > > > > And if you think PRI is the only way,
> > > >
> > > > I don't, it's just an example where virtio can leverage from either
> > > > transport or platform. Or if it's the fault in virtio that slows
> > > > down the PRI, then it is something we can do.
> > > >
> > > Yea, it does not seem to be ready yet.
> > >
> > > > >  than you should propose that in the dirty page tracking series
> > > > > that you listed
> > > > above to not do dirty page tracking. Rather depend on PRI, right?
> > > >
> > > > No, the point is to not duplicate works especially considering
> > > > virtio can't do better than platform or transport.
> > > >
> > > Both the platform and virtio work is ongoing.
> >
> > Why duplicate the work then?
> >
> Not all cpu platforms support as far as I know.

Yes, but we all know the platform is working to support this.

Supporting this on the device is hard.

>
> > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > > When one does something in transport, you say, this is
> > > > > > > > > transport specific, do
> > > > > > > > some generic.
> > > > > > > > >
> > > > > > > > > Here the device is being tracked is virtio device.
> > > > > > > > > PCI-SIG has told already that PCIM interface is outside t=
he scope of
> > it.
> > > > > > > > > Hence, this is done in virtio layer here in abstract way.
> > > > > > > >
> > > > > > > > You will end up with a competition with the
> > > > > > > > platform/transport one that will fail.
> > > > > > > >
> > > > > > > I don=E2=80=99t see a reason. There is no competition.
> > > > > > > Platform always have a choice to not use device side page
> > > > > > > tracking when it is
> > > > > > supported.
> > > > > >
> > > > > > Platform provides a lot of other functionalities for dirty logg=
ing:
> > > > > > e.g per PASID, granular, etc. So you want to duplicate them
> > > > > > again in the virtio? If not, why choose this way?
> > > > > >
> > > > > It is optional for the platforms where platform do not have it.
> > > >
> > > > We are developing new virtio functionalities that are targeted for
> > > > future platforms. Otherwise we would end up with a feature with a
> > > > very narrow use case.
> > > In general I agree that platform is an option too.
> > > Hypervisor will be able to make the decision to use platform when ava=
ilable
> > and fallback to device method when platform does not have it.
> > >
> > > Future and to be equally usable in near term :)
> >
> > Please don't double standard again:
> >
> > When you are talking about TDISP, you want virtio to be designed to fit=
 for the
> > future where the platform is ready in the future When you are talking a=
bout
> > dirty tracking, you want it to work now even if
> >
> The proposal of transport VQ is anti-TDISP.

It's nothing about transport VQ, it's about you're saying the adminq
based device context. There's a comment to point out that the current
TDISP spec forbids modifying device state when TVM is attached. Then
you told us the TDISP may evolve for that.

> The proposal of dirty tracking is not anti-platform. It is optional like =
rest of the platform.
>
> > 1) most of the platform is ready now
> Can you list a ARM server CPU in production that has it? (not in some pdf=
 spec).

Then in the context of a dirty page, I've proved you dirty page
tracking has been supported by all major vendors. Where you refuse to
use the standard you used in explaining adminq for device context in
TDISP.

So I didn't ask you the ETA of the TDISP support for migration or
adminq, but you want me to give you the production information which
is pointless. You might need to ask ARM to get an answer, but a simple
google told me the effort to support dirty page tracking in SMMUv3
could go back to early 2021.

https://lore.kernel.org/linux-iommu/56b001fa-b4fe-c595-dc5e-f362d2f07a19@li=
nux.intel.com/t/

Why is it not merged? It's simply because we agree to do it in the
layer of IOMMUFD so it needs to wait.

Thanks


>
> > 2) whether or not virtio can log dirty page correctly is still suspicio=
us
> >
> > Thanks
>
> There is no double standard. The feature is optional which co-exists as e=
xplained above.


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

