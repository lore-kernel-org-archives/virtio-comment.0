Return-Path: <virtio-comment-return-8492-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFACC54FB9
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 07:15:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9EFA72AC53
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 07:15:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5FC60986877
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 07:15:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 421E3986191; Tue, 21 Nov 2023 07:15:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2FB2D986875
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 07:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 1LM-3iXePtqSheqq9_D-qA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700550899; x=1701155699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAjfXKxuemt3FPccFUHSIMUtLCxAhnwxa7zz0Na55qg=;
        b=CHn/Px93yUznpgXAXBPbGkbPHBUzRnIkoLasE6vvF10PqZnQC+zYVCDoGLWw1ABwrg
         98vNrwtKEfURjj6V48+zGgYVYQtEkq92E9X6ba1fxk49KXjaVnqhVgWDdO3LpdMIFfpX
         fH3oCJpweBPgY1elEnz04ltttQEVCjUd0fMJgrvc26zV/paSSoX9MMCyhpNmw0HebzW8
         RVHew2pAD3dJ5dsyH0c94f1BrVjsgE78PAZdpaPDdP5SnF9edu41mfWmkqzEyf7MynwF
         D1KmDxhc+bqv7opK3ZWULNsYe2vqA9xQcNHH87Llhi1i0izXf9mpoEdU5OB1Cig9xnQL
         xv0g==
X-Gm-Message-State: AOJu0YyaqNlLUBnv9KQPRHVH+K0Z8YzljghJ20ZGW1l6TF/4ZqGYqtaT
	AwPk/u+Wj16oI+dpDB6T5NotmYbvnXl9Ck7mfrLYDC7gcfjhMauiNolKUaxTv94O5P3m93tfkYw
	VNSblW6LRYd4TtcTWxvyxHbc0py4uHnSJsQjeFDBB2niRoOWepw==
X-Received: by 2002:a05:6512:3d21:b0:50a:a9bc:6598 with SMTP id d33-20020a0565123d2100b0050aa9bc6598mr629597lfv.24.1700550899486;
        Mon, 20 Nov 2023 23:14:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKpPdjyDtvbBQvPm6QI72x/w372TfoHtb0hq9Xantbfnk1A565uwo+z2rT86Ng8XoSOfFlqQNnzVbt0pbbcRo=
X-Received: by 2002:a05:6512:3d21:b0:50a:a9bc:6598 with SMTP id
 d33-20020a0565123d2100b0050aa9bc6598mr629581lfv.24.1700550898882; Mon, 20 Nov
 2023 23:14:58 -0800 (PST)
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
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com> <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Nov 2023 15:14:44 +0800
Message-ID: <CACGkMEt-6Q1NQ9x=Mh_ek8ogLeZXiTMRgHwRk1Bt5Y0XWpQrQw@mail.gmail.com>
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

