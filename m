Return-Path: <virtio-comment-return-7742-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE62CDB465
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 01:42:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1701A45B2B
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 01:42:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E7AE998684D
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 01:42:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CA5BF986580; Tue, 17 Oct 2023 01:42:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AC71F986843
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 01:42:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: c25aSGkkM72Swp56UHllhA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697506932; x=1698111732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFiry+zFavokzkM/I+IqKuBFn+PWcYViqVY3pCEko78=;
        b=MO8yol+sQS4B2R5zyAm3jgLL/7q5ZK4Y4DFZ3w5YUeaqFMYe4NtPRszyzKWbr5NlV7
         xYyJFITR9DfVXclg/7DskOJc8XQ/Ab3THGUEmYM8L4g+vjnji8wRYNSgujD2l6UGawI8
         Nq9LA2b3A2/nOn6zDIJvTpVKoL2RZpKfiCca/ebiz2/pw6v9QjqfTHSAkeiVnE3HaFKZ
         hxaHAQuANj6yTeZsfXx37u8ad36hzukdLilocsAEHuF3A7oBGw22pHzTT+I+sy3jkFBz
         dXA/wf/o6JxoBTkeQiI648QoT/Mj2W852WLv2c9sjnzx8K+lYf5NGf9uRJ0RtM2Cg+aC
         n+sQ==
X-Gm-Message-State: AOJu0YwDdsb/LNF6ml3o2j29g9+/7wlpqxKA26FrCDEzBwl0XUjMC6dL
	sbIFSpyGdnGnjhfR+Abs6h6Ojn6qFb/GLjzIgYIR8CO8hz2gzTUatraGMd/RxscWXTaQutMQjT9
	MGbz+4ohvlEPf6uTOzZsFsxE/pOiLxaYpW/PnKgWTWnfw7KeHQA==
X-Received: by 2002:a05:6512:3195:b0:503:34b8:20b with SMTP id i21-20020a056512319500b0050334b8020bmr960009lfe.65.1697506931499;
        Mon, 16 Oct 2023 18:42:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4rWAJC2TgTNf4GH9QKw2vSpDanK0Pu1+uIVAeSjNshjyBJGvEAZoJU30SK09W07yav59bOWkmoHszIOEAOBg=
X-Received: by 2002:a05:6512:3195:b0:503:34b8:20b with SMTP id
 i21-20020a056512319500b0050334b8020bmr959978lfe.65.1697506930460; Mon, 16 Oct
 2023 18:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231008112555.473895-1-parav@nvidia.com> <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB548029E1AAB8529339D22D4DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEswD2XLjRNzyqo9M-yT77PsOJqJmDLxSKd2ZOgqLYjjZQ@mail.gmail.com>
 <PH0PR12MB548143D2AB83CA90E7F1C9D6DCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsk7ZgmWuqm9U_Tych8+Ceu7X9RymQASeSS_ayB2PGTgg@mail.gmail.com>
 <PH0PR12MB54817B050D97CC7123DE30ECDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEux-kXQ=d_6CVyfhNit4TMJ=V1p8C6XRDXhCLAJDD5kRA@mail.gmail.com> <PH0PR12MB5481CD04EF5122C041D63CCDDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481CD04EF5122C041D63CCDDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 17 Oct 2023 09:41:58 +0800
Message-ID: <CACGkMEustM=iejjJhGz0DW1iT9qJpha4zLbMJ-cVO2VU4Kq2Kg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	Zhu Lingshan <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Oct 13, 2023 at 2:36=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Friday, October 13, 2023 6:46 AM
>
> [..]
> > > > > > It's still not clear to me how this is done.
> > > > > >
> > > > > > 1) guest starts FLR
> > > > > > 2) adminq freeze the VF
> > > > > > 3) FLR is done
> > > > > >
> > > > > > If the freezing doesn't wait for the FLR, does it mean we need
> > > > > > to migrate to a state like FLR is pending? If yes, do we need t=
o
> > > > > > migrate the other sub states like this? If not, why?
> > > > > >
> > > > > In most practical cases #2 followed by #1 should not happen as on
> > > > > the source
> > > > side the expected is mode change to stop from active.
> > > >
> > > > How does the hypervisor know if a guest is doing what without trapp=
ing?
> > > >
> > > Hypervisor does not know. The device knows being the recipient of #1 =
and #2.
> >
> > We are discussing the possibility in software/driver side isn't it?
> >
> > 1) is initiated from the guest
> > 2) is initiated from the hypervisor
> >
> > Both are softwares, and you're saying 2) should not happen after 1) sin=
ce the
> > device knows what is being done by guests? How can devices control soft=
ware
> > behaviour?
> >
> Device do not control software behavior.
> i.e. either hypervisor can initiate device mode change to stop (not freez=
e) or guest can initiate FLR.
> Device knows which is initiated first as single recipient of both.
> Therefore, device responds accordingly.
> For example, in the sequence you described,
> A device will delay mode change command response, until the FLR is comple=
ted.

Finally but ok.

>
>
> > This only possible thing is to make sure 3) is done before 2) That is w=
hat I'm
> > asking but you are saying freeze doesn't need to wait for FLR...
> >
> I think I responded in previous email further down on synchronization poi=
nt being fw.
> I meant to say software do not need to wait for initiation of the freeze =
mode command.

For software, did you mean the hypervisor?

> Just the command will complete at right time.
>
> This is anyway very corner case.
> On source hypervisor as written in the theory of operation, the sequence =
is active->stop->freeze.
> When mode change is done to stop, the vcpus are already suspended.

The problem here is not the vcpu but the when FLR is being done since
it may change the device context.

>
> I agree FLR may have been initiated and driver is waiting now for 100msec=
.

