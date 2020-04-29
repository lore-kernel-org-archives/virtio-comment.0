Return-Path: virtio-comment-return-1196-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A3719985E7F
	for <virtio-comment@lists.oasis-open.org>; Wed, 29 Apr 2020 10:06:39 +0000 (UTC)
Date: Wed, 29 Apr 2020 11:06:32 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20200429100632.GA124407@stefanha-x1.localdomain>
References: <6774E3D0-4DA4-4CAA-B4D8-370982260E62@amazon.com>
 <20200410100922.wynrrzmbagjsaxd6@steredhat>
 <20200414105031.GC127149@stefanha-x1.localdomain>
 <696c2be6-6a7a-cfe5-91d6-f75d2e74299f@amazon.com>
 <20200417103327.GE9261@stefanha-x1.localdomain>
 <15906829-2e85-ed4c-7b06-431d6e856ae9@amazon.de>
MIME-Version: 1.0
In-Reply-To: <15906829-2e85-ed4c-7b06-431d6e856ae9@amazon.de>
Subject: Re: [virtio-comment] Seeking guidance for custom virtIO device
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
To: Alexander Graf <graf@amazon.de>
Cc: "Eftime, Petre" <epetre@amazon.com>, sgarzare@redhat.com, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 01:09:16PM +0200, Alexander Graf wrote:
> On 17.04.20 12:33, Stefan Hajnoczi wrote:
> > On Wed, Apr 15, 2020 at 02:23:48PM +0300, Eftime, Petre wrote:
> > > On 2020-04-14 13:50, Stefan Hajnoczi wrote:
> > > > On Fri, Apr 10, 2020 at 12:09:22PM +0200, Stefano Garzarella wrote:
> > > > > Hi,
> > > > >=20
> > > > > On Fri, Apr 10, 2020 at 09:36:58AM +0000, Eftime, Petre wrote:
> > > > > > Hi all,
> > > > > >=20
> > > > > > I am looking for guidance on how to proceed with regards to eit=
her reserving a virtio device ID for a specific device for a particular use=
case  or for formalizing a device type that could be potentially used by ot=
hers.
> > > > > >=20
> > > > > > We have developed a virtio device that acts as a transport for =
API calls between a guest userspace library and a backend server in the hos=
t system.
> > > > > > Our requirements are:
> > > > > > * multiple clients in the guest (multiple servers is not requir=
ed)
> > > > > > * provide an in-order, reliable datagram transport mechanism
> > > > > > * datagram size should be either negotiable or large (16k-64k?)
> > > > > > * performance is not a big concern for our usecase
> > > > > It looks really close to vsock.
> > > > >=20
> > > > > > The reason why we used a special device and not something else =
is the following:
> > > > > > * vsock spec does not contain a datagram specification (eg. SOC=
K_DGRAM, SOCK_SEQPACKET) and the effort of updating the Linux driver and ot=
her implementations for this particular purpose=A0=A0seemed relatively high=
. The path to approach this problem wasn't clear. Vsock today only works in=
 SOCK_STREAM mode and this is not ideal: the receiver must implement additi=
onal state and buffer incoming data,=A0=A0adding complexity and host resour=
ce usage.
> > > > > AF_VSOCK itself supports SOCK_DGRAM, but virtio-vsock doesn't pro=
vide
> > > > > this feature. (vmci provides SOCK_DGRAM support)
> > > > >=20
> > > > > The changes should not be too intrusive in the virtio-vsock specs=
 and
> > > > > implementation, we already have the "type" field in the packet he=
ader
> > > > > to address this new feature.
> > > > >=20
> > > > > We also have the credit-mechanism to provide in-order and reliabl=
e
> > > > > packets delivery.
> > > > >=20
> > > > > Maybe the hardest part could be change something in the core to h=
andle
> > > > > multiple transports that provide SOCK_DGRAM, for nested VMs.
> > > > > We already did for stream sockets, but we didn't handle the datag=
ram
> > > > > socket for now.
> > > > >=20
> > > > > I am not sure how convenient it is to have two very similar devic=
es...
> > > > >=20
> > > > > If you decide to give virtio-vsock a chance to get SOCK_DGRAM, I =
can try to
> > > > > give you a more complete list of changes to make. :-)
> > > > I although think this sounds exactly like adding SOCK_DGRAM support=
 to
