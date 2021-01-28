Return-Path: virtio-comment-return-1691-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 13579986579
	for <virtio-comment@lists.oasis-open.org>; Thu, 28 Jan 2021 08:10:52 +0000 (UTC)
Date: Thu, 28 Jan 2021 09:06:32 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20210128090632.67221e13.pasic@linux.ibm.com>
In-Reply-To: <20210127181411.15046e12.cohuck@redhat.com>
References: <20210125110823.591104-1-cohuck@redhat.com>
	<20210127101904.326d5295.pasic@linux.ibm.com>
	<20210127124403.71e5e4e1.cohuck@redhat.com>
	<20210127144857.45f2b337.pasic@linux.ibm.com>
	<20210127181411.15046e12.cohuck@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v3] clarify device reset
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, 27 Jan 2021 18:14:11 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed, 27 Jan 2021 14:48:57 +0100
> Halil Pasic <pasic@linux.ibm.com> wrote:
>=20
> > On Wed, 27 Jan 2021 12:44:03 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >  =20
> > > On Wed, 27 Jan 2021 10:19:04 +0100
> > > Halil Pasic <pasic@linux.ibm.com> wrote:
> > >    =20
> > > > On Mon, 25 Jan 2021 12:08:23 +0100
> > > > Cornelia Huck <cohuck@redhat.com> wrote: =20
>=20
> > > > > +\section{Device
> > > > > Reset}\label{sec:Basic Facilities of a Virtio Device / Device
> > > > > Reset} + +The driver may initiate a device reset at various times=
;
> > > > > notably, during +device initialization and device cleanup.       =
=20
> > > >=20
> > > > Are there times the driver may not initiate a device reset? What ar=
e
> > > > we trying to tell with this sentence?     =20
> > >=20
> > > s/may initiate/may want to initiate/   =20
> >=20
> > Definitively better. I would still prefer avoiding the discussion
> > on when the driver may want to reset the device. But I can live
> > with this. =20
>=20
> The driver is free to reset the device whenever it wants to, even if it
> does not make sense. Device initialization and cleanup are examples for
> when it definitely will do so.
>=20

For device initialization and for cleanup is actually a MUST,
and not a simple may want to. And that is properly specified in 3.1.1
and 3.3.1 respectively.

I would actually advice against resetting the device when device status
is still 0, and especially if we expect it to change to ACKNOWLEDGE,
because we just asked the device to set that bit. Why? Because I assume
we could read the old 0 and assume the reset was performed.
=20

> >  =20
> > >    =20
> > > >=20
> > > > If we are just looking for an introductionary sentence, I would
> > > > probably go with something like "A device reset be either initiated
> > > > by the   =20
> >=20
> > s/be/can be/
> >  =20
> > > > driver, or by a system reset, or other external controls."     =20
> > >=20
> > > It was mostly supposed to be a lead-in.
> > >=20
> > > I'm not sure we want to spell out things like system resets. They are
> > > platform-specific, and virtio devices are basically just a device
> > > there.   =20
> >=20
> > Hm. AFAIR the only way to make the device non-live, i.e. illegal for it=
=20
> > to e.g. access a queue, which is in guest memory is device reset. Now i=
f
> > I want to perform a reboot, I do want to stop the devices from poking
> > such memory. But I think, in linux we don't reset the device form the
> > driver, before reboot, and I believe we don't have to because we are
> > guaranteed that the device will get reset. Or is my memory failing me?
> >=20
> > I think it is of value to clarify that a virtio reset can possibly be
> > initiated by other means than explicitly specified by the virtio spec,
> > and that when a 'proxy-device' is reset, the 'virtio-device' is to be
> > reset as well. We do mention system reset once, in a normative section
> > at that (2.2.2). =20
>=20
> That section looks a bit questionable (what is 'resuming from suspend'?).
>=20

I have no problems with that sections, and I think it is very
reasonable. You can think of 'resuming form suspend' like 'resuming from
suspend-to-disk' or from 'virsh save'. I.e. a situation where the device
has (probably) lost power and thus needs a (complete) re-initialization,
but we are supposed to preserve some continuity (e.g. if ACCESS_PLATFORM
was negotiable, it should still be negotiable).

> Platforms may have different definitions of what a system reset does
> (and even different types of reset). I think it is reasonable to assume
> that any platform/system reset that brings devices into some kind of
> initial state also brings virtio devices into that initial state (and
> especially that bringing the proxy device into an initial state also
> covers the virtio-specific parts.)
>=20

In an ideal world, after reading the spec, one should have to ponder if
something is reasonable to assume or not.

I agree, platforms (e.g. s390, ppc) may have different definitions and
different flavors of resets, and the situation is similar for the
transports (e.g. PCI, CCW). And the very same device may be used on
different platforms.=20

For PCIe there is something called a Function Level Reset.=20

The relationship between the different resets ain't trivial to me. E.g.
when we say 'reset the device' we actually mean 'reset the virtio
aspect of the device', and not the 'entire device'. E.g.
CCW_CMD_VDEV_RESET does not reset the ccw-device.

[..]

> > > >=20
> > > > Maybe it is wiser to tie this restriction to the current status val=
ue
> > > > (without any after or before), and do it where the notifications ar=
e
> > > > described.=20
> > > >=20
> > > > Also a device that has status 0 may not poke the virtqueues. If we
> > > > are explicit about the notifications, we should be explicit about
> > > > the virtqueues as well.     =20
> > >=20
> > > What about
> > >=20
> > > "A device MUST NOT send notifications or process queue buffers after
> > > indication completion of the reset by reinitializing the device statu=
s =20
>=20
> s/indication/indicating/
>=20
> > > to 0, until the driver re-initializes the device."
> > >=20
> > > ?   =20
> >=20
> > Getting better, but IMHO not perfect. Process queue buffers is a bit
> > vague IMHO. Even examining (reading) the ring(s) is taboo in my opinion=
,
> > and I'm not sure that is unambiguously covered by 'process queue
> > buffers'. In my opinion after a successful reset, the driver is
> > entitled to even hot-unplug the ram that used to host the queues,
> > notifier bits, etc. =20
>=20
> "interact with the queues", maybe?
>

Yes even better. Another thing to consider is behavior during the reset.
I think it could be beneficial to say that.

The device SHOULD NOT interact with the queues while performing the
reset.

If I'm not wrong there was some problem with secure execution, but I
don't remember what did we do about it. What I remember is that
virtio-blk interacted with the queue during the reset, which happened,
after the protection/encryption status of the memory backing the queues
changed.
=20
> >=20
> > All this said, I believe the v3 is already a significant improvement,
> > and the virtio spec ain't the most formal and painfully precise
> > specification anyway. So if you don't feel like polishing this even
> > further.
> >=20
> > Reviewed-by: Halil Pasic <pasic@linux.ibm.com> =20
>=20
> Thanks!
>=20
> I guess I'll send a v4 containing the changes outlined above.
>=20
> @all: anything else I should consider?
>=20



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