On Thu, Nov 16, 2023 at 1:30=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, November 16, 2023 9:54 AM
> >
> > On Thu, Nov 16, 2023 at 1:39=E2=80=AFAM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Monday, November 13, 2023 9:07 AM
> > > >
> > > > On Thu, Nov 9, 2023 at 2:25=E2=80=AFPM Parav Pandit <parav@nvidia.c=
om> wrote:
> > > > >
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Tuesday, November 7, 2023 9:34 AM
> > > > > >
> > > > > > On Mon, Nov 6, 2023 at 2:54=E2=80=AFPM Parav Pandit <parav@nvid=
ia.com>
> > wrote:
> > > > > > >
> > > > > > >
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Monday, November 6, 2023 12:04 PM
> > > > > > > >
> > > > > > > > On Thu, Nov 2, 2023 at 2:10=E2=80=AFPM Parav Pandit
> > > > > > > > <parav@nvidia.com>
> > > > wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > Sent: Thursday, November 2, 2023 9:54 AM
> > > > > > > > > >
> > > > > > > > > > On Wed, Nov 1, 2023 at 11:02=E2=80=AFAM Parav Pandit
> > > > > > > > > > <parav@nvidia.com>
> > > > > > wrote:
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > Sent: Wednesday, November 1, 2023 6:00 AM
> > > > > > > > > > > >
> > > > > > > > > > > > On Tue, Oct 31, 2023 at 11:27=E2=80=AFAM Parav Pand=
it
> > > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > > > Sent: Tuesday, October 31, 2023 7:13 AM
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Mon, Oct 30, 2023 at 9:21=E2=80=AFPM Parav P=
andit
> > > > > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > > > wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > During a device migration flow (typically in =
a
> > > > > > > > > > > > > > > precopy phase of the live migration), a devic=
e
> > > > > > > > > > > > > > > may write to the guest memory. Some
> > > > > > > > > > > > > > > iommu/hypervisor may not be able to track
> > > > > > > > > > > > > > > these
> > > > > > > > > > written pages.
> > > > > > > > > > > > > > > These pages to be migrated from source to
> > > > > > > > > > > > > > > destination
> > > > > > hypervisor.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > A device which writes to these pages, provide=
s
> > > > > > > > > > > > > > > the page address record of the to the owner d=
evice.
> > > > > > > > > > > > > > > The owner device starts write recording for
> > > > > > > > > > > > > > > the device and queries all the page addresses
> > > > > > > > > > > > > > > written by the
> > > > device.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Fixes:
> > > > > > > > > > > > > > > https://github.com/oasis-tcs/virtio-spec/issu=
e
> > > > > > > > > > > > > > > s/17
> > > > > > > > > > > > > > > 6
> > > > > > > > > > > > > > > Signed-off-by: Parav Pandit <parav@nvidia.com=
>
> > > > > > > > > > > > > > > Signed-off-by: Satananda Burla
> > > > > > > > > > > > > > > <sburla@marvell.com>
> > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > changelog:
> > > > > > > > > > > > > > > v1->v2:
> > > > > > > > > > > > > > > - addressed comments from Michael
> > > > > > > > > > > > > > > - replaced iova with physical address
> > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > >  admin-cmds-device-migration.tex | 15
> > > > > > > > > > > > > > > +++++++++++++++
> > > > > > > > > > > > > > >  1 file changed, 15 insertions(+)
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > diff --git a/admin-cmds-device-migration.tex
> > > > > > > > > > > > > > > b/admin-cmds-device-migration.tex index
> > > > > > > > > > > > > > > ed911e4..2e32f2c
> > > > > > > > > > > > > > > 100644
> > > > > > > > > > > > > > > --- a/admin-cmds-device-migration.tex
> > > > > > > > > > > > > > > +++ b/admin-cmds-device-migration.tex
> > > > > > > > > > > > > > > @@ -95,6 +95,21 @@ \subsubsection{Device
> > > > > > > > > > > > > > > Migration}\label{sec:Basic Facilities of a
> > > > > > > > > > > > > > > Virtio Device / The owner driver can discard
> > > > > > > > > > > > > > > any partially read or written device context
> > > > > > > > > > > > > > > when  any of the device migration flow
> > > > > > > > > > > > > > should be aborted.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +During the device migration flow, a
> > > > > > > > > > > > > > > +passthrough device may write data to the
> > > > > > > > > > > > > > > +guest virtual machine's memory, a source
> > > > > > > > > > > > > > > +hypervisor needs to keep track of these
> > > > > > > > > > > > > > > +written memory to migrate such memory to
> > > > > > > > > > > > > > > +destination
> > > > > > > > > > > > > > hypervisor.
> > > > > > > > > > > > > > > +Some systems may not be able to keep track o=
f
> > > > > > > > > > > > > > > +such memory write addresses at hypervisor le=
vel.
> > > > > > > > > > > > > > > +In such a scenario, a device records and
> > > > > > > > > > > > > > > +reports these written memory addresses to th=
e
> > > > > > > > > > > > > > > +owner device. The owner driver enables write
> > > > > > > > > > > > > > > +recording for one or more physical address
> > > > > > > > > > > > > > > +ranges per device during device
> > > > > > > > > > migration flow.
> > > > > > > > > > > > > > > +The owner driver periodically queries these
> > > > > > > > > > > > > > > +written physical address
> > > > > > > > > > > > records from the device.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I wonder how PA works in this case. Device uses
> > > > > > > > > > > > > > untranslated requests so it can only see IOVA.
> > > > > > > > > > > > > > We can't mandate
> > > > > > ATS anyhow.
> > > > > > > > > > > > > Michael suggested to keep the language uniform as
> > > > > > > > > > > > > PA as this is ultimately
> > > > > > > > > > > > what the guest driver is supplying during vq
> > > > > > > > > > > > creation and in posting buffers as physical address=
.
> > > > > > > > > > > >
> > > > > > > > > > > > This seems to need some work. And, can you show me
> > > > > > > > > > > > how it can
> > > > > > work?
> > > > > > > > > > > >
> > > > > > > > > > > > 1) e.g if GAW is 48 bit, is the hypervisor expected
> > > > > > > > > > > > to do a bisection of the whole range?
> > > > > > > > > > > > 2) does the device need to reserve sufficient
> > > > > > > > > > > > internal resources for logging the dirty page and w=
hy (not)?
> > > > > > > > > > > No when dirty page logging starts, only at that time,
> > > > > > > > > > > device will reserve
> > > > > > > > > > enough resources.
> > > > > > > > > >
> > > > > > > > > > GAW is 48bit, how large would it have then?
> > > > > > > > > Dirty page tracking is not dependent on the size of the G=
AW.
> > > > > > > > > It is function of address ranges for the amount of guest
> > > > > > > > > memory regardless of
> > > > > > > > GAW.
> > > > > > > >
> > > > > > > > The problem is, e.g when vIOMMU is enabled, you can't know
> > > > > > > > which IOVA is actually used by guests. And even for the cas=
e
> > > > > > > > when vIOMMU is not enabled, the guest may have several TBs.
> > > > > > > > Is it easy to reserve sufficient resources by the device it=
self?
> > > > > > > >
> > > > > > > When page tracking is enabled per device, it knows about the
> > > > > > > range and it can
> > > > > > reserve certain resource.
> > > > > >
> > > > > > I didn't see such an interface in this series. Anything I miss?
> > > > > >
> > > > > Yes, this patch and the next patch is covering the page tracking
> > > > > start,stop and
> > > > query commands.
> > > > > They are named as write recording commands.
> > > >
> > > > So I still don't see how the device can reserve sufficient resource=
s?
> > > > Guests may map a very large area of memory to IOMMU (or when vIOMMU
> > > > is disabled, GPA is used). It would be several TBs, how can the
> > > > device reserve sufficient resources in this case?
> > > When the map is established, the ranges are supplied to the device to=
 know
