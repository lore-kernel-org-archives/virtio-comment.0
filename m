Return-Path: virtio-comment-return-1306-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6E5CA98604B
	for <virtio-comment@lists.oasis-open.org>; Thu, 28 May 2020 10:34:37 +0000 (UTC)
Date: Thu, 28 May 2020 11:34:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20200528103429.GA152207@stefanha-x1.localdomain>
References: <20200527090707.75747-1-epetre@amazon.com>
MIME-Version: 1.0
In-Reply-To: <20200527090707.75747-1-epetre@amazon.com>
Subject: Re: [virtio-comment] [PATCH v2] content: Reserve virtio-nsm device ID
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
To: Petre Eftime <epetre@amazon.com>
Cc: virtio-comment@lists.oasis-open.org, graf@amazon.de
List-ID: <virtio-comment.lists.oasis-open.org>

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 12:07:07PM +0300, Petre Eftime wrote:
> The NitroSecureModule is a device with a very stripped down
> Trusted Platform Module functionality, which is used in the
> context of a Nitro Enclave (see https://lkml.org/lkml/2020/4/21/1020)
> to provide boot time measurement and attestation.
>=20
> Since this device provides some critical cryptographic operations,
> there are a series of operations which are required to have guarantees
> of atomicity, ordering and consistency: operations fully succeed or fully
> fail, including when some external events might interfere in the
> process: live migration, crashes, etc; any failure in the critical
> section requires termination of the enclave it is attached to, so
> the device needs to be as resilient as possible, simplicity is
> strongly desired.
>=20
> To account for that, the device and driver are made to have very few
> error cases in the critical path and the operations themselves can be
> rolled back and retried if events happen outside the critical
> area, while processing a request. The driver itself can be made very
> simple and thus is easily portable.
>=20
> Since the requests can be handled directly in the virtio queue, serving
> most requests requires no additional buffering or memory allocations
> on the host side.
>=20
> Signed-off-by: Petre Eftime <epetre@amazon.com>
> ---
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7Pk7UACgkQnKSrs4Gr
c8hFKAf/Q/libu2FzXtz7Hw88NfGB/8KwX7Tu/Wc8Mcp0kWlGg+qgWfLGnfnIBAl
canAtwaePmK9ZL92sR+kdwJzTqM75DDZ7VU2xCn2KiOJU5k+DDI/74Hs8xDrxIWR
nnf0GSJBRgRbUKPyBZbovbxTUd3f4NRpsCWDRlyoIU/J4UFOir5Jb3lbSOZ8QRZ4
0wpAUan0wYa1BN0go0/dXmzHW4G84vRVA+yoy+hlRhEm1AF978DFM/6syEu0uPZb
1NUTE7TdibKM5Rn3+5vXx1z4XsdrhsvYiHL4OEyL3b3uCgMSBoIt2yEn+VGkK76H
JkIk+XCXyyqhEllbjz9d9bOo1754bw==
=hUH4
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

