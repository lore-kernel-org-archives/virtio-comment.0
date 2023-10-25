Return-Path: <virtio-comment-return-7946-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E79C07545
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 01:29:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9C79F2AC4E
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 01:29:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8A41D9869DC
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 01:29:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7EAF49869D3; Wed, 25 Oct 2023 01:29:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6F3949869D4
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Oct 2023 01:29:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Ljz94nUGNF6JyESL28Lf9w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698197327; x=1698802127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdEjp7P3YFaQy7owhYYTq5mzup5xogpDXUtYytz/MXc=;
        b=aAEQRlEIvwIHsUm7BvNs15UkCyXw9jQYstfx+9H/RagObg+QIL3u94M1fPXqGQJ2te
         WjRvE4RfTi2ieADGadWsYlDiMr4R3v97Q9mm8pbHF5kWeDEvntuZTcP1JapuHTxpeS/b
         Gfwgd3ucAhXvyFHjVPPzUyDQ6EODbyn9MWVOXGU6pTAx3aD1/0tN6DA6/A176lZLXfZE
         eRrCgPzATPv/Uwg06L8vj0zNOvqruzRmKZA9XL19NbAl/mlT5cSJE8KphmnNU+5KgzIj
         n63WuaL7n8jrB7ZdEQ+g/capDUTjO9f+YNhzlu7C0w+vplkazHJsfrkxtWXeiQjmNbGC
         oX8Q==
X-Gm-Message-State: AOJu0Yzqsih17bx4do41xfzU1uXW4woYAkMl0j1pRx4RkklPM/L5LNVI
	JQxfsJe5y4u5V5VN7HUEQVjV5hw9M/Dmj15WJ0lrBeqfx+Ulf8L9NWTvbw142pq0jeg9FRiSVqd
	yDuhQex+5NEhyOFYRup9fJzhEGnINvBtPgg85LA/j0K5iwxYoQQ==
X-Received: by 2002:a05:6512:1243:b0:507:b14f:e3bc with SMTP id fb3-20020a056512124300b00507b14fe3bcmr9830233lfb.33.1698197327459;
        Tue, 24 Oct 2023 18:28:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY43OL2rWKth2uHGang/p/PerzeI9L2zMgFL47Jbcdz9zlCncCOfOeegILn5cAaF9+ofA/6vBxGYv4SC2VNNA=
X-Received: by 2002:a05:6512:1243:b0:507:b14f:e3bc with SMTP id
 fb3-20020a056512124300b00507b14fe3bcmr9830222lfb.33.1698197327164; Tue, 24
 Oct 2023 18:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <PH0PR12MB548139B50AD2D1B86AC9A127DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com> <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com> <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com> <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com> <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231018055422-mutt-send-email-mst@kernel.org> <PH0PR12MB548106B7225BAF351241EA8ADCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
 <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com> <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 25 Oct 2023 09:28:35 +0800
Message-ID: <CACGkMEu3nC8G3Xo2EaunQ4k4rnB27UQMUvruXaf81_sZF7w-cQ@mail.gmail.com>
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

On Tue, Oct 24, 2023 at 6:02=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, October 24, 2023 10:27 AM
> >
> > On Mon, Oct 23, 2023 at 12:43=E2=80=AFPM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Monday, October 23, 2023 9:15 AM
> > > >
> > > > On Wed, Oct 18, 2023 at 6:23=E2=80=AFPM Parav Pandit <parav@nvidia.=
com> wrote:
> > > > >
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Wednesday, October 18, 2023 3:26 PM
> > > > >
> > > > > > For completeness, and to shorten the thread, can you please lis=
t
> > > > > > known issues/use cases that are addressed by the status bit
> > > > > > interface and how you plan for them to be addressed?
> > > > >
> > > > > I will avoid listing known issues for a moment for status bit in =
this email.
> > > > >
> > > > > Status bit interface helps in following good ways.
> > > > > 1. suspend/resume the device fully by the guest by negotiating th=
e
> > > > > new
> > > > feature.
> > > > > This can be useful in the guest-controlled PM flows of suspend/re=
sume.
> > > > > I still think for this, only feature bit is necessary, and
> > > > > device_status
> > > > modification is not needed.
> > > >
> > > > Which feature bit did you mean here?
> > > >
> > > A new feature bit to indicate the guest that device supports suspend =
and
> > resume, hence, there is no need to reset the device and destroy resourc=
es like
> > how it is done today.
> >
> > Well, I don't see how it is different from what LingShan proposed.
> The difference is, in passthrough mode, it will be fully controlled by th=
e guest VM without involving hypervisor.

