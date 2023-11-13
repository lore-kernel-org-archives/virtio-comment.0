Return-Path: <virtio-comment-return-8336-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84802C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:37:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C4AC342A78
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:37:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8B4669867C2
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:37:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6C9149865BD; Mon, 13 Nov 2023 03:37:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5C7319865C1
	for <virtio-comment@lists.oasis-open.org>; Mon, 13 Nov 2023 03:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: xm-f0DOZO5iizitlls4CVw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699846662; x=1700451462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCAtjUuMto0jETpc1gADNFtLJMbGLYJled2snduAfbs=;
        b=gWIuUNKYjVvat0ILTlg3KhJhz5vjq/Ekw+n4xHctt5Vy0tSAUt0esEBBBEOAO2d5dA
         CQc1dclU+Ex4ugy8PSd1u4pC9y5BvT/iHvLrl0+XGOmg9zwLxra08fso+ixCwfAjtbcC
         GWZm0m+aYGN7iCl1hG3ilh3EwJQ4Q0r/QhLlFfRC4emlaPX7Cakr4+1tXiFh5qMZmz9P
         6uQfo0xGRaBSSPeQX8xzB4Ry4VBn4jZJbMdDd8qHgBWPeiLgRClGbp1ypC6gKqRs4wLh
         79jyaWvvumarSCdH7ws+KCDJTy9zV3m97dUsLYy/2RYeJnRpVMF0kQ4wNul8vA6tDowo
         B7Gg==
X-Gm-Message-State: AOJu0YxinHRkA26yGCwcZVVt+HAlnnQZjA/zaF48B7b3qcR8eY7uUD7G
	KXZvKWbvb/rqPIEPIvxpf0kl25zUcnTUlOJ5MeZhuTI8irkHA2fmn1R/UNQuHkFYOB6zUdUSbm5
	3S7jE3qiZrrhMKlepjiHpjF8ImNx+bQ5zAAC36Nrrt2MU4RcAhQ==
X-Received: by 2002:ac2:454c:0:b0:507:a624:3f35 with SMTP id j12-20020ac2454c000000b00507a6243f35mr3424883lfm.41.1699846661628;
        Sun, 12 Nov 2023 19:37:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjuzj6GFD5AZ17/z7hO7J77wHdtFo/AQvFn57tqnlNJvms68rPVOuM8o+3GHD2utwttcYsZ/Y+PrgVV4tGTJQ=
X-Received: by 2002:ac2:454c:0:b0:507:a624:3f35 with SMTP id
 j12-20020ac2454c000000b00507a6243f35mr3424870lfm.41.1699846661171; Sun, 12
 Nov 2023 19:37:41 -0800 (PST)
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
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com> <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 13 Nov 2023 11:37:29 +0800
Message-ID: <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
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

