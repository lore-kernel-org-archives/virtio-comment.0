Return-Path: <stefanha@redhat.com>
Date: Wed, 26 Jan 2022 10:01:05 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [virtio-comment] Re: [PATCH 2/2] Add common configuration field
 "queue_indirect_size"
Message-ID: <YfEb4Z7X1Fv86r1+@stefanha-x1.localdomain>
References: <cover.1639494803.git.qemu_oss@crudebyte.com>
 <8095093.laR55Vqryl@silver>
 <Ye7WpclmabbiicXX@stefanha-x1.localdomain>
 <3375330.OCcvr3ttbF@silver>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RqDpclEv9FzWe4dk"
Content-Disposition: inline
In-Reply-To: <3375330.OCcvr3ttbF@silver>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--RqDpclEv9FzWe4dk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 08:05:47PM +0100, Christian Schoenebeck wrote:
> On Montag, 24. Januar 2022 17:41:09 CET Stefan Hajnoczi wrote:
> > On Mon, Jan 24, 2022 at 03:31:57PM +0100, Christian Schoenebeck wrote:
> > > On Montag, 24. Januar 2022 14:39:28 CET Stefan Hajnoczi wrote:
> > > > On Wed, Jan 05, 2022 at 02:52:46PM +0100, Christian Schoenebeck wro=
te:
> > > > > On Montag, 3. Januar 2022 14:21:13 CET Cornelia Huck wrote:
> > > > > > On Wed, Dec 29 2021, Christian Schoenebeck <qemu_oss@crudebyte.=
com>
> > >=20
> > > wrote:
> > > > > > > On Donnerstag, 23. Dezember 2021 12:03:50 CET Cornelia Huck w=
rote:
> > > > > > >> On Wed, Dec 15 2021, Christian Schoenebeck
> > > > > > >> <qemu_oss@crudebyte.com>
> > > > >=20
> > > > > wrote:
> > > > > > >> > On Dienstag, 14. Dezember 2021 18:20:28 CET Cornelia Huck=
=20
> wrote:
> > > > > > >> >> Also, this is only for split ring; does packed ring need =
any
> > > > > > >> >> updates?
> > > > > > >> >=20
> > > > > > >> > I have not reviewed the packed ring as much as I did the s=
plit
> > > > > > >> > ring, so
> > > > > > >> > I
> > > > > > >> > could not say reliably all the parts that shall be updated=
 for
> > > > > > >> > the
> > > > > > >> > packed
> > > > > > >> > ring. There are some obvious parts like:
> > > > > > >> >=20
> > > > > > >> > 2.7.5 Scatter-Gather Support
> > > > > > >> >=20
> > > > > > >> > "The device limits the number of descriptors in a list thr=
ough
> > > > > > >> > a
> > > > > > >> > transport-
> > > > > > >> > specific and/or device-specific value. If not limited, the
> > > > > > >> > maximum
> > > > > > >> > number
> > > > > > >> > of descriptors in a list is the virt queue size."
> > > > > > >> >=20
> > > > > > >> > However the question is, would anybody want large descript=
or
> > > > > > >> > chains
> > > > > > >> > with
> > > > > > >> > the packaged ring in the first place? If I understand it
> > > > > > >> > correctly,
> > > > > > >> > the
> > > > > > >> > benefits of the packed ring over the split ring only manif=
est
> > > > > > >> > for
> > > > > > >> > devices
> > > > > > >> > that interchange a very large number of rather small bulk =
data
> > > > > > >> > (e.g.
> > > > > > >> > network devices), no?
> > > > > > >>=20
> > > > > > >> If we think that the feature does not make sense for packed =
ring,
> > > > > > >> they
> > > > > > >> should probably conflict with each other. Otherwise, I think=
 we
> > > > > > >> need
> > > > > > >> at
> > > > > > >> least a statement that the higher limit does not take effect=
 for
