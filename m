Return-Path: virtio-comment-return-1659-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F1DAD986560
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Jan 2021 10:42:23 +0000 (UTC)
Date: Fri, 22 Jan 2021 11:42:12 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210122114212.416880ad.cohuck@redhat.com>
In-Reply-To: <7f4fdfd2-edf2-d291-180a-41ffc3c3955e@redhat.com>
References: <20210118163804.437098-1-cohuck@redhat.com>
	<20210118164132.GC9899@work-vm>
	<20210119034008.735f80ad.pasic@linux.ibm.com>
	<20210119184506.3bd7061d.cohuck@redhat.com>
	<20210119195252.595870b1.pasic@linux.ibm.com>
	<7f4fdfd2-edf2-d291-180a-41ffc3c3955e@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC v2] clarify device reset
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, 20 Jan 2021 11:13:37 +0800
Jason Wang <jasowang@redhat.com> wrote:

> On 2021/1/20 =E4=B8=8A=E5=8D=882:52, Halil Pasic wrote:
> > On Tue, 19 Jan 2021 18:45:06 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:
> > =20
> >> On Tue, 19 Jan 2021 03:40:08 +0100
> >> Halil Pasic <pasic@linux.ibm.com> wrote:
> >> =20
> >>> On Mon, 18 Jan 2021 16:41:32 +0000
> >>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> >>>     =20
> >>>> * Cornelia Huck (cohuck@redhat.com) wrote: =20
> >>>>> Properly specify that the method for the driver to request a
> >>>>> device reset is transport specific, and some action the device
> >>>>> has to take.
> >>>>>
> >>>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >>>>> ---
> >>>>>
> >>>>> RFC -> RFC v2:
> >>>>>    - moved reset spec to basic facilities
> >>>>>
> >>>>> ---
> >>>>>   conformance.tex |  1 +
> >>>>>   content.tex     | 13 +++++++++++++
> >>>>>   2 files changed, 14 insertions(+)
> >>>>>
> >>>>> diff --git a/conformance.tex b/conformance.tex
> >>>>> index eb3324053080..3be499ae3c5e 100644
> >>>>> --- a/conformance.tex
> >>>>> +++ b/conformance.tex
> >>>>> @@ -271,6 +271,7 @@ \section{Conformance Targets}\label{sec:Conform=
ance / Conformance Targets}
> >>>>>   \begin{itemize}
> >>>>>   \item \ref{devicenormative:Basic Facilities of a Virtio Device / =
Device Status Field}
> >>>>>   \item \ref{devicenormative:Basic Facilities of a Virtio Device / =
Feature Bits}
> >>>>> +\item \ref{devicenormative:Basic Facilities of a Virtio Device / D=
evice Reset}
> >>>>>   \item \ref{devicenormative:Basic Facilities of a Virtio Device / =
Device Configuration Space}
> >>>>>   \item \ref{devicenormative:Basic Facilities of a Virtio Device / =
Message Framing}
> >>>>>   \item \ref{devicenormative:Basic Facilities of a Virtio Device / =
Virtqueues / The Virtqueue Descriptor Table}
> >>>>> diff --git a/content.tex b/content.tex
> >>>>> index 620c0e28c9a7..782ddf3ed78d 100644
> >>>>> --- a/content.tex
> >>>>> +++ b/content.tex
> >>>>> @@ -193,6 +193,19 @@ \section{Notifications}\label{sec:Basic Facili=
ties of a Virtio Device
> >>>>>   terminology. Occasionally, the term event is used to refer to
> >>>>>   a notification or a receipt of a notification.
> >>>>>  =20
> >>>>> +\section{Device Reset}\label{sec:Basic Facilities of a Virtio Devi=
ce / Device Reset}
> >>>>> +
> >>>>> +The driver may initiate a device reset at various times; notably, =
during
> >>>>> +device initialization and device cleanup.
> >>>>> +
> >>>>> +The mechanism used by the driver to initiate the reset is transpor=
t specific.
> >>>>> +
> >>>>> +\devicenormative{\subsection}{Device Reset}{Basic Facilities of a =
Virtio Device / Device Reset}
> >>>>> +
> >>>>> +A device MUST reinitialize device status to 0 after receiving a re=
set.
> >>>>> +
> >>>>> +A device MUST NOT send notifications after receiving a reset.
> >>>>> + =20
> >>> s/after receiving a reset/after presenting a 0 status, that indicates
> >>> the reset is done/ =20
> >> "A device MUST NOT send notifications after indicating completion of
> >> the reset by reinitializing the device status to 0."
> >>
> >> ? =20
> > Works with me. I tried to align my wording with the pci wording.
> > =20
> >>>> This feels like a bit of a race in the description;  a Device may ha=
ve
> >>>> just sent a notification at the point that it receives a reset.
> >>>> When a driver initiates a reset, how does the driver know that the
> >>>> device has received it? =20
> >>> I agree, but with the proposed modification not any more.
> >>>
> >>> To answer your question: PCI has the following driver normative (whic=
h I
> >>> believe needs to be generalized so we have something similar for each
> >>> transport, and thus the same semantics):
> >>> "After writing 0 to device_status, the driver MUST wait for a read of
> >>> device_status to return 0 before reinitializing the device."
> >>> (4.1.4.3.2 Driver Requirements: Common configuration structure layout=
,
> >>> https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.=
html#x1-1090004)
> >>>
> >>> In general, after asking for a reset, the driver should/must ensure t=
hat
> >>> the reset was performed by the device by reading a 0 status. If the
> >>> status is non-zero, the reset at the device may still be in progress.
> >>> IMHO we need another driver normative for that. =20
> >> "After the driver has initiated a reset of the device, it MUST NOT
> >> consider the reset to be completed if the device status is not 0."
> >>
> >> ? =20
> > ", before it reads status 0."
> >
> > My point is, that usually when I do an assignment to a memory location
> > with a single instruction, and the instruction completes successfully,
> > for me (on my CPU), that memory location is 0.
> >
> > PCI is however not like this: the device can delay or reject the write,
> > apparently. Jason taught me that. So I think we should insist on the
> > read. =20
>=20
>=20
> Yes. For PCI the status is implemented via registers, there's no=20
> guarantee a read is 0 after write 0 to that.

I thought it was clear that the driver cannot know the device status
without doing a read, but we certainly can make that explicit.

>=20
>=20
> > =20
> >> Maybe without the double negation.
> >>
> >> (We could consider the reset for ccw devices done once we get final
> >> status for the reset ccw. Would save the round trip for a read status
> >> ccw, but would also be different from the other transports.) =20
>=20
>=20
> I think it's probably not a problem since we don't care about the=20
> performance of reset.

I was less concerned about the performance, more about the complexity
of the implementation. Sending an extra command is not that bad, though.

>=20
> Thanks
>=20
>=20
> > We could work around that by making a positive statement. Not telling,
> > when the driver MUST NOT consider the reset completed, but tell when th=
e
> > driver SHOULD consider the reset completed.

That could be

"The driver SHOULD consider a driver-initiated reset complete when it
reads the device status as 0."

> >
> > The MUST NOT does not buy much to the driver. It knows, what is
> > certainly wrong, but it still does not know what is right. What the
> > driver needs is a criterion when the reset is certainly completed (so
> > it can free up resources for example).

Any further comments before I put together a v3 (without the RFC)?
I also need to open a github issue for this.


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