> > > > virtio-vsock.
> > > >=20
> > > > The reason why the SOCK_DGRAM code was dropped from early virtio-vs=
ock
> > > > patches is that the prototocol design didn't ensure reliable delive=
ry
> > > > semantics.  At that time there were no real users for SOCK_DGRAM so=
 it
> > > > was left as a feature to be added later.
> > > >=20
> > > > The challenge with reusing the SOCK_STREAM credit mechanism for
> > > > SOCK_DGRAM is that datagrams are connectionless.  The credit mechan=
ism
> > > > consists per-connection state.  Maybe it can be extended to cover
> > > > SOCK_DGRAM too.
> > > >=20
> > > > I would urge you to add SOCK_DGRAM to virtio-vsock instead of tryin=
g to
> > > > create another device that does basically what is within the scope =
of
> > > > virtio-vsock.  It took quite a bit of time and effort to get AF_VSO=
CK
> > > > support into various software components, and doing that again for
> > > > another device is more effort than one would think.
> > > >=20
> > > > If you don't want to modify the Linux guest driver, then let's just
> > > > discuss the device spec and protocol.  Someone else could make the =
Linux
> > > > driver changes.
> > > >=20
> > > > Stefan
> > >=20
> > >=20
> > > I think it would be great if we could get the virtio-vsock driver to =
support
> > > SOCK_DGRAM/SOCK_SEQPACKET as it would make a lot of sense.
> > >=20
> > >=20
> > > But one of the reasons that I don't really like virtio-vsock at the m=
oment
> > > for my use-case in particular is that it doesn't seem well fitted to =
support
> > > non-cooperating live-migrateable VMs all that well.=A0 One problem is=
 that to
> > > avoid guest-visible disconnections to any service while doing a live
> > > migration there might be performance impact if using vsock for any ot=
her
> > > reasons.
> > >=20
> > > I'll try to exemplify what I mean with this setup:
> > >=20
> > >  =A0=A0=A0 * workload 1 sends data constantly via an AF_VSOCK SOCK_ST=
REAM
> > >=20
> > >  =A0=A0=A0 * workload 2 sends commands / gets replies once in a while=
 via an
> > > AF_VSOCK SOCK_SEQPACKET.
> >=20
> > af_vsock.ko doesn't support SOCK_SEQPACKET.  Is this what you are
> > considering adding?
> >=20
> > Earlier in this thread I thought we were discussing SOCK_DGRAM, which
> > has different semantics than SOCK_SEQPACKET.
> >=20
> > The good news is that SOCK_SEQPACKET should be easier to add to
> > net/vmw_vsock than SOCK_DGRAM because the flow control credit mechanism
> > used for SOCK_STREAM should just work for SOCK_SEQPACKET.
> >=20
> > >=20
> > > Assume the VM needs to be migrated:
> > >=20
> > >  =A0=A0=A0 =A0=A0=A0 1) If workload 2 currently not processing anythi=
ng, even if there
> > > are some commands for it queued up, everything is fine, VMM can pause=
 the