On Thu, Nov 9, 2023 at 2:25=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, November 7, 2023 9:34 AM
> >
> > On Mon, Nov 6, 2023 at 2:54=E2=80=AFPM Parav Pandit <parav@nvidia.com> =
wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Monday, November 6, 2023 12:04 PM
> > > >
> > > > On Thu, Nov 2, 2023 at 2:10=E2=80=AFPM Parav Pandit <parav@nvidia.c=
om> wrote:
> > > > >
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Thursday, November 2, 2023 9:54 AM
> > > > > >
> > > > > > On Wed, Nov 1, 2023 at 11:02=E2=80=AFAM Parav Pandit <parav@nvi=
dia.com>
> > wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Wednesday, November 1, 2023 6:00 AM
> > > > > > > >
> > > > > > > > On Tue, Oct 31, 2023 at 11:27=E2=80=AFAM Parav Pandit
> > > > > > > > <parav@nvidia.com>
> > > > wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > Sent: Tuesday, October 31, 2023 7:13 AM
> > > > > > > > > >
> > > > > > > > > > On Mon, Oct 30, 2023 at 9:21=E2=80=AFPM Parav Pandit
> > > > > > > > > > <parav@nvidia.com>
> > > > > > wrote:
> > > > > > > > > > >
> > > > > > > > > > > During a device migration flow (typically in a precop=
y
> > > > > > > > > > > phase of the live migration), a device may write to
> > > > > > > > > > > the guest memory. Some iommu/hypervisor may not be
> > > > > > > > > > > able to track these
> > > > > > written pages.
> > > > > > > > > > > These pages to be migrated from source to destination
> > hypervisor.
> > > > > > > > > > >
> > > > > > > > > > > A device which writes to these pages, provides the
> > > > > > > > > > > page address record of the to the owner device. The
> > > > > > > > > > > owner device starts write recording for the device an=
d
> > > > > > > > > > > queries all the page addresses written by the device.
> > > > > > > > > > >
> > > > > > > > > > > Fixes:
> > > > > > > > > > > https://github.com/oasis-tcs/virtio-spec/issues/176
> > > > > > > > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > > > > > > > Signed-off-by: Satananda Burla <sburla@marvell.com>
> > > > > > > > > > > ---
> > > > > > > > > > > changelog:
> > > > > > > > > > > v1->v2:
> > > > > > > > > > > - addressed comments from Michael
> > > > > > > > > > > - replaced iova with physical address
> > > > > > > > > > > ---
> > > > > > > > > > >  admin-cmds-device-migration.tex | 15 +++++++++++++++
> > > > > > > > > > >  1 file changed, 15 insertions(+)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/admin-cmds-device-migration.tex
> > > > > > > > > > > b/admin-cmds-device-migration.tex index
> > > > > > > > > > > ed911e4..2e32f2c
> > > > > > > > > > > 100644
> > > > > > > > > > > --- a/admin-cmds-device-migration.tex
> > > > > > > > > > > +++ b/admin-cmds-device-migration.tex
> > > > > > > > > > > @@ -95,6 +95,21 @@ \subsubsection{Device
> > > > > > > > > > > Migration}\label{sec:Basic Facilities of a Virtio
> > > > > > > > > > > Device / The owner driver can discard any partially
> > > > > > > > > > > read or written device context when  any of the devic=
e
> > > > > > > > > > > migration flow
> > > > > > > > > > should be aborted.
> > > > > > > > > > >
> > > > > > > > > > > +During the device migration flow, a passthrough
> > > > > > > > > > > +device may write data to the guest virtual machine's
> > > > > > > > > > > +memory, a source hypervisor needs to keep track of
> > > > > > > > > > > +these written memory to migrate such memory to
> > > > > > > > > > > +destination
> > > > > > > > > > hypervisor.
> > > > > > > > > > > +Some systems may not be able to keep track of such
> > > > > > > > > > > +memory write addresses at hypervisor level. In such =
a
> > > > > > > > > > > +scenario, a device records and reports these written
> > > > > > > > > > > +memory addresses to the owner device. The owner
> > > > > > > > > > > +driver enables write recording for one or more
> > > > > > > > > > > +physical address ranges per device during device
> > > > > > migration flow.
> > > > > > > > > > > +The owner driver periodically queries these written
> > > > > > > > > > > +physical address
> > > > > > > > records from the device.
> > > > > > > > > >
> > > > > > > > > > I wonder how PA works in this case. Device uses
> > > > > > > > > > untranslated requests so it can only see IOVA. We can't=
 mandate
> > ATS anyhow.
> > > > > > > > > Michael suggested to keep the language uniform as PA as
> > > > > > > > > this is ultimately
> > > > > > > > what the guest driver is supplying during vq creation and i=
n
> > > > > > > > posting buffers as physical address.
> > > > > > > >
> > > > > > > > This seems to need some work. And, can you show me how it c=
an
> > work?
> > > > > > > >
> > > > > > > > 1) e.g if GAW is 48 bit, is the hypervisor expected to do a
> > > > > > > > bisection of the whole range?
> > > > > > > > 2) does the device need to reserve sufficient internal
> > > > > > > > resources for logging the dirty page and why (not)?
> > > > > > > No when dirty page logging starts, only at that time, device
> > > > > > > will reserve
> > > > > > enough resources.
> > > > > >
> > > > > > GAW is 48bit, how large would it have then?
> > > > > Dirty page tracking is not dependent on the size of the GAW.
> > > > > It is function of address ranges for the amount of guest memory
> > > > > regardless of
> > > > GAW.
> > > >
> > > > The problem is, e.g when vIOMMU is enabled, you can't know which
> > > > IOVA is actually used by guests. And even for the case when vIOMMU
> > > > is not enabled, the guest may have several TBs. Is it easy to
> > > > reserve sufficient resources by the device itself?
> > > >
> > > When page tracking is enabled per device, it knows about the range an=
d it can
> > reserve certain resource.
> >
> > I didn't see such an interface in this series. Anything I miss?
> >
> Yes, this patch and the next patch is covering the page tracking start,st=
op and query commands.
> They are named as write recording commands.

