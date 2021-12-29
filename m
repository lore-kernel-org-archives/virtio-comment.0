Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 2/2] Add common configuration field "queue_indirect_size"
Date: Wed, 29 Dec 2021 15:16:37 +0100
Message-ID: <1920878.uA8gqIOdmR@silver>
In-Reply-To: <87bl1737mx.fsf@redhat.com>
References: <cover.1639494803.git.qemu_oss@crudebyte.com> <2524173.IXtQ29OQN3@silver> <87bl1737mx.fsf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Donnerstag, 23. Dezember 2021 12:03:50 CET Cornelia Huck wrote:
> On Wed, Dec 15 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Dienstag, 14. Dezember 2021 18:20:28 CET Cornelia Huck wrote:
> >> On Tue, Dec 14 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> 
wrote:
> >> > This new common configuration field allows to negotiate a more fine
> >> > graded maximum lenght of indirect descriptor chains.
> >> > 
> >> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> >> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> >> > ---
> >> > 
> >> >  content.tex    | 25 ++++++++++++++++++++++++-
> >> >  split-ring.tex |  3 +++
> >> >  2 files changed, 27 insertions(+), 1 deletion(-)
> >> > 
> >> > diff --git a/content.tex b/content.tex
> >> > index 0aa4842..e3cfcae 100644
> >> > --- a/content.tex
> >> > +++ b/content.tex
> >> > @@ -859,6 +859,7 @@ \subsubsection{Common configuration structure
> >> > layout}\label{sec:Virtio Transport>
> >> > 
> >> >          le64 queue_driver;              /* read-write */
> >> >          le64 queue_device;              /* read-write */
> >> >          le16 queue_notify_data;         /* read-only for driver */
> >> > 
> >> > +        le32 queue_indirect_size;       /* read-write */
> >> 
> >> [Note for below: this "common" configuration structure layout is
> >> actually PCI-specific, it is only common between the different device
> >> types.]
> > 
> > True
> > 
> >> >  };
> >> >  \end{lstlisting}
> >> > 
> >> > @@ -938,6 +939,16 @@ \subsubsection{Common configuration structure
> >> > layout}\label{sec:Virtio Transport>
> >> > 
> >> >          may benefit from providing another value, for example an
> >> >          internal
> >> >          virtqueue
> >> >          identifier, or an internal offset related to the virtqueue
> >> >          number.
> >> >          \end{note}
> >> > 
> >> > +
> >> > +\item[\field{queue_indirect_size}]
> >> > +        This field is used to negotiate the maximum amount of
> >> > descriptors
> >> > per +        vring slot as in \ref{sec:Basic Facilities of a Virtio
> >> > Device / +        Virtqueues / The Virtqueue Descriptor Table /
> >> > Indirect
> >> > Descriptors} if +        and only if the VIRTIO_RING_F_INDIRECT_SIZE
> >> > feature has been negotiated. +
> >> > +        The device specifies its maximum supported number of
> >> > descriptors
> >> > per +        vring slot. If the driver requires fewer descriptors, it
> >> > writes its +        lower value to inform the device of the reduced
> >> > resource requirements.>
> >> > 
> >> >  \end{description}
> >> >  
> >> >  \devicenormative{\paragraph}{Common configuration structure
> >> >  layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device
> >> >  Layout / Common configuration structure layout}>
> >> > 
> >> > @@ -1003,6 +1014,12 @@ \subsubsection{Common configuration structure
> >> > layout}\label{sec:Virtio Transport>
> >> > 
> >> >  The driver MUST NOT write a 0 to \field{queue_enable}.
> >> > 
> >> > +The driver SHOULD write to \field{queue_indirect_size} if its maximum
> >> > number of +descriptors per vring slot is lower than that reported by
> >> > the
> >> > device.
> >> 
> >> Maybe
> >> 
> >> "If the driver's maximum number of descriptors per vring slot is lower
> >> than the maximum value reported by the device, it SHOULD write that
> >> number to \field{queue_indirect_size}."
> >> 
> >> ?
> > 
> > I actually just used Stefan's wording here and extended it with
> > semantically required components, i.e. "vring slot" and
> > "\field{queue_indirect_size}":
> > https://lists.oasis-open.org/archives/virtio-comment/202112/msg00006.html
> > 
> > For me both versions are fine.
> 
> No strong opinion here, feel free to keep it like this if you prefer.
> 
> >> > diff --git a/split-ring.tex b/split-ring.tex
> >> > index ae2aeb8..d8f66c1 100644
> >> > --- a/split-ring.tex
> >> > +++ b/split-ring.tex
> >> > @@ -270,6 +270,9 @@ \subsubsection{Indirect
> >> > Descriptors}\label{sec:Basic
> >> > Facilities of a Virtio Devi>
> >> > 
> >> >  A driver MUST NOT create a descriptor chain longer than the Queue Size
> >> >  of
> >> >  the device unless VIRTIO_RING_F_INDIRECT_SIZE has been negotiated.
> >> > 
> >> > +Furthermore if VIRTIO_RING_F_INDIRECT_SIZE has been negotiated then
> >> > the
> >> > number +of descriptors per vring slot MUST NOT exceed the value
> >> > negotiated by common +configuration field "queue_indirect_size".
> >> 
> >> As mentioned above, the "common configuration layout" is actually
> >> PCI-specific; other transports will use different mechanism. Maybe it
> >> would make sense to reword the whole paragraph and add it in patch 1?
> >> 
> >> "If VIRTIO_RING_F_INDIRECT_SIZE has not been negotiated, the driver MUST
> >> NOT create a descriptor chain longer than the Queue Size of the device.
> >> 
> >> If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the number of
> >> descriptors per vring slot MUST NOT exceed the negotiated Queue Indirect
> >> Size."
> > 
> > That simplifies the statements, yes.
> > 
> > About the term "Queue Indirect Size": I understand your point about the
> > field being PCI specific, but for somebody who just reads the virtio spec
> > for the first time, how would you know what "Queue Indirect Size" means?
> 
> If we follow my suggestion below, it is described in the device
> normative statement. (Not sure if we actually do the same for Queue Size
> already? That's a similar case.)
> 
> >> I also wonder whether we need a device normative statement as well,
> >> something like:
> >> 
> >> "With VIRTIO_RING_F_INDIRECT_SIZE, the device MUST provide the maximum
> >> Queue Indirect Size for the number of descriptors per vring slot. It
> >> MUST allow the driver to set a lower value."
> > 
> > Makes sense.
> > 
> >> Maybe we also need to mention that the mechanism is transport specific?
> > 
> > I wouldn't do that. Instead this would probably be extended for other
> > transports in future appropriately.
> 
> The mechanics, not providing the value... something like
> 
> "The maximum Queue Indirect Size is provided by the device in a
> transport-specific way."
> 
> (There should already be some precedence for other values.)
> 
> >> Also, this is only for split ring; does packed ring need any updates?
> > 
> > I have not reviewed the packed ring as much as I did the split ring, so I
> > could not say reliably all the parts that shall be updated for the packed
> > ring. There are some obvious parts like:
> > 
> > 2.7.5 Scatter-Gather Support
> > 
> > "The device limits the number of descriptors in a list through a
> > transport-
> > specific and/or device-specific value. If not limited, the maximum number
> > of descriptors in a list is the virt queue size."
> > 
> > However the question is, would anybody want large descriptor chains with
> > the packaged ring in the first place? If I understand it correctly, the
> > benefits of the packed ring over the split ring only manifest for devices
> > that interchange a very large number of rather small bulk data (e.g.
> > network devices), no?
> 
> If we think that the feature does not make sense for packed ring, they
> should probably conflict with each other. Otherwise, I think we need at
> least a statement that the higher limit does not take effect for packed
> ring, or touch all the places where it would be relevant.
> 
> What do others think?

It would indeed be very useful if other people express their opinion about 
this issue (packed ring scenario) as well before I continue on this issue.

Probably the fact that my patches never made it through to the list were not 
necessarily supporting this. Should I contact somebody regarding this ML 
issue? Do members of the other ML also read this virtio-comment list?

I tried to compensate the current situation by updating the corresponding 
issue description on Github in a very defailed and verbose way:
https://github.com/oasis-tcs/virtio-spec/issues/122

If nobody replies early January, I would suggest to continue by ignoring the 
packed ring. Because if somebody wants this for packed ring in future, this 
can still be added to the specs without breaking things, because this feature 
is negotiated per queue, not for the entire device.

Best regards,
Christian Schoenebeck


