Return-Path: virtio-comment-return-785-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 909A8985D40
	for <virtio-comment@lists.oasis-open.org>; Tue,  9 Jul 2019 10:15:08 +0000 (UTC)
Date: Tue, 9 Jul 2019 12:15:02 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190709101502.GA345@stefanha-x1.localdomain>
References: <54DB94AE64EDA14BAB6A1E9641A26B011AE253DE@hasmsx109.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <54DB94AE64EDA14BAB6A1E9641A26B011AE253DE@hasmsx109.ger.corp.intel.com>
Subject: Re: [virtio-comment] VIRTIO_NET_F_MRG_RXBUF number of descriptors
To: "Savir, Gil" <gil.savir@intel.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2019 at 06:35:13AM +0000, Savir, Gil wrote:
> Hi,
>=20
> v1.1 states at Section 5.1.6.3.2 (Device Requirements: Setting Up Receive=
 Buffers):=20
> 	"The device MUST use only a single descriptor if VIRTIO_NET_F_MRG_RXBUF =
was not negotiated."=20
> That's a mistake, since the device can, and should be able to use multipl=
e descriptors, pertaining to the same descriptors chain.
>=20
> Therefore I suggest to change it to:=20
> 	" The device MUST use only a single descriptor-chain if VIRTIO_NET_F_MRG=
_RXBUF was not negotiated."
>=20
> BTW, as result of this wrongly formulated sentence, I came across many pe=
ople (including my-past-self) that confuse MRG_RXBUF feature with descripto=
rs-chain support.
> Fixing it will help avoiding this confusion.=20

Hi Gil,
Perhaps the clearest way of phrasing this is:

  "The device MUST use only a single used buffer if
  VIRTIO_NET_F_MRG_RXBUF was not negotiated."

The "used buffer" terminology comes and is consistent with 2.5
Virtqueues.

Do you agree and would you like to send a patch?

Stefan

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0kaSYACgkQnKSrs4Gr
c8hGbAgAgylGq1aGDaAZyOS9ALe0r8NSLIJ38TuPkq6gpCvDd7fJ1v6eaT2mD5Id
XP6MkwU2jqKGrcUdjhd8DcDzOu5Jpqznh0zbyaMX9V+f8cmPhiLt6rTtDB9SxMlp
eqfzPAMt4utFLFM+CY+AV6F+ql4eHnqWTnAa7HySiXIkrXBuB0MykUPuDJjEjrLy
F4HySKkpSrAdXgzderVSqEZ91TBjuiQ/HW3UknrMSEzLlcAhxT7G31fAeX1VS1AP
F/KhxSQ+qLzR8F5VLJ+nkpI0DZ8TlPYYjn2WP1rjaNIdB/bnwESImdUhoSyQj6F1
kXLAef7Gyg+AcuslJTbpUMX4oLPopw==
=iMJ+
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
