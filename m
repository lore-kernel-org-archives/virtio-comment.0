Return-Path: <virtio-comment-return-2396-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A291A9864A7
	for <virtio-comment@lists.oasis-open.org>; Thu, 25 Nov 2021 13:24:31 +0000 (UTC)
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 25 Nov 2021 14:24:27 +0100
Message-ID: <3085786.hZH81LJa6W@silver>
In-Reply-To: <YZ5zEwIGpudE8cjB@stefanha-x1.localdomain>
References: <E1mpa34-0008EK-Di@lizzy.crudebyte.com> <YZ5zEwIGpudE8cjB@stefanha-x1.localdomain>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH] Add VIRTIO_RING_F_LARGE_INDIRECT_DESC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mittwoch, 24. November 2021 18:14:59 CET Stefan Hajnoczi wrote:
> On Fri, Nov 19, 2021 at 02:21:12PM +0100, Christian Schoenebeck wrote:
> > This new feature flag allows indirect descriptor tables to
> > exceed the queue size.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > Stefan noted that there should also be a numeric configuration field
> > reflecting a precise limit of indirect descriptors. The question is where
> > should that go to exactly? Some devices currently handle this in their
> > device specific configuration space. Wouldn't it make sense to handle that
> > in the common configuration space instead?
> 
> It could be added as a read-only struct virtio_pci_common_cfg le16
> queue_indirect_size field. The same needs to be done for the other
> transports.

OK, do I have to make it clear that it is an optional field in 
virtio_pci_common_cfg?

Are you sure about read-only? QEMU currently reserves the worst case expected 
amount of descriptors on stack on every vring entry being processed. If that 
field was read-write instead, and if guest driver never uses the amount of 
descriptors as advertised by host device being support, guest driver could 
simply lower that value and reduce the pressure on host device.

So maybe it would make sense making it read-write with the requirement that 
guest driver must not increase the value? In the end that write option would 
be a soft feature, device could still ignore it and allocate more, it wouldn't 
hurt IMO and avoids another feature flag being required for this in future.

> > ---
> > 
> >  content.tex    | 21 +++++++++++++++++++++
> >  split-ring.tex |  2 +-
> >  2 files changed, 22 insertions(+), 1 deletion(-)
> > 
> > diff --git a/content.tex b/content.tex
> > index 5d112af..b42a26b 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -6693,6 +6693,27 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> > Feature Bits}> 
> >    transport specific.
> >    For more details about driver notifications over PCI see
> >    \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific
> >    Initialization And Device Operation / Available Buffer Notifications}.> 
> > +  \item[VIRTIO_RING_F_LARGE_INDIRECT_DESC(40)] This feature indicates
> > that the +  amount of descriptors in an indirect descriptor table is
> > allowed to exceed +  the Queue Size.
> > +
> > +  If this feature bit is not negotiated, then a driver MUST NOT create a
> > +  descriptor chain longer than the Queue Size, which then also applies to
> > +  indirect descriptor tables as in \ref{sec:Basic Facilities of a Virtio
> > +  Device / Virtqueues / The Virtqueue Descriptor Table / Indirect
> > +  Descriptors}. Which means without this feature, the Queue Size limits
> > +  both the maximum amount of pending messages being emplaced in the
> > vring,
> 
> The word "buffers" is typically used instead of "messages".

If that's the common terminology in the virtio spec, OK, I'll change that.

> > +  as well as the actual bulk data size being transmitted.
> > +
> > +  With this feature enabled, the Queue Size only limits the maximum
> > amount
> > +  of pending messages in the vring, but does not oppose a limit to the
> > actual +  bulk data size being transmitted. Decoupling these two
> > configuration
> I think we're still limited by Queue Size in the virtqueue descriptor
> table so this statement only applies when indirect descriptors are used:
> 
>   "... build data size being transmitted when indirect descriptors are
> used."

I thought this was already implied in this block, but sure it makes it more 
clear, so fine with me.

> > +  parameters this way not only allows much larger bulk data being
> > transferred +  per message, but also avoids complicated synchronization
> > mechanisms if +  device only supports a very small amount of
> > pending/active messages. +  Due to the 16-bit size of a descriptor's
> > "next" field there is still an +  absolute limit of $2^{16}$ descriptors
> > per indirect descriptor table. +
> > 
> >  \end{description}
> >  
> >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> > 
> > diff --git a/split-ring.tex b/split-ring.tex
> > index bfef62d..5284635 100644
> > --- a/split-ring.tex
> > +++ b/split-ring.tex
> > @@ -269,7 +269,7 @@ \subsubsection{Indirect Descriptors}\label{sec:Basic
> > Facilities of a Virtio Devi> 
> >  one table per descriptor).
> >  
> >  A driver MUST NOT create a descriptor chain longer than the Queue Size of
> > 
> > -the device.
> > +the device unless VIRTIO_RING_F_LARGE_INDIRECT_DESC has been negotiated.
> > 
> >  A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and VIRTQ_DESC_F_NEXT
> >  in \field{flags}.



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

