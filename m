Return-Path: virtio-comment-return-923-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 22D63985E6F
	for <virtio-comment@lists.oasis-open.org>; Wed, 20 Nov 2019 11:10:41 +0000 (UTC)
Date: Wed, 20 Nov 2019 11:10:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20191120111023.GB242924@stefanha-x1.localdomain>
References: <20191120082941.31561-1-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191120082941.31561-1-cohuck@redhat.com>
Subject: Re: [virtio-comment] [PATCH] virtio-net: add missing articles for
 new hdr_len feature
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Vitaly Mireyno <vmireyno@marvell.com>, "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 09:29:41AM +0100, Cornelia Huck wrote:
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>=20
> Note: I have not added definite articles to the feature description; _all=
_
> features for virtio-net are described in that way, and we should add them
> in one go should we decide to change that.
>=20
> ---
>  content.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 5d3f865956aa..452763bbbbc4 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -3100,8 +3100,8 @@ \subsubsection{Packet Transmission}\label{sec:Devic=
e Types / Network Device / De
>    \begin{itemize}
>    \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
>      \field{hdr_len} indicates the header length that needs to be replica=
ted
> -    for each packet. It's a number of bytes from beginning of the packet
> -    to beginning of the transport payload.
> +    for each packet. It's a number of bytes from the beginning of the pa=
cket
> +    to the beginning of the transport payload.

Another opportunity to tweak the text:
s/a number of bytes/the number of bytes/ is slightly clearer

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3VHx8ACgkQnKSrs4Gr
c8hWMQf/XlFXOe8c2q46W0utu5XyT3VmcACCm6AN3NO73Y9CH/sOyMNHRurekMIr
2wubxgDOo+pyYWZHT0AcVKXiXcv9mfHO6lC0XswLNEMk4DYXBeElT/1zv95gaPWV
CWvsdJC3Ez+aqQ3U4nhJGWn9DZHCQ/sWkgc+RvHkWM56AaLifGyIoJkqUaGqTHnt
nf5dl4NY03W7+5DJmB0HOjNmHNIB/WoqRnmSfNIOK0RByLbGPr/b/77UIAX/GGw9
3bgHs/L1wGLyQRmYAIDHTt4d6QJxsGHd0G9quwVEwhcZsR6lPlGLBJbqDBcjB32N
fWl5gspnGY2FEWSAaVH9QH+v4IAZ/w==
=8+Pw
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--

