Return-Path: <virtio-comment-return-2833-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 444DC983F88
	for <virtio-comment@lists.oasis-open.org>; Sun, 20 Mar 2022 13:32:29 +0000 (UTC)
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 20 Mar 2022 14:32:23 +0100
Message-ID: <149799798.HqrVOTAGB4@silver>
In-Reply-To: <20220320082410-mutt-send-email-mst@kernel.org>
References: <4735344.EBYxvr1mta@silver> <8451025.v97J4D4Zi3@silver> <20220320082410-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v3 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Sonntag, 20. M=E4rz 2022 13:31:51 CET Michael S. Tsirkin wrote:
> On Sat, Mar 19, 2022 at 01:00:28PM +0100, Christian Schoenebeck wrote:
> > On Samstag, 19. M=E4rz 2022 10:33:49 CET Michael S. Tsirkin wrote:
> > > On Wed, Mar 16, 2022, 15:47 Christian Schoenebeck
> > > <qemu_oss@crudebyte.com>
> > >=20
> > > wrote:
> > > > This new feature flag allows to decouple the maximum amount of
> > > > descriptors in indirect descriptor tables from the Queue Size.
> > >=20
> > > if we are extending these limits, I suggest reusing the feature flag =
to
> > > also add a limit on total s/g list size. making it separate from queu=
e
> > > size
> > > was requested a while ago.
> >=20
> > What do you mean with "total s/g list size"? The maximum bulk data size
> > per
> > message?
> > Sum of both in and out s/g lists' bulk data or only for one of them?
> > Or maximum size of exactly only one memory segment?
>=20
> I don't really know what does "bulk data size" mean. Suggest we use
> terminology from the spec. A buffer includes a group of direct and/or
> indirect descriptors, in turn indirect descriptors point to direct
> descriptors.

I already described why I think it makes sense not calling it "buffer" in t=
his=20
particular context. So I am against changing this to "buffer". If other peo=
ple=20
support your position then I'll change it though of course.

About "bulk data size": "Bulk data" is the user data actually being used on=
=20
application/driver level, i.e. above virtio level, and "Bulk data size" the=
=20
size of that data. See ASCII illustration here:
https://github.com/oasis-tcs/virtio-spec/issues/122

The terminology "bulk data" is already used in the spec already BTW.

> What has been requested a while is ability to limit per vq the
> # of direct descriptors in a buffer.

So in cases where indirect descriptors are *not* used. This series is about=
=20
indirect descriptors only though.

> Since IIUC what you want to do is allow more descriptors
> than VQ size, then one way to achieve that is just to have
> a per VQ limit on descriptor size and have that limit > VQ size.

Sorry, I can't follow you. What do you mean with "descriptor size"? For me =
a=20
descriptor has a predefined constant struct size. You mean the size of one=
=20
memory segment referenced by one indirect descriptor? And why would it be=
=20
better than what this series suggests?

> Another thing related is that people wanted to block indirect
> descriptors for some VQs. Not yet sure how to combine that
> with this proposal, worth thinking about.

This series allows both, increasing *and* decreasing the number of indirect=
=20
descriptors per VQ already.

> > And are you suggesting this should become part of this series already?
>=20
> yes since it's touching mostly same areas in the spec.

:/ Please note that I sent the first draft on this issue already in Novembe=
r=20
last year, and have not seen any response from your side so far. I actually=
=20
assumed we were already at a point where it was just about precise wording =
et=20
al., not restarting to redesign everything again from scratch now.

