Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [virtio-comment] Re: [PATCH v3 4/4] Add CCW configuration field "indirect_num"
Date: Sat, 19 Mar 2022 11:23:52 +0100
Message-ID: <4949755.hfBhaMJRe6@silver>
In-Reply-To: <871qyzs0lh.fsf@redhat.com>
References: <4735344.EBYxvr1mta@silver> <11686863.Z9n2BMzBuM@silver> <871qyzs0lh.fsf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Freitag, 18. M=E4rz 2022 17:10:34 CET Cornelia Huck wrote:
> On Fri, Mar 18 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote=
:
> > On Donnerstag, 17. M=E4rz 2022 15:12:42 CET Cornelia Huck wrote:
> >> On Wed, Mar 16 2022, Christian Schoenebeck <qemu_oss@crudebyte.com>=20
wrote:
> >> > +Since revision 3, \field{indirect_num} exists, which is supposed to
> >> > reflect the +Queue Indirect Size (i.e. the maximum length of indirec=
t
> >> > descriptor tables) +supported by device for this queue.
> >>=20
> >> It still depends on the feature flag, though.
> >>=20
> >> Maybe
> >>=20
> >> "If revision 2 or lower is set, struct vq_config_block extends up to
> >> \field{max_num}.
> >>=20
> >> If revision 3 or higher is set, struct vq_config_block extends to
> >> \field{max_indirect_num}. If VIRTIO_RING_F_INDIRECT_SIZE is negotiated=
,
> >> \field{indirect_max_num} contains the maximum Queue Indirect Size
> >> (i.e. the maximum length of indirect descriptor tables) supported by t=
he
> >> device for this queue; otherwise, its contents are unpredictable."
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
> Hm, I was coming from the driver's perspective here. But "undefined"
> probably captures "junk in there, do not use" better.

Like written to Halil moments ago, I would prefer "undefined" but I have no=
=20
strong opininon on it.

> Ack on your other points.
>=20
> >> We should include a device normative statement:
> >>=20
> >> "The device MUST NOT offer VIRTIO_RING_F_INDIRECT_SIZE, unless at leas=
t
> >> revision 3 is set, and therefore \field{max_indirect_num} respectively
> >> \field{indirect_num} are available."
> >=20
> > Oh, you are suggesting two different names for those two fields?
> > "max_indirect_num" vs. "indirect_num". If yes, why?
>=20
> The "max_indirect_num" goes with the "max_num": this is the maximum
> value that the device supports (the "maximum maximum", in a way :).
> "indirect_num" is the actual upper limit while the device is in use.

Ok, I understand your motivation now, your interpretation aspect for this w=
as:

=09device's value >=3D driver's value

Another interpretation aspect would be though from driver PoV: 'what is the=
=20
maximum bulk size I could send to device?', and in this case you would call=
=20
both fields 'max_indirect_num'.

Therefore I would prefer using the same name 'max_indirect_num' on both=20
structs, to also make it clear they are about negotiating the same thing.

>=20
> > Otherwise about adding that normative statement in general here: sure,
> > makes sense.


