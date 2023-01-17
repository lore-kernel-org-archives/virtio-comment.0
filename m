Return-Path: <virtio-comment-return-3861-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9C15F986596
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Jan 2023 16:13:21 +0000 (UTC)
Date: Tue, 17 Jan 2023 11:01:37 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Y8bGYRN69UOv2o29@fedora>
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h7dX2vaWwZuF8LqF"
Content-Disposition: inline
In-Reply-To: <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
Subject: Re: Re: [virtio-comment] About adding a new device type virtio-nvme
To: =?utf-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>
Cc: virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--h7dX2vaWwZuF8LqF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 10:04:07AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
> On Wed, 11 Jan 2023 10:16:55 -0500, Stefan wrote:
>=20
>=20
> >>On Wed, Jan 11, 2023 at 11:21:35AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 w=
rote:
> >> As we know, nvme has more features than virtio-blk. For example, with =
the development of virtualization IO offloading to hardware, virtio-blk and=
 NVME-OF offloading to hardware >are developing rapidly.=C2=A0 So if virtio=
 and nvme are combined into Virtio-NvMe, Is it necessary to add a device ty=
pe Virtio-NvMe ?
>=20
>=20
>=20
> =C2=A0
>=20
>=20
>=20
> >Hi,
> >In theory, yes, virtio-nvme can be done. The question is why do it?
>=20
>=20
>=20
> >NVMe already provides a PCI hardware spec for software and hardware
> >implementations to follow. An NVMe PCI device can be exposed to the
> >guest and modern operating systems recognize it without requiring new
> >drivers.
>=20
>=20
> >The value of VIRTIO here is probably in the deep integration into the
> >virtualization stack with vDPA, vhost, etc. A virtio-nvme device can use
> >all these things whereas a PCI device needs to do everything from
> >scratch.
>=20
>=20
> The NVME technology and ecosystem are complete. However, in virtualizatio=
n scenarios, NVME devices can only use PCIe pass-through . When NVME and vi=
rtio combine to connect to the vDPA ecosystem, live migration is supported.
>=20
>=20
> >Let's not forget that virtio-blk is widely used and new commands are
> >being added as needed. Which NVMe features are you missing in
> >virtio-blk?
>=20
> With the introduction of the concept of DPU, a large number of vendors ar=
e offloading virtual devices to hardware. The back-end of Virtio-blk does n=
ot support remote storage. Therefore, Virtio-Nvme-of can well combine the a=
dvantages of remote storage and virtio live migration

virtio-blk is just a storage interface, whether that storage is local or
remote is up to the device implementation. The block device could be
located on Ceph, NFS, etc.

Each virtio-blk device is a single block device. There is no
standardized management protocol in virtio-blk for connecting to remote
block devices. I'm aware of hardware virtio-blk devices that connect to
remote storage. Configuration is performed through an out-of-band
management interface.

Maybe when you say virtio-blk doesn't support remote storage this is
what you mean?

Stefan

--h7dX2vaWwZuF8LqF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPGxmEACgkQnKSrs4Gr
c8gYUAf/RvEH9HwbSl5BOzx857h0i2d4/RITquOtQ2pECr6A6b7A2Qro0b04pc84
y9Odl//CI+gM28H+flOrOW11e44maFM0KIYtRhw/YFmcd9aPwb46idXHxplWZGVw
clszIPza6zOomIKOBdTJBsdCVlSAZ9gRfXG0//SShK+mXWigjLGxqbwBxOFHVTWZ
Cv80wmotTpMH7BV1dxNNfT2HfjaQLqaObbh2noFDgL+SEu3PaiBH7tpEsNqIdW83
eh5X3zBh13hUw8UEdHQ4ZIffbcmOeBqQ02eysXIQHTKktmr5GPjmdd9Ha2eiROdv
M08aHM1sKGqlxHPQ1GYJsHi+Mfs/8w==
=6iAB
-----END PGP SIGNATURE-----

--h7dX2vaWwZuF8LqF--

