Return-Path: <stefanha@redhat.com>
Date: Mon, 21 Feb 2022 10:33:45 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 2/2] Add common configuration field "queue_indirect_size"
Message-ID: <YhNqifSTxdOhy5tV@stefanha-x1.localdomain>
References: <cover.1639494803.git.qemu_oss@crudebyte.com>
 <55b04c584638393050bc76467439550d87e24696.1639494803.git.qemu_oss@crudebyte.com>
 <Ye6vaQZauiY7xsMB@stefanha-x1.localdomain>
 <4715621.MooAOXffm5@silver>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uW593H5rJQ1DiFa+"
Content-Disposition: inline
In-Reply-To: <4715621.MooAOXffm5@silver>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>


--uW593H5rJQ1DiFa+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 19, 2022 at 05:36:24PM +0100, Christian Schoenebeck wrote:
> On Montag, 24. Januar 2022 14:53:45 CET Stefan Hajnoczi wrote:
> > On Tue, Dec 14, 2021 at 04:13:17PM +0100, Christian Schoenebeck wrote:
> > > This new common configuration field allows to negotiate a more fine
> > > graded maximum lenght of indirect descriptor chains.
> > >=20
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > >=20
> > >  content.tex    | 25 ++++++++++++++++++++++++-
> > >  split-ring.tex |  3 +++
> > >  2 files changed, 27 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/content.tex b/content.tex
>=20
> Stefan, while preparing the next version of patches for this issue (#122)=
, I=20
> noticed that I missed your email here ...
>=20
> > > index 0aa4842..e3cfcae 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -859,6 +859,7 @@ \subsubsection{Common configuration structure
> > > layout}\label{sec:Virtio Transport>=20
> > >          le64 queue_driver;              /* read-write */
> > >          le64 queue_device;              /* read-write */
> > >          le16 queue_notify_data;         /* read-only for driver */
> > >=20
> > > +        le32 queue_indirect_size;       /* read-write */
> >=20
> > I see no other unaligned fields in this struct, so I think a le16
> > padding field is needed for safety:
> >=20
> >            le64 queue_device;              /* read-write */
> >            le16 queue_notify_data;         /* read-only for driver */
> >   +        le16 reserved;                  /* no access */
> >   +        le32 queue_indirect_size;       /* read-write */
> >=20
>=20
> That's no longer needed as there's now the new 'queue_reset' field, i.e.:
>=20
> diff --git a/content.tex b/content.tex
> index 685525d..da57d5d 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -902,6 +902,7 @@ \subsubsection{Common configuration structure layout}
> \label{sec:Virtio Transport
>          le64 queue_device;              /* read-write */
>          le16 queue_notify_data;         /* read-only for driver */
>          le16 queue_reset;               /* read-write */
> +        le32 queue_indirect_size;       /* read-write */
>  };
>  \end{lstlisting}
>=20
> > >  };
> > >  \end{lstlisting}
> > >=20
> > > @@ -938,6 +939,16 @@ \subsubsection{Common configuration structure
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
> > > +        This field is used to negotiate the maximum amount of descri=
ptors
> > > per +        vring slot as in \ref{sec:Basic Facilities of a Virtio
> > > Device / +        Virtqueues / The Virtqueue Descriptor Table / Indir=
ect
> > > Descriptors} if +        and only if the VIRTIO_RING_F_INDIRECT_SIZE
> > > feature has been negotiated. +
> > > +        The device specifies its maximum supported number of descrip=
tors
> > > per +        vring slot. If the driver requires fewer descriptors, it
> > > writes its +        lower value to inform the device of the reduced
> > > resource requirements.
> > "vring slot" is a little vague, it means "indirect descriptor
> > table"? The two paragraphs could use "maximum number of descriptors per
> > indirect descriptor table" instead of referring to vring slots to imply
> > indirect descriptor tables.
>=20
> The intended phrasing was intended to reflect that "Queue Indirect Size" =
is=20
> meant to be the *sum* of all indirect descriptors:
> https://lists.oasis-open.org/archives/virtio-comment/202112/msg00008.html
>=20
> Just to avoid that I am missing something here; as of now, there can only=
 be=20
> two indirect tables per round-trip message, right?

No, just one indirect descriptor table. An indirect descriptor table may
contain both IN and OUT descriptors so it can handle a round-trip
message.

2.6.5.3.1 Driver Requirements: Indirect Descriptors says:

  A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEXT in=
 flags.

It's unclear whether this statement is referring to 1) one descriptor,
2) to all descriptors in a buffer, or 3) to all descriptors ever made
available by the driver. QEMU's hw/virtio.c:virtqueue_pop() shows that
the interpretation is #2. So if a buffer uses an indirect descriptor
table then it has exactly 1 descriptor in the virtqueue's descriptor
table.

Stefan

--uW593H5rJQ1DiFa+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmITaokACgkQnKSrs4Gr
c8jLVQf9GQFNp33RvabgwdMCx9Ix1n2LN4GsI4nyIguw0DqXSfkdllPS6KvaRqHg
f/TuPN0Dp8PcKKmVh+sr7ipeKU8gGfe9jGcerhxbHZux+LTe8cuplNSe0H9Ogkyx
o7rSMl+SyvdidiMxkD4bN32ZUukqz/fuyiWNns4qGZzXRXrNTyS6wgk4lIQbx0WX
0XGiwSUofJd/xTwWUKp9Oed3nyJFFjvegt7oJNh3QfQ0mMfZnw81nbeSW7ctxB5L
5NGCN5ih/e/C9J4RKAvQFSFS7SLTAjLer5rlTKxaMADF7D34sgTl8sBOhBDEXkcj
CUMx/Q7T9vDtpCTw0JweKdhlBkrPhQ==
=VJgL
-----END PGP SIGNATURE-----

--uW593H5rJQ1DiFa+--

