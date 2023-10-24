Return-Path: <virtio-comment-return-7930-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E92C00A8F
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 04:57:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F2F9E2B022
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 04:57:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BAEF398699D
	for <virtio-comment@archiver.kernel.org>; Tue, 24 Oct 2023 04:57:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9E3AB98638A; Tue, 24 Oct 2023 04:57:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8E6D0986992
	for <virtio-comment@lists.oasis-open.org>; Tue, 24 Oct 2023 04:57:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ycx4uKiXMryY4FMfCUS6KQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698123428; x=1698728228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVpJR24oruCTMb8RwU4OKHoULXEWDGrFZA57hsbCzCA=;
        b=Pb73cQos4c92Kp1z+6+26YvvVlE2QDz8UT+46ahO8y6Mg+8Q53/Xnydl0ArhsWNow9
         Higd0oaMxi5ipYT5JwmKU9m7VdFIYlG/vwRHNCxOIX/F3hKFWONwodqIQgpBZsDXPqfq
         JLM/PGaBvBHlXlHX9jDmarNdytKEuhuUr0UpKcF0rs0kITu7OLerdn9NHiY5Pc+hKoin
         Ia+0mH3q0/eq4BDc0WPgHG5TT3aWsNuicERrM3jR2nP3byiY2KRRY0fqdM0+Hf9ls79v
         Wt1p4uHHT4p5bNLmPTdjdTjQaN4mt8IFea1Jx6jbOLYh4+Mb/9PB7DzHOJs6eTAopuYu
         X54g==
X-Gm-Message-State: AOJu0YydM6ryo8jJr7j3M68oSbePrcwQhhGwvsLEPx1OtnTOK3givNVu
	VHiBR46Wn/Vo+xPhtV5JOgHizqeIXNLSacro0Ymx51JK8DYGvO1J93LurwefIeJi8pDlINVW/YD
	OKvhadZBlzsGojOl34cbUb3eiWEdEXKyaG20elSSttP3uFP5wjA==
X-Received: by 2002:ac2:4202:0:b0:500:9214:b308 with SMTP id y2-20020ac24202000000b005009214b308mr7571168lfh.65.1698123428743;
        Mon, 23 Oct 2023 21:57:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqZBvCX7cpddnJ6nLEAuqRMDOBnnhnBCepUmCb1McfH5ZJGa0K7P4XTsmtnOp1PZOAz45R1XFMJx2iEJr7hFQ=
X-Received: by 2002:ac2:4202:0:b0:500:9214:b308 with SMTP id
 y2-20020ac24202000000b005009214b308mr7571153lfh.65.1698123428376; Mon, 23 Oct
 2023 21:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <PH0PR12MB548139B50AD2D1B86AC9A127DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com> <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com> <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com> <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com> <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org> <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com> <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 24 Oct 2023 12:56:57 +0800
Message-ID: <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Mon, Oct 23, 2023 at 12:43=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, October 23, 2023 9:15 AM
> >
> > On Wed, Oct 18, 2023 at 6:23=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Wednesday, October 18, 2023 3:26 PM
> > >
> > > > For completeness, and to shorten the thread, can you please list
> > > > known issues/use cases that are addressed by the status bit
> > > > interface and how you plan for them to be addressed?
> > >
> > > I will avoid listing known issues for a moment for status bit in this=
 email.
> > >
> > > Status bit interface helps in following good ways.
> > > 1. suspend/resume the device fully by the guest by negotiating the ne=
w
> > feature.
> > > This can be useful in the guest-controlled PM flows of suspend/resume=
.
> > > I still think for this, only feature bit is necessary, and device_sta=
tus
> > modification is not needed.
> >
> > Which feature bit did you mean here?
> >
> A new feature bit to indicate the guest that device supports suspend and =
resume, hence, there is no need to reset the device and destroy resources l=
ike how it is done today.

Well, I don't see how it is different from what LingShan proposed.

>
> > > D0->D3 and D3->D0 transition of the pci can suspend and resume the de=
vice
> > which can preserve the last device_status value before entering D3.
> >
> > It's not only about the device status. I would not repeat the question =
I've asked
> > in another thread.
> >
> > What's more, if you really want to suspend/freeze at PCI level and deal=
 with PCI
