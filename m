Return-Path: virtio-comment-return-1002-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D1FC985CB1
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Jan 2020 15:22:55 +0000 (UTC)
Date: Fri, 3 Jan 2020 15:22:44 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20200103152244.GF277936@stefanha-x1.localdomain>
References: <BN6PR1801MB2067B366EB434CD282F6589BC5270@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN6PR1801MB2067B366EB434CD282F6589BC5270@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: Re: [virtio-comment] [PATCH] virtio-net: Add an optional device
 control over the receive buffers length
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uTRFFR9qmiCqR05s"
Content-Disposition: inline
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--uTRFFR9qmiCqR05s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 30, 2019 at 01:59:17PM +0000, Vitaly Mireyno wrote:
> @@ -2916,6 +2933,15 @@ \subsection{Device configuration layout}\label{sec=
:Device Types / Network Device
>  If the driver negotiates the VIRTIO_NET_F_STANDBY feature, the device MA=
Y act
>  as a standby device for a primary device with the same MAC address.
> =20
> +A driver SHOULD accept the VIRTIO_NET_F_RXBUF_MIN_LEN feature if offered=
.
> +
> +If VIRTIO_NET_F_RXBUF_MIN_LEN feature has been negotiated, the driver MU=
ST
> +set \field{min_rx_buf_len}.
> +
> +A driver MUST NOT modify \field{min_rx_buf_len} once it has been set.

When must the driver set the fields?  I guess it makes no sense to set
this field after starting rx (i.e. populating the rx virtqueue)...  The
spec should be explicit about this.

--uTRFFR9qmiCqR05s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4PXEQACgkQnKSrs4Gr
c8iZkwf/ciDfQ3kDHxz1FRG5GV4tAgOE7Fp2MPRahPOuZ9kL1B7U2cJfITkw08T4
tzB9tW6L4QOhKisdNUafuo7xwQ2+DzOKlYaIZsvW07XyXPhogp/mEW83OI55fr28
CkOQKeXJPAtIjWjS7RphZvaprfFhsgx6LrO/Jj8JhY6ocgaErgbS4S4AlQPAByh6
gLzQVKN+LDSMXoXssjgyNUDMXPoEuME+o/BrJZjgu/azpAgjDwP7+wtxdfPPd3T3
UQRTbGYJp4OZnZCbGvhETYIHhv8q7mGhLpLB0kwy3TbrhNBtLGd/3w6fppkyFR/R
lJGI1q7uHCPikMh2PukXhKMFN2V5EA==
=M+vi
-----END PGP SIGNATURE-----

--uTRFFR9qmiCqR05s--

