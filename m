Return-Path: <virtio-comment-return-7699-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DFDCDB474
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 01:15:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D21FE7A093
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 01:15:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AA0B9986840
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 01:15:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8B4969842E5; Fri, 13 Oct 2023 01:15:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6C6D0986835
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 01:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: rCe6h9DAMYu8zuBRLZjJvQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697159748; x=1697764548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWeUxxa3Bt9rI09vQ2pX6CwN0+KW6s8THZs5UngnS94=;
        b=bgpOggduaddbHjQn4hK0V04X5O1m/IUbqPWC1S8L1g56A8wBO1G72OH/dYZvdbK9nE
         E8N5LmidzzNXezVyHn+FG2spdXo5L9QIPxvDJixrUIeq75eeEj2Dw2HIw6cNy6FNBx/T
         1fuVyHGofUeyag2BDxO6Cb4btsjVLt31JomG6lZntFkQXVTIIavC9YhLZQ7SIiLyd7Yr
         ZKOCP/OYyNi6UHlgC5NgmBO4icndzIKWdOMbbJrLeeBnfRDzolDPSLXf9a5k/GiJwv1N
         9VoPUom0qCwUjgoWBDCC+M3WuZPkA/vYUhXrikYvrBUpYLO2//25HeCVAbxmdVAh0tsX
         RhSQ==
X-Gm-Message-State: AOJu0YzGMI+4Z+zbEORy5FB8Aww/eQqruz/tZ+O3tGhLP3pW3rL/CxI8
	gELBsPXixlkT0elir8NZ3S3Dn48mhdJMIsqaez+jMTL8tWRHkQHVJNXpn8WQE4TnunXUt1d8RZC
	vNFajgpE+B8OU1Q25hEyNkdtkYPA7nyK4QfuzK9bxnls5Fl87Pw==
X-Received: by 2002:a05:6512:ac8:b0:503:1aae:eca0 with SMTP id n8-20020a0565120ac800b005031aaeeca0mr27221053lfu.44.1697159747527;
        Thu, 12 Oct 2023 18:15:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGak1W1RrgzfZYUKLMEM3935a46E85QxT5dGplcM3w+RL1jbdpLDaGdW5QTmir1HETnMQ93yExc6JyX6EbOYpI=
X-Received: by 2002:a05:6512:ac8:b0:503:1aae:eca0 with SMTP id
 n8-20020a0565120ac800b005031aaeeca0mr27220947lfu.44.1697159742817; Thu, 12
 Oct 2023 18:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231008112555.473895-1-parav@nvidia.com> <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB548029E1AAB8529339D22D4DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEswD2XLjRNzyqo9M-yT77PsOJqJmDLxSKd2ZOgqLYjjZQ@mail.gmail.com>
 <PH0PR12MB548143D2AB83CA90E7F1C9D6DCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsk7ZgmWuqm9U_Tych8+Ceu7X9RymQASeSS_ayB2PGTgg@mail.gmail.com> <PH0PR12MB54817B050D97CC7123DE30ECDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54817B050D97CC7123DE30ECDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Oct 2023 09:15:31 +0800
Message-ID: <CACGkMEux-kXQ=d_6CVyfhNit4TMJ=V1p8C6XRDXhCLAJDD5kRA@mail.gmail.com>
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

On Wed, Oct 11, 2023 at 6:47=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, October 11, 2023 8:44 AM
> >
> > On Tue, Oct 10, 2023 at 3:19=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, October 10, 2023 11:21 AM
> > > >
> > > > On Mon, Oct 9, 2023 at 6:06=E2=80=AFPM Parav Pandit <parav@nvidia.c=
om> wrote:
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Monday, October 9, 2023 2:19 PM
> > > > > >
> > > > > > Adding LingShan.
> > > > > >
> > > > > Thanks for adding him.
> > > > >
> > > > > > Parav, if you want any specific people to comment, please do cc=
 them.
> > > > > >
> > > > > Sure, will cc them in v2 as now I see there is interest in the re=
view.
> > > > >
> > > > > > On Sun, Oct 8, 2023 at 7:26=E2=80=AFPM Parav Pandit <parav@nvid=
ia.com> wrote:
> > > > > > >
> > > > > > > One or more passthrough PCI VF devices are ubiquitous for
> > > > > > > virtual machines usage using generic kernel framework such as=
 vfio [1].
> > > > > >
> > > > > > Mentioning a specific subsystem in a specific OS may mislead th=
e
> > > > > > user to think it can only work in that setup. Let's not do that=
,
> > > > > > virtio is not only used for Linux and VFIO.
> > > > > >
> > > > > Not really. it is an example in the cover letter.
> > > > > It is not the only use case.
> > > > > A use case gives a crisp clarity of what UAPI it needs to fulfil.
> > > > > So I will keep it. It is anyway written as one use case.
> > > > >
> > > > > > >
> > > > > > > A passthrough PCI VF device is fully owned by the virtual
> > > > > > > machine device driver.
> > > > > >
> > > > > > Is this true? Even VFIO needs to mediate PCI stuff. Or how do
> > > > > > you define "passthrough" here?
> > > > > >
> > > > > Other than PCI config registers and due to some legacy, msix.
> > > > > The "device interface" side is not mediated.
> > > > > The definition of passthrough here is: To not mediate a device
> > > > > type specific
> > > > and virtio specific interfaces for modern and future devices.
> > > >
> > > > Ok, but what's the difference between "device type specific" and
> > > > "virtio specific interfaces". Maybe an example for this?
> > > >
> > > Virtio device specific means: cvq of crypto device, cvq of net device=
, flow filter
> > vqs of net device etc.
> > > Virtio specific interface: virtio driver notifications, virtio virtqu=
eue and
> > configuration mediation etc.
> > >
> > > > >
> > > > > > > This passthrough device controls its own device reset flow,
> > > > > > > basic functionality as PCI VF function level reset
> > > > > >
> > > > > > How about other PCI stuff? Or Why is FLR special?
> > > > > FLR is special for the readers to get the clarity that FLR is als=
o
> > > > > done by the
> > > > guest driver hence, the device migration commands do not
> > > > interact/depend with FLR flow.
> > > >
> > > > It's still not clear to me how this is done.
> > > >
> > > > 1) guest starts FLR
> > > > 2) adminq freeze the VF
> > > > 3) FLR is done
> > > >
> > > > If the freezing doesn't wait for the FLR, does it mean we need to
> > > > migrate to a state like FLR is pending? If yes, do we need to
> > > > migrate the other sub states like this? If not, why?
> > > >
> > > In most practical cases #2 followed by #1 should not happen as on the=
 source
