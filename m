Return-Path: <virtio-comment-return-4574-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EFA499865F9
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Feb 2023 21:01:24 +0000 (UTC)
Date: Mon, 27 Feb 2023 16:01:18 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Y/0aHrdDNcyTVdPL@fedora>
References: <CAJ3Dt_XZJX=f-WkbD_wESFLztFyKNW_3TUAPnG-H_SpL6H0YaQ@mail.gmail.com>
 <Yii/ToLoR5t9KFjr@stefanha-x1.localdomain>
 <CAJ3Dt_VTcT64n7bPiRkBBM=SyQWYF1wYYuQr2UnPtZZ-33P9FA@mail.gmail.com>
 <CAC9-NftTiN=g1myoXfqfqUGgvxf+_c_-4+p3zG2sEiXGdStgdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7FvkHaEcXmcIeSjW"
Content-Disposition: inline
In-Reply-To: <CAC9-NftTiN=g1myoXfqfqUGgvxf+_c_-4+p3zG2sEiXGdStgdw@mail.gmail.com>
Subject: Re: Fwd: [virtio-comment] virtio-net : 5.1.6.2 descriptor-chains on
 transmitq
To: Gordon Stewart <gordon@bedrocksystems.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--7FvkHaEcXmcIeSjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 03:27:25PM -0500, Gordon Stewart wrote:
> Hi Stefan,
>=20
> It took us a while to follow-up on this -- apologies.
>=20
> Here's a patch:
>=20
> From: Gordon Stewart <gordon@bedrocksystems.com>
> Date: Mon, 27 Feb 2023 13:59:45 -0500
> Subject: [PATCH] 5.1.6.2 Packet Transmission; clarify "output descriptor"
>=20
> ---
>  device-types/net/description.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

The next step is creating a GitHub Issue, please see
https://github.com/oasis-tcs/virtio-spec/#use-of-github-issues.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--7FvkHaEcXmcIeSjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmP9Gh4ACgkQnKSrs4Gr
c8isxwgAl7KT6d8RUj2uDG+MXVYx6bW86J4mtwCxL+MrcPZnyPFPTH9irTn6H3Wj
LhE8xvoS+fb/dhGXCrHSpbXh21n0bYdsKImNzldPPoN9VxAHavLBNdz2iKfvZcKk
oQce/2K+ruJ/3EbsxUhD4EGztEVljYbh3+dLzu0dqaTJxA0P0YiNSl8gvz1chqIp
T0mpkwGj5Rh2d+W9hb7a4hme4T9A0mFK1ug4irg7FqcM0lHKoSARlzvu/nZbbKlR
1K+IenEBpevD+kIYSzwQFciQOgyufCM6uhxer6HyFBDSAXm9z+66cx9FySG7df/C
AacmBq5CwhuJIcTbkf748otlnOY8AQ==
=bU7O
-----END PGP SIGNATURE-----

--7FvkHaEcXmcIeSjW--

