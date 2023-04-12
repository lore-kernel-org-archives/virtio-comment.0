Return-Path: <virtio-comment-return-5412-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C95C7619A
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 04:07:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0B0CD26A2B
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 04:07:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 98F489865B5
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 04:07:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 88227986295; Wed, 12 Apr 2023 04:07:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6B81C986745
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Apr 2023 04:07:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 2Bd-EODaPP-iRtQNmhozGQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681272458; x=1683864458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0GavSx+mTUcC/FK+AThT3WZi/dm/BDqGrERlxhBIJ0=;
        b=C3TrrdGUg4XUHhLEbLvjpVcsYA0i+mdfclFYBkUX6JDyWNWj0S0KQO79ZoBzY83htL
         H7N3I8DoHYrPkbOGW2/INqFJGDk3JcqZCk6gj4LJiBqUcYQu5rzVhg5QCrKp2pT6XtJ3
         qQIsBXH+/iTfprZgZUtwgrDAEmiwL0DO74onAtCpxCBR+TOX6s8QPOJ2rGy2hMnS1hOw
         HX4BJJiiDXndaiztJpJtNDVS+QTx7CbLUB0KloYewixhGx9qGMufcJWNAO8W7+KWTOvx
         E640eMrC1ODFDSPExWLW9nPqP9Ja3L1yaI0cA9+oNZLw1QM/FCxjAaLxqABTswcIgdYl
         RhjQ==
X-Gm-Message-State: AAQBX9fwossTb9d9Mj4NV+2/sBKKGP+glltFIXkki+jPjiGYoxO+0XCT
	W16f+OT6VVyrKrPj777i7m9BpgM577kcO1mrdkLe3gmH263qKA78bmKJekDqPYLCdeiAHMP7hEO
	+yrcUHGOB4aFAS77+PKoV6YGhyWserz54ZwnclRQDqTq/p7jNrQ==
X-Received: by 2002:ac8:5c85:0:b0:3bf:b9d9:675f with SMTP id r5-20020ac85c85000000b003bfb9d9675fmr6250879qta.10.1681272458378;
        Tue, 11 Apr 2023 21:07:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350bnEZF4B7LdtTcTh9rap6WKcu6oNyqcTm1gHM0BWQYlNq/NU9rDrebfCPOu+v4uE1WwjQA6gv9SxtVEKvN+fio=
X-Received: by 2002:ac8:5c85:0:b0:3bf:b9d9:675f with SMTP id
 r5-20020ac85c85000000b003bfb9d9675fmr6250875qta.10.1681272458143; Tue, 11 Apr
 2023 21:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230330225834.506969-1-parav@nvidia.com> <20230330225834.506969-9-parav@nvidia.com>
 <CACGkMEtMOy4B-O-52ka+9P3OBQ_hs1KvdjWodNYg-XKLff+giw@mail.gmail.com>
 <307a9f8f-6184-0403-97ab-1b1c16d4fd3c@nvidia.com> <CACGkMEucOwwFDMqyWA+DgYV7X=9f5-P4Ba_AP=5kTsjna=n+7A@mail.gmail.com>
 <PH0PR12MB548194B46A3E32329C10D00EDC9A9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230411172207-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230411172207-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 12 Apr 2023 12:07:26 +0800
Message-ID: <CACGkMEsSxnn0+T6ng99HV-PwA3kEe6J050GNDKJjcjBQfQxbfA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>, 
	Satananda Burla <sburla@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [virtio-dev] [PATCH 08/11] transport-pci: Introduce virtio
 extended capability

On Wed, Apr 12, 2023 at 5:25=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Apr 11, 2023 at 07:01:16PM +0000, Parav Pandit wrote:
> >
> > > From: virtio-dev@lists.oasis-open.org <virtio-dev@lists.oasis-open.or=
g> On
> > > Behalf Of Jason Wang
> > > Sent: Monday, April 10, 2023 11:29 PM
> >
> > > > However, it is not backward compatible, if the device place them in
> > > > extended capability, it will not work.
> > > >
> > >
> > > It is kind of intended since it is only used for new PCI-E features:
> > >
> > New fields in new extended pci cap area is fine.
> > Migrating old fields to be present in the new extended pci cap, is not =
your intention. Right?
> >
> > > "
> > > +The location of the virtio structures that depend on the PCI Express
> > > +capability are specified using a vendor-specific extended capabiliti=
es
> > > +on the extended capabilities list in PCI Express extended configurat=
ion
> > > +space of the device.
> > > "
> > >
> > > > To make it backward compatible, a device needs to expose existing
> > > > structure in legacy area. And extended structure for same capabilit=
y
> > > > in extended pci capability region.
> > > >
> > > > In other words, it will have to be a both places.
> > >
> > > Then we will run out of config space again?
> > No.
> > Only currently defined caps to be placed in two places.
> > New fields don=E2=80=99t need to be placed in PCI cap, because no drive=
r is looking there.
> >
> > We probably already discussed this in previous email by now.
> >
> > > Otherwise we need to deal with the
> > > case when existing structures were only placed at extended capability=
. Michael
> > > suggest to add a new feature, but the driver may not negotiate the fe=
ature
> > > which requires more thought.
> > >
> > Not sure I understand feature bit.
>
> This is because we have a concept of dependency between
> features but not a concept of dependency of feature on
> capability.
>
> > PCI transport fields existence is usually not dependent on upper layer =
protocol.
> >
> > > > We may need it even sooner than this because the AQ patch is expand=
ing
> > > > the structure located in legacy area.
> > >
> > > Just to make sure I understand this, assuming we have adminq, any rea=
son a
> > > dedicated pcie ext cap is required?
> > >
> > No. it was my short sight. I responded right after above text that AQ d=
oesn=E2=80=99t need cap extension.
>
>
>
> You know, thinking about this, I begin to feel that we should
> require that if at least one extended config exists then
> all caps present in the regular config are *also*
> mirrored in the extended config. IOW extended >=3D regular.
> The reason is that extended config can be emulated more efficiently
> (2x less exits).

Any reason for it to get less exits? At least it has not been done in
current Qemu's emulation. (And do we really care about the performance
of config space access?)

Thanks

> WDYT?
>
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

