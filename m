Return-Path: virtio-comment-return-1649-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DF9C2986028
	for <virtio-comment@lists.oasis-open.org>; Tue, 19 Jan 2021 17:45:23 +0000 (UTC)
Date: Tue, 19 Jan 2021 18:45:06 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210119184506.3bd7061d.cohuck@redhat.com>
In-Reply-To: <20210119034008.735f80ad.pasic@linux.ibm.com>
References: <20210118163804.437098-1-cohuck@redhat.com>
	<20210118164132.GC9899@work-vm>
	<20210119034008.735f80ad.pasic@linux.ibm.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC v2] clarify device reset
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Halil Pasic <pasic@linux.ibm.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, 19 Jan 2021 03:40:08 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Mon, 18 Jan 2021 16:41:32 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Cornelia Huck (cohuck@redhat.com) wrote:  
> > > Properly specify that the method for the driver to request a
> > > device reset is transport specific, and some action the device
> > > has to take.
> > > 
> > > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > > ---
> > > 
> > > RFC -> RFC v2:
> > >   - moved reset spec to basic facilities
> > > 
> > > ---
> > >  conformance.tex |  1 +
> > >  content.tex     | 13 +++++++++++++
> > >  2 files changed, 14 insertions(+)
> > > 
> > > diff --git a/conformance.tex b/conformance.tex
> > > index eb3324053080..3be499ae3c5e 100644
> > > --- a/conformance.tex
> > > +++ b/conformance.tex
> > > @@ -271,6 +271,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> > >  \begin{itemize}
> > >  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Status Field}
> > >  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
> > > +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Reset}
> > >  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Configuration Space}
> > >  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message Framing}
> > >  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
> > > diff --git a/content.tex b/content.tex
> > > index 620c0e28c9a7..782ddf3ed78d 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -193,6 +193,19 @@ \section{Notifications}\label{sec:Basic Facilities of a Virtio Device
> > >  terminology. Occasionally, the term event is used to refer to
> > >  a notification or a receipt of a notification.
> > >  
> > > +\section{Device Reset}\label{sec:Basic Facilities of a Virtio Device / Device Reset}
> > > +
> > > +The driver may initiate a device reset at various times; notably, during
> > > +device initialization and device cleanup.
> > > +
> > > +The mechanism used by the driver to initiate the reset is transport specific.
> > > +
> > > +\devicenormative{\subsection}{Device Reset}{Basic Facilities of a Virtio Device / Device Reset}
> > > +
> > > +A device MUST reinitialize device status to 0 after receiving a reset.
> > > +
> > > +A device MUST NOT send notifications after receiving a reset.
> > > +  
> 
> s/after receiving a reset/after presenting a 0 status, that indicates
> the reset is done/  

"A device MUST NOT send notifications after indicating completion of
the reset by reinitializing the device status to 0."

?

> > 
> > This feels like a bit of a race in the description;  a Device may have
> > just sent a notification at the point that it receives a reset.
> > When a driver initiates a reset, how does the driver know that the
> > device has received it?  
> 
> I agree, but with the proposed modification not any more. 
> 
> To answer your question: PCI has the following driver normative (which I
> believe needs to be generalized so we have something similar for each
> transport, and thus the same semantics):
> "After writing 0 to device_status, the driver MUST wait for a read of
> device_status to return 0 before reinitializing the device." 
> (4.1.4.3.2 Driver Requirements: Common configuration structure layout,
> https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-1090004)
> 
> In general, after asking for a reset, the driver should/must ensure that
> the reset was performed by the device by reading a 0 status. If the
> status is non-zero, the reset at the device may still be in progress.
> IMHO we need another driver normative for that.

"After the driver has initiated a reset of the device, it MUST NOT
consider the reset to be completed if the device status is not 0."

?

Maybe without the double negation.

(We could consider the reset for ccw devices done once we get final
status for the reset ccw. Would save the round trip for a read status
ccw, but would also be different from the other transports.)


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

