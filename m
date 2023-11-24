Return-Path: <virtio-comment-return-8581-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801F6C61D85
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:09:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E436542A69
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:09:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E179D9868B5
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:09:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D3A229865ED; Fri, 24 Nov 2023 03:09:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C450B9868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 03:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: wKKec0uNPkumob8Cmoj8zQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700795341; x=1701400141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hLVf3PD5g00sF4KuI8hOcF4ZjcZd2PtE5QC33Ko2nc=;
        b=EnGKthwVcXvu4G9T7IydKECKD+/XNLAN926zv6ZxflQrReF4TU8Sp8Xpy6JZ8FnSnd
         OVhAWTFeBGfb/xNRnCiB7H7930O6VavHkw/iVXWbpCMh5l/UtAz0EwYVZi8zXifi2XLM
         9kxjE+GW58kz15BGtfzL3WHvmb3nGg4A3FNj9sT52z3J5+VQ9d1wbBxk066+V/kOYa3G
         IloNAOAm6rfKL2H93iqgo/LB+57anbpC71sElwRnZ+kEPBslryULdPg1z31LwwuteN8+
         AY/f7KW/4MIJsSikBaZq5ZPjtH34rRdMo3+ZXF3MzNOsgcl+8TFSiCRMXuJW59vh4Gwi
         8Zmw==
X-Gm-Message-State: AOJu0Yw+OVnnVd41Oji8XQTd+d77l2FvjhJsx/FsDBkXD00JvfU/EB5N
	kLfVLF9gB4rdjErd0IHiruUT0Ve5+Hv8zbgtw39aIHZzYncZ1pFejIVZVdRZ1CxDYzDIfAJvs2k
	o3UIkg6xW2glBzYt1RJ/sBR+8fq7pJ/E6KlqrKTE7a2OnUVKPuw==
X-Received: by 2002:a05:6512:3091:b0:50a:71ec:a4ee with SMTP id z17-20020a056512309100b0050a71eca4eemr1046516lfd.8.1700795340744;
        Thu, 23 Nov 2023 19:09:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1R/AhH8b57JVNg71Ftx3VXGzBwtpkbKOhrlmdKXI8ySM/oHtbW9pNgivz9GAsMI0mZ+MS7SibjJ1jHPt/2DQ=
X-Received: by 2002:a05:6512:3091:b0:50a:71ec:a4ee with SMTP id
 z17-20020a056512309100b0050a71eca4eemr1046502lfd.8.1700795340475; Thu, 23 Nov
 2023 19:09:00 -0800 (PST)
MIME-Version: 1.0
References: <20231117050357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810D15E0897C2435697E39DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117060456-mutt-send-email-mst@kernel.org> <PH0PR12MB5481AB5ECF613D806C338C54DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063406-mutt-send-email-mst@kernel.org> <PH0PR12MB5481089119BAB97C8F4B7CE0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117070636-mutt-send-email-mst@kernel.org> <PH0PR12MB5481B61EF6DE47F2625D0670DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117084325-mutt-send-email-mst@kernel.org> <PH0PR12MB54817B9406C8B0B5386E583DDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117100118-mutt-send-email-mst@kernel.org> <CACGkMEtJiJmjG=UWXto43UoL0Q137UsUtD1_4-n2xh7b+KANqA@mail.gmail.com>
 <PH0PR12MB54816B7F5DB3899093FAB89EDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuVkJG4teqXL=vC19YQO4p9rMVy3soWUuJZ0ezSg4=zRQ@mail.gmail.com> <PH0PR12MB54819F041DAF0469C8461402DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54819F041DAF0469C8461402DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 11:08:49 +0800
Message-ID: <CACGkMEviYE9cMj4nmX8RXZuThyVoi8++BDmQybtU3kcp4DqY+Q@mail.gmail.com>
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

