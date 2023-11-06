Return-Path: <virtio-comment-return-8184-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E0DC4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 06:35:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DA6652AD4B
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 06:35:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A145E986728
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 06:35:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7BD76986703; Mon,  6 Nov 2023 06:35:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A34F986704
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 06:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: AqJIoBY8PNm7XAf1QmTzcA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699252476; x=1699857276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evYdFSA9qNz3LynTKwKMIkIigsH2R9tlzSpVCiWdwZc=;
        b=cKRK51bc5hPddjlHTGqJHmvwAUA0bLimUzt38fpm9rYWg6Oq90NejHFCQqQr2aJqOn
         v1eOf1YCUw/rP7Gx4OmzwmD4xHZMo6qu5BFc2t12Lu+wnpcWM2ers+UTij0DWDX4id85
         HjX59VRpYXMpa48ephGLa98twTR7xiG3mRSUFsgueukFsTBgQOLH819Ev61EoLFER5v/
         uLlZ/DxMqGqRMFd0pS+JWJQQJ2kCLT9dd4z7DN1jyJzbmsPDvz9BZKxJU679YZf1nCY3
         xxEZiAB1+iCifvkMOGU+c53LcLTnqdGcCN0P6n6mxhZszKMpMgHgncGHN3L9NqRwvGiF
         ReOg==
X-Gm-Message-State: AOJu0YwzDw2TFHb9qt6jTb5gXS/nQIUbTGBHciAvjOSGbdOR91HCy3yG
	tTVRz3Outdx4QApHFbn+a8a1nkoUVQeLl/7M+enN5EszAJCNndnoxdLCjLwg+QWNuEaqUviLb+p
	wqT/iwFxQquOggRP357iUFMJhyak/YWaXrXH2hHWQG5vKWYgqNA==
X-Received: by 2002:a05:6512:114b:b0:507:9ae6:6913 with SMTP id m11-20020a056512114b00b005079ae66913mr26426428lfg.28.1699252476573;
        Sun, 05 Nov 2023 22:34:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3A6TJBhsGDP+623eiqgjV6QxgUalBLsQbe7HR9PjxW/otunSTyQW2T3rAeXVp21BwE+O7CrDQp6z0gz+7AeQ=
X-Received: by 2002:a05:6512:114b:b0:507:9ae6:6913 with SMTP id
 m11-20020a056512114b00b005079ae66913mr26426417lfg.28.1699252476189; Sun, 05
 Nov 2023 22:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20231030131959.1386107-1-parav@nvidia.com> <20231030131959.1386107-7-parav@nvidia.com>
 <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com>
 <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com> <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 6 Nov 2023 14:34:24 +0800
Message-ID: <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
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

