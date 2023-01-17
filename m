Return-Path: <virtio-comment-return-3862-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C75AD9865CF
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Jan 2023 16:55:29 +0000 (UTC)
Date: Tue, 17 Jan 2023 11:53:23 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Y8bSg9BP7d0HP6Up@fedora>
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>
 <Y77S5+YK31f6QKaN@fedora>
 <E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>
 <Y8bGYRN69UOv2o29@fedora>
 <20230117162114.GA24976@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9ebqRljzrZ/e/kPV"
Content-Disposition: inline
In-Reply-To: <20230117162114.GA24976@lst.de>
Subject: Re: [virtio-comment] About adding a new device type virtio-nvme
To: Christoph Hellwig <hch@lst.de>
Cc: =?utf-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>, virtio-comment <virtio-comment@lists.oasis-open.org>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--9ebqRljzrZ/e/kPV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 05:21:14PM +0100, Christoph Hellwig wrote:
> On Tue, Jan 17, 2023 at 11:01:37AM -0500, Stefan Hajnoczi wrote:
> > Each virtio-blk device is a single block device. There is no
> > standardized management protocol in virtio-blk for connecting to remote
> > block devices. I'm aware of hardware virtio-blk devices that connect to
> > remote storage. Configuration is performed through an out-of-band
> > management interface.
> >=20
> > Maybe when you say virtio-blk doesn't support remote storage this is
> > what you mean?
>=20
> That makes sense, but the same is true of non-fabrics nvme transports
> like nvme-pci and a hypothetical nvme-virtio.

Just to confirm (my NVMe knowledge is not great), "6 Fabrics Command
Set", "5.22 Namespace Attachment command", etc cannot be used over
nvme-pci to connect remote storage if a device supports those commands?

https://nvmexpress.org/wp-content/uploads/NVM-Express-Base-Specification-2.=
0c-2022.10.04-Ratified.pdf

Stefan

--9ebqRljzrZ/e/kPV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPG0oMACgkQnKSrs4Gr
c8i5Zwf+NPdr1vGEUtUi5kKsZF+R+DLbrmKQr9i3DLzQOXVMka+lC2Kfd4NjH6+p
FdwF87Me7llpXmj5I+H+OjPAkpL6tdnfaquVzmxc4W5mcZ/YNDN+Ra+2Anq8wB49
i67nv+yRFW6oY3oRpf5IKQjBnds/7FqT8wLERbTRL2FQ4UzZ/vtLeERwzlSlQoOS
mDmfglmc58VGhJW3VH1bhIfqqW+qfyGWSF4Joi1NKhj07Abkh8aIVyVgRkYzKLle
yKFihGcRsC3bMs+YlO22S7u282JfSWSInVWqD+Lmua8RecFLtBTARqSe6klROeXw
dTVJueucySzc7FgTDYL1cV9Fkbd/XA==
=dmKL
-----END PGP SIGNATURE-----

--9ebqRljzrZ/e/kPV--