> > how much to reserve.
> > > If device does not have enough resource, it fails the command.
> > >
> > > One can advance it further to provision for the desired range..
> >
> > Well, I think I've asked whether or not a bisection is needed, and you =
told me
> > not ...
> >
> > But at least we need to document this in the proposal, no?
> >
> We should expose a limit of the device in the proposed WRITE_RECORD_CAP_Q=
UERY command, that how much range it can track.
> So that future provisioning framework can use it.
>
> I will cover this in v5 early next week.
>
> > > >
> > > > >
> > > > > > Btw, the IOVA is allocated by the guest actually, how can we
> > > > > > know the
> > > > range?
> > > > > > (or using the host range?)
> > > > > >
> > > > > Hypervisor would have mapping translation.
> > > >
> > > > That's really tricky and can only work in some cases:
> > > >
> > > > 1) It requires the hypervisor to traverse the guest I/O page tables
> > > > which could be very large range
> > > > 2) It requests the hypervisor to trap the modification of guest I/O
> > > > page tables and synchronize with the range changes, which is
> > > > inefficient and can only be done when we are doing shadow PTEs. It
> > > > won't work when the nesting translation could be offloaded to the
> > > > hardware
> > > > 3) It is racy with the guest modification of I/O page tables which
> > > > is explained in another thread
> > > Mapping changes with more hw mmu's is not a frequent event and IOTLB
> > flush is done using querying the dirty log for the smaller range.
> > >
> > > > 4) No aware of new features like PASID which has been explained in
> > > > another thread
> > > For all the pinned work with non sw based IOMMU, it is typically smal=
l subset.
> > > PASID is guest controlled.
> >
> > Let's repeat my points:
> >
> > 1) vq1 use untranslated request with PASID1
> > 2) vq2 use untranslated request with PASID2
> >
> > Shouldn't we log PASID as well?
> >
> Possibly yes, either to request the tracking per PASID or to log the PASI=
D.
> When in future PASID based VQ are supported, this part should be extended=
.