On Thu, Nov 2, 2023 at 2:10=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, November 2, 2023 9:54 AM
> >
> > On Wed, Nov 1, 2023 at 11:02=E2=80=AFAM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Wednesday, November 1, 2023 6:00 AM
> > > >
> > > > On Tue, Oct 31, 2023 at 11:27=E2=80=AFAM Parav Pandit <parav@nvidia=
.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Tuesday, October 31, 2023 7:13 AM
> > > > > >
> > > > > > On Mon, Oct 30, 2023 at 9:21=E2=80=AFPM Parav Pandit <parav@nvi=
dia.com>
> > wrote:
> > > > > > >
> > > > > > > During a device migration flow (typically in a precopy phase
> > > > > > > of the live migration), a device may write to the guest
> > > > > > > memory. Some iommu/hypervisor may not be able to track these
> > written pages.
> > > > > > > These pages to be migrated from source to destination hypervi=
sor.
> > > > > > >
> > > > > > > A device which writes to these pages, provides the page
> > > > > > > address record of the to the owner device. The owner device
> > > > > > > starts write recording for the device and queries all the pag=
e
> > > > > > > addresses written by the device.
> > > > > > >
> > > > > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
> > > > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > > > Signed-off-by: Satananda Burla <sburla@marvell.com>
> > > > > > > ---
> > > > > > > changelog:
> > > > > > > v1->v2:
> > > > > > > - addressed comments from Michael
> > > > > > > - replaced iova with physical address
> > > > > > > ---
> > > > > > >  admin-cmds-device-migration.tex | 15 +++++++++++++++
> > > > > > >  1 file changed, 15 insertions(+)
> > > > > > >
> > > > > > > diff --git a/admin-cmds-device-migration.tex
> > > > > > > b/admin-cmds-device-migration.tex index ed911e4..2e32f2c
> > > > > > > 100644
> > > > > > > --- a/admin-cmds-device-migration.tex
> > > > > > > +++ b/admin-cmds-device-migration.tex
> > > > > > > @@ -95,6 +95,21 @@ \subsubsection{Device
> > > > > > > Migration}\label{sec:Basic Facilities of a Virtio Device /
> > > > > > > The owner driver can discard any partially read or written
> > > > > > > device context when  any of the device migration flow
> > > > > > should be aborted.
> > > > > > >
> > > > > > > +During the device migration flow, a passthrough device may
> > > > > > > +write data to the guest virtual machine's memory, a source
> > > > > > > +hypervisor needs to keep track of these written memory to
> > > > > > > +migrate such memory to destination
> > > > > > hypervisor.
> > > > > > > +Some systems may not be able to keep track of such memory
> > > > > > > +write addresses at hypervisor level. In such a scenario, a
> > > > > > > +device records and reports these written memory addresses to
> > > > > > > +the owner device. The owner driver enables write recording
> > > > > > > +for one or more physical address ranges per device during de=
vice
> > migration flow.
> > > > > > > +The owner driver periodically queries these written physical
> > > > > > > +address
> > > > records from the device.
> > > > > >
> > > > > > I wonder how PA works in this case. Device uses untranslated
> > > > > > requests so it can only see IOVA. We can't mandate ATS anyhow.
> > > > > Michael suggested to keep the language uniform as PA as this is
> > > > > ultimately
> > > > what the guest driver is supplying during vq creation and in postin=
g
> > > > buffers as physical address.
> > > >
> > > > This seems to need some work. And, can you show me how it can work?
> > > >
> > > > 1) e.g if GAW is 48 bit, is the hypervisor expected to do a
> > > > bisection of the whole range?
> > > > 2) does the device need to reserve sufficient internal resources fo=
r
> > > > logging the dirty page and why (not)?
> > > No when dirty page logging starts, only at that time, device will res=
erve
> > enough resources.
> >
> > GAW is 48bit, how large would it have then?
> Dirty page tracking is not dependent on the size of the GAW.
> It is function of address ranges for the amount of guest memory regardles=
s of GAW.

The problem is, e.g when vIOMMU is enabled, you can't know which IOVA
is actually used by guests. And even for the case when vIOMMU is not
enabled, the guest may have several TBs. Is it easy to reserve
sufficient resources by the device itself?

Host should always have more resources than device, in that sense
there could be several methods that tries to utilize host memory
instead of the one in the device. I think we've discussed this when
going through the doc prepared by Eugenio.

>
> > What happens if we're trying to migrate more than 1 device?
> >
> That is perfectly fine.
> Each device is updating its log of pages it wrote.
> The hypervisor is collecting their sum.

See above.

>
> > >
> > > > 3) DMA is part of the transport, it's natural to do logging there,
> > > > why duplicate efforts in the virtio layer?
> > > He he, you have funny comment.
> > > When an abstract facility is added to virtio you say to do in transpo=
rt.
> >
> > So it's not done in the general facility but tied to the admin part.
> > And we all know dirty page tracking is a challenge and Eugenio has a go=
od
> > summary of pros/cons. A revisit of those docs make me think virtio is n=
ot the
> > good place for doing that for may reasons:
> >
> > 1) as stated, platform will evolve to be able to tracking dirty pages, =
actually, it
> > has been supported by a lot of major IOMMU vendors
>
> This is optional facility in virtio.
> Can you please point to the references? I don=E2=80=99t see it in the com=
mon Linux kernel support for it.

