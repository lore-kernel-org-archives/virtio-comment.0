Return-Path: virtio-comment-return-1676-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA2FE98626D
	for <virtio-comment@lists.oasis-open.org>; Tue, 26 Jan 2021 17:06:30 +0000 (UTC)
Date: Tue, 26 Jan 2021 18:06:13 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210126180613.2806dcd5.cohuck@redhat.com>
In-Reply-To: <20210126111431.GC250425@stefanha-x1.localdomain>
References: <20210122102502.90036-1-felipe@nutanix.com>
	<20210126111431.GC250425@stefanha-x1.localdomain>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] content: Fix driver/device wording on
 ISR bits
Content-Type: multipart/signed; boundary="Sig_/l.g26qWvigLDKozU1USdqlp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Felipe Franciosi <felipe@nutanix.com>, virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

--Sig_/l.g26qWvigLDKozU1USdqlp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Jan 2021 11:14:31 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Fri, Jan 22, 2021 at 10:25:02AM +0000, Felipe Franciosi wrote:
> > Section "ISR status capability" incorrectly worded that the bits part o=
f
> > the register allows the device to distinguish between interrupt types.
> > It is the driver that needs access to that distinction, not the device.
> >=20
> > Signed-off-by: Felipe Franciosi <felipe@nutanix.com>
> > ---
> >  content.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-) =20
>=20
> I think this can be merged as a typo fix without a full vote from the
> Technical Committee.
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Indeed; pushed out.

--Sig_/l.g26qWvigLDKozU1USdqlp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw9DWbcNiT/aowBjO3s9rk8bwL68FAmAQTAUACgkQ3s9rk8bw
L68nvQ//U5RDGcbzjdQU+bQGimz2b+8C6zwpxcHuhA1bMbIxC55VoZuF3AxxFGzv
hMOjzWEnWTrWkviV1NeAo3u1zzh3bXEUp3RfvvcenpGIOFqLCD+oAjknE+hSPej6
uOH16OpAWM78SqCp6c7vkWdzQXsxkJraTNulK6eLinFyaOfGC265Gpa4YAMUtM81
ZMIam04k8IXzfeu1YON7aOMuD8JhSu252LJBnJtsT2U1Nw1VWDUF53u/4nbkHads
R2gyLfWVJxh9yJPyonWiEuZwAjUqwv7qCbGIvfba2zvcNTv4U0OfcRwS/BINyMsv
xKf3/8QGklw6O39DbdTi9sffnEa0lLmRI9YOb/ZjrESO7TQLpcaLmwAdqbDz26Nr
EtBpSwsuom8vDRo6vZGq9KyuEQcYN9VMSS+s0y8z8zYV/tWsnLnpVQ+T/rwbNwJD
UHWGugre+QY22N9En1EVSwsCrpKwOw2uF6MVW06rG3wF19BlvbaMoRQmT9U1YuOH
yiI6F9x6Uj5oGzkMEO4Gpi4BHv6NYxFCGL9/TB1KPWjkBjMEcwf2IHNUh8Dd+4WQ
9Jd2+sj0CcpvbiDSHqRNF7LQEY3yPZJa3QDndMw0TP03gCsa2qC8WTs036R71EaI
MBb11W5VAFBSbEzG9jXW0UkZzCV8R6CRkXsZEkzfrG6v8W+3IPA=
=Z3N/
-----END PGP SIGNATURE-----

--Sig_/l.g26qWvigLDKozU1USdqlp--

