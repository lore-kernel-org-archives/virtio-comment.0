Return-Path: virtio-comment-return-857-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A5919985D49
	for <virtio-comment@lists.oasis-open.org>; Wed,  9 Oct 2019 17:29:23 +0000 (UTC)
Date: Wed, 9 Oct 2019 18:29:20 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20191009172920.GE13568@stefanha-x1.localdomain>
References: <20190923161414.9129-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ns7jmDPpOpCD+GE/"
Content-Disposition: inline
In-Reply-To: <20190923161414.9129-1-eperezma@redhat.com>
Subject: Re: [virtio-comment] [PATCH v2] block: Add multiqueue
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--Ns7jmDPpOpCD+GE/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2019 at 06:14:14PM +0200, Eugenio P=E9rez wrote:
> The spec miss that field. Add the field, some description around.
>=20
> I've followed the network device's multiqueue mentions, and copied /
> adapted when needed.
>=20
> v2: Delete implementation detail about CPUs used.
>=20
> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> ---
>  content.tex | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Please create a GitHub Issue proposing a vote for this patch:
https://github.com/oasis-tcs/virtio-spec/issues/

--Ns7jmDPpOpCD+GE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2eGPAACgkQnKSrs4Gr
c8iVxggAtmE/TKOkgQYdguevwWjUNSyS2fTzeDvQjMPM7nGppyFLbYn9UyfMAp7X
YYwyJBfFEn32FS7FHn0e/MVYo30Ha9D4ycGfi2yIhpNLw3UquZlDyxDWLSEkIYak
1tKujFpYVTclKtAalz3xbYSH6mQhXIVChLs+FhqDYC8TIdSUztwXD7mz5+UKCd6/
RFpmRS0YJ7aIxIeoCmxqpnfBZCKJOQLJr51vO6bqVpzuGFT2JaX/uSJwCLKBhevI
UHTyQiV/902iQoZchXlPPJe7OR2PXy41Zu38YDfnvZKmkxkWcQmmnAq2PpleaWWA
R9BezeowDw5UUfZH9QB7JEF+cVSvTg==
=VcgL
-----END PGP SIGNATURE-----

--Ns7jmDPpOpCD+GE/--
