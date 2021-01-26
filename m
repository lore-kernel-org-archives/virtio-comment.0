Return-Path: virtio-comment-return-1675-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A0441986265
	for <virtio-comment@lists.oasis-open.org>; Tue, 26 Jan 2021 14:00:29 +0000 (UTC)
Date: Tue, 26 Jan 2021 14:00:21 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20210126140021.GE250425@stefanha-x1.localdomain>
References: <20210125110823.591104-1-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210125110823.591104-1-cohuck@redhat.com>
Subject: Re: [virtio-comment] [PATCH v3] clarify device reset
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mR8QP4gmHujQHb1c"
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--mR8QP4gmHujQHb1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 12:08:23PM +0100, Cornelia Huck wrote:
> Properly specify that the method for the driver to request a
> device reset is transport specific, and some action the device
> has to take.
>=20
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>=20
> RFC v2 -> v3:
>   - re-worded the "must not send notifications" clause to avoid guessing
>   - added a driver conformance clause on how a driver should find out
>     when reset is complete
> RFC -> RFC v2:
>   - moved reset spec to basic facilities
>=20
> ---
>  conformance.tex |  2 ++
>  content.tex     | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--mR8QP4gmHujQHb1c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAQIHUACgkQnKSrs4Gr
c8jB/Qf+LjDBnp/JtS9PAfdLknzaRzUgWgbHioFBIYRM1MEIJGZDbJ1Xogzk1J7f
N9DUwGcNRMCQjnsTr+d9Nha8XbaYvh4H8TrEOyyGLfs/Iku2iiG1kalvC0kiRsNH
nMjZ7tI9TCPw6XgNouHcV/Tt6LP+mOjSKRt0nYrXLp+FZ+AOfu/1HXqYhpNoHTEW
Ua9NTXqVEUKab6zGrEHkRNMYms3G/BUbYnT4n1HkIDwRSy2eaWgXpESDs54lC64r
cB3+VEAKq8nqUg6ZdvRtIuyVZwWNbVvqfKo3GMSA36NwV4gFvU1aNr+7ZBVhg0Fz
PwsNHQp4x3Z/QZ99ZZP7wDOuylcKTA==
=OOkx
-----END PGP SIGNATURE-----

--mR8QP4gmHujQHb1c--

