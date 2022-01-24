Return-Path: <stefanha@redhat.com>
Date: Mon, 24 Jan 2022 16:41:09 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-comment] Re: [PATCH 2/2] Add common configuration field
 "queue_indirect_size"
Message-ID: <Ye7WpclmabbiicXX@stefanha-x1.localdomain>
References: <cover.1639494803.git.qemu_oss@crudebyte.com>
 <1666446.X5bIldzbpb@silver>
 <Ye6sEJdHgCgapY+Q@stefanha-x1.localdomain>
 <8095093.laR55Vqryl@silver>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WN9HWdA7cByv7G3T"
Content-Disposition: inline
In-Reply-To: <8095093.laR55Vqryl@silver>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--WN9HWdA7cByv7G3T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 24, 2022 at 03:31:57PM +0100, Christian Schoenebeck wrote:
> On Montag, 24. Januar 2022 14:39:28 CET Stefan Hajnoczi wrote:
> > On Wed, Jan 05, 2022 at 02:52:46PM +0100, Christian Schoenebeck wrote:
> > > On Montag, 3. Januar 2022 14:21:13 CET Cornelia Huck wrote:
> > > > On Wed, Dec 29 2021, Christian Schoenebeck <qemu_oss@crudebyte.com>=
=20
> wrote:
> > > > > On Donnerstag, 23. Dezember 2021 12:03:50 CET Cornelia Huck wrote:
> > > > >> On Wed, Dec 15 2021, Christian Schoenebeck <qemu_oss@crudebyte.c=
om>
> > >=20
> > > wrote:
> > > > >> > On Dienstag, 14. Dezember 2021 18:20:28 CET Cornelia Huck wrot=
e:
> > > > >> >> Also, this is only for split ring; does packed ring need any
> > > > >> >> updates?
> > > > >> >=20
> > > > >> > I have not reviewed the packed ring as much as I did the split
> > > > >> > ring, so
> > > > >> > I
> > > > >> > could not say reliably all the parts that shall be updated for=
 the
> > > > >> > packed
> > > > >> > ring. There are some obvious parts like:
> > > > >> >=20
> > > > >> > 2.7.5 Scatter-Gather Support
> > > > >> >=20
> > > > >> > "The device limits the number of descriptors in a list through=
 a
> > > > >> > transport-
> > > > >> > specific and/or device-specific value. If not limited, the max=
imum
> > > > >> > number
> > > > >> > of descriptors in a list is the virt queue size."
> > > > >> >=20
> > > > >> > However the question is, would anybody want large descriptor c=
hains
> > > > >> > with
> > > > >> > the packaged ring in the first place? If I understand it corre=
ctly,
> > > > >> > the
> > > > >> > benefits of the packed ring over the split ring only manifest =
for
> > > > >> > devices
> > > > >> > that interchange a very large number of rather small bulk data
> > > > >> > (e.g.
> > > > >> > network devices), no?
> > > > >>=20
> > > > >> If we think that the feature does not make sense for packed ring,
> > > > >> they
> > > > >> should probably conflict with each other. Otherwise, I think we =
need
> > > > >> at
> > > > >> least a statement that the higher limit does not take effect for
> > > > >> packed
> > > > >> ring, or touch all the places where it would be relevant.
> > > > >>=20
> > > > >> What do others think?
> > > > >=20
> > > > > It would indeed be very useful if other people express their opin=
ion
> > > > > about
> > > > > this issue (packed ring scenario) as well before I continue on th=
is
> > > > > issue.
> > > > >=20
> > > > > Probably the fact that my patches never made it through to the li=
st
> > > > > were
> > > > > not necessarily supporting this. Should I contact somebody regard=
ing
> > > > > this
> > > > > ML issue? Do members of the other ML also read this virtio-comment
> > > > > list?
> > > >=20
> > > > Yes, this situation is very unsatisfactory :( (I have contacted the
> > > > people running this list, but there have not yet been any fixes...)
> > >=20
> > > Only my emails with patches are refused by the list. All my other ema=
ils
> > > are accepted. So not sure if the cause is really DKIM or something el=
se.
> > > Maybe the admins can suggest a workaround for me.
> > >=20
> > > > Not sure which other lists would be appropriate to cc: -- maybe
> > > > virtualization@lists.linux-foundation.org, but that one also suffers
> > > > from DKIM issues :(
> > >=20
> > > What I thought was wether subscribers of virtio-dev would typically r=
ead
> > > virtio-comment as well. Because AFAICS people who more frequently deal
> > > with
> > > virtio for their companies rather seem to post to virtio-dev.
> > >=20
> > > > > I tried to compensate the current situation by updating the
> > > > > corresponding
> > > > > issue description on Github in a very defailed and verbose way:
> > > > > https://github.com/oasis-tcs/virtio-spec/issues/122
> > > >=20
> > > > Thanks. Hopefully me quoting this makes it more visible (I tried to
> > > > quote more than I usually would in my other replies already...)
> > > >=20
> > > > Just to feature it more prominently for people who collapse quotes:
> > > >=20
> > > > https://github.com/oasis-tcs/virtio-spec/issues/122
> > > >=20
> > > > > If nobody replies early January, I would suggest to continue by
> > > > > ignoring
> > > > > the packed ring. Because if somebody wants this for packed ring in
> > > > > future, this can still be added to the specs without breaking thi=
ngs,
> > > > > because this feature is negotiated per queue, not for the entire
> > > > > device.
> > > >=20
> > > > The problem is that we need to specify what is supposed to happen if
> > > > packed ring *and* this feature are negotiated. If we do not want to=
 add
> > > > statements for the packed ring case, my suggestion would be
> > > > - make packed ring and this feature mutually exclusive
> > > > - add a new feature bit that works with packed ring later, if we th=
ink
> > > >=20
> > > >   it is useful
> > >=20
> > > Mja, I have to correct myself on that: I wrote in my previous email t=
hat
> > > this was negotiated per queue. That's false of course as all virtio
> > > features are currently negotiated for the entire device.
> > >=20
> > > So you are right, if this new indirect size feature was negotiated th=
en it
> > > would apply to both a) split rings and b) packed rings a device might
> > > have.
> > > Which is unfortunate.
> > >=20
> > > Stefan, you are aware about this circumstance as well, right? Because=
 I
