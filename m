Return-Path: <virtio-comment-return-8620-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990CBC61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 12:17:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EF667339BF
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 12:17:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BC9D49868B0
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 12:17:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A37E99862D9; Fri, 24 Nov 2023 12:17:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 935ED9868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 12:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: zc6J5YmRM2a4cjtbNZ12TQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700828244; x=1701433044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gzIUmjKXJTfIJM4jRF0jZ8aQxwx2Sp0ZWGPnUdsgkrU=;
        b=gMpT8LqRDutxKhgR3ou8BgXVk1/PQDYeZMfQiWHpFxqZFV614fZsqlOiwDTGJuCghY
         yMIkbNo6XJngAwzzVqpebWSEgJOHkE1Weh6LsYV7+5xikKRYLVc+hJ2AnlHfZFALhj1t
         UeXMdr8swWZ7RJZhjJhp7JaCmzFSBWtLmL+/eBeRhbno6Mp8DnCnvc4giDpFNzd0HUJN
         P8awTpPpfRbL2+HJ/ETG2Y6nugvojm25s+XZrqWZo3aM6I8qGxiWUbE3nBKZYlIk0oll
         AP+eCm1zMOKxuDAjx9DeZ1BgveHWGUt80Oe2TlPESWh9eWhhzodfcWC0AdtLCf73nvDq
         xYWg==
X-Gm-Message-State: AOJu0YwDzy136PTSdXtYwrtvtbVMQK+LpUqYa97FsIrfKwYcdScQjrVn
	Qau8DKY6ME50Q+fhe2hCi8HPnlFKBy9yzszGEMpbMXCzrttQ+IjibNW41k6sGYrhFIXflb0Ra/B
	hi6uEh3vKCzZ4bTSqs9X5OYiOuvzwCw2k4Q==
X-Received: by 2002:a17:906:d7a2:b0:9a9:f0e6:904e with SMTP id pk2-20020a170906d7a200b009a9f0e6904emr2455434ejb.16.1700828244395;
        Fri, 24 Nov 2023 04:17:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoH5vAeC1Hq/MGXmrhlugwn3UL/kYtAT8LGmm1bW5+AxaOAZ9pDVvjS53taZ6pb0HRABl/Cg==
X-Received: by 2002:a17:906:d7a2:b0:9a9:f0e6:904e with SMTP id pk2-20020a170906d7a200b009a9f0e6904emr2455412ejb.16.1700828244096;
        Fri, 24 Nov 2023 04:17:24 -0800 (PST)
Date: Fri, 24 Nov 2023 07:17:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231124071048-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <PH0PR12MB54816D26CE3B22CA84CAAE2ADCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvqB0Q3N6UBuVXad7GLGRWB_YS1rbdNZy8h85jkXGePtg@mail.gmail.com>
 <PH0PR12MB5481EEAEDFECA480BB3D69DCDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3vSyVo6O4TvahiQYqZymnK7m+SWY9nzaQHFBEAbUpMA@mail.gmail.com>
 <20231124035211-mutt-send-email-mst@kernel.org>
 <CACGkMEtHhf2KTHeYcfRndh7GMu22R_Q4ABNb__zv_cn0na2N6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtHhf2KTHeYcfRndh7GMu22R_Q4ABNb__zv_cn0na2N6Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH V2 3/6] virtio: dont reset vqs when
 SUSPEND

On Fri, Nov 24, 2023 at 07:50:42PM +0800, Jason Wang wrote:
> > I frankly don't see how a bit which is completely non-orthogonal with
> > device and driver state can be useful for debug.
> 
> The bit is to make sure the state of a device doesn't change. It may
> help or not just like if you want to pause a cpu/process during the
> debug.

Heh. But it would be much better to have an orthogonal state
that driver can just set without worrying much about
device being broken somehow.


> > For debug you want something that just always works.
> > Not an interface that has so many requirements it will break if
> > you look at it sidewise.
> >
> >
> > > > >
> > > > I don’t see wasting time here.
> > > > If its debug, its debug.
> > > > If its migration, it is migration.
> > > > If its pm, its pm.
> > >
> > > Obviously not. Migration should leverage existing facilities as much
> > > as possible instead of duplicating them.
> >
> > I don't think there's anything obvious here.  A lot of device state
> > can't be easily accessed with existing facilities.
> 
> Then we can invent new things.

So the approach this patchset takes is a single interface for
all state introspection. Some duplication of functionality
for the sake of consistency. You don't like it fine but
there is nothing obvious that it's a bad thing. It's a tradeoff.

> > The logical
> > continuation of your reasoning would be to add state introspection
> > commands e.g. to cvq in virtio net and then use tricks like shadow vq to
> > issue these.
> 
> For the device state, yes. Because it is device logic and it is not
> what platform or transport can know.

Exactly as I thought. Don't think shadow VQ is something we
can reasonably make a single migration mechanism though.
It feels fragile and heavyweight. It's more of a work
around hardware limitations.


> > Yea, possible, but can we not go there please?  Nothing is
> > wrong with just building commands that do exactly what we want them to
> > do instead of trying to build a ship in a bottle.
> 
> But it's not the case for others.
> 
> E.g in Parav's proposal, it tries to rule P2P behaviour via virtio
> admin commands when there is a duplication

Yes there's some duplication. Advantage is consistency.  I actually
suggested ways to reduce duplication, by using transport offsets as
tags.  Finding a right balance means we all need to stop going to
extremes, I wish you and lingshan would stop trying to force everyone
to use registers and parav would stop trying to force dma.

> and a layer violation.

layers are only good if they make sense.

> Thanks
> 
> 
> >
> > --
> > MST
> >


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