> > > > > > >> packed
> > > > > > >> ring, or touch all the places where it would be relevant.
> > > > > > >>=20
> > > > > > >> What do others think?
> > > > > > >=20
> > > > > > > It would indeed be very useful if other people express their
> > > > > > > opinion
> > > > > > > about
> > > > > > > this issue (packed ring scenario) as well before I continue on
> > > > > > > this
> > > > > > > issue.
> > > > > > >=20
> > > > > > > Probably the fact that my patches never made it through to the
> > > > > > > list
> > > > > > > were
> > > > > > > not necessarily supporting this. Should I contact somebody
> > > > > > > regarding
> > > > > > > this
> > > > > > > ML issue? Do members of the other ML also read this virtio-co=
mment
> > > > > > > list?
> > > > > >=20
> > > > > > Yes, this situation is very unsatisfactory :( (I have contacted=
 the
> > > > > > people running this list, but there have not yet been any fixes=
=2E..)
> > > > >=20
> > > > > Only my emails with patches are refused by the list. All my other
> > > > > emails
> > > > > are accepted. So not sure if the cause is really DKIM or something
> > > > > else.
> > > > > Maybe the admins can suggest a workaround for me.
> > > > >=20
> > > > > > Not sure which other lists would be appropriate to cc: -- maybe
> > > > > > virtualization@lists.linux-foundation.org, but that one also su=
ffers
> > > > > > from DKIM issues :(
> > > > >=20
> > > > > What I thought was wether subscribers of virtio-dev would typical=
ly
> > > > > read
> > > > > virtio-comment as well. Because AFAICS people who more frequently=
 deal
> > > > > with
> > > > > virtio for their companies rather seem to post to virtio-dev.
> > > > >=20
> > > > > > > I tried to compensate the current situation by updating the
> > > > > > > corresponding
> > > > > > > issue description on Github in a very defailed and verbose wa=
y:
> > > > > > > https://github.com/oasis-tcs/virtio-spec/issues/122
> > > > > >=20
> > > > > > Thanks. Hopefully me quoting this makes it more visible (I trie=
d to
> > > > > > quote more than I usually would in my other replies already...)
> > > > > >=20
> > > > > > Just to feature it more prominently for people who collapse quo=
tes:
> > > > > >=20
> > > > > > https://github.com/oasis-tcs/virtio-spec/issues/122
> > > > > >=20
> > > > > > > If nobody replies early January, I would suggest to continue =
by
> > > > > > > ignoring
> > > > > > > the packed ring. Because if somebody wants this for packed ri=
ng in
> > > > > > > future, this can still be added to the specs without breaking
> > > > > > > things,
> > > > > > > because this feature is negotiated per queue, not for the ent=
ire
> > > > > > > device.
> > > > > >=20
> > > > > > The problem is that we need to specify what is supposed to happ=
en if
> > > > > > packed ring *and* this feature are negotiated. If we do not wan=
t to
> > > > > > add
> > > > > > statements for the packed ring case, my suggestion would be
> > > > > > - make packed ring and this feature mutually exclusive
> > > > > > - add a new feature bit that works with packed ring later, if we
> > > > > > think
> > > > > >=20
> > > > > >   it is useful
> > > > >=20
> > > > > Mja, I have to correct myself on that: I wrote in my previous ema=
il
> > > > > that
> > > > > this was negotiated per queue. That's false of course as all virt=
io
> > > > > features are currently negotiated for the entire device.
> > > > >=20
> > > > > So you are right, if this new indirect size feature was negotiated
> > > > > then it
> > > > > would apply to both a) split rings and b) packed rings a device m=
ight
> > > > > have.
> > > > > Which is unfortunate.
> > > > >=20
> > > > > Stefan, you are aware about this circumstance as well, right? Bec=
ause
> > > > > I
> > > > > remember we originally had a discussion on qemu-devel where you w=
anted
> > > > > to
> > > > > have this configurable per queue, not per device.
> > > >=20
> > > > Regarding packed virtqueues, there are multiple reasons for using t=
hem.
> > > > Recently someone asked about reducing complexity in VIRTIO
> > > > implementations and one of the suggestions that Michael Tsirkin and=
 I
> > > > both made independently was to use the packed layout instead of spl=
it
> > > > layout. I don't think we should assume packed virtqueues are only u=
sed
> > > > in scenarios that don't need INDIRECT_SIZE.
> > > >=20
> > > > Extending INDIRECT_SIZE to packed virtqueues looks straightforward =
and
> > > > does not require many changes to the Packed Virtqueues section.
> > >=20
> > > Yes I agree, it does make sense to apply this new INDIRECT_SIZE featu=
re to
> > > packed queues as well.
> > >=20
> > > > The reason I pushed for per-virtqueue Indirect Size values is becau=
se
> > > > multi-virtqueue devices have specific purposes for each virtqueue. =
The
> > > > Queue Size field is per-virtqueue already across all transports. Th=
is
> > > > way a device with control virtqueue can allocate fewer resources
> > > > (smaller Queue Size and Indirect Size) to it than to the data path
> > > > virtqueues that carry I/O data buffers.
> > > >=20
> > > > I don't think it's necessary to support INDIRECT_SIZE on only a sub=
set
> > > > of a device's virtqueues. If the device doesn't want to "enable"
> > > > INDIRECT_SIZE on a specific virtqueue it should just report Queue S=
ize
> > > > as the Indirect Size value?
> > >=20
> > > Or another idea: what about adding this new indirect size field to the
> > > struct that holds the queue size field already, then this would become
> > > transport- independent (i.e. the discussed PCI config field would be
> > > unnecessary), and it would be a feature configurable per queue. Or is
> > > that struct inappropriate for feature negotiation purposes?
> >=20
> > There is no transport-independent struct that contains Queue Size. It is
> > handled by struct virtio_pci_common_cfg->queue_size, the MMIO QueueNum
> > register, and the CCW struct vq_config_block->max_num and struct
> > vq_info_block->num fields.
>=20
> Aaah, I just realized I was completely confused about
> struct virtio_pci_common_cfg: so far I assumed this were all entirely dev=
ice=20
> global settings.
>=20
> The respective queue is first selected via 'queue_select' field and then =
the=20
> subsequent fields reflect the selected queue. Now I got it.
>=20
> Ok fine, then the current draft actually already negotiated the indirect =
size=20
> for each queue independently already, without me even being aware. ;-)
>=20
> I guess I know all I need then for the next round of patches. Maybe I als=
o=20
> come along for changes for MMIO and CCW side, we'll see.

Awesome!

Stefan

--RqDpclEv9FzWe4dk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxG+EACgkQnKSrs4Gr
c8jMuwf/ScXsLV+ez3zIpQW5k0f9xVTkHYhrU+WvnZqpi+2zI5m5KgSI+g7xCYJw
9svf3c3t0gU1irCa6KPwpG5cZnLAk3i7GtYY9yNXgh9EeQdHNRLPIbfMDgJl3i8c
1O0dnZWZJjL/VoDkMTz9k3Xnva9JaC3X73x9uA5gUZvinzawgGPVaByuQ8nBVnN6
AwkufqONnXjjUXedZZjd3eN0sQvTUsyDwxkTP4lrdbo806k9emoNGT9R1nYkYxRT
XvbUkPXwC+gzkclXymjYBMOWyY10QXv+DmC0H3ukpnAvvOnNO+BCH1H9NMhcxih+
DnPEqugFAGhIFqTs18M49wWs+fLaFQ==
=GkwE
-----END PGP SIGNATURE-----

--RqDpclEv9FzWe4dk--

