Return-Path: <virtio-comment-return-8622-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FFAC61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 13:02:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F3CFD2AD5F
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 13:02:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0454F9868B6
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 13:02:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D454F9862D9; Fri, 24 Nov 2023 13:02:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C46FF9868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 13:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: hjWsEAQwMPe7pBw8U8lXSw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700830926; x=1701435726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H76/++cbJ3ss67vLrghYKB1DcPjRIiClCpEp+WSiII0=;
        b=Iq6vmzlhKTh/VUG74uoHu19B1n6td3cqtg1jOZbiSNilbvmoXb970a9pFFk81Qae5X
         gUipAQAklaIv4CHpUwsuvvVtWRWd4H+7x9Wy7n8ccTwlj1oYSsUVrJ5jz95/Ein4ruY8
         KFemZilPT5tFk8aLrY9EnfaHbPf8diPXJ5q+nGmVZUNcFOq/6suzqobaNG++fjQI+x5W
         8+TWbU+e+wZnVLu6HV2JoETBMxpmx+lfB4NeZqTDLTCCBWsZ/8u4+eodyjEdtUWwjda7
         4sANMGXO6pgN05j+uT7RhutWuVTgJYXFEJ9DD8OgzdCUFaEINGpHRPak2+CvTmjzASVT
         IbKg==
X-Gm-Message-State: AOJu0Ywgjln+e2vF6yWEs8apaoBfAn5xQRCoE+a1j/h3bX9s9tCZT8/8
	WALzFpbbpRF04A4GMyfktwDd50T19R9guK8OY3p2Jhk+QE3PdR3XO4uKJj05gTRWN+Z/vQMlKc1
	wMtFwNugpBDOrDoBF58OLA4JGvl3cO/6nq4m6UiGEokr+qWH9mQ==
X-Received: by 2002:a19:790b:0:b0:500:a378:db71 with SMTP id u11-20020a19790b000000b00500a378db71mr1716169lfc.57.1700830925448;
        Fri, 24 Nov 2023 05:02:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAzUcsxTNtMILjGiHXAJilFtxktprT/AE9ZI0BV54Ftu82RckXrG5eWq81xpRCRR1Lx8VCxqotFK0lNlWoUgE=
X-Received: by 2002:a19:790b:0:b0:500:a378:db71 with SMTP id
 u11-20020a19790b000000b00500a378db71mr1716108lfc.57.1700830924825; Fri, 24
 Nov 2023 05:02:04 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <PH0PR12MB54816D26CE3B22CA84CAAE2ADCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvqB0Q3N6UBuVXad7GLGRWB_YS1rbdNZy8h85jkXGePtg@mail.gmail.com>
 <PH0PR12MB5481EEAEDFECA480BB3D69DCDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3vSyVo6O4TvahiQYqZymnK7m+SWY9nzaQHFBEAbUpMA@mail.gmail.com>
 <20231124035211-mutt-send-email-mst@kernel.org> <CACGkMEtHhf2KTHeYcfRndh7GMu22R_Q4ABNb__zv_cn0na2N6Q@mail.gmail.com>
 <20231124071048-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124071048-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 21:01:53 +0800
Message-ID: <CACGkMEuLCHccVTWxT=DWDJRK3XGC_8wQW6AvuZ2kpTa8C-WeQQ@mail.gmail.com>
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

On Fri, Nov 24, 2023 at 8:17=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Fri, Nov 24, 2023 at 07:50:42PM +0800, Jason Wang wrote:
> > > I frankly don't see how a bit which is completely non-orthogonal with
> > > device and driver state can be useful for debug.
> >
> > The bit is to make sure the state of a device doesn't change. It may
> > help or not just like if you want to pause a cpu/process during the
> > debug.
>
> Heh. But it would be much better to have an orthogonal state
> that driver can just set without worrying much about
> device being broken somehow.

In that case we still need a preise definition of the state. So I
don't see the difference here.

