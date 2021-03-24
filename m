Return-Path: virtio-comment-return-1788-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 476F1986574
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 Mar 2021 09:35:59 +0000 (UTC)
Date: Wed, 24 Mar 2021 09:35:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YFsH9/VKi5mr0Ssc@stefanha-x1.localdomain>
References: <20210322034717.35135-1-jasowang@redhat.com>
 <20210322034717.35135-2-jasowang@redhat.com>
 <YFnCpdO4F9zkTjd9@stefanha-x1.localdomain>
 <be5b2622-f676-ddf0-2261-837e348c8a96@redhat.com>
MIME-Version: 1.0
In-Reply-To: <be5b2622-f676-ddf0-2261-837e348c8a96@redhat.com>
Subject: Re: [virtio-comment] [PATCH V2 1/2] virtio: introduce virtqueue
 state as basic facility
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+w/ASKUWCUgkf1NS"
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--+w/ASKUWCUgkf1NS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 04:15:55PM +0800, Jason Wang wrote:
> =E5=9C=A8 2021/3/23 =E4=B8=8B=E5=8D=886:27, Stefan Hajnoczi =E5=86=99=E9=
=81=93:
> > On Mon, Mar 22, 2021 at 11:47:16AM +0800, Jason Wang wrote:
> > > +
> > > +\devicenormative{\subsection}{Virtqueue State}{Basic Facilities of a=
 Virtio Device / Virtqueue State}
> > > +
> > > +If VIRTIO_F_QUEUE_STATE has been negotiated, a device MUST NOT clear
> > > +the queue state upon reset and MUST reset the queue state when the
> > > +driver sets ACKNOWLEDGE status bit.
> > I only see normative sections mentioning getting the virtqueue state bu=
t
> > not setting it. Please explain how setting works.
>=20
>=20
> You mean the device normative part? I think the description of avail stat=
e
> and used state can explain itself. Or I miss something?

Oops, I missed the earlier normative section that says the driver must
set the virtqueue state after FEATURES_OK but before DRIVER_OK.

When re-reading I noticed that there is a typo: s/FEATURE_OK/FEATURES_OK/.

Stefan

--+w/ASKUWCUgkf1NS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBbB/YACgkQnKSrs4Gr
c8g/swf6ArJH+LRHJLTVBfcnv3fQXVcYEW732Hw++qJGw3sFl1iTsK1X9noGsrzV
bEQvDbfArxXyy7GKZqDRhlrYHsH77BLPWuLzDiaMkpLqa45KOiZu91oxPGa7KuDH
J60jyxugxSaReaoAzFjWSABMmLM1OtdbWLH4Hj4n1S4P14RKFLQ31MprIdEz4rZ2
t78k4kGtxsYTcljAyDBrgRgotjXTA7RmdJwV2hirxUIEM3I1ogK/7+zSs6I7a2wI
Qr/hQ+Zu5+dc6WUomdFOvoIuVIH4kBCRfjJxeJZBcCCwauMVM8D8IHPDH2lS69zg
O2cUzFN7gOtwDlDlOT9OAuD+S1c+7A==
=cGGb
-----END PGP SIGNATURE-----

--+w/ASKUWCUgkf1NS--

