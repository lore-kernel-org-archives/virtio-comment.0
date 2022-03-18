Return-Path: <pasic@linux.ibm.com>
Date: Fri, 18 Mar 2022 17:06:25 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [virtio-comment] Re: [PATCH v3 4/4] Add CCW configuration field
 "indirect_num"
Message-ID: <20220318170625.0d2be174.pasic@linux.ibm.com>
In-Reply-To: <11686863.Z9n2BMzBuM@silver>
References: <4735344.EBYxvr1mta@silver>
	<3040881.qp741xram0@silver>
	<87cziksm5h.fsf@redhat.com>
	<11686863.Z9n2BMzBuM@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 18 Mar 2022 12:02:31 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Donnerstag, 17. M=C3=A4rz 2022 15:12:42 CET Cornelia Huck wrote:
> > On Wed, Mar 16 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wro=
te: =20
> > > This new CCW configuration field allows to negotiate a more fine
> > > graded maximum lenght of indirect descriptor chains.
> > >=20
> > > Bump CCW virtio revision to 3 and make the existence of this new
> > > field "indirect_num" dependant on revision 3.
> > >=20
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > >=20
> > >  content.tex | 14 +++++++++++++-
> > >  1 file changed, 13 insertions(+), 1 deletion(-) =20
> >=20
> > (...)
> >  =20
> > > @@ -2581,12 +2583,17 @@ \subsubsection{Configuring a
> > > Virtqueue}\label{sec:Virtio Transport Options / Vir>=20
> > >  struct vq_config_block {
> > > =20
> > >          be16 index;
> > >          be16 max_num;
> > >=20
> > > +        be32 indirect_num; /* since virtio-ccw rev. 3 */ =20
> >=20
> > Maybe make it max_indirect_num (to mirror max_num?) =20
>=20
> Right, that name appears indeed more appropriate here.
>=20
> > >  };
> > >  \end{lstlisting}
> > > =20
> > >  The requested number of buffers for queue \field{index} is returned =
in
> > >  \field{max_num}.
> > >=20
> > > +Since revision 3, \field{indirect_num} exists, which is supposed to
> > > reflect the +Queue Indirect Size (i.e. the maximum length of indirect
> > > descriptor tables) +supported by device for this queue. =20
> >=20
> > It still depends on the feature flag, though.
> >=20
> > Maybe
> >=20
> > "If revision 2 or lower is set, struct vq_config_block extends up to
> > \field{max_num}.
> >=20
> > If revision 3 or higher is set, struct vq_config_block extends to
> > \field{max_indirect_num}. If VIRTIO_RING_F_INDIRECT_SIZE is negotiated,
> > \field{indirect_max_num} contains the maximum Queue Indirect Size
> > (i.e. the maximum length of indirect descriptor tables) supported by th=
e
> > device for this queue; otherwise, its contents are unpredictable." =20
>=20
> Maybe rather something like this instead:
>=20
> "Actual size of struct vq_config_block depends on the virtio-ccw revision=
.
>=20
> If revision 2 or lower is set, struct vq_config_block extends up to
> *including* \field{max_num}.
>=20
> If revision 3 or higher is set, struct vq_config_block extends up to
> *including* \field{max_indirect_num}. If VIRTIO_RING_F_INDIRECT_SIZE is=
=20
> negotiated, \field{indirect_max_num} contains the maximum Queue Indirect =
Size
> (i.e. the maximum length of indirect descriptor tables) supported by the
> device for this queue; otherwise, its contents are *undefined*."
> =20

I agree that the "including" is important, but I'm not sure about the
"its contents are undefined". I don't really understand why should we use
a plural here. What speaks against specifying that in SHOULD be stored
as 0 by the device, and MUST be ignored by the driver?

Currently we say that \field{max_indirect_num} exists like a be32 field
even if VIRTIO_RING_F_INDIRECT_SIZE is not negotiated. Which kind of
implies that at least type invariants should hold. Of course, there is
none here (i.e. every bits value is also a be32 value), but for something
like an enum interesting corner cases can pop up.

[..]

Regards,
Halil

