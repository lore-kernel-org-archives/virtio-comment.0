Return-Path: <virtio-comment-return-8585-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AF1C61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:36:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 476982AEF5
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:36:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0BBA49868B9
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:36:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D0278986890; Fri, 24 Nov 2023 03:36:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BC4239868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 03:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: H7hcpoIGMb2joV3DebNerw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700796971; x=1701401771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDWHO9YnzGokmth5kr/81bUasZyhAlD2D/FK95u/rI0=;
        b=JmvwOsgHYnGNT6bEgj6nD/xAwi6twTSmcT9Rr/S/GyYZSTGdgd8K99xepyT0cQurc9
         98flKAsz2ImTYYlSaBtF9/o8mW7LL3HNzIjkwTGHr00YJUgHAXaEfxChUDeQXOXfnSik
         hs2VImIvwGwYZLzoC1slPqNTonSqNG22huhptc9ZxV+CJi17ad0MMvCkPOmhxY5fkMHw
         ez++o/pK47vI5kY5ErMZ6qF2rHZY9sZ26W4cRlnmyAEksxlGCtYbwqYAvS1F0946SqKV
         rhKa7DKQgS8JKE1mnqZfUUhL8Xia3RRdJZp7CkKPqYUUZASPoVvCrNlVClZpthQWVprO
         JISg==
X-Gm-Message-State: AOJu0YzHpNYP3OKGa7//slUCHLRDqyP7r6LvKnkY+h44PUEqpuUzLhwT
	aKEN1GBQzF/XTUMfGUXbUP//bqxbvS2O0xb8C8jXiHvO5OBGZDAGiqIMRwMz7YiH2Ccow6Zk9bp
	bJ18tn0hprGVjtKw5n+jbTChINYg0i9twpvCS6HbhBXsQAZCD3aQzzvBuykPu
X-Received: by 2002:a05:6512:3f12:b0:4fe:2815:8ba7 with SMTP id y18-20020a0565123f1200b004fe28158ba7mr1463536lfa.25.1700796971044;
        Thu, 23 Nov 2023 19:36:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGAPf2eBJ85qP6j01yeThWNAk72+Mmpk0/xf9il/CA/RsjqWOUOD0R7f0PEVHuogqrAhL5S54WxVeBUtwNH60=
X-Received: by 2002:a05:6512:3f12:b0:4fe:2815:8ba7 with SMTP id
 y18-20020a0565123f1200b004fe28158ba7mr1463530lfa.25.1700796970639; Thu, 23
 Nov 2023 19:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-4-lingshan.zhu@intel.com> <20231106044836-mutt-send-email-mst@kernel.org>
 <c6cb6e6b-fd2b-43ac-9be5-c4a8cda1ac13@intel.com> <20231108124625-mutt-send-email-mst@kernel.org>
 <b125da70-a769-4662-876b-43664e39c976@intel.com> <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <PH0PR12MB54816D26CE3B22CA84CAAE2ADCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvqB0Q3N6UBuVXad7GLGRWB_YS1rbdNZy8h85jkXGePtg@mail.gmail.com> <PH0PR12MB5481EEAEDFECA480BB3D69DCDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481EEAEDFECA480BB3D69DCDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 11:35:59 +0800
Message-ID: <CACGkMEu3vSyVo6O4TvahiQYqZymnK7m+SWY9nzaQHFBEAbUpMA@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when SUSPEND

On Wed, Nov 22, 2023 at 2:11=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, November 22, 2023 10:58 AM
> >
> > On Wed, Nov 22, 2023 at 12:32=E2=80=AFAM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, November 21, 2023 1:03 PM
> > > >
> > > > On Thu, Nov 16, 2023 at 1:27=E2=80=AFPM Parav Pandit <parav@nvidia.=
com>
> > wrote:
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Thursday, November 16, 2023 9:50 AM
> > > > > >
> > > > > > On Thu, Nov 16, 2023 at 1:39=E2=80=AFAM Parav Pandit <parav@nvi=
dia.com>
> > > > wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Monday, November 13, 2023 9:05 AM
> > > > > > > >
> > > > > > > > On Thu, Nov 9, 2023 at 6:16=E2=80=AFPM Parav Pandit
> > > > > > > > <parav@nvidia.com>
> > > > wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > > > > > > > Sent: Thursday, November 9, 2023 3:28 PM
> > > > > > > > > >
> > > > > > > > > > On 11/9/2023 1:46 AM, Michael S. Tsirkin wrote:
> > > > > > > > > > > On Tue, Nov 07, 2023 at 05:27:23PM +0800, Zhu,
> > > > > > > > > > > Lingshan
> > > > wrote:
> > > > > > > > > > >>
> > > > > > > > > > >> On 11/6/2023 5:49 PM, Michael S. Tsirkin wrote:
> > > > > > > > > > >>> On Fri, Nov 03, 2023 at 06:34:34PM +0800, Zhu
> > > > > > > > > > >>> Lingshan
> > > > wrote:
> > > > > > > > > > >>>> When SUSPEND is set, device states and virtqueue
> > > > > > > > > > >>>> states should be stablized, therefore the driver
> > > > > > > > > > >>>> should not reset vqs when SUSPEND is set in device=
 status.