> > > > The new term "Queue Indirect Size" is introduced for this purpose,
> > > > which is a transport specific configuration whose negotiation is
> > > > further specified for each transport with subsequent patches.
> > > >=20
> > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > ---
> > > >=20
> > > >  content.tex     | 32 ++++++++++++++++++++++++++++++--
> > > >  packed-ring.tex |  2 +-
> > > >  split-ring.tex  |  8 ++++++--
> > > >  3 files changed, 37 insertions(+), 5 deletions(-)
> > > >=20
> > > > diff --git a/content.tex b/content.tex
> > > > index c6f116c..685525d 100644
> > > > --- a/content.tex
> > > > +++ b/content.tex
> > > > @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Faciliti=
es
> > > > of a
> > > > Virtio Device / Feature B
> > > >=20
> > > >  \begin{description}
> > > >  \item[0 to 23, and 50 to 127] Feature bits for the specific device
> > > >  type
> > > >=20
> > > > -\item[24 to 40] Feature bits reserved for extensions to the queue =
and
> > > > +\item[24 to 41] Feature bits reserved for extensions to the queue =
and
> > > >=20
> > > >    feature negotiation mechanisms
> > > >=20
> > > > -\item[41 to 49, and 128 and above] Feature bits reserved for futur=
e
> > > > extensions.
> > > > +\item[42 to 49, and 128 and above] Feature bits reserved for futur=
e
> > > > extensions.
> > > >=20
> > > >  \end{description}
> > > > =20
> > > >  \begin{note}
> > > >=20
> > > > @@ -1051,6 +1051,10 @@ \subsubsection{Common configuration structur=
e
> > > > layout}\label{sec:Virtio Transport
> > > >=20
> > > >  present either a value of 0 or a power of 2 in
> > > >  \field{queue_size}.
> > > >=20
> > > > +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the device MUS=
T
> > > > provide the
> > > > +Queue Indirect Size supported by device, which is a transport
> > > > specific
> > > > +configuration. It MUST allow the driver to set a lower value.
> > > > +
> > > >=20
> > > >  \drivernormative{\paragraph}{Common configuration structure
> > > >=20
> > > > layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device
> > > > Layout
> > > > / Common configuration structure layout}
> > > >=20
> > > >  The driver MUST NOT write to \field{device_feature},
> > > >  \field{num_queues},
> > > >=20
> > > > \field{config_generation}, \field{queue_notify_off} or
> > > > \field{queue_notify_data}.
> > > > @@ -6847,6 +6851,30 @@ \chapter{Reserved Feature
> > > > Bits}\label{sec:Reserved
> > > > Feature Bits}
> > > >=20
> > > >    that the driver can reset a queue individually.
> > > >    See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues /
> > > >=20
> > > > Virtqueue Reset}.
> > > >=20
> > > > +  \item[VIRTIO_RING_F_INDIRECT_SIZE(41)] This feature indicates th=
at
> > > > the
> > > > +  Queue Indirect Size, i.e. the maximum amount of descriptors in
> > > > indirect
> > > > +  descriptor tables, is independent from the Queue Size.
> > > > +
> > > > +  Without this feature, the Queue Size limits the length of the
> > > > descriptor
> > > > +  chain, including indirect descriptor tables as in \ref{sec:Basic
> > > > Facilities of
> > > > +  a Virtio Device / Virtqueues / The Virtqueue Descriptor Table /
> > > > Indirect
> > > > +  Descriptors}, i.e. both the maximum amount of slots in the vring
> > > > and
> > > > the
> > > > +  actual bulk data size transmitted per vring slot.
> > >=20
> > > spect does not call these  slots elsewhere.
> >=20
> > Yes, I intentionally used "vring slot" instead of "buffer" as I find th=
e
> > latter too vague in this context. A "buffer" can be a memory segment, a
> > set of memory segments and what not. "vring slot" OTOH makes it clear
> > that it is about exactly one, atomic pointer (hence with fixed size) in=
 a
> > Ring Buffer, as depicted in the ASCII illustration here:
> >=20
> > https://github.com/oasis-tcs/virtio-spec/issues/122
> >=20
> > The maximum amount of vring slots is therefore the maximum amount of
> > messages that can be emplaced into a Ring Buffer, independent of any
> > "bulk data buffer size".
> >=20
> > > +
> > >=20
> > > > +  With this feature enabled, the Queue Size only limits the maximu=
m
> > > > amount
> > > > +  of slots in the vring, but does not limit the actual bulk data s=
ize
> > > > +  being transmitted when indirect descriptors are used. Decoupling
> > > > these
> > > > +  two configuration parameters this way not only allows much large=
r
> > > > bulk
> > > > data
> > > > +  being transferred per vring slot, but also avoids complicated
> > > > synchronization
> > > > +  mechanisms if the device only supports a very small amount of vr=
ing
> > > > slots. Due
> > > > +  to the 16-bit size of a descriptor's "next" field there is still=
 an
