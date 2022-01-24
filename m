Return-Path: <stefanha@redhat.com>
Date: Mon, 24 Jan 2022 13:08:01 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 1/2] Add VIRTIO_RING_F_INDIRECT_SIZE
Message-ID: <Ye6ksdW5FQtmbhjB@stefanha-x1.localdomain>
References: <cover.1639494803.git.qemu_oss@crudebyte.com>
 <4971f1bee76d664a71d411d8769a23a0d04097e7.1639494803.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IuzNsgk1QusYwB4t"
Content-Disposition: inline
In-Reply-To: <4971f1bee76d664a71d411d8769a23a0d04097e7.1639494803.git.qemu_oss@crudebyte.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--IuzNsgk1QusYwB4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2021 at 04:13:10PM +0100, Christian Schoenebeck wrote:
> This new feature flag allows to decouple the maximum amount of
> descriptors in indirect descriptor tables from the Queue Size.
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  content.tex    | 21 +++++++++++++++++++++
>  split-ring.tex |  2 +-
>  2 files changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/content.tex b/content.tex
> index 5d112af..0aa4842 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -6693,6 +6693,27 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved=
 Feature Bits}
>    transport specific.
>    For more details about driver notifications over PCI see \ref{sec:Virt=
io Transport Options / Virtio Over PCI Bus / PCI-specific Initialization An=
d Device Operation / Available Buffer Notifications}.
> =20
> +  \item[VIRTIO_RING_F_INDIRECT_SIZE(40)] This feature indicates that the

Another feature bit was added in the meantime:

  \item[VIRTIO_F_RING_RESET(40)] This feature indicates
                            ^^

Please use 41 and update the text that says:

  \item[24 to 40] Feature bits reserved for extensions to the queue and
  feature negotiation mechanisms

  \item[41 to 49, and 128 and above] Feature bits reserved for future exten=
sions.

--IuzNsgk1QusYwB4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHupLEACgkQnKSrs4Gr
c8h3/ggAolWn80gyUxzFCnjMYLoGlTnP0UjJCa3c8Q3S2+R+FRJ40ZfS7tdiApVr
ZVT6vbpvF+ihJoxkqEP+ix/7QPUDwAHTBbCkQjWLUxTGmCHtd0cSJtpw6d619SKW
K8pwWqX9VWF6gbh4Dqb3zdIrE75BRW7+BI9UDyIpIsCc+P9YFrKD9IZs7SWxocxX
9o6s3hzq3tmkFepDt1UJZHQ+qLC2EvIqn2a6WiAtBWwKqwrPPpbowdEI7IS9o9do
mIJz5gX+J7ZpCCZTZGAWyzB5UDjNRtJ0LFYi7n2FJXsfFCegqFIxdCZRecxT7frO
bkvTmKU9vJzUffh24JILeAsZAsK7Kw==
=KPKW
-----END PGP SIGNATURE-----

--IuzNsgk1QusYwB4t--

