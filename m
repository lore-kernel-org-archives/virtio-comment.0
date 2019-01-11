Return-Path: pasic@linux.ibm.com
Date: Fri, 11 Jan 2019 16:29:47 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared
 memory regions
In-Reply-To: <20190111131540.12a8abca.cohuck@redhat.com>
References: <20190111114200.10026-1-dgilbert@redhat.com>	<20190111114200.10026-2-dgilbert@redhat.com>	<20190111131540.12a8abca.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID: <20190111162947.7a46e8df@oc2783563651>
To: Cornelia Huck <cohuck@redhat.com>
Cc: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>, virtio-comment@lists.oasis-open.org, stefanha@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 11 Jan 2019 13:15:40 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Fri, 11 Jan 2019 11:41:58 +0000
> "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> 
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Define the requirements and idea behind shared memory regions.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  content.tex    |  3 +++
> >  shared-mem.tex | 25 +++++++++++++++++++++++++
> >  2 files changed, 28 insertions(+)
> >  create mode 100644 shared-mem.tex
> > 
> > diff --git a/content.tex b/content.tex
> > index b101d1b..321a2f4 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -331,6 +331,9 @@ Virtqueue format, or both.
> >  \input{split-ring.tex}
> >  
> >  \input{packed-ring.tex}
> > +
> > +\input{shared-mem.tex}
> > +
> >  \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
> >  
> >  We start with an overview of device initialization, then expand on the
> > diff --git a/shared-mem.tex b/shared-mem.tex
> > new file mode 100644
> > index 0000000..6da249c
> > --- /dev/null
> > +++ b/shared-mem.tex
> > @@ -0,0 +1,25 @@
> > +\section{Shared Memory Regions}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions}
> > +
> > +Shared memory regions are an additional facility
> > +available to devices that need a region of memory that's
> > +continuously shared between the host and the guest, rather
> > +than passed between them in the way virtqueue elements are.
> > +

Kind of like the rings, just without any (common) pre-defined purpose and
semantics?

> > +Example uses include shared caches and version pools for versioned
> > +data structures.
> > +
> > +Shared memory regions MUST NOT be used to control the operation
> > +of the device, nor to stream data; those should still be performed
> > +using virtqueues.
> > +

I will have to think about this paragraph some more...

> > +A device may have multiple shared memory regions associated with
> > +it.  Each region has a \field{shmid} to identify it, the meaning
> > +of which is device specific.
> > +
> > +Enumeration and location of shared memory regions is performed
> > +using a transport-specific data structure.
> 
> "data structure and mechanism"?
> 
> > +
> > +The guest physical address and the host virtual address MUST NOT
> > +be used to identify structures within the memory regions; all
> > +addressing MUST be relative to the start of a particular region.
> > +
> 
> Is the intended implementation that the device provides a certain
> memory region (in host memory) and exposes it to the driver? Are there
> supposed to be any notifications of writes? Or do both simply write to
> the region and get whatever updates the other side has made when they
> read from the region again?
> 
> I'm a bit unsure how to implement this for the ccw transport. Maybe a
> new pair of ccws to read/write shared memory regions? But we'd also
> need a mechanism to discover the ids of those shared memory regions, I
> think.
> 
> Halil, do you have any thoughts?
> 

I hope to develop more some. I've missed these discussions unfortunately,
and the memory stuff is not my forte. But we do seem to need a mechanism
to discover/expose (driver/device) these.

Do we want to change the device initialization (3.1) subsection? I'm not
sure if this shared  memory region discovery is something that's
supposed to be a part of the initialization. At the moment, I would guess
is the device not supposed to be able to provide new regions at any time
(as I don't see how the device is supposed to tell the driver: hey
please re-do discovery). 

Regards,
Halil

