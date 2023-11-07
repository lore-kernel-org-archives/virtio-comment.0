Return-Path: <virtio-comment-return-8216-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5405DC4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 04:05:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 85D832B06F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 04:05:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4C9B39867E1
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 04:05:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2D2809867DC; Tue,  7 Nov 2023 04:05:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BF1B39867DD
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 04:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: W6jA-iyFOgCInuJ8wittyw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699329882; x=1699934682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xf5HbcHiihjJltUYPjKTfEtvASXPR9JPwgWa0ysLDps=;
        b=MQE3c6DZwY9Wz0NF/7+LVpR/Dc3J0HnzPy8d5vs50DkIgSIKbsE5s+9VP3xGzcy5wg
         Gw868cMTqMm8T3pIuFXQ/HYH7VkutXjN/CyHqZwmQyexGyKppdY3p+/W8K87QzRiV9Yz
         4l8soaDNlV1gDU9+mwUQAgWmflJLeNeMNL4IBvrhzDQjdnwzKFWy0en/VIXATgG8UmOo
         d3/ee/I6QLsON+V4Wnn0dwMtoxY8mu/03CKnHPS3KJulcP+brmfbLf0meczaZqcZB9C0
         Ewxd0dX8xLZzLBObtHvqPyMgDht7eK+jhORgwekdZE5uwBka5FquhKk/sxDcLVu6dK18
         7j1Q==
X-Gm-Message-State: AOJu0YwBg6fx+P2evCTn2oSGfUVL35vXG1JDsFoQmT0jzujMh5X1t+ze
	bvOx7ynW1hzmsuqsLZI6cWjeblE8I38X4ZRwuGQc8TBRsM2nQOtnz5QQFSFpT5PRdr6ckO+oTKR
	pkXkUC5MwvM1/BnNTqf8Q6pF902+Zp2Sw4INX6JGnMjpGcRQQtw==
X-Received: by 2002:ac2:57c1:0:b0:509:456d:4549 with SMTP id k1-20020ac257c1000000b00509456d4549mr360632lfo.29.1699329881663;
        Mon, 06 Nov 2023 20:04:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzZNTnUjAUjXoNSpNL4o0HXSu34PthwhkoZktq/zuir49GGkNggNvyNSrtmXEeecgoRfbV/UMj/y2VM3Q05C4=
X-Received: by 2002:ac2:57c1:0:b0:509:456d:4549 with SMTP id
 k1-20020ac257c1000000b00509456d4549mr360624lfo.29.1699329881181; Mon, 06 Nov
 2023 20:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20231030131959.1386107-1-parav@nvidia.com> <20231030131959.1386107-7-parav@nvidia.com>
 <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com>
 <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com> <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 7 Nov 2023 12:04:29 +0800
Message-ID: <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
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

