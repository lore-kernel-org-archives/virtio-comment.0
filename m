Return-Path: virtio-comment-return-1182-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EFD52986077
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Apr 2020 10:33:32 +0000 (UTC)
Date: Fri, 17 Apr 2020 11:33:27 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20200417103327.GE9261@stefanha-x1.localdomain>
References: <6774E3D0-4DA4-4CAA-B4D8-370982260E62@amazon.com>
 <20200410100922.wynrrzmbagjsaxd6@steredhat>
 <20200414105031.GC127149@stefanha-x1.localdomain>
 <696c2be6-6a7a-cfe5-91d6-f75d2e74299f@amazon.com>
MIME-Version: 1.0
In-Reply-To: <696c2be6-6a7a-cfe5-91d6-f75d2e74299f@amazon.com>
Subject: Re: [virtio-comment] Seeking guidance for custom virtIO device
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a+b56+3nqLzpiR9O"
Content-Disposition: inline
To: "Eftime, Petre" <epetre@amazon.com>
Cc: sgarzare@redhat.com, graf@amazon.de, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--a+b56+3nqLzpiR9O
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 02:23:48PM +0300, Eftime, Petre wrote:
>=20
> On 2020-04-14 13:50, Stefan Hajnoczi wrote:
> > On Fri, Apr 10, 2020 at 12:09:22PM +0200, Stefano Garzarella wrote:
> > > Hi,
> > >=20
> > > On Fri, Apr 10, 2020 at 09:36:58AM +0000, Eftime, Petre wrote:
> > > > Hi all,
> > > >=20
> > > > I am looking for guidance on how to proceed with regards to either =
reserving a virtio device ID for a specific device for a particular usecase=
  or for formalizing a device type that could be potentially used by others=
.
> > > >=20
> > > > We have developed a virtio device that acts as a transport for API =
calls between a guest userspace library and a backend server in the host sy=
stem.
> > > > Our requirements are:
> > > > * multiple clients in the guest (multiple servers is not required)
> > > > * provide an in-order, reliable datagram transport mechanism
> > > > * datagram size should be either negotiable or large (16k-64k?)
> > > > * performance is not a big concern for our usecase
> > > It looks really close to vsock.
> > >=20
> > > > The reason why we used a special device and not something else is t=
he following:
> > > > * vsock spec does not contain a datagram specification (eg. SOCK_DG=
RAM, SOCK_SEQPACKET) and the effort of updating the Linux driver and other =
implementations for this particular purpose=A0=A0seemed relatively high. Th=
e path to approach this problem wasn't clear. Vsock today only works in SOC=
K_STREAM mode and this is not ideal: the receiver must implement additional=
 state and buffer incoming data,=A0=A0adding complexity and host resource u=
sage.
> > > AF_VSOCK itself supports SOCK_DGRAM, but virtio-vsock doesn't provide
> > > this feature. (vmci provides SOCK_DGRAM support)
> > >=20
> > > The changes should not be too intrusive in the virtio-vsock specs and
> > > implementation, we already have the "type" field in the packet header
> > > to address this new feature.
> > >=20
> > > We also have the credit-mechanism to provide in-order and reliable
> > > packets delivery.
> > >=20
> > > Maybe the hardest part could be change something in the core to handl=
e
> > > multiple transports that provide SOCK_DGRAM, for nested VMs.
> > > We already did for stream sockets, but we didn't handle the datagram
> > > socket for now.
> > >=20
> > > I am not sure how convenient it is to have two very similar devices..=
.
> > >=20
> > > If you decide to give virtio-vsock a chance to get SOCK_DGRAM, I can =
try to
> > > give you a more complete list of changes to make. :-)
> > I although think this sounds exactly like adding SOCK_DGRAM support to
> > virtio-vsock.
> >=20
> > The reason why the SOCK_DGRAM code was dropped from early virtio-vsock
> > patches is that the prototocol design didn't ensure reliable delivery
> > semantics.  At that time there were no real users for SOCK_DGRAM so it
> > was left as a feature to be added later.
> >=20
> > The challenge with reusing the SOCK_STREAM credit mechanism for
> > SOCK_DGRAM is that datagrams are connectionless.  The credit mechanism
> > consists per-connection state.  Maybe it can be extended to cover
> > SOCK_DGRAM too.
> >=20
> > I would urge you to add SOCK_DGRAM to virtio-vsock instead of trying to
> > create another device that does basically what is within the scope of
> > virtio-vsock.  It took quite a bit of time and effort to get AF_VSOCK
> > support into various software components, and doing that again for
> > another device is more effort than one would think.
> >=20
> > If you don't want to modify the Linux guest driver, then let's just
> > discuss the device spec and protocol.  Someone else could make the Linu=
x
> > driver changes.
> >=20
> > Stefan
>=20
>=20
> I think it would be great if we could get the virtio-vsock driver to supp=
ort
> SOCK_DGRAM/SOCK_SEQPACKET as it would make a lot of sense.
>=20
>=20
> But one of the reasons that I don't really like virtio-vsock at the momen=
t
> for my use-case in particular is that it doesn't seem well fitted to supp=
ort
> non-cooperating live-migrateable VMs all that well.=A0 One problem is tha=
t to
> avoid guest-visible disconnections to any service while doing a live
> migration there might be performance impact if using vsock for any other
> reasons.
>=20
> I'll try to exemplify what I mean with this setup:
>=20
> =A0=A0=A0 * workload 1 sends data constantly via an AF_VSOCK SOCK_STREAM
>=20
> =A0=A0=A0 * workload 2 sends commands / gets replies once in a while via =
an
> AF_VSOCK SOCK_SEQPACKET.

