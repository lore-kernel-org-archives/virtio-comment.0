Return-Path: <stefanha@redhat.com>
Date: Thu, 10 Mar 2022 15:04:48 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-comment] [PATCH v2 2/4] Add PCI configuration field
 "queue_indirect_size"
Message-ID: <YioTkIt/VeOAKJd+@stefanha-x1.localdomain>
References: <2255414.aXzeqRvSCW@silver>
 <63288314.T0Av8poOHj@silver>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="19C3BUuiAQ/altnh"
Content-Disposition: inline
In-Reply-To: <63288314.T0Av8poOHj@silver>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--19C3BUuiAQ/altnh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 05:27:10PM +0100, Christian Schoenebeck wrote:
> This new PCI configuration field allows to negotiate a more fine
> graded maximum lenght of indirect descriptor chains.
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  content.tex | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--19C3BUuiAQ/altnh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIqE5AACgkQnKSrs4Gr
c8hamQgAsZKlD9Z9Na/pOHg5DGlbxYE06coqd7MrUlXRRS9PIuL4s5hIyaSLIdGa
BfV+TMLVYJmkha+UI3b9TcPHgeaQLrF7EtJan/mt6LT6En+OkHERE1lk2vJlzbMk
gcVnVGUt4c27vsdhbE8zt9aweVnhKSZAvgqBQWny0NfmQctTqJrgDg1aagQMvwAS
oC7hekvkAL0TtoH43hJbZg8jEeaCmfe034jt4O3BP3+i9sFPrM3q0dPB85YYdXnX
L35+PI6PrpAANM9r3agJMBtqb5cuISNdoTDiqGAH11eXgfj43WRFS6qr/GCNeE2s
pU0dtLSM0vrHIrG/4CMau5/h12Az3g==
=WFyh
-----END PGP SIGNATURE-----

--19C3BUuiAQ/altnh--

