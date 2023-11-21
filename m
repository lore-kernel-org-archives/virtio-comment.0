Return-Path: <virtio-comment-return-8488-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EEAC54FB9
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:45:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EB8EE2AEE0
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:45:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C02FE98688D
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:45:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7A395986191; Tue, 21 Nov 2023 04:45:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6251C986875
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 04:45:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: HGoUhLbENMiZklCOcU8woA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700541898; x=1701146698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2thDDSLpb1teSslu/Gj9c4EHkzthZYtqcWKV4EXXdY8=;
        b=qO7WfpXWiJX7D0wZXyJbvZ9QFbbczwEAlp+6CmmB6UP4F3lGN+h4OwDqONKIkVUreF
         YNA9eOBXQ4HYhjCUNI1Q9RMppLHFXyeqx5fsu7izXIILV0pFtU8tXoGkmllSkogYD+tW
         yfjTrjhHhOsqaLwJRIVjs2Ak/cEji8TBBb6r1fy+jcdIDxdvo9yh+6Ka6dmQl68ZFAv1
         xQjA2+K7dD+cj2FsL3rZbAmMIcZ4w7J7jZ98CWvf06lGgnAqwhH5ob3qmbb7gVcluNuR
         dlvmEzwXdIMcptAuNZInhsHS6zfP9A1/oeECts/S14Z1Vq8T1VKLtKnxZ8NJYgj6X6zT
         Wwaw==
X-Gm-Message-State: AOJu0YyR32fXdPCHqedRexn+KHY2gHxjSbIQXeE6+q7pxiXMXEm3X8ef
	QL1PGQl4N3kNlVyeVO+QTsGA8wQ0DuvqnZ4ASmxBUajLM4vR1PgfhZ6915Zafqk1ilACgQTwClQ
	xPkNKWz1Kcfd+BzgvBVQ7BEuEUwc5ZZK1cisqTSVOStZOf6aMRA==
X-Received: by 2002:a05:6512:3b2a:b0:50a:aa7d:2c18 with SMTP id f42-20020a0565123b2a00b0050aaa7d2c18mr6630101lfv.61.1700541898052;
        Mon, 20 Nov 2023 20:44:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGa6ZxHJVlQ8QWN7VuMyGbIzD8iBt+icAykPT2xpYMPRwO3XkCvdD7E/kK/HjLN7QbthjyDGo9a/eHKhP3GMWQ=
X-Received: by 2002:a05:6512:3b2a:b0:50a:aa7d:2c18 with SMTP id
 f42-20020a0565123b2a00b0050aaa7d2c18mr6630076lfv.61.1700541897757; Mon, 20
 Nov 2023 20:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20231117050357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810D15E0897C2435697E39DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117060456-mutt-send-email-mst@kernel.org> <PH0PR12MB5481AB5ECF613D806C338C54DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063406-mutt-send-email-mst@kernel.org> <PH0PR12MB5481089119BAB97C8F4B7CE0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117070636-mutt-send-email-mst@kernel.org> <PH0PR12MB5481B61EF6DE47F2625D0670DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117084325-mutt-send-email-mst@kernel.org> <PH0PR12MB54817B9406C8B0B5386E583DDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117100118-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117100118-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Nov 2023 12:44:46 +0800
Message-ID: <CACGkMEtJiJmjG=UWXto43UoL0Q137UsUtD1_4-n2xh7b+KANqA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Nov 17, 2023 at 11:09=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Fri, Nov 17, 2023 at 02:51:04PM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Friday, November 17, 2023 7:24 PM
> > >
> > > On Fri, Nov 17, 2023 at 12:46:21PM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Friday, November 17, 2023 6:00 PM
> > > > > To: Parav Pandit <parav@nvidia.com>
> > > > >
> > > > > On Fri, Nov 17, 2023 at 12:02:49PM +0000, Parav Pandit wrote:
> > > > > >
> > > > > >
> > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > Sent: Friday, November 17, 2023 5:13 PM
> > > > > > >
> > > > > > > On Fri, Nov 17, 2023 at 11:20:14AM +0000, Parav Pandit wrote:
> > > > > > > >
> > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > Sent: Friday, November 17, 2023 4:41 PM
> > > > > > > > >
> > > > > > > > > On Fri, Nov 17, 2023 at 10:20:45AM +0000, Parav Pandit wr=
ote:
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > > Sent: Friday, November 17, 2023 3:38 PM
> > > > > > > > > > >
> > > > > > > > > > > On Wed, Nov 15, 2023 at 05:39:43PM +0000, Parav Pandi=
t wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Additionally, if hypervisor has put the trap on
> > > > > > > > > > > > > > virtio config, and because the memory device
> > > > > > > > > > > > > > already has the interface for virtio config,
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Hypervisor can directly write/read from the
> > > > > > > > > > > > > > virtual config to the member's
> > > > > > > > > > > > > config space, without going through the device co=
ntext, right?
> > > > > > > > > > > > >
> > > > > > > > > > > > > If it can do it or it can choose to not. I don't =
see
> > > > > > > > > > > > > how it is related to the discussion here.
> > > > > > > > > > > > >
> > > > > > > > > > > > It is. I don=E2=80=99t see a point of hypervisor no=
t using the
> > > > > > > > > > > > native interface provided
> > > > > > > > > > > by the member device.
> > > > > > > > > > >
> > > > > > > > > > > So for example, it seems reasonable to a member
> > > > > > > > > > > supporting both existing pci register interface for
> > > > > > > > > > > compatibility and the future DMA based one for scale.=
 In