Who is going to do the extension? They are orthogonal features for sure.

>
> > And
> >
> > 1) vq1 is using translated request
> > 2) vq2 is using untranslated request
> >

How about this?

>
> > How could we differ?
> >
> > >
> > > >
> > > > >
> > > > > > >
> > > > > > > > Host should always have more resources than device, in that
> > > > > > > > sense there could be several methods that tries to utilize
> > > > > > > > host memory instead of the one in the device. I think we've
> > > > > > > > discussed this when going through the doc prepared by Eugen=
io.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > What happens if we're trying to migrate more than 1 dev=
ice?
> > > > > > > > > >
> > > > > > > > > That is perfectly fine.
> > > > > > > > > Each device is updating its log of pages it wrote.
> > > > > > > > > The hypervisor is collecting their sum.
> > > > > > > >
> > > > > > > > See above.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > 3) DMA is part of the transport, it's natural to do
> > > > > > > > > > > > logging there, why duplicate efforts in the virtio =
layer?
> > > > > > > > > > > He he, you have funny comment.
> > > > > > > > > > > When an abstract facility is added to virtio you say
> > > > > > > > > > > to do in
> > > > transport.
> > > > > > > > > >
> > > > > > > > > > So it's not done in the general facility but tied to th=
e admin part.
> > > > > > > > > > And we all know dirty page tracking is a challenge and
> > > > > > > > > > Eugenio has a good summary of pros/cons. A revisit of
> > > > > > > > > > those docs make me think virtio is not the good place
> > > > > > > > > > for doing that for
> > > > may reasons:
> > > > > > > > > >
> > > > > > > > > > 1) as stated, platform will evolve to be able to
> > > > > > > > > > tracking dirty pages, actually, it has been supported b=
y
> > > > > > > > > > a lot of major IOMMU vendors
> > > > > > > > >
> > > > > > > > > This is optional facility in virtio.
> > > > > > > > > Can you please point to the references? I don=E2=80=99t s=
ee it in
> > > > > > > > > the common Linux
> > > > > > > > kernel support for it.
> > > > > > > >
> > > > > > > > Note that when IOMMUFD is being proposed, dirty page
> > > > > > > > tracking is one of the major considerations.
> > > > > > > >
> > > > > > > > This is one recent proposal:
> > > > > > > >
> > > > > > > > https://www.spinics.net/lists/kvm/msg330894.html
> > > > > > > >
> > > > > > > Sure, so if platform supports it. it can be used from the pla=
tform.
> > > > > > > If it does not, the device supplies it.
> > > > > > >
> > > > > > > > > Instead Linux kernel choose to extend to the devices.
> > > > > > > >
> > > > > > > > Well, as I stated, tracking dirty pages is challenging if
> > > > > > > > you want to do it on a device, and you can't simply invent
> > > > > > > > dirty page tracking for each type of the devices.
> > > > > > > >
> > > > > > > It is not invented.
> > > > > > > It is generic framework for all virtio device types as propos=
ed here.
> > > > > > > Keep in mind, that it is optional already in v3 series.
> > > > > > >
> > > > > > > > > At least not seen to arrive this in any near term in star=
t
> > > > > > > > > of
> > > > > > > > > 2024 which is
> > > > > > > > where users must use this.
> > > > > > > > >
> > > > > > > > > > 2) you can't assume virtio is the only device that can
> > > > > > > > > > be used by the guest, having dirty pages tracking to be
> > > > > > > > > > implemented in each type of device is unrealistic
> > > > > > > > > Of course, there is no such assumption made. Where did yo=
u
> > > > > > > > > see a text that
> > > > > > > > made such assumption?
> > > > > > > >
> > > > > > > > So what happens if you have a guest with virtio and other
> > > > > > > > devices
> > > > assigned?
> > > > > > > >
> > > > > > > What happens? Each device type would do its own dirty page tr=
acking.
> > > > > > > And if all devices does not have support, hypervisor knows to
> > > > > > > fall back to
> > > > > > platform iommu or its own.
> > > > > > >
> > > > > > > > > Each virtio and non virtio devices who wants to report
> > > > > > > > > their dirty page report,
> > > > > > > > will do their way.
> > > > > > > > >
> > > > > > > > > > 3) inventing it in the virtio layer will be deprecated
> > > > > > > > > > in the future for sure, as platform will provide much
> > > > > > > > > > rich features for logging e.g it can do it per PASID
> > > > > > > > > > etc, I don't see any reason virtio need to compete with
> > > > > > > > > > the features that will be provided by the platform
> > > > > > > > > Can you bring the cpu vendors and committement to virtio
> > > > > > > > > tc with timelines
> > > > > > > > so that virtio TC can omit?
> > > > > > > >
> > > > > > > > Why do we need to bring CPU vendors in the virtio TC? Virti=
o
> > > > > > > > needs to be built on top of transport or platform. There's
> > > > > > > > no need to duplicate
> > > > > > their job.
> > > > > > > > Especially considering that virtio can't do better than the=
m.
> > > > > > > >
> > > > > > > I wanted to see a strong commitment for the cpu vendors to
> > > > > > > support dirty
> > > > > > page tracking.
> > > > > >
> > > > > > The RFC of IOMMUFD support can go back to early 2022. Intel, AM=
D
> > > > > > and ARM are all supporting that now.
> > > > > >
> > > > > > > And the work seems to have started for some platforms.
> > > > > >
> > > > > > Let me quote from the above link:
> > > > > >
> > > > > > """
> > > > > > Today, AMD Milan (or more recent) supports it while ARM SMMUv3.=
2
> > > > > > alongside VT-D rev3.x also do support.
> > > > > > """
> > > > > >
> > > > > > > Without such platform commitment, virtio also skipping it wou=
ld not
> > work.
> > > > > >
> > > > > > Is the above sufficient? I'm a little bit more familiar with
> > > > > > vtd, the hw feature has been there for years.
> > > > > >
> > > > > Vtd has a sticky D bit that requires synchronization with IOPTE
> > > > > page caches
> > > > when sw wants to clear it.
> > > >
> > > > This is by design.
> > > >
> > > > > Do you know if is it reliable when device does multiple writes,
> > > > > ie,
> > > > >
> > > > > a. iommu write D bit
> > > > > b. software read it
> > > > > c. sw synchronize cache
> > > > > d. iommu write D bit on next write by device
> > > >
> > > > What issue did you see here? But that's not even an excuse, if
> > > > there's a bug, let's report it to IOMMU vendors and let them fix it=
.
> > > > The thread I point to you is actually a good space.
> > > >
> > > So we cannot claim that it is there in the platform.
> >
> > I'm confused, the thread I point to you did the cache synchronization w=
hich has
> > been explained in the changelog, so what's the issue?
> >
> If the ask is for IOMMU chip to fix something, we cannot claim that dirty=
 page tracking is available already in platform.

