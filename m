Return-Path: virtio-comment-return-1187-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D23C985EC2
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Apr 2020 08:40:18 +0000 (UTC)
Date: Wed, 22 Apr 2020 10:40:08 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20200422084008.jwcesb22ciuyqah7@steredhat>
References: <6774E3D0-4DA4-4CAA-B4D8-370982260E62@amazon.com>
 <20200410100922.wynrrzmbagjsaxd6@steredhat>
 <20200414105031.GC127149@stefanha-x1.localdomain>
 <696c2be6-6a7a-cfe5-91d6-f75d2e74299f@amazon.com>
 <20200417103327.GE9261@stefanha-x1.localdomain>
 <15906829-2e85-ed4c-7b06-431d6e856ae9@amazon.de>
 <20200421093741.jdjtcxbpwynarmrt@steredhat>
 <a26e9938-49c6-6b63-bb4a-6ba582af3d40@amazon.de>
MIME-Version: 1.0
In-Reply-To: <a26e9938-49c6-6b63-bb4a-6ba582af3d40@amazon.de>
Subject: Re: [virtio-comment] Seeking guidance for custom virtIO device
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Alexander Graf <graf@amazon.de>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "Eftime, Petre" <epetre@amazon.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Apr 21, 2020 at 09:22:34PM +0200, Alexander Graf wrote:
>=20
>=20
> On 21.04.20 11:37, Stefano Garzarella wrote:
> >=20
> >=20
> >=20
> > On Fri, Apr 17, 2020 at 01:09:16PM +0200, Alexander Graf wrote:
> > >=20
> > >=20
> > > On 17.04.20 12:33, Stefan Hajnoczi wrote:
> > > > On Wed, Apr 15, 2020 at 02:23:48PM +0300, Eftime, Petre wrote:
> > > > >=20
> > > > > On 2020-04-14 13:50, Stefan Hajnoczi wrote:
> > > > > > On Fri, Apr 10, 2020 at 12:09:22PM +0200, Stefano Garzarella wr=
ote:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > On Fri, Apr 10, 2020 at 09:36:58AM +0000, Eftime, Petre wrote=
:
> > > > > > > > Hi all,
> > > > > > > >=20
> > > > > > > > I am looking for guidance on how to proceed with regards to=
 either reserving a virtio device ID for a specific device for a particular=
 usecase  or for formalizing a device type that could be potentially used b=
y others.
> > > > > > > >=20
> > > > > > > > We have developed a virtio device that acts as a transport =
for API calls between a guest userspace library and a backend server in the=
 host system.
> > > > > > > > Our requirements are:
> > > > > > > > * multiple clients in the guest (multiple servers is not re=
quired)
> > > > > > > > * provide an in-order, reliable datagram transport mechanis=
m
> > > > > > > > * datagram size should be either negotiable or large (16k-6=
4k?)
> > > > > > > > * performance is not a big concern for our usecase
> > > > > > > It looks really close to vsock.
> > > > > > >=20
> > > > > > > > The reason why we used a special device and not something e=
lse is the following:
> > > > > > > > * vsock spec does not contain a datagram specification (eg.=
 SOCK_DGRAM, SOCK_SEQPACKET) and the effort of updating the Linux driver an=
d other implementations for this particular purpose  seemed relatively high=
. The path to approach this problem wasn't clear. Vsock today only works in=
 SOCK_STREAM mode and this is not ideal: the receiver must implement additi=
onal state and buffer incoming data,  adding complexity and host resource u=
sage.
> > > > > > > AF_VSOCK itself supports SOCK_DGRAM, but virtio-vsock doesn't=
 provide