How does a rest in guest work but not suspend? You can choose to pass
through the suspend to the guest, and use save/load to migrate it.

> It will work even when device migration is ongoing.
> What Lingshan proposed involved messing with the device status.

Your proposal messes with the PCI semantics (as you want to rule the
behaviours like P2P).

> It should be separate register like how Jingchen proposed or not have reg=
ister at all if the pci transport support it.

It should not, then you will end up defining the interaction with the
status state machine.

> >
> > >
> > > > > D0->D3 and D3->D0 transition of the pci can suspend and resume th=
e
> > > > > D0->device
> > > > which can preserve the last device_status value before entering D3.
> > > >
> > > > It's not only about the device status. I would not repeat the
> > > > question I've asked in another thread.
> > > >
> > > > What's more, if you really want to suspend/freeze at PCI level and
> > > > deal with PCI specific issues like P2P.  You should really try to
> > > > leverage or invent a PCI mechanism instead of trying to carry such
> > > > semantics via a virtio specific stuff like adminq. Solving transpor=
t
> > > > specific problems at the virtio level is a layer violation.
> > > >
> > > PCI spec has already defined what it needs to.
> >
> > If PCI spec has good support for suspend/resume, why bother inventing
> > mechanisms in virtio?
> >
> Because virtio today does not know if the PCI level suspend/resume will a=
ctually work or not,

It's not the charge of virtio to know about this. Otherwise how many
PCI stuffs needs virtio to understand? PCIE supports various
capabilities.

> because in past it has not worked even if the PM capability was exposed.

Let's fix the hypervisor but last time I checked, suspend/hibernation
works at least for virtio-net.

> So only a feature bit is needed.
>
> > > SR-PCIM interface is already concluded being outside of PCI-spec by t=
he pci-
> > sig.
> > > And no, there is no layer violation.
> > >
> > > Any non PCI member device can always implement necessary STOP mode as
> > no-op.
> > >
> > > And all of those talk make sense when one creates MMIO based member
> > device, until that point is just objections...
> >
> > They are different layers:
> >
> > 1) suspend/resume at virtio level
> > 2) suspend/resume at transport level
> >
> > We need both of them to satisfy different cases. Just as we need to res=
et at both
> > virtio and VF(FLR). Lingshan proposes 1) while it looks to me you propo=
se 2) via
> > virtio adminq but you said it has been supported by PCI which is then a
> > duplication.
> >
> #1 is needed and to be owned by the guest driver in passthrough
> I didn=E2=80=99t propose #2.
> I proposed #2 be controlled by the vmm/hypervisor (via admin cmd) who is =
in charge of vm suspend/resume flow.

So you're saying it's the virtio level suspend but you want to limit
PCI transactions in P2P. That's not the suspend/resume at virtio level
for sure.

>
> > >
> > > > > (Like preserving all rest of the fields of common and other devic=
e config).
> > > > > This is orthogonal and needed regardless of device migration.
> > > > >
> > > > > 2. If one does not want to passthrough a member device, but build
> > > > > a mediation-based device on top of existing virtio device, It can
> > > > > be useful with
> > > > mediating software.
> > > > > Here the mediating software has ample duplicated knowledge of wha=
t
> > > > > the
> > > > member device already has.
> > > >
> > > > It is the way the hypervisors are doing for not only virtio but als=
o
> > > > for CPU and MMU as well.
> > > >
> > > Not really, vcpus and VMCS and more are part of the hardware support.
> >
> > That's not the context here. Hypervisors need to know almost every deta=
il to
> > make CPU virtualization work.
> Cpu virtualization is accelerated for 1st level nesting including interru=
pts.
>
> > That's the fact, and it works for virio as well for years.
> >
> > What's more, nothing prevents us from inventing something similar in vi=
rtio to
> > speed up the context switch or migration if necessary.
> The major difference with cpu virtualization with nw device virtualizatio=
n is, former flow is controlled by the sw, the later one is controlled by t=
he network which is not predictable.

The guest behaviour is also unpredictable, and guests may share
memories with others. I don't see your point.

> Hence, and context switching can mostly work in theory and not perform we=
ll with varied workload.

I don't think so, vCPU context is much more complicated than most of
the virtio devices. I don't see why it can't work for simple virtio
devices.