On Mon, Nov 6, 2023 at 2:54=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, November 6, 2023 12:04 PM
> >
> > On Thu, Nov 2, 2023 at 2:10=E2=80=AFPM Parav Pandit <parav@nvidia.com> =
wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Thursday, November 2, 2023 9:54 AM
> > > >
> > > > On Wed, Nov 1, 2023 at 11:02=E2=80=AFAM Parav Pandit <parav@nvidia.=
com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Wednesday, November 1, 2023 6:00 AM
> > > > > >
> > > > > > On Tue, Oct 31, 2023 at 11:27=E2=80=AFAM Parav Pandit <parav@nv=
idia.com>
> > wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Tuesday, October 31, 2023 7:13 AM
> > > > > > > >
> > > > > > > > On Mon, Oct 30, 2023 at 9:21=E2=80=AFPM Parav Pandit
> > > > > > > > <parav@nvidia.com>
> > > > wrote:
> > > > > > > > >
> > > > > > > > > During a device migration flow (typically in a precopy
> > > > > > > > > phase of the live migration), a device may write to the
> > > > > > > > > guest memory. Some iommu/hypervisor may not be able to
> > > > > > > > > track these
> > > > written pages.
> > > > > > > > > These pages to be migrated from source to destination hyp=
ervisor.
> > > > > > > > >
> > > > > > > > > A device which writes to these pages, provides the page
> > > > > > > > > address record of the to the owner device. The owner
> > > > > > > > > device starts write recording for the device and queries
> > > > > > > > > all the page addresses written by the device.
> > > > > > > > >
> > > > > > > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/17=
6
> > > > > > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > > > > > Signed-off-by: Satananda Burla <sburla@marvell.com>
> > > > > > > > > ---
> > > > > > > > > changelog:
> > > > > > > > > v1->v2:
> > > > > > > > > - addressed comments from Michael
> > > > > > > > > - replaced iova with physical address
> > > > > > > > > ---
> > > > > > > > >  admin-cmds-device-migration.tex | 15 +++++++++++++++
> > > > > > > > >  1 file changed, 15 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/admin-cmds-device-migration.tex
> > > > > > > > > b/admin-cmds-device-migration.tex index ed911e4..2e32f2c
> > > > > > > > > 100644
> > > > > > > > > --- a/admin-cmds-device-migration.tex
> > > > > > > > > +++ b/admin-cmds-device-migration.tex
> > > > > > > > > @@ -95,6 +95,21 @@ \subsubsection{Device
> > > > > > > > > Migration}\label{sec:Basic Facilities of a Virtio Device =
/
> > > > > > > > > The owner driver can discard any partially read or writte=
n
> > > > > > > > > device context when  any of the device migration flow
> > > > > > > > should be aborted.
> > > > > > > > >
> > > > > > > > > +During the device migration flow, a passthrough device
> > > > > > > > > +may write data to the guest virtual machine's memory, a
> > > > > > > > > +source hypervisor needs to keep track of these written
> > > > > > > > > +memory to migrate such memory to destination
> > > > > > > > hypervisor.
> > > > > > > > > +Some systems may not be able to keep track of such memor=
y
> > > > > > > > > +write addresses at hypervisor level. In such a scenario,
> > > > > > > > > +a device records and reports these written memory
> > > > > > > > > +addresses to the owner device. The owner driver enables
> > > > > > > > > +write recording for one or more physical address ranges
> > > > > > > > > +per device during device
> > > > migration flow.
> > > > > > > > > +The owner driver periodically queries these written
> > > > > > > > > +physical address
> > > > > > records from the device.
> > > > > > > >
> > > > > > > > I wonder how PA works in this case. Device uses untranslate=
d
> > > > > > > > requests so it can only see IOVA. We can't mandate ATS anyh=
ow.
> > > > > > > Michael suggested to keep the language uniform as PA as this
> > > > > > > is ultimately
> > > > > > what the guest driver is supplying during vq creation and in
> > > > > > posting buffers as physical address.
> > > > > >
> > > > > > This seems to need some work. And, can you show me how it can w=
ork?
> > > > > >
> > > > > > 1) e.g if GAW is 48 bit, is the hypervisor expected to do a
> > > > > > bisection of the whole range?
> > > > > > 2) does the device need to reserve sufficient internal resource=
s
> > > > > > for logging the dirty page and why (not)?
> > > > > No when dirty page logging starts, only at that time, device will
> > > > > reserve
> > > > enough resources.
> > > >
> > > > GAW is 48bit, how large would it have then?
> > > Dirty page tracking is not dependent on the size of the GAW.
> > > It is function of address ranges for the amount of guest memory regar=
dless of
> > GAW.
> >
> > The problem is, e.g when vIOMMU is enabled, you can't know which IOVA i=
s
> > actually used by guests. And even for the case when vIOMMU is not enabl=
ed,
> > the guest may have several TBs. Is it easy to reserve sufficient resour=
ces by the
> > device itself?
> >
> When page tracking is enabled per device, it knows about the range and it=
 can reserve certain resource.

I didn't see such an interface in this series. Anything I miss?

Btw, the IOVA is allocated by the guest actually, how can we know the
range? (or using the host range?)

>
> > Host should always have more resources than device, in that sense there=
 could
> > be several methods that tries to utilize host memory instead of the one=
 in the
> > device. I think we've discussed this when going through the doc prepare=
d by
> > Eugenio.
> >
> > >
> > > > What happens if we're trying to migrate more than 1 device?
> > > >
> > > That is perfectly fine.
> > > Each device is updating its log of pages it wrote.
> > > The hypervisor is collecting their sum.
> >
> > See above.
> >
> > >
> > > > >
> > > > > > 3) DMA is part of the transport, it's natural to do logging
> > > > > > there, why duplicate efforts in the virtio layer?
> > > > > He he, you have funny comment.
> > > > > When an abstract facility is added to virtio you say to do in tra=
nsport.
> > > >
> > > > So it's not done in the general facility but tied to the admin part=
.
> > > > And we all know dirty page tracking is a challenge and Eugenio has =
a
> > > > good summary of pros/cons. A revisit of those docs make me think
> > > > virtio is not the good place for doing that for may reasons:
> > > >
> > > > 1) as stated, platform will evolve to be able to tracking dirty
> > > > pages, actually, it has been supported by a lot of major IOMMU
> > > > vendors
> > >
> > > This is optional facility in virtio.
> > > Can you please point to the references? I don=E2=80=99t see it in the=
 common Linux
> > kernel support for it.
> >
> > Note that when IOMMUFD is being proposed, dirty page tracking is one of=
 the
