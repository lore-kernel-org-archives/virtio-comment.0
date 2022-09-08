Return-Path: <jasowang@redhat.com>
MIME-Version: 1.0
References: <20220826100034.200432-1-lingshan.zhu@intel.com>
 <20220826100034.200432-2-lingshan.zhu@intel.com> <1b89ee30-463e-23ae-9616-746f48ec6fa4@redhat.com>
 <20220908013614-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220908013614-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 8 Sep 2022 14:21:49 +0800
Message-ID: <CACGkMEurRPOVarG-L8-VrGVoDWXiqVtVnHRNWBH8_ScuizHpFA@mail.gmail.com>
Subject: Re: [PATCH V4 1/4] Introduce virito transport virtqueue
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Zhu Lingshan <lingshan.zhu@intel.com>, Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, nrupal.jani@intel.com, "Uminski, Piotr" <Piotr.Uminski@intel.com>, hang.yuan@intel.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Sep 8, 2022 at 1:38 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Sep 08, 2022 at 11:18:10AM +0800, Jason Wang wrote:
> >
> > =E5=9C=A8 2022/8/26 18:00, Zhu Lingshan =E5=86=99=E9=81=93:
> > > This commit introduces transport virtqueue as a new transport
> > > layer for virtio devices. And the format of the commands
> > > through the transport virtqueue is defined as well.
> > >
> > > We also give examples for the management devices and the
> > > managed devices.
> > >
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > > ---
> > >   content.tex      | 113 ++++++++++++++++++++++++++++++++++++++++++++=
+++
> > >   introduction.tex |   3 ++
> > >   2 files changed, 116 insertions(+)
> > >
> > > diff --git a/content.tex b/content.tex
> > > index e863709..0f2dee4 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -2895,6 +2895,119 @@ \subsubsection{Resetting Devices}\label{sec:V=
irtio Transport Options / Virtio ov
> > >   MAY also choose to verify reset completion by reading \field{device=
 status} via
> > >   CCW_CMD_READ_STATUS and checking whether it is 0 afterwards.
> > > +\section{Virtio Over Transport Virtqueue}\label{sec:Virtio Transport=
 Options Virtio Over Transport Virtqueue}
> > > +
> > > +In some cases, it is challenging to implement a virtio device in a t=
ransport specific method.
> > > +
> > > +One example is that a physical device may try to present multiple vi=
rtio (maybe virtual) devices
> > > +with limited transport specific resources.
> > > +
> > > +Another example is to implement transport-independent virtio devices=
.
> > > +In those cases, a transport virtqueue could be used as the transport=
 layer to
> > > +implement virtio managed device.
> > > +
> > > +\subsection{Basic Concepts}\label{sec:Virtio Transport Options / Vir=
tio over Transport Virtqueue / Basic Concepts}
> > > +
> > > +Feature bit VIRTIO_F_TRANSPT_VQ indicates that a device offers a tra=
nsport virtqueue.
> > > +
> > > +\subsubsection{The Management Device}\label{sec:Virtio Transport Opt=
ions / Virtio over Transport Virtqueue / Basic Concepts / The Management De=
vice}
> > > +
> > > +A device that offers feature bit VIRTIO_F_TRANSPT_VQ and a transport=
 virtqueue is a management device.
> > > +
> > > +For example, a PCIe device with a transport virtqueue and offers VIR=
TIO_F_TRANSPT_VQ is a management device.
> > > +
> > > +A set of management commands with a format defined in section \ref{s=
ec:Virtio Transport Options / Virtio over Transport Virtqueue / Format of C=
ommands through Transport Virtqueue}
> > > +is processed over the transport virtqueue.
> > > +
> > > +\devicenormative{\subsubsection}{The Management Device}{Virtio Trans=
port Options / Virtio Over Transport Virtqueue / Basic Concepts / The manag=
ement Device}
> > > +
> > > +The management device MUST offer feature bit VIRTIO_F_TRANSPT_VQ and=
 a transport virtqueue.
> > > +
> > > +\subsubsection{The Managed Device}\label{sec:Virtio Transport Option=
s / Virtio over Transport Virtqueue / Basic Concepts / The Managed Device}
> > > +
> > > +A managed device is a kind of device that is created, destroyed and =
configured through a transport virtqueue,
> > > +it utilizes the transport virtqueue as its transport layer.
> > > +
> > > +Virtio can use the transport virtqueue to implement managed devices
> > > +
> > > +An example of managed devices is a Scalable I/O Virtualization \hype=
rref[intro:SIOV]{[SIOV]} VDEV which is created and managed
> > > +through a transport virtqueue of a management device.
> > > +
> > > +A managed device and its management device work in a sub-device and =
parent-device topology.
> > > +
> > > +\devicenormative{\subsubsection}{The Managed Device}{Virtio Transpor=
t Options / Virtio Over Transport Virtqueue / Basic Concepts / The Managed =
Device}
> > > +
> > > +A managed device should be isolated from other managed devices on DM=
A and interrupts.
> >
> >
> > I'd suggest to say
> >
> > "Managed devices are isolated from each other and from the management
> > device."
> >
> > Since DMA and interrupts which is only available on some transport are =
not a
> > must for a virtio device to work.
>
>
> Guys, have you looked at the RFC I posted at all?
>
> I'm disappointed this is still going in its own direction
> ignoring the obvious similarities between the two concepts.
> How many versions of managed/management parent/child
> etc can we have?

It looks to me SIOV has more restrictions on the managed device (e.g
P2P is not allowed).

>
> Can the wording I posted be reused? I certainly made the effort.
>
> I imagine that the virtio transport can become just
> 1- a new group type
> 2- a feature bit
> 3- a set of commands for managing scalable IOV enabled with said bit
>
>
> I can add (1) to my patchset if you like.
>
> Jason I thought you agreed this made sense?

Kind of, I meant the concept of the managed/management parent/child.

But I'm not sure using a single type of virtqueue for all groups is
the best way:

1) virtqueue type #1 with group type A,B,C

or

2) virtqueue type #1 for group A
    virtqueue type #2 for group B
    virtqueue type #3 for group C

1) pays for the extra complexity of being able to manage different
groups at the same time. I'm not sure it is what we want (e.g a single
virtqueue to manage both VF and SF).

Thanks

>
> --
> MST
>

