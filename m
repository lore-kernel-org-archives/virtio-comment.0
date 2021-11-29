Return-Path: <stefanha@redhat.com>
Date: Mon, 29 Nov 2021 10:13:05 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-comment] [PATCH v2] ccw: clarify device reset
Message-ID: <YaSnsUtJK9EZTiGa@stefanha-x1.localdomain>
References: <20211126114654.425806-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uCZeMvPnF7acq1tQ"
Content-Disposition: inline
In-Reply-To: <20211126114654.425806-1-cohuck@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>


--uCZeMvPnF7acq1tQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 26, 2021 at 12:46:54PM +0100, Cornelia Huck wrote:
> Unlike other transports, a reset triggered by the driver is actually
> complete once the command has been completed. Make this behaviour
> and the requirements more explicit.
>=20
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>=20
> v1->v2: drop channel I/O internals, talk more specificly about virtio res=
et
>=20
> ---
>  conformance.tex |  2 ++
>  content.tex     | 22 +++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--uCZeMvPnF7acq1tQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGkp6wACgkQnKSrs4Gr
c8iMKwf/c+jYL7DkRUwNQobIcUt1WL44Iwrr84WsQiIeAev4HLDvA5J2Ll86+qa+
MW3f1aU3OEa+IinFKIz25xRqM3t1wsrFK5O6ergJme+6WrliGT44LRnWsoB57jrz
VwM94Fkp6blOxCbmIw+z/MvAHm1Zly+kZL5Ji7IYPT8SWkyelaFlB03Bt7m4GuTd
rcN+MMhIlK/+8HPVLlL4R+Cs54kNrk0RPrqND9BSXF+OVMb4FbAwskbhijrvVJTp
NTegTLW193P/VdBK5GvxVjc8nB4z/Bhv95FukmALgPxduHFtjc/OVjykr8Ls5Ydo
TOtlJ9akuUiI1QSuk+3MkpFJ+NK/fA==
=qOR3
-----END PGP SIGNATURE-----

--uCZeMvPnF7acq1tQ--

