Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [virtio-comment] [PATCH v3 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Date: Thu, 24 Mar 2022 10:16:00 +0100
Message-ID: <1847014.mHbFrWZCre@silver>
In-Reply-To: <20220323081402-mutt-send-email-mst@kernel.org>
References: <4735344.EBYxvr1mta@silver> <2085227.9aJWpeLndy@silver>
 <20220323081402-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mittwoch, 23. M=E4rz 2022 13:35:00 CET Michael S. Tsirkin wrote:
> On Wed, Mar 23, 2022 at 11:20:07AM +0100, Christian Schoenebeck wrote:
> > On Montag, 21. M=E4rz 2022 23:13:55 CET Michael S. Tsirkin wrote:
> > > On Mon, Mar 21, 2022 at 10:23:07AM +0100, Christian Schoenebeck wrote=
:
> > > > On Sonntag, 20. M=E4rz 2022 22:52:16 CET Michael S. Tsirkin wrote:
> > > > > On Sun, Mar 20, 2022 at 06:43:53PM +0100, Christian Schoenebeck=
=20
wrote:
> > > > > OK let's go back and agree on what we are trying to achieve.  The
> > > > > github
> > > > > issue and the cover letter imply that while indirect descriptors
> > > > > would
> > > > > normally allow huge tables, we artificially limit them to queue
> > > > > size,
> > > > > and you want to be able to relax that.
> > > >=20
> > > > Correct, that's my motivation for all of this.
> > >=20
> > > Okay. So I think that given this, we can limit the total number
> > > of non-indirect descriptors, including non-indirect ones
> > > in a chain + all the ones in indirect pointer table if any,
> > > and excluding the indirect descriptor itself, and this
> > > will address the issue you are describing here, right?
> >=20
> > As far as I understand your suggestion, yes, it would cover:
> >=20
> > A. My use case [1]: allowing indirect table length > queue size.
> > B. Stefan's use case [2]: forcing indirect table length < queue size.
> > C. Your use case: forcing chain (within FIFOs) length < queue size.
> >=20
> > [1]
> > https://lore.kernel.org/netdev/cover.1640870037.git.linux_oss@crudebyte=
.c
> > om/ [2]
> > https://lore.kernel.org/all/YXpmwP6RtvY0BmSM@stefanha-x1.localdomain/
> >=20
> > However it would not cover:
> >=20
> > D. Your other use case: blocking indirect tables.
>=20
> Well, the practical use-case I have in mind is actually for when using
> mergeable buffers with the network device, in practice there's never a
> s/g but there's no way for device to know that. So maybe we can declare
> that indirect must not be used when there's a single descriptor in the
> table (esp when the new feature is accepted), and then just limiting s/g
> to 1 will do the trick in this specific case.
>=20
> > E. Potential other people's need: max. chain length (within FIFOs) !=3D=
 max.
> >=20
> >    indirect table length.
>=20
> I don't understand this one, sorry.

Example: say you would want to allow large indirect tables, but OTOH want t=
o=20
block any chained (pre-allocated) direct descriptors in the vring FIFOs=20
themselfes, e.g.:

=09Queue Size (max. # "buffers" in FIFO) =3D 127
=09Indirect Size (max. # segments in indirect descr. table) =3D 65535
=09Direct Size (max. # chained descr. per "buffer" in FIFO) =3D 1
=09Total Size (max. # sum of all descr. per "buffer") =3D 65536

Your suggestion would not cover this example. Why would somebody want that?=
=20
Because of device/driver simplification (i.e. same motivation you apparentl=
y=20
had in mind for blocking indirect tables for network devices) and to preven=
t=20
one side from starving because other side filled entire FIFO with large bul=
k=20
data for a single message.

> > Instead of yet again mixing different limits again with each other, wha=
t
> > about using 3 distinct fields for those limits instead:
> >=20
> > 1. max. indirect table length (any descriptor in the table)
> > 2. max. chain length (currently: descriptors within FIFOs)
> > 3. max. total descriptors per buffer (sum of all descriptors, both from
> > FIFOs>=20
> >    and indirect tables, including descriptor pointing to a table).
>=20
> So this doesn't actually address at least what you called "your
> use-case" above. Well it almost does, but not exactly because
> of the extra indirect descriptor.

Of course it would cover it. And of course you would have to either subtrac=
t=20
or add one descriptor somewhere, no matter which solution is chosen in the=
=20
end.

Best regards,
Christian Schoenebeck


