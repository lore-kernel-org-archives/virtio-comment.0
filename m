Return-Path: <virtio-comment-return-8603-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B9DC61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:28:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6DC002AEE3
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:28:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5E5279868A7
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:28:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 543739862D9; Fri, 24 Nov 2023 06:28:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 475D09868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 06:28:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: I8pXw5oIMKWzZDahcc0bzA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700807335; x=1701412135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3Ck51xmok53L0+1VWBB7q3MEDHUJPEMi3IneD0/Vr4=;
        b=MJDT51f/qKVl2w7NBBnm7lmAN2X5bprV7b694e7f//9EB4nNn+/b9q1G2X38l22wNa
         Fwf6O6vqg44WHF+w25XpD7MykJTs7kU/3fOqjhDirLS/DgQVH21+R9QjdMQHhMMcdows
         YO4gIZfUDJ29DJxjr/g2CkTnIIBYPzqd9ftZKK3TsVtBDO3kgsWCH4wUWGa/daIBKnKv
         SbZX4hWWZYzTPiqsrqxV/TIhqqFQOt/3+WeaHsEdbSWsnubodQ80do67ngLX6xj2uBJI
         J34FSlUbJDZ30/BKyhpI9FGln1jxDgTwIyAy8DgGnVaZbJY5qSI6sn77MhF100jV2k7t
         tbuQ==
X-Gm-Message-State: AOJu0Yyu76XKg+11riJdX42a5fff/v7gJU3YDls9Ni0252l/IHXreMmR
	aAKjflJ2FQs6if3tmdOxkQTvhs5aiYKPPAHc91hn3xUQPASWvo3C+XTOqPmNVAx5OpB2i2kwD1z
	qC80+JKcvlJBq6cErVXfWDfrhU/tbTZP0BYw11ZLPU3SFKOIl5A==
X-Received: by 2002:a05:6512:12c4:b0:507:9ff6:75b6 with SMTP id p4-20020a05651212c400b005079ff675b6mr980845lfg.50.1700807335648;
        Thu, 23 Nov 2023 22:28:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWubCca918JUX79mszT3xPnR2EyJpN6GbHCGilVIvYZ1WPymuSLCok8wp/q3W9KP6m7UVIVyt60DhczxQMqus=
X-Received: by 2002:a05:6512:12c4:b0:507:9ff6:75b6 with SMTP id
 p4-20020a05651212c400b005079ff675b6mr980834lfg.50.1700807335356; Thu, 23 Nov
 2023 22:28:55 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB5481577C0492D45C20CF9C62DCAFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvLYgnLtSqx_G=-KMuANEZ=xtAzJjV3pYqAZhA0qqW0sQ@mail.gmail.com>
 <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <20231121161218-mutt-send-email-mst@kernel.org> <CACGkMEuLFxsAZ6W0SdJSEHw4gtgM-aehfC+oTLxH4zHxjMw3vw@mail.gmail.com>
 <PH0PR12MB5481CCD71A032A6590F14D8FDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsqasttUGjOJwogPoU2+HFurFK+gxY1gO9Pg8+s4JReZQ@mail.gmail.com> <20231124011846-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124011846-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 14:28:44 +0800
Message-ID: <CACGkMEusUPTFfi5Gmu=Fg2vFF5i71e7rfsk_21HabqCq_06suQ@mail.gmail.com>
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

On Fri, Nov 24, 2023 at 2:20=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Fri, Nov 24, 2023 at 11:25:41AM +0800, Jason Wang wrote:
> > On Wed, Nov 22, 2023 at 2:32=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Wednesday, November 22, 2023 10:59 AM
> > > >
> > > > On Wed, Nov 22, 2023 at 5:18=E2=80=AFAM Michael S. Tsirkin <mst@red=
hat.com>
> > > > wrote:
> > > > >
> > > > > On Tue, Nov 21, 2023 at 03:33:07PM +0800, Jason Wang wrote:
> > > > > > > Lingshan claimed that suspending device is for live migration=
 in commit
> > > > log and in discussion he portray it as some basic facility unrelate=
d to device
> > > > migration such as debug etc.
> > > > > > > Instead of claiming it as some non_device_migration facility =
does not
> > > > make sense.
> > > > > >
> > > > > > It is used for migration for sure.
> > > > >
> > > > > Well having a generic facility to stop device sounds like a nice =
thing.
> > > > > However the devil is in the detail. A lot of detail here seems ve=
ry
> > > > > much tailored to a very specific implementation in mind.
> > > > > So thinking through how it will work e.g. for power management wo=
uld
> > > > > be a good excercise to figure out how it should work in detail.
> > > >
> > > > It might work in the case where there's no PM support in the transp=
ort. E.g for
> > > > MMIO devices.
> > > >
> > > MMIO should implement PM like other transport. That brings the equiva=
lency principle.
> > >
> >
> > MMIO are usually platform devices. I don't see the point.
> >
> > Thanks
>
> I don't understand what you are saying. Why does it make sense to
> suspend individual platform devices when they are suspended
> with the whole platform?

It is because we don't need to suspend the whole platform to migrate
the virtio-MMIO device.

Thanks

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

