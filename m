Return-Path: <stefanha@redhat.com>
Date: Wed, 8 Dec 2021 15:11:10 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-comment] Re: [PATCH v2 0/2] Add
 VIRTIO_RING_F_LARGE_INDIRECT_DESC
Message-ID: <YbDLDt6Cn+qonnmr@stefanha-x1.localdomain>
References: <cover.1638192251.git.qemu_oss@crudebyte.com>
 <Ya8udCHO9bXiWd4P@stefanha-x1.localdomain>
 <87fsr4thvo.fsf@redhat.com>
 <10245090.BqRs5aQnp2@silver>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5wr147Lvh+6mlzDy"
Content-Disposition: inline
In-Reply-To: <10245090.BqRs5aQnp2@silver>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--5wr147Lvh+6mlzDy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 01:26:54PM +0100, Christian Schoenebeck wrote:
> On Dienstag, 7. Dezember 2021 19:00:27 CET Cornelia Huck wrote:
> > On Tue, Dec 07 2021, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > On Mon, Dec 06, 2021 at 08:12:14PM +0100, Christian Schoenebeck wrote:
> > >> On Montag, 6. Dezember 2021 12:52:07 CET Cornelia Huck wrote:
> > >> > On Fri, Dec 03 2021, Christian Schoenebeck <qemu_oss@crudebyte.com=
>=20
> wrote:
> > >> > > On Donnerstag, 2. Dezember 2021 11:27:17 CET Cornelia Huck wrote:
> > >> > >> On Tue, Nov 30 2021, Christian Schoenebeck <qemu_oss@crudebyte.=
com>=20
> wrote:
> > >> > >> > On Dienstag, 30. November 2021 14:48:50 CET Cornelia Huck wro=
te:
> > >> > >> >> On Tue, Nov 30 2021, Christian Schoenebeck
> > >> > >> >> <qemu_oss@crudebyte.com>
> > >> > >> >=20
> > >> > >> > Another issue I just realized: there is also an ambiguity in =
this
> > >> > >> > v2
> > >> > >> > what
> > >> > >> > the maximum descriptor count actually relates to. Should it be
> > >> > >> >=20
> > >> > >> > 1. max. indirect descriptor count per indirect descriptor tab=
le
> > >> > >> >=20
> > >> > >> > or
> > >> > >> >=20
> > >> > >> > 2. max. indirect descriptor count per vring slot (i.e. the sum
> > >> > >> > from
> > >> > >> > multiple indirect descriptor tables within the same message)
> > >> > >> >=20
> > >> > >> > Case 2 applies to QEMU's implementation right now AFAICS. The=
 max.
> > >> > >> > possible
> > >> > >> > bulk transfer size is lower in case 2 accordingly.
> > >> > >=20
> > >> > > After reviewing virtio code on QEMU side again, I suggest to go =
for
> > >> > > (2.).
> > >> > > Otherwise a large portion of QEMU's virtio code would need quite=
 a
> > >> > > bunch
> > >> > > of
> > >> > > changes to support (1.). I assume that resistence for such chang=
es in
> > >> > > QEMU
> > >> > > would be high, and I currently don't care enough to work on and
> > >> > > defend
> > >> > > those changes that (1.) would need.
> > >> > >=20
> > >> > > In practice that would mean for many devices: the theoretical
> > >> > > absolute
> > >> > > max.
> > >> > > virtio transfer size might be cut into half with (2.) in compari=
son
> > >> > > to
> > >> > > (1.), which is (2^16 * PAGE_SIZE) / 2 =3D 128 MB with a typical =
page
> > >> > > size
> > >> > > of 4k, because one indirect descriptor table is usually used for
> > >> > > sending
> > >> > > to device and another table for receiving from device. But that'=
s use
> > >> > > case dependent and (1.) is still a huge step forward IMO.
> > >> >=20
> > >> > If the variant that is easier for QEMU to implement still gives you
> > >> > enough of what you need, I'm fine with going with that. (Is it
> > >> > future-proof enough?)
> > >>=20
> > >> No crystal ball here, sorry. :)
> > :
> > :)
> > :
> > >> Just to give you a feeling what I am talking about here for QEMU, you
> > >> might
> > >> have a quick glimpse on the hw/virtio/virtio.c changes of following
> > >> patch. It is not exactly how the final changes would look like, but =
it
> > >> should give a rough idea of what is involved:
> > >> https://lore.kernel.org/all/c9dea2e27ae19b2b9a51e8f08687067bf3e47bd5=
=2E1633
> > >> 376313.git.qemu_oss@crudebyte.com/
> > >>=20
> > >> As you can see, QEMU first reserves the max. expected descriptor cou=
nt as
> > >> array memory on stack, then it gathers *all* descriptors from all
> > >> indirect
> > >> descriptor tables of a vring slot all together into that array and
> > >> finally
> > >> the vring slot's message is processed on device level:
> > >> https://github.com/qemu/qemu/blob/99fc08366b06282614daeda989d2fde6ab=
8a707
> > >> f/hw/virtio/virtio.c#L1475
> > >>=20
> > >> So a limit per vring slot would be much easier to implement in QEMU,=
 as
