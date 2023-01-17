Return-Path: <virtio-comment-return-3864-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B3A49865EC
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Jan 2023 18:28:01 +0000 (UTC)
MIME-Version: 1.0
References: <20221013074513.25141-1-baptiste.afsa@harman.com>
 <20230113073710-mutt-send-email-mst@kernel.org> <1673968792585.39097@harman.com>
In-Reply-To: <1673968792585.39097@harman.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 17 Jan 2023 19:27:21 +0100
Message-ID: <CAJaqyWc-gEJGexf-h6OCez2NWg+L0aVeq=0y9tzFvDxmVkdkoQ@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH] Introduce VIRTIO_F_ISOLATE_INDIRECT_DESC feature
Content-Type: text/plain; charset="UTF-8"
To: "Afsa, Baptiste" <Baptiste.Afsa@harman.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Jan 17, 2023 at 4:24 PM Afsa, Baptiste <Baptiste.Afsa@harman.com> wrote:
>
> > I missed this when this was posted :( Creating the github issue
> > drew my attention to it. Replying now.
> >
> > I also CC Eugenio who seems to have implemented shadow VQs in QEMU
> > (motivation for this patch) without need for new feature bits.
> >
>
> Hello Michael,
>
> No worries, thanks for the review!
>
> I didn't know there was such support in QEMU. I'll look at it in more details
> because it is not clear to me whether we are talking about the same thing or
> not.
>
> Keep in mind that we use shadow virtqueues in a context where the device do not
> have full access to the memory of the guest where the driver runs. Instead we
> grant buffers to the device transparently from the hypervisor as buffers are
> added to the virtqueues.

Hi Baptiste,

It is not the current way of working for shadow virtqueue in qemu, but
it is doable.

QEMU offers a new address space to the device, including all the guest
memory and the shadow vrings in qemu memory. By default, qemu
translates each descriptor to this new address space and copies it in
the shadow vring, making sure it's a valid guest address.

Net CVQ is a special case, as qemu copies also the buffer so a
malicious guest will not be able to change it and make vdpa device and
qemu's knowledge of it out of sync. This is done in a region mapped at
device start for this purpose for performance and simplicity, not for
each descriptor.

It is technically possible to develop the copy of the buffer content
in a memory region too. Once a suitable size is agreed (or given by a
parameter in cmdline, for example), SVQ already supports things like
backoff in case this region is full. To malloc and map this region
dynamically is also possible.

> This new feature bit helps supporting indirect
> descriptors in this context.
>
> When an indirect descriptor is added to a virtqueue, we need to "share" the
> indirect descriptor table in addition to the buffers themselves. To do this we
> have two options:
>
>   - Share a shadow copy of the table with the device but this requires some kind
>     of dynamic memory allocation in the hypervisor.
>
>   - Grant the indirect descriptor table from the guest as-is. Note that in our
>     use case we do not translate buffer addresses when importing them into the
>     device address space.
>

The plan with indirect descriptors is similar to CVQ buffer treatment:
To preallocate a big enough chunk of memory able to hold a copy of the
indirect table and then translate each descriptor. The current dynamic
allocation scheme is very simple but it should work as long as there
is enough memory. As commented before, backoff is already available
for other cases.

Going a step forward with current qemu's SVQ, a feature that would
help is to allow the device to translate buffers addresses with a
different IOVA from vring and indirect table. But this is far from
standard POV, since it does not have even an address space concept.

Do you think both modes can converge?

> The issue with the second option is that we need to ensure that the driver will
> not modify the indirect descriptor table while it is on the device side.
> Otherwise the device could attempt to access the buffers using the new addresses
> which would not correspond to the one the hypervisor used when granting memory.
>
> Since this is something that a correct driver implementation would not do, this
> led to the idea of remapping the table read-only while it is used by the device.
> Because an indirect descriptor table may not fill an entire page, we needed a
> way to ensure that the OS would not re-use the rest of these pages for other
> purposes while we have made them read-only.
>

How do you guarantee it for vring itself?

> > > ---
> > >  content.tex | 26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/content.tex b/content.tex
> > > index e863709..20e17b7 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -6944,6 +6944,23 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > >    that the driver can reset a queue individually.
> > >    See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}.
> > >
> > > +  \item[VIRTIO_F_ISOLATE_INDIRECT_DESC(41)] This feature indicates that the
> > > +  device requires the driver to allocate each indirect descriptor on its own
> > > +  dedicated memory pages which MUST NOT hold any other data than this indirect
> > > +  descriptor.
> >
> > what are "memory pages"? the spec does not define anything like this.
> >
> >
> > > +
> > > +  This allows the host to unmap these pages from the guest address space while
> > > +  the indirect descriptors are available to the device. The device
> > > +  implementation is therefore guaranteed that the driver cannot tampered with an
> > > +  indirect descriptor table while the device is using it.
> >
> > grammar issues in this text.
> >
> > > +
> > > +  This mechanism notably allows to implement a memory isolation scheme where the
> > > +  virtio buffers are shared dynamically between the host and the guest as they
> > > +  are exchanged through the virtqueues. It permits the host to share indirect
> > > +  descriptor tables and all the associated buffers as is, without the need for
> > > +  the device to verify that the buffers referenced in an indirect descriptor
> > > +  table are actually accessible to the device.
> >
> > It's not really clear from this text what this verification is and how
> > device can access without verifying it's accessible.  Generally we talk
> > about device and driver.  Some examples talk about host and guest
> > instead.  But here we have host, guest and device. This is not clear
> > without much more explanation.
> >
>
> Fair enough. I agree this could be presented in more details. However this
> brings up a question: do you think that the specification should describe this
> specific application of this feature bit?
>
> The spec should define what the feature bit implies, how it can be used is
> another topic. I can certainly provide more details on how we used it but there
> may be other applications.
>
> What do you think?
>