> > side the expected is mode change to stop from active.
> >
> > How does the hypervisor know if a guest is doing what without trapping?
> >
> Hypervisor does not know. The device knows being the recipient of #1 and =
#2.

We are discussing the possibility in software/driver side isn't it?

1) is initiated from the guest
2) is initiated from the hypervisor

Both are softwares, and you're saying 2) should not happen after 1)
since the device knows what is being done by guests? How can devices
control software behaviour?

This only possible thing is to make sure 3) is done before 2) That is
what I'm asking but you are saying freeze doesn't need to wait for
FLR...

>
> > > But ok, since we active to freeze mode change is allowed, lets discus=
s above.
> > >
> > > A device is the single synchronization point for any device reset, FL=
R or admin
> > command operation.
> >
> > So you agree we need synchronization? And I'm not sure I get the meanin=
g of
> > synchronization point, do you mean the synchronization between freeze/s=
top
> > and virtio facilities?
> >
> Synchronization means, handling two events in parallel such as FLR and ot=
her.

Great. So we have a perfect race:

1) guest initiates FLR
2) device start FLR
3) hypervisor stop and freeze the device
4) device is freeze
5) hypervisor read device context A
6) migrate device contextA
8) migration is done
9) FLR is done
10) hypervisor read device context B

So we end up with inconsistent device context, no? Dest want B or A+B,
but you give A.

>
> > > So, the migration driver do not need to wait for FLR to complete.
> >
> > I'm confused, you said below that device context could be changed by FL=
R.
> >
> Yes.
> > If FLR needs to clear device context, we can have a race where device c=
ontext is
> > cleared when we are trying to read it?
> >
> I didn=E2=80=99t say clear the context.
> FLR updates the device context.

In what sense?

> Device is serving the device context read write commands, serving FLR, an=
swering mode change command,
> So device knows the best how to avoid any race.

You want to leave those details for the vendor to figure out? If
devices know everything, why do we need device normative?

I see issues at least for FLR, I'm pretty sure they are others. If a
design requires us to audit all the possible conflicts between virtio
facilities and transport. It's a strong hint of layer violation and
when it happens it for sure may hit a lot of problems that are very
hard to find or debug thus we should drop such a design. I suggest
using the RFC tag since the next version (if there is one) as I see it
is immature in many ways.

What's more, solving races is much easier if the device functionality
is self contained. For example, for a self contained device with the
transport as the single interface, we can leverage from transport
(PCI) for dealing with races, arbitration, ordering, QOS etc which is
probably required in the internal channel between the owner and the
member. But all of these were missed in your series and even if you
can I'm not sure it's worthwhile to reinvent all of them.

For example, for the architecture like owner/member, if the virtio or
transport facility could be controlled via device internal channels
besides the transport, such a channel may complicate the
synchronization a lot. The device needs to be able to handle or
synchronize requests from both PCI and owner in parallel. They are
just too many possible races and most of my questions so far come from
this viewpoint. I wouldn't go further for other stuff since I believe
I've spotted sufficient issues and that's why I must stop at this
patch before looking at the rest.

Admin commands are fine if it does real administrative jobs such as
provisioning since such work is beyond the core virtio functionality.

Again, the goal of virtio spec is to have a device with sufficient
guidelines that is easy to implement but not leave the vendors to
waste their engineering resources in figuring or fuzzing the corner
cases.

>
> > > When admin cmd freeze the VF it can expect FLR_completed VF.
> >
> > We need to explain why and how about the resume? For example, is resumi=
ng
> > required to wait for the completion of FLR, if not, why?

This question is ignored.

> >
> > > Secondly since the FLR is local to the source, intermediate sub state=
 does not
