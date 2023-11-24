Return-Path: <virtio-comment-return-8579-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACE3C61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:08:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4A2CB339B7
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:08:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 331F19868B4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:08:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2782F9865ED; Fri, 24 Nov 2023 03:08:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 19DA79868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 03:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Oy90Be4sOO-9jiMgNHbsww-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700795285; x=1701400085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NyvZjsbMFqjPm3oieO1/03b7vLsX3/XzF3HRdpH3Hlc=;
        b=KHYCZaLKDSiSLLybX3oW+qWXhUU9t/3j2+yHZJ/4jcTujCzBGw+DoUNXLa91WWeaBR
         YQcyXTz4AcNOKmiz3EIthAHJd8zSCXTn7Hs00t3zF9be0hMbkVnOEphDnvi9pajSFJcQ
         SVOgyRM+4qhFL3ae5LBaNHb02rnULCMsc9rtpbV+7XvM9Di0GQjy5qo9DSFDKwIM28O2
         SWpRs4fISmq1fXailEhA+1+0Dt5dddSHqyP7BMP6Uhw5jElgbafvYPEBvBj5eyzhcq47
         IvsBsvcdyNKtN0o9YX+M6vRTz9DrG92z+anLZBEywW7hz/pYagHm3PlVR7k7whKtaHkp
         IL9g==
X-Gm-Message-State: AOJu0YyfcPk++tugZ9SxdF4DzkhE51JCpGrQA8m66R8iWhnmXQEMcVRv
	aGjERdLhrfi5+vqFt+c6hTf9XR6EZPyhfDGou8+K5DJp32qfjwzSbYAMUTqZ1BotOBeGYzRGenq
	bTAY5Q6k5WNWZpYv8hyuX4xPls2mg3KtHojJq1jn4ak3folMvxQ==
X-Received: by 2002:ac2:51b7:0:b0:500:b63f:4db3 with SMTP id f23-20020ac251b7000000b00500b63f4db3mr765592lfk.35.1700795285559;
        Thu, 23 Nov 2023 19:08:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkwzoJ9vjZn2FTcigVVcolyYKSjNL6y5y0aSdVvQt/iID3yeDjC954jYO1GIIdqh7XZaDaen9mPuueRC9/0o8=
X-Received: by 2002:ac2:51b7:0:b0:500:b63f:4db3 with SMTP id
 f23-20020ac251b7000000b00500b63f4db3mr765584lfk.35.1700795285083; Thu, 23 Nov
 2023 19:08:05 -0800 (PST)
MIME-Version: 1.0
References: <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117050357-mutt-send-email-mst@kernel.org> <PH0PR12MB54810D15E0897C2435697E39DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117060456-mutt-send-email-mst@kernel.org> <PH0PR12MB5481AB5ECF613D806C338C54DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063406-mutt-send-email-mst@kernel.org> <PH0PR12MB5481089119BAB97C8F4B7CE0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsQorfXDUAv-oesSAVM4A4AdaGuutJ0-5uqGTe1f0kXQw@mail.gmail.com>
 <PH0PR12MB548197D801989844FAA702B5DCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuCMYYDss=Wmk=03Wpr3Gg2+Cy0tCf-X8r+N1PcjYayVg@mail.gmail.com> <PH0PR12MB5481C748270CCD8255ED869EDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481C748270CCD8255ED869EDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 11:07:53 +0800
Message-ID: <CACGkMEsYoC7wd70gNu1OXRh7nHGyyaTDm7-GQehJp6QOY8DmFQ@mail.gmail.com>
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

