Return-Path: <stefanha@redhat.com>
Date: Thu, 10 Mar 2022 15:35:05 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-comment] [PATCH v2 0/4] Add VIRTIO_RING_F_INDIRECT_SIZE
 and queue_indirect_size
Message-ID: <YioaqRcBK51RbIXf@stefanha-x1.localdomain>
References: <2255414.aXzeqRvSCW@silver>
 <3382929.hzA3DnVQDd@silver>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KRVSI2J50fmakn39"
Content-Disposition: inline
In-Reply-To: <3382929.hzA3DnVQDd@silver>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, "Michael S. Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


--KRVSI2J50fmakn39
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2022 at 03:58:56PM +0100, Christian Schoenebeck wrote:
> On Montag, 21. Februar 2022 17:22:18 CET Christian Schoenebeck wrote:
> > This is a follow-up of:
> > [1/2]:
> > https://lists.oasis-open.org/archives/virtio-comment/202112/msg00034.ht=
ml
> > [2/2]:
> > https://lists.oasis-open.org/archives/virtio-comment/202112/msg00035.ht=
ml
> >=20
> > These 4 patches introduce a more fine graded control over the maximum l=
ength
> > of indirect descriptor tables.
> >=20
> > Associated Github Task:
> > https://github.com/oasis-tcs/virtio-spec/issues/122
> >=20
> > Latest Version (all patches):
> > https://github.com/cschoenebeck/virtio-spec/commits/long_indirect_descr
>=20
> Ping.

Sorry for the delay.

This looks very close. I posted a CCW question but it might just be my
lack of familiarity with CCW :).

Stefan

--KRVSI2J50fmakn39
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIqGqkACgkQnKSrs4Gr
c8gIPQf8CFe/9Hb1CPovd02PBFWkV8eTLbpVQ2fHs5q98ZCH05oGWMRNkIz0x9R3
fmdtO3N8C+QuEh8ywfTC64hFZXND9NKUzEHqFcs3iMtETkv7vbtZWtF3XAwnC3Sj
Rti49XIupW7BpO+Ckqy6L5p8wFkwsXBL+K4wQkTl/HrsgIQMdPw7kxFftGtlSiyw
rE3vI+82IQOvqe8s+79andnBs8rgjmiDrIiERdtp2oty5XavM5zRQtimD3FG1Sit
YEw/1AN5fscK4UlOvcrig4e3c0KTghqZfe4gL0hHsOcJbIyrbFZdAf0N8UxVEcgg
hwK9BtXbejVFFzF0lF5ujtzmOV7aeg==
=ZRrl
-----END PGP SIGNATURE-----

--KRVSI2J50fmakn39--

