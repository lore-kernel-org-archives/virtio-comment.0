Return-Path: virtio-comment-return-693-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B5C3985E94
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Mar 2019 16:58:43 +0000 (UTC)
Date: Wed, 6 Mar 2019 16:58:36 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190306165836.GB29057@stefanha-x1.localdomain>
References: <CAEkmjvXUGA0m42hnGWkLL2J4YhL7f6=_cW7pzacTG8u8J12j0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline
In-Reply-To: <CAEkmjvXUGA0m42hnGWkLL2J4YhL7f6=_cW7pzacTG8u8J12j0w@mail.gmail.com>
Subject: [virtio-comment] Re: RFC v2: virtio-hostmem: static, guest-owned memory regions
To: Frank Yang <lfy@google.com>
Cc: virtio-comment@lists.oasis-open.org, Roman Kiryanov <rkir@google.com>, "Michael S. Tsirkin" <mst@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Christoffer Dall <christoffer.dall@arm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2019 at 09:57:06AM -0800, Frank Yang wrote:
> +Christopher Dall who has tried to standardize goldfish before.
>=20
> Link:
> https://github.com/741g/virtio-spec/blob/67602f232386a1782a35b9cb41087586=
ac3d19e2/virtio-hostmem.tex

Hi Frank,
I just realized you posted a new revision after replying to your
previous one :).

Why the sub-device model is necessary?

Could you define a concrete VIRTIO device type for your graphics use
case that uses virtqueues for graphics operations?  You can rely on a
Shared Memory Resource for the host<->guest memory sharing of memory
buffers.

Stefan

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEbBAEBAgAGBQJcf/w8AAoJEJykq7OBq3PI6wgH+JF1DbeLarrXqGUNnNzP2Z7f
nLtU63n1cnUyZHgFiHEYij2jhRnD4XLjD4cxNRB0oYzm3U6WmMFpEL+nMvDtH1eP
pXEftgJ3LvwMs3B5bKPmhAztZjgUZ3GxqJe68PHdmzFdX3SyDs2gojG3lMyid/an
kOVOyCxJXeQMw7WoIra7BufOcvPyGAuPkG0Jqm2+4ePDeXdyGIgQkW9J0ijskyob
wz99wEy10VqTpT4eHX7m5utdJdWRykFY0Z8Tx7MP96g+IcjgwCxHNJ3mH58jmdRa
ohGNTMBnPhisQhdd9A5dNkMq86fDuSr1Bz9vFe0kF2rBzomQRwnLtApn342q/A==
=Nm9t
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
