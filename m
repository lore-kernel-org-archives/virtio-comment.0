Return-Path: virtio-comment-return-1194-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 587CD985E7F
	for <virtio-comment@lists.oasis-open.org>; Wed, 29 Apr 2020 09:28:39 +0000 (UTC)
Date: Wed, 29 Apr 2020 11:28:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20200429092830.3p6qc4nsscbz44xu@sirius.home.kraxel.org>
References: <20200422005531.15085-1-gurchetansingh@chromium.org>
 <20200422005531.15085-2-gurchetansingh@chromium.org>
 <20200428102922.ptoppskbs7xhube7@sirius.home.kraxel.org>
 <CAAfnVBneVgQQkGu6H_B6NGkUrEC7QD0o91vzUDTQ1=kyS_tKbw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVBneVgQQkGu6H_B6NGkUrEC7QD0o91vzUDTQ1=kyS_tKbw@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH 1/2] virtio-gpu: add resource create blob
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: virtio-comment@lists.oasis-open.org, Chia-I Wu <olvaffe@gmail.com>, =?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

  Hi,

> > Do we need separate items (HOSTSYS/HOST3D) for these?  Shouldn't this b=
e
> > a host implementation detail the guest doesn't need to worry about?
>=20
> Yes, separate items are not needed and could indeed be an host
> implementation detail.  Right now, the drm uapi has VIRTGPU_BLOB_MEM_HOST=
 /
> VIRTIO_GPU_BLOB_MEM_HOST_GUEST and the kernel separates to HOST{SYS,3D} a=
nd
> does various checks.
>=20
> https://gitlab.freedesktop.org/virgl/drm-misc-next/-/commit/0ccb47d5150a2=
978d179d0c44ef3285541c8964c
>=20
>=20
> The reasoning is since there's no RESOURCE_CREATE_BLOB2D
> or RESOURCE_CREATE_BLOB3D, the separation captures that difference in an
> explicit API level.  That way, the blob id is only allowed with HOST3D.

I think we can also simply define "blob id is only allowed virgl=3Don", no
need for a separate command.

> A HOST3D blob has no guest memory associated with it, and can only be
> mapped through the shm region.  Even then, a linear (mappable) view of a
> host3d blob may not be possible/desirable -- like shareable device local
> memory, or maybe even a protected content blob.
>=20
> HOST3D_GUEST is always mappable, while HOST3D isn't.

Ok.  So _GUEST postfix means there is a guest shadow and we TRANSFER
data instead of mapping the host resource directly.  Ok, makes sense,
needs a better description in the spec though.

> > > +If VIRTIO_GPU_F_VIRGL is set, both VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3=
D
> > > +and VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D may be used to update the
> > > +resource. There is no restriction on the image/buffer view the drive=
r
> > > +has on the blob resource.
> >
> > I don't think VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D is going to work if
> > the resource has no format attached.  I had a TRANSFER_BLOB command
> > because of that.
> >
>=20
> I was thinking about GL/VK interop here.
>=20
> Say VK allocates the blob resource, but a GL texture is subsequently
> created from the blob resource using GL/VK interop extensions and a forma=
t
> is attached.  For this reason, VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D is
> allowed on blob resources.

Makes sense to allow the old transfer commands for the cases where the
resource has a format attached.

> Similarly, virtgpu_kms always attaches XR24 and AB24 to resources[1], so
> VIRTIO_GPU_CMD_TRANSFER_TO_HOST_2D can be reused if size =3D 4 * width fo=
r
> dumb/sys blob resources (which I think will always be the case?).

If the kernel uses BLOB resources for dumb BOs (so we can have a shared
mapping for them and avoid copying fbdev data) they will not have a
format attached.

Imported dma-bufs (inside the guest) don't have a format attached
either.  With BLOB resources we can support this, but we'll likewise get
a resource without format attached.

So we need ways to work with those resources ...

> Ack.  I definitely see the logic behind VIRTIO_GPU_CMD_SET_SCANOUT_BLOB,
> but current display integration (dpy_gl_scanout_texture(..) in QEMU)
> assumes the presence of a GL texture (which can be created from a blob
> resource).

I have a qemu VIRTIO_GPU_CMD_SET_SCANOUT_BLOB implementation for
virgl=3Doff only, covering dumb bo / fbdev as outlined above.

With virgl=3Don this should be doable too, you only have to create the
texture from the blob resource at SET_SCANOUT_BLOB time (when you know
the format the guest wants scanout), not at resource creation time.

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

