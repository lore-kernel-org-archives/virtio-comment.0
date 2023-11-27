Return-Path: <virtio-comment-return-8625-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D8FC4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 06:38:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AE0BE2A8F1
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 06:38:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 814CB9863A5
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 06:38:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 620B89859DF; Mon, 27 Nov 2023 06:38:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4EBE998637B
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 06:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: LCgTV2HrMLeq8ZaKrZL5Ng-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701067115; x=1701671915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMU19GUTbdDyHWw38CbwH/4ypyIcfpv7IVY7oSMsXjk=;
        b=cNdRJTC73+YKfl17WN7qoJAuwNvwfqIofmKb8DH8lXT/el0YLIGG3Wkiu0dxTDKcEY
         QHH4+acz1qIwhVfcr6cwGUqz9nVWMLt+1doVNfD1uHNO2nPYokF9E5JeMOXidUeQx5Ma
         Eh5YaxfVTkIXMifc0AVq38ChTZpsgJEoTaoJf31hPsIn8Mz07WrDPovrMU23juGI8Wb5
         Lr/mWUJYLzeHldsrEj3i0la2l4NJJ6/HfXcr3eKec6vhi4vg8tFCz2Tb7J5sT1g6JYFr
         hxXp9GdeZJyuZBhGdiHgESwkm3lUPjESxq1oW+bHuMhkQsIWcN8LB3Xrm2PF38ytaxg6
         UHWQ==
X-Gm-Message-State: AOJu0YwCwPc/xt76Xs3EgjoGM4Wsqa/5EkNtDSk9fp+lzwceyK1YOt7T
	H1H8hW5WSC2BgHuv/uFKkUBO1/Yo4+4O2WAAOzoKAn8AH1unoXRfoHG6in8aX5ks3yEF3RvxV42
	hwJ1swe6mashbxWt/dabICSBKmDIExuSRUU0WwcsgLizS40C3mg==
X-Received: by 2002:a19:7b0c:0:b0:509:8a5e:654d with SMTP id w12-20020a197b0c000000b005098a5e654dmr6060399lfc.21.1701067114778;
        Sun, 26 Nov 2023 22:38:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVPRW2lp2X9nMIks/n2RXQVbrOSo1U4hbQ0uTFJ+9MxNaIOiFCnT0Gu6uQb2NqYvtCGieOEeftzJCE2Xs/ZII=
X-Received: by 2002:a19:7b0c:0:b0:509:8a5e:654d with SMTP id
 w12-20020a197b0c000000b005098a5e654dmr6060383lfc.21.1701067114287; Sun, 26
 Nov 2023 22:38:34 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <PH0PR12MB54816D26CE3B22CA84CAAE2ADCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvqB0Q3N6UBuVXad7GLGRWB_YS1rbdNZy8h85jkXGePtg@mail.gmail.com>
 <PH0PR12MB5481EEAEDFECA480BB3D69DCDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3vSyVo6O4TvahiQYqZymnK7m+SWY9nzaQHFBEAbUpMA@mail.gmail.com>
 <20231124035211-mutt-send-email-mst@kernel.org> <CACGkMEtHhf2KTHeYcfRndh7GMu22R_Q4ABNb__zv_cn0na2N6Q@mail.gmail.com>
 <20231124071048-mutt-send-email-mst@kernel.org> <CACGkMEuLCHccVTWxT=DWDJRK3XGC_8wQW6AvuZ2kpTa8C-WeQQ@mail.gmail.com>
 <20231124092334-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124092334-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 27 Nov 2023 14:38:23 +0800
Message-ID: <CACGkMEv5Y=hUyeuFw_2gybDG15Rn6+zd=z-eEtxVoL9bKqEiRA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when SUSPEND

