Return-Path: <virtio-comment-return-3347-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 01DC7986332
	for <virtio-comment@lists.oasis-open.org>; Tue,  9 Aug 2022 09:44:12 +0000 (UTC)
Date: Tue, 9 Aug 2022 05:44:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20220809054219-mutt-send-email-mst@kernel.org>
References: <20220803084441.1206034-1-keirf@google.com>
 <20220803071725-mutt-send-email-mst@kernel.org>
 <Yuvfg31hvFix6U5u@google.com>
MIME-Version: 1.0
In-Reply-To: <Yuvfg31hvFix6U5u@google.com>
Subject: Re: [virtio-comment] Re: [PATCH] virtio-balloon: add an untrusted
 device feature
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Keir Fraser <keirf@google.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Aug 04, 2022 at 03:02:27PM +0000, Keir Fraser wrote:
> On Wed, Aug 03, 2022 at 07:31:06AM -0400, Michael S. Tsirkin wrote:
> > On Wed, Aug 03, 2022 at 08:44:41AM +0000, Keir Fraser wrote:
> > > This flag indicates to the
> > > driver that memory ownership must be relinquished via the TCB, by
> > > platform-specific means, before reporting that memory to the device.
> > 
> > Thanks for the proposal! I feel it needs to be more detailed to be
> > useful. In particular we need a bit more info about TCB and memory
> > ownership here I feel, so people can interpret this. Is there a spec
> > link?
> 
> The specific motivation for this is PKVM on ARM, where protected VM
> memory is inaccessible to the host kernel. Ownership is tracked by a
> small hypervisor, and that hypervisor needs to be aware that the pVM
> is willingly returning memory to the host. There's some old
> description of ARM PKVM here https://lwn.net/Articles/836693/
> 
> So the purpose of the new flag is:
> 
> 1. To inform the pVM that it must notify the hypervisor (although
> there could be out-of-band mechanisms to detect/probe this)
> 
> 2. If the flag is not accepted by the driver, device can abort balloon
> setup (since pVM ballooning cannot work without hypervisor
> notifications).
> 
> > > +\item[ VIRTIO_BALLOON_F_UNTRUSTED_DEVICE(6) ] The driver must
> > > +    relinquish memory ownership via the Trusted Computing Base (TCB) before
> > > +    notifying the device.
> > 
> > The name does not seem to match what it does.
> 
> Maybe something more direct, like VIRTIO_BALLOON_F_NOTIFY_HYP?
> 
> > > +If guest memory is protected from the host,
> > 
> > This does not make it clear how this is different from VIRTIO_F_ACCESS_PLATFORM
> > which says:
> > 
> > \item[VIRTIO_F_ACCESS_PLATFORM(33)] This feature indicates that
> >   the device can be used on a platform where device access to data
> >   in memory is limited and/or translated.
> 
> Using this existing flag could possibly work, assuming there are no
> conflicting legacy semantics for this flag in relation to balloon
> driver.  At the moment the Linux virtio-balloon driver unconditionally
> clears this feature flag, so perhaps there are no legacy semantics at
> all.
> 
> We could instead accept this existing flag and use it to turn on the
> hypervisor notifications as well as using DMA API for vring setup (we
> do need both anyway)? If the flag is cleared, as with the existing
> kernel driver, the device knows for sure that the driver is not ARM
> PKVM aware.
> 
> "Turn on hypervisor notifications" here is platform specific: In ARM
> PKVM it means probe for existence of the new notification hypercall
> and send notifications if the hypercall exists.
> 
> I'd be more than happy to use this flag rather than introduce
> another. Multiplying these sorts of flags more than absolutely
> necessary is for sure not a good idea.

Now, a question: are these hypervisor notifications
in particular exactly what the DMA API does?

Is it true that Linux will issue these notifications simply by mapping
memory for DMA? Or is there some other trickery involved?




> > > @@ -5647,6 +5664,10 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Balloon Device / D
> > >      pages. These addresses are divided by 4096\footnote{This is historical, and independent of the guest page size.
> > >  } and the descriptor
> > >      describing the resulting 32-bit array is added to the inflateq.
> > > +  \item If the VIRTIO_BALLOON_F_UNTRUSTED_DEVICE feature has been
> > > +  negotiated, the driver MUST relinquish memory ownership via the TCB
> > > +  before adding it to the inflateq.
> > > +
> > >    \end{enumerate}
> > >  
> > >  \item To remove memory from the balloon (aka. deflate):
> > 
> > Don't we need to take it back before deflate?
> 
> No, giving memory to a protected VM does not need the VM's explicit permission.
> 
> If such permission were required then we would have a problem implementing free page reporting (and maybe hinting too).
> 
> > > @@ -6105,6 +6126,9 @@ \subsubsection{Free Page Reporting}\label{sec:Device Types / Memory Balloon Devi
> > >  driver MUST initialize all free pages with \field{poison_val} before
> > >  reporting them.
> > >  
> > > +If the VIRTIO_BALLOON_F_UNTRUSTED_DEVICE feature has been negotiated, the
> > > +driver MUST notify free pages to the TCB before reporting them.
> > > +
> > >  The driver MUST NOT use the reported pages until the device has
> > >  acknowledged the reporting request.
> > 
> > Should this affect hinting too?
> 
> Yes you are probbaly right. Though given the main usage of hinting is
> for live migration, it's unlikely to be enabled for ARM PKVM any time
> soon. I don't know how we'd live migrate a VM with confidential memory.
> 
> > Is "notify" same as "relinquish ownership"?
> 
> Yes, sorry, I should tighten up the wording.
> 
> > Are these terms defined in some spec?
> 
> A spec for relinquishing memory ownership in ARM PKVM? I could
> certainly put something together if it's helpful. Also, concretely,
> there are patches to the Linux kernel.
> 
> I assumed it would make sense to address the virtio spec before
> floating implementation patches, but perhaps it makes sense to
> consider it all in the round?
> 
> Also, if we can agree that VIRTIO_F_ACCESS_PLATFORM can be pressed
> into service for our needs, perhaps the spec changes become a bit more
> straightforward. Though I assume you would still want many of the
> above additions, to make it clear how a protected VM should interact
> with ballooning?
> 
> > >  
> > > -- 
> > > 2.37.1.455.g008518b4e5-goog
> > 
> > 
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> > 
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> > 
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> > 


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

