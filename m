Return-Path: virtio-comment-return-1018-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 78212985F7D
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Jan 2020 16:08:31 +0000 (UTC)
Date: Tue, 21 Jan 2020 16:08:18 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20200121160818.GE641751@stefanha-x1.localdomain>
References: <21D64D2457144C4AA23D071E2F6A51EC01592F5BFC@MXS01.open-synergy.com>
 <20200120111648-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200120111648-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] Block Device VIRTIO_BLK_F_RO clarification
 needed.
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UnaWdueM1EBWVRzC"
Content-Disposition: inline
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Damir Shaikhutdinov <Damir.Shaikhutdinov@opensynergy.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--UnaWdueM1EBWVRzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 11:21:36AM -0500, Michael S. Tsirkin wrote:
> On Mon, Jan 20, 2020 at 11:45:05AM +0000, Damir Shaikhutdinov wrote:
> > Hello!
> >=20
> > While reading section 5.2 of the spec, I found that VIRTIO_BLK_F_RO fea=
ture could use
> > some additional clarification regarding handling requests when it was o=
ffered.
> >=20
> > This RO feature is described as "Device is read only" (Section 5.2.3). =
There are some explicit requirements for this feature, but they only descri=
be a "write request".
> >=20
> > 5.2.5 p3 says "If the VIRTIO_BLK_F_RO feature is set by the device, any=
 write requests will fail."
> >=20
> > 5.2.6 says "The type of the request is either a read (VIRTIO_BLK_T_IN),=
 a write (VIRTIO_BLK_T_OUT) ...", so "write request" mentioned in 5.2.5 p3 =
is VIRTIO_BLK_T_OUT.
> >=20
> > 5.2.6.2 says "A device MUST set the status byte to VIRTIO_BLK_S_IOERR f=
or a write request if the VIRTIO_BLK_F_RO
> > feature if offered, and MUST NOT write any data."
> >=20
> > What is missing here is a requirement for features and other types of r=
equests in case of VIRTIO_BLK_F_RO:
> >=20
> > * config.writeback field (guarded by VIRTIO_BLK_F_CONFIG_WCE feature)
> > * VIRTIO_BLK_T_ FLUSH (guarded by VIRTIO_BLK_F_FLUSH feature)
> > * VIRTIO_BLK_T_DISCARD (guarded by VIRTIO_BLK_F_DISCARD feature)
> > * VIRTIO_BLK_T_WRITE_ZEROES (guarded by VIRTIO_BLK_F_WRITE_ZEROES featu=
re)
> >=20
> > Configuration field, requests and features described above make no sens=
e in presence of VIRTIO_BLK_F_RO.
> >=20
> > This can be clarified in several ways, for example:
> >=20
> > 1. Device should not offer CONFIG_WCE, FLUSH, DISCARD and WRITE_ZEROES =
features if it offers RO feature (partially contradicts 5.2.5.2 "Device SHO=
ULD always offer VIRTIO_BLK_F_FLUSH")
> > 2. Device must set the status byte to IOERR for FLUSH, DISCARD and WRIT=
E_ZEROES requests if it offers RO feature.
> >=20
> >=20
> > What do you think about that?
>=20
> I guess flush can even be allowed, it's harmless if nothing is written,
> right?

I agree.  There seems to be no benefit in failing it and there's a small
chance that some drivers could get upset if it fails (typically when a
common code path submits a flush request and expects it to succeed).

> I agree DISCARD and WRITE_ZEROES must fail. And set VIRTIO_BLK_S_IOERR
> I guess?

Yes.

> It's too late to disallow configurations such as a combination of VIRTIO_=
BLK_F_CONFIG_WCE
> and VIRTIO_BLK_F_RO, devices out there might be setting this combination.

Yes.

Stefan

--UnaWdueM1EBWVRzC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4nIfEACgkQnKSrs4Gr
c8iT/gf+JuvQEmQW4VaT2erfJRB60LalmWHS5JT/9w/GWLjf2/pK+JqhM0WT/Hwj
clr3cUnu8J/PccyvoDNsmypmAqnen13xBuO6jKKryvmXETVKju5L6BUSo7l8C0kD
96pIXGAlFtTzXS9Jgni/lWs+pzx4szXDEsJGGu1ZM75VouVx9lSjIQ3XQZZ759Xa
iiQaqA1yC37YHKw3s82QrhTMb0+9n8x+Boss4Y72cYhpgLWwWBIKaGM2LDIdJ6rX
c6WPvx8bE/L7DVAlV4AsjnjnUVAQFsisrAsfQv9CDoQD5yuH6W7n7o7NWcbpcmwW
Ccjc8lywBqPSEZCPQ1aYcGchsYQkNg==
=OTxd
-----END PGP SIGNATURE-----

--UnaWdueM1EBWVRzC--