> > migrate.
> > >
> > > But I agree, it is worth to have the text capturing this.
> > >
> > > > >
> > > > > >
> > > > > > > and rest of the virtio device functionality such as control
> > > > > > > vq,
> > > > > >
> > > > > > What do you mean by "rest of"?
> > > > > >
> > > > > As given in the example cvq.
> > > > >
> > > > > > Which part is not controlled and why?
> > > > > Not controlled because as states, it is passthrough device.
> > > > >
> > > > > > > config space access, data path descriptors handling.
> > > > > > >
> > > > > > > Additionally, VM live migration using a precopy method is als=
o
> > > > > > > widely
> > > > used.
> > > > > >
> > > > > > Why is this mentioned here?
> > > > > >
> > > > > Huh. You should be positive for bringing clarity to the readers o=
n
> > > > understanding the use case.
> > > > > And you seem opposite, but ok.
> > > > >
> > > > > As stated, it for the reader to understand the use case and see
> > > > > how proposed
> > > > commands addresses the use case.
> > > >
> > > > The problem is that the hardware features should be designed for a
> > > > general purpose instead of a specific technology if it can. The onl=
y
> > > > missing part for post copy is the page fault.
> > > >
> > > Ok. The use case and requirement of member device passthrough is clea=
r to
> > most reviewers now.
> >
> > In another thread you are saying that the PCI composition is done by hy=
pervisor,
> > so passthrough is really confusing at least for me.
> >
> I explained there what vPCI composition is done there.
> PCI config space and msix side of composition is done.
> The whole virtio interface is not composed.

You need to describe this somewhere, no? That's what I'm saying.

And passthrough is misleading here.

>
> > > Ok. I assume "reset flow" is clear to you now that it points to secti=
on 2.4.
> > > This section is not normative section, so using an extra word like "f=
low" does
> > not confuse anyone.
> > > I will link to the section anyway.
> >
> > Probably, but you mention FLR flow as well.
> As I said, not repeating the PCIe spec here. The reader knows what FLR of=
 the PCIe transport.

Ok, I'm not a native speaker, but I really don't know the difference
between "FLR" and "FLR flow".

>
> >
> > >
> > > > >
> > > > > > > and may also undergo PCI function level
> > > > > > > +reset(FLR) flow.
> > > > > >
> > > > > > Why is only FLR special here? I've asked FRS but you ignore the=
 question.
> > > > > >
> > > > > FLR is special to bring clarity that guest owns the VF doing FLR,
> > > > > hence
> > > > hypervisor cannot mediate any registers of the VF.
> > > >
> > > > It's not about mediation at all, it's about how the device can
> > > > implement what you want here correctly.
> > > >
> > > > See my above question.
> > > >
> > > Ok. it is clear that live migration commands cannot stay on the membe=
r device
> > because the member device can undergo device reset and FLR flows owned =
by
> > the guest.
> >
> > I disagree, hypervisors can emulate FLR and never send FLR to real devi=
ces.
> >
> That would be some other trap alternative that needs to dissect the devic=
e and build infrastructure for such dissection is not desired in the listed=
 use case.

Do you need to trap FLR or not? You're saying the hypervisor is in
charge of vPCI, how is this differ to what you proposed? If not, how
can vPCI be composed?

I believe you need to document how vpci is supposed to be done, since
I believe your proposal can only work with such specific types of PCI
composition. This is one of the important things that is missed in
this series.

> Here we are addressing the requirement of passthrough the device.

I don't think what you proposed here is passthrough, at least the PCI
part is not. And whether or not the virto can be passthrough is still
questionable to me.

>
> So your disagreement is fine for non-passthrough devices.
>
> > > (and hypervisor is not involved in these two flows, hence the admin c=
ommand
> > interface is designed such that it can fullfil above requirements).
> > >
> > > Theory of operation brings out this clarity. Please notice that it is=
 in
> > introductory section with an example.
> > > Not normative line.
> > >
> > > > >
> > > > > > > Such flows must comply to the PCI standard and also
> > > > > > > +virtio specification;
> > > > > >
> > > > > > This seems unnecessary and obvious as it applies to all other
> > > > > > PCI and virtio functionality.
> > > > > >
> > > > > Great. But your comment is contradicts.
> > > > >
> > > > > > What's more, for the things that need to be synchronized, I
> > > > > > don't see any descriptions in this patch. And if it doesn't nee=
d, why?
> > > > > With which operation should it be synchronized and why?
> > > > > Can you please be specific?
> > > >
> > > > See my above question regarding FLR. And it may have others which I
> > > > haven't had time to audit.
> > > >
> > > Ok. when you get chance to audit, lets discuss that time.
> >
> > Well, I'm not the author of this series, it should be your job otherwis=
e it would
> > be too late.
> >
> As author, what we think, I will cover. If you have specific points to ad=
d value, please share, I will look into it.

I've pointed out sufficient issues. I have a lot of others but I don't
want to have a giant thread once again.

>
> > For example, how is the power management interaction with the freeze/st=
op?
> >
> Power management is owned by the guest, like any other virtio interface.
> So freeze/stop do not interfere with it.

I don't think this is a good answer. I'm asking how the PM interacts
with freeze/stop, you answer it works well.

I'm not obliged to design hardware for you but figuring out the bad
design for virtio. I'm not convinced with a proposal that misses a lot
of obvious critical cases and for sure it's not my job to solve them.

I've demonstrated the possible races with FLR. So did the PM. For
example, if VF is in D3cold state, can we still read its device
context? If yes, is it a violation of the PCIE spec? If not, why? How
about other states? Can the device be freezed in the middle of PM
state transitions? If yes, how can it work without migrating PCI
states?

