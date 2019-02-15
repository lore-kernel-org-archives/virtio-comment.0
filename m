Return-Path: virtio-comment-return-617-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 14EE59860B2
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 Feb 2019 11:26:07 +0000 (UTC)
References: <20190111114200.10026-2-dgilbert@redhat.com>
 <20190111131540.12a8abca.cohuck@redhat.com> <20190111122654.GE2738@work-vm>
 <20190115111038.6769d292.cohuck@redhat.com> <20190115112303.GB2135@work-vm>
 <20190116115638.152d6797.cohuck@redhat.com> <20190116200625.GG2351@work-vm>
 <20190211225225.7c39154d.cohuck@redhat.com> <20190213183755.GF2601@work-vm>
 <20190214115807.2bab4efb.cohuck@redhat.com> <20190214163707.GE2617@work-vm>
 <CAEkmjvWgQg-xhOb0xLKqofi31Dzwaz1M8DQGDBgrYqO8iJ7Ubg@mail.gmail.com>
 <20190215120718.7c7e09cc.cohuck@redhat.com>
From: David Hildenbrand <david@redhat.com>
Message-ID: <f4f00ab1-fb60-483a-ab53-5d0546dd9a8e@redhat.com>
Date: Fri, 15 Feb 2019 12:26:00 +0100
MIME-Version: 1.0
In-Reply-To: <20190215120718.7c7e09cc.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared memory
 regions
