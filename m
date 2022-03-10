Return-Path: <stefanha@redhat.com>
Date: Thu, 10 Mar 2022 15:26:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 4/4] Add CCW configuration field "indirect_num" to
 vq_info_block
Message-ID: <YioYtrSa0rX+nVMZ@stefanha-x1.localdomain>
References: <2255414.aXzeqRvSCW@silver>
 <86604669.MZiAfaG04C@silver>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dfN6Y1/n3wwP9KCt"
Content-Disposition: inline
In-Reply-To: <86604669.MZiAfaG04C@silver>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--dfN6Y1/n3wwP9KCt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 06:01:41PM +0100, Christian Schoenebeck wrote:
> This new CCW configuration field allows to negotiate a more fine
> graded maximum lenght of indirect descriptor chains.
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  content.tex | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/content.tex b/content.tex
> index a3baf4d..d400ea7 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2599,6 +2599,7 @@ \subsubsection{Configuring a Virtqueue}\label{sec:V=
irtio Transport Options / Vir
>          be16 num;
>          be64 driver;
>          be64 device;
> +        be32 indirect_num;
>  };
>  \end{lstlisting}
> =20
> @@ -2607,6 +2608,10 @@ \subsubsection{Configuring a Virtqueue}\label{sec:=
Virtio Transport Options / Vir
>  available area and used area for queue \field{index}, respectively. The =
actual
>  virtqueue size (number of allocated buffers) is transmitted in \field{nu=
m}.
> =20
> +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated then \field{indirect_=
num}
> +reflects the maximum length of indirect descriptor tables for queue
> +\field{index}.

I think the transfer direction of CCW_CMD_SET_VQ struct vq_info_block is
driver-to-device. So it allows the driver to set the Queue Indirect
Size, but how does the driver query the device's maximum Queue Indirect
Size value?

--dfN6Y1/n3wwP9KCt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIqGLYACgkQnKSrs4Gr
c8iUOggArPQI+cha/bGA/aG/QvluQS8tC5s9YqrZ+FP/c19z8z4N44ZyXEDChO73
W/YLkeuFMSgaCJnQ8tanM90dz8qj0CXS+LBv/7qA00GoN4QhimJa4ZyU0FflWn/x
J1r0A11LCkD1BNQMd8bhLKlBpJ0kfL2fnqdLtyjNoPtzlDYimcM9jfRJyuuGGRRJ
aALDudAcBSaq0EpqY0c5g96TeqJl0TnwccG6zV3LopskT5cPS4bOWgNN8pYyvSC4
7FXVfMEyZjlUzSYcg98Yw+utpF6JLcYMCLra4H07gcxZWUKP+WWYfHJsX6YQ0rly
lZmVkmJJKGPbDAChYB4mZOgE5vnR/Q==
=3LQb
-----END PGP SIGNATURE-----

--dfN6Y1/n3wwP9KCt--