> > > > > > > this feature. (vmci provides SOCK_DGRAM support)
> > > > > > >=20
> > > > > > > The changes should not be too intrusive in the virtio-vsock s=
pecs and
> > > > > > > implementation, we already have the "type" field in the packe=
t header
> > > > > > > to address this new feature.
> > > > > > >=20
> > > > > > > We also have the credit-mechanism to provide in-order and rel=
iable
> > > > > > > packets delivery.
> > > > > > >=20
> > > > > > > Maybe the hardest part could be change something in the core =
to handle
> > > > > > > multiple transports that provide SOCK_DGRAM, for nested VMs.
> > > > > > > We already did for stream sockets, but we didn't handle the d=
atagram
> > > > > > > socket for now.
> > > > > > >=20
> > > > > > > I am not sure how convenient it is to have two very similar d=
evices...
> > > > > > >=20
> > > > > > > If you decide to give virtio-vsock a chance to get SOCK_DGRAM=
, I can try to
> > > > > > > give you a more complete list of changes to make. :-)
> > > > > > I although think this sounds exactly like adding SOCK_DGRAM sup=
port to
> > > > > > virtio-vsock.
> > > > > >=20
> > > > > > The reason why the SOCK_DGRAM code was dropped from early virti=
o-vsock
> > > > > > patches is that the prototocol design didn't ensure reliable de=
livery
> > > > > > semantics.  At that time there were no real users for SOCK_DGRA=
M so it
> > > > > > was left as a feature to be added later.
> > > > > >=20
> > > > > > The challenge with reusing the SOCK_STREAM credit mechanism for
> > > > > > SOCK_DGRAM is that datagrams are connectionless.  The credit me=
chanism
> > > > > > consists per-connection state.  Maybe it can be extended to cov=
er
> > > > > > SOCK_DGRAM too.
> > > > > >=20
> > > > > > I would urge you to add SOCK_DGRAM to virtio-vsock instead of t=
rying to
> > > > > > create another device that does basically what is within the sc=
ope of
> > > > > > virtio-vsock.  It took quite a bit of time and effort to get AF=
_VSOCK
> > > > > > support into various software components, and doing that again =
for
> > > > > > another device is more effort than one would think.
> > > > > >=20
> > > > > > If you don't want to modify the Linux guest driver, then let's =
just
> > > > > > discuss the device spec and protocol.  Someone else could make =
the Linux
> > > > > > driver changes.
> > > > > >=20
> > > > > > Stefan
> > > > >=20
> > > > >=20
> > > > > I think it would be great if we could get the virtio-vsock driver=
 to support
> > > > > SOCK_DGRAM/SOCK_SEQPACKET as it would make a lot of sense.
> > > > >=20
> > > > >=20
> > > > > But one of the reasons that I don't really like virtio-vsock at t=
he moment
> > > > > for my use-case in particular is that it doesn't seem well fitted=
 to support
> > > > > non-cooperating live-migrateable VMs all that well.  One problem =
is that to
> > > > > avoid guest-visible disconnections to any service while doing a l=
ive
> > > > > migration there might be performance impact if using vsock for an=
y other
> > > > > reasons.
> > > > >=20
> > > > > I'll try to exemplify what I mean with this setup:
> > > > >=20
> > > > >       * workload 1 sends data constantly via an AF_VSOCK SOCK_STR=
EAM
> > > > >=20
> > > > >       * workload 2 sends commands / gets replies once in a while =
via an
> > > > > AF_VSOCK SOCK_SEQPACKET.
> > > >=20
> > > > af_vsock.ko doesn't support SOCK_SEQPACKET.  Is this what you are
> > > > considering adding?
> > > >=20
> > > > Earlier in this thread I thought we were discussing SOCK_DGRAM, whi=
ch
> > > > has different semantics than SOCK_SEQPACKET.
> > > >=20
> > > > The good news is that SOCK_SEQPACKET should be easier to add to
> > > > net/vmw_vsock than SOCK_DGRAM because the flow control credit mecha=
nism
> > > > used for SOCK_STREAM should just work for SOCK_SEQPACKET.
> > > >=20
> > > > >=20
> > > > > Assume the VM needs to be migrated:
> > > > >=20
> > > > >           1) If workload 2 currently not processing anything, eve=
n if there
> > > > > are some commands for it queued up, everything is fine, VMM can p=
ause the
> > > > > guest and serialize.
> > > > >=20
> > > > >           2) If there's an outstanding command the VMM needs to w=
ait for it to
> > > > > finish and wait for the receive queue of the request to have enou=
gh capacity
> > > > > for the reply, but since this capacity is guest driven, this seco=
nd part can
> > > > > take a while / forever. This is definitely not ideal.
> > > >=20
> > > > I think you're describing how to reserve space for control packets =
so
> > > > that the device never has to wait on the driver.
> > > >=20
> > > > Have you seen the drivers/vhost/vsock.c device implementation?  It =
has a
> > > > strategy for suspending tx queue processing until the rx queue has =
more
> > > > space.  Multiple implementation-specific approaches are possible, s=
o
> > > > this isn't in the specification.
> > > >=20
> > > > > I short, I think workload 2 needs to be in control of its own que=
ues for
> > > > > this to work reasonably well, I don't know if sharing ownership o=
f queues
> > > > > can work. The device we defined doesn't have this problem: first =
of all,
> > > > > it's on a separate queue, so workload 1 never competes in any way=
 with