On Wed, Nov 22, 2023 at 12:39=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, November 22, 2023 9:46 AM
> >
> > On Wed, Nov 22, 2023 at 12:27=E2=80=AFAM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, November 21, 2023 10:15 AM
> > > >
> > > > On Fri, Nov 17, 2023 at 11:09=E2=80=AFPM Michael S. Tsirkin <mst@re=
dhat.com>
> > > > wrote:
> > > > >
> > > > > On Fri, Nov 17, 2023 at 02:51:04PM +0000, Parav Pandit wrote:
> > > > > >
> > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > Sent: Friday, November 17, 2023 7:24 PM
> > > > > > >
> > > > > > > On Fri, Nov 17, 2023 at 12:46:21PM +0000, Parav Pandit wrote:
> > > > > > > >
> > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > Sent: Friday, November 17, 2023 6:00 PM
> > > > > > > > > To: Parav Pandit <parav@nvidia.com>
> > > > > > > > >
> > > > > > > > > On Fri, Nov 17, 2023 at 12:02:49PM +0000, Parav Pandit wr=
ote:
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > > Sent: Friday, November 17, 2023 5:13 PM
> > > > > > > > > > >
> > > > > > > > > > > On Fri, Nov 17, 2023 at 11:20:14AM +0000, Parav Pandi=
t
> > wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > > > > Sent: Friday, November 17, 2023 4:41 PM
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Fri, Nov 17, 2023 at 10:20:45AM +0000, Parav
> > > > > > > > > > > > > Pandit
> > > > wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > > > > > > Sent: Friday, November 17, 2023 3:38 PM
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Wed, Nov 15, 2023 at 05:39:43PM +0000,
> > > > > > > > > > > > > > > Parav Pandit
> > > > wrote:
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Additionally, if hypervisor has put the
> > > > > > > > > > > > > > > > > > trap on virtio config, and because the
> > > > > > > > > > > > > > > > > > memory device already has the interface
> > > > > > > > > > > > > > > > > > for virtio config,
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Hypervisor can directly write/read from
> > > > > > > > > > > > > > > > > > the virtual config to the member's
> > > > > > > > > > > > > > > > > config space, without going through the
> > > > > > > > > > > > > > > > > device context,
> > > > right?
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > If it can do it or it can choose to not. =
I
> > > > > > > > > > > > > > > > > don't see how it is related to the discus=
sion here.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > It is. I don=E2=80=99t see a point of hyper=
visor not
> > > > > > > > > > > > > > > > using the native interface provided
> > > > > > > > > > > > > > > by the member device.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > So for example, it seems reasonable to a
> > > > > > > > > > > > > > > member supporting both existing pci register
> > > > > > > > > > > > > > > interface for compatibility and the future DM=
A
> > > > > > > > > > > > > > > based one for scale. In such a case, it seems
> > > > > > > > > > > > > > > possible that DMA will expose more features
> > > > > > > > > > > > > > > than pci. And then a hypervisor might decide
> > > > > > > > > > > > > > > to use
> > > > > > > > > > > > > that in preference to pci registers.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > We don=E2=80=99t find it right to involve owner=
 device
> > > > > > > > > > > > > > for mediating at current scale
> > > > > > > > > > > > >
> > > > > > > > > > > > > In this model, device will be its own owner.
> > > > > > > > > > > > > Should not be a
> > > > problem.
> > > > > > > > > > > > >
> > > > > > > > > > > > I didn=E2=80=99t understand above comment.
> > > > > > > > > > >
> > > > > > > > > > > We'd add a new group type "self". You can then send
> > > > > > > > > > > admin commands through VF itself not through PF.
> > > > > > > > > > >
> > > > > > > > > > How? The device is owned by the guest. FLR and device
> > > > > > > > > > reset cannot send the
> > > > > > > > > admin command reliably.
> > > > > > > > >
> > > > > > > > > It's of the "it hurts when I do this - don't do this then=
" category.
> > > > > > > > >
> > > > > > > > it is don=E2=80=99t do medication category, yes due all thi=
s
> > > > > > > > weirdness that has been
> > > > > > > asked.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > > > and to not break TDISP efforts in upcoming time
> > > > > > > > > > > > > > by such
> > > > design.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Look you either stop mentioning TDISP as
> > > > > > > > > > > > > motivation or actually try to address it. Safe
> > > > > > > > > > > > > migration with TDISP is really
> > > > hard.
> > > > > > > > > > > > But that is not an excuse to say that TDISP
> > > > > > > > > > > > migration is not present, hence
> > > > > > > > > > > involve the owner device for config space access.
> > > > > > > > > > > > This is another hurdle added that further blocks us
> > > > > > > > > > > > away from
> > > > TDISP.
> > > > > > > > > > > > Hence, we don=E2=80=99t want to take the route of i=
nvolving
> > > > > > > > > > > > owner device for any
> > > > > > > > > > > config access.
> > > > > > > > > > >
> > > > > > > > > > > This "blocks" is all just wild hunches. hypervisor
> > > > > > > > > > > controls some aspects of TDISP devices for sure -
> > > > > > > > > > > maybe we actually should use pci config space as that
> > > > > > > > > > > is generally hypervisor
> > > > controlled.
> > > > > > > > > > Even bad to do hypercalls.
> > > > > > > > > > I showed you last time the role of the PCI config space
> > > > > > > > > > snippet from the
> > > > > > > spec.
> > > > > > > > >
> > > > > > > > > Yes I remember. This is just an example though. My point
> > > > > > > > > is maybe it is solvable maybe it is not.
> > > > > > > > >
> > > > > > > > > > Do you see we are repeating the discussion again?
> > > > > > > > >
> > > > > > > > > One of the reasons is that people bring up irrelevances.
> > > > > > > > > TDISP is important but has to be addressed or deferred no=
t
> > > > > > > > > vaguely referred
> > > > to.
> > > > > > > >
> > > > > > > > So lets continue to follow the current TDISP direction of
> > > > > > > > not involving
> > > > > > > hypervisor for virtio common and device config.
> > > > > >
> > > > > > If you disagree to it, please speak now, so that we don=E2=80=
=99t debate
> > > > > > on this
> > > > again in next 3 days.
> > > > > > Because this is the fundamental design considerations it relied=
 on.