On Fri, Nov 24, 2023 at 10:45=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Fri, Nov 24, 2023 at 09:01:53PM +0800, Jason Wang wrote:
> > On Fri, Nov 24, 2023 at 8:17=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Fri, Nov 24, 2023 at 07:50:42PM +0800, Jason Wang wrote:
> > > > > I frankly don't see how a bit which is completely non-orthogonal =
with
> > > > > device and driver state can be useful for debug.
> > > >
> > > > The bit is to make sure the state of a device doesn't change. It ma=
y
> > > > help or not just like if you want to pause a cpu/process during the
> > > > debug.
> > >
> > > Heh. But it would be much better to have an orthogonal state
> > > that driver can just set without worrying much about
> > > device being broken somehow.
> >
> > In that case we still need a preise definition of the state. So I
> > don't see the difference here.
>
> You don't?

I meant I don't see the difference if

1) it is defined in a new bit in current status
2) or it's an orthogonal state

> If you can inspect state without perturbing it, that is
> better for debugging than an intrusive interface that perturbs state.

I've stated that it is just like you can choose to use GDB or not. If
you don't like GDB, that's fine.

We propose it in the basic facility, you are asking why, we explain it
might be used for debugging or others, then you said you don't want it
for debugging. It's fine but what's the standard here? For example,
even if it can only be used for migration, what's the issue here?
FEAUTRE_OK can only be used during driver probes but it is still
defined in the status part, and there's nobody asking for other use
cases.

>
>
> > Anyhow, we can leave debugging aside.
> >
> > >
> > >
> > > > > For debug you want something that just always works.
> > > > > Not an interface that has so many requirements it will break if
> > > > > you look at it sidewise.
> > > > >
> > > > >
> > > > > > > >
> > > > > > > I don=E2=80=99t see wasting time here.
> > > > > > > If its debug, its debug.
> > > > > > > If its migration, it is migration.
> > > > > > > If its pm, its pm.
> > > > > >
> > > > > > Obviously not. Migration should leverage existing facilities as=
 much
> > > > > > as possible instead of duplicating them.
> > > > >
> > > > > I don't think there's anything obvious here.  A lot of device sta=
te
> > > > > can't be easily accessed with existing facilities.
> > > >
> > > > Then we can invent new things.
> > >
> > > So the approach this patchset takes is a single interface for
> > > all state introspection. Some duplication of functionality
> > > for the sake of consistency.
> > > You don't like it fine but
> >
> > The (partial) duplication should be fine as long as it doesn't have
> > any issue, but I do see a lot of issues. So I can't say I like it.
>
> Let's focus on issue really instead of endless high level
> architecture discussions.

I don't understand here. I've pointed out sufficient issues in detail
in individual patches. At least a small fraction of issues have been
acked by Parav. If you think it's not a real issue, please explain in
the individual thread.

>
> > > there is nothing obvious that it's a bad thing. It's a tradeoff.
> > >
> > > > > The logical
> > > > > continuation of your reasoning would be to add state introspectio=
n
> > > > > commands e.g. to cvq in virtio net and then use tricks like shado=
w vq to
> > > > > issue these.
> > > >
> > > > For the device state, yes. Because it is device logic and it is not
> > > > what platform or transport can know.
> > >
> > > Exactly as I thought. Don't think shadow VQ is something we
> > > can reasonably make a single migration mechanism though.
> >
> > That's my understanding as well. It's up to the hypervisor, spec needs
> > to focus on the mechanism but not policy.
> >
> > > It feels fragile and heavyweight. It's more of a work
> > > around hardware limitations.
> > >
> > >
> > > > > Yea, possible, but can we not go there please?  Nothing is
> > > > > wrong with just building commands that do exactly what we want th=
em to
> > > > > do instead of trying to build a ship in a bottle.
> > > >
> > > > But it's not the case for others.
> > > >
> > > > E.g in Parav's proposal, it tries to rule P2P behaviour via virtio
> > > > admin commands when there is a duplication
> > >
> > > Yes there's some duplication. Advantage is consistency.
> >
> > Just to clarify, we do need things like suspend but I don't see
> > dealing with PCI P2P in virtio as consistent (e.g we don't imply any
> > PCI stuff in virtio reset).
>
> I think I can clarify.  The consistency is that there's a single chapter
> that deals with migration, also hypervisors will all do exactly the same
> instead of each hypervisor guessing how to do migration and going its
> own way.

