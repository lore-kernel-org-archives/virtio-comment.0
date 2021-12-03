Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 2/2] Add common configuration field "queue_indirect_size"
Date: Fri, 03 Dec 2021 16:03:26 +0100
Message-ID: <5089970.kXHs69otit@silver>
In-Reply-To: <YajycS/6kFMgTDVy@stefanha-x1.localdomain>
References: <cover.1638192251.git.qemu_oss@crudebyte.com> <4f5146a4bcbe59a76698e276216ef4a4d2270b61.1638192251.git.qemu_oss@crudebyte.com> <YajycS/6kFMgTDVy@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Donnerstag, 2. Dezember 2021 17:21:05 CET Stefan Hajnoczi wrote:
> On Mon, Nov 29, 2021 at 02:23:01PM +0100, Christian Schoenebeck wrote:
> > This new common configuration field allows to negotiate a more fine
> > graded numeric maximum length of indirect descriptor chains.
> > 
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  content.tex    | 37 ++++++++++++++++++++++++++++++++++++-
> >  split-ring.tex |  5 +++++
> >  2 files changed, 41 insertions(+), 1 deletion(-)
> > 
> > diff --git a/content.tex b/content.tex
> > index 34fa23e..25861f3 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -859,6 +859,7 @@ \subsubsection{Common configuration structure
> > layout}\label{sec:Virtio Transport> 
> >          le64 queue_driver;              /* read-write */
> >          le64 queue_device;              /* read-write */
> >          le16 queue_notify_data;         /* read-only for driver */
> > 
> > +        le16 queue_indirect_size;       /* read-write */
> > 
> >  };
> >  \end{lstlisting}
> > 
> > @@ -938,6 +939,34 @@ \subsubsection{Common configuration structure
> > layout}\label{sec:Virtio Transport> 
> >          may benefit from providing another value, for example an internal
> >          virtqueue
> >          identifier, or an internal offset related to the virtqueue
> >          number.
> >          \end{note}
> > 
> > +
> > +\item[\field{queue_indirect_size}]
> > +        This field was added in revision 3 and MUST exist if revision 3
> > +        has been negotiated. This field is used to negotiate the maximum
> > +        amount of indirect descriptors per indirect descriptor table as
> > in
> > +        \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / The
> > +        Virtqueue Descriptor Table / Indirect Descriptors}.
> > +
> > +        The device specifies its supported maximum amount here first,
> > +        subsequently driver may read and then SHOULD write this field to
> > +        lower the value if driver's maximum amount of indirect
> > descriptors
> > +        ever being emplaced by driver per vring slot is less than what
> > +        device supports. However driver MUST NOT increase this value.
> 
> may/SHOULD/MUST NOT statements need to go into drivernormative or
> devicenormative sections.
> 
> I suggest phrasing it so functionality is described here and normative
> sections don't repeat what was already covered:
> 
>   The device specifies its maximum supported number of descriptors per
>   indirect descriptor table. If the driver requires fewer descriptors,
>   it writes its lower value to inform the device of the reduced resource
>   requirements.
> 
> The drivernormative section would say:
> 
> - The driver SHOULD write the field if its maximum number of descriptors
>   per indirect descriptor table is lower than that reported by the
>   device.
> - The driver MUST NOT write a higher value than the one it reads from
>   the device.

I don't understand which sections you see as "drivernormative" and which ones 
not. Which precise sections in the spec do you want those comments to go to?

> > +
> > +        Two different semantics evolve for the value of this field,
> > depending on +        whether VIRTIO_RING_F_LARGE_INDIRECT_DESC (see
> > section
> > +        \ref{sec:Reserved Feature Bits}) has been negotiated:
> > +
> > +        If VIRTIO_RING_F_LARGE_INDIRECT_DESC has not been negotiated,
> > then the +        effective maximum amount of indirect descriptors per
> > indirect descriptor +        table is min(Queue Size,
> > \field{queue_indirect_size}). So in this case +        this field allows
> > driver to indicate if its supported maximum amount of +        indirect
> > descriptors is less than Queue Size.
> 
> I expected the !VIRTIO_RING_F_LARGE_INDIRECT_DESC case to preserve
> existing behavior to avoid breaking existing drivers/devices. An
> existing driver that honors Queue Size and doesn't know about
> queue_indirect_size now violates the spec when a new device reports a
> queue_indirect_size value less than Queue Size.
> 
> I expected drivers to only check queue_indirect_size when
> VIRTIO_RING_F_LARGE_INDIRECT_DESC is negotiated.

Ok, fine with me then.

> > +
> > +        If VIRTIO_RING_F_LARGE_INDIRECT_DESC has been negotiated, then
> > the
> > +        effective maximum amount of indirect descriptors per indirect
> > descriptor +        table is directly and solely reflected by
> > \field{queue_indirect_size} +        field here.
> > 
> >  \end{description}
> >  
> >  \devicenormative{\paragraph}{Common configuration structure
> >  layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device
> >  Layout / Common configuration structure layout}> 
> > @@ -6712,7 +6741,13 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> > Feature Bits}> 
> >    being transferred per vring slot, but also avoids complicated
> >    synchronization mechanisms if device only supports a very small amount
> >    of vring slots. Due to the 16-bit size of a descriptor's "next" field
> >    there is still an absolute> 
> > -  limit of $2^{16}$ descriptors per indirect descriptor table.
> > +  limit of $2^{16}$ descriptors per indirect descriptor table. However
> > the
> > +  actual maximum amount supported by either device or driver might be
> > less, +  and therefore the common configuration field
> > "queue_indirect_size" MUST exist +  if VIRTIO_RING_F_LARGE_INDIRECT_DESC
> > had been negotiated to subsequently
> s/had been/was/

Ack. Same applies to your comments on patch 1, so I won't send a separate 
email on that.

Best regards,
Christian Schoenebeck


