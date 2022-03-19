Return-Path: <virtio-comment-return-2829-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DB3EE9866EC
	for <virtio-comment@lists.oasis-open.org>; Sat, 19 Mar 2022 10:12:34 +0000 (UTC)
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sat, 19 Mar 2022 11:12:30 +0100
Message-ID: <15118124.lv8FRMpzUk@silver>
In-Reply-To: <20220318170625.0d2be174.pasic@linux.ibm.com>
References: <4735344.EBYxvr1mta@silver> <11686863.Z9n2BMzBuM@silver> <20220318170625.0d2be174.pasic@linux.ibm.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH v3 4/4] Add CCW configuration field "indirect_num"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Freitag, 18. M=E4rz 2022 17:06:25 CET Halil Pasic wrote:
> On Fri, 18 Mar 2022 12:02:31 +0100
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Donnerstag, 17. M=E4rz 2022 15:12:42 CET Cornelia Huck wrote:
> > > On Wed, Mar 16 2022, Christian Schoenebeck <qemu_oss@crudebyte.com>=
=20
wrote:
> > > > This new CCW configuration field allows to negotiate a more fine
> > > > graded maximum lenght of indirect descriptor chains.
> > > >=20
> > > > Bump CCW virtio revision to 3 and make the existence of this new
> > > > field "indirect_num" dependant on revision 3.
> > > >=20
> > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > ---
> > > >=20
> > > >  content.tex | 14 +++++++++++++-
> > > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > >=20
> > > (...)
> > >=20
> > > > @@ -2581,12 +2583,17 @@ \subsubsection{Configuring a
> > > > Virtqueue}\label{sec:Virtio Transport Options / Vir>
> > > >=20
> > > >  struct vq_config_block {
> > > > =20
> > > >          be16 index;
> > > >          be16 max_num;
> > > >=20
> > > > +        be32 indirect_num; /* since virtio-ccw rev. 3 */
> > >=20
> > > Maybe make it max_indirect_num (to mirror max_num?)
> >=20
> > Right, that name appears indeed more appropriate here.
> >=20
> > > >  };
> > > >  \end{lstlisting}
> > > > =20
> > > >  The requested number of buffers for queue \field{index} is returne=
d
> > > >  in
> > > >  \field{max_num}.
> > > >=20
> > > > +Since revision 3, \field{indirect_num} exists, which is supposed t=
o
> > > > reflect the +Queue Indirect Size (i.e. the maximum length of indire=
ct
> > > > descriptor tables) +supported by device for this queue.
> > >=20
> > > It still depends on the feature flag, though.
> > >=20
> > > Maybe
> > >=20
> > > "If revision 2 or lower is set, struct vq_config_block extends up to
> > > \field{max_num}.
> > >=20
> > > If revision 3 or higher is set, struct vq_config_block extends to
> > > \field{max_indirect_num}. If VIRTIO_RING_F_INDIRECT_SIZE is negotiate=
d,
> > > \field{indirect_max_num} contains the maximum Queue Indirect Size
> > > (i.e. the maximum length of indirect descriptor tables) supported by =
the
> > > device for this queue; otherwise, its contents are unpredictable."
> >=20
> > Maybe rather something like this instead:
> >=20
> > "Actual size of struct vq_config_block depends on the virtio-ccw revisi=
on.
> >=20
> > If revision 2 or lower is set, struct vq_config_block extends up to
> > *including* \field{max_num}.
> >=20
> > If revision 3 or higher is set, struct vq_config_block extends up to
> > *including* \field{max_indirect_num}. If VIRTIO_RING_F_INDIRECT_SIZE is
> > negotiated, \field{indirect_max_num} contains the maximum Queue Indirec=
t
> > Size (i.e. the maximum length of indirect descriptor tables) supported =
by
> > the device for this queue; otherwise, its contents are *undefined*."
>=20
> I agree that the "including" is important, but I'm not sure about the
> "its contents are undefined". I don't really understand why should we use
> a plural here. What speaks against specifying that in SHOULD be stored
> as 0 by the device, and MUST be ignored by the driver?

Both solutions would be viable. Personally I would just use something like=
=20
"Should be zero" if there is a value in recommending that, but I don't see =
a=20
value in recommending to set something to zero and at the same time requiri=
ng=20
to not access it in the first place.

> Currently we say that \field{max_indirect_num} exists like a be32 field
> even if VIRTIO_RING_F_INDIRECT_SIZE is not negotiated. Which kind of
> implies that at least type invariants should hold. Of course, there is
> none here (i.e. every bits value is also a be32 value), but for something
> like an enum interesting corner cases can pop up.

I can't follow you on that one. What has that do with enums in this case?

Anyway, I won't persist on my suggestion to use the (IMO more compact form)=
=20
"undefined". If you guys prefer the more specific solution "SHOULD be 0 and=
=20
MUST not be accessed" then I will go that way.

Best regards,
Christian Schoenebeck



This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