For driver, did you mean the driver in the guest?

>
> So yes, device single entity synchronized it.
>
> > >
> > > > > But ok, since we active to freeze mode change is allowed, lets di=
scuss
> > above.
> > > > >
> > > > > A device is the single synchronization point for any device reset=
,
> > > > > FLR or admin
> > > > command operation.
> > > >
> > > > So you agree we need synchronization? And I'm not sure I get the
> > > > meaning of synchronization point, do you mean the synchronization
> > > > between freeze/stop and virtio facilities?
> > > >
> > > Synchronization means, handling two events in parallel such as FLR an=
d other.
> >
> > Great. So we have a perfect race:
> >
> > 1) guest initiates FLR
> > 2) device start FLR
> > 3) hypervisor stop and freeze the device
> > 4) device is freeze
> > 5) hypervisor read device context A
> > 6) migrate device contextA
> > 8) migration is done
> > 9) FLR is done
> > 10) hypervisor read device context B
> >
> > So we end up with inconsistent device context, no? Dest want B or A+B, =
but you
> > give A.
> >
> Since #1 and #2 is done before #3, the device knows to finish the FLR, he=
nce #9 is completed before #4.

Ok, that's my understanding and that's why I'm asking, but you said
freeze/stop doesn't need to wait for FLR before.

>
> Alternatively, in above sequence when destination sees #10, it can immedi=
ately finish the FLR as dest device is not under FLR, treating it as no-op.
>
> Both ways to handle are fine. (and rare in practice, but yes, its possibl=
e).
>
> I will write both the options in the device requirements.
>
> > >
> > > > > So, the migration driver do not need to wait for FLR to complete.
> > > >
> > > > I'm confused, you said below that device context could be changed b=
y FLR.
> > > >
> > > Yes.
> > > > If FLR needs to clear device context, we can have a race where
> > > > device context is cleared when we are trying to read it?
> > > >
> > > I didn=E2=80=99t say clear the context.
> > > FLR updates the device context.
> >
> > In what sense?
> >
> Indicating a new device context indicating a new device context and disca=
rd the old one.

For example, what will queue_address have after an FLR?

> I am glad you asked this. I wanted to get the basic part captured before =
adding this optimization.

Ok.

> Probably it is good to add it now in the v2 as we crossed this stage now.
>
> > > Device is serving the device context read write commands, serving FLR=
,
> > > answering mode change command, So device knows the best how to avoid
> > any race.
> >
> > You want to leave those details for the vendor to figure out? If device=
s know
> > everything, why do we need device normative?
> >
> Device knows its implementation.
> Implementation guidelines to be in the normative.
> I will add it to the normative.
>
> > I see issues at least for FLR, I'm pretty sure they are others. If a de=
sign requires
> > us to audit all the possible conflicts between virtio facilities and tr=
ansport. It's a
> > strong hint of layer violation and when it happens it for sure may hit =
a lot of
> > problems that are very hard to find or debug thus we should drop such a=
 design.
> > I suggest using the RFC tag since the next version (if there is one) as=
 I see it is
> > immature in many ways.
> >
> Technical committee audits the required touch points like rest of the ind=
ustry committees that I participated.
> I disagree to your above point.
> If you do not want to review, that is fine.

I don't want to hold my breath if I see something that is obviously
wrong. Using RFC may help people to know that it is a draft that has
something to be improved before it can be merged.

> We are reviewing with other members and also contributed by them.
>
> > What's more, solving races is much easier if the device functionality i=
s self
> > contained. For example, for a self contained device with the transport =
as the
> > single interface, we can leverage from transport
> > (PCI) for dealing with races, arbitration, ordering, QOS etc which is p=
robably
> > required in the internal channel between the owner and the member. But =
all of
> > these were missed in your series and even if you can I'm not sure it's
> > worthwhile to reinvent all of them.
> >
> At the end there is one physical device serving owner and member devices.

This doesn't happen yet. For example, a VF with adminq that can be
isolated with PASID makes some sense.

> So a claim like things are on the VF hence you magically get 200% QoS gua=
rantee is myth.

That's not my point, I'm saying VF could benefit from the e.g QOS
support in PCIE. I'm not saying it's perfect.

>
> Quoting "all of these" is also incorrect.
>
> Things added gradually, first functionally with reasonable performance, f=
ollowed by notion and extension for QoS.
> By definition of PCI transport for SR-IOV there is internal channel.
>
> It is reasonably well proposal in current form.
> There are few race condition that you highlight are extremely rare in nat=
ure.

It's not rare since there's no way to know what the guest is doing.
It's actually the critical part for live migration to be correct. You
are proposing migration so it must cover all those cases to make sure
there is no case to make your proposal a dead end.

> Suggestions are welcome to improve.

I have given some and I will give more.

> There were couple of them by Michael too, I am addressing them in the v2.
>
> > For example, for the architecture like owner/member, if the virtio or t=
ransport
> > facility could be controlled via device internal channels besides the t=
ransport,
> > such a channel may complicate the synchronization a lot.
> Two vendors who actually make the hw sriov devices are authoring these an=
d others are also reviewing.
> So I am more confident that it is solid enough.
> Also, a similar design has been seen with other device for more than a ye=
ar as GPL integrated with QEMU for a year now and with upstream kernel.
>
> > The device needs to
> > be able to handle or synchronize requests from both PCI and owner in pa=
rallel.
> > They are just too many possible races and most of my questions so far c=
ome
> > from this viewpoint. I wouldn't go further for other stuff since I beli=
eve I've
> > spotted sufficient issues and that's why I must stop at this patch befo=
re looking
> > at the rest.
> It is your call to stop or progress.
> I find your reviews useful to improve this proposal, so I will fix them.

