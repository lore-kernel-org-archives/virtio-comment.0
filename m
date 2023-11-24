Return-Path: <virtio-comment-return-8615-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C50C61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:50:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CF0693357E
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:50:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A3C619868B1
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:50:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8B87F9862D9; Fri, 24 Nov 2023 11:50:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7C3E99868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 11:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: qDwVc_7JOZ2qX78gnHauPw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700826654; x=1701431454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62YB7FsJjQUL4o7KFUAunU9lDFJZ9SlurTB5xs/MGgU=;
        b=OeTVSFE2mCJcHiLwvYzDAsjzWyVOCKU9fJo+0ix7CmX5mojQvXyXGdVcCLEGkLPqDf
         FzX7uTcVgFPhK+A1Vn9eJu8cU2PM7KQc6Jmyu0uFBLDG+FyGo1nU6zQ2OjJAqGiPAKKC
         rDLkjMPM9cmBK5mmZl0ppWDt9T3lle3AMDHANdsItE4kYiaVupggXipQtiANxID6gmEQ
         XzEl2JL8K1vx939MjNNTlkYm8AkD0/P0RrYa+p72gD+cYAq2UB1Evh8gQiNW/1zcQKuQ
         uJ3N55YhY+zLrXWcXatxm1iBss85qgVVbAujG2U4fGWofKGSMp9yyA+s9e1XUW1dOwQX
         FUyQ==
X-Gm-Message-State: AOJu0Yxa1ghvN0AnnrMcbbPDLpe0b6x9StDUhOcfmMnGQprXlSyjktC5
	N4nphQIiG1NtnxuIB2MEAIXOIC8xWT8Dhh84ao1zZhWijKsxu5aBLnYkWNMlOXQhTa0aMxRTxks
	6avtPeDkjQPy+mI8yB/9oF5aUKGWgQbVbyc0Cnk6O3f/ZCKq4iA==
X-Received: by 2002:a19:4355:0:b0:507:9996:f62b with SMTP id m21-20020a194355000000b005079996f62bmr1335312lfj.56.1700826653659;
        Fri, 24 Nov 2023 03:50:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFd7oq3Zfz0vBzZ8GIx0bQj8yfgfvk0Fljht06H0LWRu13WYazZc+/O/Rutw6xT40seqX+Ggd3Q65SjaO9XD18=
X-Received: by 2002:a19:4355:0:b0:507:9996:f62b with SMTP id
 m21-20020a194355000000b005079996f62bmr1335296lfj.56.1700826653156; Fri, 24
 Nov 2023 03:50:53 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <PH0PR12MB54816D26CE3B22CA84CAAE2ADCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvqB0Q3N6UBuVXad7GLGRWB_YS1rbdNZy8h85jkXGePtg@mail.gmail.com>
 <PH0PR12MB5481EEAEDFECA480BB3D69DCDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3vSyVo6O4TvahiQYqZymnK7m+SWY9nzaQHFBEAbUpMA@mail.gmail.com> <20231124035211-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124035211-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 19:50:42 +0800
Message-ID: <CACGkMEtHhf2KTHeYcfRndh7GMu22R_Q4ABNb__zv_cn0na2N6Q@mail.gmail.com>
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

On Fri, Nov 24, 2023 at 5:05=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Fri, Nov 24, 2023 at 11:35:59AM +0800, Jason Wang wrote:
> > > > > > > I don=E2=80=99t see a need for hypervisor to reset the device=
 in passthrough
> > > > mode.
> > > > > > Can you explain why is it needed?
> > > > > >
> > > > > > Qemu has a command "system_reset".
> > > > > >
> > > > > I mean, what does this translate to reset the device in passthrou=
gh mode?
> > > >
> > > > It needs to reset the virtio device.
> > > >
> > > > > If this is FLR, it is there.
> > > >
> > > > Please explain how it works. (It's not only a FLR, it also need vir=
tio level reset)
> > > >
> > > FLR obviously covers the virtio level reset as FLR covers the PCI + v=
irtio reset.
> >
> > Which part of the spec says this? And at least Qemu is not implemented
> > in this way.
>
> PCI spec says this.
> And yes I believe qemu will fully reset the function
> on FLR.

Ok, I have another glance at the spec and code. It works like this.

