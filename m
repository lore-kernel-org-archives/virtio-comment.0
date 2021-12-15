Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 2/2] Add common configuration field "queue_indirect_size"
Date: Wed, 15 Dec 2021 14:59:28 +0100
Message-ID: <2524173.IXtQ29OQN3@silver>
In-Reply-To: <87zgp3qf1f.fsf@redhat.com>
References: <cover.1639494803.git.qemu_oss@crudebyte.com> <55b04c584638393050bc76467439550d87e24696.1639494803.git.qemu_oss@crudebyte.com> <87zgp3qf1f.fsf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Dienstag, 14. Dezember 2021 18:20:28 CET Cornelia Huck wrote:
> On Tue, Dec 14 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > This new common configuration field allows to negotiate a more fine
> > graded maximum lenght of indirect descriptor chains.
> > 
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  content.tex    | 25 ++++++++++++++++++++++++-
> >  split-ring.tex |  3 +++
> >  2 files changed, 27 insertions(+), 1 deletion(-)
> > 
> > diff --git a/content.tex b/content.tex
> > index 0aa4842..e3cfcae 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -859,6 +859,7 @@ \subsubsection{Common configuration structure
> > layout}\label{sec:Virtio Transport> 
> >          le64 queue_driver;              /* read-write */
> >          le64 queue_device;              /* read-write */
> >          le16 queue_notify_data;         /* read-only for driver */
> > 
> > +        le32 queue_indirect_size;       /* read-write */
> 
> [Note for below: this "common" configuration structure layout is
> actually PCI-specific, it is only common between the different device
> types.]

True

> >  };
> >  \end{lstlisting}
> > 
> > @@ -938,6 +939,16 @@ \subsubsection{Common configuration structure
> > layout}\label{sec:Virtio Transport> 
> >          may benefit from providing another value, for example an internal
> >          virtqueue
> >          identifier, or an internal offset related to the virtqueue
> >          number.
> >          \end{note}
> > 
> > +
> > +\item[\field{queue_indirect_size}]
> > +        This field is used to negotiate the maximum amount of descriptors
> > per +        vring slot as in \ref{sec:Basic Facilities of a Virtio
> > Device / +        Virtqueues / The Virtqueue Descriptor Table / Indirect
> > Descriptors} if +        and only if the VIRTIO_RING_F_INDIRECT_SIZE
> > feature has been negotiated. +
> > +        The device specifies its maximum supported number of descriptors
> > per +        vring slot. If the driver requires fewer descriptors, it
> > writes its +        lower value to inform the device of the reduced
> > resource requirements.> 
> >  \end{description}
> >  
> >  \devicenormative{\paragraph}{Common configuration structure
> >  layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device
> >  Layout / Common configuration structure layout}> 
> > @@ -1003,6 +1014,12 @@ \subsubsection{Common configuration structure
> > layout}\label{sec:Virtio Transport> 
> >  The driver MUST NOT write a 0 to \field{queue_enable}.
> > 
> > +The driver SHOULD write to \field{queue_indirect_size} if its maximum
> > number of +descriptors per vring slot is lower than that reported by the
> > device.
> Maybe
> 
> "If the driver's maximum number of descriptors per vring slot is lower
> than the maximum value reported by the device, it SHOULD write that
> number to \field{queue_indirect_size}."
> 
> ?

I actually just used Stefan's wording here and extended it with semantically
required components, i.e. "vring slot" and "\field{queue_indirect_size}":
https://lists.oasis-open.org/archives/virtio-comment/202112/msg00006.html

For me both versions are fine.

> > +
> > +The driver MUST NOT write a higher value to \field{queue_indirect_size}
> > than the +one it reads from the device.
> > +
> > 
> >  \subsubsection{Notification structure layout}\label{sec:Virtio Transport
> >  Options / Virtio Over PCI Bus / PCI Device Layout / Notification
> >  capability}
> >  
> >  The notification location is found using the VIRTIO_PCI_CAP_NOTIFY_CFG
> > 
> > @@ -6712,7 +6729,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> > Feature Bits}> 
> >    being transferred per vring slot, but also avoids complicated
> >    synchronization mechanisms if the device only supports a very small
> >    amount of vring slots. Due to the 16-bit size of a descriptor's "next"
> >    field there is still an absolute> 
> > -  limit of $2^{16}$ descriptors per indirect descriptor table.
> > +  limit of $2^{16}$ descriptors per indirect descriptor table. However
> > the
> > +  actual maximum amount supported by either device or driver might be
> > less, +  and therefore the common configuration field
> > "queue_indirect_size" MUST exist +  if VIRTIO_RING_F_INDIRECT_SIZE was
> > negotiated to subsequently
> > +  negotiate the actual amount of maximum indirect descriptors supported
> > +  by both sides, as described in \ref{sec:Virtio Transport Options /
> > Virtio +  Over PCI Bus / PCI Device Layout / Common configuration
> > structure layout}.> 
> >  \end{description}
> > 
> > diff --git a/split-ring.tex b/split-ring.tex
> > index ae2aeb8..d8f66c1 100644
> > --- a/split-ring.tex
> > +++ b/split-ring.tex
> > @@ -270,6 +270,9 @@ \subsubsection{Indirect Descriptors}\label{sec:Basic
> > Facilities of a Virtio Devi> 
> >  A driver MUST NOT create a descriptor chain longer than the Queue Size of
> >  the device unless VIRTIO_RING_F_INDIRECT_SIZE has been negotiated.
> > 
> > +Furthermore if VIRTIO_RING_F_INDIRECT_SIZE has been negotiated then the
> > number +of descriptors per vring slot MUST NOT exceed the value
> > negotiated by common +configuration field "queue_indirect_size".
> 
> As mentioned above, the "common configuration layout" is actually
> PCI-specific; other transports will use different mechanism. Maybe it
> would make sense to reword the whole paragraph and add it in patch 1?
> 
> "If VIRTIO_RING_F_INDIRECT_SIZE has not been negotiated, the driver MUST
> NOT create a descriptor chain longer than the Queue Size of the device.
> 
> If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the number of
> descriptors per vring slot MUST NOT exceed the negotiated Queue Indirect
> Size."

That simplifies the statements, yes.

About the term "Queue Indirect Size": I understand your point about the field
being PCI specific, but for somebody who just reads the virtio spec for the
first time, how would you know what "Queue Indirect Size" means?

> I also wonder whether we need a device normative statement as well,
> something like:
> 
> "With VIRTIO_RING_F_INDIRECT_SIZE, the device MUST provide the maximum
> Queue Indirect Size for the number of descriptors per vring slot. It
> MUST allow the driver to set a lower value."

Makes sense.

> Maybe we also need to mention that the mechanism is transport specific?

I wouldn't do that. Instead this would probably be extended for other
transports in future appropriately.

> Also, this is only for split ring; does packed ring need any updates?

I have not reviewed the packed ring as much as I did the split ring, so I
could not say reliably all the parts that shall be updated for the packed
ring. There are some obvious parts like:

2.7.5 Scatter-Gather Support

"The device limits the number of descriptors in a list through a transport-
specific and/or device-specific value. If not limited, the maximum number of
descriptors in a list is the virt queue size."

However the question is, would anybody want large descriptor chains with the
packaged ring in the first place? If I understand it correctly, the benefits
of the packed ring over the split ring only manifest for devices that
interchange a very large number of rather small bulk data (e.g. network
devices), no?

> >  A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEXT
> >  in \field{flags}.