Hypervisors have already done migration in different ways. Virtio
should not be involved in the endless debating on which one is better,
I think we have agreed on this, otherwise we spent months circling
back.

>
>
>
>
> > >  I actually
> > > suggested ways to reduce duplication, by using transport offsets as
> > > tags.
> >
> > I don't see a connection with P2P here. Or I may miss something.
>
> I don't even know what P2P is in this context. Or why we are
> discussing it.

The context is the suspend function. Parav tries to rule P2P in
freeze/stop, and it looks to me it has been covered by PCI PM.

> Is this going to be another distraction that
> no one knows how it will work, just like mentioning TD randomly?
>
> > > Finding a right balance means we all need to stop going to
> > > extremes, I wish you and lingshan would stop trying to force everyone
> > > to use registers and parav would stop trying to force dma.
> >
> > There is a misunderstanding. Actually. I don't want to force
> > registers.
>
> You keep insisting on overlaying suspend functionality
> over the existing transport.

It makes sure it could be reused for transport other than PCI. And it
doesn't prevent the coexistence of a side channel.

> For pci that is going to be
> in a register.

I don't understand. The register is already there. If you disagree,
please explain, especially why reset at virtio in status can work but
not suspend.

>
> > Which kind of interface is the best way to go is really
> > implementation specific. In some implementations, registers are cheap
> > but not virtqueue, in others, virtqueue is cheap but not register.
> > They are all fine. But we can't not claim one proposal that is
> > optimized for a specific implementation to be the best way. What I
> > want to do is not limit the facilities that are used for live
> > migration to any specific transport. I think Ling Shan agreed with me
> > in this part. It needs to work on all interfaces regardless of
> > registers, DMA, CMA or others. That's why I suggest we focus on what
> > needs to be migrated first. That is define the following things
> >
> > 1) way to suspend/resume a device
> > 2) virtqueue states, indices or inflight ones
> > 3) device states
> >
> > It is just like how we define virtqueues/features/status and other
> > basic facilities where we do not tie it to any specific interfaces
> > like DMA, CMA, registers or admin commands. Virtio benefited from the
> > flexibility like this in the past so why not stick to that?
>
> Because migration is a complex enough topic that we simply know
> from experience that
> - things like error handling are needed

Where is it in the Parav series?

> - passing big arrays around is needed

Not necessarily for

1) simple devices
2) devices that are using states in the memory
3) even between device and driver, there are vendors that offload the
migration to DPU

But again, I'm not saying passing big arrays doesn't make sense,
please do not misunderstand my point here.

> these just do not work reasonably well over registers and
> this is why admin commands were invented.

I'm lost here. The reason why we stick admin commands is to make sure
it can be used for register and I wouldn't argue this furtherly. I
don't say admin commands don't make sense. I just say it should not be
limited to that. We can't say admin commands can work in any case or
transport.

>
>
>
> > After this, each transport can choose to implement it in their own
> > way. For example, if there's a proposal to use those via admin
> > virtqueue that's fine.
> > And registers also fine and other transports.
> > That's why only the last patch of this series is dealing with the PCI
> > specific part.
>
> Maybe they are fine in theory.

Tehroticall fine can be done by just relocating texts to a better
place. It's almost free. Do you want a draft?

> So far I didn't see anything cohesive
> that is close functionally being even to Parav's proposal of migration
> over admin commands. There's no specific *reason* not to do that,
> practically - I don't see why

I never say we can not do it over admin commands. I say we should not
*only* do it over admin commands.

>
>
> >
> > >
> > > > and a layer violation.
> > >
> > > layers are only good if they make sense.
> >
> > Case by case, for example, PCI PM has defined the state and the
> > interaction with P2P. Reusing that seems much cleaner than inventing a
> > mechanism in the virtio layer. Or if it needs a side channel, it needs
> > to be invented in PCI not virtio.
> >
> > Thanks
>
> There's no *if* in my opinion - migration is way easier for hypervisors
> to implement as a side channel so any device state can be migrated.

