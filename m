Return-Path: <virtio-comment-return-2457-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8F8E986455
	for <virtio-comment@lists.oasis-open.org>; Tue, 14 Dec 2021 18:28:59 +0000 (UTC)
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 14 Dec 2021 19:28:56 +0100
Message-ID: <2693456.ZlcpblOrAx@silver>
In-Reply-To: <8735mvruk8.fsf@redhat.com>
References: <cover.1639494803.git.qemu_oss@crudebyte.com> <4971f1bee76d664a71d411d8769a23a0d04097e7.1639494803.git.qemu_oss@crudebyte.com> <8735mvruk8.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH 1/2] Add VIRTIO_RING_F_INDIRECT_SIZE
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Dienstag, 14. Dezember 2021 17:59:51 CET Cornelia Huck wrote:
> On Tue, Dec 14 2021, Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > This new feature flag allows to decouple the maximum amount of
> > descriptors in indirect descriptor tables from the Queue Size.
> > 
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> >  content.tex    | 21 +++++++++++++++++++++
> >  split-ring.tex |  2 +-
> >  2 files changed, 22 insertions(+), 1 deletion(-)
> > 
> > diff --git a/content.tex b/content.tex
> > index 5d112af..0aa4842 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -6693,6 +6693,27 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> > Feature Bits}> 
> >    transport specific.
> >    For more details about driver notifications over PCI see
> >    \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific
> >    Initialization And Device Operation / Available Buffer Notifications}.> 
> > +  \item[VIRTIO_RING_F_INDIRECT_SIZE(40)] This feature indicates that the
> > +  maximum amount of descriptors in indirect descriptor tables is
> > independent +  from the Queue Size.
> > +
> > +  If this feature bit is not negotiated, then a driver MUST NOT create a
> 
> "MUST NOT" does only belong into normative sections... maybe you can
> reword the last sentence in this paragraph a bit and move the "MUST NOT"
> part into a normative section?

I lack creativity in this case. Suggestions appreciated. On doubt I would just 
delete the entire paragraph here ("If this feature ... transmitted per vring 
slot.").

> > +  descriptor chain longer than the Queue Size, which then also applies to
> > +  indirect descriptor tables as in \ref{sec:Basic Facilities of a Virtio
> > +  Device / Virtqueues / The Virtqueue Descriptor Table / Indirect
> > +  Descriptors}. Which means without this feature, the Queue Size limits
> > +  both the maximum amount of slots in the vring, as well as the actual
> > +  bulk data size being transmitted per vring slot.
> > +
> > +  With this feature enabled, the Queue Size only limits the maximum
> > amount
> > +  of slots in the vring, but does not limit the actual bulk data size
> > +  being transmitted when indirect descriptors are used. Decoupling these
> > +  two configuration parameters this way not only allows much larger bulk
> > data +  being transferred per vring slot, but also avoids complicated
> > synchronization +  mechanisms if the device only supports a very small
> > amount of vring slots. Due +  to the 16-bit size of a descriptor's "next"
> > field there is still an absolute +  limit of $2^{16}$ descriptors per
> > indirect descriptor table.
> > +
> > 
> >  \end{description}
> >  
> >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> > 
> > diff --git a/split-ring.tex b/split-ring.tex
> > index bfef62d..ae2aeb8 100644
> > --- a/split-ring.tex
> > +++ b/split-ring.tex
> > @@ -269,7 +269,7 @@ \subsubsection{Indirect Descriptors}\label{sec:Basic
> > Facilities of a Virtio Devi> 
> >  one table per descriptor).
> >  
> >  A driver MUST NOT create a descriptor chain longer than the Queue Size of
> > 
> > -the device.
> > +the device unless VIRTIO_RING_F_INDIRECT_SIZE has been negotiated.
> 
> This might already be enough of a normative statement, though.
> 
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

