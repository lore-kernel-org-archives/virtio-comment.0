Return-Path: virtio-comment-return-1487-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8C75698615C
	for <virtio-comment@lists.oasis-open.org>; Fri, 30 Oct 2020 10:23:58 +0000 (UTC)
Date: Fri, 30 Oct 2020 10:23:39 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20201030102339.GB3046@work-vm>
References: <20201030061222-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201030061222-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] allocating device IDs without a vote
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

* Michael S. Tsirkin (mst@redhat.com) wrote:
> At the Virtio BoF at the virtual KVM forum, 2020, a recurring theme was
> the difficulty contributors face in obtaining device IDs for new
> devices. As allocating a new ID is a technicality, and can not break
> existing devices, it does not sound too bad to skip a voting step in
> that process.

It would seem reasonable to define what the expectations, if any are,
about the use of those IDs:

Is it expected that the allocator of such an ID would eventually
end a request to merge a spec for the device, or are they free
not to?

If merging is expected, then is it acceptable to recycle IDs that have
not been defined after n-Years.

Dave


> I'd like to hear TC's take on such an idea.
> 
> This would be similar to the existing standing rule:
> 
> 	Minor cleanups, including editorial formatting changes, spelling
> 	and typo fixes can be committed directly into git for approval as part
> 	of the next specification approval ballot.
> 
> -- 
> MST
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