The context is to freeze PCI P2P which is a transport specific
mechanism not device states. When there's an existing mechanism, it's
pretty natural to ask why it can't be used or extended.

I must repeat myself again, It's perfectly fine to use the side
channel to save and restore device state but it's not the only way.

> And
> this is uniform across transports.

I don't understand, for example in 1) MMIO 2) PCI without SR-IOV,
where could we put a side channel?

> Is it harder or easier for hardware
> to implement?

Well, easier for one vendor doesn't mean easier for rest vendors.

And how to synchronize between the transport and the side channel is
still unclear to me at least. So far the only thing I get is something
like "it is implementation specific", so I raise the issue like
PM/D3/FLR/FRS during migration etc where I haven't got a good answer
so far. Or if you think spec is ok without answering those questions,
that's fine but please explain why.

> We have a hardware vendor pushing a side channel approach
> so it seems likely they know what is good for hardware?

If the above is a standard like "a hardware vendor pushing an
approach, it seems likely they know what is good for their hardware",
then it should apply to every vendor instead of just a specific one.

So this calls for a generic design. For example I know virtio that has
been implemented in software, DPU or FPGA (for sure there should be
others). I fully understand that a proposal from a specific vendor can
work well for them. But it doesn't mean it works well for others. Do
you agree? AFAIK, some early versions of IFCVF did virtio via FPGA,
and I guess NV did virtio via collaboration with software running on
DPU. Different hardware architecture may end up with different design
considerations. And there's nothing wrong with them. But what works
better for FPGA doesn't mean it works better in DPU. One key for the
future success of virtio is to not be designed just for a specific
type of hardware or vendor. That's why I disagree with your statement
like "who bothers first who wins".

> If it is somehow
> nvidia specific - can we please have other vendors with actual
> plans implementing this hardware
> (and note this has nothing to do with
> VDPA - all this SUSPEND bit work is only useful for full offload) come
> forward and say "we don't support this, we support that"?

On one hand, you said "the first will win", then Ling Shan told you
IFCVF has been used in production for years.
On the other hand, you want to have a 3rd vendor to comment, so the
standard seems to shift to "the majority will win" and you don't even
ask for a prototype there?

There's no description on what kind of prototyping is done in the
Parav series, for example, what kind of implementation for the
prototype (FPGA, ASIC, DPU, emulation or simulation). Reviewers can do
nothing but guess. You seem to think it's ok. Fine. But Ling Shan has
told us IFCVF has been used in production for years. Sticking to the
flexibility that virito spec already had is much better than waiting
for a vendor to come to say "spec doesn't fit for us, we wouldn't go
for virtio". Again, such decoupling is not guaranteed to succeed but
it's better than coupling.

What's more, I don't see why you think the proposals must be mutually
exclusive. I think both LingShan and Parav are ok for seeking ways for
unficiation or then a way for co-existence.

>  Or is this
> for some unnamed vendors not on the TC?

I don't get the point of the question.

TC is good but there are just too many reasons that they don't want to
join TC. And even if they do, there are just too many reasons that
vendors decide to be silent or not. But I don't think silence means
acquiescence.

> Maybe they should join the TC to
> influence the direction then.

Chicken-egg problem. Vendors may want evaluate both the architecture
and the community before they can invest in virtio.

>  Because right now it looks like software
> guys telling hardware guys what is good for hardware
> and I don't see how
> this makes any sense.

Can you explain why you think my comment doesn't make any sense and
what's the reason for such classification? Most of my comments were
given from the view of a hypervisor developer. It's definitely not
telling what is good for hardware, it's for what is good for software.
Virtio neither works at the level of circuit nor defines any
implementation, so it needs to hear from both software and hardware
engineers.

Thanks

>
>
>
> > >
> > > > Thanks
> > > >
> > > >
> > > > >
> > > > > --
> > > > > MST
> > > > >
> > >
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