My point is to make the theory correct before looking at the others as
I had a lot of questions (as demonstrated in this thread). I think
it's not hard to understand as the rest of the series are based on the
theory.

>
> >
> > Admin commands are fine if it does real administrative jobs such as pro=
visioning
> > since such work is beyond the core virtio functionality.
> >
> > Again, the goal of virtio spec is to have a device with sufficient guid=
elines that is
> > easy to implement but not leave the vendors to waste their engineering
> > resources in figuring or fuzzing the corner cases.
> I have not seen an industry standard spec or a software that does not hav=
e corner cases.

Corner cases are probably not accurate. I meant, for you, it's
probably a corner case, but for me it's kind of obvious.

> The spec proposal is from > 1 device vendors.

That's good but it doesn't mean it doesn't have any (major) issues.
E.g vendors may choose to just implement part of the PCIE capabilities
so they don't do audits for the rest.

>
> I will focus on more practical aspects to progress and improve this spec.
> >
> > >
> > > > > When admin cmd freeze the VF it can expect FLR_completed VF.
> > > >
> > > > We need to explain why and how about the resume? For example, is
> > > > resuming required to wait for the completion of FLR, if not, why?
> >
> > This question is ignored.
> >
> I probably missed. Sorry about it.
> No, the driver does not need to wait for FLR to finish to issue resume co=
mmand,

Good but I want to know if stop/freeze->active requires to wait for
the completion of FLR. I guess the answer is yes.

> as this typically done on the destination member device which should not =
be under FLR.
> I will write up the requirements further.
>
> > > > In another thread you are saying that the PCI composition is done b=
y
> > > > hypervisor, so passthrough is really confusing at least for me.
> > > >
> > > I explained there what vPCI composition is done there.
> > > PCI config space and msix side of composition is done.
> > > The whole virtio interface is not composed.
> >
> > You need to describe this somewhere, no? That's what I'm saying.
> >
> Mostly not. What is not done is not written.
>
> > And passthrough is misleading here.
> >
> Passthrough is mentioned in theory of operation.
> It is not present in requirements section.
> So, it is fine.

I suggest documenting or defining the "passthrough" methodology
somewhere. Michael tries to define it in another thread, if it's ok,
let's use that. We can't require people to read VFIO code in order to
know what happens in the virtio spec.

>
> > >
> > > > > Ok. I assume "reset flow" is clear to you now that it points to s=
ection 2.4.
> > > > > This section is not normative section, so using an extra word lik=
e
> > > > > "flow" does
> > > > not confuse anyone.
> > > > > I will link to the section anyway.
> > > >
> > > > Probably, but you mention FLR flow as well.
> > > As I said, not repeating the PCIe spec here. The reader knows what FL=
R of the
> > PCIe transport.
> >
> > Ok, I'm not a native speaker, but I really don't know the difference be=
tween
> > "FLR" and "FLR flow".
> >
> Lets keep it simple. I will write it as FLR, as pci transport has it as F=
LR.

Ok.

>
> > >
> > > >
> > > > >
> > > > > > >
> > > > > > > > > and may also undergo PCI function level
> > > > > > > > > +reset(FLR) flow.
> > > > > > > >
> > > > > > > > Why is only FLR special here? I've asked FRS but you ignore=
 the
> > question.
> > > > > > > >
> > > > > > > FLR is special to bring clarity that guest owns the VF doing
> > > > > > > FLR, hence
> > > > > > hypervisor cannot mediate any registers of the VF.
> > > > > >
> > > > > > It's not about mediation at all, it's about how the device can
> > > > > > implement what you want here correctly.
> > > > > >
> > > > > > See my above question.
> > > > > >
> > > > > Ok. it is clear that live migration commands cannot stay on the
> > > > > member device
> > > > because the member device can undergo device reset and FLR flows
> > > > owned by the guest.
> > > >
> > > > I disagree, hypervisors can emulate FLR and never send FLR to real =
devices.
> > > >
> > > That would be some other trap alternative that needs to dissect the d=
evice
> > and build infrastructure for such dissection is not desired in the list=
ed use case.
> >
> > Do you need to trap FLR or not? You're saying the hypervisor is in char=
ge of
> > vPCI, how is this differ to what you proposed? If not, how can vPCI be
> > composed?
> >
> Live migration driver do not need to trap FLR.

Maybe I misunderstood your vPCI composition, but it's really helpful
to document how it is expected to be done.

>
> > I believe you need to document how vpci is supposed to be done, since I=
 believe
> > your proposal can only work with such specific types of PCI composition=
. This is
> > one of the important things that is missed in this series.
> >
> I don=E2=80=99t see a need to describe vpci composition as there may be m=
ore than one way to do it.

More than one way for sure, but this contradicts what you say: you
said you don't trap FLR ...

People like me may wonder for example why FLR is mentioned, as FLR can
be trapped and emulated.

Another example, when a device can be saved and restored, the
hypervisor may schedule the device among multiple VMs, in that case,
trapping FLR is a must.

> What I think it is worth to describe is the whole pci device is not store=
d in device context.
> I will try to add a short description around it.
>
> > >
> > > So your disagreement is fine for non-passthrough devices.
> > >
> > > > > (and hypervisor is not involved in these two flows, hence the
> > > > > admin command
> > > > interface is designed such that it can fullfil above requirements).
> > > > >
> > > > > Theory of operation brings out this clarity. Please notice that i=
t
> > > > > is in
> > > > introductory section with an example.
> > > > > Not normative line.
> > > > >
> > > > > > >
> > > > > > > > > Such flows must comply to the PCI standard and also
> > > > > > > > > +virtio specification;
> > > > > > > >
> > > > > > > > This seems unnecessary and obvious as it applies to all
> > > > > > > > other PCI and virtio functionality.
> > > > > > > >
> > > > > > > Great. But your comment is contradicts.
> > > > > > >
> > > > > > > > What's more, for the things that need to be synchronized, I
> > > > > > > > don't see any descriptions in this patch. And if it doesn't=
 need, why?