I think one problem of the description is that it requires having the
hypervisor in mind, with most of the other features also valid in
scenarios where a virtio device is used without one. This should be
explicit, and at least why it cannot be achieved with this feature (or
what makes it convenient).

The closer example I have in mind is net gratuitous packet sending.
The standard explicitly explains why it is easier to delegate it to
the guest (hypervisor may not have full knowledge of what to
announce). I think a rewrite of the last two paragraphs in terms of
"if not done this way, these are the consequences" may help here.

Thanks!

> > > +
> > >  \end{description}
> > >
> > >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> > > @@ -6980,6 +6997,12 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > >
> > >  A driver SHOULD accept VIRTIO_F_NOTIF_CONFIG_DATA if it is offered.
> > >
> > > +A driver SHOULD accept VIRTIO_F_ISOLATE_INDIRECT_DESC if it is offered. If
> > > +VIRTIO_F_ISOLATE_INDIRECT_DESC has been negotiated, a driver MUST NOT access the
> > > +memory pages that contain an indirect descriptor after the indirect descriptor
> > > +has been made available to the device and before it is returned as used,
> > > +otherwise the resulting behavior is undefined.
> >
> > What size are "memory pages"? descriptors are not returned as used,
> > buffers are used, pls use consistent terminology.
> >
> > > +
> > >  \devicenormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> > >
> > >  A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate further
> > > @@ -7009,6 +7032,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > >  and presents a PCI SR-IOV capability structure, otherwise
> > >  it MUST NOT offer VIRTIO_F_SR_IOV.
> > >
> > > +A device MAY fail to operate further if VIRTIO_F_ISOLATE_INDIRECT_DESC is not
> > > +accepted.
> >
> > what does this mean? fail how? reject FEATURES_OK? that's normal for any
> > bit I guess.
> >
>
> Yes, rejecting FEATURES_OK is probably the best option here. To be honest with
> you, I simply re-used the wording used for some other feature bits like
> VIRTIO_F_VERSION_1 or VIRTIO_F_ACCESS_PLATFORM.
>
> I thought that this was important to mention, because most of the feature bits
> are here to describe optional features that the driver is free to use or
> not. Not accepting them should not make the device unusable. Whereas this new
> feature bit is more like some sort of requirement from the device on the driver.
>
> At the same time, I agree with you that the specification is already clear on
> the fact that the device may reject FEATURES_OK if it is not happy with the
> subset of features selected by the driver. If you think this is not relevant, I
> do not mind dropping it.
>
> >
> > > +
> > >  \section{Legacy Interface: Reserved Feature Bits}\label{sec:Reserved Feature Bits / Legacy Interface: Reserved Feature Bits}
> > >
> > >  Transitional devices MAY offer the following:
> > > --
> > > 2.38.0
> > >
> > >
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > >
> > > In order to verify user consent to the Feedback License terms and
> > > to minimize spam in the list archive, subscription is required
> > > before posting.
> > >
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/
>


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

