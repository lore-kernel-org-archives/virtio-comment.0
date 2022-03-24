Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [virtio-comment] [PATCH v3 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Date: Thu, 24 Mar 2022 12:52:10 +0100
Message-ID: <1667876.zgVsUHP1zr@silver>
In-Reply-To: <20220324071248-mutt-send-email-mst@kernel.org>
References: <4735344.EBYxvr1mta@silver> <11690219.250BWKXhHV@silver>
 <20220324071248-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Donnerstag, 24. M=E4rz 2022 12:16:51 CET Michael S. Tsirkin wrote:
> On Thu, Mar 24, 2022 at 12:11:33PM +0100, Christian Schoenebeck wrote:
> > On Donnerstag, 24. M=E4rz 2022 11:36:50 CET Michael S. Tsirkin wrote:
> > > On Thu, Mar 24, 2022 at 10:16:00AM +0100, Christian Schoenebeck wrote=
:
> > > > On Mittwoch, 23. M=E4rz 2022 13:35:00 CET Michael S. Tsirkin wrote:
> > > > > On Wed, Mar 23, 2022 at 11:20:07AM +0100, Christian Schoenebeck=
=20
wrote:
> > > > > > On Montag, 21. M=E4rz 2022 23:13:55 CET Michael S. Tsirkin wrot=
e:
> > > > > > > On Mon, Mar 21, 2022 at 10:23:07AM +0100, Christian Schoenebe=
ck
> >=20
> > wrote:
> > > > > > > > On Sonntag, 20. M=E4rz 2022 22:52:16 CET Michael S. Tsirkin=
=20
wrote:
> > > > > > > > > On Sun, Mar 20, 2022 at 06:43:53PM +0100, Christian
> > > > > > > > > Schoenebeck
> > > >=20
> > > > wrote:
> > > > > > > > > OK let's go back and agree on what we are trying to achie=
ve.
> > > > > > > > > The
> > > > > > > > > github
> > > > > > > > > issue and the cover letter imply that while indirect
> > > > > > > > > descriptors
> > > > > > > > > would
> > > > > > > > > normally allow huge tables, we artificially limit them to
> > > > > > > > > queue
> > > > > > > > > size,
> > > > > > > > > and you want to be able to relax that.
> > > > > > > >=20
> > > > > > > > Correct, that's my motivation for all of this.
> > > > > > >=20
> > > > > > > Okay. So I think that given this, we can limit the total numb=
er
> > > > > > > of non-indirect descriptors, including non-indirect ones
> > > > > > > in a chain + all the ones in indirect pointer table if any,
> > > > > > > and excluding the indirect descriptor itself, and this
> > > > > > > will address the issue you are describing here, right?
> > > > > >=20
> > > > > > As far as I understand your suggestion, yes, it would cover:
> > > > > >=20
> > > > > > A. My use case [1]: allowing indirect table length > queue size=
.
> > > > > > B. Stefan's use case [2]: forcing indirect table length < queue
> > > > > > size.
> > > > > > C. Your use case: forcing chain (within FIFOs) length < queue
> > > > > > size.
> > > > > >=20
> > > > > > [1]
> > > > > > https://lore.kernel.org/netdev/cover.1640870037.git.linux_oss@c=
rud
> > > > > > ebyt
> > > > > > e.c
> > > > > > om/ [2]
> > > > > > https://lore.kernel.org/all/YXpmwP6RtvY0BmSM@stefanha-x1.locald=
oma
> > > > > > in/
> > > > > >=20
> > > > > > However it would not cover:
> > > > > >=20
> > > > > > D. Your other use case: blocking indirect tables.
> > > > >=20
> > > > > Well, the practical use-case I have in mind is actually for when
> > > > > using
> > > > > mergeable buffers with the network device, in practice there's ne=
ver
> > > > > a
> > > > > s/g but there's no way for device to know that. So maybe we can
> > > > > declare
> > > > > that indirect must not be used when there's a single descriptor i=
n
> > > > > the
> > > > > table (esp when the new feature is accepted), and then just limit=
ing
> > > > > s/g
> > > > > to 1 will do the trick in this specific case.
> > > > >=20
> > > > > > E. Potential other people's need: max. chain length (within FIF=
Os)
> > > > > > !=3D
> > > > > > max.
> > > > > >=20
> > > > > >    indirect table length.
> > > > >=20
> > > > > I don't understand this one, sorry.
> > > >=20
> > > > Example: say you would want to allow large indirect tables, but OTO=
H
> > > > want
> > > > to block any chained (pre-allocated) direct descriptors in the vrin=
g
> > > > FIFOs>
> > > >=20
> > > > themselfes, e.g.:
> > > > =09Queue Size (max. # "buffers" in FIFO) =3D 127
> > > > =09Indirect Size (max. # segments in indirect descr. table) =3D 655=
35
> > > > =09Direct Size (max. # chained descr. per "buffer" in FIFO) =3D 1
> > > > =09Total Size (max. # sum of all descr. per "buffer") =3D 65536
> > > >=20
> > > > Your suggestion would not cover this example. Why would somebody wa=
nt
> > > > that?
> > > > Because of device/driver simplification
> > >=20
> > > It does not simplify the driver, does it? It's always an extra
> > > resriction on it.
> >=20
> > Why not? If it's the driver that sets Direct Size =3D 1 then it can ign=
ore
> > handling chained direct descriptors. Sounds like a simplification to me=
.
>=20
> If driver does not want to chain descriptors it does not have to.
> There's no need to device to forbid it from doing so.
>=20
> > > > (i.e. same motivation you apparently
> > > > had in mind for blocking indirect tables for network devices)
> > >=20
> > > OK I got this one. Device writers do complain about the complexity.
> > > However the tradeoff in limiting what device accepts is ability
> > > to migrate to a different device. So there's an advantage to
> > > making this a separate feature bit so that it's clear to people it's
> > > a low-end device.
> > >=20
> > > > and to prevent
> > > > one side from starving because other side filled entire FIFO with
> > > > large
> > > > bulk data for a single message.
> > >=20
> > > This last I don't see why would it be the device's problem. If driver
> > > will starve the device it can always do so, if it wants to use
> > > indirect aggressively to avoid filling up the queue it can do so too.
> >=20
> > To actually make it possible to enforce such kind of policy: "do not us=
e
> > the FIFO for large bulk data, use indirect space for that instead".
>=20
> Why does device want to enforce this policy? Policy is generally
> something best left to guests they know how device is used.

I'm just saying. Period. It's not that I care. In the end I leave it to oth=
er=20
people to fit this into an appropriate superset picture, caring about futur=
e=20
proofness, etc.

As long as "my" use case (indirect size > queue size) will be covered, then=
 I=20
will be fine with any design. #pragmatism

> > > > > > Instead of yet again mixing different limits again with each
> > > > > > other,
> > > > > > what
> > > > > > about using 3 distinct fields for those limits instead:
> > > > > >=20
> > > > > > 1. max. indirect table length (any descriptor in the table)
> > > > > > 2. max. chain length (currently: descriptors within FIFOs)
> > > > > > 3. max. total descriptors per buffer (sum of all descriptors, b=
oth
> > > > > > from
> > > > > > FIFOs>
> > > > > >=20
> > > > > >    and indirect tables, including descriptor pointing to a tabl=
e).
> > > > >=20
> > > > > So this doesn't actually address at least what you called "your
> > > > > use-case" above. Well it almost does, but not exactly because
> > > > > of the extra indirect descriptor.
> > > >=20
> > > > Of course it would cover it.
> > > > And of course you would have to either subtract
> > > > or add one descriptor somewhere,
> > >=20
> > > Well, indirect descriptors can be chained with VIRTQ_DESC_F_NEXT righ=
t?
> > > The number of in the chain is not really predictable, it's not always
> > > 1.
> >=20
> > I don't think so:
> >   2.6.5.3.1 Driver Requirements: Indirect Descriptors
> >   ..
> >   "A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NE=
XT
> >   in
> >   flags."
> >=20
> > So as far as I can see it, the amount of direct descriptors is currentl=
y
> > always exactly one if an indirect table is used.
> >=20
> > Best regards,
> > Christian Schoenebeck
>=20
> Oh. You are right.  Weirdly this text is not in packed-ring.tex - I

As far as I can see it, you both originally added this normative requiremen=
t=20
to content.tex with 3b676c2f (Wed Apr 29 11:09:04 2015) and then you moved =
it=20
to split-ring.tex with 6131f8d9 (Fri Mar 9 23:23:30 2018).

> think this and a bunch of other cases like this are an oversight,
> however we need to fix them first before adding features that assume
> they are fixed ...

Makes sense.

Feel free to resume this discussion when you think it is time to.

It would be good to see other people's opinion on this overall issue as wel=
l=20
though.

Thanks!

Best regards,
Christian Schoenebeck


