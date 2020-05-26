Return-Path: virtio-comment-return-1287-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C2A65985A8B
	for <virtio-comment@lists.oasis-open.org>; Tue, 26 May 2020 09:05:55 +0000 (UTC)
Date: Tue, 26 May 2020 10:05:46 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20200526090546.GB766304@stefanha-x1.localdomain>
References: <20200521104942.5440-1-epetre@amazon.com>
MIME-Version: 1.0
In-Reply-To: <20200521104942.5440-1-epetre@amazon.com>
Subject: Re: [virtio-comment] [PATCH 1/1] content: Reserve virtio-nsm device
 ID
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline
To: Petre Eftime <epetre@amazon.com>
Cc: virtio-comment@lists.oasis-open.org, graf@amazon.com
List-ID: <virtio-comment.lists.oasis-open.org>

--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2020 at 01:49:42PM +0300, Petre Eftime wrote:
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
>=20
> diff --git a/content.tex b/content.tex
> index 91735e3..6eee371 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2801,6 +2801,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  31         &   Video decoder device \\
>  \hline
> +0xec2000   &   NitroSecureModule \\

The PCI and CCW transports represent VIRTIO device type IDs with 16-bit
fields. Is there a reason why the NitroSecureModule device should only
work with VIRTIO transports that support >16-bit device type IDs?

If not, then please pick the next low-numbered ID instead.

Stefan

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl7M2+gACgkQnKSrs4Gr
c8iSGQgAq4YFuTM8h4xbUSnUgHPFSj/l9TrJeOQcR58BxZ2H9QYgeSjT7xbIdDhR
MK+HJmWksjo1NHXNAWFCrqE3u2caS8fJA6AFwOEifSwXjubTcPM1Tvozb4v0ZJqZ
hBKl5C34Ts3CsOyaNHfZu4a/IvBvY4dsxbLTXOYfmW+VcRtdhETcuVSkFYaDLvHF
3xGzZtV0xKPbWcyU1dFjnOx9+6Ug0Ak/qhdGv3AERrhF7HhF8t9l5VJM8GDrPnQ8
28SBxw/D80G5+o0XiKRmJf+N/G60bqTTT1a0Mdb5W/ptElpdDUNMbBufPXSvoFkj
9314WeZSav+pIHGo/4O5hx7l+8jxnA==
=+Fvl
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--

