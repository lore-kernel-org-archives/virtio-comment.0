Return-Path: virtio-comment-return-1581-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6C0BA985E84
	for <virtio-comment@lists.oasis-open.org>; Tue, 22 Dec 2020 06:50:19 +0000 (UTC)
Date: Tue, 22 Dec 2020 07:50:05 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20201222075005.69d1cc6e.pasic@linux.ibm.com>
In-Reply-To: <bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
References: <20201218042302.8884-1-jasowang@redhat.com>
	<20201221223338.7b5a21e6.pasic@linux.ibm.com>
	<bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: stefanha@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, 22 Dec 2020 10:36:41 +0800
Jason Wang <jasowang@redhat.com> wrote:

>=20
> On 2020/12/22 =E4=B8=8A=E5=8D=885:33, Halil Pasic wrote:
> > On Fri, 18 Dec 2020 12:23:02 +0800
> > Jason Wang <jasowang@redhat.com> wrote:
> >
> >> This patch introduces a new status bit DEVICE_STOPPED. This will be
> >> used by the driver to stop and resume a device. The main user will be
> >> live migration support for virtio device.
> >>
> > Can you please provide some more background information, or point
> > me to the appropriate discussion?
> >
> > I mean AFAIK migration already works without this driver initiated
> > drain. What is the exact motivation? What about the big picture? I
> > guess some agent in the guest would have to make the driver issue
> > the DEVICE_STOP.
>=20
>=20
> This is not necessary if the datapath is done inside qemu and when=20
> migration is initiated by qemu itself.
>=20
> But it's a must for using virtio-device as a backend for emulated virtio=
=20
> devices (e.g vhost-vDPA). In this case, qemu needs to stop the device=20
> then it can safely synchronize the state from them.
>=20

You say, in this case qemu needs to stop the device, which makes sense
(it also has to do this when the datapath is implemented in qemu), but
AFAIU DEVICE_STOPPED is initiated by the guest and not by qemu. I'm
confused.

I'm still curious about how the different components in the stack
(guest OS, qemu, vdpa-vhost in host kernel, the PCI function) are
supposed to interact.