> > > > > > > > > > >>>>
> > > > > > > > > > >>>> Signed-off-by: Zhu Lingshan
> > > > > > > > > > >>>> <lingshan.zhu@intel.com>
> > > > > > > > > > >>>> ---
> > > > > > > > > > >>>>    content.tex | 3 +++
> > > > > > > > > > >>>>    1 file changed, 3 insertions(+)
> > > > > > > > > > >>>>
> > > > > > > > > > >>>> diff --git a/content.tex b/content.tex index
> > > > > > > > > > >>>> bcc9d4b..060b5c2
> > > > > > > > > > >>>> 100644
> > > > > > > > > > >>>> --- a/content.tex
> > > > > > > > > > >>>> +++ b/content.tex
> > > > > > > > > > >>>> @@ -444,6 +444,9 @@ \subsubsection{Virtqueue
> > > > > > > > > > >>>> Reset}\label{sec:Basic
> > > > > > > > > > Facilities of a Virtio Device /
> > > > > > > > > > >>>>    The device MUST reset any state of a virtqueue
> > > > > > > > > > >>>> to the default
> > > > > > state,
> > > > > > > > > > >>>>    including the available state and the used stat=
e.
> > > > > > > > > > >>>> +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is
> > > > > > > > > > >>>> +set in \field{device status}, the driver SHOULD
> > > > > > > > > > >>>> +NOT reset any
> > > > > > virtqueues.
> > > > > > > > > > >>>> +
> > > > > > > > > > >>>>    \drivernormative{\paragraph}{Virtqueue
> > > > > > > > > > >>>> Reset}{Basic Facilities of a
> > > > > > > > > > Virtio Device / Virtqueues / Virtqueue Reset / Virtqueu=
e
> > > > > > > > > > Reset}
> > > > > > > > > > >>>>    After the driver tells the device to reset a
> > > > > > > > > > >>>> queue, the driver MUST verify that
> > > > > > > > > > >>> Seems somewhat arbitrary and breaks the claim that
> > > > > > > > > > >>> the feature is orthogonal and can have uses besides
> > migration.
> > > > > > > > > > >> when suspended, the device is frozen.
> > > > > > > > > > >> The driver is aware of this process and so should no=
t
> > > > > > > > > > >> reset the vqs I
> > > > > > think.
> > > > > > > > > > > Again that is only true because you want to use it fo=
r migration.
> > > > > > > > > > > But then you can't claim it's a generic facility.
> > > > > > > > > > I don't get it. The device status is a basic facility.
> > > > > > > > > >
> > > > > > > > > > We need to SUSPEND the device by setting SUSPEND bit, t=
o
> > > > > > > > > > stabilize the device states for migration.
> > > > > > > > > Is the PCI's PM time not enough to suspend the device?
> > > > > > > >
> > > > > > > > Are you saying we don't need virtio reset assuming we had F=
LR?
> > > > > > > >
> > > > > > > No. often FLR timing is not enough. Hence every PCI level
> > > > > > > device has some
> > > > > > sort of its own reset mechanism.
> > > > > > >
> > > > > > > > Suspending at different layers like rest at different layer=
s.
> > > > > > > >
> > > > > > > > We have both FLR and virtio reset. The Virtio level functio=
n
> > > > > > > > could be reset without FLR. So did suspend.
> > > > > > > >
> > > > > > > > That's it.
> > > > > > > Sure, but wrapping it under some "basic facility" is just doe=
s
> > > > > > > not make
> > > > sense.
> > > > > >
> > > > > > Why, device status (e.g reset) belongs to that part.
> > > > > >
> > > > > Lingshan claimed that suspending device is for live migration in
> > > > > commit log
> > > > and in discussion he portray it as some basic facility unrelated to
> > > > device migration such as debug etc.
> > > > > Instead of claiming it as some non_device_migration facility does
> > > > > not make
> > > > sense.
> > > >
> > > > It is used for migration for sure.
> > > This is why it is not working when device is directly mapped.
> >
> > We circle back. It works for the case of trap/emulation.
> >
> > For direct mapping:
> >
> > You claim guest reset can work but suspend can't?
> No. guest reset to be done by the guest.

What reset did you mean here?

> Suspend for PM also to be done by guest.

PM is transport specific.

We have both FLR and reset. So we have a transport PM and suspend.

>
> The hypervisor will have 2 modes, stop and freeze as admin operation for =
device migration flow without telling the guest driver about it.

What prevents stop/freeze work here?

>
> >
> > > The hypervisor messing this bit and guest is also doing power managem=
ent
> > with it.
> >
> > So I don't see how it differs from: virtio reset and FLR is under the c=
ontrol of
> > guests.
> >
> And suspend for power management too under control of the guest.
>
> > >
> > > Both of them needs separate channel to do their own work.
> > >
> > > >
> > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > And if you want to rule P2P behaviours, PCI PM is really th=
e
> > > > > > > > correct way to go instead of trying to do it at the virtio =
layer.
> > > > > > > >
> > > > > > > PCI PM is supposed to be controlled by the guest and so the s=
uspend.
> > > > > >
> > > > > > I've listed issues about D3cold and others, I can't believe it
> > > > > > can't be controlled totally by guests.
> > > > > >
> > > > > D3cold is not controlled by the driver as defined by the PCI spec
> > > > > hence it is
> > > > not applicable.
> > > >
> > > > Have you seen the link I give you? Even if you are right, there
> > > > still could be such a request from the firmware, no?
> > > I may have missed the link.
> > > You have 10 replies, so it is easy to miss important things in rest o=
f the
> > comments.
> >
> > I meant there still could be D3cold requests from the guest via virtual
> > firmware.
> >
> So it will deliver PME.

So what do you want to say here?

>
> > So it's not necessarily related to the guest driver.
> >
> > >
> > > >
> > > > > D3hot is controlled by the driver.
> > > >
> > > > So, it requires the device context to be preserved, which is not
> > > > documented in your patch.
> > > PCI PM interactions is covered in v4 in the device requirements secti=
on.
> > >
> > > >
> > > > > > >
> > > > > > > Hypervisor needs its channel to suspend the device, as
> > > > > > > fundamentally guest is
> > > > > > unaware of device migration flow.
> > > > > >
> > > > > > That's pretty fine, the hypervisor also needs its channel to
> > > > > > reset the device. If you think there's a conflict with suspend,
> > > > > > there should be one
> > > > for reset as well.
> > > > > >
> > > > > I don=E2=80=99t see a need for hypervisor to reset the device in =
passthrough
> > mode.
> > > > Can you explain why is it needed?
> > > >
> > > > Qemu has a command "system_reset".
> > > >
> > > I mean, what does this translate to reset the device in passthrough m=
ode?
> >
> > It needs to reset the virtio device.
> >
> > > If this is FLR, it is there.
> >
> > Please explain how it works. (It's not only a FLR, it also need virtio =
level reset)
> >
> FLR obviously covers the virtio level reset as FLR covers the PCI + virti=
o reset.

Which part of the spec says this? And at least Qemu is not implemented
in this way.

And there's another conflict, you said FLR is under the control of guests .=
..

>
> > >
> > > > > Do you mean, it is needed in vdpa mode? If yes, the registers are
> > > > > emulated
> > > > anyway, so why the member device's native channel cannot be used in
> > > > vdpa mode?
> > > > >
> > > > > > >
> > > > > > > > > For large device I could imagine it could be short.
> > > > > > > > >
> > > > > > > > > In that case if there is suspend the device available, it
> > > > > > > > > will be used by the guest
> > > > > > > > driver itself, hypervisor wouldn=E2=80=99t know about it wh=
en those
> > > > > > > > registers are not trapped.
> > > > > > > > > So we need two ways to suspend.
> > > > > > > > > One is guest visible, and guest controlled.
> > > > > > > > > Second is hypervisor control to fulfill the device migrat=
ion needs.
> > > > > > > >
> > > > > > > > Can you explain why suspend is special but not reset or why
> > > > > > > > reset can work but not suspend? If reset can work, so does
> > > > > > > > suspend. If reset can't, neither does suspend.
> > > > > > > >
> > > > > > > As long as reset and suspend both are under guest control, I =
am fine.
> > > > > >
> > > > > > Well, you seem to ignore my question below. Hypervisor needs to
> > > > > > reset the device as well.
> > > > > >
> > > > > Why is it needed in passthrough mode?
> > > > >
> > > > > > >
> > > > > > > > For example, can you explain how a system_reset in Qemu can
> > > > > > > > work with your proposal?
> > > > > > > >
> > > > > > > > >
> > > > > > > > > So if you can please take a look if the proposed admin
> > > > > > > > > command to
> > > > > > > > freeze/stop mode can be used in the emulated register case =
or not.
> > > > > > > >
> > > > > > > > Again, if you design those for PCI, it's a layer violation.
> > > > > > > > You have answered
> > > > > > > They are used by the PCI layer, just like your suspend bit.
> > > > > > > Andy other transport can also use it.
> > > > > > >
> > > > > > > > yourself that PM is the right way to go.
> > > > > > > >
> > > > > > > > > It helps to have the suspend bit in guest control as well
> > > > > > > > > with/without
> > > > > > > > emulation mode.
> > > > > > > >
> > > > > > > > I won't repeat it again. You will find you need a full
> > > > > > > > transport to satisfy all the requirements.
> > > > > > > I disagree for full transport.
> > > > > >
> > > > > > See above and the discussion in another thread.
> > > > > >
> > > > > > > If you want to get discuss transport for sure it is some othe=
r
> > > > > > > thread and I want to see "driver notifications via such
> > > > > > > transport VQ" to fully qualify it
> > > > > > as transport, And that would be just sub-optimal for actual wor=
king.
> > > > > >
> > > > > > Sub-optimal since the function is duplicated with a transport
> > > > > > but it doesn't claim or design as a transport.
> > > > > >
> > > > > It is not sub-optimal because of duplication. It is because you
> > > > > want to
> > > > transport notifications via virtqueue.
> > > >
> > > > Have you ever read the series of tvq? You won't get this conclusion
> > > > if you do that.
> > > >
> > > I have read those 4 patches and I have seen that transportvq do not w=
ant to
> > transport notifications.
> > > Hence it does not qualify as transport vq.
> >
> > It exposes the platform MMIO area for driver notification. This is suff=
icient.
> > Any issue you see?
> Yes, the issue is, it is not transporting the driver notifications.
> Hence, it is not a transport virtqueue.

Please read how driver/device notification is done in the spec for
existing transports.

>
> >
> > >
> > > Frankly, transport vq seems a way to formalize mediation forever in v=
irtio.
> >
> > Nope, it can be accessed by a guest driver directly.
> >
> > > It is very weird way to build new SIOV device.
> > > For most things it should be the direct channel that virtio has alrea=
dy from
> > driver to the device.
> >
> > See above. SIOV might require a new transport or not.
> >
> It depends on the performance tests that Lingshan will show at scale.
>
> > >
> > >
> > > > >
> > > > > > > And hence, I wouldn=E2=80=99t call it a transport anymore.
> > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > This can also be used for debugging I think.
> > > > > > > > >
> > > > > > > > > As Michael listed, a dedicated debug interface is usually
> > > > > > > > > more useful instead
> > > > > > > > of in-band.
> > > > > > > >
> > > > > > > > Well, I've shown you the in-band facilities like debugging
> > > > > > > > via ethtool and kernel has a lot of other ones. If you have
> > > > > > > > ever tried to debug in a real production environment, you
> > > > > > > > will find how useful such handy information is where out-of=
-
> > > > > > > > band facilities are often dangerous
> > > > > > and usually prohibited or even unsupported.
> > > > > > > Guest driver can always read and write the device status
> > > > > > > without adding a
> > > > > > suspend bit.
> > > > > >
> > > > > > I don't get here. Suspend make sure the device state is frozen
> > > > > > which helps for debugging for sure.
> > > > > You wanted to debug some vq live, you suspend the device, the vq
> > > > > state got
> > > > changed.
> > > > >
> > > > > I just don=E2=80=99t see that suspend is a debug tool.
> > > >
> > > > It's not a tool, it's a function that can be used as a debug tool.
> > > >
> > > > > Every feature is a debug feature literally.
> > > > > Classic heisenbug effect.
> > > > >
> > > > > Once can change driver notification frequency to see if interrupt
> > > > > rate
> > > > changed for debugging.
> > > > > One can disabled few RQs and see RSS...
> > > > > Blk can change blk_size to higher value to perf debug..
> > > > > The list continues..
> > > >
> > > > Let's not shift concepts.
> > > >
> > > Your comment to attribute device migration as debug feature is actual=
ly
> > shifting the concept.
> >
> > It's not.
> >
> > Ling Shan put it in the basic facilities as part of device status. You =
wonder why,
> > we explained it can be used beyond migration. You asked where, we told =
you
> > for example things like debugging. We never claim it can only be used i=
n debug.
> > Then you shift the concept to say debug could be achieved by a lot of o=
ther
> > facilities. For sure this is correct, but it doesn't have any relations=
hip with the
> > discussion here.
> >
> I don=E2=80=99t see wasting time here.
> If its debug, its debug.
> If its migration, it is migration.
> If its pm, its pm.

Obviously not. Migration should leverage existing facilities as much
as possible instead of duplicating them.

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