>
> > >
> > > > >
> > > > > It is not written in this series, because we believe it must not
> > > > > be synchronized
> > > > as it is fully controlled by the guest.
> > > > >
> > > > > >
> > > > > > > at the same time such flows must not obstruct
> > > > > > > +the device migration flow. In such a scenario, a group owner
> > > > > > > +device can provide the administration command interface to
> > > > > > > +facilitate the device migration related operations.
> > > > > > > +
> > > > > > > +When a virtual machine migrates from one hypervisor to
> > > > > > > +another hypervisor, these hypervisors are named as source an=
d
> > > > > > > +destination
> > > > > > hypervisor respectively.
> > > > > > > +In such a scenario, a source hypervisor administers the
> > > > > > > +member device to suspend the device and preserves the device
> > context.
> > > > > > > +Subsequently, a destination hypervisor administers the membe=
r
> > > > > > > +device to setup a device context and resumes the member devi=
ce.
> > > > > > > +The source hypervisor reads the member device context and th=
e
> > > > > > > +destination hypervisor writes the member device context. The
> > > > > > > +method to transfer the member device context from the source
> > > > > > > +to the destination hypervisor is
> > > > > > outside the scope of this specification.
> > > > > > > +
> > > > > > > +The member device can be in any of the three migration modes=
.
> > > > > > > +The owner driver sets the member device in one of the
> > > > > > > +following modes during
> > > > > > device migration flow.
> > > > > > > +
> > > > > > > +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline Value & Name
> > > > > > > +& Description \\ \hline \hline
> > > > > > > +0x0   & Active &
> > > > > > > +  It is the default mode after instantiation of the member
> > > > > > > +device. \\
> > > > > >
> > > > > > I don't think we ever define "instantiation" anywhere.
> > > > > >
> > > > > Well a transport has implicit definition of the instantiation alr=
eady.
> > > > > May be a text can be added, but don=E2=80=99t see a value in dupl=
icating
> > > > > PCI spec
> > > > here.
> > > >
> > > > Ok, maybe something like "transport specific instantiation"
> > > >
> > > Ok. that=E2=80=99s a good text. I will change to it.
> > >
> > > > >
> > > > > > > +\hline
> > > > > > > +0x1   & Stop &
> > > > > > > + In this mode, the member device does not send any
> > > > > > > +notifications, and it does not access any driver memory.
> > > > > >
> > > > > > What's the meaning of "driver memory"?
> > > > > >
> > > > > May be guest memory? Or do you suggest a better naming for the
> > > > > memory
> > > > allocated by the guest driver?
> > > >
> > > > Virtqueue?
> > > >
> > > Virtqueue and any memory referred by the virtqueue.
> > >
> > > This is good text, I will change to it.
> > >
> > > > >
> > > > > > And stop seems to be a source of inflight buffers.
> > > > > >
> > > > > I didn=E2=80=99t follow it.
> > > > > If you mean without stop there are no inflight buffer, then I don=
=E2=80=99t agree.
> > > > > We don=E2=80=99t want to violate the spec by having descriptors w=
ith zero
> > > > > size
> > > > returned.
> > > > > Stop is not the source of inflight descriptors.
> > > >
> > > > I think not since you forbid access to the used ring here. So even
> > > > if the buffer were processed by the device it can't be added back t=
o
> > > > the used ring thus became inflight ones.
> > > >
> > > > >
> > > > > There are inflight descriptors with the device that are not yet
> > > > > returned to the
> > > > driver, and device wont return them as zero size wrong completions.
> > > > >
> > > > > > > + The member device may receive driver notifications in this
> > > > > > > + mode,
> > > > > >
> > > > > > What's the meaning of "receive"? For example if the device can
> > > > > > still process buffers, "stop" is not accurate.
> > > > > >
> > > > > Receive means, driver can send the notification as PCIe TLP that
> > > > > device may
> > > > receive as incoming PCIe TLP.
> > > >
> > > > Ok, so this is the transport level. But the device can keep process=
ing the
> > queue?
> > > >
> > > Device cannot process the queue because it does not initiate any read=
/write
> > towards the virtqueue.
> >
> > Read/Write only results in a driver noticeable behaviour, it doesn't me=
an the
> > device can't process the buffers.  For example, devices can keep proces=
sing
> > available buffers and make them as inflight ones.
> >
> The idea is to stop the device and prepare for the migration, so the comm=
and to do so.
> Otherwise just the keep the device in active mode and avoid the complicat=
ions.

Well, I meant we need a more precise definition of each state
otherwise it could be ambiguous (as I pointed above).

>
> > >
> > > > >
> > > > > In "stop" mode, the device wont process descriptors.
> > > >
> > > > If the device won't process descriptors, why still allow it to rece=
ive
> > notifications?
> > > Because notification may still arrive and if the device may update an=
y
> > > counters as part of
> >
> > Which counters did you mean here?
> >
> The counter that Xuan is adding and any other state that device may have =
to update as result of driver notification.
> For example caching the posted avail index in the notification.

A link to those proposals? If the device must depend on those cached
features to work it's really fragile. If not, we don't need to care
about them.

>
> > > it which needs to be migrated or store the received notification.
> > >
> > > > Or does it really matter if the device can receive or not here?
> > > >
> > > From device point of view, the device is given the chance to update i=
ts device
> > context as part of notifications or access to it.
> >
> > This is in conflict with what you said above " Device cannot process th=
e queue
> > ..."
> >
> No, it does not.
> Device context is updated within the device without accessing the queue m=
emory of the guest.

This is not documented or explained anywhere?

