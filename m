Return-Path: virtio-comment-return-613-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A992B98608E
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Feb 2019 16:37:17 +0000 (UTC)
Date: Thu, 14 Feb 2019 16:37:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190214163707.GE2617@work-vm>
References: <20190111114200.10026-2-dgilbert@redhat.com>
 <20190111131540.12a8abca.cohuck@redhat.com>
 <20190111122654.GE2738@work-vm>
 <20190115111038.6769d292.cohuck@redhat.com>
 <20190115112303.GB2135@work-vm>
 <20190116115638.152d6797.cohuck@redhat.com>
 <20190116200625.GG2351@work-vm>
 <20190211225225.7c39154d.cohuck@redhat.com>
 <20190213183755.GF2601@work-vm>
 <20190214115807.2bab4efb.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190214115807.2bab4efb.cohuck@redhat.com>
Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared memory
 regions
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, stefanha@redhat.com, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

* Cornelia Huck (cohuck@redhat.com) wrote:
> On Wed, 13 Feb 2019 18:37:56 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Cornelia Huck (cohuck@redhat.com) wrote:
> > > On Wed, 16 Jan 2019 20:06:25 +0000
> > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > >   
> > > > So these are all moving this 1/3 forward - has anyone got comments on
> > > > the transport specific implementations?  
> > > 
> > > No comment on pci or mmio, but I've hacked something together for ccw.
> > > Basically, one sense-type ccw for discovery and a control-type ccw for
> > > activation of the regions (no idea if we really need the latter), both
> > > available with ccw revision 3.
> > > 
> > > No idea whether this will work this way, though...  
> > 
> > That sounds (from a shm perspective) reasonable; can I ask why the
> > 'activate' is needed?
> 
> The activate interface is actually what I'm most unsure about; maybe
> Halil can chime in.
> 
> My basic concern is that we don't have any idea how the guest will use
> the available memory. If the shared memory areas are supposed to be
> mapped into an inconvenient place, the activate interface gives the
> guest a chance to clear up that area before the host starts writing to
> it.

I'm expecting the host to map it into an area of GPA that is out of the
way - it doesn't overlap with RAM.
Given that, I'm not sure why the guest would have to do any 'clear up' -
it probably wants to make a virtual mapping somewhere, but again that's
upto the guest to do when it feels like it.

> I'm not really enthusiastic about that interface... for one, I'm not
> sure how this plays out at the device type level, which should not
> really concern itself with transport-specific handling.

I'd expect the host side code to give an area of memory to the transport
and tell it to map it somewhere (in the QEMU terminology a MemoryRegion
I think).
Similarly in the guest, I'm expecting the driver for the device to
ask for a pointer to a region with a particular ID and that goes
down to the transport code.

> Another option would be to map these into a special memory area that
> the guest won't use for its normal operation... the original s390
> (non-ccw) virtio transport mapped everything into two special pages
> above the guest memory, but that was quite painful, and I don't think
> we want to go down that road again.

Can you explain why?

Dave

