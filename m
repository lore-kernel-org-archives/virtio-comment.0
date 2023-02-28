Return-Path: <virtio-comment-return-4587-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 755009865FA
	for <virtio-comment@lists.oasis-open.org>; Tue, 28 Feb 2023 12:05:28 +0000 (UTC)
Date: Tue, 28 Feb 2023 07:05:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20230228065018-mutt-send-email-mst@kernel.org>
References: <20221013074513.25141-1-baptiste.afsa@harman.com>
 <2244126.gP0zCk8Q6A@silver>
 <20230227124051-mutt-send-email-mst@kernel.org>
 <2494182.5W6NY9sLyD@silver>
MIME-Version: 1.0
In-Reply-To: <2494182.5W6NY9sLyD@silver>
Subject: [virtio-comment] Re: VIRTIO_RING_F_INDIRECT_SIZE status
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: "Afsa, Baptiste" <Baptiste.Afsa@harman.com>, Stefan Hajnoczi <stefanha@redhat.com>, Eugenio Perez Martin <eperezma@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Feb 28, 2023 at 12:49:00PM +0100, Christian Schoenebeck wrote:
> On Monday, February 27, 2023 6:41:12 PM CET Michael S. Tsirkin wrote:
> > On Mon, Feb 27, 2023 at 05:13:12PM +0100, Christian Schoenebeck wrote:
> > > On Monday, February 27, 2023 4:45:45 PM CET Stefan Hajnoczi wrote:
> > > > On Mon, Feb 27, 2023 at 02:53:55PM +0000, Afsa, Baptiste wrote:
> > > > > The issue that we have now, is that this limitation does not seem to be enforced
> > > > > in Linux virtio drivers today. I came across:
> > > > > 
> > > > > https://github.com/oasis-tcs/virtio-spec/issues/122
> > > > > 
> > > > > which looks like a good base for us to build upon, but I'm not sure what is the
> > > > > status with this issue. Do you know whether there is any plan regarding this?
> > > > 
> > > > CCing Christian regarding extending queue size limits.
> > > 
> > > Status on this issue: it was suspended in May last year. AFAICR Michael
> > > expressed the need to give some more thought about it, and a new virtio spec
> > > release was just ahead at that time.
> > > 
> > > Michael, suggestions how to bring this forward?
> > > 
> > > Best regards,
> > > Christian Schoenebeck
> > > 
> > 
> > How about a summary letter listing various options, pros and cons?
> 
> Actually I had submitted a draft for this feature (latest version linked
> above), and AFAICR Michael was the only person who expressed concerns from
> design perspective. Comments by other people were already just aboout precise
> wording, but not about the design itself.
> 
> We stopped the discussion at the point where Michael expressed the need to
> think more about it, but as his expressed concerns were a bit vague, I still
> don't see how I could bring this issue forward.
> 
> Best regards,
> Christian Schoenebeck
> 


So the last time there were two things:


1. bugs introduced during the packed ring work. For example:

	> 
	> I don't think so:
	> 
	>   2.6.5.3.1 Driver Requirements: Indirect Descriptors
	>   ..
	>   "A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEXT in
	>   flags."
	> So as far as I can see it, the amount of direct descriptors is currently
	> always exactly one if an indirect table is used.
	> 
	> Best regards,
	> Christian Schoenebeck
	> 

	Oh. You are right.  Weirdly this text is not in packed-ring.tex - I
	think this and a bunch of other cases like this are an oversight,
	however we need to fix them first before adding features that assume
	they are fixed ...

we need to get them fixed before we poke at core ring otherwise it's a
mess - maybe the TC will accept just fixing this
without a feature bit, or maybe people will feel a feature bit
is required.



2. Given this is a lot of work I am trying to find a way to
make the impact bigger. In particular to cover the use-case
of limiting s/g to 1k while making queues deeper (with
or without indirect). For this I proposed:

	So I think that given this, we can limit the total number
	of non-indirect descriptors, including non-indirect ones
	in a chain + all the ones in indirect pointer table if any,
	and excluding the indirect descriptor itself, and this
	will address the issue you are describing here, right?

people seemed to be ok with this idea?



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

