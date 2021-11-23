Return-Path: <virtio-comment-return-2374-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A48298644E
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 Nov 2021 12:47:06 +0000 (UTC)
Date: Tue, 23 Nov 2021 12:46:56 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YZziwE5l8agESw40@stefanha-x1.localdomain>
References: <20211118025741.230748-1-yadong.qi@intel.com>
 <YZYcL6z83ltZ7u23@stefanha-x1.localdomain>
 <BL1PR11MB54797CB8056AFF0D99CFFF4FE39F9@BL1PR11MB5479.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BL1PR11MB54797CB8056AFF0D99CFFF4FE39F9@BL1PR11MB5479.namprd11.prod.outlook.com>
Subject: Re: [virtio-comment] [PATCH] virtio-blk: add secure discard feature
 to specification
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S+HOHkN955n0+/k+"
Content-Disposition: inline
To: "Qi, Yadong" <yadong.qi@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Chen, Luhai" <luhai.chen@intel.com>, "Wang, Kai Z" <kai.z.wang@intel.com>, Jens Axboe <axboe@kernel.dk>
List-ID: <virtio-comment.lists.oasis-open.org>

--S+HOHkN955n0+/k+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 02:33:57AM +0000, Qi, Yadong wrote:
> > > +\item[VIRTIO_BLK_F_SECDISCARD (16)] Device can support secure discar=
d
> > command,
> > > +    share the same maximum discard sectors size and discard segment =
number
> > with
> > > +    VIRTIO_BLK_F_DISCARD. Maximum discard sectors size in
> > > +    \field{max_discard_sectors} and maximum discard segment number i=
n
> > > +    \field{max_discard_seg}.
> >=20
> > Christoph suggested separate queue limits for secdiscard. Please includ=
e this in
> > the spec from the start.
> >=20
> > If the guest operating system does not support that and the secdiscard =
queue
> > limits reported by the device are different from the discard limits, th=
en the driver
> > can disable secdiscard.
> >=20
> > This way virtio-blk is future-proof and can also act as the first Linux=
 driver to use
> > secdiscard queue limits.
> >=20
> Hi, Hajnoczi and Hellwig
> Do you mean to define a new field like {max_secdiscard_sectors} which dif=
fer
> with {max_discard_sectors}?

Yes:
- max_discard_sectors -> max_secdiscard_sectors
- max_discard_seg -> max_secdiscard_seg
- discard_sector_alignment -> secdiscard_sector_alignment

Stefan

--S+HOHkN955n0+/k+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGc4sAACgkQnKSrs4Gr
c8i4gQf/f2MOxOmKP43R+qYBShd6kkCvVOUXm23XAkJbQ6lONWnXiaCtsyXqsqWu
hxh5x6QRvI0wxpItfXZjiAI1jsJabugLaAKdO67XFxKh776YvB4u3NqfwwFFwA69
QFl3mPG6ZAyKDFygP2mQejmNWcTKydvTNWRGuHHWzCOYM78enZenhaIqU/V/DHSI
1b0X5w9zbrWdiyg1NWZlAFhf3/etSeJGK08KdqsOLr160KZL9J0BEGzm3HZyI5GG
D3bkD+kzhwQJGtty46cuO/EsR7Gx5Ek+Wjou97g8IwNXBCf5x1QhItMzUIwDwU06
9SdRdSc7AA66Dhr7r5TwCQdOQXhrpQ==
=u9Ae
-----END PGP SIGNATURE-----

--S+HOHkN955n0+/k+--

