Return-Path: <stefanha@redhat.com>
Date: Thu, 10 Mar 2022 15:23:02 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 3/4] Add MMIO configuration register "QueueIndirectNum"
Message-ID: <YioX1qutTgC7mbmG@stefanha-x1.localdomain>
References: <2255414.aXzeqRvSCW@silver>
 <9973860.0l9H2X46qG@silver>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hGAZlVoaZv6KD7S/"
Content-Disposition: inline
In-Reply-To: <9973860.0l9H2X46qG@silver>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--hGAZlVoaZv6KD7S/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 05:58:48PM +0100, Christian Schoenebeck wrote:
> This new MMIO configuration register allows to negotiate a more fine
> graded maximum lenght of indirect descriptor chains.
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  content.tex | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--hGAZlVoaZv6KD7S/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIqF9YACgkQnKSrs4Gr
c8h1mAgAqM7QMV0bBv2T8TtAwCG57dLgIVZj58dau9uAy8OUTaQ1mOIxC9MZQo4i
NuDG02lz3jvnSEowDAKcu6U0Z19kXM7mSfW4MSP4eIu0DVek3wKCtt9pz8pHuqqB
pFCMqmC5355MIxfxjUa7bXvQcUGcaGw21OuM74QlfbJnA3HQ6fYdPn5zYjPAi1X+
UayIcV2Q+t+QX98BkihvkQEJoFLKVe646+Q6Dk0TCCCNoEnh3nKugdiiQqUDJpUj
TSFUZjhTqukIByKd5wDQRpks0ntc9qnO1shjL0GO8DOY6e1yGockC8WtXE4sVQfG
gCyYaeeRFWn0rSN++UOLXZfE136niA==
=fo/F
-----END PGP SIGNATURE-----

--hGAZlVoaZv6KD7S/--

