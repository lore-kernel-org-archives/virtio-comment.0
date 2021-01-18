Return-Path: virtio-comment-return-1642-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 324AF985D30
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Jan 2021 16:34:26 +0000 (UTC)
Date: Mon, 18 Jan 2021 16:34:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20210118163419.GB255498@stefanha-x1.localdomain>
References: <20210114212059.3822-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210114212059.3822-1-alex.bennee@linaro.org>
Subject: Re: [virtio-comment] [PATCH] virtio-gpu.tex: fix some UTF-8 damage
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 09:20:59PM +0000, Alex Benn=E9e wrote:
> While building I got a warning about:
>=20
>   ! Package utf8x Error: MalformedUTF-8sequence.
>=20
> Fixes: 87fa6b5 ("virtio-gpu: add support for mapping/unmapping blob resou=
rces")
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  virtio-gpu.tex | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/virtio-gpu.tex b/virtio-gpu.tex
> index 8225db6..a6afeda 100644
> --- a/virtio-gpu.tex
> +++ b/virtio-gpu.tex
> @@ -660,11 +660,11 @@ \subsubsection{Device Operation: controlq (3d)}\lab=
el{sec:Device Types / GPU Dev
>          le64 offset;
>  };
> =20
> -#define VIRTIO_GPU_MAP_CACHE_MASK =A0 =A0 =A00x0f
> +#define VIRTIO_GPU_MAP_CACHE_MASK      0x0f

For anyone wondering what the issue was:

  $ hexdump -C
  00000020  53 4b 20 c2 a0 20 c2 a0  20 c2 a0 30 78 30 66 0a  |SK .. .. ..0=
x0f.|

The 0xc2 and 0xa0 bytes are being removed, leaving just the ASCI SPACE
(0x20) characters.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAFuIsACgkQnKSrs4Gr
c8gS3wgAh93iZPkqUfw5R0ekf2UqN3yrDvKaY5/FO8/VnBWwpzE1ooTdBqwZPPeE
Y4too6f9R6gV6cGipG0f20Ef074nc8BI4qGj2mC2TqjoUSGtGDfzvI1PqPDfVjnm
YBqZiP6SLoEQMYqxd3QoPdjAufFBVVNISticHPoeOYbXSan0kM8vjfLaN2MgtbCJ
J3kZOY/Ry2sU9TuKZfARPgjo9jOewgyrO7mynsR7icsFIr9KBUZ9kMfXMPzUK7h/
EevAWgP0NcDDleAUcgWkEjzpr5kZ/vzADmt60IdWPwacnWtraNOLaNI7/3RGBPWp
EhLGS64aCHe80n0oZw6UNn4b1DfUSQ==
=VzG1
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--