Again, can you describe the issue? Why do you think the sticky part is
an issue? IOTLB needs to be sync with IO page tables, what's wrong
with this?

>
> > >
> > > > Again, the point is to let the correct role play.
> > > >
> > > How many more years should we block the virtio device migration when
> > platform do not have it?
> >
> > At least for VT-D, it has been used for years.
> Is this device written pages tracked by KVM for VT-d as dirty page log, i=
nstead through vfio?

I don't get this question.

>
> >
> > >
> > > > >
> > > > > ARM SMMU based servers to be present with D bit tracking.
> > > > > It is still early to say platform is ready.
> > > >
> > > > This is not what I read from both the series I posted and the spec,
> > > > dirty bit has been supported several years ago at least for vtd.
> > > Supported, but spec listed it as sticky bit that may require special =
handling.
> >
> > Please explain why this is "special handling". IOMMU has several differ=
ent layers
> > of caching, by design, it can't just open a window for D bit.
> >
> > > May be it is working, but not all cpu platforms have it.
> >
> > I don't see the point. Migration is not supported for virito as well.
> >
> I don=E2=80=99t see a point either to discuss.
>
> I already acked that platform may have support as well, and not all platf=
orm has it.
> So the device feeds the data and its platform's choice to enable/disable.

I've pointed out sufficient issues and I don't want to repeat them.

