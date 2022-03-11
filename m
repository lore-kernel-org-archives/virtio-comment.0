Return-Path: <pasic@linux.ibm.com>
Date: Fri, 11 Mar 2022 12:15:40 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v2 4/4] Add CCW configuration field "indirect_num" to
 vq_info_block
Message-ID: <20220311121540.6255545d.pasic@linux.ibm.com>
In-Reply-To: <87o82chmj1.fsf@redhat.com>
References: <2255414.aXzeqRvSCW@silver>
	<YioYtrSa0rX+nVMZ@stefanha-x1.localdomain>
	<87zglxhjre.fsf@redhat.com>
	<2478424.v7pibGEp8r@silver>
	<87o82chmj1.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 11 Mar 2022 10:21:54 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Fri, Mar 11 2022, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote=
:
>=20
> > On Donnerstag, 10. M=C3=A4rz 2022 17:09:25 CET Cornelia Huck wrote: =20
> >> On Thu, Mar 10 2022, Stefan Hajnoczi <stefanha@redhat.com> wrote: =20
> >> > On Mon, Feb 21, 2022 at 06:01:41PM +0100, Christian Schoenebeck wrot=
e: =20
> >> >> This new CCW configuration field allows to negotiate a more fine
> >> >> graded maximum lenght of indirect descriptor chains.
> >> >>=20
> >> >> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> >> >> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com
> >> >> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> >> >> ---
> >> >>=20
> >> >>  content.tex | 5 +++++
> >> >>  1 file changed, 5 insertions(+)
> >> >>=20
> >> >> diff --git a/content.tex b/content.tex
> >> >> index a3baf4d..d400ea7 100644
> >> >> --- a/content.tex
> >> >> +++ b/content.tex
> >> >> @@ -2599,6 +2599,7 @@ \subsubsection{Configuring a
> >> >> Virtqueue}\label{sec:Virtio Transport Options / Vir>>=20
> >> >>          be16 num;
> >> >>          be64 driver;
> >> >>          be64 device;
> >> >>=20
> >> >> +        be32 indirect_num;
> >> >>=20
> >> >>  };
> >> >>  \end{lstlisting}
> >> >>=20
> >> >> @@ -2607,6 +2608,10 @@ \subsubsection{Configuring a
> >> >> Virtqueue}\label{sec:Virtio Transport Options / Vir>>=20
> >> >>  available area and used area for queue \field{index}, respectively=
. The
> >> >>  actual virtqueue size (number of allocated buffers) is transmitted=
 in =20
> >> >>  \field{num}.>>  =20
> >> >> +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated then
> >> >> \field{indirect_num} +reflects the maximum length of indirect descr=
iptor
> >> >> tables for queue +\field{index}. =20
> >> >=20
> >> > I think the transfer direction of CCW_CMD_SET_VQ struct vq_info_bloc=
k is
> >> > driver-to-device. So it allows the driver to set the Queue Indirect
> >> > Size, but how does the driver query the device's maximum Queue Indir=
ect
> >> > Size value? =20
> >>=20
> >> [cc:ing Halil in case he has any further comments]
> >>=20
> >> You're right, CCW_CMD_SET_VQ + vq_info_block is driver-to-device. The
> >> driver will obtain information about a queue via CCW_CMD_READ_VQ_CONF =
+
> >> vq_config_block, so a max_indirect_num field needs to be added there a=
s
> >> well, I think.
> >>=20
> >> Moreover, we're changing the length of the ccw payload. Extending at t=
he
> >> end is generally fine, but the device and the driver need to agree on
> >> what the expected payload is. We basically have two options here:
> >>=20
> >> * Make it depend on the feature bit being negotiated. This works becau=
se
> >>   virtqueue discovery needs to be done only after feature negotiation
> >>   has completed. However, this will get a bit awkward if we need to ad=
d
> >>   another field depending on a new feature bit: negotiating that
> >>   hypothetical feature would imply that the indirect num fields would =
be
> >>   present, but not valid, if the indirect feature had not been
> >>   negotiated. Not a showstopper, but looks a bit odd.

I think can get very ugly. Present but not valid is not the problem in
my opinion. In fact we would do the same: if the feature is not
negotiated, the field is invalid. But making the layout and size depend
on a feature is tricky, because one can't tell: if feature x is
negotiated the layout is that and that for the reasons you pointed out.

> >> * Tie it to a new ccw revision (3) and make offering the feature bit
> >>   dependant upon revision 3 or later being negotiated. This has the
> >>   advantage that ccw revisions always build on each other (so no
> >>   awkwardness for future extension) and the drawback of introducing
> >>   another transport-specific prereq.

I think this is inherent. If the transport does not support the new
CCW layout there is no way we can make this work. AFAIR the transport
can just fence the feature if the transport prereq is not met.

> >>=20
> >> If we can live with the possible awkwardness of future extensions, tyi=
ng
> >> the size of the structures to feature bits might be the preferable way=
. =20
> >
> > Really? My intuitive pick would rather be option 2 (CCW revision). But =
I'll go=20
> > for whatever the common opinion is on this CCW issue. =20
>=20
> Either would work; that's why I'd like to have Halil's opinion as well.

Halil was catching up with the history :) Sorry for being late to the
party.

I tend to agree with Christian: this impacts when a CCW should be
accepted or rejected, and is thus not much unlike adding a new ccw.
Furthermore I don't think mix and match (which is kind of the default for
feature bits) works well for layout of structs.

But let me take a step back, and ask some more general questions?
1) What is the objective behind the mechanism which can be used by the
driver to tell the device its maximum. I believe the indirect descriptor
table is always allocated by the guest, so the guest has no reason to
fear larger than its max. The only thing I can think of is some pools
of buffers allocated and maintained by the device, where each buffer
is the size of max payload. Is this what we have in mind here?
2) Not so long ago we had a discussion about introducing a common (device
agnostic) configuration space (a.k.a. misc config). The indirect table
size might be a good candidate for that as well. We essentially want
the very same functionality for all the transports, it is just that
we have no vehicle at the moment to do this in an uniform way. Opinions?

Regards,
Halil

