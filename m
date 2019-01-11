Return-Path: virtio-comment-return-586-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E27E5985DBD
	for <virtio-comment@lists.oasis-open.org>; Fri, 11 Jan 2019 16:07:36 +0000 (UTC)
Date: Fri, 11 Jan 2019 16:07:23 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190111160723.GF2738@work-vm>
References: <20190111114200.10026-1-dgilbert@redhat.com>
 <20190111114200.10026-2-dgilbert@redhat.com>
 <20190111131540.12a8abca.cohuck@redhat.com>
 <20190111162947.7a46e8df@oc2783563651>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190111162947.7a46e8df@oc2783563651>
Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared memory
 regions
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, stefanha@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

* Halil Pasic (pasic@linux.ibm.com) wrote:
> On Fri, 11 Jan 2019 13:15:40 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Fri, 11 Jan 2019 11:41:58 +0000
> > "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> > 
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > 
> > > Define the requirements and idea behind shared memory regions.
> > > 
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >  content.tex    |  3 +++
> > >  shared-mem.tex | 25 +++++++++++++++++++++++++
> > >  2 files changed, 28 insertions(+)
> > >  create mode 100644 shared-mem.tex
> > > 
> > > diff --git a/content.tex b/content.tex
> > > index b101d1b..321a2f4 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -331,6 +331,9 @@ Virtqueue format, or both.
> > >  \input{split-ring.tex}
> > >  
> > >  \input{packed-ring.tex}
> > > +
> > > +\input{shared-mem.tex}
> > > +
> > >  \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
> > >  
> > >  We start with an overview of device initialization, then expand on the
> > > diff --git a/shared-mem.tex b/shared-mem.tex
> > > new file mode 100644
> > > index 0000000..6da249c
> > > --- /dev/null
> > > +++ b/shared-mem.tex
> > > @@ -0,0 +1,25 @@
> > > +\section{Shared Memory Regions}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions}
> > > +
> > > +Shared memory regions are an additional facility
> > > +available to devices that need a region of memory that's
> > > +continuously shared between the host and the guest, rather
> > > +than passed between them in the way virtqueue elements are.
> > > +
> 
> Kind of like the rings, just without any (common) pre-defined purpose and
> semantics?

Yes, the difference is that all the data in the rings involves handing
over 'ownership' of data from one side to the other and then doing
something and handing it back; these regions are designed for data
that's in use concurrently by both sides.

> > > +Example uses include shared caches and version pools for versioned
> > > +data structures.
> > > +
> > > +Shared memory regions MUST NOT be used to control the operation
> > > +of the device, nor to stream data; those should still be performed
> > > +using virtqueues.
> > > +
> 
> I will have to think about this paragraph some more...

It's intended to stop people using these regions for things that should
be done in the rings.

> > > +A device may have multiple shared memory regions associated with
> > > +it.  Each region has a \field{shmid} to identify it, the meaning
> > > +of which is device specific.
> > > +
> > > +Enumeration and location of shared memory regions is performed
> > > +using a transport-specific data structure.
> > 
> > "data structure and mechanism"?
> > 
> > > +
> > > +The guest physical address and the host virtual address MUST NOT
> > > +be used to identify structures within the memory regions; all
> > > +addressing MUST be relative to the start of a particular region.
> > > +
> > 
> > Is the intended implementation that the device provides a certain
> > memory region (in host memory) and exposes it to the driver? Are there
> > supposed to be any notifications of writes? Or do both simply write to
> > the region and get whatever updates the other side has made when they
> > read from the region again?
> > 
> > I'm a bit unsure how to implement this for the ccw transport. Maybe a
> > new pair of ccws to read/write shared memory regions? But we'd also
> > need a mechanism to discover the ids of those shared memory regions, I
> > think.
> > 
> > Halil, do you have any thoughts?
> > 
> 
> I hope to develop more some. I've missed these discussions unfortunately,
> and the memory stuff is not my forte. But we do seem to need a mechanism
> to discover/expose (driver/device) these.

Yes, agreed; I added the PCI and mmio discovery in the next patches
but didn't know where to start for ccw.

> Do we want to change the device initialization (3.1) subsection? I'm not
> sure if this shared  memory region discovery is something that's
> supposed to be a part of the initialization. At the moment, I would guess
> is the device not supposed to be able to provide new regions at any time
> (as I don't see how the device is supposed to tell the driver: hey
> please re-do discovery). 

Yes, it's part of initialisation; although since the enumeration is
specific to the transport and the use is specific to the device, I'm not
sure what goes in a common initialization section.

Dave

> Regards,
> Halil
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