>
> > Maybe you can give a concrete example.
> >
> The above one.
>
> > >
> > > > >
> > > > > > > + the member device context
> > > > > >
> > > > > > I don't think we define "device context" anywhere.
> > > > > >
> > > > > It is defined further in the description.
> > > >
> > > > Like this?
> > > >
> > > > """
> > > >  +The member device has a device context which the owner driver can
> > > > +either read or write. The member device context consist of any
> > > > device  +specific data which is needed by the device to resume its
> > > > operation  +when the device mode """
> > > >
> > > Yes.
> > > Further patch-3 adds the device context and also add the link to it i=
n the
> > theory of operation section so reader can read more detail about it.
> > >
> > > > "Any" is probably too hard for vendors to implement. And in patch 3
> > > > I only see virtio device context. Does this mean we don't need
> > > > transport
> > > > (PCI) context at all? If yes, how can it work?
> > > >
> > > Right. PCI member device is present at source and destination with it=
s layout,
> > only the virtio device context is transferred.
> > > Which part cannot work?
> >
> > It is explained in another thread where you are saying the PCI requires
> > mediation. I think any author should not ignore such important assumpti=
ons in
> > both the change log and the patch.
> >
> > And again, the more I review the more I see how narrow this series can =
be used:
> >
> I explained this before and also covered in the cover letter.
>
> > 1) Only works for SR-IOV member device like VF
> It can be extended to SIOV member device in future.
> Today these are the only type of member device virtio has.

That is exactly what I want to say, it can only work for the
owner/member model. It can't work when the virtio device is not
structured like that. And you missed that most of the existing virtio
devices are not implemented in this model. It means they can't be
migrated with a pure virtio specific extension. For you, SR-IOV is all
but this is not true for virtio. PCI is not the only transport and
SR-IOV is not the only architecture in PCI.

And I'm pretty sure the owner/member is not the only requirement,
there are a lot of other assumptions which are missed in this series.

>
> > 2) Mediate PCI but not virtio which is tricky
> > 3) Can only work for a specific BAR/capability register layout
> >
> > Only 1) is described in the change log.
> >
> > The other important assumptions like 2) and 3) are not documented anywh=
ere.
> > And this patch never explains why 2) and 3) is needed or why it can be =
used for
> > subsystems other than VFIO/Linux.
> >
> Since I am not mentioning vfio now, I will refrain from mentioning others=
 as well. :)

It's not about VFIO at all. It's about to let people know under which
case this proposal could work. Otherwise if a vendor develops a
BAR/cap which is not at page boundary. How could you make it work with
your proposal here?

>
> > >
> > > > >
> > > > > > >and device configuration space may change. \\
> > > > > > > +\hline
> > > > > >
> > > > > > I still don't get why we need a "stop" state in the middle.
> > > > > >
> > > > > All pci devices which belong to a single guest VM are not stopped
> > atomically.
> > > > > Hence, one device which is in freeze mode, may still receive
> > > > > driver notifications from other pci device,
> > > >
> > > > Device may choose to ignore those notifications, no?
> > > >
> > > > > or it may experience a read from the shared memory and get garbag=
e
> > data.
> > > >
> > > > Could you give me an example for this?
> > > >
> > > Section 2.10 Shared Memory Regions.
> >
> > How can it experience a read in this case?
> >
> MMIO read/write can be initiated by the peer device while the device is i=
n stopped state.

Ok, but what I want to say is how it can get the garbage data here?

>
> > Btw, shared regions are tricky for hardware.
> >
> > >
> > > > > And things can break.
> > > > > Hence the stop mode, ensures that all the devices get enough
> > > > > chance to stop
> > > > themselves, and later when freezed, to not change anything internal=
ly.
> > > > >
> > > > > > > +0x2   & Freeze &
> > > > > > > + In this mode, the member device does not accept any driver
> > > > > > > +notifications,
> > > > > >
> > > > > > This is too vague. Is the device allowed to be freezed in the
> > > > > > middle of any virtio or PCI operations?
> > > > > >
> > > > > > For example, in the middle of feature negotiation etc. It may
> > > > > > cause implementation specific sub-states which can't be migrate=
d easily.
> > > > > >
> > > > > Yes. it is allowed in middle of feature negotiation, for sure.
> > > > > It is passthrough device, hence hypervisor layer do not get to se=
e sub-
> > state.
> > > > >
> > > > > Not sure why you comment, why it cannot be migrated easily.
> > > > > The device context already covers this sub-state.
> > > >
> > > > 1) driver writes driver_features
> > > > 2) driver sets FEAUTRES_OK
> > > >
> > > > 3) device receive driver_features
> > > > 4) device validating driver_features
> > > > 5) device clears FEATURES_OK
> > > >
> > > > 6) driver read stats and realize FEATURES_OK is being cleared
> > > >
> > > > Is it valid to be frozen of the above?
> > > No. device mode is frozen when hypervisor is sure that no more access=
 by the
> > guest will be done.
> >
> > How, you don't trap so 1) and 2) are posted, how can hypervisor know if=
 there's
> > inflight transactions to any registers?
> >
> Because hypervisor has stopped the vcpus which are issuing them.

MMIO are posted. vCPU is stopped but the transactions are inflight.
How could the hypervisor/device know if there's any inflight PCIE
transactions here? So I can imagine what happens in fact is the TLP
for freezing is ordered with the TLP for posted MMIO. This is probably
guaranteed for typical PCIE setup but how about the relaxed ordering?

>
> > > What can happen between #2 and #3, is device mode may change to stop.
> >
> > Why can't be freezed in this case? It's really hard to deduce why it ca=
n't just
> > from your above descriptions.
> >
> On the source hypervisor, the mode changes are active->stop->freeze.
> Hence when freeze is done, the hypervisor knows that all inflight has bee=
n stopped by now.

Ok, but how about freezing between 3) and 4). If we allow it, do we
need to migrate to this state? If yes, how can it work with your
device context? If not, shouldn't we document this?