So I still don't see how the device can reserve sufficient resources?
Guests may map a very large area of memory to IOMMU (or when vIOMMU is
disabled, GPA is used). It would be several TBs, how can the device
reserve sufficient resources in this case? Again, if we use host
resources, we don't need to care about this.

>
> > Btw, the IOVA is allocated by the guest actually, how can we know the r=
ange?
> > (or using the host range?)
> >
> Hypervisor would have mapping translation.

That's really tricky and can only work in some cases:

1) It requires the hypervisor to traverse the guest I/O page tables
which could be very large range
2) It requests the hypervisor to trap the modification of guest I/O
page tables and synchronize with the range changes, which is
inefficient and can only be done when we are doing shadow PTEs. It
won't work when the nesting translation could be offloaded to the
hardware
3) It is racy with the guest modification of I/O page tables which is
explained in another thread
4) No aware of new features like PASID which has been explained in
another thread

>
> > >
> > > > Host should always have more resources than device, in that sense
> > > > there could be several methods that tries to utilize host memory
> > > > instead of the one in the device. I think we've discussed this when
> > > > going through the doc prepared by Eugenio.
> > > >
> > > > >
> > > > > > What happens if we're trying to migrate more than 1 device?
> > > > > >
> > > > > That is perfectly fine.
> > > > > Each device is updating its log of pages it wrote.
> > > > > The hypervisor is collecting their sum.
> > > >
> > > > See above.
> > > >
> > > > >
> > > > > > >
> > > > > > > > 3) DMA is part of the transport, it's natural to do logging
> > > > > > > > there, why duplicate efforts in the virtio layer?
> > > > > > > He he, you have funny comment.
> > > > > > > When an abstract facility is added to virtio you say to do in=
 transport.
> > > > > >
> > > > > > So it's not done in the general facility but tied to the admin =
part.
> > > > > > And we all know dirty page tracking is a challenge and Eugenio
> > > > > > has a good summary of pros/cons. A revisit of those docs make m=
e
> > > > > > think virtio is not the good place for doing that for may reaso=
ns:
> > > > > >
> > > > > > 1) as stated, platform will evolve to be able to tracking dirty
> > > > > > pages, actually, it has been supported by a lot of major IOMMU
> > > > > > vendors
> > > > >
> > > > > This is optional facility in virtio.
> > > > > Can you please point to the references? I don=E2=80=99t see it in=
 the
