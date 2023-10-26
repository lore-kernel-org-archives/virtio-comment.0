Return-Path: <virtio-comment-return-7962-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5303FC25B47
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 00:46:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9E20A2A892
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 00:46:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8CD13986A45
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 00:46:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 82CDB986A38; Thu, 26 Oct 2023 00:46:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7581E986A39
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 00:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: SU81xHvxNI-rIbUsLLIvsA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698281188; x=1698885988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4P1YAp3VUwzRFvjdt9ZUprgRdwUSywXTmqgrE8rMuqc=;
        b=cWgRllJ1c4BHo2NU1hsgqYfhbKsOZm8i8Fc9wbNA4l91jUGyo5CGEmDisXDAHUM4IM
         F+/dp3WrV86slQySSvzx2G5vbrLLy5nSNewHQPnjN8Oi2DYexX2oSPM9lB9KpVJR3sBE
         8Pw37Hch9XJKrmB8x23I1LHh4X1bpkvzpwCBOe0VzK4uAoGpQSxALiDZaXzJapp5FQBT
         YPlEEJjo5940QWl2NAbERg4DJpreV5lxvcY5ueEoNwgTxJ5IjzO0z38tVuy5b2AF3fx7
         S4rfxjV04MIk6I5shXZacx1ZR3aXHCQDXaXrRpNCsYMwYvIf7uqhgKPyFbv+ZMfRy/Pf
         bQ/Q==
X-Gm-Message-State: AOJu0Yz7a6kLDGgAABmyd3qKr510qkJHi/YUVRpB9dERqsMMudjpddwY
	qwEa29YKydan+BGlPUjp3I2FOKn3aS8WPUy0tOY7Hj1VlhH57X5e2/M7p6qradZfKz/t5KRnuEk
	xgXE/kSpFnmla7bqa8guxyxibtOsx2UElffX+8U8jfwBd/ZavMQ==
X-Received: by 2002:a19:9115:0:b0:503:1722:bf3a with SMTP id t21-20020a199115000000b005031722bf3amr12428447lfd.1.1698281187965;
        Wed, 25 Oct 2023 17:46:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbiVFQTi31Q4zAhHqfWIml+wFHyacfdueab/VQHw7bhh56uJ6JcnB6kFkFYbKiG+MhMLLOJXXzg33TADqf7CI=
X-Received: by 2002:a19:9115:0:b0:503:1722:bf3a with SMTP id
 t21-20020a199115000000b005031722bf3amr12428438lfd.1.1698281187630; Wed, 25
 Oct 2023 17:46:27 -0700 (PDT)
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
 <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com>
 <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3nC8G3Xo2EaunQ4k4rnB27UQMUvruXaf81_sZF7w-cQ@mail.gmail.com> <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 26 Oct 2023 08:46:15 +0800
Message-ID: <CACGkMEvwFno6ynKzi1WPAj=fF2xmzRS_kUKfL8UJU8sTcjDHbA@mail.gmail.com>
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

On Wed, Oct 25, 2023 at 3:15=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, October 25, 2023 6:59 AM
>
> [..]
> > > > resume, hence, there is no need to reset the device and destroy
> > > > resources like how it is done today.
> > > >
> > > > Well, I don't see how it is different from what LingShan proposed.
> > > The difference is, in passthrough mode, it will be fully controlled b=
y the guest
> > VM without involving hypervisor.
> >
> > How does a rest in guest work but not suspend? You can choose to pass t=
hrough
> > the suspend to the guest, and use save/load to migrate it.
> >
> > > It will work even when device migration is ongoing.
> > > What Lingshan proposed involved messing with the device status.
> >
> > Your proposal messes with the PCI semantics (as you want to rule the
> > behaviours like P2P).
> >
> > > It should be separate register like how Jingchen proposed or not have=
 register
> > at all if the pci transport support it.
> >
> > It should not, then you will end up defining the interaction with the s=
tatus state
> > machine.
> >
> Treating all registers equally and synchronizing it in the device is bett=
er model to not bifurcate the device.

If you keep using misleading terminology like bifurcation, the
discussion will be endless. Or you need to define it first.

For example, you still haven't succeeded in defining passthrough. And
you fail to explain why reset is part of the device status but suspend
can't.

>
> > > >
> > > > >
> > > > > > > D0->D3 and D3->D0 transition of the pci can suspend and resum=
e
> > > > > > > D0->the device
> > > > > > which can preserve the last device_status value before entering=
 D3.
