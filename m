Return-Path: virtio-comment-return-1648-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 31677985F3E
	for <virtio-comment@lists.oasis-open.org>; Tue, 19 Jan 2021 02:42:37 +0000 (UTC)
Date: Tue, 19 Jan 2021 03:42:27 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20210119034227.3fb4215d.pasic@linux.ibm.com>
In-Reply-To: <20210118174842.2e6e31a4.cohuck@redhat.com>
References: <20210118163804.437098-1-cohuck@redhat.com>
	<20210118164132.GC9899@work-vm>
	<20210118174842.2e6e31a4.cohuck@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC v2] clarify device reset
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, 18 Jan 2021 17:48:42 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Mon, 18 Jan 2021 16:41:32 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>=20
> > * Cornelia Huck (cohuck@redhat.com) wrote: =20
> > > Properly specify that the method for the driver to request a
> > > device reset is transport specific, and some action the device
> > > has to take.
> > >=20
> > > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > > ---
> > >=20
> > > RFC -> RFC v2:
> > >   - moved reset spec to basic facilities
> > >=20
> > > ---
> > >  conformance.tex |  1 +
> > >  content.tex     | 13 +++++++++++++
> > >  2 files changed, 14 insertions(+)
> > >=20
> > > diff --git a/conformance.tex b/conformance.tex
> > > index eb3324053080..3be499ae3c5e 100644
> > > --- a/conformance.tex
> > > +++ b/conformance.tex
> > > @@ -271,6 +271,7 @@ \section{Conformance Targets}\label{sec:Conforman=
ce / Conformance Targets}
> > >  \begin{itemize}
> > >  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Dev=
ice Status Field}
> > >  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Fea=
ture Bits}
> > > +\item \ref{devicenormative:Basic Facilities of a Virtio Device / Dev=
ice Reset}
> > >  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Dev=
ice Configuration Space}
> > >  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Mes=
sage Framing}
> > >  \item \ref{devicenormative:Basic Facilities of a Virtio Device / Vir=
tqueues / The Virtqueue Descriptor Table}
> > > diff --git a/content.tex b/content.tex
> > > index 620c0e28c9a7..782ddf3ed78d 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -193,6 +193,19 @@ \section{Notifications}\label{sec:Basic Faciliti=
es of a Virtio Device
> > >  terminology. Occasionally, the term event is used to refer to
> > >  a notification or a receipt of a notification.
> > > =20
> > > +\section{Device Reset}\label{sec:Basic Facilities of a Virtio Device=
 / Device Reset}
> > > +
> > > +The driver may initiate a device reset at various times; notably, du=
ring
> > > +device initialization and device cleanup.
> > > +
> > > +The mechanism used by the driver to initiate the reset is transport =
specific.
> > > +
> > > +\devicenormative{\subsection}{Device Reset}{Basic Facilities of a Vi=
rtio Device / Device Reset}
> > > +
> > > +A device MUST reinitialize device status to 0 after receiving a rese=
t.
> > > +
> > > +A device MUST NOT send notifications after receiving a reset.
> > > +   =20
> >=20
> > This feels like a bit of a race in the description;  a Device may have
> > just sent a notification at the point that it receives a reset.
> > When a driver initiates a reset, how does the driver know that the
> > device has received it? =20
>=20
> I'm actually not 100% sure about that requirement... we can also drop
> it.
>=20

Please see my response to Dave's mail. In short, I don't we need to drop
it , I think we need to improve and expand.

Regards,
Halil

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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

