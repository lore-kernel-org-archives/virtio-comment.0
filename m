Return-Path: virtio-comment-return-632-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 33C34985B63
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Feb 2019 15:28:20 +0000 (UTC)
Date: Mon, 18 Feb 2019 16:28:09 +0100
From: Halil Pasic <pasic@linux.ibm.com>
In-Reply-To: <20190215111908.GC2630@work-vm>
References: <20190115111038.6769d292.cohuck@redhat.com>
	<20190115112303.GB2135@work-vm>
	<20190116115638.152d6797.cohuck@redhat.com>
	<20190116200625.GG2351@work-vm>
	<20190211225225.7c39154d.cohuck@redhat.com>
	<20190213183755.GF2601@work-vm>
	<20190214115807.2bab4efb.cohuck@redhat.com>
	<20190214163707.GE2617@work-vm>
	<CAEkmjvWgQg-xhOb0xLKqofi31Dzwaz1M8DQGDBgrYqO8iJ7Ubg@mail.gmail.com>
	<20190215120718.7c7e09cc.cohuck@redhat.com>
	<20190215111908.GC2630@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-Id: <20190218162809.67184ce1@oc2783563651>
Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared
 memory regions
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Frank Yang <lfy@google.com>, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 15 Feb 2019 11:19:09 +0000
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> * Cornelia Huck (cohuck@redhat.com) wrote:
> > On Thu, 14 Feb 2019 09:43:10 -0800
> > Frank Yang <lfy@google.com> wrote:
> > 
> > > On Thu, Feb 14, 2019 at 8:37 AM Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > wrote:
> > > 
> > > > * Cornelia Huck (cohuck@redhat.com) wrote:  

[..]

> > 
> > The background here is that s390 traditionally does not have any
> > concept of memory-mapped I/O. IOW, you don't just write to or read from
> > a special memory area; instead, I/O operations use special instructions.
> > 
> > The mechanism I'm trying to extend here is channel I/O: the driver
> > builds a channel program with commands that point to guest memory areas
> > and hands it to the channel subsystem (which means, in our case, the
> > host) via a special instruction. The channel subsystem and the device
> > (the host, in our case) translate the memory addresses and execute the
> > commands. The one place where we write shared memory directly in the
> > virtio case are the virtqueues -- which are allocated in guest memory,
> > so the guest decides which memory addresses are special. Accessing the
> > config space of a virtio device via the ccw transport does not
> > read/write a memory location directly, but instead uses a channel
> > program that performs the read/write.
> > 
> > For pci, the memory accesses are mapped to special instructions:
> > reading or writing the config space of a pci device does not perform
> > reads or writes of a memory location, either; the driver uses special
> > instructions to access the config space (which are also
> > interpreted/emulated by QEMU, for example.)
> > 
> > The old s390 (pre-virtio-ccw) virtio transport had to rely on the
> > knowledge that there were two pages containing the virtqueues etc.
> > right above the normal memory (probed by checking whether accessing
> > that memory gave an exception or not). The main problems were that this
> > was inflexible (the guest had no easy way to find out how many
> > 'special' pages were present, other than trying to access them), and
> > that it was different from whatever other mechanisms are common on s390.
> > 
> > We might be able to come up with another scheme, but I wouldn't hold my
> > breath. Would be great if someone else with s390 knowledge could chime
> > in here.
> 
> What I'm missing here is why the behaviour of the s390's traditional channel program
> matters to the design of an entirely emulated device.
> 

Let me try to explain. Right at the beginning of the virtio spec one can
read "These devices are found in virtual environments, yet by design
they look like physical devices to the guest within the virtual machine
- and this document treats them as such." (section 1 Introduction).

That means any virtio-pci device is supposed to be a perfectly legit pci
device, and same should in theory hold for any virtio-ccw (in practice
it is a bit complicated with ccw).

As far as I understand the idea behind the shm region is to do IO via
instructions that read/write normal RAM memory. s390 does not have stuff
like: if the address is in this range it is an IO address, and if in that
range it is a RAM address. Instead it is cast in stone, that a certain
argument of a certain operation (instruction) is a RAM address (usually),
or an IO address (for certain instructions like PCI LOAD).

Furthermore to my best knowledge on s390 the OS has control over what
parts of RAM can be written/read by the device. For ccw those bits of
RAM are designated by the channel program. zPCI does this via the
translation infrastructure AFAIU -- I'm not awfully familiar with zPCI.

@Connie: We have virtio-pci on s390x. How is a virtio-pci device
supposed to access an shm region?

Thus I do have some sympathy for the guest opt-in to a shared memory
region. BTW isn't your proposal for MMIO including something similar:

"""
+ \mmiodreg{SHMBaseLow}{SHMBaseHigh}{Shared memory region 64 bit long
physical address}{0x0c0}{0x0xc4}{W}{%
+ The driver writes these registers to indicate where it wishes
+ the device to map the shared memory region currently selected.
+ }
"""

Did I misunderstand something?

> As long as the s390 allows:
>   a) The host to map a region of HVA into GPA at an arbitrary GPA
> address
>   b) Not tell the guest that (a) is RAM
>   c) Find a non-RAM GPA for (a)
>   d) Allow the guest to set up a page table pointing to (c)
>   e) Discover (c) via the scheme you described
> 

As David wrote before, yes this could work. All we need is make sure the
respective virtio driver has exclusive access to the given memory region
in the guest. And virtio-ccw moving away from normal ccw is not
necessarily a bad thing, but we need to be careful about it.

> Then that's all that's needed - and I'm not seeing what is different on
> s390 about a-d from any other architecture.
> 

I've tried to clarify that. To sum it up on s390 the full 64 bit is
conceptually RAM. For access to IO regions (PCI) s390 uses specialized
instructions. Was my explanation helpful?

Another question: Is, and if how is a virtio shared memory region
different then let's say memory that used in a 'shared' fashion by two
CPUs?

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

