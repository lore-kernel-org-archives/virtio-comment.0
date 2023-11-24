Return-Path: <virtio-comment-return-8617-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48E5C61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:51:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1F4CE41F29
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:51:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1181E9868B1
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 11:51:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0789A9862D9; Fri, 24 Nov 2023 11:51:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE6009868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 11:51:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: AQJZ0Af-MBuQus3PYpqOHw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700826690; x=1701431490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TLZpCHX/Dvpf2Dpxhb5DfEHL3pexws3vMpr7xkMIoA=;
        b=DYOOYJXvZjekakRxRtl6kYfVGMsnFBmh5FJjT0pHWu96ucoiqYs/DBJYYXFJAUcDvC
         5/3ai/eCauViWdGVmZZjTuCk4OR9sFQYTZHqOMb7kPNc5OF5bDL7ebSrssrU9hQt60C1
         lCT7i6HXfVVy/U+LJ9ENR8FCvNgiySfMWXJO5EBNAnNpKC/YR9fUP83x0S46UqBvZudx
         p2ERiSavgujOAyGaRjzfq8VRlqyqMCCp6gb+IlFPxoCxK57mVNK45wHMv1lUjlbxgSo0
         qGgHr3ETFLM0e97uYeuXefktf/4M7DAHVcceYWenhg/9SX/FI8zHXG2IpFWqI3+r0SUK
         3snA==
X-Gm-Message-State: AOJu0YxZl99FNEX2mcLnr84gaOHH8wLrkXkoYPAbbl2Avoi2Ofe1PFg0
	damQIbRv3siOSjiOm0uT6FaoJmR8NBRyHMiTZ3p8SMmXaTIp9dws3jynHcmQ3PicyFlzu21pLBz
	EJ5xBLdnNbkAwqM/8/HI8O9LzC9ALrL2DFonh8m5aQkaaLlvzuyGphGXH5LYY
X-Received: by 2002:a05:6512:1392:b0:500:7a21:3e78 with SMTP id fc18-20020a056512139200b005007a213e78mr1734921lfb.55.1700826690545;
        Fri, 24 Nov 2023 03:51:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGs3Sur6LIrb+g2NzAfN8qff9V6d36S+GXXBq36tm3sY2fV5WXSvHHakA+ZGrwdz4R0N67vOvDCfoU7JY94a+w=
X-Received: by 2002:a05:6512:1392:b0:500:7a21:3e78 with SMTP id
 fc18-20020a056512139200b005007a213e78mr1734916lfb.55.1700826690354; Fri, 24
 Nov 2023 03:51:30 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB54819A6E470D3ABE4BC1F450DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtxm8M5vKfOPOAS347JAJNeRDyPe+nif1LszuRWS0vShQ@mail.gmail.com>
 <PH0PR12MB54810EF71D0BF925F4F81A65DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtsMi9+MgDb=tTH=LrkReb3aZdB4wv-MJkxLmLhNmTDAg@mail.gmail.com>
 <20231121161218-mutt-send-email-mst@kernel.org> <CACGkMEuLFxsAZ6W0SdJSEHw4gtgM-aehfC+oTLxH4zHxjMw3vw@mail.gmail.com>
 <PH0PR12MB5481CCD71A032A6590F14D8FDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsqasttUGjOJwogPoU2+HFurFK+gxY1gO9Pg8+s4JReZQ@mail.gmail.com>
 <20231124011846-mutt-send-email-mst@kernel.org> <CACGkMEusUPTFfi5Gmu=Fg2vFF5i71e7rfsk_21HabqCq_06suQ@mail.gmail.com>
 <20231124035038-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124035038-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 19:51:19 +0800
Message-ID: <CACGkMEs5b=BiB1rS0CkAAga3PPWJo7q-Pa__mo+sT0_H+k+MwQ@mail.gmail.com>
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

On Fri, Nov 24, 2023 at 4:51=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Fri, Nov 24, 2023 at 02:28:44PM +0800, Jason Wang wrote:
> > On Fri, Nov 24, 2023 at 2:20=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Fri, Nov 24, 2023 at 11:25:41AM +0800, Jason Wang wrote:
> > > > On Wed, Nov 22, 2023 at 2:32=E2=80=AFPM Parav Pandit <parav@nvidia.=
com> wrote:
> > > > >
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Wednesday, November 22, 2023 10:59 AM
> > > > > >
> > > > > > On Wed, Nov 22, 2023 at 5:18=E2=80=AFAM Michael S. Tsirkin <mst=
@redhat.com>
> > > > > > wrote:
> > > > > > >
> > > > > > > On Tue, Nov 21, 2023 at 03:33:07PM +0800, Jason Wang wrote:
> > > > > > > > > Lingshan claimed that suspending device is for live migra=
tion in commit
> > > > > > log and in discussion he portray it as some basic facility unre=
lated to device
> > > > > > migration such as debug etc.
> > > > > > > > > Instead of claiming it as some non_device_migration facil=
ity does not
> > > > > > make sense.
> > > > > > > >
> > > > > > > > It is used for migration for sure.
> > > > > > >
> > > > > > > Well having a generic facility to stop device sounds like a n=
ice thing.
> > > > > > > However the devil is in the detail. A lot of detail here seem=
s very
> > > > > > > much tailored to a very specific implementation in mind.
> > > > > > > So thinking through how it will work e.g. for power managemen=
t would
> > > > > > > be a good excercise to figure out how it should work in detai=
l.
> > > > > >
> > > > > > It might work in the case where there's no PM support in the tr=
ansport. E.g for
> > > > > > MMIO devices.
> > > > > >
> > > > > MMIO should implement PM like other transport. That brings the eq=
uivalency principle.
> > > > >
> > > >
> > > > MMIO are usually platform devices. I don't see the point.
> > > >
> > > > Thanks
> > >
> > > I don't understand what you are saying. Why does it make sense to
> > > suspend individual platform devices when they are suspended
> > > with the whole platform?
> >
> > It is because we don't need to suspend the whole platform to migrate
> > the virtio-MMIO device.
> >
> > Thanks
>
> We were talking about uses beyond migration.

For example, vm stop/cont.

Thanks

>
>
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