> > >> it is more or less just refactoring of QEMU's current compile-time
> > >> constant VIRTQUEUE_MAX_SIZE into a runtime variable.
> > >> Implementing a limit per table instead would require substantial cha=
nges
> > >> to
> > >> its current program flow.
> > >>=20
> > >> Back to your question ...
> > >>=20
> > >> Assuming that most devices have one or two tables per vring slot, and
> > >> considering that almost nobody cared for virtio's current descriptor
> > >> count
> > >> limit so far, I would not expect that the new, much higher limit to =
be
> > >> questioned in the next few years or so. And if it was, you would pro=
bably
> > >> also start to question all those 16-bit fields in virtio as well and
> > >> then this specific aspect here would probably be the smallest issue =
to
> > >> worry about.
> > >>=20
> > >> OTOH if there are devices with like 10 descriptor tables or more per
> > >> vring
> > >> slot, then they obviously would hit this limit much sooner. No idea =
if
> > >> there is any such device though.
> > >=20
> > > Other device implementations probably also care about the total number
> > > of descriptors per vring slot instead of the number of descriptors per
> > > indirect table. The limitation on the device side is the resource
> > > requirement and/or maximum supported by the underlying I/O mechanism,=
 so
> > > the total number of descriptors is likely to matter.
> >=20
> > Thanks to you both; going with the total number seems to be best.
>=20
> Yes, agreed.
>=20
> One more thought: what about making the new 'queue_indirect_size' config =
field=20
> 32 bit wide instead of 16 bit? That would easily mitigate the issue of th=
e=20
> aggregated limit discussed here, and would in general be more future safe=
,=20
> i.e. considering that there might be either nested/multi-level indirect=
=20
> descriptor tables or chained tables in future? The cost would be low, rig=
ht?

The MMIO transport has 32-bit fields, so there doesn't seem to be a
strict requirement to use 16 bits for descriptor counts.

I think you're right that the cost is low. Usually it's the access
itself that carries a cost (a VM exit or bus transaction) and 2 vs 4
byte transfers don't really matter.

Stefan

--5wr147Lvh+6mlzDy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGwyw4ACgkQnKSrs4Gr
c8hhtAf9E+Q69AhfWELP3nXE4NGY+zNoaOplfl57l7GGJes/izrt7XEiDXRPW7Gn
yfbJ3TP0wx9ul+2cwubOqp5mV0z4P8I3OXcXO5tFdcLfxlxQZCdXoo+c01RHINcC
FaTI2Fz0buR4/RP57Y9Qbq7dcqMwHyLYpQJUMRW61EP2DTaX1giFaLKLU4OnrDpI
7rwHnxIq4xxENNriUu1o4qAR1HDj8zWew4ZJhQT/Yjq7adqcsKImM8Oya5fz7GeL
u69iUfAB/uODL6O7HKEOyPKCcBBISELDlVNwm0wbT0Ze2Cq3lJbdGi1ZDXxOCqUk
WqcCl7duMoPKoXqrbWWvDaM8C5vRIQ==
=SPIm
-----END PGP SIGNATURE-----

--5wr147Lvh+6mlzDy--

