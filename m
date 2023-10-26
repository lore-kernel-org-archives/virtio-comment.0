Return-Path: <virtio-comment-return-7978-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9744FC25B48
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 08:28:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C3AA62AD52
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 08:28:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 95BD7986A59
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 08:28:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 799BC986A4E; Thu, 26 Oct 2023 08:28:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 68A75986A4F
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 08:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: alGw5OVYMtGtDQAHFWVJvA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698308913; x=1698913713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqoeGFiMd03sPh6rutBEOWNFofsc0PoI2uT4DGNOdKc=;
        b=WQVIPQwNQNwOQy/SdTdRDaPXG+OQEZGq5wJ+jyKraWnWwis3jy6Hg0IUcWzEUIAnh9
         BT2yNPyRu/YSeAPsqf5WVbZ7Cj9AYK/ErkBZLT5CtCl8gF9MXrdSGxWjFSb27FAaDj/z
         NX25pYV/aTnqk+6EX6QcG0suO/9m4hSvCI58maMTaA6SzXGVjt/7m7jctDAyHyIfNdlk
         ogDgS4vSWDmG7qF4Q6+V34HGiRCx1yr1X9hH1j9iN1OeoAq1RqIRAejZa+a19VAn5yqR
         Vvij/9GmKQiZoFUCyxPtpHZ4A0pHZ6yVgFspzRU9SHdVSh7vbLZcppb34JCapeyDDGGg
         JQKA==
X-Gm-Message-State: AOJu0YyMrNMjxmsd2Lz7FEP8+XazD1pQu/Q9b08ud2d4DjV4PcP8bHuF
	tWeejXI5TBSs3yAGcZLjOnlxn3/Rao4m97OnDsMcTVx6QqothslpUIssUecH6bAyVOjdwHx0UJF
	vn3kKXfglHcwoKY0vKtBQc0P5+G8295FOHkM7lPfJ5UnpM88OkA==
X-Received: by 2002:a81:4983:0:b0:5a7:b515:ae47 with SMTP id w125-20020a814983000000b005a7b515ae47mr19705859ywa.9.1698308913382;
        Thu, 26 Oct 2023 01:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IES+K/P/JHUzAlF/O1NdoBp5W1C1qxPo/DIkabLktxR82i6oFVprphYqnxDrSque4Ca8AF0FpzxtK+3uv0vUqU=
X-Received: by 2002:a81:4983:0:b0:5a7:b515:ae47 with SMTP id
 w125-20020a814983000000b005a7b515ae47mr19705850ywa.9.1698308913132; Thu, 26
 Oct 2023 01:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR12MB5481D21AD4CD4C649C4E023FDCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87zg09bfwg.fsf@redhat.com> <PH0PR12MB5481A3846046A484EFE20408DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87wmvdbehg.fsf@redhat.com> <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com> <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org> <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org> <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 26 Oct 2023 10:27:56 +0200
Message-ID: <CAJaqyWcFKGTpHSUsHePUA4sTp_NthrTs9dzdVKoRcuM6e0G-kA@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>, 
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Thu, Oct 26, 2023 at 8:02=E2=80=AFAM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, October 26, 2023 11:10 AM
>
> >
> > shorter: i.e. after FEATURES_OK is set and before DRIVER_OK is set.
>
> Ok.
>
> > If VIRTIO_F_RING_DYNAMIC is negotiated,
> > the driver can choose to enable some virtqueues after DRIVER_OK is set.
> Ok. will take this simpler version.
>
> >
> >
> > >
> > > > > > +enable every virtqueue it wants to use before setting the
> > > > > > +DRIVER_OK status bit; the driver can choose to enable a
> > > > > > +virtqueue even after the driver has set the DRIVER_OK status b=
it.
> >
> >
> >
> >
> > >> The virtqueue enable
> > > > > > +mechanism is
> > > > > > transport specific.
> >
> >
> >
> >
> > I still feel there is no real explanation in a transport agnostic manne=
r what does
> > it mean to "enable" virtqueue. Do you maybe just mean "configure virtqu=
eue"?
> >
> There is explanation of "re-enabling" a virtqueue in section " Virtqueue =
Re-enable".
>
> There is no good example of "configured" in generic section either, other=
 than cleanup and mmio section.
>
> >
> > Can we just avoid talking about "enabling"?
> > Is it true that you can basically change anything you want about the vq=
 not just
> > the enable bit? If so talking about enabling is just confusing I think.
> Not really.
> Enabling sequence of a virtqueue for pci and mmio transport is:
>
> 1. select a q
> 2. program the addresses
> 3. set the enable bit
>
> However, as I think more, this one-way interface of driver instructing th=
e device without any error code and without any response is just too limiti=
ng interface.
> I will be dropping this series that misuses the config registers beyond i=
ts intended init time use.
>
> Let me work on more mature interface that solves following challenges.
> 1. ability to create a virtqueue dynamically after driver_ok
> 2. ability to create virtqueue with one or multiple physical addresses
> 3. ability for the device to return error if it cannot create dynamic vq =
creation
>

I think 1 is very complex for the simpler use case of delaying the
enabling of the dataplane, especially because virtio-net already
assigns "the last queue" for CVQ. It would require changes to it too.

2 can be solved if we allow resetting a queue before DRIVER_OK, as MST
proposed previously IIRC. Would that work for the use case you have in
mind?

3 can be solved by re-reading the queue_enable field? This is the way
we're already using for checking DRIVER_OK in the PCI transport.

> The question is, do we need this generic facility beyond virtio-net?

I would try to avoid solutions specific for virtio-net, as other
devices may need to reuse them and it would be bad to need to add
quirks for that.

Thanks!


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