>
> > Even if it had, is it even possible to list all the places where freezi=
ng is
> > prohibited? We don't want to end up with a spec that is hard to impleme=
nt or
> > leave the vendor to figure out those tricky parts.
> >
> The general idea is not prohibiting the freeze/stop mode.
> If the device needs more time, let device take time to do it.

Ok, it means:

1) there're conditions from stop to freeze, then what are they?
2) how much time at most? E.g FLR takes at most 100ms.
3) If it needs more time, can this time satisfy the downtime requirement?

>
>
> > > And in stop mode, device context would capture #5 or #4, depending wh=
ere is
> > device at that point.
> > >
> > > > >
> > > > > > And what's more, the above state machine seems to be virtio
> > > > > > specific, but you don't explain the interaction with the device
> > > > > > status state
> > > > machine.
> > > > > First, above is not a state machine.
> > > >
> > > > So how do readers know if a state can go to another state and when?
> > > >
> > > Not sure what you mean by reader. Can you please explain.
> >
> > The people who read virtio spec.
> >
> So question is "how reader knows if a state can go to another state and w=
hen"?
> It is described and listed in the table, when a mode can change.

It's not only "if" but also "when". Your table partially answers the
"if '' but not "when". I think you should know now the state
transition is conditional. So let's try our best to ease the life of
the vendor.

>
> > > > So only the driver notification is allowed by not config write?
> > > > What's the consideration for allowing driver notification?
> > > >
> > > Because for most practical purposes, peer device wants to queue blk, =
net
> > other requests and not do device configuration.
> >
> > You forbid the device to process the queue but only allow the notificat=
ion. How
> > can the device queue those requests? The device can just do the availab=
le
> > buffer check after resume, then it's all fine.
> >
> Device can always decide to not queue the request and do the available bu=
ffer check later.
> The peer device may read also from MMIO space.
>
> So the intermediate step covers this aspect where device_type specific pl=
umbing is not done.
> Its generic. A device may choose to omit such doorbells as well as long a=
s it knows it can resume.

I'm not sure I will get here, but the device doesn't need to be kicked
after resume. That's what I want to say.

>
> > >
> > > Do you know any device configuration space which is RW?
> > > For net and blk I recall it as RO?
> >
> > For example, WCE. What's more important, the spec allows config space t=
o be
> > RW, so even if there's no examples before, it doesn't mean we won't hav=
e a RW
> > in the future.
> >
> Ok.
>
> > >
> > > > Let me ask differently, similar to FLR, what happens if the driver
> > > > wants a virtio reset but the hypervisor wants to stop or freeze?
> > > >
> > > The device would respond to stop/freeze request when it has internall=
y
> > started the reset, as device is the single synchronization point which =
knows how
> > to handle both in parallel.
> >
> > Let's define the synchronization point first. And it demonstrates at le=
ast devices
> > need to synchronize between the free/stop and virtio device status mach=
ine
> > which is not as easy as what is done in this patch.
> >
> Synchronization point =3D device.

This is obvious as we can't rule stuff outside virtio, and we are
talking about devices not drivers here. But the spec needs sufficient
guidance/normative for the vendor to implement. It's more than just
saying "device is synchronization point".