> > 
> > Dave
> > 
> > > diff --git a/content.tex b/content.tex
> > > index 836ee5236939..7f379bca932e 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -2078,6 +2078,8 @@ virtio:
> > >  #define CCW_CMD_READ_VQ_CONF 0x32
> > >  #define CCW_CMD_SET_VIRTIO_REV 0x83
> > >  #define CCW_CMD_READ_STATUS 0x72
> > > +#define CCW_CMD_GET_REGIONS 0x14
> > > +#define CCW_CMD_MAP_REGIONS 0x93
> > >  \end{lstlisting}
> > >  
> > >  \subsubsection{Notifications}\label{sec:Virtio Transport Options / Virtio
> > > @@ -2170,7 +2172,9 @@ The following values are supported:
> > >  \hline
> > >  2        & 0      & <empty>   & CCW_CMD_READ_STATUS support \\
> > >  \hline
> > > -3-n      &        &           & reserved for later revisions \\
> > > +3        & 0      & <empty>   & CCW_CMD_GET_REGIONS and CCW_CMD_MAP_REGIONS support \\
> > > +\hline
> > > +4-n      &        &           & reserved for later revisions \\
> > >  \hline
> > >  \end{tabular}
> > >  
> > > @@ -2449,6 +2453,72 @@ command. Some legacy devices will support two-stage queue indicators, though,
> > >  and a driver will be able to successfully use CCW_CMD_SET_IND_ADAPTER to set
> > >  them up.
> > >  
> > > +\subsubsection{Handling Shared Memory Regions}\label{sec:Virtio Transport Options / Virtio over channel I/O / Device Initialization / Handling Shared Memory Regions}
> > > +
> > > +The CCW_CMD_GET_REGIONS command allows the driver to discover shared memory
> > > +regions provided by the device, if any.
> > > +
> > > +The driver provides a pointer to a 4096 byte buffer that is filled out by
> > > +the device:
> > > +
> > > +\begin{lstlisting}
> > > +  struct shared_regions_info {
> > > +    be64 num_regions;
> > > +    struct shared_region_desc regions[];
> > > +  };
> > > +\end{lstlisting}
> > > +
> > > +The buffer contains 0 or more shared region descriptors, as specified
> > > +by \field{num_regions}. If the devices does not provide shared regions,
> > > +\field{num_regions} is 0. Otherwise, the shared region descriptors have
> > > +the following format:
> > > +
> > > +\begin{lstlisting}
> > > +struct shared_region_desc {
> > > +        be64 addr;
> > > +        be64 len;
> > > +        u8 id;
> > > +        u8 pad[3];
> > > +}
> > > +\end{lstlisting}
> > > +
> > > +\field{addr} is the guest-physical address of the region with a length of
> > > +\field{len}, identified by \field{id}. The contents of \field{pad} are
> > > +unpredictable, although it is recommended that the device fills in zeroes.
> > > +
> > > +To activate or deactivate a shared memory region, the device uses the
> > > +CCW_CMD_MAP_REGIONS command. It takes the following payload:
> > > +
> > > +\begin{lstlisting}
> > > +struct shared_region_ctrl {
> > > +        u8 id;
> > > +        u8 activate;
> > > +        u8 pad[2];
> > > +}
> > > +\end{lstlisting}
> > > +
> > > +\field{id} denotes the shared memory region that is the target of the command,
> > > +while \field{activate} specifies whether the region should be activated (if 1)
> > > +or deactivated (if 0). When activated, the device makes the guest-physical
> > > +address of the region available as a shared memory region.
> > > +
> > > +\devicenormative{\paragraph}{Handling Shared Memory Regions}{Virtio Transport Options / Virtio over channel I/O / Device Initialization / Handling Shared Memory Regions}
> > > +
> > > +The device MUST reject the CCW_CMD_GET_REGIONS and CCW_CMD_MAP_REGIONS
> > > +commands if not at least revision 3 has been negotiated.
> > > +
> > > +The device MUST NOT read from or write to the region before it has been
> > > +activated by the driver or after it has been deactivated by the driver.
> > > +
> > > +If the driver reads from or writes to an address specified to a region that is
> > > +not activated by the driver, it MUST treat this read or write as a normal
> > > +read or write operation.
> > > +
> > > +\drivernormative{\paragraph}{Handling Shared Memory Regions}{Virtio Transport Options / Virtio over channel I/O / Device Initialization / Handling Shared Memory Regions}
> > > +
> > > +The driver MUST NOT treat the guest-physical address of a region as a shared
> > > +memory region before it has activated it or after it has deactivated it.
> > > +
> > >  \subsection{Device Operation}\label{sec:Virtio Transport Options / Virtio over channel I/O / Device Operation}
> > >  
> > >  \subsubsection{Host->Guest Notification}\label{sec:Virtio Transport Options / Virtio over channel I/O / Device Operation / Host->Guest Notification}  
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
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