> > > > > >
> > > > > > It's not only about the device status. I would not repeat the
> > > > > > question I've asked in another thread.
> > > > > >
> > > > > > What's more, if you really want to suspend/freeze at PCI level
> > > > > > and deal with PCI specific issues like P2P.  You should really
> > > > > > try to leverage or invent a PCI mechanism instead of trying to
> > > > > > carry such semantics via a virtio specific stuff like adminq.
> > > > > > Solving transport specific problems at the virtio level is a la=
yer violation.
> > > > > >
> > > > > PCI spec has already defined what it needs to.
> > > >
> > > > If PCI spec has good support for suspend/resume, why bother
> > > > inventing mechanisms in virtio?
> > > >
> > > Because virtio today does not know if the PCI level suspend/resume
> > > will actually work or not,
> >
> > It's not the charge of virtio to know about this. Otherwise how many PC=
I stuffs
> > needs virtio to understand? PCIE supports various capabilities.
> >
> > > because in past it has not worked even if the PM capability was expos=
ed.
> >
> > Let's fix the hypervisor but last time I checked, suspend/hibernation w=
orks at
> > least for virtio-net.
> Because it destroyed the resource and re-created them.

Who is "it"?

> It didn=E2=80=99t resume from where it left off. Ideally it should have d=
one that.

We are developing virtio that has been implemented by multiple
different hypervisors/drivers. We can't introduce feature bits to
workaround issues that are spotted in just one of the hypervisors.

> Even if you fix the hypervisor, guest does not know that it is fixed in h=
ypervisor, so guest does not know when to skip the current flow of reset.

From the view of the driver, it's more than sufficient to do what it
think is correct:

1) Use suspend at virtio layer, this requires a new feature but it's
not for PM for sure
2) Leverage the PM facility provided by the transport

> Hence the bit is needed.

Nope, a lot of bugs were fixed by the PCI layer and we don't do new
feature bits for them. The only concern is the migration compatibility
which is out of the scope of virtio.

>
> >
> > > So only a feature bit is needed.
> > >
> > > > > SR-PCIM interface is already concluded being outside of PCI-spec
> > > > > by the pci-
> > > > sig.
> > > > > And no, there is no layer violation.
> > > > >
> > > > > Any non PCI member device can always implement necessary STOP mod=
e
> > > > > as
> > > > no-op.
> > > > >
> > > > > And all of those talk make sense when one creates MMIO based
> > > > > member
> > > > device, until that point is just objections...
> > > >
> > > > They are different layers:
> > > >
> > > > 1) suspend/resume at virtio level
> > > > 2) suspend/resume at transport level
> > > >
> > > > We need both of them to satisfy different cases. Just as we need to
> > > > reset at both virtio and VF(FLR). Lingshan proposes 1) while it
> > > > looks to me you propose 2) via virtio adminq but you said it has
> > > > been supported by PCI which is then a duplication.
> > > >
> > > #1 is needed and to be owned by the guest driver in passthrough I
> > > didn=E2=80=99t propose #2.
> > > I proposed #2 be controlled by the vmm/hypervisor (via admin cmd) who=
 is in
> > charge of vm suspend/resume flow.
> >
> > So you're saying it's the virtio level suspend but you want to limit PC=
I
> > transactions in P2P. That's not the suspend/resume at virtio level for =
sure.
> >
> Every virtio instruction translates to its underlying transport construct=
.
> Be it driver notification or device notification moderation or vq dma.
>
> Similarly, mode setting translated to its transport binding.

I don't see your points. What I meant is, you need to use PCI
facilities to synchronize P2P instead of virtio. This is not hard to
be understood as there's no P2P definition in the core virtio layer
and P2P is not guaranteed to be useful for all of the other
transports.

>
> > >
> > > > >
> > > > > > > (Like preserving all rest of the fields of common and other d=
evice
> > config).
> > > > > > > This is orthogonal and needed regardless of device migration.
> > > > > > >
> > > > > > > 2. If one does not want to passthrough a member device, but
> > > > > > > build a mediation-based device on top of existing virtio
> > > > > > > device, It can be useful with
> > > > > > mediating software.
> > > > > > > Here the mediating software has ample duplicated knowledge of
> > > > > > > what the
> > > > > > member device already has.
> > > > > >
> > > > > > It is the way the hypervisors are doing for not only virtio but
> > > > > > also for CPU and MMU as well.
> > > > > >
> > > > > Not really, vcpus and VMCS and more are part of the hardware supp=
ort.
> > > >
> > > > That's not the context here. Hypervisors need to know almost every
> > > > detail to make CPU virtualization work.
> > > Cpu virtualization is accelerated for 1st level nesting including int=
errupts.
> > >
> > > > That's the fact, and it works for virio as well for years.
> > > >
> > > > What's more, nothing prevents us from inventing something similar i=
n
> > > > virtio to speed up the context switch or migration if necessary.
> > > The major difference with cpu virtualization with nw device virtualiz=
ation is,
> > former flow is controlled by the sw, the later one is controlled by the=
 network
