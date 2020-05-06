Return-Path: virtio-comment-return-1210-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E5AFE985D83
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 May 2020 07:14:48 +0000 (UTC)
Date: Wed, 6 May 2020 09:14:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20200506071442.4s24rvkjt2j56wfz@sirius.home.kraxel.org>
References: <20200422005531.15085-1-gurchetansingh@chromium.org>
 <20200422005531.15085-2-gurchetansingh@chromium.org>
 <20200428102922.ptoppskbs7xhube7@sirius.home.kraxel.org>
 <CAAfnVBneVgQQkGu6H_B6NGkUrEC7QD0o91vzUDTQ1=kyS_tKbw@mail.gmail.com>
 <20200429092830.3p6qc4nsscbz44xu@sirius.home.kraxel.org>
 <CAAfnVBn4WsyLvhMS8mGOJE0gOgYwPCW_r3JBHrtQOQTggrsuiQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVBn4WsyLvhMS8mGOJE0gOgYwPCW_r3JBHrtQOQTggrsuiQ@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, Chia-I Wu <olvaffe@gmail.com>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

  Hi,

> > > The reasoning is since there's no RESOURCE_CREATE_BLOB2D
> > > or RESOURCE_CREATE_BLOB3D, the separation captures that difference in=
 an
> > > explicit API level.  That way, the blob id is only allowed with HOST3=
D.
> >
> > I think we can also simply define "blob id is only allowed virgl=3Don",=
 no
> > need for a separate command.
> >
>=20
> Ack.  Chia's suggestion to possibly only allow GUEST for dumb blobs is al=
so
> reasonable (i.e, no host allocations -- RESOURCE_{MAP, UNMAP}_BLOB are 3D
> only).

Yes, that works too.

> What do you prefer?

I don't mind much.

> > > Ack.  I definitely see the logic behind VIRTIO_GPU_CMD_SET_SCANOUT_BL=
OB,
> > > but current display integration (dpy_gl_scanout_texture(..) in QEMU)
> > > assumes the presence of a GL texture (which can be created from a blo=
b
> > > resource).
> >
> > I have a qemu VIRTIO_GPU_CMD_SET_SCANOUT_BLOB implementation for
> > virgl=3Doff only, covering dumb bo / fbdev as outlined above.
>=20
> Will add VIRTIO_GPU_CMD_SET_SCANOUT_BLOB in v2.  Do you also want
> SCANOUT_FLUSH too?

I think we need that, RESOURCE_FLUSH isn't going to work for resources
without an format attached.

take care,
  Gerd


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

