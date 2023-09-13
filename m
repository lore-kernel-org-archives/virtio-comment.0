Return-Path: <virtio-comment-return-7387-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FC0EEB58F
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 04:45:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3AB8B2AED9
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 04:45:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2DA8398663D
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Sep 2023 04:45:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2445A98403A; Wed, 13 Sep 2023 04:45:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 16B2D986632
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Sep 2023 04:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: u-RpWLMJM6Stw60L_REHTw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694580333; x=1695185133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dk2NnzpniFvjHJh13yrEAQ+fqJIABIP/yQ5LB6KFzIg=;
        b=Jh6P3W5oB7/d4NhDB55ln2a0IKkCXY8gdZl+BQ/NY9dCkNJWSloBT+7MCyKWJkD+gc
         MdGH8S5pjMonyI3W70ij54M3DQrvXY4yc0Nr9ebl6BO1qIiGhbC/Zs3OUYYAGm6LuPX3
         qbxAUpr0bwo0NrMq+7eG8d8pUFoBBEGAcqDUU1bnmwgfp5qzGTxhVMT31KTVc2R+NeWR
         n+thxtw9m13efqQB0KDjoO1sihAzBAwbSquCy9JcMMpLARrp55/uwLBP9w8C4/0WEIqz
         73HBr0y6jffQBNy5z+R8h6O+XmiAoj5rIXGd1QjSHEoNKv8yr+2puz8pWMnqnnlr/pMp
         hj5A==
X-Gm-Message-State: AOJu0Yzn3d1oPcxDbSvlz0mIP89p9dfw5XaOAue4ikyfeCqdpbzTWu5B
	jYGzpbXu/eoM8bQbX9ZIevShg71fWOeof15C79sU/5hX1BBCcmiMYearaocd/VL4/4uHNlWSqab
	XOQ1AE9IfElizwWl7VzOW2th/aBNx5DF+E+c8mkCplSzGuu4Clg==
X-Received: by 2002:a05:6512:159d:b0:4fb:8de9:ac0e with SMTP id bp29-20020a056512159d00b004fb8de9ac0emr1354512lfb.1.1694580333300;
        Tue, 12 Sep 2023 21:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDkZIy3O8mYSRJlyZlZM5TxC6tyeiwtTne2y1AGNL1suVnhPTmiGIaZsWUw3R6oChYY+/Rjkl9BFgUpOSOHJ0=
X-Received: by 2002:a05:6512:159d:b0:4fb:8de9:ac0e with SMTP id
 bp29-20020a056512159d00b004fb8de9ac0emr1354501lfb.1.1694580332997; Tue, 12
 Sep 2023 21:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-6-lingshan.zhu@intel.com> <20230906043016-mutt-send-email-mst@kernel.org>
 <CACGkMEu4R_nUFmpoNesmjJ-PtoE5brpWh8NLruWhEWycm2K4yg@mail.gmail.com>
 <PH0PR12MB5481A50B1B13CE1756B98D0DDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtMmwWGJDYe5BLvLCcetThv-yfPR2QbphNuuh+bp-+ikg@mail.gmail.com>
 <PH0PR12MB5481ED8DC23DC6D42665FB8EDCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <eb6c350e-1198-7d83-a553-99c9c8c21edc@intel.com> <PH0PR12MB5481760E00AD18DB8BF91636DCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ad1dd3a6-7c11-5c6b-b50f-d608ec027dcd@intel.com> <PH0PR12MB54819C4A4220712DCD57AD56DCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fff7720f-6019-bd87-b14b-c0bf996f3959@intel.com> <PH0PR12MB5481D11A7DF45292103D9290DCF2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt6=AC4pYEoxNn2dpbLLEKTLj-SYV2eSUAi1ZA1LWR3qg@mail.gmail.com> <PH0PR12MB5481E49BFCE50AA8F8373F45DCF1A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481E49BFCE50AA8F8373F45DCF1A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 13 Sep 2023 12:45:21 +0800
Message-ID: <CACGkMEtor0uDs9xUDXH1ZA3n9Zb9kzP9MAYwN5h6em+39gNfXg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH 5/5] virtio-pci: implement VIRTIO_F_QUEUE_STATE

