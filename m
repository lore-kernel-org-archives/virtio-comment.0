Return-Path: virtio-comment-return-763-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC0B4985A41
	for <virtio-comment@lists.oasis-open.org>; Tue, 25 Jun 2019 07:52:40 +0000 (UTC)
Date: Tue, 25 Jun 2019 08:52:34 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190625075234.GA12603@stefanha-x1.localdomain>
References: <20190625073336.7813-1-ybettan@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <20190625073336.7813-1-ybettan@redhat.com>
Subject: Re: [virtio-comment] [PATCH V2] Added building instruction to
 README.md.
To: mst@redhat.com
Cc: virtio-comment@lists.oasis-open.org, ehabkost@redhat.com, ailan@redhat.com, Yoni Bettan <ybettan@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2019 at 10:33:36AM +0300, Yoni Bettan wrote:
> Signed-off-by: Yoni Bettan <ybettan@redhat.com>
> ---
>  README.md | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/README.md b/README.md
> index 3de0c1e..fc33c9f 100644
> --- a/README.md
> +++ b/README.md
> @@ -29,6 +29,40 @@
>  <div>
> =20
>  <h3>Further Description of this Repository</h3>
> +<h4>Building Instructions</h4>
> +<p>In order to build the spec you will need <a href=3D"https://www.tug.o=
rg/texlive/">Tex-Live</a>.
> +Installing it can be done via:<br>
> +Fedora:
> +<code>
> +sudo dnf install texlive-scheme-full
> +</code><br>
> +Ubuntu:
> +<code>
> +sudo apt-get install texlive-full
> +</code><br></p>
> +<p>The building proccess is done with
> +<code>
> +./makeall.sh
> +</code>
> +and it contains 3 main parts:
> +<code>
> +makezip.sh
> +</code>,
> +<code>
> +makehtml.sh
> +</code>,
> +<code>
> +makepdf.sh
> +</code>.
> +Using
> +<code>
> +./makehtml.sh
> +</code>
> +should be enought if you just want to test your changes since
> +<code>
> +makepdf.sh
> +</code>
> +may required some font packages.</p>

Thanks for adding instructions.  I have hit latex errors in the past
that only happened with makepdf.sh, so ideally everyone should use
makeall.sh.

The font requirement is a real pain.  Can we switch to widely available
free fonts?

Stefan

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0R0sEACgkQnKSrs4Gr
c8hnOAgApbRYGNB3LIqyPipFBakPFWkpuJ0gcYUFioJ3ZZRiEpDKqY8zRoUZGGNy
oikAC9y9p+yxuiu4YNRp0J0QxK6mqc6XLy++qkQfJulCrprxbAzaFhv6uiZvGRff
R0V6VxaI+L4IttBRgu6VeX4Xr4vjuyoL8bZkYig3NU+enDgJEhuBOgvmtnZZmHuw
2q0zY/XzTcRc/NdAM2rCWpuue9ODyswv7ncu4v0Y16HRvMwSk4hZ0CKFIvJ3kCdD
Mv2F0mwHftOuziWxukJ/ENEhQ1+ZEWfQ0vE+aqvxyy/FNRvs3UQIYbBafr/lsxHR
glZCSDzB7HSq09CElA1Y7dMepXxxJg==
=pA7D
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
