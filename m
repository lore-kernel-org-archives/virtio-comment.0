Return-Path: <stefanha@redhat.com>
Date: Mon, 6 Dec 2021 13:54:01 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 2/2] Add common configuration field
 "queue_indirect_size"
Message-ID: <Ya4V+ckeQELWKI14@stefanha-x1.localdomain>
References: <cover.1638192251.git.qemu_oss@crudebyte.com>
 <4f5146a4bcbe59a76698e276216ef4a4d2270b61.1638192251.git.qemu_oss@crudebyte.com>
 <YajycS/6kFMgTDVy@stefanha-x1.localdomain>
 <5089970.kXHs69otit@silver>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kK67RIqkwl8ErjFb"
Content-Disposition: inline
In-Reply-To: <5089970.kXHs69otit@silver>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--kK67RIqkwl8ErjFb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 03, 2021 at 04:03:26PM +0100, Christian Schoenebeck wrote:
> On Donnerstag, 2. Dezember 2021 17:21:05 CET Stefan Hajnoczi wrote:
> > On Mon, Nov 29, 2021 at 02:23:01PM +0100, Christian Schoenebeck wrote:
> > > This new common configuration field allows to negotiate a more fine
> > > graded numeric maximum length of indirect descriptor chains.
> > >=20
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > >=20
> > >  content.tex    | 37 ++++++++++++++++++++++++++++++++++++-
> > >  split-ring.tex |  5 +++++
> > >  2 files changed, 41 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/content.tex b/content.tex
> > > index 34fa23e..25861f3 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -859,6 +859,7 @@ \subsubsection{Common configuration structure
> > > layout}\label{sec:Virtio Transport>=20
> > >          le64 queue_driver;              /* read-write */
> > >          le64 queue_device;              /* read-write */
> > >          le16 queue_notify_data;         /* read-only for driver */
> > >=20
> > > +        le16 queue_indirect_size;       /* read-write */
> > >=20
> > >  };
> > >  \end{lstlisting}
> > >=20
> > > @@ -938,6 +939,34 @@ \subsubsection{Common configuration structure
> > > layout}\label{sec:Virtio Transport>=20
> > >          may benefit from providing another value, for example an int=
ernal
> > >          virtqueue
> > >          identifier, or an internal offset related to the virtqueue
> > >          number.
> > >          \end{note}
> > >=20
> > > +
> > > +\item[\field{queue_indirect_size}]
> > > +        This field was added in revision 3 and MUST exist if revisio=
n 3
> > > +        has been negotiated. This field is used to negotiate the max=
imum
> > > +        amount of indirect descriptors per indirect descriptor table=
 as
> > > in
> > > +        \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / =
The
> > > +        Virtqueue Descriptor Table / Indirect Descriptors}.
> > > +
> > > +        The device specifies its supported maximum amount here first,
> > > +        subsequently driver may read and then SHOULD write this fiel=
d to
> > > +        lower the value if driver's maximum amount of indirect
> > > descriptors
> > > +        ever being emplaced by driver per vring slot is less than wh=
at
> > > +        device supports. However driver MUST NOT increase this value.
> >=20
> > may/SHOULD/MUST NOT statements need to go into drivernormative or
> > devicenormative sections.
> >=20
> > I suggest phrasing it so functionality is described here and normative
> > sections don't repeat what was already covered:
> >=20
> >   The device specifies its maximum supported number of descriptors per
> >   indirect descriptor table. If the driver requires fewer descriptors,
> >   it writes its lower value to inform the device of the reduced resource
> >   requirements.
> >=20
> > The drivernormative section would say:
> >=20
> > - The driver SHOULD write the field if its maximum number of descriptors
> >   per indirect descriptor table is lower than that reported by the
> >   device.
> > - The driver MUST NOT write a higher value than the one it reads from
> >   the device.
>=20
> I don't understand which sections you see as "drivernormative" and which =
ones=20
> not. Which precise sections in the spec do you want those comments to go =
to?

The spec is structured so that each section contains:

- Description
  \section{Foo}\label{sec:Bar / Foo}

- Driver requirements sub-section (optional)
  \drivernormative{\subsection}{Foo}{Bar / Foo}

- Device requirements sub-section (optional)
  \devicenormative{\subsection}{Foo}{Bar / Foo}

The driver and device requirements are kept separate from the
description, so normative statements (SHOULD, MUST, etc) are not
supposed to be used in the description text. Each driver and device
requirements sub-section is referenced from conformance.tex, a single
chapter at the end of the spec that lists all the normative
sub-sections.

Here is where I would put the spec changes:

- In "Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / =
Common configuration structure layout" (4.1.4.3 Common configuration struct=
ure layout in VIRTIO 1.1):

  \item[\field{queue_indirect_size}] The device specifies its maximum
  supported number of descriptors per indirect descriptor table. If the
  driver requires fewer descriptors, it writes its lower value to inform
  the device of the reduced resource requirements.

- In the \drivernormative paragraph for "Virtio Transport Options / Virtio =
Over PCI Bus / PCI Device Layout / Common configuration structure layout" (=
4.1.4.3.2 Driver Requirements: Common configuration structure layout in VIR=
TIO 1.1):

  The driver SHOULD write the field if its maximum number of descriptors
  per indirect descriptor table is lower than that reported by the
  device.

  The driver MUST NOT write a higher value than the one it reads from
  the device.

Stefan

--kK67RIqkwl8ErjFb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGuFfgACgkQnKSrs4Gr
c8jRggf/bAInNSDJyjHQppBBFp42Celiog/QDNGhUN+6/97EbGshKw3PYsa312tS
2R09XnjzcpAcuTZMiXSp2pGj7o8U1/A4k+mmLqtgVwXQtjK0X4KhQzxwbouYmqrs
PIer3MU6cYRS/0iTEaAIaIWgfk4aapgCWW++OuDI2eytFNmBWxu+0m6j+MAeXPy3
6HuSkEOMOYqlUhozr69LiLkTwqtUtAozbjzXIUp7WcdxmvHo9e3jmNGK+jojHU0F
vso3fD1t1ypZpgBfdbfi392tiB2tfZQmmg91RQ/o2IoUnwd60cN6dwutBfJPLyY+
EV5Iy19nLrq0vF0LZpbORmFCU+UXBg==
=uyT9
-----END PGP SIGNATURE-----

--kK67RIqkwl8ErjFb--