> > > > > > > With which operation should it be synchronized and why?
> > > > > > > Can you please be specific?
> > > > > >
> > > > > > See my above question regarding FLR. And it may have others
> > > > > > which I haven't had time to audit.
> > > > > >
> > > > > Ok. when you get chance to audit, lets discuss that time.
> > > >
> > > > Well, I'm not the author of this series, it should be your job
> > > > otherwise it would be too late.
> > > >
> > > As author, what we think, I will cover. If you have specific points t=
o add value,
> > please share, I will look into it.
> >
> > I've pointed out sufficient issues. I have a lot of others but I don't =
want to have a
> > giant thread once again.
> >
> I see following things to improve in the requirements which I will do in =
v2.
>
> 1. Document race around FLR and admin commands for really rare corner cas=
e.
> 2. Some text around not migrating the pci device registers
> 3. Interaction with PM commands
>
> > >
> > > > For example, how is the power management interaction with the
> > freeze/stop?
> > > >
> > > Power management is owned by the guest, like any other virtio interfa=
ce.
> > > So freeze/stop do not interfere with it.
> >
> > I don't think this is a good answer. I'm asking how the PM interacts wi=
th
> > freeze/stop, you answer it works well.
>
> >
> > I'm not obliged to design hardware for you but figuring out the bad des=
ign for
> > virtio. I'm not convinced with a proposal that misses a lot of obvious =
critical
> > cases and for sure it's not my job to solve them.
> >
> I am not asking you to solve.

My point is that, it's better for you to have some investigation on
the PM instead of me.

>
> > I've demonstrated the possible races with FLR. So did the PM. For examp=
le, if VF
> > is in D3cold state, can we still read its device context?
> I think yes, but I will double check.
>  If yes, is it a violation of the PCIE spec? If not, why?

So you are emulating the state instead of a real suspension?

> No, because device context is owned by the owner device and not the VF. S=
R-PCIM interface has defined it be outside of scope of PCIe spec.
>
> > How about other states? Can the device be freezed
> > in the middle of PM state transitions? If yes, how can it work without =
migrating
> > PCI states?
> I will double check, but unlikely, it should be similar to FLR case to ke=
ep the device to avoid treating it differently.

The reason why I see it is different from FLR is that

1) D3cold requires the VF to be off the power
2) State transition might takes more than what FLR did, PCI seems only
cover the minimum delay but not maximum which may have implications
for downtime

>
> > Well, I meant we need a more precise definition of each state otherwise=
 it
> > could be ambiguous (as I pointed above).
> Ok. so, few things about read and other messages, I will add.
>
> >
> > >
> > > > >
> > > > > > >
> > > > > > > In "stop" mode, the device wont process descriptors.
> > > > > >
> > > > > > If the device won't process descriptors, why still allow it to
> > > > > > receive
> > > > notifications?
> > > > > Because notification may still arrive and if the device may updat=
e
> > > > > any counters as part of
> > > >
> > > > Which counters did you mean here?
> > > >
> > > The counter that Xuan is adding and any other state that device may h=
ave to
> > update as result of driver notification.
> > > For example caching the posted avail index in the notification.
> >
> > A link to those proposals?
> [1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00048.=
html
>

I don't see how this is related to "posted avail index" etc.

> > If the device must depend on those cached features to
> > work it's really fragile. If not, we don't need to care about them.
> It is not dependent.
> It is the infrastructure to enable it.
> Same for other shared memory region accesses.
>
> >
> > >
> > > > > it which needs to be migrated or store the received notification.
> > > > >
> > > > > > Or does it really matter if the device can receive or not here?
> > > > > >
> > > > > From device point of view, the device is given the chance to
> > > > > update its device
> > > > context as part of notifications or access to it.
> > > >
> > > > This is in conflict with what you said above " Device cannot proces=
s
> > > > the queue ..."
> > > >
> > > No, it does not.
> > > Device context is updated within the device without accessing the que=
ue
> > memory of the guest.
> >
> > This is not documented or explained anywhere?
> >
> Why should it be explained?
> device is not accessing the guest memory -> this is mentioned in stop mod=
e.

Isn't it hard to see the difference between the following two?

1) In stop mode, device is not accessing guest memory
2) device context is updated without accessing the queue memory of the gues=
t

1) is to define the stop mode, 2) is to define the behaviour of device cont=
ext

Or are you saying device context can only be fetched after the device
is stopped?

