Return-Path: virtio-comment-return-1180-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 833D2985F3D
	for <virtio-comment@lists.oasis-open.org>; Tue, 14 Apr 2020 10:50:40 +0000 (UTC)
Date: Tue, 14 Apr 2020 11:50:31 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20200414105031.GC127149@stefanha-x1.localdomain>
References: <6774E3D0-4DA4-4CAA-B4D8-370982260E62@amazon.com>
 <20200410100922.wynrrzmbagjsaxd6@steredhat>
MIME-Version: 1.0
In-Reply-To: <20200410100922.wynrrzmbagjsaxd6@steredhat>
Subject: Re: [virtio-comment] Seeking guidance for custom virtIO device
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Content-Disposition: inline
To: "Eftime, Petre" <epetre@amazon.com>
Cc: sgarzare@redhat.com, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 12:09:22PM +0200, Stefano Garzarella wrote:
> Hi,
>=20
> On Fri, Apr 10, 2020 at 09:36:58AM +0000, Eftime, Petre wrote:
> > Hi all,
> >=20
> > I am looking for guidance on how to proceed with regards to either rese=
rving a virtio device ID for a specific device for a particular usecase  or=
 for formalizing a device type that could be potentially used by others.
> >=20
> > We have developed a virtio device that acts as a transport for API call=
s between a guest userspace library and a backend server in the host system=
.
> > Our requirements are:
> > * multiple clients in the guest (multiple servers is not required)
> > * provide an in-order, reliable datagram transport mechanism
> > * datagram size should be either negotiable or large (16k-64k?)
> > * performance is not a big concern for our usecase
>=20
> It looks really close to vsock.
>=20
> >=20
> > The reason why we used a special device and not something else is the f=
ollowing:
> > * vsock spec does not contain a datagram specification (eg. SOCK_DGRAM,=
 SOCK_SEQPACKET) and the effort of updating the Linux driver and other impl=
ementations for this particular purpose=A0=A0seemed relatively high. The pa=
th to approach this problem wasn't clear. Vsock today only works in SOCK_ST=
REAM mode and this is not ideal: the receiver must implement additional sta=
te and buffer incoming data,=A0=A0adding complexity and host resource usage=
.
>=20
> AF_VSOCK itself supports SOCK_DGRAM, but virtio-vsock doesn't provide
> this feature. (vmci provides SOCK_DGRAM support)
>=20
> The changes should not be too intrusive in the virtio-vsock specs and
> implementation, we already have the "type" field in the packet header
> to address this new feature.
>=20
> We also have the credit-mechanism to provide in-order and reliable
> packets delivery.
>=20
> Maybe the hardest part could be change something in the core to handle
> multiple transports that provide SOCK_DGRAM, for nested VMs.
> We already did for stream sockets, but we didn't handle the datagram
> socket for now.
>=20
> I am not sure how convenient it is to have two very similar devices...
>=20
> If you decide to give virtio-vsock a chance to get SOCK_DGRAM, I can try =
to
> give you a more complete list of changes to make. :-)

I although think this sounds exactly like adding SOCK_DGRAM support to
virtio-vsock.

The reason why the SOCK_DGRAM code was dropped from early virtio-vsock
patches is that the prototocol design didn't ensure reliable delivery
semantics.  At that time there were no real users for SOCK_DGRAM so it
was left as a feature to be added later.

The challenge with reusing the SOCK_STREAM credit mechanism for
SOCK_DGRAM is that datagrams are connectionless.  The credit mechanism
consists per-connection state.  Maybe it can be extended to cover
SOCK_DGRAM too.

I would urge you to add SOCK_DGRAM to virtio-vsock instead of trying to
create another device that does basically what is within the scope of
virtio-vsock.  It took quite a bit of time and effort to get AF_VSOCK
support into various software components, and doing that again for
another device is more effort than one would think.

If you don't want to modify the Linux guest driver, then let's just
discuss the device spec and protocol.  Someone else could make the Linux
driver changes.

Stefan

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6VlXcACgkQnKSrs4Gr
c8iDeggAvgzLFz2NGpQfUzuXB+yJ5c6G+S0pIfy28wn2R5EqiVofIbsXrQ4wN0hi
iuKSVApB4orkYV23WBwFRahauK6S6498KwTXEWral/c4uHncrrQKKO4bJcW7kLOd
TzrR4gnPArsqFd2h0FmaQnZC0gkGS8Trqnelv2W5j2x93yIHORg+hPoYq1iWWbPA
937qDUfsCi505pA7WNcZm6GnE0ctgooPoGnVufgMPFEiOdnQZvEiV9p2gV9TGLU/
nOT1y+OEd8e+mz1xDJ4j0MSfyjx2p3lSL77q6lGVSti31Nh2BqYf2bWOS0Wy8qIH
SY0pdSWN6CQvOV2Hv4KeaSor7YmPpg==
=xZUi
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--

