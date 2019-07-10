Return-Path: virtio-comment-return-787-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4AD30985D6F
	for <virtio-comment@lists.oasis-open.org>; Wed, 10 Jul 2019 05:48:50 +0000 (UTC)
Date: Wed, 10 Jul 2019 07:48:02 +0200
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190710054802.GD3836@stefanha-x1.localdomain>
References: <54DB94AE64EDA14BAB6A1E9641A26B011AE25713@hasmsx109.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3Gf/FFewwPeBMqCJ"
Content-Disposition: inline
In-Reply-To: <54DB94AE64EDA14BAB6A1E9641A26B011AE25713@hasmsx109.ger.corp.intel.com>
Subject: Re: [virtio-comment] RE: VIRTIO_NET_F_MRG_RXBUF number of descriptors
To: "Savir, Gil" <gil.savir@intel.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--3Gf/FFewwPeBMqCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2019 at 08:33:16AM +0000, Savir, Gil wrote:
> In addition I suggest, Section 5.1.6.4 (Processing of Incoming Packets) s=
hould be changed from:
> "
> 1. num_buffers indicates how many descriptors this packet is spread over =
(including this one): this will always be 1 if VIRTIO_NET_F_MRG_RXBUF was n=
ot negotiated. This allows receipt of large packets without having to alloc=
ate large buffers: a packet that does not fit in a single buffer can flow o=
ver to the next buffer, and so on. In this case, there will be at least num=
_buffers used buffers in the virtqueue, and the device chains them together=
 to form a single packet in a way similar to how it would store it in a sin=
gle buffer spread over multiple descriptors. The other buffers will not beg=
in with a struct virtio_net_hdr.
> 2. If num_buffers is one, then the entire packet will be contained within=
 this buffer, immediately following the struct virtio_net_hdr.
> "
>=20
> to
>=20
> "
> 1. num_buffers indicates how many descriptor-chains this packet is spread=
 over (including this one): this will always be 1 if VIRTIO_NET_F_MRG_RXBUF=
 was not negotiated. This allows receipt of large packets without having to=
 allocate large buffers: a packet that does not fit in a single buffer can =
flow over to the next buffer, and so on. In this case, there will be at lea=
st num_buffers used buffers in the virtqueue, and the device merge them tog=
ether to form a single packet. The other buffers will not begin with a stru=
ct virtio_net_hdr.
> 2. If num_buffers is one, then the entire packet will be contained within=
 this descriptors-chain, immediately following the struct virtio_net_hdr.
> "
>=20
> This, in order to prevent more confusion, caused by the use of the word "=
descriptor" interchanging as between descriptor and descriptor-chain.

Please change it to "used buffers" instead of "descriptor-chains" for
consistency with the rest of the specification.

Thanks,
Stefan

--3Gf/FFewwPeBMqCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0lfBIACgkQnKSrs4Gr
c8i21gf/dy6wCMCX1NLd8jgY2JEW1/IUP5TaCff0xD0NR6Up74WQjo9A7zVx5d4j
OFpb53LF/0CapAFk0gY3ygYg8IheZmQ7FwPEU0HXObxu7GSMi9v3x9Pei68ID7Dm
V/XzipnpmQz6Jq01mscejWPsC6YeZISM2lbKougXzfWRd3X2xKjgGWLoAiADzt4y
Yfzj1Hgc2eyZEsQ0wWP+P/fBp9rXrcb9IEA8jiqOvW2lQmD2Ee0S+lWgc9PD1d+G
Huz4hG2u4osLRrHNp5WzK+KPZp1w3Q/Tvc3iY8dKgNURyEFN4xujt/AKXkv7cilQ
VywfJt/PCv9ZiWEffRD5bsFYbFf4Ww==
=5lnV
-----END PGP SIGNATURE-----

--3Gf/FFewwPeBMqCJ--