>
> > >
> > > >
> > > > >
> > > > > It is optional so whichever has the support it will be used.
> > > >
> > > > I can't see the point of this, it is already available. And
> > > > migration doesn't exist in virtio spec yet.
> > > >
> > > > >
> > > > > > >
> > > > > > > > > i.e. in first year of 2024?
> > > > > > > >
> > > > > > > > Why does it matter in 2024?
> > > > > > > Because users needs to use it now.
> > > > > > >
> > > > > > > >
> > > > > > > > > If not, we are better off to offer this, and when/if
> > > > > > > > > platform support is, sure,
> > > > > > > > this feature can be disabled/not used/not enabled.
> > > > > > > > >
> > > > > > > > > > 4) if the platform support is missing, we can use
> > > > > > > > > > software or leverage transport for assistance like PRI
> > > > > > > > > All of these are in theory.
> > > > > > > > > Our experiment shows PRI performance is 21x slower than
> > > > > > > > > page fault rate
> > > > > > > > done by the cpu.
> > > > > > > > > It simply does not even pass a simple 10Gbps test.
> > > > > > > >
> > > > > > > > If you stick to the wire speed during migration, it can con=
verge.
> > > > > > > Do you have perf data for this?
> > > > > >
> > > > > > No, but it's not hard to imagine the worst case. Wrote a small
> > > > > > program that dirty every page by a NIC.
> > > > > >
> > > > > > > In the internal tests we don=E2=80=99t see this happening.
> > > > > >
> > > > > > downtime =3D dirty_rates * PAGE_SIZE / migration_speed
> > > > > >
> > > > > > So if we get very high dirty rates (e.g by a high speed NIC), w=
e
> > > > > > can't satisfy the requirement of the downtime. Or if you see th=
e
> > > > > > converge, you might get help from the auto converge support by
> > > > > > the hypervisors like KVM where it tries to throttle the VCPU
> > > > > > then you can't reach
> > > > the wire speed.
> > > > > >
> > > > > Once PRI is enabled, even without migration, there is basic perf =
issues.
> > > >
> > > > The context is not PRI here...
> > > >
> > > > It's about if you can stick to wire speed during live migration.
> > > > Based on the analysis so far, you can't achieve wirespeed and downt=
ime at
> > the same time.
> > > > That's why the hypervisor needs to throttle VCPU or devices.
> > > >
> > > So?
> > > Device also may throttle itself.
> >
> > That's perfectly fine. We are on the same page, no? It's wrong to judge=
 the dirty