af_vsock.ko doesn't support SOCK_SEQPACKET.  Is this what you are
considering adding?

Earlier in this thread I thought we were discussing SOCK_DGRAM, which
has different semantics than SOCK_SEQPACKET.

The good news is that SOCK_SEQPACKET should be easier to add to
net/vmw_vsock than SOCK_DGRAM because the flow control credit mechanism
used for SOCK_STREAM should just work for SOCK_SEQPACKET.

>=20
> Assume the VM needs to be migrated:
>=20
> =A0=A0=A0 =A0=A0=A0 1) If workload 2 currently not processing anything, e=
ven if there
> are some commands for it queued up, everything is fine, VMM can pause the
> guest and serialize.
>=20
> =A0=A0=A0=A0=A0=A0=A0 2) If there's an outstanding command the VMM needs =
to wait for it to
> finish and wait for the receive queue of the request to have enough capac=
ity
> for the reply, but since this capacity is guest driven, this second part =
can
> take a while / forever. This is definitely not ideal.

I think you're describing how to reserve space for control packets so
that the device never has to wait on the driver.

Have you seen the drivers/vhost/vsock.c device implementation?  It has a
strategy for suspending tx queue processing until the rx queue has more
space.  Multiple implementation-specific approaches are possible, so
this isn't in the specification.

> I short, I think workload 2 needs to be in control of its own queues for
> this to work reasonably well, I don't know if sharing ownership of queues
> can work. The device we defined doesn't have this problem: first of all,
> it's on a separate queue, so workload 1 never competes in any way with
> workload 2, and workload 2 always has where to place replies, since it ha=
s
> an attached reply buffer by design.

Flow control in vsock works like this:

1. Data packets are accounted against per-socket buffers and removed
   from the virtqueue immediately.  This allows multiple competing data
   streams to share a single virtqueue without starvation.  It's the
   per-socket buffer that can be exhausted, but that only affects the
   application that isn't reading the socket socket.  The other side
   will stop sending more data when credit is exhausted so that delivery
   can be guaranteed.

2. Control packet replies can be sent in response to pretty much any
   packet.  Therefore, it's necessary to suspend packet processing when
   the other side's virtqueue is full.  This way you don't need to wait
   for them midway through processing a packet.

There is a problem with #2 which hasn't been solved.  If both sides are
operating at N-1 queue capacity (they are almost exhausted), then can we
reach a deadlock where both sides suspend queue processing because they
are waiting for the other side?  This has not been fully investigated or
demonstrated, but it's an area that needs attention sometime.

> Perhaps a good compromise would be to have a multi-queue virtio-vsock or

That would mean we've reached the conclusion that it's impossible to
have bi-directional communication with guaranteed delivery over a shared
communications channel.

virtio-serial did this to avoid having to come up with a scheme to avoid
starvation.

Stefan

--a+b56+3nqLzpiR9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6ZhfcACgkQnKSrs4Gr
c8jpOgf+PF5ix0eSJT4th+7sqGYnHiQ64vGACVDSYcExsUs/8osPoPrXWPMhvDbP
L+8ZrzNFUAPXhDv5UVd5mfuDZIWOX77F7ZKzU7qj7/xgDZX+Cz9qic7glBajpC1m
X0/PxpD+c2dG1Gi4acj/rX58f4MSdSQnfo2X4kEUCx0FGdBzt5Lu01TURlEXyb2t
FtGKCG79FmBJTQm8s5eWnmw7m81o6l/3qy/+t7TGZ1njaztKfUduUGQ7pYC5BwNp
bTM816rsHKY15JdBSNm2zaCaHyVGuj5jgmdcL4UQljfc1yDrhsE4wkR59XOj/uTR
GK8DuUJ2npYTk07+j7zx8H2AuasoFA==
=5Mjy
-----END PGP SIGNATURE-----

--a+b56+3nqLzpiR9O--