To: Cornelia Huck <cohuck@redhat.com>, Frank Yang <lfy@google.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 15.02.19 12:07, Cornelia Huck wrote:
> On Thu, 14 Feb 2019 09:43:10 -0800
> Frank Yang <lfy@google.com> wrote:
> 
>> On Thu, Feb 14, 2019 at 8:37 AM Dr. David Alan Gilbert <dgilbert@redhat.com>
>> wrote:
>>
>>> * Cornelia Huck (cohuck@redhat.com) wrote:  
>>>> On Wed, 13 Feb 2019 18:37:56 +0000
>>>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>>>>  
>>>>> * Cornelia Huck (cohuck@redhat.com) wrote:  
>>>>>> On Wed, 16 Jan 2019 20:06:25 +0000
>>>>>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>>>>>>  
>>>>>>> So these are all moving this 1/3 forward - has anyone got comments  
>>> on  
>>>>>>> the transport specific implementations?  
>>>>>>
>>>>>> No comment on pci or mmio, but I've hacked something together for  
>>> ccw.  
>>>>>> Basically, one sense-type ccw for discovery and a control-type ccw  
>>> for  
>>>>>> activation of the regions (no idea if we really need the latter),  
>>> both  
>>>>>> available with ccw revision 3.
>>>>>>
>>>>>> No idea whether this will work this way, though...  
>>>>>
>>>>> That sounds (from a shm perspective) reasonable; can I ask why the
>>>>> 'activate' is needed?  
>>>>
>>>> The activate interface is actually what I'm most unsure about; maybe
>>>> Halil can chime in.
>>>>
>>>> My basic concern is that we don't have any idea how the guest will use
>>>> the available memory. If the shared memory areas are supposed to be
>>>> mapped into an inconvenient place, the activate interface gives the
>>>> guest a chance to clear up that area before the host starts writing to
>>>> it.  
>>>
>>> I'm expecting the host to map it into an area of GPA that is out of the
>>> way - it doesn't overlap with RAM.
> 
> My issue here is that I'm not sure how to model something like that on
> s390...
> 
>>> Given that, I'm not sure why the guest would have to do any 'clear up' -
>>> it probably wants to make a virtual mapping somewhere, but again that's
>>> upto the guest to do when it feels like it.
>>>
>>>  
>> This is what we do with Vulkan as well.
>>
>>
>>>> I'm not really enthusiastic about that interface... for one, I'm not
>>>> sure how this plays out at the device type level, which should not
>>>> really concern itself with transport-specific handling.  
>>>
>>> I'd expect the host side code to give an area of memory to the transport
>>> and tell it to map it somewhere (in the QEMU terminology a MemoryRegion
>>> I think).
> 
> My main issue is the 'somewhere'.
> 
>>>  
>>
>> I wonder if this could help: the way we're running Vulkan at the moment,
>> what we do is add a the concept of a MemoryRegion with no actual backing:
>>
>> https://android-review.googlesource.com/q/topic:%22qemu-user-controlled-hv-mappings%22+(status:open%20OR%20status:merged)
>>
>> and it would be connected to the entire PCI address space on the shared
>> memory address space realization. So it's kind of like a sparse or deferred
>> MemoryRegion.
>>
>> When the guest actually wants to map a subregion associated with the host
>> memory,
>> on the host side, we can call the hypervisor to map the region, based on
>> giving the device implementation the functions KVM_SET_USER_MEMORY_REGION
>> and analogs.
>>
>> This has the advantage of a smaller contact area between shm and qemu,
>> where the device level stuff can operate at a separate layer from
>> MemoryRegions which is more transport level.
> 
> That sounds like an interesting concept, but I'm not quite sure how it
> would help with my problem. Read on for more explanation below...
> 
>>
>>
>>> Similarly in the guest, I'm expecting the driver for the device to
>>> ask for a pointer to a region with a particular ID and that goes
>>> down to the transport code.
>>>
>>> Another option would be to map these into a special memory area that  
>>>> the guest won't use for its normal operation... the original s390
>>>> (non-ccw) virtio transport mapped everything into two special pages
>>>> above the guest memory, but that was quite painful, and I don't think
>>>> we want to go down that road again.  
>>>
>>> Can you explain why?
> 
> The background here is that s390 traditionally does not have any
> concept of memory-mapped I/O. IOW, you don't just write to or read from
> a special memory area; instead, I/O operations use special instructions.
> 
> The mechanism I'm trying to extend here is channel I/O: the driver
> builds a channel program with commands that point to guest memory areas
> and hands it to the channel subsystem (which means, in our case, the
> host) via a special instruction. The channel subsystem and the device
> (the host, in our case) translate the memory addresses and execute the
> commands. The one place where we write shared memory directly in the
> virtio case are the virtqueues -- which are allocated in guest memory,
> so the guest decides which memory addresses are special. Accessing the
> config space of a virtio device via the ccw transport does not
> read/write a memory location directly, but instead uses a channel
> program that performs the read/write.
> 
> For pci, the memory accesses are mapped to special instructions:
> reading or writing the config space of a pci device does not perform
> reads or writes of a memory location, either; the driver uses special
> instructions to access the config space (which are also
> interpreted/emulated by QEMU, for example.)
> 
> The old s390 (pre-virtio-ccw) virtio transport had to rely on the
> knowledge that there were two pages containing the virtqueues etc.
> right above the normal memory (probed by checking whether accessing
> that memory gave an exception or not). The main problems were that this
> was inflexible (the guest had no easy way to find out how many
> 'special' pages were present, other than trying to access them), and
> that it was different from whatever other mechanisms are common on s390.

Probing is always ugly. But I think we can add something like
 the x86 PCI hole between 3 and 4 GB after our initial boot memory.
So there, we would have a memory region just like e.g. x86 has.

This should even work with other mechanism I am working on. E.g.
for memory devices, we will add yet another memory region above
the special PCI region.

The layout of the guest would then be something like

[0x000000000000000]
... Memory region containing RAM
[ram_size         ]
... Memory region for e.g. special PCI devices
[ram_size +1 GB   ]
... Memory region for memory devices (virtio-pmem, virtio-mem ...)
[maxram_size - ram_size + 1GB]

We would have to create proper page tables for guest backing that take
care of the new guest size (not just ram_size). Also, to the guest we
would indicate "maximum ram size == ram_size" so it does not try to
probe the "special" memory.

As we are using paravirtualized features here, this should be fine for.
Unmodified guests will never touch/probe anything beyond ram_size.

> 
> We might be able to come up with another scheme, but I wouldn't hold my
> breath. Would be great if someone else with s390 knowledge could chime
> in here.

-- 

Thanks,

David / dhildenb

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