> Hence, there is no need to write above.
>
> > >
> > > > Maybe you can give a concrete example.
> > > >
> > > The above one.
> > >
> > > > >
> > > > > > >
> > > > > > > > > + the member device context
> > > > > > > >
> > > > > > > > I don't think we define "device context" anywhere.
> > > > > > > >
> > > > > > > It is defined further in the description.
> > > > > >
> > > > > > Like this?
> > > > > >
> > > > > > """
> > > > > >  +The member device has a device context which the owner driver
> > > > > > can
> > > > > > +either read or write. The member device context consist of any
> > > > > > device  +specific data which is needed by the device to resume
> > > > > > its operation  +when the device mode """
> > > > > >
> > > > > Yes.
> > > > > Further patch-3 adds the device context and also add the link to
> > > > > it in the
> > > > theory of operation section so reader can read more detail about it=
.
> > > > >
> > > > > > "Any" is probably too hard for vendors to implement. And in
> > > > > > patch 3 I only see virtio device context. Does this mean we
> > > > > > don't need transport
> > > > > > (PCI) context at all? If yes, how can it work?
> > > > > >
> > > > > Right. PCI member device is present at source and destination wit=
h
> > > > > its layout,
> > > > only the virtio device context is transferred.
> > > > > Which part cannot work?
> > > >
> > > > It is explained in another thread where you are saying the PCI
> > > > requires mediation. I think any author should not ignore such
> > > > important assumptions in both the change log and the patch.
> > > >
> > > > And again, the more I review the more I see how narrow this series =
can be
> > used:
> > > >
> > > I explained this before and also covered in the cover letter.
> > >
> > > > 1) Only works for SR-IOV member device like VF
> > > It can be extended to SIOV member device in future.
> > > Today these are the only type of member device virtio has.
> >
> > That is exactly what I want to say, it can only work for the owner/memb=
er
> > model. It can't work when the virtio device is not structured like that=
. And you
> > missed that most of the existing virtio devices are not implemented in =
this
> > model. It means they can't be migrated with a pure virtio specific exte=
nsion. For
> > you, SR-IOV is all but this is not true for virtio. PCI is not the only=
 transport and
> > SR-IOV is not the only architecture in PCI.
> >
> Each transport will have its own way to handle it.
> When there is MMIO owner-member relationship arise, one will be able to d=
o so as well.
> In fact other transports will likely miss out as they have not establishe=
d such pace.
>
> > And I'm pretty sure the owner/member is not the only requirement, there=
 are a
> > lot of other assumptions which are missed in this series.
> >
> One proposal does not do everything.
> It is just impractical.

For other assumptions, I meant:

1) how vpci is composed, if it can be composed as vhost, why do we
need to mention "passthrough"
2) the cap/bar layout, for example if a cap shares BARs with others,
it can't be "passthrough", no?

>
> > >
> > > > 2) Mediate PCI but not virtio which is tricky
> > > > 3) Can only work for a specific BAR/capability register layout
> > > >
> > > > Only 1) is described in the change log.
> > > >
> > > > The other important assumptions like 2) and 3) are not documented
> > anywhere.
> > > > And this patch never explains why 2) and 3) is needed or why it can
> > > > be used for subsystems other than VFIO/Linux.
> > > >
> > > Since I am not mentioning vfio now, I will refrain from mentioning
> > > others as well. :)
> >
> > It's not about VFIO at all. It's about to let people know under which c=
ase this
> > proposal could work. Otherwise if a vendor develops a BAR/cap which is =
not at
> > page boundary. How could you make it work with your proposal here?
> >
> Vendor is a cloud operator which is building the device, so it will alway=
s work it has the matching capabilities on source and destination.

I meant, for example, if common_cfg shares a BAR with others but
doesn't own a page exclusively, you need to trap, no?

>
> > >
> > > > >
> > > > > > >
> > > > > > > > >and device configuration space may change. \\
> > > > > > > > > +\hline
> > > > > > > >
> > > > > > > > I still don't get why we need a "stop" state in the middle.
> > > > > > > >
> > > > > > > All pci devices which belong to a single guest VM are not
> > > > > > > stopped
> > > > atomically.
> > > > > > > Hence, one device which is in freeze mode, may still receive
> > > > > > > driver notifications from other pci device,
> > > > > >
> > > > > > Device may choose to ignore those notifications, no?
> > > > > >
> > > > > > > or it may experience a read from the shared memory and get
> > > > > > > garbage
> > > > data.
> > > > > >
> > > > > > Could you give me an example for this?
> > > > > >
> > > > > Section 2.10 Shared Memory Regions.
> > > >
> > > > How can it experience a read in this case?
> > > >
> > > MMIO read/write can be initiated by the peer device while the device =
is in
> > stopped state.
> >
> > Ok, but what I want to say is how it can get the garbage data here?
> >
> If the device mode is changed to freeze while it is being read by the pee=
r device, it can get garbage data or last data.
> Which may not be the one that is expected.
> So first all the initiator devices are stopped, ensure that they do not m=
ake any requests.
>
> And there are requests, which gets proper answer.

Ok.

>
> > >
> > > > Btw, shared regions are tricky for hardware.
> > > >
> > > > >
> > > > > > > And things can break.
> > > > > > > Hence the stop mode, ensures that all the devices get enough
> > > > > > > chance to stop
> > > > > > themselves, and later when freezed, to not change anything inte=
rnally.
> > > > > > >
> > > > > > > > > +0x2   & Freeze &
> > > > > > > > > + In this mode, the member device does not accept any
> > > > > > > > > +driver notifications,
> > > > > > > >
> > > > > > > > This is too vague. Is the device allowed to be freezed in
> > > > > > > > the middle of any virtio or PCI operations?
> > > > > > > >
> > > > > > > > For example, in the middle of feature negotiation etc. It
> > > > > > > > may cause implementation specific sub-states which can't be
> > migrated easily.
> > > > > > > >
> > > > > > > Yes. it is allowed in middle of feature negotiation, for sure=
.
> > > > > > > It is passthrough device, hence hypervisor layer do not get t=
o
> > > > > > > see sub-
> > > > state.
> > > > > > >
> > > > > > > Not sure why you comment, why it cannot be migrated easily.
> > > > > > > The device context already covers this sub-state.
> > > > > >
> > > > > > 1) driver writes driver_features
> > > > > > 2) driver sets FEAUTRES_OK
> > > > > >
> > > > > > 3) device receive driver_features
> > > > > > 4) device validating driver_features
> > > > > > 5) device clears FEATURES_OK
> > > > > >
> > > > > > 6) driver read stats and realize FEATURES_OK is being cleared
> > > > > >
> > > > > > Is it valid to be frozen of the above?
> > > > > No. device mode is frozen when hypervisor is sure that no more
> > > > > access by the
> > > > guest will be done.
> > > >
> > > > How, you don't trap so 1) and 2) are posted, how can hypervisor kno=
w
> > > > if there's inflight transactions to any registers?
> > > >
> > > Because hypervisor has stopped the vcpus which are issuing them.
> >
> > MMIO are posted. vCPU is stopped but the transactions are inflight.
> > How could the hypervisor/device know if there's any inflight PCIE trans=
actions
> > here? So I can imagine what happens in fact is the TLP for freezing is =
ordered
> > with the TLP for posted MMIO. This is probably guaranteed for typical P=
CIE
> > setup but how about the relaxed ordering?
>
> Vcpus do not generated relaxed ordering MMIOs.
> In pci spec: " If this bit is Set, the Function is permitted to set the R=
elaxed Ordering bit in
> the Attributes field of transactions it initiates".
>
> Function initiates RO requests, not the vcpu.
> Hence, it is fine.
>

