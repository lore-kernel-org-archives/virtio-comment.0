Return-Path: <virtio-comment-return-2840-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7705B985F1D
	for <virtio-comment@lists.oasis-open.org>; Sun, 20 Mar 2022 21:52:24 +0000 (UTC)
Date: Sun, 20 Mar 2022 17:52:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20220320171750-mutt-send-email-mst@kernel.org>
References: <4735344.EBYxvr1mta@silver>
 <3695921.aWz9qjfz3Z@silver>
 <20220320112548-mutt-send-email-mst@kernel.org>
 <18109331.vxdRPDnfUN@silver>
MIME-Version: 1.0
In-Reply-To: <18109331.vxdRPDnfUN@silver>
Subject: Re: [virtio-comment] [PATCH v3 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Sun, Mar 20, 2022 at 06:43:53PM +0100, Christian Schoenebeck wrote:
> To be honest, I don't feel like discussing precise wordings at this point when 
> you are questioning the proposal on design level already.
> 
> Maybe you make some more thorough thoughts on what you actually want this to 
> be on design level before continueing to argue about precise terminology, 
> which you are not using either BTW when you articulating your criticism.
> 
> Or even better: come up with your own proposol with the precise wording you 
> feel appropriate.

OK let's go back and agree on what we are trying to achieve.  The github
issue and the cover letter imply that while indirect descriptors would
normally allow huge tables, we artificially limit them to queue size,
and you want to be able to relax that.

Fair enough.

However, I feel trying to talk about indirect descriptor is too narrow a
use-case, simply because the issue is not indirect at all.  Why do we
limit number of segments? I think it's really because of backend
limitations. And indirect is only used by the frontend.  So limiting
that is really going about it wrong.


So block for example has seg_max already. What should happen
if that exceeds queue size is not defined.


So maybe we can generalize that making it device independent?
The litmus paper for this is the block and scsi devices,
we should be able to use the new feature as a super-set.


Before we discuss solutions, did I formulate the problem correctly?

-- 
MST


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