On Tue, Sep 12, 2023 at 2:05=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, September 12, 2023 9:40 AM
> > >
> > > > Why this series can not support nested?
> > > I don=E2=80=99t see all the aspects that I covered in series [1] rang=
ing from flr, device
> > context migration, virtio level reset, dirty page tracking, p2p support=
, etc.
> > covered in some device, vq suspend resume piece.
> > >
> > > [1]
> > > https://lists.oasis-open.org/archives/virtio-comment/202309/msg00061.=
h
> > > tml
> >
> > The series works for stateless devices. Before we introduce device stat=
es in the
> > spec, we can't migrate stateful devices. So the device context doesn't =
make
> > much sense right now.
> The series works for stateful devices too. The device context covers it.

How? Can it be used for migrating any existing stateful devices? Don't
we need to define what context means for a specific stateful device
before you can introduce things like device context? Please go through
the archives for the relevant discussions (e.g virtio-FS), it's not as
simple as introducing a device context API.

And what's more, how can it handle the migration compatibility?

>
> >
> > Dirty page tracking in virtio is not a must for live migration to work.=
 It can be
> > done via platform facilities or even software. And to make it more effi=
cient, it
> > needs to utilize transport facilities instead of a general one.
> >
> It is also optional in the spec proposal.
> Most platforms claimed are not able to do efficiently either,

Most platforms are working towards an efficient way. But we are
talking about different things, hardware based dirty page logging is
not a must, that is what I'm saying. For example, KVM doesn't use
hardware to log dirty pages.

> hence the vfio subsystem added the support for it.

As an open standard, if it is designed for a specific software
subsystem on a specific OS, it's a failure.

>
> > The FLR, P2P demonstrates the fragility of a simple passthrough method =
and
> > how it conflicts with live migration and complicates the device impleme=
ntation.
> Huh, it shows the opposite.
> It shows that both will seamlessly work.

Have you even tried your proposal with a prototype device?

>
> > And it means you need to audit all PCI features and do workaround if th=
ere're
> > any possible issues (or using a whitelist).
> No need for any of this.

You need to prove this otherwise it's fragile. It's the duty of the
author to justify not the reviewer.

For example FLR is required to be done in 100ms. How could you achieve
this during the live migration? How does it affect the downtime and
FRS?

>
> > This is tricky and we are migrating virtio not virtio-pci. If we don't =
use simple
> > passthrough we don't need to care about this.
> >
> Exactly, we are migrating virtio device for the PCI transport.

No, the migration facility is a general requirement for all transport.
Starting from a PCI specific (actually your proposal does not even
cover all even for PCI) solution which may easily end up with issues
in other transports.

Even if you want to migrate virtio for PCI,  please at least read Qemu
migration codes for virtio and PCI, then you will soon realize that a
lot of things are missing in your proposal.

> As usual, if you have to keep arguing about not doing passhthrough, we ar=
e surely past that point.

Who is "we"? Is something like what you said here passed the vote and
written to the spec? We all know the current virtio spec is not built
upon passthrough.

> Virtio does not need to stay in the weird umbrella to always mediate etc.

It's not the mediation, we're not doing vDPA, the device model we had
in hardware and we present to guests are all virtio devices. It's the
trap and emulation which is fundamental in the world of virtualization
for the past decades. It's the model we used to virtualize standard
devices. If you want to debate this methodology, virtio community is
clearly the wrong forum.

>
> Series [1] will be enhanced further to support virtio passthrough device =
for device context and more.
> Even further we like to extend the support.
>
> > Since the functionality proposed in this series focus on the minimal se=
t of the
> > functionality for migration, it is virtio specific and self contained s=
o nothing
> > special is required to work in the nest.
>
> Maybe it is.
>
> Again, I repeat and like to converge the admin commands between passthrou=
gh and non-passthrough cases.

You need to prove at least that your proposal can work for the
passthrough before we can try to converge.

> If we can converge it is good.
> If not both modes can expand.
> It is not either or as use cases are different.

Admin commands are not the cure for all, I've stated drawbacks in
other threads. Not repeating it again here.

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