Ok.

> > >
> > > > > What can happen between #2 and #3, is device mode may change to s=
top.
> > > >
> > > > Why can't be freezed in this case? It's really hard to deduce why i=
t
> > > > can't just from your above descriptions.
> > > >
> > > On the source hypervisor, the mode changes are active->stop->freeze.
> > > Hence when freeze is done, the hypervisor knows that all inflight has=
 been
> > stopped by now.
> >
> > Ok, but how about freezing between 3) and 4). If we allow it, do we nee=
d to
> > migrate to this state? If yes, how can it work with your device context=
? If not,
> > shouldn't we document this?
> >
> May be, some of these are implementation details. I am not sure it belong=
s to spec.

The point is to make sure that your deivce context covers this case.
If it can't be covered, it's a design defect.

> Like RSS update while packets are received.. such implementation details =
are not part of the spec.

This is definitely different, the driver can choose to synchronize or
the end user can tolerate the possible out of order packets in this
case.

This is not the case here, if freezing between 3) and 4) is allowed,
your current device context can't cover this case and guests can't
tolerate such kinds of errors after migration for sure.

>
> > >
> > > > Even if it had, is it even possible to list all the places where
> > > > freezing is prohibited? We don't want to end up with a spec that is
> > > > hard to implement or leave the vendor to figure out those tricky pa=
rts.
> > > >
> > > The general idea is not prohibiting the freeze/stop mode.
> > > If the device needs more time, let device take time to do it.
> >
> > Ok, it means:
> >
> > 1) there're conditions from stop to freeze, then what are they?
> No, there isn=E2=80=99t condition.
> May be I didn=E2=80=99t follow the question.

E.g under which condition could the device change the status from
active to stop etc. That's something I keep asking with a concrete
example (e.g FLR).

> > 2) how much time at most? E.g FLR takes at most 100ms.
> From the driver side, it is 100msec for device side it can be less too.
> As soon as FLR is done or enough to record it, is done, stop can continue=
.
>
> > 3) If it needs more time, can this time satisfy the downtime requiremen=
t?
> >
> Guest VM for all practical purposes is not busy in doing FLR, it is a cor=
ner case, yet we have to cover it.

Corner case in what sense? A loop in a simple shell script can trigger
this easily.

> And yes, it satisfy the downtime requirements, because VM is already not =
interested in the packets, it is busy doing the FLR.

Well, it has subtle differences. VM may have more than one interface,
just one of the interfaces is doing FLR.

>
> > >
> > >
> > > > > And in stop mode, device context would capture #5 or #4, dependin=
g
> > > > > where is
> > > > device at that point.
> > > > >
> > > > > > >
> > > > > > > > And what's more, the above state machine seems to be virtio
> > > > > > > > specific, but you don't explain the interaction with the
> > > > > > > > device status state
> > > > > > machine.
> > > > > > > First, above is not a state machine.
> > > > > >
> > > > > > So how do readers know if a state can go to another state and w=
hen?
> > > > > >
> > > > > Not sure what you mean by reader. Can you please explain.
> > > >
> > > > The people who read virtio spec.
> > > >
> > > So question is "how reader knows if a state can go to another state a=
nd
> > when"?
> > > It is described and listed in the table, when a mode can change.
> >
> > It's not only "if" but also "when". Your table partially answers the "i=
f '' but not
> > "when". I think you should know now the state transition is conditional=
. So let's
> > try our best to ease the life of the vendor.
> What do you mean when?
> I do not understand that "mode change is conditional"? it is not based on=
 the condition.
> [..]

See above.

>
> > > > Let's define the synchronization point first. And it demonstrates a=
t
> > > > least devices need to synchronize between the free/stop and virtio
> > > > device status machine which is not as easy as what is done in this =
patch.
> > > >
> > > Synchronization point =3D device.
> >
> > This is obvious as we can't rule stuff outside virtio, and we are talki=
ng about
> > devices not drivers here. But the spec needs sufficient guidance/normat=
ive for
> > the vendor to implement. It's more than just saying "device is synchron=
ization
> > point".
> >
> The requirements are already covering what device needs to do.
> Some interaction points are missing, as I acked above, I will add them.
>
> [..]
> > > > Until virtio reset, this is how virtio works now. I've pointed out
> > > > that it may cause extra troubles when trying to resume, but you
> > > > don't tell me what's wrong to keep that?
> > > >
> > > If kept, hypervisor may not be able to decide when to change the mode=
 from
> > active->stop.
> >
> > Why? It is simply done when mgmt requires a migration?
> >
> Mgmt is bit higher level entity. Underneath the software layers may wait =
until the time is right to migrate.

