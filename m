Return-Path: <stefanha@redhat.com>
Date: Tue, 27 Jul 2021 13:24:31 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH v2 2/2] virtio-blk: add support for VIRTIO_F_ADMIN_VQ
Message-ID: <YP/6/5Dw38qXPGHd@stefanha-x1.localdomain>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210726165254.8529-2-mgurtovoy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dGqpLwWvliD42zmj"
Content-Disposition: inline
In-Reply-To: <20210726165254.8529-2-mgurtovoy@nvidia.com>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>


--dGqpLwWvliD42zmj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 26, 2021 at 07:52:54PM +0300, Max Gurtovoy wrote:
> Set the relevant index in case of VIRTIO_F_ADMIN_VQ negotiation. Also
> restrict the negotiation of VIRTIO_F_ADMIN_VQ to be possible only if
> VIRTIO_BLK_F_MQ is negotiated.
>=20
> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> ---
>  content.tex | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/content.tex b/content.tex
> index d350175..03e25da 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -4406,6 +4406,16 @@ \subsection{Virtqueues}\label{sec:Device Types / B=
lock Device / Virtqueues}
>   N=3D1 if VIRTIO_BLK_F_MQ is not negotiated, otherwise N is set by
>   \field{num_queues}.
> =20
> + If VIRTIO_F_ADMIN_VQ is negotiated, queue0 is an admin virtqueue and the
> + request queues are shifted as the following:

"as follows:"

> +\begin{description}
> +\item[1] requestq1
> +\item[\ldots]
> +\item[N] requestqN
> +\end{description}
> +
> + if VIRTIO_BLK_F_MQ is not negotiated, VIRTIO_F_ADMIN_VQ MUST NOT be
> + negotiated.

Why?

--dGqpLwWvliD42zmj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmD/+v8ACgkQnKSrs4Gr
c8j2Kwf6Awll3jgLHaAQP979scNAjS5htpXzU6AWsNbj8tiiKpKWsxyValFc0jhT
+mUmdTgf3cipgfuZWoOGhf+L5hEKteUvuwx/cfGZgXSayZKJuKCnuEoHb6qXyhTj
6aMjKzbHGRh0QfhjI/GE3n5NsMb+trzfFFAYf7xy41x8hVK2yUc7UFvTr+FPHQtW
WpUY2YBR57+2rgLqd8kX0ZlM/aMxFTUmWZDnVSa+xSZwwh7JXtWJlmy/12eIANN7
U4bAnW+Y4vBL1zPLna/eO4K2D4MtfGLI+gz0+Pl4sxqnH5YMEBddJPJ2qJAF1ObV
IND3OxbBH5KmUIzNY1anfHEL8s7m2w==
=xvq1
-----END PGP SIGNATURE-----

--dGqpLwWvliD42zmj--