> > > > > > There is no point going forward if you want to disagree to it.
> > > > > > Other variants are fine, but other variants cannot be the only =
choice.
> > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > > For example, your current patches are clearly bro=
ken for
> > TDISP:
> > > > > > > > > > > > > owner can control queue state at any time making
> > > > > > > > > > > > > device modify memory in any way it wants.
> > > > > > > > > > > > >
> > > > > > > > > > > > When TDISP migration is needed, the admin device ca=
n
> > > > > > > > > > > > be another TVM
> > > > > > > > > > > outside the HV scope.
> > > > > > > > > > > > Or an alternative would have device context
> > > > > > > > > > > > encrypted not visible to HV at
> > > > > > > > > all.
> > > > > > > > > > >
> > > > > > > > > > > Maybe. Fact remains your patches do conflict with
> > > > > > > > > > > TDISP and you seem to be fine with it because you hav=
e
> > > > > > > > > > > a hunch you can
> > > > fix it.
> > > > > > > > > > > But we can't do development based on your hunches.
> > > > > > > > > > >
> > > > > > > > > > We have different view.
> > > > > > > > > > My patches do not conflict with TDISP because TDISP has
> > > > > > > > > > clear definition of
> > > > > > > > > not involving hypervisor for transport.
> > > > > > > > > > And that part is still preserved.
> > > > > > > > > > Delegating the migration to another TDISP or encrypting
> > > > > > > > > > is yet to be
> > > > > > > defined.
> > > > > > > > > > And current patches will align to both the approaches i=
n
> > future.
> > > > > > > > > >
> > > > > > > > > > So you need to re-evaluate your judgment.
> > > > > > > > >
> > > > > > > > > If you like they do not "conflict".  But if used with
> > > > > > > > > TDISP they just make it insecure and thus completely
> > > > > > > > > worthless.  If hypervisor can change ring state to make
> > > > > > > > > device poke at random guest memory then it is game over
> > > > > > > > > and all the effort spent was
> > > > security theater.
> > > > > > > > Not really, I proposed two options.
> > > > > > > > 1. delegate the task of LM to the TVM. (proposed by two cpu
> > vendors).
> > > > > > > > In this case all the infra we build here, just works fine.
> > > > > > >
> > > > > > > I think modification will be needed: currently commands are
> > > > > > > sent through the PF, and that is under hypervisor control.
> > > > > > > You should not assign PF to TVM.
> > > >
> > > > That's the point. And that's why it keeps people confused to believ=
e
> > > > the current PF/adminq can work in the TDISP.
> > > >
> > > There is no confusion.
> >
> > No, when LingShan points out the conflict, you just told us it will be
> > addressed in the future.
> >
> Current proposal does not punch the hole in the TDISP TVM interface.

So you meant adminq in PF works in TDISP?

>
> > And after Michael pointed it out again, you agree than adminq can not b=
e
> > part of PF in this context.
> >
> As explained when TDISP for device migration evolves, there will be other=
 trusted entity which will do it.

Platform has been evolved to support dirty pages. Let's use that.

>
>
> > And you miss the fact that admin virtqueue today can't be used to manag=
e
> > the owner.
> >
> There is no such need for device migration.

You just agree that in order to migrate to TDISP, admin can't sit in
PF, so where is it?

>
> > > The admin queue interface ensures first step that TDISP interface is
> > dedicated to guest as today.
> > > There is no bifurcation added on the VF that needs extra mediation.
> > >
> > > > > > Yes, an admin virtio function will be there which will do the
> > > > > > admin
> > > > commands listed.
> > > > >
> > > > > So it can't be PF, so at least we need a new group type.
> > > > > I am inclined to then say, operate it through VF itself.
> > > >
> > > > So it exactly matches the idea of transport virtqueue (a per VF/SF =
one).
> > > >
> > > There is no need for transport virtqueue for VF as VF device has same
> > uniform principle as PF.
> >
> > I don't understand here. I have explained that you have invented a func=
tion
> > duplication of transport virtqueue.
> >
> No. we haven=E2=80=99t.
> It is explained in other thread that functionality is different.
>
> > > If you want transport vq, please have it on the PF too.
> >
> > Nothing prevents this, actually transport virtqueue start from this.
> >
> > > And that also is not needed because there is already CVQ.
> >
> > I don't see why you keep mentioning CVQ. I don't see anyone that says
> > transport virtqueue is going to replace CVQ.
> >
> I explained everything in the doc. This is the Nth time being repeated...

