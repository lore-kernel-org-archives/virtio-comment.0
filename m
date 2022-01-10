Return-Path: <stefanha@redhat.com>
Date: Mon, 10 Jan 2022 09:50:44 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v10 2/3] virtio-vsock: add VIRTIO_VSOCK_F_STREAM feature
 bit
Message-ID: <YdwBdOdYnduVwi5i@stefanha-x1.localdomain>
References: <20220105163505.192146-1-sgarzare@redhat.com>
 <20220105163505.192146-3-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JkOMa3xt8DAPmawY"
Content-Disposition: inline
In-Reply-To: <20220105163505.192146-3-sgarzare@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com, arseny.krasnov@kaspersky.com
List-ID: <virtio-comment.lists.oasis-open.org>


--JkOMa3xt8DAPmawY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 05:35:04PM +0100, Stefano Garzarella wrote:
> Initially vsock devices only supported stream sockets, but now
> we are adding support for new types (i.e. SEQPACKET, DGRAM).
>=20
> Since some devices may not want to support stream sockets, we add
> a feature bit for this type.
>=20
> For backward compatibility, if no feature bit is set, only stream
> socket type is supported.
>=20
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  virtio-vsock.tex | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--JkOMa3xt8DAPmawY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHcAXQACgkQnKSrs4Gr
c8gvlAf+JcI7ZoyVlzF5wVCwnLcQZhokLIlGhPTDH2wik2N0IxOIEtSDH3p0D4wQ
M+1MHBiOF6JlL1tM4I0iTVxHzqMDkrND1nW8QuIUb9tsGoXvWvv7y9/O+W6kkOrJ
YLF0lpMdprLBiC+wzEJ3qT9DrcYH++mE6YDN/gHn/e7qz8gdUCkne/ztq5ffbYBc
JR6eIxFufdNwkg/UI91jCSLXh5UXSa7b9aqUEMq7wLzkDhl1/sY/2z22TddJIY+0
u4I7OEkIy/fNOoaNefUTiuc4ZRfLg9N0hN6Pf+UH22zkA46Lt8XUBuA1XzR8oHeR
nOGa17ViWHOf2tNesY260wAtF/WhTw==
=s07+
-----END PGP SIGNATURE-----

--JkOMa3xt8DAPmawY--

