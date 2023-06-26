Return-Path: <virtio-comment-return-6500-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3A3EB64D7
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 04:00:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9E2742B04E
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 04:00:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 84D6198638D
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 04:00:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6BE1E98635B; Mon, 26 Jun 2023 04:00:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5944E986364
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Jun 2023 04:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: F-jsGGQGOhu0lGKYIE--mQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687751994; x=1690343994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vChsekz6QkTAII4iup0W47w4ySIPkAeP0Gew+iNAWss=;
        b=V2+yy1iUSrncMAbSt4a1OavZZfqTa/PGov2K3N2B/cphLEAbrd+Bygfnwe5N79OWkJ
         X1HUoZjvRPyBEA+iXbVEVWv5yiY30jdso72vFZXJifn335nbm04Jb61OUtL7uDNifj+1
         3za+BC2y1q++Jfw6cKljes1NC8Npj4q1nADCMtMVLg2WEAKlN8LeOseLkaWrSx0674d9
         S5dq2xPV0XI8piGFrTIDOwd0FsxD6BhPbP6EBCLaf0a+he58bPO0XrsoVtI7fZaUEOM9
         4hxqnw7cBQwOSfVasVO9EeVFbwjT2wNu9JWKf4c28/8IBILl5AccCUUqPHEM1CohgDo+
         inXg==
X-Gm-Message-State: AC+VfDzEXy/ctUDz0QjpExc454R5y2jczfafDFu52rgdbaXpoMXzE8Ip
	k0JWfQzBgsNAPQBH3yaQkXwVkQDSCZPEWPYFLJMiYksEOtIX3WnYHok8JAa1K5v9LRVu1KuSblo
	wMT1K0rj5y+nLTsi6Fbvtk4VNEZ5snhWBviTfCSLOo/Ez9K/2ag==
X-Received: by 2002:a05:651c:109:b0:2b4:78f6:d330 with SMTP id a9-20020a05651c010900b002b478f6d330mr13760638ljb.2.1687751994227;
        Sun, 25 Jun 2023 20:59:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4RthdBys9ImlZmgwCN26Yxixhkf15P/jKEhhA7UeHXATwmgZSKHyBgltGqEtgM7H63ipKQcOnoEMryR80k9bA=
X-Received: by 2002:a05:651c:109:b0:2b4:78f6:d330 with SMTP id
 a9-20020a05651c010900b002b478f6d330mr13760624ljb.2.1687751993933; Sun, 25 Jun
 2023 20:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230605092859-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481CEB3A34AAB49A282F2A8DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605174755-mutt-send-email-mst@kernel.org> <PH0PR12MB548180E16376862A3C0DFF1DDC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606073544-mutt-send-email-mst@kernel.org> <CACGkMEv1so_KGwJZG3GnAf=JNky7+BMNK7N4NTtucDS+WyW5VA@mail.gmail.com>
 <PH0PR12MB5481D80A48F3BD82D86B3DB0DC53A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsVrqCGJJ2Q5OGbgPdtEJHTpvVt6nEKP_MzkSH_-cOa6w@mail.gmail.com>
 <PH0PR12MB54810313CA6DD1995F52745DDC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsy=pG=LT0hOT-PO3HTkk3NOAu6qA_GaZpKwqq8B996cA@mail.gmail.com> <20230609030109-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230609030109-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Jun 2023 11:59:42 +0800
Message-ID: <CACGkMEseaZAgPdtf9AvwxLarkYXRMC0zCJqnjWQFJ90t0pSZzA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH v3 0/3] transport-pci: Introduce legacy
 registers access using AQ

On Fri, Jun 9, 2023 at 3:15=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Fri, Jun 09, 2023 at 10:06:43AM +0800, Jason Wang wrote:
> > On Thu, Jun 8, 2023 at 10:38=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Wednesday, June 7, 2023 2:54 AM
> > >
> > > > Hypervisor can trap the legacy device configuration space write and=
 convert it
> > > > to cvq commands.
> > > Michael already answered that cvq is not trapped; this is the main de=
sign goal we talked several times that it is passthrough device.
> >
> > Is this really a blocker? Wouldn't a new feature(_F_LEFACY_MAC) or cap
> > resolve this?
>
> Of course we can create a set of feature bits emulating legacy.
>
> > >
> > > So no point discussing this again.
> > >
> > > If you have any comments on v4, please let me know.
> > >
> > > Both the design points are addressed in v4.
> > > 1. To split to two commands for device and config area
> > > 2. Use pci cap to learn about notification region
> > >
> > > Since this ABI reflects what we agree on,
> >
> > I think not since you fail to explain why this approach is better than
> > simply adding new features like _F_LEGACY_HEADER and _F_LEGACY_MAC.
> >
> > Thanks
>
> I can explain, I think it's better for these reasons:
>
> - limit the scope. We started out with _F_LEGACY_HEADER
>   but now there's _F_LEGACY_MAC too. What about other
>   device types?

Fortunately, we only have a few types of legacy devices.

> Could be nasty surprises there too.

Yes, but this needs to be addressed no matter what kind of device ABI is ch=
osen.

>   This way we just say "make legacy guests work" and
>   this is the problem of the hardware vendor not ours.

Probably, but we need to try our best to simplify the vendor's life.

>
> - limit the impact. We don't get to maintain the set of hacks
>   needed for legacy in the hypervisor

This is only true if the vendor fully understands the behaviour of the
legacy and implements it correctly which would be very hard. We would
end up with quirks in the hypervisor soon or later.

> - when some weird legacy
>   support requirement surfaces, it will be up to the vendor
>   to fix. HW vendors are also more agressive in deprecating
>   old hardware - they will just stop shipping new
>   hardware when there are no new customers and we can
>   stop adding new hacks.

But the hacks would be there forever if there's users.

>
> - test out admin command interface. This use-case is smaller
>   than full transport vq but similar enough that
>   we will learn valuable lessons from it.

Another issue is that the interface is designed to be PCI specific (at
least from its name) which may result in a strange mediation for MMIO
legacy guests.

>   For example, it already helped us find and correct
>   a design mistake where admin commands had 8 byte aligned length.
>   As another example, I am working on ability to report events to admin c=
ommand
>   infrastructure which is currently missing.

If we want a MMIO interface for admin commands, it requires more
extensions for such kind of notification.

>   With that in place we will be able to add INT#x emulation for very old
>   guests.
>
>
>
> In short, this interface as you correctly point out is not the normal
> way we build interfaces since it is not modular and less flexible than
> individual feature bits.  However, for the legacy interface this might
> be a good thing.

Ok, I think I would not object to this proposal, but we should not
exclude the possibility of having things like LEGACY_HEADER in the
future.

Thanks

>
>
> > > I would want to raise for vote in coming days to be part of 1.3 in fe=
w days as we have more than 3 weeks to sort out non-ABI language part.
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

