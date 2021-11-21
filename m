Return-Path: <virtio-comment-return-2366-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 49BE69841BB
	for <virtio-comment@lists.oasis-open.org>; Sun, 21 Nov 2021 08:08:36 +0000 (UTC)
Date: Sun, 21 Nov 2021 00:08:34 -0800
From: Taylor Stark <tstark@linux.microsoft.com>
Message-ID: <20211121080834.GA9507@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20211110185555.190-1-tstark@linux.microsoft.com>
 <20211110185555.190-2-tstark@linux.microsoft.com>
 <20211118183752.32100dc3.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211118183752.32100dc3.pasic@linux.ibm.com>
Subject: Re: [virtio-comment] [PATCH v5 1/1] virtio-pmem: Support describing
 pmem as shared memory region
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Halil Pasic <pasic@linux.ibm.com>
Cc: virtio-comment@lists.oasis-open.org, grahamwo@microsoft.com, benhill@microsoft.com, tstark@microsoft.com, pankaj.gupta.linux@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Nov 18, 2021 at 06:37:52PM +0100, Halil Pasic wrote:
> On Wed, 10 Nov 2021 10:55:55 -0800
> tstark@linux.microsoft.com wrote:
> [..]
> > @@ -36,22 +39,45 @@ \subsection{Device configuration layout}\label{sec:Device Types / PMEM Device /
> >  \end{lstlisting}
> >  
> >  \begin{description}
> > -\item[\field{start}] contains the physical address of the first byte of the persistent memory region.
> > +\item[\field{start}] contains the physical address of the first byte of the
> > +persistent memory region, if VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated.
> >  
> > -\item[\field{size}] contains the length of this address range.
> > +\item[\field{size}] contains the length of this address range, if
> > +VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated.
> >  \end{description}
> >  
> > +\subsection{Device Initialization}\label{sec:Device Types / PMEM Device / Device Initialization}
> > +
> > +The device indicates the guest physical address to the driver in one of two ways:
> >  \begin{enumerate}
> > -\item Driver vpmem start is read from \field{start}.
> > -\item Driver vpmem end is read from \field{size}.
> > +\item As a guest absolute address, using virtio_pmem_config.
> > +\item As a shared memory region.
> >  \end{enumerate}
> >  
> > -\subsection{Driver Initialization}\label{sec:Device Types / PMEM Driver / Driver Initialization}
> > -
> >  The driver determines the start address and size of the persistent memory region in preparation for reading or writing data.
> >  
> >  The driver initializes req_vq in preparation for making flush requests.
> >  
> > +\devicenormative{\subsubsection}{Device Initialization}{Device Types / PMEM Device / Device Initialization}
> > +
> > +If VIRTIO_PMEM_F_SHMEM_REGION has been negotiated, the device MUST indicate the
> > +guest physical address as a shared memory region. The device MUST use shared
> > +memory region ID 0. The device SHOULD set \field{start} and \field{size} to zero.
> > +
> > +
> > +If VIRTIO_PMEM_F_SHMEM_REGION has not been negotiated, the device MUST indicate
> > +the guest physical address as a guest absolute address. The device MUST set
> > +\field{start} to the absolute address and \field{size} to the size of the
> > +address range, in bytes.
> 
> Sorry for joining in this late. 
> 
> I'm wondering if the quoted parts implies that the device SHOULD change
> its config space (fields start and size) when the driver sets
> FEATURES_OK, and the feature is VIRTIO_PMEM_F_SHMEM_REGION set at the
> device (it was offered, and got set).
> 
> My train of thought is: initially no feature is considered negotiated,
> and config space access is allowed before feature negotiation is
> completed. That means the at this stage the device must indicate via
> the config space, and thus \field{size} != 0. But as a part of the
> transition 'features not negotiated' -> 'features negotiated' the device
> needs to go '\field{size} != 0' -> '\field{size} == 0'
> 
> Is that what we want?
> 
> Also I understand that Hyper-V would make the device cease operation if
> the feature VIRTIO_PMEM_F_SHMEM_REGION was not accepted by the driver.
> I believe I've read that in some previous email.
> 
> Do we need a  'MAY fail to operate further if' statement? Anything that
> ain't guarded by feature bits ain't optional, and anything that is
> guarded by feature bits is optional unless explicitly stated otherwise.
> 
> Regards,
> Halil

No problem, thanks for joining in! :) I think your train of thought makes sense.
You're right, for Hyper-V we can't support any driver that doesn't support
VIRTIO_PMEM_F_SHMEM_REGION. So we have no choice but to set the config fields
to zero from the start. There's no meaningful value we can place in those fields.

I'm trying to figure out how best to word this. Saying that devices should set
config fields prior to FEATURE_OK is redundant. Should I add a section saying that
config fields MAY be set to 0 if VIRTIO_PMEM_F_SHMEM_REGION is offerred (such as
in the Hyper-V case)? And that if it's set to 0 and the feature isn't negotiated,
the device must reject the driver? I'd also have to add in a section saying that
the pmem region shouldn't be touched by the driver prior to DRIVER_OK being set,
to save drivers from accessing the zeroed values placed in the config. Additionally,
encouraging devices to set the config fields to 0 once the feature has been
negotiated seems like the right thing to do, to catch bugs?

I'm not sure about the 'MAY fail to operate further statement'. Couldn't there
be lots of reasons why a device rejects a driver? And wouldn't those be
implementation details of each device? Is it common to document those?

Thoughts?

Thanks!
Taylor

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

