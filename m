Return-Path: <mst@redhat.com>
Date: Thu, 8 Sep 2022 01:38:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V4 1/4] Introduce virito transport virtqueue
Message-ID: <20220908013614-mutt-send-email-mst@kernel.org>
References: <20220826100034.200432-1-lingshan.zhu@intel.com>
 <20220826100034.200432-2-lingshan.zhu@intel.com>
 <1b89ee30-463e-23ae-9616-746f48ec6fa4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1b89ee30-463e-23ae-9616-746f48ec6fa4@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
To: Jason Wang <jasowang@redhat.com>
Cc: Zhu Lingshan <lingshan.zhu@intel.com>, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Sep 08, 2022 at 11:18:10AM +0800, Jason Wang wrote:
> 
> 在 2022/8/26 18:00, Zhu Lingshan 写道:
> > This commit introduces transport virtqueue as a new transport
> > layer for virtio devices. And the format of the commands
> > through the transport virtqueue is defined as well.
> > 
> > We also give examples for the management devices and the
> > managed devices.
> > 
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > ---
> >   content.tex      | 113 +++++++++++++++++++++++++++++++++++++++++++++++
> >   introduction.tex |   3 ++
> >   2 files changed, 116 insertions(+)
> > 
> > diff --git a/content.tex b/content.tex
> > index e863709..0f2dee4 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2895,6 +2895,119 @@ \subsubsection{Resetting Devices}\label{sec:Virtio Transport Options / Virtio ov
> >   MAY also choose to verify reset completion by reading \field{device status} via
> >   CCW_CMD_READ_STATUS and checking whether it is 0 afterwards.
> > +\section{Virtio Over Transport Virtqueue}\label{sec:Virtio Transport Options Virtio Over Transport Virtqueue}
> > +
> > +In some cases, it is challenging to implement a virtio device in a transport specific method.
> > +
> > +One example is that a physical device may try to present multiple virtio (maybe virtual) devices
> > +with limited transport specific resources.
> > +
> > +Another example is to implement transport-independent virtio devices.
> > +In those cases, a transport virtqueue could be used as the transport layer to
> > +implement virtio managed device.
> > +
> > +\subsection{Basic Concepts}\label{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Basic Concepts}
> > +
> > +Feature bit VIRTIO_F_TRANSPT_VQ indicates that a device offers a transport virtqueue.
> > +
> > +\subsubsection{The Management Device}\label{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Basic Concepts / The Management Device}
> > +
> > +A device that offers feature bit VIRTIO_F_TRANSPT_VQ and a transport virtqueue is a management device.
> > +
> > +For example, a PCIe device with a transport virtqueue and offers VIRTIO_F_TRANSPT_VQ is a management device.
> > +
> > +A set of management commands with a format defined in section \ref{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Format of Commands through Transport Virtqueue}
> > +is processed over the transport virtqueue.
> > +
> > +\devicenormative{\subsubsection}{The Management Device}{Virtio Transport Options / Virtio Over Transport Virtqueue / Basic Concepts / The management Device}
> > +
> > +The management device MUST offer feature bit VIRTIO_F_TRANSPT_VQ and a transport virtqueue.
> > +
> > +\subsubsection{The Managed Device}\label{sec:Virtio Transport Options / Virtio over Transport Virtqueue / Basic Concepts / The Managed Device}
> > +
> > +A managed device is a kind of device that is created, destroyed and configured through a transport virtqueue,
> > +it utilizes the transport virtqueue as its transport layer.
> > +
> > +Virtio can use the transport virtqueue to implement managed devices
> > +
> > +An example of managed devices is a Scalable I/O Virtualization \hyperref[intro:SIOV]{[SIOV]} VDEV which is created and managed
> > +through a transport virtqueue of a management device.
> > +
> > +A managed device and its management device work in a sub-device and parent-device topology.
> > +
> > +\devicenormative{\subsubsection}{The Managed Device}{Virtio Transport Options / Virtio Over Transport Virtqueue / Basic Concepts / The Managed Device}
> > +
> > +A managed device should be isolated from other managed devices on DMA and interrupts.
> 
> 
> I'd suggest to say
> 
> "Managed devices are isolated from each other and from the management
> device."
> 
> Since DMA and interrupts which is only available on some transport are not a
> must for a virtio device to work.


Guys, have you looked at the RFC I posted at all?

I'm disappointed this is still going in its own direction
ignoring the obvious similarities between the two concepts.
How many versions of managed/management parent/child
etc can we have? 

Can the wording I posted be reused? I certainly made the effort.

I imagine that the virtio transport can become just
1- a new group type
2- a feature bit
3- a set of commands for managing scalable IOV enabled with said bit


I can add (1) to my patchset if you like.

Jason I thought you agreed this made sense?

-- 
MST

