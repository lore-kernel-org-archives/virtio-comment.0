Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [virtio-comment] [PATCH v3 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Date: Sat, 19 Mar 2022 13:00:28 +0100
Message-ID: <8451025.v97J4D4Zi3@silver>
In-Reply-To: <CAJWYKVxGygN42ukOE9eoT9ksK9zxwJD5d0jy--_T6=5d=eBoEA@mail.gmail.com>
References: <4735344.EBYxvr1mta@silver> <2620465.pcdoKKQM6k@silver> <CAJWYKVxGygN42ukOE9eoT9ksK9zxwJD5d0jy--_T6=5d=eBoEA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Samstag, 19. M=E4rz 2022 10:33:49 CET Michael S. Tsirkin wrote:
> On Wed, Mar 16, 2022, 15:47 Christian Schoenebeck <qemu_oss@crudebyte.com=
>
>=20
> wrote:
> > This new feature flag allows to decouple the maximum amount of
> > descriptors in indirect descriptor tables from the Queue Size.
>=20
> if we are extending these limits, I suggest reusing the feature flag to
> also add a limit on total s/g list size. making it separate from queue si=
ze
> was requested a while ago.

What do you mean with "total s/g list size"? The maximum bulk data size per=
=20
message? Sum of both in and out s/g lists' bulk data or only for one of the=
m?=20
Or maximum size of exactly only one memory segment?

And are you suggesting this should become part of this series already?

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
> > @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities o=
f a
> > Virtio Device / Feature B
> >=20
> >  \begin{description}
> >  \item[0 to 23, and 50 to 127] Feature bits for the specific device typ=
e
> >=20
> > -\item[24 to 40] Feature bits reserved for extensions to the queue and
> > +\item[24 to 41] Feature bits reserved for extensions to the queue and
> >=20
> >    feature negotiation mechanisms
> >=20
> > -\item[41 to 49, and 128 and above] Feature bits reserved for future
> > extensions.
> > +\item[42 to 49, and 128 and above] Feature bits reserved for future
> > extensions.
> >=20
> >  \end{description}
> > =20
> >  \begin{note}
> >=20
> > @@ -1051,6 +1051,10 @@ \subsubsection{Common configuration structure
> > layout}\label{sec:Virtio Transport
> >=20
> >  present either a value of 0 or a power of 2 in
> >  \field{queue_size}.
> >=20
> > +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the device MUST
> > provide the
> > +Queue Indirect Size supported by device, which is a transport specific
> > +configuration. It MUST allow the driver to set a lower value.
> > +
> >=20
> >  \drivernormative{\paragraph}{Common configuration structure
> >=20
> > layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Lay=
out
> > / Common configuration structure layout}
> >=20
> >  The driver MUST NOT write to \field{device_feature}, \field{num_queues=
},
> >=20
> > \field{config_generation}, \field{queue_notify_off} or
> > \field{queue_notify_data}.
> > @@ -6847,6 +6851,30 @@ \chapter{Reserved Feature Bits}\label{sec:Reserv=
ed
> > Feature Bits}
> >=20
> >    that the driver can reset a queue individually.
> >    See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues /
> >=20
> > Virtqueue Reset}.
> >=20
> > +  \item[VIRTIO_RING_F_INDIRECT_SIZE(41)] This feature indicates that t=
he
> > +  Queue Indirect Size, i.e. the maximum amount of descriptors in indir=
ect
> > +  descriptor tables, is independent from the Queue Size.
> > +
> > +  Without this feature, the Queue Size limits the length of the
> > descriptor
> > +  chain, including indirect descriptor tables as in \ref{sec:Basic
> > Facilities of
> > +  a Virtio Device / Virtqueues / The Virtqueue Descriptor Table /
> > Indirect
> > +  Descriptors}, i.e. both the maximum amount of slots in the vring and
> > the
> > +  actual bulk data size transmitted per vring slot.
>=20
> spect does not call these  slots elsewhere.

Yes, I intentionally used "vring slot" instead of "buffer" as I find the=20
latter too vague in this context. A "buffer" can be a memory segment, a set=
 of=20
memory segments and what not. "vring slot" OTOH makes it clear that it is=
=20
about exactly one, atomic pointer (hence with fixed size) in a Ring Buffer,=
 as=20
depicted in the ASCII illustration here:

https://github.com/oasis-tcs/virtio-spec/issues/122

The maximum amount of vring slots is therefore the maximum amount of messag=
es=20
that can be emplaced into a Ring Buffer, independent of any "bulk data buff=
er=20
size".

>=20
>=20
> +
>=20
> > +  With this feature enabled, the Queue Size only limits the maximum
> > amount
> > +  of slots in the vring, but does not limit the actual bulk data size
> > +  being transmitted when indirect descriptors are used. Decoupling the=
se
> > +  two configuration parameters this way not only allows much larger bu=
lk
> > data
> > +  being transferred per vring slot, but also avoids complicated
> > synchronization
> > +  mechanisms if the device only supports a very small amount of vring
> > slots. Due
> > +  to the 16-bit size of a descriptor's "next" field there is still an
> > absolute
> > +  limit of $2^{16}$ descriptors per indirect descriptor table. However
> > the
> > +  actual maximum amount supported by either device or driver might be
> > less,
> > +  and therefore the bus specific Queue Indirect Size value MUST
> > additionally
> > +  be negotiated if VIRTIO_RING_F_INDIRECT_SIZE was negotiated to
> > subsequently
> > +  negotiate the actual amount of maximum indirect descriptors supporte=
d
> > +  by both sides.
>=20
> still not sure what exactly is the value. e.g. in a buffer including
> indirect and direct descriptors.
>=20
> +
>=20
> >  \end{description}
> > =20
> >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bit=
s}
> >=20
> > diff --git a/packed-ring.tex b/packed-ring.tex
> > index a9e6c16..e26d112 100644
> > --- a/packed-ring.tex
> > +++ b/packed-ring.tex
> > @@ -195,7 +195,7 @@ \subsection{Scatter-Gather Support}
> >=20
> >  The device limits the number of descriptors in a list through a
> >  transport-specific and/or device-specific value. If not limited,
> >  the maximum number of descriptors in a list is the virt queue
> >=20
> > -size.
> > +size unless the VIRTIO_RING_F_INDIRECT_SIZE feature has been negotiate=
d.
> >=20
> >  \subsection{Next Flag: Descriptor Chaining}
> >  \label{sec:Packed Virtqueues / Next Flag: Descriptor Chaining}
> >=20
> > diff --git a/split-ring.tex b/split-ring.tex
> > index de94038..eaa90c3 100644
> > --- a/split-ring.tex
> > +++ b/split-ring.tex
> > @@ -268,8 +268,12 @@ \subsubsection{Indirect Descriptors}\label{sec:Bas=
ic
> > Facilities of a Virtio Devi
> >=20
> >  set the VIRTQ_DESC_F_INDIRECT flag within an indirect descriptor (ie.
> >  only
> >  one table per descriptor).
> >=20
> > -A driver MUST NOT create a descriptor chain longer than the Queue Size=
 of
> > -the device.
>=20
> +If VIRTIO_RING_F_INDIRECT_SIZE has not been negotiated, the driver MUST
>=20
> > +NOT create a descriptor chain longer than the Queue Size of the device=
.
> > +
> > +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the number of
> > +descriptors per indirect descriptor table MUST NOT exceed the negotiat=
ed
> > +Queue Indirect Size.
>=20
> it is not negotiated is it?

What makes you think it is not negotiated?

>=20
> >  A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEXT
> >  in \field{flags}.
> >=20
> > --
> > 2.30.2
> >=20
> >=20
> >=20
> >=20
> >=20
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >=20
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >=20
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
> > List Guidelines:
> > https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/


