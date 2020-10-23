Return-Path: virtio-comment-return-1468-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 02789986125
	for <virtio-comment@lists.oasis-open.org>; Fri, 23 Oct 2020 13:48:57 +0000 (UTC)
Date: Fri, 23 Oct 2020 14:48:43 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20201023134843.GC812157@stefanha-x1.localdomain>
References: <20201021135847.15236-1-robert.bradford@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201021135847.15236-1-robert.bradford@intel.com>
Subject: Re: [virtio-comment] [PATCH] content: Reserve virtio-watchog device
 ID
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2/5bycvrmDh4d1IB"
Content-Disposition: inline
To: Rob Bradford <robert.bradford@intel.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--2/5bycvrmDh4d1IB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 02:58:47PM +0100, Rob Bradford wrote:
> Reserve an ID for a watchdog device which may be used to ensure that the
> guest is responsive. This is equivalent of a hardware watchdog device
> and will trigger the reboot of the guest if the the host does not
> periodic ping from the the guest.
>=20
> Signed-off-by: Rob Bradford <robert.bradford@intel.com>
> ---
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--2/5bycvrmDh4d1IB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+S3zsACgkQnKSrs4Gr
c8g72wf7B9madyo/V3M5hs3/wLFtxyOplH1Y04HKI4Lwhm3RCCMeTKEk1gPB9k30
+kofIq+pOY8i8drLyQM8V2obPYcUPq0EUicPOJCk0hckw+fEPtNKRfDVKxL+Vc2s
uL9OSAxfLn4554oHbqgG4rtjrQIj4sNIfW+/Fg1pN+f8SylStdp0GGRV8jXCZ3Qq
32Q8K6NIZtc0TOnF0oK44eN4D2tPiFfHfKQ74yYApCOjkMFyXd/2NLxYRvYomkTt
GJI6DHwy+t/auVJed6QNveuovaRj8dmWpTgUTxsPgPN+us1DnRyTqSPJBJbaN30e
J+FK080E//R8RrsltcsdBsYjxnP2kQ==
=KeDm
-----END PGP SIGNATURE-----

--2/5bycvrmDh4d1IB--

