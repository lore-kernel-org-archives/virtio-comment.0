Return-Path: <virtio-comment-return-3927-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 565399863C0
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Jan 2023 20:30:37 +0000 (UTC)
Date: Mon, 30 Jan 2023 15:30:25 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Y9go4eO3I2sGhfDI@fedora>
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <Y8bGYRN69UOv2o29@fedora>
 <20230119064213-mutt-send-email-mst@kernel.org>
 <7E9D0395E3E96E2E+2023012911324146420712@sudoinfotech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sWg+sHkRJ041AMU2"
Content-Disposition: inline
In-Reply-To: <7E9D0395E3E96E2E+2023012911324146420712@sudoinfotech.com>
Subject: Re: Re: [virtio-comment] About adding a new device type virtio-nvme
To: =?utf-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--sWg+sHkRJ041AMU2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 29, 2023 at 11:32:43AM +0800, =E4=BE=AF=E8=8B=B1=E4=B9=90 wrote:
> Thu, 19 Jan 2023 06:42:49 -0500, Michael S. Tsirkin wrote:
>=20
> >On Tue, Jan 17, 2023 at 11:01:37AM -0500, Stefan Hajnoczi wrote:
>=20
> >> > The NVME technology and ecosystem are complete. However, in virtuali=
zation scenarios, NVME devices can only use PCIe pass-through . When NVME a=
nd virtio combine to connect to the vDPA ecosystem, live migration is suppo=
rted.
>=20
> >> >
>=20
> >> >
>=20
> >> > >Let's not forget that virtio-blk is widely used and new commands are
>=20
> >> > >being added as needed. Which NVMe features are you missing in
>=20
> >> > >virtio-blk?
>=20
> >> >
>=20
> >> > With the introduction of the concept of DPU, a large number of vendo=
rs are offloading virtual devices to hardware. The back-end of Virtio-blk d=
oes not support remote storage. Therefore, Virtio-Nvme-of can well combine =
the advantages of remote storage and virtio live migration
>=20
> >>
>=20
> >> virtio-blk is just a storage interface, whether that storage is local =
or
>=20
> >> remote is up to the device implementation. The block device could be
>=20
> >> located on Ceph, NFS, etc.
>=20
> >>
>=20
> >> Each virtio-blk device is a single block device. There is no
>=20
> >> standardized management protocol in virtio-blk for connecting to remote
>=20
> >> block devices. I'm aware of hardware virtio-blk devices that connect to
>=20
> >> remote storage. Configuration is performed through an out-of-band
>=20
> >> management interface.
>=20
> >>
>=20
> >> Maybe when you say virtio-blk doesn't support remote storage this is
>=20
> >> what you mean?
>=20
> >>
>=20
> >> Stefan
>=20
> >
> >=E4=BE=AF=E8=8B=B1=E4=B9=90 you never answered this question.
>=20
>=20
> All the topics revolve around the scenario where the virtio device is off=
loading into the DPU.
> Virtio has a front-end and a back-end. What I mean is that I want to impl=
ement the back-end of Virtio-blk on the DPU.

You can do that today and the underlying storage can be remote.

Can you explain what you mean when you say virtio-blk doesn't support
remote storage?

Stefan

--sWg+sHkRJ041AMU2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPYKOEACgkQnKSrs4Gr
c8hYAgf/R3DR5pYqxZAmvf8OdhTVx/L8jzGb6wUBjbVNf7Xur0u2zvH+6OrboVO+
GXyQYPNwbRBE11tehsR/zSFu1v1nFbvHAjUMaM70fBkuZC/v1yQ76rdHxLlQRyFr
S+p3Xe3JQwzF4UMo9nmpjEGu8WOZAKo16VrB0h5hAnhR8UZhITHm+IXDRgsXRUCP
6PvKRPAH6FE9NvRrShCP4bgZEIkr5I90wKnzPUuz7hCuYXazlLd9lDktQuzjZtmj
/nmyz69ij95mE2dh3//y3clvsYBqypNCV0PXDGcXWjmuZJfIFxk1gXDyv6ZG5f7N
beqWuX0lhRZDMZZ8uyvAAK6TwUiDcw==
=0gQN
-----END PGP SIGNATURE-----

--sWg+sHkRJ041AMU2--

