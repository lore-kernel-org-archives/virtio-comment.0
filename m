Return-Path: virtio-comment-return-594-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4E494985E9F
	for <virtio-comment@lists.oasis-open.org>; Wed, 23 Jan 2019 15:12:23 +0000 (UTC)
Date: Wed, 23 Jan 2019 10:12:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190123100932-mutt-send-email-mst@kernel.org>
References: <20190111114200.10026-1-dgilbert@redhat.com>
 <20190111114200.10026-2-dgilbert@redhat.com>
 <20190111131540.12a8abca.cohuck@redhat.com>
 <20190111122654.GE2738@work-vm>
 <20190115111038.6769d292.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190115111038.6769d292.cohuck@redhat.com>
Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared memory
 regions
To: Cornelia Huck <cohuck@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-comment@lists.oasis-open.org, stefanha@redhat.com, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Jan 15, 2019 at 11:10:38AM +0100, Cornelia Huck wrote:
> On Fri, 11 Jan 2019 12:26:54 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Cornelia Huck (cohuck@redhat.com) wrote:
> > > On Fri, 11 Jan 2019 11:41:58 +0000
> > > "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> 
> > > > +\section{Shared Memory Regions}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions}
> > > > +
> > > > +Shared memory regions are an additional facility
> > > > +available to devices that need a region of memory that's
> > > > +continuously shared between the host and the guest, rather
> > > > +than passed between them in the way virtqueue elements are.
> 
> I think we probably need to clarify the expectations (consistency etc.)
> a bit more, see my remarks below.
> 
> > > > +
> > > > +Example uses include shared caches and version pools for versioned
> > > > +data structures.
> > > > +
> > > > +Shared memory regions MUST NOT be used to control the operation
> > > > +of the device, nor to stream data; those should still be performed
> > > > +using virtqueues.
> > > > +
> > > > +A device may have multiple shared memory regions associated with
> > > > +it.  Each region has a \field{shmid} to identify it, the meaning
> > > > +of which is device specific.
> > > > +
> > > > +Enumeration and location of shared memory regions is performed
> > > > +using a transport-specific data structure.  
> > > 
> > > "data structure and mechanism"?  
> > 
> > Changed; thanks.
> > 
> > > > +
> > > > +The guest physical address and the host virtual address MUST NOT
> > > > +be used to identify structures within the memory regions; all
> > > > +addressing MUST be relative to the start of a particular region.
> > > > +  
> > > 
> > > Is the intended implementation that the device provides a certain
> > > memory region (in host memory) and exposes it to the driver? Are there
> > > supposed to be any notifications of writes? Or do both simply write to
> > > the region and get whatever updates the other side has made when they
> > > read from the region again?  
> > 
> > There's no notification;  in our case we have two main uses:
> >   a) Direct mapping of host files into the guests memory
> > 
> >   b) Mapping of a version table with quickly updated version numbers for
> >      data structures to do quick invalidation
> 
> This sounds a lot like "we have a memory area, and both device and
> driver may write to or read from it at any time". Are there any
> expectations regarding consistency when reading data, or is there
> supposed to be a device-type specific mechanism to get certain
> consistent values?
> 
> > > I'm a bit unsure how to implement this for the ccw transport. Maybe a
> > > new pair of ccws to read/write shared memory regions?  
> > 
> > Without knowing anything about CCW itself, I don't think you'd want
> > to do calls to perform the reads/writes - remember these are entirely
> > emulated devices, and the shared memory regions just correspond to
> > memory regions in the hypervisor; so in most ways they just behave
> > like a region of RAM.  If the drivers can't treat them like RAM there's
> > probably no point in using this feature in that environment.
> 
> The main issue here is that s390 does not have memory mapped I/O --
> even PCI uses some specialized instructions. This means we need to
> figure out how to model some stuff that Just Works on other platforms.
> 
> So, basically there are two options:
> - Have the device set aside a memory area; the host maps this into the
>   guest and the driver can access it. No notifications, only discovery
>   is needed.
> - Have the device set aside a memory area; the driver can only access
>   this via special operations, which the host can trap. This needs two
>   more commands to be set aside, and any driver accesses need to be
>   forced through these commands (that's a bit like config space).
> 
> If I've understood the intended usage correctly, we can use the simpler
> first option. The drawback is that we can't add interception
> possibilities (that we get via the second option) should we need them
> later on.

Won't write-protecting the memory make writes cause a trap that we can
then handle?

> > 
> > > But we'd also
> > > need a mechanism to discover the ids of those shared memory regions, I
> > > think.  
> > 
> > Yes, I'm assuming you'll need a call to enumerate them.
> 
> Agreed.
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/

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

