Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 2/2] Add common configuration field "queue_indirect_size"
Date: Sat, 19 Feb 2022 17:36:24 +0100
Message-ID: <4715621.MooAOXffm5@silver>
In-Reply-To: <Ye6vaQZauiY7xsMB@stefanha-x1.localdomain>
References: <cover.1639494803.git.qemu_oss@crudebyte.com> <55b04c584638393050bc76467439550d87e24696.1639494803.git.qemu_oss@crudebyte.com> <Ye6vaQZauiY7xsMB@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Montag, 24. Januar 2022 14:53:45 CET Stefan Hajnoczi wrote:
> On Tue, Dec 14, 2021 at 04:13:17PM +0100, Christian Schoenebeck wrote:
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

Stefan, while preparing the next version of patches for this issue (#122), I 
noticed that I missed your email here ...

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
> I see no other unaligned fields in this struct, so I think a le16
> padding field is needed for safety:
> 
>            le64 queue_device;              /* read-write */
>            le16 queue_notify_data;         /* read-only for driver */
>   +        le16 reserved;                  /* no access */
>   +        le32 queue_indirect_size;       /* read-write */
> 

That's no longer needed as there's now the new 'queue_reset' field, i.e.:

diff --git a/content.tex b/content.tex
index 685525d..da57d5d 100644
--- a/content.tex
+++ b/content.tex
@@ -902,6 +902,7 @@ \subsubsection{Common configuration structure layout}
\label{sec:Virtio Transport
         le64 queue_device;              /* read-write */
         le16 queue_notify_data;         /* read-only for driver */
         le16 queue_reset;               /* read-write */
+        le32 queue_indirect_size;       /* read-write */
 };
 \end{lstlisting}

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
> > resource requirements.
> "vring slot" is a little vague, it means "indirect descriptor
> table"? The two paragraphs could use "maximum number of descriptors per
> indirect descriptor table" instead of referring to vring slots to imply
> indirect descriptor tables.

The intended phrasing was intended to reflect that "Queue Indirect Size" is 
meant to be the *sum* of all indirect descriptors:
https://lists.oasis-open.org/archives/virtio-comment/202112/msg00008.html

Just to avoid that I am missing something here; as of now, there can only be 
two indirect tables per round-trip message, right?

Best regards,
Christian Schoenebeck


