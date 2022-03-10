Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 4/4] Add CCW configuration field "indirect_num" to vq_info_block
Date: Thu, 10 Mar 2022 17:09:54 +0100
Message-ID: <4202676.ubQFSjKQEu@silver>
In-Reply-To: <YioYtrSa0rX+nVMZ@stefanha-x1.localdomain>
References: <2255414.aXzeqRvSCW@silver> <86604669.MZiAfaG04C@silver> <YioYtrSa0rX+nVMZ@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Donnerstag, 10. M=E4rz 2022 16:26:46 CET Stefan Hajnoczi wrote:
> On Mon, Feb 21, 2022 at 06:01:41PM +0100, Christian Schoenebeck wrote:
> > This new CCW configuration field allows to negotiate a more fine
> > graded maximum lenght of indirect descriptor chains.
> >=20
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

I'll fix those accidentally added double SOBs BTW.

> > ---
> >=20
> >  content.tex | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/content.tex b/content.tex
> > index a3baf4d..d400ea7 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2599,6 +2599,7 @@ \subsubsection{Configuring a
> > Virtqueue}\label{sec:Virtio Transport Options / Vir>=20
> >          be16 num;
> >          be64 driver;
> >          be64 device;
> >=20
> > +        be32 indirect_num;
> >=20
> >  };
> >  \end{lstlisting}
> >=20
> > @@ -2607,6 +2608,10 @@ \subsubsection{Configuring a
> > Virtqueue}\label{sec:Virtio Transport Options / Vir>=20
> >  available area and used area for queue \field{index}, respectively. Th=
e
> >  actual virtqueue size (number of allocated buffers) is transmitted in
> >  \field{num}.>=20
> > +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated then
> > \field{indirect_num} +reflects the maximum length of indirect descripto=
r
> > tables for queue +\field{index}.
>=20
> I think the transfer direction of CCW_CMD_SET_VQ struct vq_info_block is
> driver-to-device. So it allows the driver to set the Queue Indirect
> Size, but how does the driver query the device's maximum Queue Indirect
> Size value?

Ah, seems you are right Stefan. I assumed this was similar to PCI.

So the way to go on CCW would be an additional (equally named?) field in=20
struct vq_info_block (CCW_CMD_READ_VQ_CONF) for device -> driver?

Cornelia?

Best regards,
Christian Schoenebeck