> > > > > common Linux
> > > > kernel support for it.
> > > >
> > > > Note that when IOMMUFD is being proposed, dirty page tracking is on=
e
> > > > of the major considerations.
> > > >
> > > > This is one recent proposal:
> > > >
> > > > https://www.spinics.net/lists/kvm/msg330894.html
> > > >
> > > Sure, so if platform supports it. it can be used from the platform.
> > > If it does not, the device supplies it.
> > >
> > > > > Instead Linux kernel choose to extend to the devices.
> > > >
> > > > Well, as I stated, tracking dirty pages is challenging if you want
> > > > to do it on a device, and you can't simply invent dirty page
> > > > tracking for each type of the devices.
> > > >
> > > It is not invented.
> > > It is generic framework for all virtio device types as proposed here.
> > > Keep in mind, that it is optional already in v3 series.
> > >
> > > > > At least not seen to arrive this in any near term in start of 202=
4
> > > > > which is
> > > > where users must use this.
> > > > >
> > > > > > 2) you can't assume virtio is the only device that can be used
> > > > > > by the guest, having dirty pages tracking to be implemented in
> > > > > > each type of device is unrealistic
> > > > > Of course, there is no such assumption made. Where did you see a
> > > > > text that
> > > > made such assumption?
> > > >
> > > > So what happens if you have a guest with virtio and other devices a=
ssigned?
> > > >
> > > What happens? Each device type would do its own dirty page tracking.
> > > And if all devices does not have support, hypervisor knows to fall ba=
ck to
> > platform iommu or its own.
> > >
> > > > > Each virtio and non virtio devices who wants to report their dirt=
y
> > > > > page report,
> > > > will do their way.
> > > > >
> > > > > > 3) inventing it in the virtio layer will be deprecated in the
> > > > > > future for sure, as platform will provide much rich features fo=
r
> > > > > > logging e.g it can do it per PASID etc, I don't see any reason
> > > > > > virtio need to compete with the features that will be provided
> > > > > > by the platform
> > > > > Can you bring the cpu vendors and committement to virtio tc with
> > > > > timelines
> > > > so that virtio TC can omit?
> > > >
> > > > Why do we need to bring CPU vendors in the virtio TC? Virtio needs
> > > > to be built on top of transport or platform. There's no need to dup=
licate
> > their job.
> > > > Especially considering that virtio can't do better than them.
> > > >
> > > I wanted to see a strong commitment for the cpu vendors to support di=
rty
> > page tracking.
> >
> > The RFC of IOMMUFD support can go back to early 2022. Intel, AMD and AR=
M
> > are all supporting that now.
> >
> > > And the work seems to have started for some platforms.
> >
> > Let me quote from the above link:
> >
> > """
> > Today, AMD Milan (or more recent) supports it while ARM SMMUv3.2 alongs=
ide
> > VT-D rev3.x also do support.
> > """
> >
> > > Without such platform commitment, virtio also skipping it would not w=
ork.
> >
> > Is the above sufficient? I'm a little bit more familiar with vtd, the h=
w feature has
> > been there for years.
> >
> Vtd has a sticky D bit that requires synchronization with IOPTE page cach=
es when sw wants to clear it.

This is by design.

> Do you know if is it reliable when device does multiple writes, ie,
>
> a. iommu write D bit
> b. software read it
> c. sw synchronize cache
> d. iommu write D bit on next write by device

What issue did you see here? But that's not even an excuse, if there's
a bug, let's report it to IOMMU vendors and let them fix it. The
thread I point to you is actually a good space.

Again, the point is to let the correct role play.

>
> ARM SMMU based servers to be present with D bit tracking.
> It is still early to say platform is ready.

This is not what I read from both the series I posted and the spec,
dirty bit has been supported several years ago at least for vtd.

>
> It is optional so whichever has the support it will be used.

I can't see the point of this, it is already available. And migration
doesn't exist in virtio spec yet.

