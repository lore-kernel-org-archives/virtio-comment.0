Return-Path: <stefanha@redhat.com>
Date: Mon, 29 Nov 2021 10:56:08 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-comment] Re: [PATCH] Add
 VIRTIO_RING_F_LARGE_INDIRECT_DESC
Message-ID: <YaSxyFPWqHs6HUao@stefanha-x1.localdomain>
References: <E1mpa34-0008EK-Di@lizzy.crudebyte.com>
 <YZ5zEwIGpudE8cjB@stefanha-x1.localdomain>
 <3085786.hZH81LJa6W@silver>
 <877dcwjn8n.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cj5KnTMqRZ8qSHHe"
Content-Disposition: inline
In-Reply-To: <877dcwjn8n.fsf@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--cj5KnTMqRZ8qSHHe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 03:58:32PM +0100, Cornelia Huck wrote:
> On Thu, Nov 25 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
>=20
> > On Mittwoch, 24. November 2021 18:14:59 CET Stefan Hajnoczi wrote:
> >> On Fri, Nov 19, 2021 at 02:21:12PM +0100, Christian Schoenebeck wrote:
> >> > This new feature flag allows indirect descriptor tables to
> >> > exceed the queue size.
> >> >=20
> >> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> >> > ---
> >> > Stefan noted that there should also be a numeric configuration field
> >> > reflecting a precise limit of indirect descriptors. The question is =
where
> >> > should that go to exactly? Some devices currently handle this in the=
ir
> >> > device specific configuration space. Wouldn't it make sense to handl=
e that
> >> > in the common configuration space instead?
> >>=20
> >> It could be added as a read-only struct virtio_pci_common_cfg le16
> >> queue_indirect_size field. The same needs to be done for the other
> >> transports.
> >
> > OK, do I have to make it clear that it is an optional field in=20
> > virtio_pci_common_cfg?
>=20
> It would need to be something like "this field only exists if
> VIRTIO_RING_F_LARGE_INDIRECT_DESC has been negotiated".
>=20
> I'm not quite sure how MMIO expresses optional registers.
>=20
> For CCW, it's a bit more complicated: You would need to extend two
> command payloads (vq_config_block and vq_info_block, assuming you want
> to make this read/write); to do that, we will likely want to introduce
> revision 3 (and make the feature bit dependent on revision 3).
>=20
> >
> > Are you sure about read-only? QEMU currently reserves the worst case ex=
pected=20
> > amount of descriptors on stack on every vring entry being processed. If=
 that=20
> > field was read-write instead, and if guest driver never uses the amount=
 of=20
> > descriptors as advertised by host device being support, guest driver co=
uld=20
> > simply lower that value and reduce the pressure on host device.
> >
> > So maybe it would make sense making it read-write with the requirement =
that=20
> > guest driver must not increase the value? In the end that write option =
would=20
> > be a soft feature, device could still ignore it and allocate more, it w=
ouldn't=20
> > hurt IMO and avoids another feature flag being required for this in fut=
ure.
>=20
> I agree, this should be read/write. It's similar to the queue size,
> where the driver may also configure a lower number.

Sounds good.

Stefan

--cj5KnTMqRZ8qSHHe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGkscgACgkQnKSrs4Gr
c8ifOQf8CDgPS/7wfFGNKyHsR6/3UW8ex1a3hJt1iDt2T85//0pAdSjJ0OyP0aoQ
mLwvrSUjeTW5q+xhtIWLJGBcJq7GiWQweaFQpZZm76ABWuNymqQrbWuXufRw3ObM
yWW5dxnLgka2mrlQsFXa5h4YuZ14iyCmm64M7rGn0qUX6M1fgF3zA1HV27BnCNfW
3ybA6e/xGgHTmCpFhosrMnMI3lEK63MYXk/2UcSVpRpXWf7TDS4e+G5e+4mn9ywo
qrbQit5OBk+07wXrQTS3y/5AO6AEeIPhSRTovRQJD5tXnn7Hetf3uxP41xFoCFQ7
Daj/bOJ4SK4RBXFoB5knFw4Vvvm/fg==
=7b8H
-----END PGP SIGNATURE-----

--cj5KnTMqRZ8qSHHe--

