Return-Path: <stefanha@redhat.com>
Date: Tue, 7 Dec 2021 09:50:44 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-comment] Re: [PATCH v2 0/2] Add
 VIRTIO_RING_F_LARGE_INDIRECT_DESC
Message-ID: <Ya8udCHO9bXiWd4P@stefanha-x1.localdomain>
References: <cover.1638192251.git.qemu_oss@crudebyte.com>
 <10998256.R4olcV2hQn@silver>
 <875ys2uf14.fsf@redhat.com>
 <3659399.e9xYYRvpgZ@silver>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+YrI3QiuKFSe/Paf"
Content-Disposition: inline
In-Reply-To: <3659399.e9xYYRvpgZ@silver>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--+YrI3QiuKFSe/Paf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 06, 2021 at 08:12:14PM +0100, Christian Schoenebeck wrote:
> On Montag, 6. Dezember 2021 12:52:07 CET Cornelia Huck wrote:
> > On Fri, Dec 03 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wro=
te:
> > > On Donnerstag, 2. Dezember 2021 11:27:17 CET Cornelia Huck wrote:
> > >> On Tue, Nov 30 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> =
wrote:
> > >> > On Dienstag, 30. November 2021 14:48:50 CET Cornelia Huck wrote:
> > >> >> On Tue, Nov 30 2021, Christian Schoenebeck <qemu_oss@crudebyte.co=
m>
> > >=20
> > > wrote:
> > >> >> > And what about the intended availability of this new
> > >> >> > virtio_pci_common_cfg
> > >> >> > field "queue_indirect_size", should it be optional per se,
> > >> >> > independent
> > >> >> > of
> > >> >> > the virtio version or rather a mandatory field in upcoming virt=
io
> > >> >> > version?
> > >> >>=20
> > >> >> We should keep that field depending upon the feature bit IMHO.
> > >> >=20
> > >> > So you are suggesting the existence of "queue_indirect_size" field=
 to
> > >> > be
> > >> > dependent on feature flag VIRTIO_RING_F_LARGE_INDIRECT_DESC instea=
d of
> > >> > being dependent on the virtio version.
> > >>=20
> > >> Yes.
> > >>=20
> > >> > Stefan, would that also suit your intended 2nd use case of lowerin=
g the
> > >> > max. descriptor count *below* Queue Size? It would be somewhat
> > >> > different
> > >> > from what I suggested here in patch 2 [which was min(QueueSize,
> > >> > queue_indirect_size) if VIRTIO_RING_F_LARGE_INDIRECT_DESC not set]=
, but
> > >> > it could be fine as well.
> > >>=20
> > >> I think that a configurable value for the descriptor count needs to
> > >> depend on the feature bit as well.
> > >>=20
> > >> > Maybe the name VIRTIO_RING_F_LARGE_INDIRECT_DESC might then a bit
> > >> > misleading though, because the flag would also be set for forcing =
small
> > >> > limits.
> > >>=20
> > >> VIRTIO_RING_F_CONFIGURABLE_INDIRECT_DESC ?
> > >=20
> > > As the suggested common config field is "queue_indirect_size", what a=
bout
> > > VIRTIO_RING_F_INDIRECT_SIZE ?
> >=20
> > That would work for me as well.
>=20
> Ok
>=20
> > >> > Another issue I just realized: there is also an ambiguity in this =
v2
> > >> > what
> > >> > the maximum descriptor count actually relates to. Should it be
> > >> >=20
> > >> > 1. max. indirect descriptor count per indirect descriptor table
> > >> >=20
> > >> > or
> > >> >=20
> > >> > 2. max. indirect descriptor count per vring slot (i.e. the sum from
> > >> > multiple indirect descriptor tables within the same message)
> > >> >=20
> > >> > Case 2 applies to QEMU's implementation right now AFAICS. The max.
> > >> > possible
> > >> > bulk transfer size is lower in case 2 accordingly.
> > >=20
> > > After reviewing virtio code on QEMU side again, I suggest to go for (=
2.).
> > > Otherwise a large portion of QEMU's virtio code would need quite a bu=
nch
> > > of
> > > changes to support (1.). I assume that resistence for such changes in=
 QEMU
