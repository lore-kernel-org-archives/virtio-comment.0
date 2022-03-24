Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [virtio-comment] [PATCH v3 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Date: Thu, 24 Mar 2022 12:11:33 +0100
Message-ID: <11690219.250BWKXhHV@silver>
In-Reply-To: <20220324062230-mutt-send-email-mst@kernel.org>
References: <4735344.EBYxvr1mta@silver> <1847014.mHbFrWZCre@silver>
 <20220324062230-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Donnerstag, 24. M=E4rz 2022 11:36:50 CET Michael S. Tsirkin wrote:
> On Thu, Mar 24, 2022 at 10:16:00AM +0100, Christian Schoenebeck wrote:
> > On Mittwoch, 23. M=E4rz 2022 13:35:00 CET Michael S. Tsirkin wrote:
> > > On Wed, Mar 23, 2022 at 11:20:07AM +0100, Christian Schoenebeck wrote=
:
> > > > On Montag, 21. M=E4rz 2022 23:13:55 CET Michael S. Tsirkin wrote:
> > > > > On Mon, Mar 21, 2022 at 10:23:07AM +0100, Christian Schoenebeck=
=20
wrote:
> > > > > > On Sonntag, 20. M=E4rz 2022 22:52:16 CET Michael S. Tsirkin wro=
te:
> > > > > > > On Sun, Mar 20, 2022 at 06:43:53PM +0100, Christian Schoenebe=
ck
> >=20
> > wrote:
> > > > > > > OK let's go back and agree on what we are trying to achieve.=
=20
> > > > > > > The
> > > > > > > github
> > > > > > > issue and the cover letter imply that while indirect descript=
ors
> > > > > > > would
> > > > > > > normally allow huge tables, we artificially limit them to que=
ue
> > > > > > > size,
> > > > > > > and you want to be able to relax that.
> > > > > >=20
> > > > > > Correct, that's my motivation for all of this.
> > > > >=20
> > > > > Okay. So I think that given this, we can limit the total number
> > > > > of non-indirect descriptors, including non-indirect ones
> > > > > in a chain + all the ones in indirect pointer table if any,
> > > > > and excluding the indirect descriptor itself, and this
> > > > > will address the issue you are describing here, right?
> > > >=20
> > > > As far as I understand your suggestion, yes, it would cover:
> > > >=20
> > > > A. My use case [1]: allowing indirect table length > queue size.
> > > > B. Stefan's use case [2]: forcing indirect table length < queue siz=
e.
> > > > C. Your use case: forcing chain (within FIFOs) length < queue size.
> > > >=20
> > > > [1]
> > > > https://lore.kernel.org/netdev/cover.1640870037.git.linux_oss@crude=
byt
> > > > e.c
> > > > om/ [2]
> > > > https://lore.kernel.org/all/YXpmwP6RtvY0BmSM@stefanha-x1.localdomai=
n/
> > > >=20
> > > > However it would not cover:
> > > >=20
> > > > D. Your other use case: blocking indirect tables.
> > >=20
> > > Well, the practical use-case I have in mind is actually for when usin=
g
> > > mergeable buffers with the network device, in practice there's never =
a
> > > s/g but there's no way for device to know that. So maybe we can decla=
re
> > > that indirect must not be used when there's a single descriptor in th=
e
> > > table (esp when the new feature is accepted), and then just limiting =
s/g
> > > to 1 will do the trick in this specific case.
> > >=20
> > > > E. Potential other people's need: max. chain length (within FIFOs) =
!=3D
> > > > max.
> > > >=20
> > > >    indirect table length.
> > >=20
> > > I don't understand this one, sorry.
> >=20
> > Example: say you would want to allow large indirect tables, but OTOH wa=
nt
> > to block any chained (pre-allocated) direct descriptors in the vring
> > FIFOs>=20
> > themselfes, e.g.:
> > =09Queue Size (max. # "buffers" in FIFO) =3D 127
> > =09Indirect Size (max. # segments in indirect descr. table) =3D 65535
> > =09Direct Size (max. # chained descr. per "buffer" in FIFO) =3D 1
> > =09Total Size (max. # sum of all descr. per "buffer") =3D 65536
> >=20
> > Your suggestion would not cover this example. Why would somebody want
> > that?
> > Because of device/driver simplification
>=20
> It does not simplify the driver, does it? It's always an extra resriction=
 on
> it.

Why not? If it's the driver that sets Direct Size =3D 1 then it can ignore=
=20
handling chained direct descriptors. Sounds like a simplification to me.

> > (i.e. same motivation you apparently
> > had in mind for blocking indirect tables for network devices)
>=20
> OK I got this one. Device writers do complain about the complexity.
> However the tradeoff in limiting what device accepts is ability
> to migrate to a different device. So there's an advantage to
> making this a separate feature bit so that it's clear to people it's
> a low-end device.
>=20
> > and to prevent
> > one side from starving because other side filled entire FIFO with large
> > bulk data for a single message.
>=20
> This last I don't see why would it be the device's problem. If driver
> will starve the device it can always do so, if it wants to use
> indirect aggressively to avoid filling up the queue it can do so too.

To actually make it possible to enforce such kind of policy: "do not use th=
e=20
FIFO for large bulk data, use indirect space for that instead".

> > > > Instead of yet again mixing different limits again with each other,
> > > > what
> > > > about using 3 distinct fields for those limits instead:
> > > >=20
> > > > 1. max. indirect table length (any descriptor in the table)
> > > > 2. max. chain length (currently: descriptors within FIFOs)
> > > > 3. max. total descriptors per buffer (sum of all descriptors, both
> > > > from
> > > > FIFOs>
> > > >=20
> > > >    and indirect tables, including descriptor pointing to a table).
> > >=20
> > > So this doesn't actually address at least what you called "your
> > > use-case" above. Well it almost does, but not exactly because
> > > of the extra indirect descriptor.
> >=20
> > Of course it would cover it.
> > And of course you would have to either subtract
> > or add one descriptor somewhere,
>=20
> Well, indirect descriptors can be chained with VIRTQ_DESC_F_NEXT right?
> The number of in the chain is not really predictable, it's not always
> 1.

I don't think so:

  2.6.5.3.1 Driver Requirements: Indirect Descriptors
  ..
  "A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEXT i=
n
  flags."

So as far as I can see it, the amount of direct descriptors is currently=20
always exactly one if an indirect table is used.

Best regards,
Christian Schoenebeck