> > page tracking in the context of live migration by measuring whether or =
not the
> > device can work at wire speed.
> >
> > >
> > > > For PRI, it really depends on how you want to use it. E.g if you
> > > > don't want to pin a page, the performance is the price you must pay=
.
> > > PRI without pinning does not make sense for device to make large mapp=
ing
> > queries.
> >
> > That's also fine. Hypervisors can choose to enable and use PRI dependin=
g on
> > the different cases.
> >
> So PRI is not must for device migration.

I never say it's a must.

> Device migration must be able to work without PRI enabled, as simple as t=
hat as first base line.

My point is that, you need document

1) why you think dirty page is a must or not
2) why did you choose one of a specific way instead of others

>
> > >
> > > >
> > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > > There is no requirement for mandating PRI either.
> > > > > > > > > So it is unusable.
> > > > > > > >
> > > > > > > > It's not about mandating, it's about doing things in the
> > > > > > > > correct layer. If PRI is slow, PCI can evolve for sure.
> > > > > > > You should try.
> > > > > >
> > > > > > Not my duty, I just want to make sure things are done in the
> > > > > > correct layer, and once it needs to be done in the virtio,
> > > > > > there's nothing obviously
> > > > wrong.
> > > > > >
> > > > > At present, it looks all platforms are not equally ready for page=
 tracking.
> > > >
> > > > That's not an excuse to let virtio support that.
> > > It is wrong attribution as excuse.
> > >
> > > > And we need also to figure out if
> > > > virtio can do that easily. I've pointed out sufficient issues, I'm
> > > > pretty sure there would be more as the platform evolves.
> > > >
> > > I am not sure if virtio feeds the log into the platform.
> >
> > I don't understand the meaning here.
> >
> I mistakenly merged two sentences.
>
> Virtio feeds the dirty page details to the hypervisor platform which coll=
ects and merges the page record.
> So it is platform choice to use iommu based tracking or device based.
>
> > >
> > > > >
> > > > > > > In the current state, it is mandating.
> > > > > > > And if you think PRI is the only way,
> > > > > >
> > > > > > I don't, it's just an example where virtio can leverage from
> > > > > > either transport or platform. Or if it's the fault in virtio
> > > > > > that slows down the PRI, then it is something we can do.
> > > > > >
> > > > > Yea, it does not seem to be ready yet.
> > > > >
> > > > > > >  than you should propose that in the dirty page tracking
> > > > > > > series that you listed
> > > > > > above to not do dirty page tracking. Rather depend on PRI, righ=
t?
> > > > > >
> > > > > > No, the point is to not duplicate works especially considering
> > > > > > virtio can't do better than platform or transport.
> > > > > >
> > > > > Both the platform and virtio work is ongoing.
> > > >
> > > > Why duplicate the work then?
> > > >
> > > Not all cpu platforms support as far as I know.
> >
> > Yes, but we all know the platform is working to support this.
> >
> > Supporting this on the device is hard.
> >
> This is optional, whichever device would like to implement it, will suppo=
rt it.
>
> > >
> > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > When one does something in transport, you say, this i=
s
> > > > > > > > > > > transport specific, do
> > > > > > > > > > some generic.
> > > > > > > > > > >
> > > > > > > > > > > Here the device is being tracked is virtio device.
> > > > > > > > > > > PCI-SIG has told already that PCIM interface is
> > > > > > > > > > > outside the scope of
> > > > it.
> > > > > > > > > > > Hence, this is done in virtio layer here in abstract =
way.
> > > > > > > > > >
> > > > > > > > > > You will end up with a competition with the
> > > > > > > > > > platform/transport one that will fail.
> > > > > > > > > >
> > > > > > > > > I don=E2=80=99t see a reason. There is no competition.
> > > > > > > > > Platform always have a choice to not use device side page
> > > > > > > > > tracking when it is
> > > > > > > > supported.
> > > > > > > >
> > > > > > > > Platform provides a lot of other functionalities for dirty =
logging:
> > > > > > > > e.g per PASID, granular, etc. So you want to duplicate them
> > > > > > > > again in the virtio? If not, why choose this way?
> > > > > > > >
> > > > > > > It is optional for the platforms where platform do not have i=
t.
> > > > > >
> > > > > > We are developing new virtio functionalities that are targeted
> > > > > > for future platforms. Otherwise we would end up with a feature
> > > > > > with a very narrow use case.
> > > > > In general I agree that platform is an option too.
> > > > > Hypervisor will be able to make the decision to use platform when
> > > > > available
> > > > and fallback to device method when platform does not have it.
> > > > >
> > > > > Future and to be equally usable in near term :)
> > > >
> > > > Please don't double standard again:
> > > >
> > > > When you are talking about TDISP, you want virtio to be designed to
> > > > fit for the future where the platform is ready in the future When
> > > > you are talking about dirty tracking, you want it to work now even
> > > > if
> > > >
> > > The proposal of transport VQ is anti-TDISP.
> >
> > It's nothing about transport VQ, it's about you're saying the adminq ba=
sed
> > device context. There's a comment to point out that the current TDISP s=
pec
> > forbids modifying device state when TVM is attached. Then you told us t=
he
> > TDISP may evolve for that.
> So? That is not double standard.
> The proposal is based on main principle that it is not depending on hyper=
visor traping + emulating which is the baseline of TDISP
>
> >
> > > The proposal of dirty tracking is not anti-platform. It is optional l=
ike rest of the
> > platform.
> > >
> > > > 1) most of the platform is ready now
> > > Can you list a ARM server CPU in production that has it? (not in some=
 pdf
> > spec).
> >
> > Then in the context of a dirty page, I've proved you dirty page trackin=
g has been
> > supported by all major vendors.
> Major IP vendor !=3D major cpu chip vendor.
> I don=E2=80=99t agree with the proof.

