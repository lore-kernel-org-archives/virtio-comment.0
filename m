Return-Path: <virtio-comment-return-3125-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8902A9865E9
	for <virtio-comment@lists.oasis-open.org>; Wed, 15 Jun 2022 15:54:14 +0000 (UTC)
Date: Wed, 15 Jun 2022 15:11:40 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YqnonNuBc/WMWha0@stefanha-x1.localdomain>
References: <20220404134931.28697-1-lauralg@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iZtL+H+CSt9XhTS/"
Content-Disposition: inline
In-Reply-To: <20220404134931.28697-1-lauralg@amazon.com>
Subject: Re: [virtio-comment] [PATCH] virtio-vsock: add max payload size
 config field
To: Laura Loghin <lauralg@amazon.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--iZtL+H+CSt9XhTS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 04, 2022 at 04:49:31PM +0300, Laura Loghin wrote:
> @@ -57,6 +62,35 @@ \subsection{Device configuration layout}\label{sec:Dev=
ice Types / Socket Device
>  \hline
>  \end{tabular}
> =20
> +The following driver-read-only field, \field{data_max_size} only exists =
if
> +VIRTIO_VSOCK_F_SIZE_MAX is set. This field specifies the maximum packet =
payload
> +size for the driver to use.

This wording can be misinterpreted but can be kept for now. This wording
should be updated when the next field is added in the future, indicating
that the field is only *used* when VIRTIO_VSOCK_F_SIZE_MAX has been
negotiated. Further fields will be located after data_max_size so the
field certainly *exists* even when VIRTIO_VSOCK_F_SIZE_MAX is not set.

If someone misinterprets this they might think the config struct layout
depends on the combination of negotiated feature bits. That's not the
case, the layout is always the same. The size of the struct depends on
the features offered by the device.

Similar wording is used elsewhere in the spec, so we may want to clarify
it for the entire spec.

Stefan

--iZtL+H+CSt9XhTS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKp6JwACgkQnKSrs4Gr
c8ieHAgAvixIwDxqB2sDBaEbAzaT1xe3xHJYiNjsEz2lIe+Z8fLa7zLn9P5XRUK4
DZOj5GacNqkPaEGD39lqgbq3wz5XQJ0jHOqPFTweVj1OK+N2KvpUWN+4Uk9/CuIR
Iul8X5/4ZvCvtybIqoHzeOl+3428iv/dhbCqJpqdnuoIz63cnzkj89UCO82lCxev
AnV18nVSXI7rplL1JTbsOtcopZg7HqjdqFcbw9524zaD8fHmgnPcTjpW3g0gaVL2
7jxNdyeCxOOO1pC32OOTaK0KPgkApfhq7FanfNkIJHVp2TWaQHA2zvmnapEbh5Cr
7ay9lqDLmIQw9DckQEdSGogeRsbrUg==
=wPm/
-----END PGP SIGNATURE-----

--iZtL+H+CSt9XhTS/--