>
> > >
> > > > > We would enrich the device context for this, but no need to
> > > > > connects the
> > > > admin mode controlled by the owner device with operational state
> > > > (device_status) owned by the member device.
> > > > >
> > > > > > > + it ignores any device configuration space writes,
> > > > > >
> > > > > > How about read and the device configuration changes?
> > > > > >
> > > > > As listed, device do not have any changes.
> > > > > So device configuration change cannot occur.
> > > >
> > > > It's not necessarily caused by config write, it could be things lik=
e
> > > > link status or geometry changes that are initiated from the device.
> > > >
> > > I understand it. Link status was one example, you listed other exampl=
es too.
> > > The point is, when in freeze mode, the member device is frozen, hence=
,
> > device won't initiate those changes.
> > >
> > > > >
> > > > > The device requirements cover this content more explicitly:
> > > > >
> > > > > For the SR-IOV group type, regardless of the member device mode,
> > > > > all the PCI transport level registers MUST be always accessible
> > > > > and the member device MUST function the same way for all the PCI
> > > > > transport level
> > > > registers regardless of the member device mode.
> > > > >
> > > > > > > + the device do not have any changes in the device context.
> > > > > > > + The member device is not accessed in the system through the
> > > > > > > + virtio
> > > > interface.
> > > > > > > + \\
> > > > > >
> > > > > > But accessible via PCI interface?
> > > > > >
> > > > > Yes, as usual.
> > > > >
> > > > > > For example, what happens if we want to freeze during FLR? Does
> > > > > > the hypervisor need to wait for the FLR to be completed?
> > > > > >
> > > > > Hypervisor do not need wait for the FLR to be completed.
> > > >
> > > > So does FLR change device context?
> > > Yes.
> >
> > So this implies the freeze needs to wait for FLR otherwise device conte=
xt may
> > change.
> >
> Device context can change anytime and reflect what is latest.
> I will update the patches to reflect that device is the single synchroniz=
ation point serving flr, mode changes.
>
> > >
> > > >
> > > > >
> > > > > > > +\hline
> > > > > > > +\hline
> > > > > > > +0x03-0xFF   & -    & reserved for future use \\
> > > > > > > +\hline
> > > > > > > +\end{tabularx}
> > > > > > > +
> > > > > > > +When the owner driver wants to stop the operation of the
> > > > > > > +device, the owner driver sets the device mode to
> > > > > > > +\field{Stop}. Once the device is in the \field{Stop} mode,
> > > > > > > +the device does not initiate any notifications or does not
> > > > > > > +access any driver memory. Since the member driver may be
> > > > > > > +still active which may send further driver notifications to =
the device,
> > the device context may be updated.
> > > > > > > +When the member driver has stopped accessing the device, the
> > > > > > > +owner driver sets the device to \field{Freeze} mode
> > > > > > > +indicating to the device that no more driver access occurs.
> > > > > > > +In the \field{Freeze} mode, no more changes occur in the dev=
ice
> > context.
> > > > > > > +At this point, the device ensures that
> > > > > > there will not be any update to the device context.
> > > > > >
> > > > > > What is missed here are:
> > > > > >
> > > > > > 1) it is a virtio specific states or not
> > > > > It is not.
> > > > >
> > > > > > 2) if it is a virtio specific state, if or how to synchronize
> > > > > > with transport specific interfaces and why
> > > > > > 3) can active go directly to freeze and why
> > > > > >
> > > > > Yes. don=E2=80=99t see a reason to not allow it.
> > > > > Active to freeze mode can change is useful on the destination
> > > > > side, where
> > > > destination hypervisor knows for sure that there is no other entity
> > > > accessing the device.
> > > > > And it needs to setup the device context, it received from the so=
urce side.
> > > > > So setting freeze mode can be done directly.
> > > > >
> > > > > > > +
> > > > > > > +The member device has a device context which the owner drive=
r
> > > > > > > +can either read or write. The member device context consist
> > > > > > > +of any device specific data which is needed by the device to
> > > > > > > +resume its operation when the device mode
> > > > > >
> > > > > > This is too vague. There're states that are not suitable for
> > > > > > cmd/queue for
> > > > sure.
> > > > > > I'd split it into
> > > > > >
> > > > > > 1) common states: virtqueue, dirty pages
> > > > > > 2) device specific states: defined be each device
> > > > > >
> > > > > This is theory of operation section. So it capturing such details=
.
> > > > > Actual device context definition is outside of theory, and precis=
e
> > > > > states of
> > > > virtqueue, device specific, etc are in it.
> > > >
> > > > See my comment above regarding to the device context.
> > > >
> > > I replied above, device context link is added in the patch-3 in the t=
heory of
> > operation.
> > > So reader gets the complete view.
> > >
> > > > >
> > > > > > > +is changed from \field{Stop} to \field{Active} or from
> > > > > > > +\field{Freeze} to \field{Active}.
> > > > > > > +
> > > > > > > +Once the device context is read, it is cleared from the devi=
ce.
> > > > > >
> > > > > > This is horrible, it means we can't easily
> > > > > >
> > > > > > 1) re-try the migration
> > > > > > 2) recover from migration failure
> > > > > >
> > > > > Can you please explain the flow?
> > > >
> > > > When migration fails, management can choose to resume the device(VM=
)
> > > > on the source.
> > > >
> > > ok. This should be possible as the management which has the device
> > > context, it can restore it on the source and move the device mode to =
active.
> > >
> > > > If the state were cleared, it means there's not simple way to resum=
e
> > > > the device but restoring the whole context.
> > > >
> > > Yes, as you say, by restoring the whole context will suffice this cor=
ner/rare
> > case scenario.
> > >
> > > > What's the consideration for such clearing?
> > > >
> > > There are two considerations.
> > > 1.  If one does not clear, till how long should it be kept on the dev=
ice?
> >
> > Until virtio reset, this is how virtio works now. I've pointed out that=
 it may cause
> > extra troubles when trying to resume, but you don't tell me what's wron=
g to
> > keep that?
> >
> If kept, hypervisor may not be able to decide when to change the mode fro=
m active->stop.

Why? It is simply done when mgmt requires a migration?

What's more important, PCI allows multiple common_cfgs. So the
hypervisor can choose to reserve one common_cfg for live migration. In
this case we don't have to read to clear semantics.

Or, are you saying the value read from common_cfg is not device
context? Isn't this conflict with your vague definition of device
context?

> We can opt for a mode where full device context is read in each mode with=
out clearing it.
> But than it can be very specific to a version of qemu, which we are avoid=
ing it here.
>
> > > 2. device context returns incremental value from the previous read. S=
o, it
> > needs to clear it.
> >
> > I don't understand here. This is not the case for most of the devices.
> >
> Not sure which devices you mean here with "most of the devices".
> Device context functions like a write record pages (aka dirty pages).

It's definitely different. We want to migrate dirty pages lively which
can consume a lot of bandwidth. So reporting delta makes a lot of
sense here since it would have a lot of rounds of syncing and it
doesn't result in blockers resuming.

For device context, how many rounds of syncing did you expect, and if
we have N rounds, we need to restore N rounds in order to resume? Do
you want to live migrating device states? If it's only 1 or 2 rounds,
why bother?

And for the delta, how do you know you can easily define deltas for
every type of device, especially the ones with complicated internal
states? Defining states has already been demonstrated as a complicated
task for some devices like virtio-FS and you want to complicate it
furtherly?

What is proposed in this series is an ad-hoc optimization for a
specific deivce type within a specific subsystem (e.g VFIO) in a
specific operating system which is not the general.

As demsonsted many times, starting from something simple and stupid is
the most easy way.

> Whatever is already returned is/should not be repeated in subsequent read=
s, though device can choose to do so.
>
> > >
> > > > > And which software stack may find this useful?
> > > > > Is there any existing software that can utilize it?
> > > >
> > > > Libvirt.
> > > >
> > > Does libvirt restore on migration failure?
> >
> > Yes.
> >
> Ok. the device will be able to resume when it is marked active.
> The device context returned  is the incremental delta as explained above.

