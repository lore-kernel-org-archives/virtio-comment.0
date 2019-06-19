Return-Path: virtio-comment-return-749-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2AD6F985D74
	for <virtio-comment@lists.oasis-open.org>; Wed, 19 Jun 2019 01:42:54 +0000 (UTC)
Date: Tue, 18 Jun 2019 21:42:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190618214156-mutt-send-email-mst@kernel.org>
References: <3230056b-f78b-9671-8705-b3e508201d49@broadcom.com>
 <20190221164732.7ad8d7e6.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190221164732.7ad8d7e6.cohuck@redhat.com>
Subject: Re: [virtio-comment] virtio 1.1 features question
To: Cornelia Huck <cohuck@redhat.com>
Cc: Don Wallwork <don.wallwork@broadcom.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Feb 21, 2019 at 04:47:32PM +0100, Cornelia Huck wrote:
> On Thu, 21 Feb 2019 10:29:14 -0500
> Don Wallwork <don.wallwork@broadcom.com> wrote:
> 
> > Is there an expectation that feature names in the spec would match 
> > implementation in code?
> > I presume not, since features like VIRTIO_F_EVENT_IDX and 
> > VIRTIO_F_INDIRECT_DESC do not
> > appear in Linux kernel or QEMU code; VIRTIO_RING_F_EVENT_IDX and 
> > VIRTIO_RING_F_INDIRECT_DESC
> > are used instead.
> 
> I'd say matching the names is nice, but not required.
> 
> > 
> > Also noticed that there seems to be an inconsistency in the spec in that 
> > VIRTIO_F_EVENT_IDX is
> > used in some places and VIRTIO_F_RING_EVENT_IDX is used in others.. Is 
> > this intended?
> 
> This looks like a bug... the same things should use the same names.
> Might be a good idea to switch both to the name used in Linux/QEMU?


I agree. Don would you like to open a github issue
so we don't forget to fix this? If you do you get attribution
which is nice.


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

