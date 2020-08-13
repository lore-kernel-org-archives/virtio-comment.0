Return-Path: virtio-comment-return-1400-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2011F985D8F
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Aug 2020 12:16:09 +0000 (UTC)
Date: Thu, 13 Aug 2020 13:15:24 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20200813121524.GA6559@stefanha-x1.localdomain>
References: <CAP_G_RUJHvsi1VcP2UGtzp4VoEdWevEOA6X5uA_3TkytHkyYdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_G_RUJHvsi1VcP2UGtzp4VoEdWevEOA6X5uA_3TkytHkyYdw@mail.gmail.com>
Subject: Re: [virtio-comment] multibuffer in packed queue
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline
To: Krasnov Arseniy <oxffffaa@gmail.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2020 at 10:57:52AM +0300, Krasnov Arseniy wrote:
> Hellow, I've got question about chapter 2.7.9:
>=20
> *  2.7.9 Multi-buffer requests Some devices combine multiple buffers as
> part of processing of a single request. These devices always mark the
> descriptor corresponding to the first buffer in the request used after th=
e
> rest of the descriptors (corresponding to rest of the buffers) in the
> request - which follow the first descriptor in ring order - has been mark=
ed
> used and written out into the ring. This guarantees that the driver will
> never observe a partial request in the ring.  *
>=20
> Does it mean, that device can use sequence(chain) of descriptor unil
> descriptor with VIRTQ_DESC_F_NEXT  =3D=3D 0 bit is found, OR device can u=
se
> descriptors as many as it needs, don't care about  VIRTQ_DESC_F_NEXT bit,
> and finally set  VIRTQ_DESC_F_NEXT bit in all used descriptors.

2.7.9 talks about 3 concepts:
1. Requests (highest-level concept)
2. Buffers
3. Descriptors (lowest-level concept)

They are distinct. A request is something like a received packet from a
network card. A buffer is a descriptor chain (1 or more descriptors with
the F_NEXT bit set). A descriptor is a single memory [start, end) range
that the device may read from or write to.

The paragraph descibes how some devices complete one request by
combining multiple buffers. If a 8KB network packet arrives on a NIC and
the driver provided two 4KB buffers consisting of 1 4KB descriptor each
then the device may "merge" those two buffers (see virtio-net for
details). When doing so it must ensure that the first 4KB buffer of the
packet is marked used and written out to the ring *after* the second 4KB
buffer so that the driver sees the beginning of the network packet and
not the second half with the first half missing.

Merging buffers is done at the device type-level (e.g. virtio-net), not
at a virtqueue-level (i.e. core virtio code). The device type must
specify exactly how merging works and device type-specific header fields ar=
e
be used by the device to indicate which buffers have been merged into a
single request (see virtio-net's VIRTIO_NET_F_MRG_RXBUF feature bit and
num_buffers header field).

> Also, in packed queue device can't modify descriptors except USED bit.

No, the device *must* overwrite descriptors in the packed ring. Imagine
a device that completes buffers out-of-order:

1. The driver submits two buffers (F_NEXT is not set because a chain of
   descriptors would make the ASCII diagram more complex) and waits for
   the device:

  | buf#1 !USED LEN=3D4KB | buf#2 !USED LEN=3D4KB |

2. The device completes buf#2 first (1KB of the 4KB descriptor was
   written) and writes the used descriptor to the ring:

  | buf#2 USED LEN=3D1KB | buf#2 !USED LEN=3D4KB |

3. Let's say the driver waits for buf#1 to complete (3KB of the 4KB
   descriptor was written):

  | buf#2 USED LEN=3D1KB | buf#1 USED LEN=3D3KB |

You can see that the ring was overwritten by the device and the
descriptors were modified (e.g. the 4KB avail length was replaced by the
1KB used length value).

> In
> split queue, device also can't modify descriptor(it touches used buffer
> with index and length fields). Is that true?

Yes, the device does not modify split queue descriptors. It only fills
in used ring elements and updates the used ring index.

Stefan

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl81LtUACgkQnKSrs4Gr
c8gyKggAwLCSN0kiM7x3y3yH97UmG3nJUeOvLMIGMRHhDm7dOII8JWY4jBYBLbYc
UCC585/U9o9dBpUBDI0Z0TyVz7eGAisebzyxMyUVPDPLxKkLPWlhODlXnOAkmhwt
2mjclkZn97P49yr/Vsv/qi8lvBHqnomqL3zAmoI802UREp7FLBkzgrJC0bCGz4rn
RWIZhOxaI306VpgtKaKbF/Sbxx+xXuBIsGCzRyGtRxLezBWI964AktYMc+W/Atsn
a3yxzQSy4u2Dm/FmClT/YoOgcxpd4AqcYPw/4wgFUYpifssLtiam6XPbkJf941RN
gd681pCuoG6lHKZcyYOFWkOOgd6LwQ==
=2ZIe
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--

