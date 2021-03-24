Return-Path: virtio-comment-return-1791-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5705A986580
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 Mar 2021 13:35:05 +0000 (UTC)
Date: Wed, 24 Mar 2021 13:34:26 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YFs/4hcX8nd7h2Jv@stefanha-x1.localdomain>
References: <20210323154840.2504509-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210323154840.2504509-1-arseny.krasnov@kaspersky.com>
Subject: [virtio-comment] Re: [RFC PATCH v4] virtio-vsock: use C style defines for constants
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w+I47P0NEHZk1Xab"
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, Colin Ian King <colin.king@canonical.com>, Jeff Vander Stoep <jeffv@google.com>, Alexander Popov <alex.popov@linux.com>, virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

--w+I47P0NEHZk1Xab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 06:48:36PM +0300, Arseny Krasnov wrote:
> This:
> 1) Replaces enums with C style "defines", because
>    use of enums is not documented, while "defines"
>    are widely used in spec.
> 2) Adds defines for some constants.
>=20
> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
> ---
>  virtio-vsock.tex | 54 +++++++++++++++++++++++++-----------------------
>  1 file changed, 28 insertions(+), 26 deletions(-)

Awesome, thanks!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--w+I47P0NEHZk1Xab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBbP+IACgkQnKSrs4Gr
c8gvYQf8DUv+wnAOw47q93n+H4VFp4xIiDdexFEonxmbOlyGKoakCjknDP9MpZOU
4d27vUEBg5UkvWFRkQIlXRsfi1QICqGqtB8HoSNA12OGryJlRDpmM0zB0BALViHt
CJqBt5E4oELPRHpOJ8xaxa87DQFZCfHxaYpREUq0vzCQ5JMSb+uN1sOc9Uvl2o4w
1KvR1q9pNwi9MUiT0A2JI5YpAWZ773RSCHIfDDdA3T7yYTkppieklLH46uTcG5A6
MruxIRXXPjKmSp2+6nA1h2/1b/BSiwFpmlYOLc9jDyWLXHcExQ4Td8Th/ey+oSA8
IdJT3FrNjZykF7hAfsGyDU5YlLWr3Q==
=6lg0
-----END PGP SIGNATURE-----

--w+I47P0NEHZk1Xab--