> > > > > workload 2, and workload 2 always has where to place replies, sin=
ce it has
> > > > > an attached reply buffer by design.
> > > >=20
> > > > Flow control in vsock works like this:
> > > >=20
> > > > 1. Data packets are accounted against per-socket buffers and remove=
d
> > > >      from the virtqueue immediately.  This allows multiple competin=
g data
> > > >      streams to share a single virtqueue without starvation.  It's =
the
> > > >      per-socket buffer that can be exhausted, but that only affects=
 the
> > > >      application that isn't reading the socket socket.  The other s=
ide
> > > >      will stop sending more data when credit is exhausted so that d=
elivery
> > > >      can be guaranteed.
> > > >=20
> > > > 2. Control packet replies can be sent in response to pretty much an=
y
> > > >      packet.  Therefore, it's necessary to suspend packet processin=
g when
> > > >      the other side's virtqueue is full.  This way you don't need t=
o wait
> > > >      for them midway through processing a packet.
> > > >=20
> > > > There is a problem with #2 which hasn't been solved.  If both sides=
 are
> > > > operating at N-1 queue capacity (they are almost exhausted), then c=
an we
> > > > reach a deadlock where both sides suspend queue processing because =
they
> > > > are waiting for the other side?  This has not been fully investigat=
ed or
> > > > demonstrated, but it's an area that needs attention sometime.
> > > >=20
> > > > > Perhaps a good compromise would be to have a multi-queue virtio-v=
sock or
> > > >=20
> > > > That would mean we've reached the conclusion that it's impossible t=
o
> > > > have bi-directional communication with guaranteed delivery over a s=
hared
> > > > communications channel.
> > > >=20
> > > > virtio-serial did this to avoid having to come up with a scheme to =
avoid
> > > > starvation.
> > >=20
> > > Let me throw in one more problem:
> > >=20
> > > Imagine that we want to have virtio-vsock communication terminated in
> > > different domains, each of which has ownership of their own device
> > > emulation.
> > >=20
> > > The easiest case where this happens is to have vsock between hypervis=
or and
> > > guest as well as between a PCIe implementation via VFIO and a guest. =
But the
> > > same can be true for stub domain like setups, where each connection e=
nd
> > > lives in its own stub domain (vhost-user in the vsock case I suppose)=
.
> > >=20
> > > In that case, it's impossible to share the one queue we have, no?
> >=20
> > Maybe it is possible, but we have some restrictions:
> > - one guest should behave as an host, since every communication assumes
> >    that one peer is the host (VMADDR_CID_HOST)
> > - all packets go only between the two guests, without being able to be
> >    delivered to the host
> >=20
> > If performance doesn't matter, we can have an host application in
> > user space that does this bridging (e.g. socat).
>=20
> I'm less concerned about ownership than security. The two implementation
> backends of vsock are separate for a good reason: The touch point between
> them is the guest.

Okay, now I got your point and I think is feasible to have multiple queues
to reach different endpoints.

We only need to fix the peer addressing to allow the driver to choose
which queue to use, or which direction (nested VM, host, siblings).
At this point, I'm not sure if it is better to support multiple devices
(hot-plug) instead of multiple queues.

As we previously discussed, maybe we need to centralize the CID allocation
at the lowest level (L0), or we need to define some kind of ARP.

>=20
> If we now start to create a user space broker on the host, we're suddenly
> creating a single entity that sits right in between the information flow
> again :(.

Yeah, make sense if the information is critical.

Cheers,
Stefano


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

