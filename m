Return-Path: <virtio-comment-return-2621-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3130A98642F
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Jan 2022 13:39:37 +0000 (UTC)
Date: Mon, 24 Jan 2022 13:39:28 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <Ye6sEJdHgCgapY+Q@stefanha-x1.localdomain>
References: <cover.1639494803.git.qemu_oss@crudebyte.com>
 <1920878.uA8gqIOdmR@silver>
 <87ilv13qgm.fsf@redhat.com>
 <1666446.X5bIldzbpb@silver>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ljabih08sukSsKab"
Content-Disposition: inline
In-Reply-To: <1666446.X5bIldzbpb@silver>
Subject: [virtio-comment] Re: [PATCH 2/2] Add common configuration field "queue_indirect_size"
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

--ljabih08sukSsKab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 02:52:46PM +0100, Christian Schoenebeck wrote:
> On Montag, 3. Januar 2022 14:21:13 CET Cornelia Huck wrote:
> > On Wed, Dec 29 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wro=
te:
> > > On Donnerstag, 23. Dezember 2021 12:03:50 CET Cornelia Huck wrote:
> > >> On Wed, Dec 15 2021, Christian Schoenebeck <qemu_oss@crudebyte.com>=
=20
> wrote:
> > >> > On Dienstag, 14. Dezember 2021 18:20:28 CET Cornelia Huck wrote:
> > >> >> Also, this is only for split ring; does packed ring need any upda=
tes?
> > >> >=20
> > >> > I have not reviewed the packed ring as much as I did the split rin=
g, so
> > >> > I
> > >> > could not say reliably all the parts that shall be updated for the
> > >> > packed
> > >> > ring. There are some obvious parts like:
> > >> >=20
> > >> > 2.7.5 Scatter-Gather Support
> > >> >=20
> > >> > "The device limits the number of descriptors in a list through a
> > >> > transport-
> > >> > specific and/or device-specific value. If not limited, the maximum
> > >> > number
> > >> > of descriptors in a list is the virt queue size."
> > >> >=20
> > >> > However the question is, would anybody want large descriptor chains
> > >> > with
> > >> > the packaged ring in the first place? If I understand it correctly=
, the
> > >> > benefits of the packed ring over the split ring only manifest for
> > >> > devices
> > >> > that interchange a very large number of rather small bulk data (e.=
g.
> > >> > network devices), no?
> > >>=20
> > >> If we think that the feature does not make sense for packed ring, th=
ey
> > >> should probably conflict with each other. Otherwise, I think we need=
 at
> > >> least a statement that the higher limit does not take effect for pac=
ked
> > >> ring, or touch all the places where it would be relevant.
> > >>=20
> > >> What do others think?
> > >=20
> > > It would indeed be very useful if other people express their opinion =
about
> > > this issue (packed ring scenario) as well before I continue on this i=
ssue.
> > >=20
> > > Probably the fact that my patches never made it through to the list w=
ere
> > > not necessarily supporting this. Should I contact somebody regarding =
this
> > > ML issue? Do members of the other ML also read this virtio-comment li=
st?
> > Yes, this situation is very unsatisfactory :( (I have contacted the
> > people running this list, but there have not yet been any fixes...)
>=20
> Only my emails with patches are refused by the list. All my other emails =
are=20
> accepted. So not sure if the cause is really DKIM or something else. Mayb=
e the=20
> admins can suggest a workaround for me.
>=20
> > Not sure which other lists would be appropriate to cc: -- maybe
> > virtualization@lists.linux-foundation.org, but that one also suffers
> > from DKIM issues :(
>=20
> What I thought was wether subscribers of virtio-dev would typically read=
=20
> virtio-comment as well. Because AFAICS people who more frequently deal wi=
th=20
> virtio for their companies rather seem to post to virtio-dev.
>=20
> > > I tried to compensate the current situation by updating the correspon=
ding
> > > issue description on Github in a very defailed and verbose way:
> > > https://github.com/oasis-tcs/virtio-spec/issues/122
> >=20
> > Thanks. Hopefully me quoting this makes it more visible (I tried to
> > quote more than I usually would in my other replies already...)
> >=20
> > Just to feature it more prominently for people who collapse quotes:
> >=20
> > https://github.com/oasis-tcs/virtio-spec/issues/122
> >=20
> > > If nobody replies early January, I would suggest to continue by ignor=
ing
> > > the packed ring. Because if somebody wants this for packed ring in
> > > future, this can still be added to the specs without breaking things,
> > > because this feature is negotiated per queue, not for the entire devi=
ce.
> >=20
> > The problem is that we need to specify what is supposed to happen if
> > packed ring *and* this feature are negotiated. If we do not want to add
> > statements for the packed ring case, my suggestion would be
> > - make packed ring and this feature mutually exclusive
> > - add a new feature bit that works with packed ring later, if we think
> >   it is useful
>=20
> Mja, I have to correct myself on that: I wrote in my previous email that =
this=20
> was negotiated per queue. That's false of course as all virtio features a=
re=20
> currently negotiated for the entire device.
>=20
> So you are right, if this new indirect size feature was negotiated then i=
t=20
> would apply to both a) split rings and b) packed rings a device might hav=
e.=20
> Which is unfortunate.
>
> Stefan, you are aware about this circumstance as well, right? Because I=
=20
> remember we originally had a discussion on qemu-devel where you wanted to=
 have=20
> this configurable per queue, not per device.

Regarding packed virtqueues, there are multiple reasons for using them.
Recently someone asked about reducing complexity in VIRTIO
implementations and one of the suggestions that Michael Tsirkin and I
both made independently was to use the packed layout instead of split
layout. I don't think we should assume packed virtqueues are only used
in scenarios that don't need INDIRECT_SIZE.

Extending INDIRECT_SIZE to packed virtqueues looks straightforward and
does not require many changes to the Packed Virtqueues section.

The reason I pushed for per-virtqueue Indirect Size values is because
multi-virtqueue devices have specific purposes for each virtqueue. The
Queue Size field is per-virtqueue already across all transports. This
way a device with control virtqueue can allocate fewer resources
(smaller Queue Size and Indirect Size) to it than to the data path
virtqueues that carry I/O data buffers.

I don't think it's necessary to support INDIRECT_SIZE on only a subset
of a device's virtqueues. If the device doesn't want to "enable"
INDIRECT_SIZE on a specific virtqueue it should just report Queue Size
as the Indirect Size value?

Stefan

--ljabih08sukSsKab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHurBAACgkQnKSrs4Gr
c8gFuQf9Eack/Lx0eLmwfPMktBCbi+P15h72usUlVEOqcJySXEtwIwt9e2HUL/rv
ZCFfbTYTyljgmc5t10Mr8jnCkhsPhwx0qSjNqzNqhiMPBLpDYMFr7OXHmnDRP5Jk
0pJRfWlJXP5Hv6KZsVVBr4iv5c6BunIjGzZx1Om3QToFED/6P61/mw82xasF2sgH
Fvu46MthFtDjWu4VSI6vlXnR6Hgp9v7Gaw2FZeh1fRTehiT1yl6hNlK2N02ioDkQ
60Lx165/d3WOdev0XNcjIqFp8VkJJt6oa8jV/xUmXYi41p3RZ5u6uc1a0+YfRz8M
eo9sEOwwyzlncZV+6VrhWSzGnxygkA==
=lnrl
-----END PGP SIGNATURE-----

--ljabih08sukSsKab--