> > > guest and serialize.
> > >=20
> > >  =A0=A0=A0=A0=A0=A0=A0 2) If there's an outstanding command the VMM n=
eeds to wait for it to
> > > finish and wait for the receive queue of the request to have enough c=
apacity
> > > for the reply, but since this capacity is guest driven, this second p=
art can
> > > take a while / forever. This is definitely not ideal.
> >=20
> > I think you're describing how to reserve space for control packets so
> > that the device never has to wait on the driver.
> >=20
> > Have you seen the drivers/vhost/vsock.c device implementation?  It has =
a
> > strategy for suspending tx queue processing until the rx queue has more
> > space.  Multiple implementation-specific approaches are possible, so
> > this isn't in the specification.
> >=20
> > > I short, I think workload 2 needs to be in control of its own queues =
for
> > > this to work reasonably well, I don't know if sharing ownership of qu=
eues
> > > can work. The device we defined doesn't have this problem: first of a=
ll,
> > > it's on a separate queue, so workload 1 never competes in any way wit=
h
> > > workload 2, and workload 2 always has where to place replies, since i=
t has
> > > an attached reply buffer by design.
> >=20
> > Flow control in vsock works like this:
> >=20
> > 1. Data packets are accounted against per-socket buffers and removed
> >     from the virtqueue immediately.  This allows multiple competing dat=
a
> >     streams to share a single virtqueue without starvation.  It's the
> >     per-socket buffer that can be exhausted, but that only affects the
> >     application that isn't reading the socket socket.  The other side
> >     will stop sending more data when credit is exhausted so that delive=
ry
> >     can be guaranteed.
> >=20
> > 2. Control packet replies can be sent in response to pretty much any
> >     packet.  Therefore, it's necessary to suspend packet processing whe=
n
> >     the other side's virtqueue is full.  This way you don't need to wai=
t
> >     for them midway through processing a packet.
> >=20
> > There is a problem with #2 which hasn't been solved.  If both sides are
> > operating at N-1 queue capacity (they are almost exhausted), then can w=
e
> > reach a deadlock where both sides suspend queue processing because they
> > are waiting for the other side?  This has not been fully investigated o=
r
> > demonstrated, but it's an area that needs attention sometime.
> >=20
> > > Perhaps a good compromise would be to have a multi-queue virtio-vsock=
 or
> >=20
> > That would mean we've reached the conclusion that it's impossible to
> > have bi-directional communication with guaranteed delivery over a share=
d
> > communications channel.
> >=20
> > virtio-serial did this to avoid having to come up with a scheme to avoi=
d
> > starvation.
>=20
> Let me throw in one more problem:
>=20
> Imagine that we want to have virtio-vsock communication terminated in
> different domains, each of which has ownership of their own device
> emulation.
>=20
> The easiest case where this happens is to have vsock between hypervisor a=
nd
> guest as well as between a PCIe implementation via VFIO and a guest. But =
the
> same can be true for stub domain like setups, where each connection end
> lives in its own stub domain (vhost-user in the vsock case I suppose).
>=20
> In that case, it's impossible to share the one queue we have, no?

By the way, "dedicated virtqueues" could be interesting as a separate
feature.

I just think that SOCK_SEQPACKET should be implemented with flow control
like SOCK_STREAM.

Then, as a separate feature, the device could advertise dedicated
virtqueues allowing SOCK_STREAM and SOCK_SEQPACKET communication
directly in the virtqueue.  The dedicated virtqueue approach should be
faster since it eliminates the need for a memcpy to socket receive
buffers.

Stefan

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6pUagACgkQnKSrs4Gr
c8jjKAf/bwM9cZDolCKK0kTkUG0Hz2XrTRIw2okQ2eD2tZq5FJpTFjvDzO8Hrtm2
MFe4I45maRHbOYdAQrfh3HnuwyLvaEYgxcU9+vqvmYVn5yJvmFCg7d0XN11vJWdD
O2q84b6KxHDAABuZqKyacCP8J5AseGsWeDxH6ovGhPb2nZB+SloW3TA0RTdq+tpQ
DTnmED1+Te4R5F/UyGt0X+w93Sw1Nze85oqLnnOQ/NUs1C//jTav9pPdHidsXA/a
jNAjdObPoZuSXh+lmmGF45kwrOLNxqcqj6F46ZthLqeHKVXK/EMfxZrEz2C7ceVT
GPN9EAyBsDLQMYRLKXbZV7nJQlkrBQ==
=oYj2
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--