> Most production users prefer dedicated/isolated non_context switched rx.

I don't think you can cover "most production users" here. Such use
cases are limited with the missing save/load mechanism.

>
> >
> > > 2 level nested page tables is hw support.
> > > Anything beyond 2 level nesting, likely involves hypervisor.
> >
> > Needs emulation/trap for sure. That's the point.
> >
> > >
> > > > > This can fulfil the nested requirement differently provided a
> > > > > platform support
> > > > it.
> > > > > (PASID limitation will be practical blocker here).
> > > >
> > > > I don't think PASID is a blocker. It is only a blocker if you want =
to do
> > passthrough.
> > > >
> > > Even without passthrough, one needs to steer the hypervisor DMA to no=
n
> > guest memory.
> > > And guest driver must not be able to attack (read/write) from that me=
mory.
> > > I don=E2=80=99t see how one can do this without PASID. As all DMAs ar=
e tagged using
> > only RID.
> >
> > There are a lot of other ways, but in order to converge, we can leave i=
t for
> > future discussions.
> >
> So, first level passthrough seems a basic requirement to support to opera=
te from vmm control.
>
> 2nd level nesting can be emulated or accelerated to follow the principles=
 of the paper you pointed.
>
> > What's more, if we design virtio for the future, PASID must be consider=
ed as a
> > way as we all know it would come for sure.
> >
> For future PASID be fully controlled by the guest to continue like today.
> PASID based bifurcation is still open question to me.

It is by design, e.g devices can have secondary PASID. It's not hard
to understand. And it's much simpler than doing "bifurcation" in PF.

>
> > >
> > > > >
> > > > > How to I plan to address above two?
> > > > > a. #1 to be addressed by having the _F_PM bit, when the bit is
> > > > > negotiated PCI
> > > > PM drives the state.
> > > >
> > > > We can't duplicate every transport specific feature in virtio. This
> > > > is a layer violation again. We should reuse the PCI facility here.
> > > >
> > > It is reused by having the feature bit to indicate that device suppor=
ts
> > suspend/resume.
> > > If from Day_1, if the PCI PM bits used, it would not require the feat=
ure bit.
> > > But that was not the case.
> > > So the guest driver do not know if using the PCI PM bit is enough to =
decide, if
> > suspend/resume by guest will work or not.
> > > Hence the feature bit.
> >
> > Anyhow you need to update the driver if it has an issue. In the update,=
 you can
> > check and use PCI PM. If it doesn't have PCI PM, you can only suspend/r=
esume
> > at virtio level. Defining transport semantics at the virtio level break=
s the layers.
> >
> This series does not define transport semantics at virtio level.

Don't you want to limit P2P in those states?

> It only defines virtio level semantics of what to be done/not done.
>
> > >
> > > > > This will work orthogonal to VMM side migration and will co-exist
> > > > > with VMM
> > > > based device migration.
> >
> > Actually not, if PF can suspend VF via PCI facilities, that would be no=
 layer
> > violation any more.
> >
> There is no such PCI facility.

If you want to make passthrough work without layer violation, you need eith=
er:

1) invent them in the PCI

or

2) Trap and let hypervisor to control how to implement the suspend,
for example hypervisor can choose to control the PM of VF

> PCI capabilities is not supposed to contain device migration kind of comp=
lex commands.

We're discussing suspending here, no? Talking about PCI, even if
capabilities are not, it doesn't mean we can't extend PCI to use
others. Anyhow, this is really ir-revelant to the discussion here.
Virtio does virtio not PCI, you can't invent new features in virtio in
order to be able to extend or fix the function of PCI.

> I explained in the discussion with Michael.
>
> > > > >
> > > > > b. nested use case:
> > > > > L0 VMM maps a VF to L1 guest as PF with emulated SR-IOV capabilit=
y.
> > > > > L1 guest to enable SR-IOV and mapping the VF to L2 guest.
> > > >
> > > > Let me ask it again here, how can you migrate L2 using L1 "emulated=
"
> > > > PF? Emulation?
> > > >
> > > Emulation is one way as most nested platform components do.
> >
> > That's the point, you can't avoid emulation.
> It is applicable only after first level.
> First level must be able to take the benefit without emulation like rest =
of the system modules do today.

You can't avoid traps and emulation. So the key is what/when/where to
trap, this is my logic of questions .

You want to pass through virtio facilities without trap and emulation,
you need to justify that.

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

