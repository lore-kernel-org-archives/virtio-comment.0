Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v3 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Date: Fri, 18 Mar 2022 11:45:17 +0100
Message-ID: <2293264.5yAKUOBhjF@silver>
In-Reply-To: <87fsngsnn8.fsf@redhat.com>
References: <4735344.EBYxvr1mta@silver> <2620465.pcdoKKQM6k@silver> <87fsngsnn8.fsf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Donnerstag, 17. M=E4rz 2022 14:40:27 CET Cornelia Huck wrote:
> On Wed, Mar 16 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote=
:
> > This new feature flag allows to decouple the maximum amount of
> > descriptors in indirect descriptor tables from the Queue Size.
> >=20
> > The new term "Queue Indirect Size" is introduced for this purpose,
> > which is a transport specific configuration whose negotiation is
> > further specified for each transport with subsequent patches.
> >=20
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >=20
> >  content.tex     | 32 ++++++++++++++++++++++++++++++--
> >  packed-ring.tex |  2 +-
> >  split-ring.tex  |  8 ++++++--
> >  3 files changed, 37 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/content.tex b/content.tex
> > index c6f116c..685525d 100644
> > --- a/content.tex
> > +++ b/content.tex
>=20
> (...)
>=20
> > @@ -1051,6 +1051,10 @@ \subsubsection{Common configuration structure
> > layout}\label{sec:Virtio Transport>=20
> >  present either a value of 0 or a power of 2 in
> >  \field{queue_size}.
> >=20
> > +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the device MUST
> > provide the +Queue Indirect Size supported by device, which is a
> > transport specific
> "supported by the device", or maybe "it supports"?

Article "the" is missing here, yes. Both "the device" or "it" would be fine=
.

> > +configuration. It MUST allow the driver to set a lower value.
>=20
> Maybe "It MUST allow the driver to specify a lower maximum size." ?

That exact phrase was actually suggested by you (2021-12-14 18:20). I have =
no=20
strong opinion on that. I find the existing "to set a lower value" clear=20
enough and a less complicated wording though.

> > +
> >=20
> >  \drivernormative{\paragraph}{Common configuration structure
> >  layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device
> >  Layout / Common configuration structure layout}
> > =20
> >  The driver MUST NOT write to \field{device_feature}, \field{num_queues=
},
> >  \field{config_generation}, \field{queue_notify_off} or
> >  \field{queue_notify_data}.>=20
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
>=20
> s/enabled/negotiated/ ?

Also no strong opinion on that. "negotiated" makes it a bit more clear, yes=
.

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
> > specific Queue Indirect Size value MUST additionally +  be negotiated i=
f
> > VIRTIO_RING_F_INDIRECT_SIZE was negotiated to subsequently +  negotiate
> > the actual amount of maximum indirect descriptors supported +  by both
> > sides.
>=20
> No 'MUST' in non-normative sections, please. Maybe make that
>=20
> "and therefore the device and the driver additionally need to negotiate
> the transport specific Queue Indirect Size value if
> VIRTIO_RING_F_INDIRECT_SIZE was negotiated in order to determine the
> actual amount of maximum indirect descriptors supported by both."

Yes, that still slipped through, sorry. That change looks fine to me.

> I'm not sure whether we would actually need some normative statements in
> the sections below, but probably not.

Like what would you potentially miss here?

> > +
> >=20
> >  \end{description}
> > =20
> >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bit=
s}