So this will be an endless debate. Did I ever ask you about ETA or any
product for TDISP?

>
> I already acknowledged that I have seen internal test report for dirty tr=
acking with one cpu and nic.
>
> I just don=E2=80=99t see all cpus have support for it.
> Hence, this optional feature.

Repeat myself again.

If it can be done easily and efficiently in virtio, I agree. But I've
pointed out several issues where it is not answered.

>
> > Where you refuse to use the standard you used
> > in explaining adminq for device context in TDISP.
> >
> > So I didn't ask you the ETA of the TDISP support for migration or admin=
q, but
> > you want me to give you the production information which is pointless.
> Because you keep claiming that _all_ cpus in the world has support for ef=
ficient dirty page tracking.
>
> > You
> > might need to ask ARM to get an answer, but a simple google told me the=
 effort
> > to support dirty page tracking in SMMUv3 could go back to early 2021.
> >
> To my knowledge ARM do not produce physical chips.
> Your proposal is to keep those ARM server vendors to not use virtio devic=
es.

This arbitrary conclusion makes no sense.

I know at least one cloud vendor has used a virtio based device for
years on ARM. And that vendor has posted patches to support dirty page
tracking since 2020.

Thanks

> Does not make sense to me.
>
> > https://lore.kernel.org/linux-iommu/56b001fa-b4fe-c595-dc5e-
> > f362d2f07a19@linux.intel.com/t/
> >
> > Why is it not merged? It's simply because we agree to do it in the laye=
r of
> > IOMMUFD so it needs to wait.
> >
> > Thanks
> >
> >
> > >
> > > > 2) whether or not virtio can log dirty page correctly is still
> > > > suspicious
> > > >
> > > > Thanks
> > >
> > > There is no double standard. The feature is optional which co-exists =
as
> > explained above.
>


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

