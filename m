Return-Path: virtio-comment-return-1020-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ACCB7985F97
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Jan 2020 10:13:05 +0000 (UTC)
Date: Wed, 22 Jan 2020 10:12:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20200122101214.GA655761@stefanha-x1.localdomain>
References: <21D64D2457144C4AA23D071E2F6A51EC01592F5BFC@MXS01.open-synergy.com>
 <20200120111648-mutt-send-email-mst@kernel.org>
 <20200121160818.GE641751@stefanha-x1.localdomain>
 <20200122005225-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200122005225-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] Block Device VIRTIO_BLK_F_RO clarification
 needed.
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Damir Shaikhutdinov <Damir.Shaikhutdinov@opensynergy.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2020 at 12:53:37AM -0500, Michael S. Tsirkin wrote:
> On Tue, Jan 21, 2020 at 04:08:18PM +0000, Stefan Hajnoczi wrote:
> > On Mon, Jan 20, 2020 at 11:21:36AM -0500, Michael S. Tsirkin wrote:
> > > On Mon, Jan 20, 2020 at 11:45:05AM +0000, Damir Shaikhutdinov wrote:
> > > > Hello!
> > > >=20
> > > > While reading section 5.2 of the spec, I found that VIRTIO_BLK_F_RO=
 feature could use
> > > > some additional clarification regarding handling requests when it w=
as offered.
> > > >=20
> > > > This RO feature is described as "Device is read only" (Section 5.2.=
3). There are some explicit requirements for this feature, but they only de=
scribe a "write request".
> > > >=20
> > > > 5.2.5 p3 says "If the VIRTIO_BLK_F_RO feature is set by the device,=
 any write requests will fail."
> > > >=20
> > > > 5.2.6 says "The type of the request is either a read (VIRTIO_BLK_T_=
IN), a write (VIRTIO_BLK_T_OUT) ...", so "write request" mentioned in 5.2.5=
 p3 is VIRTIO_BLK_T_OUT.
> > > >=20
> > > > 5.2.6.2 says "A device MUST set the status byte to VIRTIO_BLK_S_IOE=
RR for a write request if the VIRTIO_BLK_F_RO
> > > > feature if offered, and MUST NOT write any data."
> > > >=20
> > > > What is missing here is a requirement for features and other types =
of requests in case of VIRTIO_BLK_F_RO:
> > > >=20
> > > > * config.writeback field (guarded by VIRTIO_BLK_F_CONFIG_WCE featur=
e)
> > > > * VIRTIO_BLK_T_ FLUSH (guarded by VIRTIO_BLK_F_FLUSH feature)
> > > > * VIRTIO_BLK_T_DISCARD (guarded by VIRTIO_BLK_F_DISCARD feature)
> > > > * VIRTIO_BLK_T_WRITE_ZEROES (guarded by VIRTIO_BLK_F_WRITE_ZEROES f=
eature)
> > > >=20
> > > > Configuration field, requests and features described above make no =
sense in presence of VIRTIO_BLK_F_RO.
> > > >=20
> > > > This can be clarified in several ways, for example:
> > > >=20
> > > > 1. Device should not offer CONFIG_WCE, FLUSH, DISCARD and WRITE_ZER=
OES features if it offers RO feature (partially contradicts 5.2.5.2 "Device=
 SHOULD always offer VIRTIO_BLK_F_FLUSH")
> > > > 2. Device must set the status byte to IOERR for FLUSH, DISCARD and =
WRITE_ZEROES requests if it offers RO feature.
> > > >=20
> > > >=20
> > > > What do you think about that?
> > >=20
> > > I guess flush can even be allowed, it's harmless if nothing is writte=
n,
> > > right?
> >=20
> > I agree.  There seems to be no benefit in failing it and there's a smal=
l
> > chance that some drivers could get upset if it fails (typically when a
> > common code path submits a flush request and expects it to succeed).
> >=20
> > > I agree DISCARD and WRITE_ZEROES must fail. And set VIRTIO_BLK_S_IOER=
R
> > > I guess?
> >=20
> > Yes.
> >=20
> > > It's too late to disallow configurations such as a combination of VIR=
TIO_BLK_F_CONFIG_WCE
> > > and VIRTIO_BLK_F_RO, devices out there might be setting this combinat=
ion.
> >=20
> > Yes.
> >=20
> > Stefan
>=20
> Thanks! Stefan do you have the time to work on a spec patch to fix this?
> Damir do you?

Damir, you can find instructions for contributing to the virtio
specification here:

https://github.com/oasis-tcs/virtio-spec/

If you don't have time to write a patch please let me know.

Stefan

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4oH/4ACgkQnKSrs4Gr
c8glSQf/YD68d8ftpEkxJAPfMQ2aYqv7QLa51DTeOtXHVlwAohCRY/Y2c9F7tByr
vYUqnE+6hxMA/MxUAWLgPmY/0BdJDlsgAzK+q4TaYw+YYQh83+8VOpx3m9g9p3p4
tZZqlB7vr8Md9ZPPUggQApwODxakoIEYOeIavbctVFgIvT7JIAxto7JqFooLGdt+
qCPMTOEflDJifpe9ch1iLrq+wVBChzciiGOqXx4DBpzikMLwwPO2wNydI5CEGi52
jTA3J8Tw19fThLceLkiMXWSFWAHmDSdM8tN5T3pzqJoeW92/7YUMJ0nMKz//PyYd
LvJ3CwwscKJylBstgrTE1kY40CpefA==
=eADI
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--

