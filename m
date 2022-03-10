Return-Path: <stefanha@redhat.com>
Date: Thu, 10 Mar 2022 14:57:28 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Message-ID: <YioR2KrQiy4OP+nD@stefanha-x1.localdomain>
References: <2255414.aXzeqRvSCW@silver>
 <3784027.ryC8PSGgVn@silver>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zu9PNDNPqFWtkaJY"
Content-Disposition: inline
In-Reply-To: <3784027.ryC8PSGgVn@silver>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--zu9PNDNPqFWtkaJY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 05:25:00PM +0100, Christian Schoenebeck wrote:
> @@ -6847,6 +6851,30 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved=
 Feature Bits}
>    that the driver can reset a queue individually.
>    See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqu=
eue Reset}.
> =20
> +  \item[VIRTIO_RING_F_INDIRECT_SIZE(41)] This feature indicates that the
> +  Queue Indirect Size, i.e. the maximum amount of descriptors in indirect
> +  descriptor tables, is independent from the Queue Size.
> +
> +  Without this feature, the Queue Size limits the length of the descript=
or
> +  chain, including indirect descriptor tables as in \ref{sec:Basic Facil=
ities of
> +  a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indire=
ct
> +  Descriptors}, i.e. both the maximum amount of slots in the vring and t=
he
> +  actual bulk data size transmitted per vring slot.
> +
> +  With this feature enabled, the Queue Size only limits the maximum amou=
nt
> +  of slots in the vring, but does not limit the actual bulk data size
> +  being transmitted when indirect descriptors are used. Decoupling these
> +  two configuration parameters this way not only allows much larger bulk=
 data
> +  being transferred per vring slot, but also avoids complicated synchron=
ization
> +  mechanisms if the device only supports a very small amount of vring sl=
ots. Due
> +  to the 16-bit size of a descriptor's "next" field there is still an ab=
solute
> +  limit of $2^{16}$ descriptors per indirect descriptor table. However t=
he
> +  actual maximum amount supported by either device or driver might be le=
ss,
> +  and therefore the bus specific Queue Indirect Size value MUST addition=
ally

s/bus/transport/

Otherwise:
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zu9PNDNPqFWtkaJY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIqEdgACgkQnKSrs4Gr
c8iebQf/XPi0+Axj3sKyTjfB+isd41YyO1YxR+nFv0QkiTjZVpf6fzpaL/h+1qnF
oC1NHb2bD5J1hV7n5iw0S00ITmaImAUjqueTPIDQLJOhzVR7VxN8J6S0HrVgwWkO
jX+W9xjlMIkIRh/ZUbWgWehv1f6xl2aKIguhTNsBLgCnsCa3HgVw7sxVo1tl+SJ8
TSBBFmK/UdbLP7aTLYgxJM6QT4bMqNmLuKjPkc1O2pVhWqAP2I8mQYuxZfAF0YgF
vJkBy6xxagjuWwTSQsjxcUNgRIgFvkVjG5m6oeJ6RYsM22zqhaJq9G+iYHuY4UEf
JgLDRVobHU3127y3/Jc8peVXW/Xfyw==
=ATn9
-----END PGP SIGNATURE-----

--zu9PNDNPqFWtkaJY--

