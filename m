Return-Path: virtio-comment-return-1572-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 072BC9865AF
	for <virtio-comment@lists.oasis-open.org>; Fri, 18 Dec 2020 17:29:00 +0000 (UTC)
Date: Fri, 18 Dec 2020 17:28:51 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20201218172851.GD17597@stefanha-x1.localdomain>
References: <20201204054615.26124-1-jasowang@redhat.com>
 <20201217152811.GA24632@stefanha-x1.localdomain>
 <1683d9e0-daa3-e424-c50d-2c1c26a38612@redhat.com>
 <0ad592cb-cc17-cc71-222f-8b2ff80abeb1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0ad592cb-cc17-cc71-222f-8b2ff80abeb1@redhat.com>
Subject: Re: [virtio-comment] [RFC PATCH] virtio-pci: introduce device state
 capability
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 12:58:21PM +0800, Jason Wang wrote:
>=20
> On 2020/12/18 =E4=B8=8A=E5=8D=8811:16, Jason Wang wrote:
> > > >=20
> > > A per-virtqueue stopped state is not enough to stop a device because
> > > some devices have global behavior like config change events. It must =
be
> > > possible to completely stop the device to prevent further activity
> > > (VIRTIO config space changes, interrupts, etc).
> > >=20
> > > Maybe a Device Status register bit can be added for that?
> >=20
> >=20
> > I've considered such case, one of the idea is to introduce a new device
> > status to achieve which seems more generic. Then we need to define a
> > state machine carefully.
>=20
>=20
> So I post another RFC to introduce a new device status bit. Please review=
.

Thanks, that sounds good. I will be offline until January 4th and will
try to catch up then.

Stefan

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/c5tMACgkQnKSrs4Gr
c8hocgf+IIbkq5EN4GZkwF/1HrujsmSX5+on7fySI87pEgi5X2VCWsQ4/CJV12c9
Lywx8vW8DvFublt6GLsRZ9Q84ldZwkxnQILn0mIn9KPGCCrrxCyjg4cehVCd1wMf
m0NSlU/kjqq9uTUsWKyxF1FVNILvZzm5usBW2ID/ca6OZhD+pzIJ70SbO/kzeDr/
plD/JwpIHtQ0OFchssXfMZqOGYMty4EqSJIhi1SCu5ug9+cx5XDy0GeUS3mSigiV
BqgKsOG1eGC4ZBo3kXk1SZz4scrIdblzg0brMeUwBv+ofLTktiMka2ubRLwt0c6V
9m1uOBfjGDNruuf2MP+JJ05tp0L4bw==
=MI+w
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--

