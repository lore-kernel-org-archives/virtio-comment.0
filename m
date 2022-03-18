Return-Path: <virtio-comment-return-2825-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 065C19866EA
	for <virtio-comment@lists.oasis-open.org>; Fri, 18 Mar 2022 11:02:35 +0000 (UTC)
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 18 Mar 2022 12:02:31 +0100
Message-ID: <11686863.Z9n2BMzBuM@silver>
In-Reply-To: <87cziksm5h.fsf@redhat.com>
References: <4735344.EBYxvr1mta@silver> <3040881.qp741xram0@silver> <87cziksm5h.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v3 4/4] Add CCW configuration field "indirect_num"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Donnerstag, 17. M=E4rz 2022 15:12:42 CET Cornelia Huck wrote:
> On Wed, Mar 16 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote=
:
> > This new CCW configuration field allows to negotiate a more fine
> > graded maximum lenght of indirect descriptor chains.
> >=20
> > Bump CCW virtio revision to 3 and make the existence of this new
> > field "indirect_num" dependant on revision 3.
> >=20
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> >=20
> >  content.tex | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> (...)
>=20
> > @@ -2581,12 +2583,17 @@ \subsubsection{Configuring a
> > Virtqueue}\label{sec:Virtio Transport Options / Vir>=20
> >  struct vq_config_block {
> > =20
> >          be16 index;
> >          be16 max_num;
> >=20
> > +        be32 indirect_num; /* since virtio-ccw rev. 3 */
>=20
> Maybe make it max_indirect_num (to mirror max_num?)

Right, that name appears indeed more appropriate here.

> >  };
> >  \end{lstlisting}
> > =20
> >  The requested number of buffers for queue \field{index} is returned in
> >  \field{max_num}.
> >=20
> > +Since revision 3, \field{indirect_num} exists, which is supposed to
> > reflect the +Queue Indirect Size (i.e. the maximum length of indirect
> > descriptor tables) +supported by device for this queue.
>=20
> It still depends on the feature flag, though.
>=20
> Maybe
>=20
> "If revision 2 or lower is set, struct vq_config_block extends up to
> \field{max_num}.
>=20
> If revision 3 or higher is set, struct vq_config_block extends to
> \field{max_indirect_num}. If VIRTIO_RING_F_INDIRECT_SIZE is negotiated,
> \field{indirect_max_num} contains the maximum Queue Indirect Size
> (i.e. the maximum length of indirect descriptor tables) supported by the
> device for this queue; otherwise, its contents are unpredictable."

Maybe rather something like this instead:

"Actual size of struct vq_config_block depends on the virtio-ccw revision.

If revision 2 or lower is set, struct vq_config_block extends up to
*including* \field{max_num}.

If revision 3 or higher is set, struct vq_config_block extends up to
*including* \field{max_indirect_num}. If VIRTIO_RING_F_INDIRECT_SIZE is=20
negotiated, \field{indirect_max_num} contains the maximum Queue Indirect Si=
ze
(i.e. the maximum length of indirect descriptor tables) supported by the
device for this queue; otherwise, its contents are *undefined*."
=20
> > +
> >=20
> >  Afterwards, CCW_CMD_SET_VQ is issued by the driver to inform the
> >  device about the location used for its queue. The transmitted
> >  structure is
> >=20
> > @@ -2599,6 +2606,7 @@ \subsubsection{Configuring a
> > Virtqueue}\label{sec:Virtio Transport Options / Vir>=20
> >          be16 num;
> >          be64 driver;
> >          be64 device;
> >=20
> > +        be32 indirect_num; /* since virtio-ccw rev. 3 */
> >=20
> >  };
> >  \end{lstlisting}
> >=20
> > @@ -2607,6 +2615,10 @@ \subsubsection{Configuring a
> > Virtqueue}\label{sec:Virtio Transport Options / Vir>=20
> >  available area and used area for queue \field{index}, respectively. Th=
e
> >  actual virtqueue size (number of allocated buffers) is transmitted in
> >  \field{num}.>=20
> > +Since revision 3, \field{indirect_num} exists, which is supposed to
> > reflect the +Queue Indirect Size (i.e. the maximum length of indirect
> > descriptor tables) +supported by driver for this queue.
>=20
> Similar to above:
>=20
> "If revision 2 or lower is set, struct vq_info_block extends up to
> \field{device}.
>=20
> If revision 3 or higher is set, struct vq_info_block extends to
> \field{indirect_num}. If VIRTIO_RING_F_INDIRECT_SIZE is negotiated,
> the Queue Indirect Size (i.e. the maximum length of indirect descriptor
> tables) supported by the driver for this queue is transmitted in
> \field{indirect_num}."

Ditto.

> > +
> >=20
> >  \devicenormative{\paragraph}{Configuring a Virtqueue}{Virtio Transport
> >  Options / Virtio over channel I/O / Device Initialization / Configurin=
g
> >  a Virtqueue}
> > =20
> >  \field{res0} is reserved and MUST be ignored by the device.
>=20
> We should include a device normative statement:
>=20
> "The device MUST NOT offer VIRTIO_RING_F_INDIRECT_SIZE, unless at least
> revision 3 is set, and therefore \field{max_indirect_num} respectively
> \field{indirect_num} are available."

Oh, you are suggesting two different names for those two fields?=20
"max_indirect_num" vs. "indirect_num". If yes, why?

Otherwise about adding that normative statement in general here: sure, make=
s=20
sense.

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

