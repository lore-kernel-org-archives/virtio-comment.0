Return-Path: virtio-comment-return-609-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1E41C985B66
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Feb 2019 16:52:47 +0000 (UTC)
Date: Wed, 13 Feb 2019 16:52:30 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190213165230.GE2601@work-vm>
References: <20190111114200.10026-1-dgilbert@redhat.com>
 <20190111114200.10026-4-dgilbert@redhat.com>
 <20190213023352.GD14307@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190213023352.GD14307@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] Re: [PATCH 3/3] shared memory: Define mmio
 registers
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Fri, Jan 11, 2019 at 11:42:00AM +0000, Dr. David Alan Gilbert (git) wrote:
> > diff --git a/content.tex b/content.tex
> > index 776162a..e2435ff 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -1641,6 +1641,33 @@ All register values are organized as Little Endian.
> >      selected by writing to \field{QueueSel}.
> >    }
> >    \hline 
> > +  \mmioreg{SHMSel}{Shared memory region select}{0x0b0}{W}{%
> > +    Writing to this register selects the shared memory region \ref{sec:Basic Facilities of a Virtio Device / Shared Memory Regions}
> > +    following operations on \field{SHMId}, \field{SHMLenLow}, \field{SHMLenHigh},
> > +    \field{SHMBaseLow} and \field{SHMBaseHigh} apply to. The index
> > +    number of the first region is zero (0x0); note that it is a
> > +    simple index that does not correspond to the \field{id}.
> 
> Why use a separate virtio-mmio index instead of the shared memory ID?
> The driver would map those IDs it knows about, so I'm not sure if
> enumerating them via a separate index is useful.  Plus using the ID lets
> you drop one register from the interface.

Yes, I think if we don't need enumeration that's right; we just shange
SHMId to be the writeable register and drop the SHMSel register.

Dave


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

