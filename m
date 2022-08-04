Return-Path: <virtio-comment-return-3316-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 437AC98658E
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 Aug 2022 15:15:27 +0000 (UTC)
Date: Thu, 4 Aug 2022 15:15:20 +0000
From: Keir Fraser <keirf@google.com>
Message-ID: <YuviiNRT7Y3wMbKa@google.com>
References: <20220803084441.1206034-1-keirf@google.com>
 <20220803071725-mutt-send-email-mst@kernel.org>
 <87k07p8rmn.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87k07p8rmn.fsf@redhat.com>
Subject: Re: [virtio-comment] Re: [PATCH] virtio-balloon: add an untrusted
 device feature
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Aug 03, 2022 at 01:59:28PM +0200, Cornelia Huck wrote:
> On Wed, Aug 03 2022, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Wed, Aug 03, 2022 at 08:44:41AM +0000, Keir Fraser wrote:
> 
> [hmm... I don't see the original mail on virtio-comment]

Sorry about that. My email bounced even after I subscribed to the
list. MST replied to my Cc. My list membership seems to have settled
now.

> >> the device must offer the
> >
> > MUST
> >
> >> +VIRTIO_BALLOON_F_UNTRUSTED_DEVICE feature bit. If the driver does
> >> +not accept this feature bit, the device MUST signal failure by failing
> >> +to set FEATURES_OK \field{device status} bit when the driver writes
> >> +it.
> 
> So, the bit is mandatory if offered?

In ARM PKVM the host is untrusted, and so the device cannot regain
ownership of memory pages. That has to be done via the TCB
(Hypervisor). If the driver isn't aware of that, it is impossible for
memory to be transferred back to the host, and ballooning cannot work.

> >> +
> >>  \subparagraph{Legacy Interface: Feature bits}\label{sec:Device
> >>  Types / Memory Balloon Device / Feature bits / Legacy Interface:
> >>  Feature bits}
> >> @@ -5573,6 +5587,9 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
> >>  allow guest to use memory before notifying host if
> >>  VIRTIO_BALLOON_F_MUST_TELL_HOST is not negotiated.
> >>  
> >> +The legacy interface cannot support VIRTIO_BALLOON_F_UNTRUSTED_DEVICE
> >> +since there is no way to gracefully report feature negotiation failure.
> 
> UNTRUSTED_DEVICE requires VERSION_1, then?

I think so. I don't see any benefit to supporting it on legacy
interfaces.

> >> +
> >>  \subsection{Device configuration layout}\label{sec:Device Types / Memory Balloon Device / Device configuration layout}
> >>    \field{num_pages} and \field{actual} are always available.
> >>  
> >> @@ -5647,6 +5664,10 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Balloon Device / D
> >>      pages. These addresses are divided by 4096\footnote{This is historical, and independent of the guest page size.
> >>  } and the descriptor
> >>      describing the resulting 32-bit array is added to the inflateq.
> >> +  \item If the VIRTIO_BALLOON_F_UNTRUSTED_DEVICE feature has been
> >> +  negotiated, the driver MUST relinquish memory ownership via the TCB
> >> +  before adding it to the inflateq.
> 
> Do we need a definition of "relinquish memory ownership"?

Maybe. Though I would say that the mechanism is platform specific and
out of scope for virtio. But perhaps a short description of what this
term means, in more detail, would make sense? And then tighten up
usage of this term throughout the spec.

 Regards,
 Keir
 

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