> > which is not predictable.
> >
> > The guest behaviour is also unpredictable, and guests may share memorie=
s with
> > others. I don't see your point.
> >
> > > Hence, and context switching can mostly work in theory and not perfor=
m well
> > with varied workload.
> >
> > I don't think so, vCPU context is much more complicated than most of th=
e virtio
> > devices. I don't see why it can't work for simple virtio devices.
> >
>
> So try to switch a RQ between two VMs at 100Gbps packet rate without a pa=
cket drop and see how it performs.

How can you avoid a packet drop if the VM is scheduled out? And did I
say such scheduling is needed in every use case?

So:

1) You stick your proposal can only work a specific setups and a
specific type of hypervisor
2) I try to show you there are just more setups and more types of
hypervisor that needs to be considered

That's the point. When I was talking about 2), you told me it doesn't
fit for 1). If you want to converge this discussion, let's don't shift
concepts.

Again, developing a feature with less assumptions and more use cases
are much more beneficial to virtio.

>
> > > Most production users prefer dedicated/isolated non_context switched =
rx.
> >
> > I don't think you can cover "most production users" here. Such use case=
s are
> > limited with the missing save/load mechanism.
> And they apparently are being blocked from year 2021 when these device mi=
gration efforts started.
> Not any more..

I don't get your points. It's blocked just because they're still
questions you haven't answered.

It's not a matter of how long but a matter of how well your proposal can be=
.

> >
> > >
> > > >
> > > > > 2 level nested page tables is hw support.
> > > > > Anything beyond 2 level nesting, likely involves hypervisor.
> > > >
> > > > Needs emulation/trap for sure. That's the point.
> > > >
> > > > >
> > > > > > > This can fulfil the nested requirement differently provided a
> > > > > > > platform support
> > > > > > it.
> > > > > > > (PASID limitation will be practical blocker here).
> > > > > >
> > > > > > I don't think PASID is a blocker. It is only a blocker if you
> > > > > > want to do
> > > > passthrough.
> > > > > >
> > > > > Even without passthrough, one needs to steer the hypervisor DMA t=
o
> > > > > non
> > > > guest memory.
> > > > > And guest driver must not be able to attack (read/write) from tha=
t
> > memory.
> > > > > I don=E2=80=99t see how one can do this without PASID. As all DMA=
s are
> > > > > tagged using
> > > > only RID.
> > > >
> > > > There are a lot of other ways, but in order to converge, we can
> > > > leave it for future discussions.
> > > >
> > > So, first level passthrough seems a basic requirement to support to o=
perate
> > from vmm control.
> > >
> > > 2nd level nesting can be emulated or accelerated to follow the princi=
ples of
> > the paper you pointed.
> > >
> > > > What's more, if we design virtio for the future, PASID must be
> > > > considered as a way as we all know it would come for sure.
> > > >
> > > For future PASID be fully controlled by the guest to continue like to=
day.
> > > PASID based bifurcation is still open question to me.
> >
> > It is by design, e.g devices can have secondary PASID. It's not hard to
> > understand. And it's much simpler than doing "bifurcation" in PF.
> >
> > >
> > > > >
> > > > > > >
> > > > > > > How to I plan to address above two?
> > > > > > > a. #1 to be addressed by having the _F_PM bit, when the bit i=
s
> > > > > > > negotiated PCI
> > > > > > PM drives the state.
> > > > > >
> > > > > > We can't duplicate every transport specific feature in virtio.
> > > > > > This is a layer violation again. We should reuse the PCI facili=
ty here.
> > > > > >
> > > > > It is reused by having the feature bit to indicate that device
> > > > > supports
> > > > suspend/resume.
> > > > > If from Day_1, if the PCI PM bits used, it would not require the =
feature bit.
> > > > > But that was not the case.
> > > > > So the guest driver do not know if using the PCI PM bit is enough
> > > > > to decide, if
> > > > suspend/resume by guest will work or not.
> > > > > Hence the feature bit.
> > > >
> > > > Anyhow you need to update the driver if it has an issue. In the
> > > > update, you can check and use PCI PM. If it doesn't have PCI PM, yo=
u
> > > > can only suspend/resume at virtio level. Defining transport semanti=
cs at the
> > virtio level breaks the layers.
> > > >
> > > This series does not define transport semantics at virtio level.
> >
> > Don't you want to limit P2P in those states?
> >
> At virtio level, they are not defined.