Note that when IOMMUFD is being proposed, dirty page tracking is one
of the major considerations.

This is one recent proposal:

https://www.spinics.net/lists/kvm/msg330894.html

> Instead Linux kernel choose to extend to the devices.

Well, as I stated, tracking dirty pages is challenging if you want to
do it on a device, and you can't simply invent dirty page tracking for
each type of the devices.

> At least not seen to arrive this in any near term in start of 2024 which =
is where users must use this.
>
> > 2) you can't assume virtio is the only device that can be used by the g=
uest,
> > having dirty pages tracking to be implemented in each type of device is
> > unrealistic
> Of course, there is no such assumption made. Where did you see a text tha=
t made such assumption?

So what happens if you have a guest with virtio and other devices assigned?

> Each virtio and non virtio devices who wants to report their dirty page r=
eport, will do their way.
>
> > 3) inventing it in the virtio layer will be deprecated in the future fo=
r sure, as
> > platform will provide much rich features for logging e.g it can do it p=
er PASID
> > etc, I don't see any reason virtio need to compete with the features th=
at will be
> > provided by the platform
> Can you bring the cpu vendors and committement to virtio tc with timeline=
s so that virtio TC can omit?

Why do we need to bring CPU vendors in the virtio TC? Virtio needs to
be built on top of transport or platform. There's no need to duplicate
their job. Especially considering that virtio can't do better than
them.

> i.e. in first year of 2024?

Why does it matter in 2024?

> If not, we are better off to offer this, and when/if platform support is,=
 sure, this feature can be disabled/not used/not enabled.
>
> > 4) if the platform support is missing, we can use software or leverage =
transport
> > for assistance like PRI
> All of these are in theory.
> Our experiment shows PRI performance is 21x slower than page fault rate d=
one by the cpu.
> It simply does not even pass a simple 10Gbps test.

If you stick to the wire speed during migration, it can converge.

> There is no requirement for mandating PRI either.
> So it is unusable.

It's not about mandating, it's about doing things in the correct
layer. If PRI is slow, PCI can evolve for sure.

>
> >
> > > When one does something in transport, you say, this is transport spec=
ific, do
> > some generic.
> > >
> > > Here the device is being tracked is virtio device.
> > > PCI-SIG has told already that PCIM interface is outside the scope of =
it.
> > > Hence, this is done in virtio layer here in abstract way.
> >
> > You will end up with a competition with the platform/transport one that=
 will
> > fail.
> >
> I don=E2=80=99t see a reason. There is no competition.
> Platform always have a choice to not use device side page tracking when i=
t is supported.

Platform provides a lot of other functionalities for dirty logging:
e.g per PASID, granular, etc. So you want to duplicate them again in
the virtio? If not, why choose this way?

>
> > >
> > > > I can't see how it can compete with the functionality that is
> > > > provided by the platform. And what's more, we can't assume virtio i=
s
> > > > the only device that is used by the guest.
> > > >
> > > You raised this before and it was answered.
> > > Not all platform support dirty page tracking effectively.
> > > This is optional facility that speed up the migration down time signi=
ficantly.
> >
> > I can hardly believe the downtime is determined by the speed of logging=
 dirty
> > pages...
> >
> Without dirty page tracking, in pre-copy, all the memory must be migrated=
 again, which takes significantly longer time.

It's about w/ and w/o dirty page tracking, it's not about the speed of
dirty page tracking.

>
> > > So until platform supports it, it is supported by virtio.
> >
> > Some platforms already support that.
> >
> And some done.
> Hence whichever wants to use by platform, will use by platform.
> Whichever prefer to use from device will use by the device.

I don't think so, for example virtio has a hard time when it doesn't
rely on the platform (e.g IOMMU). We don't want to repeat that
tragedy.

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

