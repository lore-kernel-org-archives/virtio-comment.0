Return-Path: <pasic@linux.ibm.com>
Date: Mon, 22 Nov 2021 20:56:18 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [virtio-comment] [PATCH v5 1/1] virtio-pmem: Support describing
 pmem as shared memory region
Message-ID: <20211122205618.4aadff06.pasic@linux.ibm.com>
In-Reply-To: <878rxgl7w6.fsf@redhat.com>
References: <20211110185555.190-1-tstark@linux.microsoft.com>
	<20211110185555.190-2-tstark@linux.microsoft.com>
	<20211118183752.32100dc3.pasic@linux.ibm.com>
	<20211121080834.GA9507@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
	<878rxgl7w6.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
To: Cornelia Huck <cohuck@redhat.com>
Cc: Taylor Stark <tstark@linux.microsoft.com>, virtio-comment@lists.oasis-open.org, grahamwo@microsoft.com, benhill@microsoft.com, tstark@microsoft.com, pankaj.gupta.linux@gmail.com, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, 22 Nov 2021 12:58:01 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Sun, Nov 21 2021, Taylor Stark <tstark@linux.microsoft.com> wrote:
> 
> > On Thu, Nov 18, 2021 at 06:37:52PM +0100, Halil Pasic wrote:  
> >> On Wed, 10 Nov 2021 10:55:55 -0800
> >> tstark@linux.microsoft.com wrote:
> >> [..]  
> >> > @@ -36,22 +39,45 @@ \subsection{Device configuration layout}\label{sec:Device Types / PMEM Device /
> >> >  \end{lstlisting}
> >> >  
> >> >  \begin{description}
> >> > -\item[\field{start}] contains the physical address of the first byte of the persistent memory region.
> >> > +\item[\field{start}] contains the physical address of the first byte of the
> >> > +persistent memory region, if VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated.
> >> >  
> >> > -\item[\field{size}] contains the length of this address range.
> >> > +\item[\field{size}] contains the length of this address range, if
> >> > +VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated.
> >> >  \end{description}
> >> >  
> >> > +\subsection{Device Initialization}\label{sec:Device Types / PMEM Device / Device Initialization}
> >> > +
> >> > +The device indicates the guest physical address to the driver in one of two ways:
> >> >  \begin{enumerate}
> >> > -\item Driver vpmem start is read from \field{start}.
> >> > -\item Driver vpmem end is read from \field{size}.
> >> > +\item As a guest absolute address, using virtio_pmem_config.
> >> > +\item As a shared memory region.
> >> >  \end{enumerate}
> >> >  
> >> > -\subsection{Driver Initialization}\label{sec:Device Types / PMEM Driver / Driver Initialization}
> >> > -
> >> >  The driver determines the start address and size of the persistent memory region in preparation for reading or writing data.
> >> >  
> >> >  The driver initializes req_vq in preparation for making flush requests.
> >> >  
> >> > +\devicenormative{\subsubsection}{Device Initialization}{Device Types / PMEM Device / Device Initialization}
> >> > +
> >> > +If VIRTIO_PMEM_F_SHMEM_REGION has been negotiated, the device MUST indicate the
> >> > +guest physical address as a shared memory region. The device MUST use shared
> >> > +memory region ID 0. The device SHOULD set \field{start} and \field{size} to zero.
> >> > +
> >> > +
> >> > +If VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated, the device MUST indicate  
> 
> [for the sake of the argument made below, note the 'has not been
> negotiated' here]
> 
> >> > +the guest physical address as a guest absolute address. The device MUST set
> >> > +\field{start} to the absolute address and \field{size} to the size of the
> >> > +address range, in bytes.  
> >> 
> >> Sorry for joining in this late. 
> >> 
> >> I'm wondering if the quoted parts implies that the device SHOULD change
> >> its config space (fields start and size) when the driver sets
> >> FEATURES_OK, and the feature is VIRTIO_PMEM_F_SHMEM_REGION set at the
> >> device (it was offered, and got set).
> >> 
> >> My train of thought is: initially no feature is considered negotiated,
> >> and config space access is allowed before feature negotiation is
> >> completed. That means the at this stage the device must indicate via
> >> the config space, and thus \field{size} != 0. But as a part of the
> >> transition 'features not negotiated' -> 'features negotiated' the device
> >> needs to go '\field{size} != 0' -> '\field{size} == 0'  
> 
> It has been advised that it SHOULD put 0 there, but I don't consider
> that a must, just a good idea.

Right I agree with that. So we say that the config state update is a
good idea as well?

BTW the definition of SHOULD:
   SHOULD   This word, or the adjective "RECOMMENDED", mean that there
   may exist valid reasons in particular circumstances to ignore a
   particular item, but the full implications must be understood and
   carefully weighed before choosing a different course.

Maybe I should have used 'should go' instead of 'needs to go' but that
doesn't change the fact, that the spec currently regards this
config space update as RECOMMENDED.

Conny, is that what we want?


> 
> >> 
> >> Is that what we want?
> >> 
> >> Also I understand that Hyper-V would make the device cease operation if
> >> the feature VIRTIO_PMEM_F_SHMEM_REGION was not accepted by the driver.
> >> I believe I've read that in some previous email.
> >> 
> >> Do we need a  'MAY fail to operate further if' statement? Anything that
> >> ain't guarded by feature bits ain't optional, and anything that is
> >> guarded by feature bits is optional unless explicitly stated otherwise.  
> 
> The device can always fail the setting of FEATURES_OK, see 2.2.2:
> 
> "The device SHOULD accept any valid subset of features the driver
> accepts, otherwise it MUST fail to set the FEATURES_OK device status bit
> when the driver writes it."
> 
> I'd argue that "SHMEM_REGION not set" can be considered a non-valid
> subset by the device. (Also, there's a SHOULD in there.)

Yes, but that is not very helpful for somebody reading the spec without
having the context of this discussion.

To put it differently, why do we use the "MAY fail to operate further
if" statement for:
* VIRTIO_F_ACCESS_PLATFORM not accepted
* VIRTIO_F_ORDER_PLATFORM not accepted
* VIRTIO_F_VERSION_1 not offered

If "SHMEM_REGION not accepted" is covered by 2.2.2 and thus superfluous,
then so is "ACCESS_PLATFORM not accepted".

IMHO in the sentence quoted by you "valid subset" should be interpreted
as a subset that is closed to the "depends on" relationship between
feature sets. I.e. a subset is invalid, if it contains at least one
feature such that some feature required by it is not in the subset.

If we say that any device implementation can proclaim any subset of
features invalid, than the the first part of the sentence does
not have any meaning to it.

You are definitively right about the SHOULD, it is not a MUST.

I believe the whole idea behind features is to facilitate extensibility
and compatibility.

Usually a driver can safely ignore features it does not know or care
about,and the device SHOULD still work according to the expectations of
the driver.

But some feature bits are not like that. For example it ain't safe for
the driver to ignore ACCESS_PLATFORM, for obvious reasons. And we
express that with the "MAY fail to operate further if" statement.


> 
> >> 
> >> Regards,
> >> Halil  
> >
> > No problem, thanks for joining in! :) I think your train of thought makes sense.
> > You're right, for Hyper-V we can't support any driver that doesn't support
> > VIRTIO_PMEM_F_SHMEM_REGION. So we have no choice but to set the config fields
> > to zero from the start. There's no meaningful value we can place in those fields.  
> 
> I think this is fine: we only require the fields to have meaningful
> contents if SHMEM_REGION has not been negotiated -- as long as the
> device has not accepted FEATURES_OK from the driver, nothing has been
> negotiated respectively not been negotiated.

I have issues accepting the tristate nature of 'has been negotiated'. I
don't think that is intuitive. If this really what we want we should be
very clear about it.

In my opinion feature negotiation is usually an opt-in. Before the opt-in
the device is to give us the "compatible" or "old" behavior.

> 
> >
> > I'm trying to figure out how best to word this. Saying that devices should set
> > config fields prior to FEATURE_OK is redundant. Should I add a section saying that
> > config fields MAY be set to 0 if VIRTIO_PMEM_F_SHMEM_REGION is offerred (such as
> > in the Hyper-V case)? And that if it's set to 0 and the feature isn't negotiated,
> > the device must reject the driver? I'd also have to add in a section saying that
> > the pmem region shouldn't be touched by the driver prior to DRIVER_OK being set,
> > to save drivers from accessing the zeroed values placed in the config. Additionally,
> > encouraging devices to set the config fields to 0 once the feature has been
> > negotiated seems like the right thing to do, to catch bugs?  
> 
> I don't think we can prohibit the driver from reading the config space,
> that is explicitly allowed in the general case.

I agree. I believe the specification should tell us which features are
essential by design, and which features are optional by design. We
clearly have both kinds of features, right?

> 
> We probably can add a non-normative extra statement, though, that a
> device may present zeroes in the config space before feature negotiation
> has finished if it doesn't support !SHMEM_REGION. 

I would not tie that to 'before feature negotiation' or 'does not support
SHMEM'. We can say something like:

If the value of the field \filed{size} is 0, then the \field{start} does
not contain the physical address of the persistent memory region, and
the persistent memory region is advertised by means different than 
via the config space.

> That would also give
> the driver a way to discover that it doesn't make sense to continue
> without negotiating SHMEM_REGION. No extra normative statement, but
> should make it a bit more clear to those trying to implement this.
> 
> >
> > I'm not sure about the 'MAY fail to operate further statement'. Couldn't there
> > be lots of reasons why a device rejects a driver? And wouldn't those be
> > implementation details of each device? Is it common to document those?  
> 
> We probably don't need such a statement (see above).

I disagree.

> 
> As voting for this is open until tomorrow, we should quickly decide what
> to do. My preference would be to merge it as-is and do a clarification
> on top.
> 

I'm fine with merging as is.

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