> > > > > > > > > > > such a case, it seems possible that DMA will expose m=
ore
> > > > > > > > > > > features than pci. And then a hypervisor might decide=
 to
> > > > > > > > > > > use
> > > > > > > > > that in preference to pci registers.
> > > > > > > > > >
> > > > > > > > > > We don=E2=80=99t find it right to involve owner device =
for
> > > > > > > > > > mediating at current scale
> > > > > > > > >
> > > > > > > > > In this model, device will be its own owner. Should not b=
e a problem.
> > > > > > > > >
> > > > > > > > I didn=E2=80=99t understand above comment.
> > > > > > >
> > > > > > > We'd add a new group type "self". You can then send admin
> > > > > > > commands through VF itself not through PF.
> > > > > > >
> > > > > > How? The device is owned by the guest. FLR and device reset can=
not
> > > > > > send the
> > > > > admin command reliably.
> > > > >
> > > > > It's of the "it hurts when I do this - don't do this then" catego=
ry.
> > > > >
> > > > it is don=E2=80=99t do medication category, yes due all this weirdn=
ess that has been
> > > asked.
> > > >
> > > > >
> > > > > > >
> > > > > > > > > > and to not break TDISP efforts in upcoming time by such=
 design.
> > > > > > > > >
> > > > > > > > > Look you either stop mentioning TDISP as motivation or
> > > > > > > > > actually try to address it. Safe migration with TDISP is =
really hard.
> > > > > > > > But that is not an excuse to say that TDISP migration is no=
t
> > > > > > > > present, hence
> > > > > > > involve the owner device for config space access.
> > > > > > > > This is another hurdle added that further blocks us away fr=
om TDISP.
> > > > > > > > Hence, we don=E2=80=99t want to take the route of involving=
 owner
> > > > > > > > device for any
> > > > > > > config access.
> > > > > > >
> > > > > > > This "blocks" is all just wild hunches. hypervisor controls s=
ome
> > > > > > > aspects of TDISP devices for sure - maybe we actually should =
use
> > > > > > > pci config space as that is generally hypervisor controlled.
> > > > > > Even bad to do hypercalls.
> > > > > > I showed you last time the role of the PCI config space snippet=
 from the
> > > spec.
> > > > >
> > > > > Yes I remember. This is just an example though. My point is maybe=
 it
