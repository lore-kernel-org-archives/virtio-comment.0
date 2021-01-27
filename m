Return-Path: virtio-comment-return-1688-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 925AD986575
	for <virtio-comment@lists.oasis-open.org>; Wed, 27 Jan 2021 17:14:19 +0000 (UTC)
Date: Wed, 27 Jan 2021 18:14:11 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210127181411.15046e12.cohuck@redhat.com>
In-Reply-To: <20210127144857.45f2b337.pasic@linux.ibm.com>
References: <20210125110823.591104-1-cohuck@redhat.com>
	<20210127101904.326d5295.pasic@linux.ibm.com>
	<20210127124403.71e5e4e1.cohuck@redhat.com>
	<20210127144857.45f2b337.pasic@linux.ibm.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v3] clarify device reset
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Halil Pasic <pasic@linux.ibm.com>
Cc: virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, 27 Jan 2021 14:48:57 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Wed, 27 Jan 2021 12:44:03 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
>=20
> > On Wed, 27 Jan 2021 10:19:04 +0100
> > Halil Pasic <pasic@linux.ibm.com> wrote:
> >  =20
> > > On Mon, 25 Jan 2021 12:08:23 +0100
> > > Cornelia Huck <cohuck@redhat.com> wrote:

> > > > +\section{Device
> > > > Reset}\label{sec:Basic Facilities of a Virtio Device / Device
> > > > Reset} + +The driver may initiate a device reset at various times;
> > > > notably, during +device initialization and device cleanup.     =20
> > >=20
> > > Are there times the driver may not initiate a device reset? What are
> > > we trying to tell with this sentence?   =20
> >=20
> > s/may initiate/may want to initiate/ =20
>=20
> Definitively better. I would still prefer avoiding the discussion
> on when the driver may want to reset the device. But I can live
> with this.

The driver is free to reset the device whenever it wants to, even if it
does not make sense. Device initialization and cleanup are examples for
when it definitely will do so.

>=20
> >  =20
> > >=20
> > > If we are just looking for an introductionary sentence, I would
> > > probably go with something like "A device reset be either initiated
> > > by the =20
>=20
> s/be/can be/
>=20
> > > driver, or by a system reset, or other external controls."   =20
> >=20
> > It was mostly supposed to be a lead-in.
> >=20
> > I'm not sure we want to spell out things like system resets. They are
> > platform-specific, and virtio devices are basically just a device
> > there. =20
>=20
> Hm. AFAIR the only way to make the device non-live, i.e. illegal for it=
=20
> to e.g. access a queue, which is in guest memory is device reset. Now if
> I want to perform a reboot, I do want to stop the devices from poking
> such memory. But I think, in linux we don't reset the device form the
> driver, before reboot, and I believe we don't have to because we are
> guaranteed that the device will get reset. Or is my memory failing me?
>=20
> I think it is of value to clarify that a virtio reset can possibly be
> initiated by other means than explicitly specified by the virtio spec,
> and that when a 'proxy-device' is reset, the 'virtio-device' is to be
> reset as well. We do mention system reset once, in a normative section
> at that (2.2.2).

That section looks a bit questionable (what is 'resuming from suspend'?).

Platforms may have different definitions of what a system reset does
(and even different types of reset). I think it is reasonable to assume
that any platform/system reset that brings devices into some kind of
initial state also brings virtio devices into that initial state (and
especially that bringing the proxy device into an initial state also
covers the virtio-specific parts.)