I disagree, see my above reply.

>
> > >
> > > > > Why that device context present with the software vanished, in
> > > > > your
> > > > assumption, if it is?
> > > > >
> > > > > > > Typically, on
> > > > > > > +the source hypervisor, the owner driver reads the device
> > > > > > > +context once when the device is in \field{Active} or
> > > > > > > +\field{Stop} mode and later once the member device is in
> > \field{Freeze} mode.
> > > > > >
> > > > > > Why need the read while device context could be changed? Or is
> > > > > > the dirty page part of the device context?
> > > > > >
> > > > > It is not part of the dirty page.
> > > > > It needs to read in the active/stop mode, so that it can be share=
d
> > > > > with
> > > > destination hypervisor, which will pre-setup the complex context of
> > > > the device, while it is still running on the source side.
> > > >
> > > > Is such a method used by any hypervisor?
> > > Yes. qemu which uses vfio interface uses it.
> >
> > Ok, such software technology could be used for all types of devices, I =
don't see
> > any advantages to mention it here unless it's unique to virtio.
> >
> It is theory of operation that brings the clarity and rationale.

I think it's not. Since it's not something that is unique to virtio.

> So I will keep it.
>
> > >
> > > >
> > > > >
> > > > > > > +
> > > > > > > +Typically, the device context is read and written one time o=
n
> > > > > > > +the source and the destination hypervisor respectively once
> > > > > > > +the device is in \field{Freeze} mode. On the destination
> > > > > > > +hypervisor, after writing the device context, when the devic=
e
> > > > > > > +mode set to \field{Active}, the device uses the most recentl=
y
> > > > > > > +set device context and resumes the device
> > > > > > operation.
> > > > > >
> > > > > > There's no context sequence, so this is obvious. It's the
> > > > > > semantic of all other existing interfaces.
> > > > > >
> > > > > Can you please what which existing interfaces do you mean here?
> > > >
> > > > For any common cfg member. E.g queue_addr.
> > > >
> > > > The driver wrote 100 different values to queue_addr and the device
> > > > used the value written last time.
> > > >
> > > o.k. I don=E2=80=99t see any problem in stating what is done, which i=
s less
> > > vague. =F0=9F=98=8A
> > >
> > > > >
> > > > > > > +
> > > > > > > +In an alternative flow, on the source hypervisor the owner
> > > > > > > +driver may choose to read the device context first time whil=
e
> > > > > > > +the device is in \field{Active} mode and second time once th=
e
> > > > > > > +device is in \field{Freeze}
> > > > > > mode.
> > > > > >
> > > > > > Who is going to synchronize the device context with possible
> > > > > > configuration from the driver?
> > > > > >
> > > > > Not sure I understand the question.
> > > > > If I understand you right, do you mean that, When configuration
> > > > > change is done by the guest driver, how does device context chang=
e?
> > > > >
> > > >
> > > > Yes.
> > > >
> > > > > If so, device context reading will reflect the new configuration.
> > > >
> > > > How do you do that? For example:
> > > >
> > > > static inline void vp_iowrite64_twopart(u64 val,
> > > >                                         __le32 __iomem *lo,
> > > >                                         __le32 __iomem *hi) {
> > > >         vp_iowrite32((u32)val, lo);
> > > >         vp_iowrite32(val >> 32, hi); }
> > > >
> > > > Is it ok to be freezed in the middle of two vp_iowrite()?
> > > >
> > > Yes. the device context VIRTIO_DEV_CTX_PCI_COMMON_RUNTIME_CFG
> > section captures the partial value.
> >
> > There's no way for the device to know whether or not it's a partial val=
ue or not.
> > No?
> >
> Device does not need to know, because when the guest vm and the device is=
 resumed on the destination, it the guest vm will continue with writing the=
 2nd part.
>
> > >
> > > > >
> > > > > > > Similarly, on the
> > > > > > > +destination hypervisor writes the device context first time
> > > > > > > +while the device is still running in \field{Active} mode on
> > > > > > > +the source hypervisor and writes the device context second
> > > > > > > +time while the device is in
> > > > > > \field{Freeze} mode.
> > > > > > > +This flow may result in very short setup time as the device
> > > > > > > +context likely have minimal changes from the previously
> > > > > > > +written device
> > > > context.
> > > > > >
> > > > > > Is the hypervisor who is in charge of doing the comparison and
> > > > > > writing only the delta?
> > > > > >
> > > > > The spec commands allow to do so. So possibility exists from spec=
 wise.
> > > >
> > > > There are various optimizations for migration for sure, I don't
> > > > think mentioning any specific one is good.
> > > >
> > > The text is informative text similar to,
> > >
> > > " However, some devices benefit from the ability to find out the
> > > amount of available data in the queue without accessing the virtqueue=
 in
> > memory"
> > >
> > > " To help with these optimizations, when VIRTIO_F_NOTIFICATION_DATA h=
as
> > been negotiated".
> > >
> > > Is this the only optimization in virtio? No, but we still mention the=
 rationale of
> > why it exists.
> >
> > The above is a good example as it explain VIRTIO_F_NOTIFICATION_DATA is=
 the
> > only way without accessing the virtqueue. But this is not the case of m=
igration.
> > You said it's just a possibility but not a must which is not the case f=
or
> > VIRTIO_F_NOTIFICATION_DATA.
> >
> It is one of the optimization apart. The comparison is of one_of_example =
or not.

I don't get this.

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