> > > remember we originally had a discussion on qemu-devel where you wante=
d to
> > > have this configurable per queue, not per device.
> >=20
> > Regarding packed virtqueues, there are multiple reasons for using them.
> > Recently someone asked about reducing complexity in VIRTIO
> > implementations and one of the suggestions that Michael Tsirkin and I
> > both made independently was to use the packed layout instead of split
> > layout. I don't think we should assume packed virtqueues are only used
> > in scenarios that don't need INDIRECT_SIZE.
> >=20
> > Extending INDIRECT_SIZE to packed virtqueues looks straightforward and
> > does not require many changes to the Packed Virtqueues section.
>=20
> Yes I agree, it does make sense to apply this new INDIRECT_SIZE feature t=
o=20
> packed queues as well.
>=20
> > The reason I pushed for per-virtqueue Indirect Size values is because
> > multi-virtqueue devices have specific purposes for each virtqueue. The
> > Queue Size field is per-virtqueue already across all transports. This
> > way a device with control virtqueue can allocate fewer resources
> > (smaller Queue Size and Indirect Size) to it than to the data path
> > virtqueues that carry I/O data buffers.
> >=20
> > I don't think it's necessary to support INDIRECT_SIZE on only a subset
> > of a device's virtqueues. If the device doesn't want to "enable"
> > INDIRECT_SIZE on a specific virtqueue it should just report Queue Size
> > as the Indirect Size value?
>=20
> Or another idea: what about adding this new indirect size field to the st=
ruct=20
> that holds the queue size field already, then this would become transport-
> independent (i.e. the discussed PCI config field would be unnecessary), a=
nd it=20
> would be a feature configurable per queue. Or is that struct inappropriat=
e for=20
> feature negotiation purposes?

There is no transport-independent struct that contains Queue Size. It is
handled by struct virtio_pci_common_cfg->queue_size, the MMIO QueueNum
register, and the CCW struct vq_config_block->max_num and struct
vq_info_block->num fields.

Stefan

--WN9HWdA7cByv7G3T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHu1qQACgkQnKSrs4Gr
c8ilxQf+IOMVYutnfaukpHAt6zRqm3VHdzh3EEQCAUFxJMAAGhj3Ojv4+LltFclx
ZbXUtBZuUKatJf+OFMTo4ZLP/jFCxIvnqUpjeLXYzMaXnyWudSDA9i3BOt+CyUTO
0Ib803GWr1Pa3INrZ9dh/vb3NwcfERn1wF1aXTr8B8UyFcsA1QS9XoLDpN6fydre
eeXyF5NhIg9Oj2UFbuOwQZGTxQ5pZyePJQhn4Ao0Guu944WraqdenX4rQlm+a9T2
u6Fp7GvNsP+h6w2Ie26n3DqfH1uousioDqDuQaL3DkuCRn1WhbJfWcBUFf5kT6bv
C39G9AMOZ0KN9ojTL1jwN5Ua/Eadlw==
=RNmA
-----END PGP SIGNATURE-----

--WN9HWdA7cByv7G3T--