> > > would be high, and I currently don't care enough to work on and defend
> > > those changes that (1.) would need.
> > >=20
> > > In practice that would mean for many devices: the theoretical absolute
> > > max.
> > > virtio transfer size might be cut into half with (2.) in comparison to
> > > (1.), which is (2^16 * PAGE_SIZE) / 2 =3D 128 MB with a typical page =
size
> > > of 4k, because one indirect descriptor table is usually used for send=
ing
> > > to device and another table for receiving from device. But that's use
> > > case dependent and (1.) is still a huge step forward IMO.
> >=20
> > If the variant that is easier for QEMU to implement still gives you
> > enough of what you need, I'm fine with going with that. (Is it
> > future-proof enough?)
>=20
> No crystal ball here, sorry. :)
>=20
> Just to give you a feeling what I am talking about here for QEMU, you mig=
ht
> have a quick glimpse on the hw/virtio/virtio.c changes of following patch=
=2E It
> is not exactly how the final changes would look like, but it should give a
> rough idea of what is involved:
> https://lore.kernel.org/all/c9dea2e27ae19b2b9a51e8f08687067bf3e47bd5.1633=
376313.git.qemu_oss@crudebyte.com/
>=20
> As you can see, QEMU first reserves the max. expected descriptor count as
> array memory on stack, then it gathers *all* descriptors from all indirect
> descriptor tables of a vring slot all together into that array and finally
> the vring slot's message is processed on device level:
> https://github.com/qemu/qemu/blob/99fc08366b06282614daeda989d2fde6ab8a707=
f/hw/virtio/virtio.c#L1475
>=20
> So a limit per vring slot would be much easier to implement in QEMU, as i=
t is
> more or less just refactoring of QEMU's current compile-time constant
> VIRTQUEUE_MAX_SIZE into a runtime variable.
> Implementing a limit per table instead would require substantial changes =
to
> its current program flow.
>=20
> Back to your question ...
>=20
> Assuming that most devices have one or two tables per vring slot, and
> considering that almost nobody cared for virtio's current descriptor count
> limit so far, I would not expect that the new, much higher limit to be
> questioned in the next few years or so. And if it was, you would probably=
 also
> start to question all those 16-bit fields in virtio as well and then this
> specific aspect here would probably be the smallest issue to worry about.
>=20
> OTOH if there are devices with like 10 descriptor tables or more per vring
> slot, then they obviously would hit this limit much sooner. No idea if th=
ere
> is any such device though.

Other device implementations probably also care about the total number
of descriptors per vring slot instead of the number of descriptors per
indirect table. The limitation on the device side is the resource
requirement and/or maximum supported by the underlying I/O mechanism, so
the total number of descriptors is likely to matter.

Stefan

--+YrI3QiuKFSe/Paf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGvLnMACgkQnKSrs4Gr
c8i3ZQf+MrrfkFC7CgSyurBklRz0lrNKqIEON80kj8VecfrEZwb1vGE+ifNPufG+
0Nf1VyN3+X3YoVK1pG38TRlB/VELuPjO0Hoh5ZCfTu+v8uZGH9e/9uvp0aFNalgE
HxhWOdBGtJgqCcdKxlVGG17v5vDxLq/hRjpEeMoEgH9A0ETvLoUXXVF2ZcFrTnmw
F4OLlglYnAMj80qIIh9TwD8iuTLboe26Mi0SqlnR1/E7AcM+qHTeQErIJEZmym2n
JOpAgl+Vje6ej8HBTraelVinACZYoRmED9QMosOZjB1lG0TV9A/xkKtp1GA4A/bk
E13P/jsepR4uAYrFQWAYc+hnVk19/A==
=Gg+o
-----END PGP SIGNATURE-----

--+YrI3QiuKFSe/Paf--

