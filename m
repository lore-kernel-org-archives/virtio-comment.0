Return-Path: <virtio-comment-return-4568-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 65EE79864DB
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Feb 2023 17:41:19 +0000 (UTC)
Date: Mon, 27 Feb 2023 12:41:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20230227124051-mutt-send-email-mst@kernel.org>
References: <20221013074513.25141-1-baptiste.afsa@harman.com>
 <1677509635629.14571@harman.com>
 <Y/zQKS7WD227Qz2y@fedora>
 <2244126.gP0zCk8Q6A@silver>
MIME-Version: 1.0
In-Reply-To: <2244126.gP0zCk8Q6A@silver>
Subject: [virtio-comment] Re: VIRTIO_RING_F_INDIRECT_SIZE status
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: "Afsa, Baptiste" <Baptiste.Afsa@harman.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Feb 27, 2023 at 05:13:12PM +0100, Christian Schoenebeck wrote:
> On Monday, February 27, 2023 4:45:45 PM CET Stefan Hajnoczi wrote:
> > On Mon, Feb 27, 2023 at 02:53:55PM +0000, Afsa, Baptiste wrote:
> > > The issue that we have now, is that this limitation does not seem to be enforced
> > > in Linux virtio drivers today. I came across:
> > > 
> > > https://github.com/oasis-tcs/virtio-spec/issues/122
> > > 
> > > which looks like a good base for us to build upon, but I'm not sure what is the
> > > status with this issue. Do you know whether there is any plan regarding this?
> > 
> > CCing Christian regarding extending queue size limits.
> 
> Status on this issue: it was suspended in May last year. AFAICR Michael
> expressed the need to give some more thought about it, and a new virtio spec
> release was just ahead at that time.
> 
> Michael, suggestions how to bring this forward?
> 
> Best regards,
> Christian Schoenebeck
> 

How about a summary letter listing various options, pros and cons?

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