Assuming virtio level, why did you keep mentioning P2P and your V2
wants to freeze/stop to synchronize with FLR? That's really
self-contradictory.

> Virtio to transport binding has it like every single virtio construct has=
 transport binding from notification, dma, sriov to anything else.

So you explain yourself here, virtio can't live with a specific
transport, if you want to rule transport specific behaviour like P2P,
why not do that directly at transport level? You know the P2P is not
necessarily done between 2 virtio devices, so how to synchronize it in
that case? If you'd expect a state like freeze/stop exists on all
other PCI devices, PCI is obviously a better place to do that.

>
> > > It only defines virtio level semantics of what to be done/not done.
> > >
> > > > >
> > > > > > > This will work orthogonal to VMM side migration and will
> > > > > > > co-exist with VMM
> > > > > > based device migration.
> > > >
> > > > Actually not, if PF can suspend VF via PCI facilities, that would b=
e
> > > > no layer violation any more.
> > > >
> > > There is no such PCI facility.
> >
> > If you want to make passthrough work without layer violation, you need =
either:
> >
> > 1) invent them in the PCI
> >
> This will follow the paper you pointed and follow all the principles list=
ed there.
>
> > or
> >
> > 2) Trap and let hypervisor to control how to implement the suspend, for
> > example hypervisor can choose to control the PM of VF
> >
> > > PCI capabilities is not supposed to contain device migration kind of =
complex
> > commands.
> >
> > We're discussing suspending here, no? Talking about PCI, even if capabi=
lities are
> > not, it doesn't mean we can't extend PCI to use others. Anyhow, this is=
 really ir-
> > revelant to the discussion here.
> PCI capability cannot contain virtio specific RW complex registers.

Again, if you keep debating the existing virtio-pci design, let's use
another thread please. I've explained this is not the truth in another
thread. If you don't want to converge the discussion, you can keep
raising those unrelated topics here.

> Vendor defined capability was done which is largely RO things which is ok=
.
>
> > Virtio does virtio not PCI, you can't invent new features in virtio in =
order to be
> > able to extend or fix the function of PCI.
> Virtio needs to live with the limitation of the PCI

Yes but it doesn't mean virtio needs to workaround those limitations.

And before blaming PCI, could it be a problem with your proposed architectu=
re?

>and also needs to extend the PCI when it needs to.

That's the way to go.

>
> >
> > > I explained in the discussion with Michael.
> > >
> > > > > > >
> > > > > > > b. nested use case:
> > > > > > > L0 VMM maps a VF to L1 guest as PF with emulated SR-IOV capab=
ility.
> > > > > > > L1 guest to enable SR-IOV and mapping the VF to L2 guest.
> > > > > >
> > > > > > Let me ask it again here, how can you migrate L2 using L1 "emul=
ated"
> > > > > > PF? Emulation?
> > > > > >
> > > > > Emulation is one way as most nested platform components do.
> > > >
> > > > That's the point, you can't avoid emulation.
> > > It is applicable only after first level.
> > > First level must be able to take the benefit without emulation like r=
est of the
> > system modules do today.
> >
> > You can't avoid traps and emulation. So the key is what/when/where to t=
rap,
> > this is my logic of questions .
> >
> I propose to do the nesting of the VF and follow the same model as 2 leve=
l nested page tables that actually work in the hw.

It's not, I don't see where 2 level nested tables are located. And it
brings a lot of complexities in the architecture.

>
> > You want to pass through virtio facilities without trap and emulation, =
you need
> > to justify that.
>
> For first level, it is clear to passthrough without trap and emulation li=
ke cpu page table walkthough.
> I don=E2=80=99t know what you mean by justification,

Again. There are just too many questions that are still not answered.
I would not repeat it again here. It's your job to convince people.

For example, assuming you are correct, you still fail to explain

1) what is trapped and what's not, or what's the boundary
2) if the hypervisor is not developed with those assumptions, things
can work or not

Thanks







> but it is the requirement to passthrough.
> N level nesting is secondary requirement that should consult PCI-SIG if n=
eeded.


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