>
>
> > And there's another conflict, you said FLR is under the control of gues=
ts ...
> >
> > >
> > > > >
> > > > > > > Do you mean, it is needed in vdpa mode? If yes, the registers=
 are
> > > > > > > emulated
> > > > > > anyway, so why the member device's native channel cannot be use=
d in
> > > > > > vdpa mode?
> > > > > > >
> > > > > > > > >
> > > > > > > > > > > For large device I could imagine it could be short.
> > > > > > > > > > >
> > > > > > > > > > > In that case if there is suspend the device available=
, it
> > > > > > > > > > > will be used by the guest
> > > > > > > > > > driver itself, hypervisor wouldn=E2=80=99t know about i=
t when those
> > > > > > > > > > registers are not trapped.
> > > > > > > > > > > So we need two ways to suspend.
> > > > > > > > > > > One is guest visible, and guest controlled.
> > > > > > > > > > > Second is hypervisor control to fulfill the device mi=
gration needs.
> > > > > > > > > >
> > > > > > > > > > Can you explain why suspend is special but not reset or=
 why
> > > > > > > > > > reset can work but not suspend? If reset can work, so d=
oes
> > > > > > > > > > suspend. If reset can't, neither does suspend.
> > > > > > > > > >
> > > > > > > > > As long as reset and suspend both are under guest control=
, I am fine.
> > > > > > > >
> > > > > > > > Well, you seem to ignore my question below. Hypervisor need=
s to
> > > > > > > > reset the device as well.
> > > > > > > >
> > > > > > > Why is it needed in passthrough mode?
> > > > > > >
> > > > > > > > >
> > > > > > > > > > For example, can you explain how a system_reset in Qemu=
 can
> > > > > > > > > > work with your proposal?
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > So if you can please take a look if the proposed admi=
n
> > > > > > > > > > > command to
> > > > > > > > > > freeze/stop mode can be used in the emulated register c=
ase or not.
> > > > > > > > > >
> > > > > > > > > > Again, if you design those for PCI, it's a layer violat=
ion.
> > > > > > > > > > You have answered
> > > > > > > > > They are used by the PCI layer, just like your suspend bi=
t.
> > > > > > > > > Andy other transport can also use it.
> > > > > > > > >
> > > > > > > > > > yourself that PM is the right way to go.
> > > > > > > > > >
> > > > > > > > > > > It helps to have the suspend bit in guest control as =
well
> > > > > > > > > > > with/without
> > > > > > > > > > emulation mode.
> > > > > > > > > >
> > > > > > > > > > I won't repeat it again. You will find you need a full
> > > > > > > > > > transport to satisfy all the requirements.
> > > > > > > > > I disagree for full transport.
> > > > > > > >
> > > > > > > > See above and the discussion in another thread.
> > > > > > > >
> > > > > > > > > If you want to get discuss transport for sure it is some =
other
> > > > > > > > > thread and I want to see "driver notifications via such
> > > > > > > > > transport VQ" to fully qualify it
> > > > > > > > as transport, And that would be just sub-optimal for actual=
 working.