>=20
> >
> >> Signed-off-by: Jason Wang <jasowang@redhat.com>
> >> ---
> >>   content.tex | 26 ++++++++++++++++++++++++--
> >>   1 file changed, 24 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/content.tex b/content.tex
> >> index 61eab41..4392b60 100644
> >> --- a/content.tex
> >> +++ b/content.tex
> >> @@ -47,6 +47,9 @@ \section{\field{Device Status} Field}\label{sec:Basi=
c Facilities of a Virtio Dev
> >>   \item[DRIVER_OK (4)] Indicates that the driver is set up and ready t=
o
> >>     drive the device.
> >>  =20
> >> +\item[DEVICE_STOPPED (32)] When VIRTIO_F_DEVICE_STOPPED is negotiated=
,
> >> +  indicates that the device has been stopped by the driver.
> >> +
> > AFAIU it is not only about indicating stopped, but also requesting to b=
e
> > stopped.
> >
> > More importantly, that must not be set immediately, in a sense that the
> > one side initiates some action by requesting the bit to be set, and the
> > other side must not set the bit before the action is performed.
>=20
>=20
> Yes.
>=20
>=20
> > We also
> > seem to assume that every device implementation is capable of performin=
g
> > this trick.
>=20
>=20
> A dedicated feature bit is introduced for this.
>

This is not about the feature bit, but about the mechanism. But your
subsequent answers explain, that this is nothing unusual, and then
we should be fine.
=20
>=20
> > Is it for hardware devices (e.g. PCI) standard to request an
> > operation by writing some value into a register, and get feedback bout
> > a non-completion by reading different value that written,
>=20
>=20
> This is not ununsal in other devices. And in fact, the FEATURES_OK works=
=20
> like this:
>=20
> """
>=20
> The device MUST NOT offer a feature which requires another feature which=
=20
> was not offered. The device SHOULD accept any valid subset of features=20
> the driver accepts, otherwise it MUST fail to set the FEATURES_OK device=
=20
> status bit when the driver writes it.
>=20
> """
>=20

Thanks for the pointer. I intend to have another look at how FEATURES_OK
works, and how similar this is to DEVICE_STOPPED.

> We've already had several hardware implementation of virtio-pci devices=
=20
> from different vendors. I didn't hear any complain about such kind of=20
> design.
>=20
>=20
> >   and about the
> > completion, by reading the same value as written?
>=20
>=20
> After after DEVICE_STOPPED is read from device the driver can assume the=
=20
> device is stopped.
>=20

How is whether the device has already stopped or is still in the middle
of stopping supposed/expected to affect the drivers behavior? Does the
driver actually care?

>=20
> >
> >
> >>   \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experie=
nced
> >>     an error from which it can't recover.
> >>   \end{description}
> >> @@ -58,8 +61,9 @@ \section{\field{Device Status} Field}\label{sec:Basi=
c Facilities of a Virtio Dev
> >>   \ref{sec:General Initialization And Device Operation / Device
> >>   Initialization}.
> >>   The driver MUST NOT clear a
> >> -\field{device status} bit.  If the driver sets the FAILED bit,
> >> -the driver MUST later reset the device before attempting to re-initia=
lize.
> >> +\field{device status} bit other than DEVICE_STOPPED.  If the
> >> +driver sets the FAILED bit, the driver MUST later reset the device
> >> +before attempting to re-initialize.
> >>  =20
> >>   The driver SHOULD NOT rely on completion of operations of a
> >>   device if DEVICE_NEEDS_RESET is set.
> >> @@ -70,12 +74,28 @@ \section{\field{Device Status} Field}\label{sec:Ba=
sic Facilities of a Virtio Dev
> >>   recover by issuing a reset.
> >>   \end{note}
> >>  =20
> >> +The driver MUST NOT set or clear DEVICE_STOPPED when DRIVER_OK is not
> >> +set. In order to stop the device, the driver MUST set DEVICE_STOPPED
> >> +first and re-read status to check whether DEVICE_STOPPED is set by th=
e
> >> +device. In order to resume the device, the driver MUST clear
> >> +DEVICE_STOPPED first and read status to ensure whether DEVICE_STOPPED
> >> +is cleared by the device.
> >> +
> >>   \devicenormative{\subsection}{Device Status Field}{Basic Facilities =
of a Virtio Device / Device Status Field}
> >>   The device MUST initialize \field{device status} to 0 upon reset.
> >>  =20
> >>   The device MUST NOT consume buffers or send any used buffer
> >>   notifications to the driver before DRIVER_OK.
> >>  =20
> >> +The device MUST ignore DEVICE_STOPPED when DRIVER_OK is not set.
> >> +
> >> +When driver is trying to set DEVICE_STOPPED, the device MUST not
> > The when driver trying to set DEVICE_STOPPED is a bit soft as a
> > duration. For example consider virtio-ccw, at the moment when the drive=
r
> > issues the ssch to set status, the device still does not know about it.
>=20
>=20
> I need more context on this, if it works like this, when or how can=20
> device know the status has been changed? (E.g how reset or other status=
=20
> bit is supposed to work?)

I think we have a misunderstanding here. The device  will eventually
learn about the drivers request to write the status, it is just not
instantaneous. It is like when you turn the light switch on, it takes
some amount of time for the current to reach the lightbulb.=20

>=20
> It looks like a transport limitation if we can't guarantee this. Similar=
=20
> issue were met in the PCIE Endpoint device, but it can be workaround by=
=20
> designing a new transport.
>=20

I don't think we have a problem with virtio-ccw here.

>=20
> >
> >> +process new avail requests and MUST complete all requests that is
> >> +currently processing before setting DEVICE_STOPPED.
> > I would like to have a more precise definition of 'new avail requests'
> > and 'requests that is currently processing'.
>=20
>=20
> Good point. How about something like:
>=20
> The device MUST stop reading requests from descriptor area or driver=20
> area and MUST complete all in flight requests before setting DEVICE_STOPP=
ED.
>=20
> To be 100% accurate, it looks to me we need to mention device=20
> implementation internals or pseudo code. I start with "in flight" but=20
> Stefan wants a more accurate one. Reading the spec I found "in flight"=20
> has been used in:
>=20
> """
>=20
> The driver SHOULD NOT rely on completion of operations of a device if=20
> DEVICE_NEEDS_RESET is set. Note: For example, the driver can=E2=80=99t as=
sume=20
> requests in flight will be completed if DEVICE_NEEDS_RESET is set, nor=20
> can it assume that they have not been completed. A good implementation=20
> will try to recover by issuing a reset.
>=20
> """
>

My problem is, that one can look at this from the drivers or from the
devices perspective. From the drivers perspective, every buffer that has
been made available but haven't been marked as used, is essentially a
request in flight.

From the device perspective, and probably from migration perspective, the
in-flight requests are those that were submitted to some kind of a
backend. I.e. available requests that are just sitting on the queue, but
weren't  submitted to the backend, can sit around, and get submitted
after the migration. It seems that what we want is the following: while
the DEVICE_STOPPED is set, there are no requests in the backend (i.e.
all requests submitted prior have completed, and no more request are
submitted to it).

BTW how about s/stop/drain? I think drain has more of this 'finish
what you are doing' while stop can be 'stop in the middle of it, whatever
you are doing'.

>=20
> So we are probably fine.=C2=A0 Any idea or suggestion are more than welco=
med.
>=20
>=20

I will think about it some more.

> >
> >> +
> >> +The device MUST keep the config space unchanged when DEVICE_STOPPED i=
s
> >> +set.
> > Here you have the set by driver which is actually requesting the stop
> > operation, and set by device which indicted that the stop operation
> > was successfully performed by the device.
>=20
>=20
> Exactly.
>=20
> Thanks
>=20

Thank you for all the exlanations!

Regards,
Halil

[..]

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