I don't understand, anyhow the migration request could not be sent to
the device directly without the assistance in hypervisor.

> The fundamental point is, the device context is expected to return the in=
cremental value, that is changed content from last time.
> So once all changed content is read, its empty.

You can't easily define an incremental value for all types of states
or structures:

1) device with complicated states like RAM or other
2) the device state has complicated data structures

>
> > What's more important, PCI allows multiple common_cfgs. So the hypervis=
or
> > can choose to reserve one common_cfg for live migration. In this case w=
e don't
> > have to read to clear semantics.
> Common_cfg does not serve large device context, nor it serves DMA.

Well, I'd think e.g the address of the descriptor table is part of the
device context, and it can be read some common_cfg.

>
> >
> > Or, are you saying the value read from common_cfg is not device context=
?
> The value of common config is part of the device context that represents =
current common config.
>
> > Isn't this conflict with your vague definition of device context?
> >
> You mentioned you stop at this patch,

Stop means stopping comment.

> so likely you didn=E2=80=99t read device context patch, hence you quote i=
t vague.
> So I don=E2=80=99t know what you mean by vague.

So in this patch you define device context as:

"The member device context consist of any device specific
data which is needed by the device to resume its operation"

So the address of the descriptor table satisfy this definition? If not, why=
?

> Please let me know what you additional thing you want to see in device co=
ntext after you reach that patch.
>
>
> > > We can opt for a mode where full device context is read in each mode
> > without clearing it.
> > > But than it can be very specific to a version of qemu, which we are a=
voiding it
> > here.
> > >
> > > > > 2. device context returns incremental value from the previous
> > > > > read. So, it
> > > > needs to clear it.
> > > >
> > > > I don't understand here. This is not the case for most of the devic=
es.
> > > >
> > > Not sure which devices you mean here with "most of the devices".
> > > Device context functions like a write record pages (aka dirty pages).
> >
> > It's definitely different. We want to migrate dirty pages lively which =
can
> > consume a lot of bandwidth. So reporting delta makes a lot of sense her=
e since
> > it would have a lot of rounds of syncing and it doesn't result in block=
ers
> > resuming.
> >
> Write records are reported as delta from the previous read.
>
> > For device context, how many rounds of syncing did you expect, and if w=
e have
> > N rounds, we need to restore N rounds in order to resume? Do you want t=
o live
> > migrating device states? If it's only 1 or 2 rounds, why bother?
> >
> Live migrate the device context. Typically in current software using it, =
it is 2 rounds.

If it's just 2 rounds, why bother for delta? It is only helpful is we
want to live migrate some device with giant states with sevreal
rounds, and in that can we should leave it as a device specific state.

> The interface is generic that if needed more rounds are possible.
>
> Even device for most practical purpose will implement 2 rounds.
>
> > And for the delta, how do you know you can easily define deltas for eve=
ry type
> > of device, especially the ones with complicated internal states? Defini=
ng states
> > has already been demonstrated as a complicated task for some devices li=
ke
> > virtio-FS and you want to complicate it furtherly?
> >
> What is your question? If you say virtio-fs is complicated state, may be =
it should not have existed itself in the virtio spec as first place.

We have just more than FS that can't work for live migration. Crypto
and GPU are two other examples, and I'm pretty sure we have more.

Until we figure out how they can, we can't say a device context work
for all types. No?

1) Trying to define a format that works for all types of devices
2) Leavce the states to be defined by individual device types

Which method is esay?

> But I differ to think that.
> Virtio-fs guest side state wont be changed as part of it.
> Virtio-fs is the first device which has considered and listed to migrate =
the device state.
> So it should be possible.

I wouldn't repeart the discussion of virtio-FS migration here, you can
serach the archives for more details.

But the point is obvious, it's really hard to say a simple device
context can work for all type of devices. We should allow a device
specific states definition. This seems to be agreed by Michale and
LingShan.

>
> > What is proposed in this series is an ad-hoc optimization for a specifi=
c deivce
> > type within a specific subsystem (e.g VFIO) in a specific operating sys=
tem which
> > is not the general.
> >
> Oh now you mention vfio. Not me. :)
>
> I am not going to comment on this. It is not ad-hoc.

You need to justify how it is not. Based on the current discussion,
you have demonstreated a lot of asusmptions in order to make your
proposal to work.

> It uses similar dirty page tracking like technique present in cpu hw and =
other devices.
>
> > As demsonsted many times, starting from something simple and stupid is =
the
> > most easy way.
> >
>
> > > Whatever is already returned is/should not be repeated in subsequent =
reads,
> > though device can choose to do so.
> > >
> > > > >
> > > > > > > And which software stack may find this useful?
> > > > > > > Is there any existing software that can utilize it?
> > > > > >
> > > > > > Libvirt.
> > > > > >
> > > > > Does libvirt restore on migration failure?
> > > >
> > > > Yes.
> > > >
> > > Ok. the device will be able to resume when it is marked active.
> > > The device context returned  is the incremental delta as explained ab=
ove.
> >
> > I disagree, see my above reply.
> I replied above.
>
> >
> > >
> > > > >
> > > > > > > Why that device context present with the software vanished, i=
n
> > > > > > > your
> > > > > > assumption, if it is?
> > > > > > >
> > > > > > > > > Typically, on
> > > > > > > > > +the source hypervisor, the owner driver reads the device
> > > > > > > > > +context once when the device is in \field{Active} or
> > > > > > > > > +\field{Stop} mode and later once the member device is in
> > > > \field{Freeze} mode.
> > > > > > > >
> > > > > > > > Why need the read while device context could be changed? Or
> > > > > > > > is the dirty page part of the device context?
> > > > > > > >
> > > > > > > It is not part of the dirty page.
> > > > > > > It needs to read in the active/stop mode, so that it can be
> > > > > > > shared with
> > > > > > destination hypervisor, which will pre-setup the complex contex=
t
> > > > > > of the device, while it is still running on the source side.
> > > > > >
> > > > > > Is such a method used by any hypervisor?
> > > > > Yes. qemu which uses vfio interface uses it.
> > > >
> > > > Ok, such software technology could be used for all types of devices=
,
> > > > I don't see any advantages to mention it here unless it's unique to=
 virtio.