>=20
> > Of course, the actual implementation will share backend code to
> > reinitialize to a clean state for driver-initiated resets, system
> > resets, and whatever else there might be, but I consider that an
> > implementation detail and not something that needs to be specified.
> >=20
> > We do want to spell out, however, what a driver can expect and a device
> > needs to do for a driver-initiated reset, and that's what this update
> > aims to do.
> >  =20
> > >    =20
> > > > +
> > > > +The mechanism used by the driver to initiate the reset is
> > > > transport specific. +
> > > > +\devicenormative{\subsection}{Device Reset}{Basic Facilities of a
> > > > Virtio Device / Device Reset} +
> > > > +A device MUST reinitialize device status to 0 after receiving a
> > > > reset.
> > > > +     =20
> > >=20
> > > What is the intent behind this sentence?
> > >=20
> > > One way I can read this it, that the device reset is not allowed to
> > > fail. I.e. device must reinitialize status to after receiving a reset
> > > and status 0 indicating the reset is done implies, that a reset must
> > > succeed eventually (provided the device did receive).   =20
> >=20
> > Yes, I don't think it makes sense to reject a reset.
> >  =20
>=20
> I don't know. And if that is what we want to say, I would certainly
> prefer a SHOULD over a must. E.g. what if the device looses power
> between receiving the reset and being able to finish it. Also if
> we want to express that a reset should not fail we should say that
> in a more straight forward way.

If a device loses power, we cannot really mandate anything; it depends
on the platform whether the device can continue with whatever has been
in progress or whether it ends up in some kind of initial state. IOW, I
think this is outside the scope of this standard.

>=20
> How do we expect the device and the driver to deal with a device
> error that ain't recoverable even by a device reset? AFAIR all
> the device can do is set DEVICE_NEEDS_RESET to indicate "that the device
> has experienced an error from which it can=E2=80=99t recover". On the oth=
er
> hand, I think the most reasonable way for a driver to meet
> DEVICE_NEEDS_RESET
> is to reset it and make an attempt to re-initialize it...

If the device is not recoverable at all, I'd expect some
platform-specific error when trying to access it in any way (write
error, cc 3 on ssch, ...), as that implies to me that it is not
operational anymore.

>=20
> > >=20
> > > The other way i can read it is, what I would rather have worded as:
> > > "The device MUST indicate the completion of the reset by
> > > reinitializing the device status to 0".   =20
> >=20
> > That's also true, but I think it is already covered?
> >  =20
>=20
> It is IMHO implicitly covered by the driver normative.

Yes.

>=20
> > >=20
> > >    =20
> > > > +A device MUST NOT send notifications after indicating completion
> > > > of +the reset by reinitializing the device status to 0.     =20
> > >=20
> > > I've just realized, that 'after' is very open to the right. Of course
> > > the device may send notifications again after the driver
> > > re-initialized the device as per 3.1.1.   =20
> >=20
> > Append "until the driver re-initializes the device."?
> >  =20
>=20
> That is another solution.
>=20
> > >=20
> > > Maybe it is wiser to tie this restriction to the current status value
> > > (without any after or before), and do it where the notifications are
> > > described.=20
> > >=20
> > > Also a device that has status 0 may not poke the virtqueues. If we
> > > are explicit about the notifications, we should be explicit about
> > > the virtqueues as well.   =20
> >=20
> > What about
> >=20
> > "A device MUST NOT send notifications or process queue buffers after
> > indication completion of the reset by reinitializing the device status

s/indication/indicating/

> > to 0, until the driver re-initializes the device."
> >=20
> > ? =20
>=20
> Getting better, but IMHO not perfect. Process queue buffers is a bit
> vague IMHO. Even examining (reading) the ring(s) is taboo in my opinion,
> and I'm not sure that is unambiguously covered by 'process queue
> buffers'. In my opinion after a successful reset, the driver is
> entitled to even hot-unplug the ram that used to host the queues,
> notifier bits, etc.

"interact with the queues", maybe?

>=20
> All this said, I believe the v3 is already a significant improvement,
> and the virtio spec ain't the most formal and painfully precise
> specification anyway. So if you don't feel like polishing this even
> further.
>=20
> Reviewed-by: Halil Pasic <pasic@linux.ibm.com>

Thanks!

I guess I'll send a v4 containing the changes outlined above.

@all: anything else I should consider?


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

