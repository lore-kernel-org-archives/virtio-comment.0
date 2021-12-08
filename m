Return-Path: <virtio-comment-return-2443-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0B0B1986545
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Dec 2021 12:26:58 +0000 (UTC)
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 08 Dec 2021 13:26:54 +0100
Message-ID: <10245090.BqRs5aQnp2@silver>
In-Reply-To: <87fsr4thvo.fsf@redhat.com>
References: <cover.1638192251.git.qemu_oss@crudebyte.com> <Ya8udCHO9bXiWd4P@stefanha-x1.localdomain> <87fsr4thvo.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] Re: [PATCH v2 0/2] Add VIRTIO_RING_F_LARGE_INDIRECT_DESC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Cornelia Huck <cohuck@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Dienstag, 7. Dezember 2021 19:00:27 CET Cornelia Huck wrote:
> On Tue, Dec 07 2021, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > On Mon, Dec 06, 2021 at 08:12:14PM +0100, Christian Schoenebeck wrote:
> >> On Montag, 6. Dezember 2021 12:52:07 CET Cornelia Huck wrote:
> >> > On Fri, Dec 03 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> 
wrote:
> >> > > On Donnerstag, 2. Dezember 2021 11:27:17 CET Cornelia Huck wrote:
> >> > >> On Tue, Nov 30 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> 
wrote:
> >> > >> > On Dienstag, 30. November 2021 14:48:50 CET Cornelia Huck wrote:
> >> > >> >> On Tue, Nov 30 2021, Christian Schoenebeck
> >> > >> >> <qemu_oss@crudebyte.com>
> >> > >> > 
> >> > >> > Another issue I just realized: there is also an ambiguity in this
> >> > >> > v2
> >> > >> > what
> >> > >> > the maximum descriptor count actually relates to. Should it be
> >> > >> > 
> >> > >> > 1. max. indirect descriptor count per indirect descriptor table
> >> > >> > 
> >> > >> > or
> >> > >> > 
> >> > >> > 2. max. indirect descriptor count per vring slot (i.e. the sum
> >> > >> > from
> >> > >> > multiple indirect descriptor tables within the same message)
> >> > >> > 
> >> > >> > Case 2 applies to QEMU's implementation right now AFAICS. The max.
> >> > >> > possible
> >> > >> > bulk transfer size is lower in case 2 accordingly.
> >> > > 
> >> > > After reviewing virtio code on QEMU side again, I suggest to go for
> >> > > (2.).
> >> > > Otherwise a large portion of QEMU's virtio code would need quite a
> >> > > bunch
> >> > > of
> >> > > changes to support (1.). I assume that resistence for such changes in
> >> > > QEMU
> >> > > would be high, and I currently don't care enough to work on and
> >> > > defend
> >> > > those changes that (1.) would need.
> >> > > 
> >> > > In practice that would mean for many devices: the theoretical
> >> > > absolute
> >> > > max.
> >> > > virtio transfer size might be cut into half with (2.) in comparison
> >> > > to
> >> > > (1.), which is (2^16 * PAGE_SIZE) / 2 = 128 MB with a typical page
> >> > > size
> >> > > of 4k, because one indirect descriptor table is usually used for
> >> > > sending
> >> > > to device and another table for receiving from device. But that's use
> >> > > case dependent and (1.) is still a huge step forward IMO.
> >> > 
> >> > If the variant that is easier for QEMU to implement still gives you
> >> > enough of what you need, I'm fine with going with that. (Is it
> >> > future-proof enough?)
> >> 
> >> No crystal ball here, sorry. :)
> :
> :)
> :
> >> Just to give you a feeling what I am talking about here for QEMU, you
> >> might
> >> have a quick glimpse on the hw/virtio/virtio.c changes of following
> >> patch. It is not exactly how the final changes would look like, but it
> >> should give a rough idea of what is involved:
> >> https://lore.kernel.org/all/c9dea2e27ae19b2b9a51e8f08687067bf3e47bd5.1633
> >> 376313.git.qemu_oss@crudebyte.com/
> >> 
> >> As you can see, QEMU first reserves the max. expected descriptor count as
> >> array memory on stack, then it gathers *all* descriptors from all
> >> indirect
> >> descriptor tables of a vring slot all together into that array and
> >> finally
> >> the vring slot's message is processed on device level:
> >> https://github.com/qemu/qemu/blob/99fc08366b06282614daeda989d2fde6ab8a707
> >> f/hw/virtio/virtio.c#L1475
> >> 
> >> So a limit per vring slot would be much easier to implement in QEMU, as
> >> it is more or less just refactoring of QEMU's current compile-time
> >> constant VIRTQUEUE_MAX_SIZE into a runtime variable.
> >> Implementing a limit per table instead would require substantial changes
> >> to
> >> its current program flow.
> >> 
> >> Back to your question ...
> >> 
> >> Assuming that most devices have one or two tables per vring slot, and
> >> considering that almost nobody cared for virtio's current descriptor
> >> count
> >> limit so far, I would not expect that the new, much higher limit to be
> >> questioned in the next few years or so. And if it was, you would probably
> >> also start to question all those 16-bit fields in virtio as well and
> >> then this specific aspect here would probably be the smallest issue to
> >> worry about.
> >> 
> >> OTOH if there are devices with like 10 descriptor tables or more per
> >> vring
> >> slot, then they obviously would hit this limit much sooner. No idea if
> >> there is any such device though.
> > 
> > Other device implementations probably also care about the total number
> > of descriptors per vring slot instead of the number of descriptors per
> > indirect table. The limitation on the device side is the resource
> > requirement and/or maximum supported by the underlying I/O mechanism, so
> > the total number of descriptors is likely to matter.
> 
> Thanks to you both; going with the total number seems to be best.

Yes, agreed.

One more thought: what about making the new 'queue_indirect_size' config field 
32 bit wide instead of 16 bit? That would easily mitigate the issue of the 
aggregated limit discussed here, and would in general be more future safe, 
i.e. considering that there might be either nested/multi-level indirect 
descriptor tables or chained tables in future? The cost would be low, right?

Best regards,
Christian Schoenebeck



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

