Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 4/4] Add CCW configuration field "indirect_num" to vq_info_block
Date: Fri, 11 Mar 2022 09:53:00 +0100
Message-ID: <2478424.v7pibGEp8r@silver>
In-Reply-To: <87zglxhjre.fsf@redhat.com>
References: <2255414.aXzeqRvSCW@silver> <YioYtrSa0rX+nVMZ@stefanha-x1.localdomain> <87zglxhjre.fsf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: Cornelia Huck <cohuck@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Donnerstag, 10. M=E4rz 2022 17:09:25 CET Cornelia Huck wrote:
> On Thu, Mar 10 2022, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > On Mon, Feb 21, 2022 at 06:01:41PM +0100, Christian Schoenebeck wrote:
> >> This new CCW configuration field allows to negotiate a more fine
> >> graded maximum lenght of indirect descriptor chains.
> >>=20
> >> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> >> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com
> >> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> >> ---
> >>=20
> >>  content.tex | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>=20
> >> diff --git a/content.tex b/content.tex
> >> index a3baf4d..d400ea7 100644
> >> --- a/content.tex
> >> +++ b/content.tex
> >> @@ -2599,6 +2599,7 @@ \subsubsection{Configuring a
> >> Virtqueue}\label{sec:Virtio Transport Options / Vir>>=20
> >>          be16 num;
> >>          be64 driver;
> >>          be64 device;
> >>=20
> >> +        be32 indirect_num;
> >>=20
> >>  };
> >>  \end{lstlisting}
> >>=20
> >> @@ -2607,6 +2608,10 @@ \subsubsection{Configuring a
> >> Virtqueue}\label{sec:Virtio Transport Options / Vir>>=20
> >>  available area and used area for queue \field{index}, respectively. T=
he
> >>  actual virtqueue size (number of allocated buffers) is transmitted in
> >>  \field{num}.>>=20
> >> +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated then
> >> \field{indirect_num} +reflects the maximum length of indirect descript=
or
> >> tables for queue +\field{index}.
> >=20
> > I think the transfer direction of CCW_CMD_SET_VQ struct vq_info_block i=
s
> > driver-to-device. So it allows the driver to set the Queue Indirect
> > Size, but how does the driver query the device's maximum Queue Indirect
> > Size value?
>=20
> [cc:ing Halil in case he has any further comments]
>=20
> You're right, CCW_CMD_SET_VQ + vq_info_block is driver-to-device. The
> driver will obtain information about a queue via CCW_CMD_READ_VQ_CONF +
> vq_config_block, so a max_indirect_num field needs to be added there as
> well, I think.
>=20
> Moreover, we're changing the length of the ccw payload. Extending at the
> end is generally fine, but the device and the driver need to agree on
> what the expected payload is. We basically have two options here:
>=20
> * Make it depend on the feature bit being negotiated. This works because
>   virtqueue discovery needs to be done only after feature negotiation
>   has completed. However, this will get a bit awkward if we need to add
>   another field depending on a new feature bit: negotiating that
>   hypothetical feature would imply that the indirect num fields would be
>   present, but not valid, if the indirect feature had not been
>   negotiated. Not a showstopper, but looks a bit odd.
> * Tie it to a new ccw revision (3) and make offering the feature bit
>   dependant upon revision 3 or later being negotiated. This has the
>   advantage that ccw revisions always build on each other (so no
>   awkwardness for future extension) and the drawback of introducing
>   another transport-specific prereq.
>=20
> If we can live with the possible awkwardness of future extensions, tying
> the size of the structures to feature bits might be the preferable way.

Really? My intuitive pick would rather be option 2 (CCW revision). But I'll=
 go=20
for whatever the common opinion is on this CCW issue.

Best regards,
Christian Schoenebeck


