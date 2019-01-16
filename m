Return-Path: virtio-comment-return-592-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2C340985D3D
	for <virtio-comment@lists.oasis-open.org>; Wed, 16 Jan 2019 20:06:32 +0000 (UTC)
Date: Wed, 16 Jan 2019 20:06:25 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190116200625.GG2351@work-vm>
References: <20190111114200.10026-1-dgilbert@redhat.com>
 <20190111114200.10026-2-dgilbert@redhat.com>
 <20190111131540.12a8abca.cohuck@redhat.com>
 <20190111122654.GE2738@work-vm>
 <20190115111038.6769d292.cohuck@redhat.com>
 <20190115112303.GB2135@work-vm>
 <20190116115638.152d6797.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190116115638.152d6797.cohuck@redhat.com>
Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared memory
 regions
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, stefanha@redhat.com, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

* Cornelia Huck (cohuck@redhat.com) wrote:
> On Tue, 15 Jan 2019 11:23:03 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Cornelia Huck (cohuck@redhat.com) wrote:
> > > On Fri, 11 Jan 2019 12:26:54 +0000
> > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > >   
> > > > * Cornelia Huck (cohuck@redhat.com) wrote:  
> > > > > On Fri, 11 Jan 2019 11:41:58 +0000
> > > > > "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:  
> > >   
> > > > > > +\section{Shared Memory Regions}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions}
> > > > > > +
> > > > > > +Shared memory regions are an additional facility
> > > > > > +available to devices that need a region of memory that's
> > > > > > +continuously shared between the host and the guest, rather
> > > > > > +than passed between them in the way virtqueue elements are.  
> > > 
> > > I think we probably need to clarify the expectations (consistency etc.)
> > > a bit more, see my remarks below.
> > >   
> > > > > > +
> > > > > > +Example uses include shared caches and version pools for versioned
> > > > > > +data structures.
> > > > > > +
> > > > > > +Shared memory regions MUST NOT be used to control the operation
> > > > > > +of the device, nor to stream data; those should still be performed
> > > > > > +using virtqueues.
> > > > > > +
> > > > > > +A device may have multiple shared memory regions associated with
> > > > > > +it.  Each region has a \field{shmid} to identify it, the meaning
> > > > > > +of which is device specific.
> > > > > > +
> > > > > > +Enumeration and location of shared memory regions is performed
> > > > > > +using a transport-specific data structure.    
> > > > > 
> > > > > "data structure and mechanism"?    
> > > > 
> > > > Changed; thanks.
> > > >   
> > > > > > +
> > > > > > +The guest physical address and the host virtual address MUST NOT
> > > > > > +be used to identify structures within the memory regions; all
> > > > > > +addressing MUST be relative to the start of a particular region.
> > > > > > +    
> > > > > 
> > > > > Is the intended implementation that the device provides a certain
> > > > > memory region (in host memory) and exposes it to the driver? Are there
> > > > > supposed to be any notifications of writes? Or do both simply write to
> > > > > the region and get whatever updates the other side has made when they
> > > > > read from the region again?    
> > > > 
> > > > There's no notification;  in our case we have two main uses:
> > > >   a) Direct mapping of host files into the guests memory
> > > > 
> > > >   b) Mapping of a version table with quickly updated version numbers for
> > > >      data structures to do quick invalidation  
> > > 
> > > This sounds a lot like "we have a memory area, and both device and
> > > driver may write to or read from it at any time". Are there any
> > > expectations regarding consistency when reading data, or is there
> > > supposed to be a device-type specific mechanism to get certain
> > > consistent values?  
> > 
> > It's device-type specific; and potentially different for different
> > shared memory regions associated with that device.
> 
> Ok; it might make sense to put a sentence like that into the generic
> section.

I've added:
   Memory consistency rules vary depending on the region and the
   device.  Devices MUST define the required behaviour for each
   region.

> > In the virtio-fs usecase we've really got two separate regions; one is
> > a direct mapping of files on the host, the other is a structure
> > containing flags/version numbers for data structures; the later
> > probably has much more strict ordering semantics.
> 
> Another question: Do we expect the set of regions to be unchanged
> during the lifetime of the device, or we need a mechanism to trigger
> rediscovery?

In our uses we've got fixed sizes; they're similar to caches, where
they're fixed size and we evict data and mappings and fill them again later.
I can imagine that someone might want to dynamically change it, but
perhaps it's best to wait until someone has a case like that to
understand their requirements.

> > 
> > > > > I'm a bit unsure how to implement this for the ccw transport. Maybe a
> > > > > new pair of ccws to read/write shared memory regions?    
> > > > 
> > > > Without knowing anything about CCW itself, I don't think you'd want
> > > > to do calls to perform the reads/writes - remember these are entirely
> > > > emulated devices, and the shared memory regions just correspond to
> > > > memory regions in the hypervisor; so in most ways they just behave
> > > > like a region of RAM.  If the drivers can't treat them like RAM there's
> > > > probably no point in using this feature in that environment.  
> > > 
> > > The main issue here is that s390 does not have memory mapped I/O --
> > > even PCI uses some specialized instructions. This means we need to
> > > figure out how to model some stuff that Just Works on other platforms.
> > > 
> > > So, basically there are two options:
> > > - Have the device set aside a memory area; the host maps this into the
> > >   guest and the driver can access it. No notifications, only discovery
> > >   is needed.
> > > - Have the device set aside a memory area; the driver can only access
> > >   this via special operations, which the host can trap. This needs two
> > >   more commands to be set aside, and any driver accesses need to be
> > >   forced through these commands (that's a bit like config space).
> > > 
> > > If I've understood the intended usage correctly, we can use the simpler
> > > first option. The drawback is that we can't add interception
> > > possibilities (that we get via the second option) should we need them
> > > later on.  
> > 
> > Right, and it's the first option we need.
> 
> That makes things easier. Thanks!

Great.

So these are all moving this 1/3 forward - has anyone got comments on
the transport specific implementations?

Dave

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