> > > > > is solvable maybe it is not.
> > > > >
> > > > > > Do you see we are repeating the discussion again?
> > > > >
> > > > > One of the reasons is that people bring up irrelevances. TDISP is
> > > > > important but has to be addressed or deferred not vaguely referre=
d to.
> > > >
> > > > So lets continue to follow the current TDISP direction of not invol=
ving
> > > hypervisor for virtio common and device config.
> >
> > If you disagree to it, please speak now, so that we don=E2=80=99t debat=
e on this again in next 3 days.
> > Because this is the fundamental design considerations it relied on.
> > There is no point going forward if you want to disagree to it.
> > Other variants are fine, but other variants cannot be the only choice.
> >
> > > >
> > > > >
> > > > > > >
> > > > > > > > > For example, your current patches are clearly broken for =
TDISP:
> > > > > > > > > owner can control queue state at any time making device
> > > > > > > > > modify memory in any way it wants.
> > > > > > > > >
> > > > > > > > When TDISP migration is needed, the admin device can be
> > > > > > > > another TVM
> > > > > > > outside the HV scope.
> > > > > > > > Or an alternative would have device context encrypted not
> > > > > > > > visible to HV at
> > > > > all.
> > > > > > >
> > > > > > > Maybe. Fact remains your patches do conflict with TDISP and y=
ou
> > > > > > > seem to be fine with it because you have a hunch you can fix =
it.
> > > > > > > But we can't do development based on your hunches.
> > > > > > >
> > > > > > We have different view.
> > > > > > My patches do not conflict with TDISP because TDISP has clear
> > > > > > definition of
> > > > > not involving hypervisor for transport.
> > > > > > And that part is still preserved.
> > > > > > Delegating the migration to another TDISP or encrypting is yet =
to be
> > > defined.
> > > > > > And current patches will align to both the approaches in future=
.
> > > > > >
> > > > > > So you need to re-evaluate your judgment.
> > > > >
> > > > > If you like they do not "conflict".  But if used with TDISP they
> > > > > just make it insecure and thus completely worthless.  If hypervis=
or
> > > > > can change ring state to make device poke at random guest memory
> > > > > then it is game over and all the effort spent was security theate=
r.
> > > > Not really, I proposed two options.
> > > > 1. delegate the task of LM to the TVM. (proposed by two cpu vendors=
).
> > > > In this case all the infra we build here, just works fine.
> > >
> > > I think modification will be needed: currently commands are sent thro=
ugh the
> > > PF, and that is under hypervisor control.
> > > You should not assign PF to TVM.

That's the point. And that's why it keeps people confused to believe
the current PF/adminq can work in the TDISP.

> > Yes, an admin virtio function will be there which will do the admin com=
mands listed.
>
> So it can't be PF, so at least we need a new group type.
> I am inclined to then say, operate it through VF itself.

So it exactly matches the idea of transport virtqueue (a per VF/SF one).

But it still requires a PCI part to bootstrap.

>
>
> > >
> > > > It also does not require any hypervisor mediation for control plane=
.
> > > >
> > > > 2. Encrypt the owner device workload to be not seen by hypervisor
> > > >
> > > > Both methods does not affect the current direction.
> > > >
> > > > But if we force trap+emulation, it is 100% broken for TDISP.
> > > > And I would not promote that.
> > > >
> > > > > But you know this, don't you? This is why you mentioned encryptin=
g device.
> > > > > Maybe that works. It just does not work *as is*.
> > > > It works as_is. But current infrastructure does not block the futur=
e work.
> > > >
> > > > >
> > > > >
> > > > > > >
> > > > > > > > Such encryption is not possible, with the trap+emulation
> > > > > > > > method, where HV
> > > > > > > will have to decrypt the data coming over MMIO writes.
> > > > > > >
> > > > > > > I don't how what trap+emulation has to do with it. Do you ref=
er
> > > > > > > to the shadow vq thing?
> > > > > >
> > > > > > The method proposed here does not hinder any TDISP direction.
> > > > >
> > > > > direction? No, why would it. we can always add more commands that
> > > > > are safe for TDISP. commands you propose here are unsafe for TDIS=
P.
> > > > >
> > > > > > Without my proposal, do you have a method that does not involve
> > > > > > hypervisor
> > > > > intervention for virtio common and device config space, cvq and s=
hadow
> > > vq?
> > > > > > If so, I would like to hear that as well because that will alig=
n with TDISP.
> > > > >
> > > > > I really did not give it much thought.  I suspect for TDISP it ju=
st
> > > > > might be cleaner to have guest agent migrate device. Certainly re=
moves all
> > > the messy questions.
> > > > > That, to me impliest there needs to be a way to send migration
> > > > > commands through VF itself. Does this "involve hypervisor
> > > > > intervention"? No one should care I think.
> > > > Too far of the future to envision. May be yes. When such platform i=
s
> > > > built, for sure whoever migrates need migrate its device side too.
> > > > Some knowledge of migration driver is needed.
> > >
> > > So TDISP migration is so far in the future you do not need to bother =
about it.
> > > Fine. Then don't bring it up pls.
> > >
> > As long as we are aligned to the requirement that a virtio member devic=
e is mapped to the guest VM without mediating the virtio interface, I am go=
od.
> > Again, other variants are fine, but above listed mapped variant is the =
minimum variant needed.
>
> I think it's worth supporting this. I wouldn't call this minimum there
> are other approaches.  And I am not so sure it's worth trying
> to support this in all kind of systems such as IOMMU without
> dirty bit support. If some old systems will need mediation,
> this is kind of like legacy interface. Not a big deal.
>

+1

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