> > specific issues like P2P.  You should really try to leverage or invent =
a PCI
> > mechanism instead of trying to carry such semantics via a virtio specif=
ic stuff
> > like adminq. Solving transport specific problems at the virtio level is=
 a layer
> > violation.
> >
> PCI spec has already defined what it needs to.

If PCI spec has good support for suspend/resume, why bother inventing
mechanisms in virtio?

> SR-PCIM interface is already concluded being outside of PCI-spec by the p=
ci-sig.
> And no, there is no layer violation.
>
> Any non PCI member device can always implement necessary STOP mode as no-=
op.
>
> And all of those talk make sense when one creates MMIO based member devic=
e, until that point is just objections...

They are different layers:

1) suspend/resume at virtio level
2) suspend/resume at transport level

We need both of them to satisfy different cases. Just as we need to
reset at both virtio and VF(FLR). Lingshan proposes 1) while it looks
to me you propose 2) via virtio adminq but you said it has been
supported by PCI which is then a duplication.

>
> > > (Like preserving all rest of the fields of common and other device co=
nfig).
> > > This is orthogonal and needed regardless of device migration.
> > >
> > > 2. If one does not want to passthrough a member device, but build a
> > > mediation-based device on top of existing virtio device, It can be us=
eful with
> > mediating software.
> > > Here the mediating software has ample duplicated knowledge of what th=
e
> > member device already has.
> >
> > It is the way the hypervisors are doing for not only virtio but also fo=
r CPU and
> > MMU as well.
> >
> Not really, vcpus and VMCS and more are part of the hardware support.

That's not the context here. Hypervisors need to know almost every
detail to make CPU virtualization work. That's the fact, and it works
for virio as well for years.

What's more, nothing prevents us from inventing something similar in
virtio to speed up the context switch or migration if necessary.

> 2 level nested page tables is hw support.
> Anything beyond 2 level nesting, likely involves hypervisor.

Needs emulation/trap for sure. That's the point.

>
> > > This can fulfil the nested requirement differently provided a platfor=
m support
> > it.
> > > (PASID limitation will be practical blocker here).
> >
> > I don't think PASID is a blocker. It is only a blocker if you want to d=
o passthrough.
> >
> Even without passthrough, one needs to steer the hypervisor DMA to non gu=
est memory.
> And guest driver must not be able to attack (read/write) from that memory=
.
> I don=E2=80=99t see how one can do this without PASID. As all DMAs are ta=
gged using only RID.

There are a lot of other ways, but in order to converge, we can leave
it for future discussions.

What's more, if we design virtio for the future, PASID must be
considered as a way as we all know it would come for sure.

>
> > >
> > > How to I plan to address above two?
> > > a. #1 to be addressed by having the _F_PM bit, when the bit is negoti=
ated PCI
> > PM drives the state.
> >
> > We can't duplicate every transport specific feature in virtio. This is =
a layer
> > violation again. We should reuse the PCI facility here.
> >
> It is reused by having the feature bit to indicate that device supports s=
uspend/resume.
> If from Day_1, if the PCI PM bits used, it would not require the feature =
bit.
> But that was not the case.
> So the guest driver do not know if using the PCI PM bit is enough to deci=
de, if suspend/resume by guest will work or not.
> Hence the feature bit.

Anyhow you need to update the driver if it has an issue. In the
update, you can check and use PCI PM. If it doesn't have PCI PM, you
can only suspend/resume at virtio level. Defining transport semantics
at the virtio level breaks the layers.

>
> > > This will work orthogonal to VMM side migration and will co-exist wit=
h VMM
> > based device migration.

Actually not, if PF can suspend VF via PCI facilities, that would be
no layer violation any more.

> > >
> > > b. nested use case:
> > > L0 VMM maps a VF to L1 guest as PF with emulated SR-IOV capability.
> > > L1 guest to enable SR-IOV and mapping the VF to L2 guest.
> >
> > Let me ask it again here, how can you migrate L2 using L1 "emulated"
> > PF? Emulation?
> >
> Emulation is one way as most nested platform components do.

That's the point, you can't avoid emulation.

Thanks


> May be L1 VF which is =3D VF + SR-IOV capability is =3D emulated PF. This=
 PF can run exact same commands as L0 level PF.


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