> > > > > > > >
> > > > > > > > Sub-optimal since the function is duplicated with a transpo=
rt
> > > > > > > > but it doesn't claim or design as a transport.
> > > > > > > >
> > > > > > > It is not sub-optimal because of duplication. It is because y=
ou
> > > > > > > want to
> > > > > > transport notifications via virtqueue.
> > > > > >
> > > > > > Have you ever read the series of tvq? You won't get this conclu=
sion
> > > > > > if you do that.
> > > > > >
> > > > > I have read those 4 patches and I have seen that transportvq do n=
ot want to
> > > > transport notifications.
> > > > > Hence it does not qualify as transport vq.
> > > >
> > > > It exposes the platform MMIO area for driver notification. This is =
sufficient.
> > > > Any issue you see?
> > > Yes, the issue is, it is not transporting the driver notifications.
> > > Hence, it is not a transport virtqueue.
> >
> > Please read how driver/device notification is done in the spec for
> > existing transports.
>
> Yea Parav I don't really see what you are driving at here.
> But the bigger problem with tvq is that it was supposed to
> add a new group type and be reworked on top of admin command
> infrastructure and it never was.
>
> > >
> > > >
> > > > >
> > > > > Frankly, transport vq seems a way to formalize mediation forever =
in virtio.
> > > >
> > > > Nope, it can be accessed by a guest driver directly.
> > > >
> > > > > It is very weird way to build new SIOV device.
> > > > > For most things it should be the direct channel that virtio has a=
lready from
> > > > driver to the device.
> > > >
> > > > See above. SIOV might require a new transport or not.
> > > >
> > > It depends on the performance tests that Lingshan will show at scale.
> > >
> > > > >
> > > > >
> > > > > > >
> > > > > > > > > And hence, I wouldn=E2=80=99t call it a transport anymore=
.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > This can also be used for debugging I think.
> > > > > > > > > > >
> > > > > > > > > > > As Michael listed, a dedicated debug interface is usu=
ally
> > > > > > > > > > > more useful instead
> > > > > > > > > > of in-band.
> > > > > > > > > >
> > > > > > > > > > Well, I've shown you the in-band facilities like debugg=
ing
> > > > > > > > > > via ethtool and kernel has a lot of other ones. If you =
have
> > > > > > > > > > ever tried to debug in a real production environment, y=
ou
> > > > > > > > > > will find how useful such handy information is where ou=
t-of-
> > > > > > > > > > band facilities are often dangerous
> > > > > > > > and usually prohibited or even unsupported.
> > > > > > > > > Guest driver can always read and write the device status
> > > > > > > > > without adding a
> > > > > > > > suspend bit.
> > > > > > > >
> > > > > > > > I don't get here. Suspend make sure the device state is fro=
zen
> > > > > > > > which helps for debugging for sure.
> > > > > > > You wanted to debug some vq live, you suspend the device, the=
 vq
> > > > > > > state got
> > > > > > changed.
> > > > > > >
> > > > > > > I just don=E2=80=99t see that suspend is a debug tool.
> > > > > >
> > > > > > It's not a tool, it's a function that can be used as a debug to=
ol.
> > > > > >
> > > > > > > Every feature is a debug feature literally.
> > > > > > > Classic heisenbug effect.
> > > > > > >
> > > > > > > Once can change driver notification frequency to see if inter=
rupt
> > > > > > > rate
> > > > > > changed for debugging.
> > > > > > > One can disabled few RQs and see RSS...
> > > > > > > Blk can change blk_size to higher value to perf debug..
> > > > > > > The list continues..
> > > > > >
> > > > > > Let's not shift concepts.
> > > > > >
> > > > > Your comment to attribute device migration as debug feature is ac=
tually
> > > > shifting the concept.
> > > >
> > > > It's not.
> > > >
> > > > Ling Shan put it in the basic facilities as part of device status. =
You wonder why,
> > > > we explained it can be used beyond migration. You asked where, we t=
old you
> > > > for example things like debugging. We never claim it can only be us=
ed in debug.
> > > > Then you shift the concept to say debug could be achieved by a lot =
of other
> > > > facilities. For sure this is correct, but it doesn't have any relat=
ionship with the
> > > > discussion here.
>
> I frankly don't see how a bit which is completely non-orthogonal with
> device and driver state can be useful for debug.

The bit is to make sure the state of a device doesn't change. It may
help or not just like if you want to pause a cpu/process during the
debug.

> For debug you want something that just always works.
> Not an interface that has so many requirements it will break if
> you look at it sidewise.
>
>
> > > >
> > > I don=E2=80=99t see wasting time here.
> > > If its debug, its debug.
> > > If its migration, it is migration.
> > > If its pm, its pm.
> >
> > Obviously not. Migration should leverage existing facilities as much
> > as possible instead of duplicating them.
>
> I don't think there's anything obvious here.  A lot of device state
> can't be easily accessed with existing facilities.

Then we can invent new things.

> The logical
> continuation of your reasoning would be to add state introspection
> commands e.g. to cvq in virtio net and then use tricks like shadow vq to
> issue these.

For the device state, yes. Because it is device logic and it is not
what platform or transport can know.

> Yea, possible, but can we not go there please?  Nothing is
> wrong with just building commands that do exactly what we want them to
> do instead of trying to build a ship in a bottle.

But it's not the case for others.

E.g in Parav's proposal, it tries to rule P2P behaviour via virtio
admin commands when there is a duplication and a layer violation.

Thanks


>
> --
> MST
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