> > major considerations.
> >
> > This is one recent proposal:
> >
> > https://www.spinics.net/lists/kvm/msg330894.html
> >
> Sure, so if platform supports it. it can be used from the platform.
> If it does not, the device supplies it.
>
> > > Instead Linux kernel choose to extend to the devices.
> >
> > Well, as I stated, tracking dirty pages is challenging if you want to d=
o it on a
> > device, and you can't simply invent dirty page tracking for each type o=
f the
> > devices.
> >
> It is not invented.
> It is generic framework for all virtio device types as proposed here.
> Keep in mind, that it is optional already in v3 series.
>
> > > At least not seen to arrive this in any near term in start of 2024 wh=
ich is
> > where users must use this.
> > >
> > > > 2) you can't assume virtio is the only device that can be used by
> > > > the guest, having dirty pages tracking to be implemented in each
> > > > type of device is unrealistic
> > > Of course, there is no such assumption made. Where did you see a text=
 that
> > made such assumption?
> >
> > So what happens if you have a guest with virtio and other devices assig=
ned?
> >
> What happens? Each device type would do its own dirty page tracking.
> And if all devices does not have support, hypervisor knows to fall back t=
o platform iommu or its own.
>
> > > Each virtio and non virtio devices who wants to report their dirty pa=
ge report,
> > will do their way.
> > >
> > > > 3) inventing it in the virtio layer will be deprecated in the futur=
e
> > > > for sure, as platform will provide much rich features for logging
> > > > e.g it can do it per PASID etc, I don't see any reason virtio need
> > > > to compete with the features that will be provided by the platform
> > > Can you bring the cpu vendors and committement to virtio tc with time=
lines
> > so that virtio TC can omit?
> >
> > Why do we need to bring CPU vendors in the virtio TC? Virtio needs to b=
e built
> > on top of transport or platform. There's no need to duplicate their job=
.
> > Especially considering that virtio can't do better than them.
> >
> I wanted to see a strong commitment for the cpu vendors to support dirty =
page tracking.

The RFC of IOMMUFD support can go back to early 2022. Intel, AMD and
ARM are all supporting that now.

> And the work seems to have started for some platforms.

Let me quote from the above link:

"""
Today, AMD Milan (or more recent) supports it while ARM SMMUv3.2
alongside VT-D rev3.x also do support.
"""

> Without such platform commitment, virtio also skipping it would not work.

Is the above sufficient? I'm a little bit more familiar with vtd, the
hw feature has been there for years.

>
> > > i.e. in first year of 2024?
> >
> > Why does it matter in 2024?
> Because users needs to use it now.
>
> >
> > > If not, we are better off to offer this, and when/if platform support=
 is, sure,
> > this feature can be disabled/not used/not enabled.
> > >
> > > > 4) if the platform support is missing, we can use software or
> > > > leverage transport for assistance like PRI
> > > All of these are in theory.
> > > Our experiment shows PRI performance is 21x slower than page fault ra=
te
> > done by the cpu.
> > > It simply does not even pass a simple 10Gbps test.
> >
> > If you stick to the wire speed during migration, it can converge.
> Do you have perf data for this?

No, but it's not hard to imagine the worst case. Wrote a small program
that dirty every page by a NIC.

> In the internal tests we don=E2=80=99t see this happening.

downtime =3D dirty_rates * PAGE_SIZE / migration_speed

So if we get very high dirty rates (e.g by a high speed NIC), we can't
satisfy the requirement of the downtime. Or if you see the converge,
you might get help from the auto converge support by the hypervisors
like KVM where it tries to throttle the VCPU then you can't reach the
wire speed.

>
> >
> > > There is no requirement for mandating PRI either.
> > > So it is unusable.
> >
> > It's not about mandating, it's about doing things in the correct layer.=
 If PRI is
> > slow, PCI can evolve for sure.
> You should try.

Not my duty, I just want to make sure things are done in the correct
layer, and once it needs to be done in the virtio, there's nothing
obviously wrong.

> In the current state, it is mandating.
> And if you think PRI is the only way,

I don't, it's just an example where virtio can leverage from either
transport or platform. Or if it's the fault in virtio that slows down
the PRI, then it is something we can do.

>  than you should propose that in the dirty page tracking series that you =
listed above to not do dirty page tracking. Rather depend on PRI, right?

No, the point is to not duplicate works especially considering virtio
can't do better than platform or transport.

>
> >
> > >
> > > >
> > > > > When one does something in transport, you say, this is transport
> > > > > specific, do
> > > > some generic.
> > > > >
> > > > > Here the device is being tracked is virtio device.
> > > > > PCI-SIG has told already that PCIM interface is outside the scope=
 of it.
> > > > > Hence, this is done in virtio layer here in abstract way.
> > > >
> > > > You will end up with a competition with the platform/transport one
> > > > that will fail.
> > > >
> > > I don=E2=80=99t see a reason. There is no competition.
> > > Platform always have a choice to not use device side page tracking wh=
en it is
> > supported.
> >
> > Platform provides a lot of other functionalities for dirty logging:
> > e.g per PASID, granular, etc. So you want to duplicate them again in th=
e virtio? If
> > not, why choose this way?
> >
> It is optional for the platforms where platform do not have it.

We are developing new virtio functionalities that are targeted for
future platforms. Otherwise we would end up with a feature with a very
narrow use case.

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