Anyhow, we can leave debugging aside.

>
>
> > > For debug you want something that just always works.
> > > Not an interface that has so many requirements it will break if
> > > you look at it sidewise.
> > >
> > >
> > > > > >
> > > > > I don=E2=80=99t see wasting time here.
> > > > > If its debug, its debug.
> > > > > If its migration, it is migration.
> > > > > If its pm, its pm.
> > > >
> > > > Obviously not. Migration should leverage existing facilities as muc=
h
> > > > as possible instead of duplicating them.
> > >
> > > I don't think there's anything obvious here.  A lot of device state
> > > can't be easily accessed with existing facilities.
> >
> > Then we can invent new things.
>
> So the approach this patchset takes is a single interface for
> all state introspection. Some duplication of functionality
> for the sake of consistency.
> You don't like it fine but

The (partial) duplication should be fine as long as it doesn't have
any issue, but I do see a lot of issues. So I can't say I like it.

> there is nothing obvious that it's a bad thing. It's a tradeoff.
>
> > > The logical
> > > continuation of your reasoning would be to add state introspection
> > > commands e.g. to cvq in virtio net and then use tricks like shadow vq=
 to
> > > issue these.
> >
> > For the device state, yes. Because it is device logic and it is not
> > what platform or transport can know.
>
> Exactly as I thought. Don't think shadow VQ is something we
> can reasonably make a single migration mechanism though.

That's my understanding as well. It's up to the hypervisor, spec needs
to focus on the mechanism but not policy.

> It feels fragile and heavyweight. It's more of a work
> around hardware limitations.
>
>
> > > Yea, possible, but can we not go there please?  Nothing is
> > > wrong with just building commands that do exactly what we want them t=
o
> > > do instead of trying to build a ship in a bottle.
> >
> > But it's not the case for others.
> >
> > E.g in Parav's proposal, it tries to rule P2P behaviour via virtio
> > admin commands when there is a duplication
>
> Yes there's some duplication. Advantage is consistency.

Just to clarify, we do need things like suspend but I don't see
dealing with PCI P2P in virtio as consistent (e.g we don't imply any
PCI stuff in virtio reset).

>  I actually
> suggested ways to reduce duplication, by using transport offsets as
> tags.

I don't see a connection with P2P here. Or I may miss something.

> Finding a right balance means we all need to stop going to
> extremes, I wish you and lingshan would stop trying to force everyone
> to use registers and parav would stop trying to force dma.

There is a misunderstanding. Actually. I don't want to force
registers. Which kind of interface is the best way to go is really
implementation specific. In some implementations, registers are cheap
but not virtqueue, in others, virtqueue is cheap but not register.
They are all fine. But we can't not claim one proposal that is
optimized for a specific implementation to be the best way. What I
want to do is not limit the facilities that are used for live
migration to any specific transport. I think Ling Shan agreed with me
in this part. It needs to work on all interfaces regardless of
registers, DMA, CMA or others. That's why I suggest we focus on what
needs to be migrated first. That is define the following things

1) way to suspend/resume a device
2) virtqueue states, indices or inflight ones
3) device states

It is just like how we define virtqueues/features/status and other
basic facilities where we do not tie it to any specific interfaces
like DMA, CMA, registers or admin commands. Virtio benefited from the
flexibility like this in the past so why not stick to that?

After this, each transport can choose to implement it in their own
way. For example, if there's a proposal to use those via admin
virtqueue that's fine. And registers also fine and other transports.
That's why only the last patch of this series is dealing with the PCI
specific part.

>
> > and a layer violation.
>
> layers are only good if they make sense.

Case by case, for example, PCI PM has defined the state and the
interaction with P2P. Reusing that seems much cleaner than inventing a
mechanism in the virtio layer. Or if it needs a side channel, it needs
to be invented in PCI not virtio.

Thanks

>
> > Thanks
> >
> >
> > >
> > > --
> > > MST
> > >
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