On Wed, Nov 22, 2023 at 12:26=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, November 22, 2023 9:49 AM
> >
> > On Wed, Nov 22, 2023 at 12:30=E2=80=AFAM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, November 21, 2023 10:55 AM
> > > >
> > > > On Fri, Nov 17, 2023 at 8:03=E2=80=AFPM Parav Pandit <parav@nvidia.=
com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Friday, November 17, 2023 5:13 PM
> > > > > >
> > > > > > On Fri, Nov 17, 2023 at 11:20:14AM +0000, Parav Pandit wrote:
> > > > > > >
> > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > Sent: Friday, November 17, 2023 4:41 PM
> > > > > > > >
> > > > > > > > On Fri, Nov 17, 2023 at 10:20:45AM +0000, Parav Pandit wrot=
e:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > Sent: Friday, November 17, 2023 3:38 PM
> > > > > > > > > >
> > > > > > > > > > On Wed, Nov 15, 2023 at 05:39:43PM +0000, Parav Pandit
> > wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > Additionally, if hypervisor has put the trap on
> > > > > > > > > > > > > virtio config, and because the memory device
> > > > > > > > > > > > > already has the interface for virtio config,
> > > > > > > > > > > > >
> > > > > > > > > > > > > Hypervisor can directly write/read from the
> > > > > > > > > > > > > virtual config to the member's
> > > > > > > > > > > > config space, without going through the device cont=
ext,
> > right?
> > > > > > > > > > > >
> > > > > > > > > > > > If it can do it or it can choose to not. I don't se=
e
> > > > > > > > > > > > how it is related to the discussion here.
> > > > > > > > > > > >
> > > > > > > > > > > It is. I don=E2=80=99t see a point of hypervisor not =
using the
> > > > > > > > > > > native interface provided
> > > > > > > > > > by the member device.
> > > > > > > > > >
> > > > > > > > > > So for example, it seems reasonable to a member
> > > > > > > > > > supporting both existing pci register interface for
> > > > > > > > > > compatibility and the future DMA based one for scale. I=
n
> > > > > > > > > > such a case, it seems possible that DMA will expose mor=
e
> > > > > > > > > > features than pci. And then a hypervisor might decide t=
o
> > > > > > > > > > use
> > > > > > > > that in preference to pci registers.
> > > > > > > > >
> > > > > > > > > We don=E2=80=99t find it right to involve owner device fo=
r
> > > > > > > > > mediating at current scale
> > > > > > > >
> > > > > > > > In this model, device will be its own owner. Should not be =
a
> > problem.
> > > > > > > >
> > > > > > > I didn=E2=80=99t understand above comment.
> > > > > >
> > > > > > We'd add a new group type "self". You can then send admin
> > > > > > commands through VF itself not through PF.
> > > > > >
> > > > > How? The device is owned by the guest. FLR and device reset canno=
t
> > > > > send
> > > > the admin command reliably.
> > > > >
> > > > > >
> > > > > > > > > and to not break TDISP efforts in upcoming time by such d=
esign.
> > > > > > > >
> > > > > > > > Look you either stop mentioning TDISP as motivation or
> > > > > > > > actually try to address it. Safe migration with TDISP is re=
ally hard.
> > > > > > > But that is not an excuse to say that TDISP migration is not
> > > > > > > present, hence
> > > > > > involve the owner device for config space access.
> > > > > > > This is another hurdle added that further blocks us away from
> > TDISP.
> > > > > > > Hence, we don=E2=80=99t want to take the route of involving o=
wner
> > > > > > > device for any
> > > > > > config access.
> > > > > >
> > > > > > This "blocks" is all just wild hunches. hypervisor controls som=
e
> > > > > > aspects of TDISP devices for sure - maybe we actually should us=
e
> > > > > > pci config space as that is generally hypervisor controlled.
> > > > > Even bad to do hypercalls.
> > > > > I showed you last time the role of the PCI config space snippet
> > > > > from the
> > > > spec.
> > > > > Do you see we are repeating the discussion again?
> > > > >
> > > > > >
> > > > > > > > For example, your current patches are clearly broken for TD=
ISP:
> > > > > > > > owner can control queue state at any time making device
> > > > > > > > modify memory in any way it wants.
> > > > > > > >
> > > > > > > When TDISP migration is needed, the admin device can be
> > > > > > > another TVM
> > > > > > outside the HV scope.
> > > > > > > Or an alternative would have device context encrypted not
> > > > > > > visible to HV
> > > > at all.
> > > > > >
> > > > > > Maybe. Fact remains your patches do conflict with TDISP and you
> > > > > > seem to be fine with it because you have a hunch you can fix it=
.
> > > > > > But we can't do development based on your hunches.
> > > > > >
> > > > > We have different view.
> > > > > My patches do not conflict with TDISP because TDISP has clear
> > > > > definition of
> > > > not involving hypervisor for transport.
> > > > > And that part is still preserved.
> > > > > Delegating the migration to another TDISP or encrypting is yet to=
 be