>
> > >
> > > > > i.e. in first year of 2024?
> > > >
> > > > Why does it matter in 2024?
> > > Because users needs to use it now.
> > >
> > > >
> > > > > If not, we are better off to offer this, and when/if platform
> > > > > support is, sure,
> > > > this feature can be disabled/not used/not enabled.
> > > > >
> > > > > > 4) if the platform support is missing, we can use software or
> > > > > > leverage transport for assistance like PRI
> > > > > All of these are in theory.
> > > > > Our experiment shows PRI performance is 21x slower than page faul=
t
> > > > > rate
> > > > done by the cpu.
> > > > > It simply does not even pass a simple 10Gbps test.
> > > >
> > > > If you stick to the wire speed during migration, it can converge.
> > > Do you have perf data for this?
> >
> > No, but it's not hard to imagine the worst case. Wrote a small program =
that dirty
> > every page by a NIC.
> >
> > > In the internal tests we don=E2=80=99t see this happening.
> >
> > downtime =3D dirty_rates * PAGE_SIZE / migration_speed
> >
> > So if we get very high dirty rates (e.g by a high speed NIC), we can't =
satisfy the
> > requirement of the downtime. Or if you see the converge, you might get =
help
> > from the auto converge support by the hypervisors like KVM where it tri=
es to
> > throttle the VCPU then you can't reach the wire speed.
> >
> Once PRI is enabled, even without migration, there is basic perf issues.

The context is not PRI here...

It's about if you can stick to wire speed during live migration. Based
on the analysis so far, you can't achieve wirespeed and downtime at
the same time. That's why the hypervisor needs to throttle VCPU or
devices.

For PRI, it really depends on how you want to use it. E.g if you don't
want to pin a page, the performance is the price you must pay.

>
> > >
> > > >
> > > > > There is no requirement for mandating PRI either.
> > > > > So it is unusable.
> > > >
> > > > It's not about mandating, it's about doing things in the correct
> > > > layer. If PRI is slow, PCI can evolve for sure.
> > > You should try.
> >
> > Not my duty, I just want to make sure things are done in the correct la=
yer, and
> > once it needs to be done in the virtio, there's nothing obviously wrong=
.
> >
> At present, it looks all platforms are not equally ready for page trackin=
g.

That's not an excuse to let virtio support that. And we need also to
figure out if virtio can do that easily. I've pointed out sufficient
issues, I'm pretty sure there would be more as the platform evolves.

>
> > > In the current state, it is mandating.
> > > And if you think PRI is the only way,
> >
> > I don't, it's just an example where virtio can leverage from either tra=
nsport or
> > platform. Or if it's the fault in virtio that slows down the PRI, then =
it is
> > something we can do.
> >
> Yea, it does not seem to be ready yet.
>
> > >  than you should propose that in the dirty page tracking series that =
you listed
> > above to not do dirty page tracking. Rather depend on PRI, right?
> >
> > No, the point is to not duplicate works especially considering virtio c=
an't do
> > better than platform or transport.
> >
> Both the platform and virtio work is ongoing.

Why duplicate the work then?

>
> > >
> > > >
> > > > >
> > > > > >
> > > > > > > When one does something in transport, you say, this is
> > > > > > > transport specific, do
> > > > > > some generic.
> > > > > > >
> > > > > > > Here the device is being tracked is virtio device.
> > > > > > > PCI-SIG has told already that PCIM interface is outside the s=
cope of it.
> > > > > > > Hence, this is done in virtio layer here in abstract way.
> > > > > >
> > > > > > You will end up with a competition with the platform/transport
> > > > > > one that will fail.
> > > > > >
> > > > > I don=E2=80=99t see a reason. There is no competition.
> > > > > Platform always have a choice to not use device side page trackin=
g
> > > > > when it is
> > > > supported.
> > > >
> > > > Platform provides a lot of other functionalities for dirty logging:
> > > > e.g per PASID, granular, etc. So you want to duplicate them again i=
n
> > > > the virtio? If not, why choose this way?
> > > >
> > > It is optional for the platforms where platform do not have it.
> >
> > We are developing new virtio functionalities that are targeted for futu=
re
> > platforms. Otherwise we would end up with a feature with a very narrow =
use
> > case.
> In general I agree that platform is an option too.
> Hypervisor will be able to make the decision to use platform when availab=
le and fallback to device method when platform does not have it.
>
> Future and to be equally usable in near term :)

Please don't double standard again:

When you are talking about TDISP, you want virtio to be designed to
fit for the future where the platform is ready in the future
When you are talking about dirty tracking, you want it to work now even if

1) most of the platform is ready now
2) whether or not virtio can log dirty page correctly is still suspicious

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

