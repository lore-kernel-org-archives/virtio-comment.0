Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Date: Thu, 10 Mar 2022 17:20:19 +0100
Message-ID: <24220875.zXfpC7KmYo@silver>
In-Reply-To: <YioR2KrQiy4OP+nD@stefanha-x1.localdomain>
References: <2255414.aXzeqRvSCW@silver> <3784027.ryC8PSGgVn@silver> <YioR2KrQiy4OP+nD@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Donnerstag, 10. M=E4rz 2022 15:57:28 CET Stefan Hajnoczi wrote:
> On Mon, Feb 21, 2022 at 05:25:00PM +0100, Christian Schoenebeck wrote:
> > @@ -6847,6 +6851,30 @@ \chapter{Reserved Feature Bits}\label{sec:Reserv=
ed
> > Feature Bits}>=20
> >    that the driver can reset a queue individually.
> >    See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues /
> >    Virtqueue Reset}.>=20
> > +  \item[VIRTIO_RING_F_INDIRECT_SIZE(41)] This feature indicates that t=
he
> > +  Queue Indirect Size, i.e. the maximum amount of descriptors in indir=
ect
> > +  descriptor tables, is independent from the Queue Size.
> > +
> > +  Without this feature, the Queue Size limits the length of the
> > descriptor
> > +  chain, including indirect descriptor tables as in \ref{sec:Basic
> > Facilities of +  a Virtio Device / Virtqueues / The Virtqueue Descripto=
r
> > Table / Indirect +  Descriptors}, i.e. both the maximum amount of slots
> > in the vring and the +  actual bulk data size transmitted per vring slo=
t.
> > +
> > +  With this feature enabled, the Queue Size only limits the maximum
> > amount
> > +  of slots in the vring, but does not limit the actual bulk data size
> > +  being transmitted when indirect descriptors are used. Decoupling the=
se
> > +  two configuration parameters this way not only allows much larger bu=
lk
> > data +  being transferred per vring slot, but also avoids complicated
> > synchronization +  mechanisms if the device only supports a very small
> > amount of vring slots. Due +  to the 16-bit size of a descriptor's "nex=
t"
> > field there is still an absolute +  limit of $2^{16}$ descriptors per
> > indirect descriptor table. However the +  actual maximum amount support=
ed
> > by either device or driver might be less, +  and therefore the bus
> > specific Queue Indirect Size value MUST additionally
> s/bus/transport/
>=20
> Otherwise:
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

I'll change that in v3. Thanks!

Best regards,
Christian Schoenebeck


