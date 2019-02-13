Return-Path: virtio-comment-return-608-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C92B5985E0C
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Feb 2019 10:44:33 +0000 (UTC)
Date: Wed, 13 Feb 2019 10:44:27 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190213104426.GC2601@work-vm>
References: <20190111114200.10026-1-dgilbert@redhat.com>
 <20190111114200.10026-2-dgilbert@redhat.com>
 <20190213022549.GB14307@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190213022549.GB14307@stefanha-x1.localdomain>
Subject: [virtio-comment] Re: [PATCH 1/3] shared memory: Define shared memory regions
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Fri, Jan 11, 2019 at 11:41:58AM +0000, Dr. David Alan Gilbert (git) wrote:
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
> > +Example uses include shared caches and version pools for versioned
> > +data structures.
> 
> Another motivation for shared memory regions is to accommodate memory
> resources that must be allocated by the device rather than the driver.
> 
> For example, some GPU hardware restrictions make it impossible for the
> driver to select a suitable RAM region.

I've added:

  The region is chosen by the host and presented to the guest, as
  such it is useful in situations where the memory is accessed on
  the host by other libraries that can't safely access guest RAM.


> > +
> > +Shared memory regions MUST NOT be used to control the operation
> > +of the device, nor to stream data; those should still be performed
> > +using virtqueues.
> > +
> > +A device may have multiple shared memory regions associated with
> > +it.  Each region has a \field{shmid} to identify it, the meaning
> > +of which is device specific.
> 
> s/device specific/device-specific/

Fixed.

Dave

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

