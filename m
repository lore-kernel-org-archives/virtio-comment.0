Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 2/2] Add common configuration field "queue_indirect_size"
Date: Mon, 21 Feb 2022 14:28:54 +0100
Message-ID: <1873283.GO7HMKvsLY@silver>
In-Reply-To: <YhNqifSTxdOhy5tV@stefanha-x1.localdomain>
References: <cover.1639494803.git.qemu_oss@crudebyte.com> <4715621.MooAOXffm5@silver> <YhNqifSTxdOhy5tV@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Montag, 21. Februar 2022 11:33:45 CET Stefan Hajnoczi wrote:
> On Sat, Feb 19, 2022 at 05:36:24PM +0100, Christian Schoenebeck wrote:
> > On Montag, 24. Januar 2022 14:53:45 CET Stefan Hajnoczi wrote:
> > > On Tue, Dec 14, 2021 at 04:13:17PM +0100, Christian Schoenebeck wrote:
> > > > @@ -938,6 +939,16 @@ \subsubsection{Common configuration structure
> > > > layout}\label{sec:Virtio Transport>
> > > > 
> > > >          may benefit from providing another value, for example an
> > > >          internal
> > > >          virtqueue
> > > >          identifier, or an internal offset related to the virtqueue
> > > >          number.
> > > >          \end{note}
> > > > 
> > > > +
> > > > +\item[\field{queue_indirect_size}]
> > > > +        This field is used to negotiate the maximum amount of
> > > > descriptors
> > > > per +        vring slot as in \ref{sec:Basic Facilities of a Virtio
> > > > Device / +        Virtqueues / The Virtqueue Descriptor Table /
> > > > Indirect
> > > > Descriptors} if +        and only if the VIRTIO_RING_F_INDIRECT_SIZE
> > > > feature has been negotiated. +
> > > > +        The device specifies its maximum supported number of
> > > > descriptors
> > > > per +        vring slot. If the driver requires fewer descriptors, it
> > > > writes its +        lower value to inform the device of the reduced
> > > > resource requirements.
> > > 
> > > "vring slot" is a little vague, it means "indirect descriptor
> > > table"? The two paragraphs could use "maximum number of descriptors per
> > > indirect descriptor table" instead of referring to vring slots to imply
> > > indirect descriptor tables.
> > 
> > The intended phrasing was intended to reflect that "Queue Indirect Size"
> > is
> > meant to be the *sum* of all indirect descriptors:
> > https://lists.oasis-open.org/archives/virtio-comment/202112/msg00008.html
> > 
> > Just to avoid that I am missing something here; as of now, there can only
> > be two indirect tables per round-trip message, right?
> 
> No, just one indirect descriptor table. An indirect descriptor table may
> contain both IN and OUT descriptors so it can handle a round-trip
> message.

Ok, you are right. I thought it would pick (per round-trip message) 2 pre-
allocated descriptors (directly from the queue), and that those 2 descriptors 
would then point to a separate indirect table each.

But it is like you said: just one pre-allocated descriptor, pointing to 
exactly one indirect table, and inside that indirect table there are first the 
indirect descriptors (pages) for device<-driver request message, followed by 
indirect descriptors (pages) for device->driver response message. And this 
order (request first, response second) is implied by the QEMU code as well.

The names for "in" and "out" in the code are a bit confusing BTW.

> 2.6.5.3.1 Driver Requirements: Indirect Descriptors says:
> 
>   A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEXT in
> flags.

Yes, I was aware about that and that should have made it clear to me already. 
I had a calculation error while debugging the code which mislead me.

> It's unclear whether this statement is referring to 1) one descriptor,
> 2) to all descriptors in a buffer, or 3) to all descriptors ever made
> available by the driver. QEMU's hw/virtio.c:virtqueue_pop() shows that
> the interpretation is #2. So if a buffer uses an indirect descriptor
> table then it has exactly 1 descriptor in the virtqueue's descriptor
> table.
> 
> Stefan

Yes, it is 2).

Ok, I'll change the phrasing as you suggested to "per indirect descriptor 
table" and will send a new version this week.

Thanks!

Best regards,
Christian Schoenebeck