> > > > absolute
> > > > +  limit of $2^{16}$ descriptors per indirect descriptor table.
> > > > However
> > > > the
> > > > +  actual maximum amount supported by either device or driver might=
 be
> > > > less,
> > > > +  and therefore the bus specific Queue Indirect Size value MUST
> > > > additionally
> > > > +  be negotiated if VIRTIO_RING_F_INDIRECT_SIZE was negotiated to
> > > > subsequently
> > > > +  negotiate the actual amount of maximum indirect descriptors
> > > > supported
> > > > +  by both sides.
> > >=20
> > > still not sure what exactly is the value. e.g. in a buffer including
> > > indirect and direct descriptors.
> > >=20
> > > +
> > >=20
> > > >  \end{description}
> > > > =20
> > > >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
> > > >  Bits}
> > > >=20
> > > > diff --git a/packed-ring.tex b/packed-ring.tex
> > > > index a9e6c16..e26d112 100644
> > > > --- a/packed-ring.tex
> > > > +++ b/packed-ring.tex
> > > > @@ -195,7 +195,7 @@ \subsection{Scatter-Gather Support}
> > > >=20
> > > >  The device limits the number of descriptors in a list through a
> > > >  transport-specific and/or device-specific value. If not limited,
> > > >  the maximum number of descriptors in a list is the virt queue
> > > >=20
> > > > -size.
> > > > +size unless the VIRTIO_RING_F_INDIRECT_SIZE feature has been
> > > > negotiated.
> > > >=20
> > > >  \subsection{Next Flag: Descriptor Chaining}
> > > >  \label{sec:Packed Virtqueues / Next Flag: Descriptor Chaining}
> > > >=20
> > > > diff --git a/split-ring.tex b/split-ring.tex
> > > > index de94038..eaa90c3 100644
> > > > --- a/split-ring.tex
> > > > +++ b/split-ring.tex
> > > > @@ -268,8 +268,12 @@ \subsubsection{Indirect
> > > > Descriptors}\label{sec:Basic
> > > > Facilities of a Virtio Devi
> > > >=20
> > > >  set the VIRTQ_DESC_F_INDIRECT flag within an indirect descriptor (=
ie.
> > > >  only
> > > >  one table per descriptor).
> > > >=20
> > > > -A driver MUST NOT create a descriptor chain longer than the Queue
> > > > Size of
> > > > -the device.
> > >=20
> > > +If VIRTIO_RING_F_INDIRECT_SIZE has not been negotiated, the driver M=
UST
> > >=20
> > > > +NOT create a descriptor chain longer than the Queue Size of the
> > > > device.
> > > > +
> > > > +If VIRTIO_RING_F_INDIRECT_SIZE has been negotiated, the number of
> > > > +descriptors per indirect descriptor table MUST NOT exceed the
> > > > negotiated
> > > > +Queue Indirect Size.
> > >=20
> > > it is not negotiated is it?
> >=20
> > What makes you think it is not negotiated?

Also see my previous question here ^

> > > >  A driver MUST NOT set both VIRTQ_DESC_F_INDIRECT and
> > > >  VIRTQ_DESC_F_NEXT
> > > >  in \field{flags}.
> > > >=20
> > > > --
> > > > 2.30.2
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > > This publicly archived list offers a means to provide input to the
> > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > >=20
> > > > In order to verify user consent to the Feedback License terms and
> > > > to minimize spam in the list archive, subscription is required
> > > > before posting.
> > > >=20
> > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > Feedback License:
> > > > https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > > List Guidelines:
> > > > https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > Join OASIS: https://www.oasis-open.org/join/



This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

