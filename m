Return-Path: <virtio-comment-return-5441-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93D7C77B6E
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:38:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 62CF041EE8
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:38:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5A51798661B
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:38:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 525DB9865B2; Wed, 12 Apr 2023 05:38:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3239398651C
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Apr 2023 05:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: FWaOqra4N5ySUbQBVcp-qg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681277899; x=1683869899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sgzr6Pb9wKTn17EoeiCCbXZKdee5FFwgbDnELTdVxxE=;
        b=fhpCzqTUC8sKaAtEknRS74O5DjlyuWHM/sZoYudRVievbwdtnimueXwsloQNsw+byf
         bv1TlGXmr48Kls4x+kUg8SgFSKknm/Vol0ztT3tEcAv514+XUAGp2oXoLbRsozF8OklN
         zEAg1gM6u5oDh22Ua4q8dvMsCBJE+i1ce9zEkK//P0v8nxjql45hQnvHrlg6Ayr1O1gE
         XBQ2Ptzu82j+bBwF6gI/My4F7TOhKMF2xXkQa1AAtAhfsCgftraXdN4QnOR5bM4xSlMs
         IdbkIs7HSiRTr/up1z9OLGU4Z+Yi5CE+HXIK5GD5bAPVghmw1GDP2R94o1kvFucTRg7R
         F7wg==
X-Gm-Message-State: AAQBX9dNT1Ksqn5Kl/tETmjf+PjdyDn7spy6hhbC7eTZb9yCUcr3uZfi
	lj2pCb3pfNq6NlS+BpzmqbkfjVF20NEUNHlpodxROAqat0BMyl/BScd0ILBVtw+p0pVi+enMVtS
	GuPJug1ju3vvUhig49nysUl6HFWul1NZLer0R7j5uyEu8lFPxRQ==
X-Received: by 2002:a05:6808:1820:b0:384:c4a:1b49 with SMTP id bh32-20020a056808182000b003840c4a1b49mr4037190oib.9.1681277899559;
        Tue, 11 Apr 2023 22:38:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yw3MWneeqo7w+gE1snyRabHl5MCKsgIAW+tFrHuOilSWXzDWI6ksjvK//JXbtSxzm8eo7hoJpsyKwQN3uupjM=
X-Received: by 2002:a05:6808:1820:b0:384:c4a:1b49 with SMTP id
 bh32-20020a056808182000b003840c4a1b49mr4037183oib.9.1681277899388; Tue, 11
 Apr 2023 22:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230410020906-mutt-send-email-mst@kernel.org>
 <CACGkMEtiROwuB+ECJqd13qdpMJSTMoDOzi1u_i85==42C0XSXw@mail.gmail.com>
 <20230410023715-mutt-send-email-mst@kernel.org> <CACGkMEs+E_OarQxP3NmLk3iSi7U0WgAn-m3b4eX7ULu1+v=sOw@mail.gmail.com>
 <20230410060417-mutt-send-email-mst@kernel.org> <CACGkMEuc47PdmQdC67Nz4AvX_+jy+XBgCkwZ1BHmM8VGb9gywA@mail.gmail.com>
 <20230411030056-mutt-send-email-mst@kernel.org> <CACGkMEt2QAfhCgpYjSRNzf3n4W_HJLrMfE9JHzocR_gPH_Zrtg@mail.gmail.com>
 <20230411063945-mutt-send-email-mst@kernel.org> <CACGkMEufWUXHKahg3GLOKfV5aptbiek_DKwy+7rCfMya2GPaTQ@mail.gmail.com>
 <20230412000802-mutt-send-email-mst@kernel.org> <CACGkMEshNydwBD=Q0JW-SDY6xyiJ4uVrLn+pxbUrinycBKwsrw@mail.gmail.com>
 <PH0PR12MB548118F57BB4B4A4F8DC9D7ADC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvYsz1fSPG+fKpRaZ05Ut7ffKwvMPvR8xbRBsXA_6vGQw@mail.gmail.com> <PH0PR12MB548137D7A25C99EAA42B4D12DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548137D7A25C99EAA42B4D12DC9B9@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 12 Apr 2023 13:38:08 +0800
Message-ID: <CACGkMEshW82qztmGw8YJWJ8=QCoRd6cPxQ+ySazxsO_o+U6c4Q@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>, 
	Satananda Burla <sburla@marvell.com>, Maxime Coquelin <maxime.coquelin@redhat.com>, 
	Yan Vugenfirer <yan@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH 09/11] transport-pci: Describe PCI
 MMR dev config registers

On Wed, Apr 12, 2023 at 1:30=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, April 12, 2023 1:15 AM
>
> > > Because the spec for modern device do not allow it. Discussed in thes=
e
> > threads.
> >
> > Can you please tell me which part of the spec disallows it? There's a l=
ong
> > discussion in the virtualization-list a few months ago about mediating =
legacy
> > devices on top of modern. We don't see any blocker do you?
> >
> Modern device says FEAETURE_1 must be offered and must be negotiated by d=
river.
> Legacy has Mac as RW area. (hypervisor can do it).
> Reset flow is difference between the legacy and modern.

Just to make sure we're at the same page. We're talking in the context
of mediation. Without mediation, your proposal can't work.

So in this case, the guest driver is not talking with the device
directly. Qemu needs to traps whatever it wants to achieve the
mediation:

1) It's perfectly fine that Qemu negotiated VERSION_1 but presented a
mediated legacy device to guests.
2) For MAC and Reset, Qemu can trap and do anything it wants.

>
> > >
> > > > 1) legacy MMIO bar: spec changes, hypervisor mediation
> > > > 2) modern device: no spec changes, hypervisor mediation
> > > >
> > > This question repeats the same discussion occurred in this patch seri=
es.
> > > You might want to refer it again to avoid repeating all over again.
> >
> > No, I think you miss the point that modern devices could be used for me=
diating
> > legacy devices.
> >
> > >
> > > > 1) it's better not invent any of new facilities for legacy
> > > > 2) if legacy is insisted, allow MMIO BAR0 is much simpler and bette=
r
> > > You have missed few emails. :)
> > > MMIO BAR is proposed here and it is not limited to BAR 0.
> >
> > In the context of mediation, why do you need that flexibility?
> >
> The PCI device exposed is transitional to the guest VM, so it can do lega=
cy as well as newer features.
> And if BAR 0 is hard coded, it may not be able to support features that m=
ay need additional BAR.

This part I don't understand, you can just put existing modern
capabilities in BAR0, then everything is fine.

>
> > > It is left for the device to either map something in existing BAR or =
use BAR 0.
> > > Because PCI has only 3 BARs.
> > > A device may want to support legacy and non-legacy functionality both=
 at the
> > same time.
> >
> > This is perfectly fine, this is how Qemu did:
> >
> >     /*
> >      * virtio pci bar layout used by default.
> >      * subclasses can re-arrange things if needed.
> >      *
> >      *   region 0   --  virtio legacy io bar
> >      *   region 1   --  msi-x bar
> >      *   region 2   --  virtio modern io bar (off by default)
> >      *   region 4+5 --  virtio modern memory (64bit) bar
> >      *
> >      */
> >
> > > So better not to hard wire for BAR 0.
> >
> > Using BAR0 doesn't prevent you from adding modern capabilities in BAR0,=
 no?
> >
> Right, it doesn=E2=80=99t. But spec shouldn=E2=80=99t write BAR0 is only =
for legacy MMIO emulation, that would prevent BAR0 usage.

How can it be prevented? Can you give me an example?

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

