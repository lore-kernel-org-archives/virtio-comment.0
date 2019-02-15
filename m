Return-Path: virtio-comment-return-630-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6AD2B9860B3
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 Feb 2019 21:42:49 +0000 (UTC)
Date: Fri, 15 Feb 2019 22:42:39 +0100
From: Halil Pasic <pasic@linux.ibm.com>
In-Reply-To: <20190215151424.GI2630@work-vm>
References: <CAEkmjvWgQg-xhOb0xLKqofi31Dzwaz1M8DQGDBgrYqO8iJ7Ubg@mail.gmail.com>
	<20190215120718.7c7e09cc.cohuck@redhat.com>
	<f4f00ab1-fb60-483a-ab53-5d0546dd9a8e@redhat.com>
	<20190215132843.65552e44.cohuck@redhat.com>
	<4c526716-44f5-5eea-a855-f0b9f91cb579@redhat.com>
	<20190215133753.1e74c6d8.cohuck@redhat.com>
	<20190215135016.GG2630@work-vm>
	<7e601742-a4f0-1c89-ce4a-018d1bc0d63f@redhat.com>
	<20190215140233.GH2630@work-vm>
	<b7bb1e23-707e-a6da-7bb7-5498c7f3d73a@redhat.com>
	<20190215151424.GI2630@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-Id: <20190215224239.6c0cb1d1@oc2783563651>
Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared
 memory regions
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Frank Yang <lfy@google.com>, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 15 Feb 2019 15:14:25 +0000
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * David Hildenbrand (david@redhat.com) wrote:
> > On 15.02.19 15:02, Dr. David Alan Gilbert wrote:
> > > * David Hildenbrand (david@redhat.com) wrote:
> > >> On 15.02.19 14:50, Dr. David Alan Gilbert wrote:
> > >>> * Cornelia Huck (cohuck@redhat.com) wrote:
> > >>>> On Fri, 15 Feb 2019 13:33:06 +0100
> > >>>> David Hildenbrand <david@redhat.com> wrote:
> > >>>>
> > >>>>> On 15.02.19 13:28, Cornelia Huck wrote:
> > >>>>>> On Fri, 15 Feb 2019 12:26:00 +0100
> > >>>>>> David Hildenbrand <david@redhat.com> wrote:
> > >>>>>>   
> > >>>>>>> Probing is always ugly. But I think we can add something like
> > >>>>>>>  the x86 PCI hole between 3 and 4 GB after our initial boot memory.
> > >>>>>>> So there, we would have a memory region just like e.g. x86 has.  
> > >>>>>>
> > >>>>>> A special region is probably the best way out of this pickle. We would
> > >>>>>> only need the discovery ccw for virtio, then.
> > >>>>>>   
> > >>>>>>>
> > >>>>>>> This should even work with other mechanism I am working on. E.g.
> > >>>>>>> for memory devices, we will add yet another memory region above
> > >>>>>>> the special PCI region.
> > >>>>>>>
> > >>>>>>> The layout of the guest would then be something like
> > >>>>>>>
> > >>>>>>> [0x000000000000000]
> > >>>>>>> ... Memory region containing RAM
> > >>>>>>> [ram_size         ]
> > >>>>>>> ... Memory region for e.g. special PCI devices
> > >>>>>>> [ram_size +1 GB   ]
> > >>>>>>> ... Memory region for memory devices (virtio-pmem, virtio-mem ...)
> > >>>>>>> [maxram_size - ram_size + 1GB]
> > >>>>>>>
> > >>>>>>> We would have to create proper page tables for guest backing that take
> > >>>>>>> care of the new guest size (not just ram_size). Also, to the guest we
> > >>>>>>> would indicate "maximum ram size == ram_size" so it does not try to
> > >>>>>>> probe the "special" memory.  
> > >>>>>>
> > >>>>>> Hm... so that would be:
> > >>>>>> - 0..ram_size: just like it is handled now
> > >>>>>> - ram_size..ram_size + 1GB: guest does not treat it as ram, but does
> > >>>>>>   build page tables for it
> > >>>>>> - ram_size + 1GB..maxram_size: for whatever memory devices do with it
> > >>>>>>
> > >>>>>> How does the guest probe this? (SCLP?) Or does the guest simply know
> > >>>>>> via some kind of probable feature that there's a 1GB region there?  
> > >>>>>
> > >>>>> As the guest only "knowns" ram, there is a "maximum ram size" specified
> > >>>>> via SCLP. An unmodified guest will not probe beyond that.
> > >>>>
> > >>>> Nod.
> > >>>>
> > >>>>> The parts of the 1GB used by a device should be communicated via the
> > >>>>> paravirtualized device I guess. PCI bars don't really fit I assume, so
> > >>>>> we might need some virtio-ccw thingy (you're the expert :)) on top. That
> > >>>>> is one part to be clarified.
> > >>>>>
> > >>>>> I guess the guest does not need to know about the whole 1GB, only per
> > >>>>> device about the used part. We can then built page tables in the guest
> > >>>>> for that part when plugging.
> > >>>>
> > >>>> Hm. With my proposal, the guest would get a list of region addresses
> > >>>> from the device via a new ccw. It could then proceed to set up page
> > >>>> tables for it and start to use it. As long as it is aware that the
> > >>>> addresses it will get are beyond max_ram, that should be fine, I think.
> > >>>
> > >>> Which is the same as my virtio-mmio proposal; the host gets to put it
> > >>> where ever it sees fit (outside ram) and you've just got a way of
> > >>> telling the guest where it lives.
> > >>>
> > >>> Davidh's 1GB window is pretty much how older PCs worked I think;
> > >>> the problem is that 1GB is never enough and you still need a way
> > >>> to enumarate what devices are where, so it doesn't help you.
> > >>> (Our current virtio-fs dax mappings we're using are a few GB).
> > >>>
> > >>
> > >> How does that work on x86? You cannot suddenly move stuff into the
> > >> memory device memory region and potentially mess with DIMMs to be
> > >> plugged later. QEMU wise, this sounds wrong.
> > > 
> > > Because it's PCI based, it becomes the guests problem - the guest
> > > sets the PCI BARs which set the GPA of the PCI devices;  I assume
> > > there's some protection that happens if it gets mapped over RAM (?!)
> > > 
> > > I think that varies by firmware as well, with EFI mapping
> > > them differently from our bios.
> > > I think the guest knows the total number of DIMM slots and max-ram
> > > limit, so knows where not-to-map.
> > 
> > On s390x, we have to define the size of the host->guest page table when
> > starting the guest. So we need some upper limit.
> 
> That's OK; x86 also has that because they have a limited physical
> and virtual address size [which may or may not be correctly passed to
> the guest!].
> 
> > Mapping anywhere, I
> > really don't like. Letting the guest define the mapping, I really don't
> > like.
> 
> Well it's OK to have a hole for it, but letting the guest choose where
> those mappings go in the hole is the norm for PCI (there are
> exceptions).
> 
> > We can of course switch the order of mappings
> > 
> > [0x000000000000000      ]
> > ... Memory region containing RAM
> > [ram_size         	]
> > ... Memory region for memory devices (virtio-pmem, virtio-mem ...)
> > [maxram_size - ram_size ]
> > ... Memory region for e.g. special PCI/CCW devices
> > [                    TBD]
> > 
> > We can size TBD in a way that we e.g. max out the current page table
> > size before having to switch to more levels.
> 
> Yes, that's fine to set some upper limit; you've just got to make sure
> that the hypervisor knows where it can put stuff and if the guest
> does PCI that it knows where it's allowed to put stuff and as long
> as the two don't overlap everyone is happy.
> 
> [We should probably take this level of detail off this list - it's
> parsecs away from the detail of virtio]

If you do take the in detail discussion off is list please keep me in the
loop.

Regards,
Halil


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