> > > >
> > > It is theory of operation that brings the clarity and rationale.
> >
> > I think it's not. Since it's not something that is unique to virtio.
> >
> > > So I will keep it.
> > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > > +
> > > > > > > > > +Typically, the device context is read and written one
> > > > > > > > > +time on the source and the destination hypervisor
> > > > > > > > > +respectively once the device is in \field{Freeze} mode.
> > > > > > > > > +On the destination hypervisor, after writing the device
> > > > > > > > > +context, when the device mode set to \field{Active}, the
> > > > > > > > > +device uses the most recently set device context and
> > > > > > > > > +resumes the device
> > > > > > > > operation.
> > > > > > > >
> > > > > > > > There's no context sequence, so this is obvious. It's the
> > > > > > > > semantic of all other existing interfaces.
> > > > > > > >
> > > > > > > Can you please what which existing interfaces do you mean her=
e?
> > > > > >
> > > > > > For any common cfg member. E.g queue_addr.
> > > > > >
> > > > > > The driver wrote 100 different values to queue_addr and the
> > > > > > device used the value written last time.
> > > > > >
> > > > > o.k. I don=E2=80=99t see any problem in stating what is done, whi=
ch is
> > > > > less vague. =F0=9F=98=8A
> > > > >
> > > > > > >
> > > > > > > > > +
> > > > > > > > > +In an alternative flow, on the source hypervisor the
> > > > > > > > > +owner driver may choose to read the device context first
> > > > > > > > > +time while the device is in \field{Active} mode and
> > > > > > > > > +second time once the device is in \field{Freeze}
> > > > > > > > mode.
> > > > > > > >
> > > > > > > > Who is going to synchronize the device context with possibl=
e
> > > > > > > > configuration from the driver?
> > > > > > > >
> > > > > > > Not sure I understand the question.
> > > > > > > If I understand you right, do you mean that, When
> > > > > > > configuration change is done by the guest driver, how does de=
vice
> > context change?
> > > > > > >
> > > > > >
> > > > > > Yes.
> > > > > >
> > > > > > > If so, device context reading will reflect the new configurat=
ion.
> > > > > >
> > > > > > How do you do that? For example:
> > > > > >
> > > > > > static inline void vp_iowrite64_twopart(u64 val,
> > > > > >                                         __le32 __iomem *lo,
> > > > > >                                         __le32 __iomem *hi) {
> > > > > >         vp_iowrite32((u32)val, lo);
> > > > > >         vp_iowrite32(val >> 32, hi); }
> > > > > >
> > > > > > Is it ok to be freezed in the middle of two vp_iowrite()?
> > > > > >
> > > > > Yes. the device context VIRTIO_DEV_CTX_PCI_COMMON_RUNTIME_CFG
> > > > section captures the partial value.
> > > >
> > > > There's no way for the device to know whether or not it's a partial=
 value or
> > not.
> > > > No?
> > > >
> > > Device does not need to know, because when the guest vm and the devic=
e is
> > resumed on the destination, it the guest vm will continue with writing =
the 2nd
> > part.
> > >
> > > > >
> > > > > > >
> > > > > > > > > Similarly, on the
> > > > > > > > > +destination hypervisor writes the device context first
> > > > > > > > > +time while the device is still running in \field{Active}
> > > > > > > > > +mode on the source hypervisor and writes the device
> > > > > > > > > +context second time while the device is in
> > > > > > > > \field{Freeze} mode.
> > > > > > > > > +This flow may result in very short setup time as the
> > > > > > > > > +device context likely have minimal changes from the
> > > > > > > > > +previously written device
> > > > > > context.
> > > > > > > >
> > > > > > > > Is the hypervisor who is in charge of doing the comparison
> > > > > > > > and writing only the delta?
> > > > > > > >
> > > > > > > The spec commands allow to do so. So possibility exists from =
spec
> > wise.
> > > > > >
> > > > > > There are various optimizations for migration for sure, I don't
> > > > > > think mentioning any specific one is good.
> > > > > >
> > > > > The text is informative text similar to,
> > > > >
> > > > > " However, some devices benefit from the ability to find out the
> > > > > amount of available data in the queue without accessing the
> > > > > virtqueue in
> > > > memory"
> > > > >
> > > > > " To help with these optimizations, when
> > > > > VIRTIO_F_NOTIFICATION_DATA has
> > > > been negotiated".
> > > > >
> > > > > Is this the only optimization in virtio? No, but we still mention
> > > > > the rationale of
> > > > why it exists.
> > > >
> > > > The above is a good example as it explain VIRTIO_F_NOTIFICATION_DAT=
A
> > > > is the only way without accessing the virtqueue. But this is not th=
e case of
> > migration.
> > > > You said it's just a possibility but not a must which is not the
> > > > case for VIRTIO_F_NOTIFICATION_DATA.
> > > >
> > > It is one of the optimization apart. The comparison is of one_of_exam=
ple or
> > not.
> >
> > I don't get this.
> Theory of operation is describing a flow how things are done and how the =
constructs are helpful to achieve it.

Immature optimzation doesn't belong to theory for sure. I see your
delta reporting immature in many ways. That's the point.

Thanks

> And it is not the end of the list.
> That does not mean one should not write those.



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

