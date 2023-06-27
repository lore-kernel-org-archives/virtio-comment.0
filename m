Return-Path: <virtio-comment-return-6535-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C50EB64D7
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 02:42:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4C1C729FE6
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 02:42:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 351F498641C
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 02:42:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 285E6986350; Tue, 27 Jun 2023 02:42:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1603498639B
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Jun 2023 02:42:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 1S23W4YFNmOnWP8HpzW7JA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687833749; x=1690425749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAWvQi9+9qo9Gg3udnSeFcod5eKVDUG4L3IMLCedTEo=;
        b=lVe5FqCKjObnsbT6mP362/jgYf0gTO05NkDCFbInVFQknZ9ASk5vGgIaup6kmj7s12
         WQ+tiMELSexGkP9dH0Y7c9G+bslEh/NUH5EOcP8ebb34FH89PkN91ZZcDRbxojiPeW11
         5gqxUXkN96SLK7MA+181D9vrQDWlFSfN7BjzxjbL85OZjzgiLjj13D7Zg/GYQKzZWbwy
         YpeAZHN5akX4m0RTqVqvJT2h2MpmKZZ2S2EZQeQpA2jr0GGArnPZz7F9BKZ+Q67muVyN
         vosUafLxa3P+TIs+6DwpHoWGXBxn0BgUsW2a0O9zG4tTmvmbrDrQbVa8rMNO5Tyalxd+
         qRFQ==
X-Gm-Message-State: AC+VfDxd8I9brhHDSB3aIyTUIghpFo3oGd6ri4vwDrmbTroqmMFJcMox
	Dy9KeZGYo9nLshRMQol9XbTkDURjhM1kwdeyTF4zYS+cyI0bU2Ny24dgCkejGoMwlkCrB76YRkR
	T2kDpF1eBG5H25Kgs2CB4HnGf1cdXcG3pu+zRW/ZShu8aka3NIw==
X-Received: by 2002:a05:6512:110b:b0:4f9:6b64:9a34 with SMTP id l11-20020a056512110b00b004f96b649a34mr7744992lfg.14.1687833749367;
        Mon, 26 Jun 2023 19:42:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5q4RLSTPRU22q0t1xi7+88LdUYgZWLj1SZ+it+2sJvQ8FRwG45ko9OIeWUHnjm1ou6uGLVCjeX1x5EY5cg8tQ=
X-Received: by 2002:a05:6512:110b:b0:4f9:6b64:9a34 with SMTP id
 l11-20020a056512110b00b004f96b649a34mr7744975lfg.14.1687833748969; Mon, 26
 Jun 2023 19:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230605092859-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481CEB3A34AAB49A282F2A8DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605174755-mutt-send-email-mst@kernel.org> <PH0PR12MB548180E16376862A3C0DFF1DDC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606073544-mutt-send-email-mst@kernel.org> <CACGkMEv1so_KGwJZG3GnAf=JNky7+BMNK7N4NTtucDS+WyW5VA@mail.gmail.com>
 <PH0PR12MB5481D80A48F3BD82D86B3DB0DC53A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsVrqCGJJ2Q5OGbgPdtEJHTpvVt6nEKP_MzkSH_-cOa6w@mail.gmail.com>
 <PH0PR12MB54810313CA6DD1995F52745DDC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsy=pG=LT0hOT-PO3HTkk3NOAu6qA_GaZpKwqq8B996cA@mail.gmail.com>
 <20230609030109-mutt-send-email-mst@kernel.org> <CACGkMEseaZAgPdtf9AvwxLarkYXRMC0zCJqnjWQFJ90t0pSZzA@mail.gmail.com>
 <PH0PR12MB5481F5505D76E77C2A1C3327DC26A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481F5505D76E77C2A1C3327DC26A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 27 Jun 2023 10:42:17 +0800
Message-ID: <CACGkMEsCeFTjKSq6-0V_C+yquaYgJF1NH50LCS1tAq1edNNC7Q@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [virtio-dev] Re: [PATCH v3 0/3]
 transport-pci: Introduce legacy registers access using AQ

On Mon, Jun 26, 2023 at 12:04=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Jason Wang
> > Sent: Monday, June 26, 2023 12:00 AM
>
> > >   This way we just say "make legacy guests work" and
> > >   this is the problem of the hardware vendor not ours.
> >
> > Probably, but we need to try our best to simplify the vendor's life.
> >
> > >
> > > - limit the impact. We don't get to maintain the set of hacks
> > >   needed for legacy in the hypervisor
> >
> > This is only true if the vendor fully understands the behaviour of the =
legacy and
> > implements it correctly which would be very hard. We would end up with =
quirks
> > in the hypervisor soon or later.
> >
> You can help vendor understand the legacy so that hypervisor don=E2=80=99=
t have the quirks. :)

I will try, but when trying to develop hardening for virtio drivers, I
feel it could be not an easy task when dealing with legacy devices
(with unexpected behaviours).

If we go with modern devices, our life will be much easier and that's
why I prefer to go with that way.

Thanks

>
> > > - when some weird legacy
> > >   support requirement surfaces, it will be up to the vendor
> > >   to fix. HW vendors are also more agressive in deprecating
> > >   old hardware - they will just stop shipping new
> > >   hardware when there are no new customers and we can
> > >   stop adding new hacks.
> >
> > But the hacks would be there forever if there's users.
> >
> > >
> > > - test out admin command interface. This use-case is smaller
> > >   than full transport vq but similar enough that
> > >   we will learn valuable lessons from it.
> >
> > Another issue is that the interface is designed to be PCI specific (at =
least from its
> > name) which may result in a strange mediation for MMIO legacy guests.
> >
> It is no different than AQ being only for the PCI today.
> So far no user of MMIO legacy, may be in future it can be extended if req=
uired.
>
> We don=E2=80=99t want legacy to be that grand either.
>
> I am moving most things to generic section (instead of PCI) based on Mich=
ael's inputs.
>
>
> > >   For example, it already helped us find and correct
> > >   a design mistake where admin commands had 8 byte aligned length.
> > >   As another example, I am working on ability to report events to adm=
in
> > command
> > >   infrastructure which is currently missing.
> >
> > If we want a MMIO interface for admin commands, it requires more extens=
ions
> > for such kind of notification.
> >
> > >   With that in place we will be able to add INT#x emulation for very =
old
> > >   guests.
> > >
> > >
> > >
> > > In short, this interface as you correctly point out is not the normal
> > > way we build interfaces since it is not modular and less flexible tha=
n
> > > individual feature bits.  However, for the legacy interface this migh=
t
> > > be a good thing.
> >
> > Ok, I think I would not object to this proposal, but we should not excl=
ude the
> > possibility of having things like LEGACY_HEADER in the future.
>
> Thanks.


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

