Return-Path: <mst@redhat.com>
Date: Wed, 23 Mar 2022 08:35:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [virtio-comment] [PATCH v3 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Message-ID: <20220323081402-mutt-send-email-mst@kernel.org>
References: <4735344.EBYxvr1mta@silver>
 <1758197.u6jAxYQQ6s@silver>
 <20220321174557-mutt-send-email-mst@kernel.org>
 <2085227.9aJWpeLndy@silver>
MIME-Version: 1.0
In-Reply-To: <2085227.9aJWpeLndy@silver>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Mar 23, 2022 at 11:20:07AM +0100, Christian Schoenebeck wrote:
> On Montag, 21. M=E4rz 2022 23:13:55 CET Michael S. Tsirkin wrote:
> > On Mon, Mar 21, 2022 at 10:23:07AM +0100, Christian Schoenebeck wrote:
> > > On Sonntag, 20. M=E4rz 2022 22:52:16 CET Michael S. Tsirkin wrote:
> > > > On Sun, Mar 20, 2022 at 06:43:53PM +0100, Christian Schoenebeck wro=
te:
> > > > > To be honest, I don't feel like discussing precise wordings at th=
is
> > > > > point
> > > > > when you are questioning the proposal on design level already.
> > > > >=20
> > > > > Maybe you make some more thorough thoughts on what you actually w=
ant
> > > > > this
> > > > > to be on design level before continueing to argue about precise
> > > > > terminology, which you are not using either BTW when you articula=
ting
> > > > > your criticism.
> > > > >=20
> > > > > Or even better: come up with your own proposol with the precise
> > > > > wording
> > > > > you
> > > > > feel appropriate.
> > > >=20
> > > > OK let's go back and agree on what we are trying to achieve.  The g=
ithub
> > > > issue and the cover letter imply that while indirect descriptors wo=
uld
> > > > normally allow huge tables, we artificially limit them to queue siz=
e,
> > > > and you want to be able to relax that.
> > >=20
> > > Correct, that's my motivation for all of this.
> >=20
> > Okay. So I think that given this, we can limit the total number
> > of non-indirect descriptors, including non-indirect ones
> > in a chain + all the ones in indirect pointer table if any,
> > and excluding the indirect descriptor itself, and this
> > will address the issue you are describing here, right?
>=20
> As far as I understand your suggestion, yes, it would cover:
>=20
> A. My use case [1]: allowing indirect table length > queue size.
> B. Stefan's use case [2]: forcing indirect table length < queue size.
> C. Your use case: forcing chain (within FIFOs) length < queue size.
>=20
> [1] https://lore.kernel.org/netdev/cover.1640870037.git.linux_oss@crudeby=
te.com/
> [2] https://lore.kernel.org/all/YXpmwP6RtvY0BmSM@stefanha-x1.localdomain/
>=20
> However it would not cover:
>=20
> D. Your other use case: blocking indirect tables.

Well, the practical use-case I have in mind is actually for when using
mergeable buffers with the network device, in practice there's never a
s/g but there's no way for device to know that. So maybe we can declare
that indirect must not be used when there's a single descriptor in the
table (esp when the new feature is accepted), and then just limiting s/g
to 1 will do the trick in this specific case.

> E. Potential other people's need: max. chain length (within FIFOs) !=3D m=
ax.
>    indirect table length.

I don't understand this one, sorry.

> It's not clear to me though why you would want to exclude the descriptor
> pointing to a table from counting towards that limit.

Because it's a transient thing. It does not need to be processed
with a packet, it's just a way of supplying a longer s/g.
In other words what devices care about is the s/g list length,
bot how the s/g is specified.

I think what QEMU and Linux both do is very typical:
the indirect descriptor is used to fetch the table,
but then what QEMU cares about is whether it will overflow 1024
entries when preparing the iovec for linux.



> Instead of yet again mixing different limits again with each other, what =
about
> using 3 distinct fields for those limits instead:
>=20
> 1. max. indirect table length (any descriptor in the table)
> 2. max. chain length (currently: descriptors within FIFOs)
> 3. max. total descriptors per buffer (sum of all descriptors, both from F=
IFOs
>    and indirect tables, including descriptor pointing to a table).

So this doesn't actually address at least what you called "your
use-case" above. Well it almost does, but not exactly because
of the extra indirect descriptor.

It's not that I'm against this kind of thing but personally
I'd like a bit more than a theoretical argument for
why all the extra complexity is helpful - remember that
all that needs to be coded in the driver, and any mistakes
often tend to paint us in the corner because of the need to
support existing drivers.


> As a side note: the spec currently refers to "table of indirect descripto=
rs",
> hence my previous assumption that descriptors in such a table should be c=
alled
> "indirect descriptors", whereas you are apparently assuming that an "indi=
rect
> descriptor" is only that single one pointing to a table and you see the
> descriptors in the table as "direct" ones I guess.

Oh. You are right. There's no special name for what I mistakenly
called an indirect descriptor. So what I called
"direct descriptors" are really "read/write descriptors".
It might make sense to add some text calling these something.
Scatter/gather descriptors maybe?

And what I called "indirect descriptor" is really just
descriptor with INDIRECT flag set. I am not sure we need
to call these anything unless we really start counting it.




> > Question:
> > - I am thinking about bi-directional descriptors such as
> >   block and scsi have. it looks like they have a separate limit for
> >   read and write parts of the chain. Should we have two limits
> >   then? Or should we just make driver use the lower of the two,
> >   i.e. the per vq limit applies to the total # of elements
> >   in a buffer, and read/write sgs are controlled separately
> >   by the per device control?
> >=20
> > Stefan, any comments?
>=20
> Leaving that question to Stefan. No opinion from my side at this point.
>=20
> > > > Fair enough.
> > > >=20
> > > > However, I feel trying to talk about indirect descriptor is too nar=
row a
> > > > use-case, simply because the issue is not indirect at all.  Why do =
we
> > > > limit number of segments? I think it's really because of backend
> > > > limitations. And indirect is only used by the frontend.  So limiting
> > > > that is really going about it wrong.
> > >=20
> > > I am only aware about current implementation situation in QEMU and Li=
nux
> > > kernel. As for those two: yes, it is not a limitation on Linux kernel
> > > side,
> > > but on QEMU side.
> > >=20
> > > As for other implementations: no idea.
> > >=20
> > > > So block for example has seg_max already. What should happen
> > > > if that exceeds queue size is not defined.
> > > >=20
> > > > So maybe we can generalize that making it device independent?
> > > > The litmus paper for this is the block and scsi devices,
> > > > we should be able to use the new feature as a super-set.
> > > >=20
> > > > Before we discuss solutions, did I formulate the problem correctly?
> > >=20
> > > Keep in mind that I never worked on virtio code or virtio spec before=
. I
> > > just started to review virtio implementation of QEMU and Linux kernel=
 and
> > > the virtio spec in November, specifically in context of 9p. I definit=
ely
> > > don't know all the other virtioo device classes out there.
> >=20
> > I think it's great that we have someone taking care of 9p btw!
>=20
> Thanks!
>=20
> > > In other words: I can't help you on fitting this appropriately into a
> > > superset picture.
> > >=20
> > > Best regards,
> > > Christian Schoenebeck
> >=20
> > I think we need some cleanups in the spec to make what you are trying to
> > do possible to do cleanly, specifically move this description:
> >=20
> > 	A buffer consists of zero or more device-readable physically-contiguous
> > 	elements followed by zero or more physically-contiguous
> > 	device-writable elements (each buffer has at least one element).
> >=20
> > out to the generic part from packed ring part, drop corresponding
> > text from split ring and make it refer to the term "element".
> >=20
> > After this, the new field will just be "a number of elements per
> > buffer" (note that indirect descriptors do not themselves
> > describe elements and so won't be included in the math).
> >=20
> > Christian, you mentioned you don't like the term buffer generally,
> > changing that can be done before or after this feature but IMHO
> > best not as part of it.
>=20
> For pragmatic reasons I will refrain from questioning any virtio terms in
> foreseeable future and will just use the ones suggested by people.

It's not that the terminology is so great, but we do have used it for a
while and by now it's quite entrenched.

> > I think it's good in that it will fit better in the superset picture
> > addressing in addition to your requirement also the requirement to have
> > huge rings while limiting descriptors.
> >=20
> > Does above sound like it addresses your requirements of having
> > a longer descriptor chain than queue size? If not what is not
> > addressed?
> >=20
> > Thanks,
>=20