The doc is wrong since it assumes that people worry that transport
virtqueue will replace cvq.

>
> > >
> > > > But it still requires a PCI part to bootstrap.
> > > >
> > > > >
> > > > >
> > > > > > >
> > > > > > > > It also does not require any hypervisor mediation for contr=
ol
> > plane.
> > > > > > > >
> > > > > > > > 2. Encrypt the owner device workload to be not seen by
> > > > > > > > hypervisor
> > > > > > > >
> > > > > > > > Both methods does not affect the current direction.
> > > > > > > >
> > > > > > > > But if we force trap+emulation, it is 100% broken for TDISP=
.
> > > > > > > > And I would not promote that.
> > > > > > > >
> > > > > > > > > But you know this, don't you? This is why you mentioned
> > > > > > > > > encrypting
> > > > device.
> > > > > > > > > Maybe that works. It just does not work *as is*.
> > > > > > > > It works as_is. But current infrastructure does not block
> > > > > > > > the future
> > > > work.
> > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > Such encryption is not possible, with the
> > > > > > > > > > > > trap+emulation method, where HV
> > > > > > > > > > > will have to decrypt the data coming over MMIO writes=
.
> > > > > > > > > > >
> > > > > > > > > > > I don't how what trap+emulation has to do with it. Do
> > > > > > > > > > > you refer to the shadow vq thing?
> > > > > > > > > >
> > > > > > > > > > The method proposed here does not hinder any TDISP
> > direction.
> > > > > > > > >
> > > > > > > > > direction? No, why would it. we can always add more
> > > > > > > > > commands that are safe for TDISP. commands you propose
> > > > > > > > > here are unsafe for
> > > > TDISP.
> > > > > > > > >
> > > > > > > > > > Without my proposal, do you have a method that does not
> > > > > > > > > > involve hypervisor
> > > > > > > > > intervention for virtio common and device config space,
> > > > > > > > > cvq and shadow
> > > > > > > vq?
> > > > > > > > > > If so, I would like to hear that as well because that
> > > > > > > > > > will align with
> > > > TDISP.
> > > > > > > > >
> > > > > > > > > I really did not give it much thought.  I suspect for
> > > > > > > > > TDISP it just might be cleaner to have guest agent migrat=
e
> > device.
> > > > > > > > > Certainly removes all
> > > > > > > the messy questions.
> > > > > > > > > That, to me impliest there needs to be a way to send
> > > > > > > > > migration commands through VF itself. Does this "involve
> > > > > > > > > hypervisor intervention"? No one should care I think.
> > > > > > > > Too far of the future to envision. May be yes. When such
> > > > > > > > platform is built, for sure whoever migrates need migrate
> > > > > > > > its device side
> > > > too.
> > > > > > > > Some knowledge of migration driver is needed.
> > > > > > >
> > > > > > > So TDISP migration is so far in the future you do not need to
> > > > > > > bother
> > > > about it.
> > > > > > > Fine. Then don't bring it up pls.
> > > > > > >
> > > > > > As long as we are aligned to the requirement that a virtio
> > > > > > member device is
> > > > mapped to the guest VM without mediating the virtio interface, I am
> > good.
> > > > > > Again, other variants are fine, but above listed mapped variant
> > > > > > is the
> > > > minimum variant needed.
> > > > >
> > > > > I think it's worth supporting this. I wouldn't call this minimum
> > > > > there are other approaches.  And I am not so sure it's worth
> > > > > trying to support this in all kind of systems such as IOMMU
> > > > > without dirty bit support. If some old systems will need
> > > > > mediation, this is kind of like legacy interface. Not a big deal.
> > > > >
> > > >
> > > > +1
> > >
> > > There are users with the recent cpus that may not have the IOMMU dirt=
y
> > page tracking support.
> > > So I don=E2=80=99t fully agree.
> >
> > There are setups that don't have SR-IOV or even PCI.
> >
> Which are those? Please expand those transports that need it.

For transport/platform without SR-IOV, you want to expand the
transport no matter whether or not it is possible.
For dirty page tracking, you want to do it in virtio no matter how
long it has been implemented by various platforms.

If you are correct, I can say, please wait for the platform support
for dirty page tracking.

Thanks





>
> > Let's have a unified standard.


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