> > defined.
> > > > > And current patches will align to both the approaches in future.
> > > > >
> > > > > So you need to re-evaluate your judgment.
> > > > >
> > > > > >
> > > > > > > Such encryption is not possible, with the trap+emulation
> > > > > > > method, where HV
> > > > > > will have to decrypt the data coming over MMIO writes.
> > > > > >
> > > > > > I don't how what trap+emulation has to do with it. Do you refer
> > > > > > to the shadow vq thing?
> > > > >
> > > > > The method proposed here does not hinder any TDISP direction.
> > > > >
> > > > > Without my proposal, do you have a method that does not involve
> > > > hypervisor intervention for virtio common and device config space,
> > > > cvq and shadow vq?
> > > > > If so, I would like to hear that as well because that will align =
with TDISP.
> > > >
> > > > So this is what you said:
> > > >
> > > > 1) TDISP would not do mediation
> > > > 2) registers doesn't scale
> > > >
> > > > This is exactly what transport virtqueue did. Isn't it?
> > > >
> > > No.
> > > CVQ is doing both of them currently uniformly across PF, VF.
> > > Future SIOV will be able to this also.
> >
> > Please explain how CVQ is related. Or how transport virtqueue blocks CV=
Q in
> > any sense. Or any transport virtqueue commands do that.
> >
> Any new configuration of PF, VF device is done over CVQ as listed in the =
doc by the guest directly.
> Same is usable for SIOV too.
>
> > Then let's continue the discussion here.
> >
> > >
> > > > >
> > > > > > I am guessing modern platforms with TDISP support are likely to
> > > > > > also support dirty bit in the IOMMU.
> > > > > >
> > > > > It will be some day.
> > > >
> > > > Dirty bit is far more realistic than TDISP in the short term.
> > > >
> > > > >
> > > > > >
> > > > > > > > > And for future scale, having new SIOV interface makes mor=
e
> > > > > > > > > sense which has
> > > > > > > > its own direct interface to device.
> > > > > > > > >
> > > > > > > > > I finally captured all past discussions in form of a FAQ =
at [1].
> > > > > > > > >
> > > > > > > > > [1]
> > > > > > > > > https://docs.google.com/document/d/1Iyn-l3Nm0yls3pZaul4lZ=
i
> > > > > > > > > Vj8x
> > > > > > > > > 1s73
> > > > > > > > > Ed6r
> > > > > > > > > Osmn6LfXc/edit?usp=3Dsharing
> > > > > > > >
> > > > > > > > Yea skimmed that, "Cons: None". Are you 100% sure? Anyway,
> > > > > > > > discussion will take place on the mailing list please.
> > > > > > >
> > > > > > > We cannot keep discussing the register interface every week.
> > > > > > > I remember we have discussed this many times already in
> > > > > > > following
> > > > series.
> > > > > > >
> > > > > > > 1. legacy series
> > > >
> > > > How can this be supported in TDISP then?
> >
> > Please answer this question.
> >
> There is no requirement to support TDISP with legacy because TDISP archi =
require attestation and other things which were not there in legacy VMs any=
way.

How TDISP/attestation is related to a specific device driver? How can
a legacy DPDK driver break things like attestation here?

> Hence it is not applicable.

Wow. The legacy tunnel was just invented by you for just several
months and soon became a second-class citizen in the proposal here?

>
>
> > > >
> > > > > > > 2. tvq v4 series
> > > > > > > 3. dynamic vq creation series
> > > > > > > 4. again during suspend series under tvq head 5. right now 6.
> > > > > > > May be more that I forgot.
> > > > > > >
> > > > > > > I captured all the direction and options in the doc. One can
> > > > > > > refer when those
> > > > > > questions arise there.
> > > > > > > If we don=E2=80=99t work cohesively same reasoning repetition=
 does not
> > help.
> > > > > >
> > > > > > It's still the same too, doc or no doc. You want to build a
> > > > > > device without registers fine but don't force it down everyone'=
s
> > throat.
> > > > > I don=E2=80=99t see any compelling reason for inventing new metho=
d really.
> > > >
> > > > New requests/platforms come for sure, and virtio supports various
> > transports.
> > > >
> > > > For example, there's a request to support PCI endpoint devices.
> > > What is PCI endpoint devices? Does it have a new device type?
> >
> > https://docs.kernel.org/PCI/endpoint/index.html
> >
> > >
> > > >
> > > > > Nor continuing in register mode.
> > > >
> > > > Most virtio devices are implemented in software.
> > > We see it differently in field and in virtio charter since 2021.
> >
> > I think we're talking about different things.
> So lets make any arbitrary comment as virtio is done in sw.
>
> >
> > >
> > > > And we have pure MMIO
> > > > based transport now which is implemented in registers only.
> > > >
> > > > > Virtio already has VQ.
> > > > > If CVQ is so problematic, one should put everything on registers
> > > > > and not run
> > > > on double standards.
> > > >
> > > > I don't think there's anyone who says CVQ is problematic.
> > > >
> > > Ok. than lets stop this endless debate.
> > > Everyone is using CVQ, lets continue to use.
> >
> > The CVQ and transport vitqueue is orthogonal. Again, there seems nobody
> > think transport virtqueue is a replacement of CVQ other than you.
> The performance numbers for the need of transport virtqueue are not publi=
shed yet.

Have you published any numbers with admin virtqueue so far?

> So there is no need of transport virtqueue for VF and SIOV.

Let's not double standard please.

>
> >
> > >
> > > > >
> > > > > I captured all the reasoning and thoughts. I don=E2=80=99t have m=
uch to
> > > > > say in
> > > > support of infinite register scale.
> > > > >
> > > > > People who wants to push SIOV does not show single performance
> > > > > reason
> > > > on why SIOV to be done.
> > > > > I have upstreamed SIOVs in Linux as SFs without PASID, and in all
> > > > > our scale
> > > > tests, before the device chocks, the system chocks.
> > > > >
> > > > > So when someone pushes the SIOV series, I will be the first one
> > > > > interested in
> > > > reading the performance numbers to proceed with patches.
> > > > >
> > > > > > And now with 8MBytes
> > > > > > of on-device memory that's needed for migration and that's
> > > > > > apparently fine I am even less interested in saving 256 bytes
> > > > > > for config
> > > > space.
> > > > >
> > > > > Again, not the right comparison.
> > > > > When and how to use 256 matters.
> > > >
> > > > Do you know how much the config has grown in the past years since 1=
.0?
> > > >
> > > Very less and no point in deviating the design now anyway for device
> > migration or otherwise.
> > >
> > > > Virtio should be implemented easily from:
> > > >
> > > And it is already there.
> > >
> > > > 1) software device to hardware device
> > > > 2) embedded to server
> > > >
> > > > You can't say e.g migration is needed in all of the environments.
> > > Which line in the patch said this?
> >
> > You said you don't want to let the register grow. No?
> >
> Right.
> Hence all config work to occur on CVQ by the driver owning the device wit=
hout mediation.

CVQ is device specific, it can't be used for things like vq reset.

>
>
> > Why do an embedded virtio device need to implement admin virtqueue just
> > for a new function like suspend or vq reset?
> >
> Vq reset, vq enable are blocking operation by nature post the device init=
 is done.

Let's not have any assumption of transport.

> Hence, they don=E2=80=99t belong to init time config registers.

I don't get how this is related.

>
> > > I specifically asked to not build transport vq because efficiency is =
needed
> > on the PFs too.
> >
> > Transport virtqueue can be done in PF.
> >
> Please explain why PF needs a transport VQ. I explained all in the doc.

You invent a transport via adminq, then you want me to explain why?

What's more, the rationale has been in the transport virtqueue series.
It fits for the case where the register can't work well. SIOV is only
one of the possible use cases.

Thanks

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

