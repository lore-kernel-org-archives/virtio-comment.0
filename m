Return-Path: virtio-comment-return-1584-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 01230985EA2
	for <virtio-comment@lists.oasis-open.org>; Tue, 22 Dec 2020 12:14:22 +0000 (UTC)
Date: Tue, 22 Dec 2020 13:14:04 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20201222131404.61e4a136.cohuck@redhat.com>
In-Reply-To: <ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
References: <20201218042302.8884-1-jasowang@redhat.com>
	<20201221223338.7b5a21e6.pasic@linux.ibm.com>
	<bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
	<20201222075005.69d1cc6e.pasic@linux.ibm.com>
	<ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, 22 Dec 2020 15:30:31 +0800
Jason Wang <jasowang@redhat.com> wrote:

> On 2020/12/22 =E4=B8=8B=E5=8D=882:50, Halil Pasic wrote:
> > On Tue, 22 Dec 2020 10:36:41 +0800
> > Jason Wang <jasowang@redhat.com> wrote:
> > =20
> >> On 2020/12/22 =E4=B8=8A=E5=8D=885:33, Halil Pasic wrote: =20
> >>> On Fri, 18 Dec 2020 12:23:02 +0800
> >>> Jason Wang <jasowang@redhat.com> wrote:
> >>> =20
> >>>> This patch introduces a new status bit DEVICE_STOPPED. This will be
> >>>> used by the driver to stop and resume a device. The main user will b=
e
> >>>> live migration support for virtio device.
> >>>> =20
> >>> Can you please provide some more background information, or point
> >>> me to the appropriate discussion?
> >>>
> >>> I mean AFAIK migration already works without this driver initiated
> >>> drain. What is the exact motivation? What about the big picture? I
> >>> guess some agent in the guest would have to make the driver issue
> >>> the DEVICE_STOP. =20
> >>
> >> This is not necessary if the datapath is done inside qemu and when
> >> migration is initiated by qemu itself.
> >>
> >> But it's a must for using virtio-device as a backend for emulated virt=
io
> >> devices (e.g vhost-vDPA). In this case, qemu needs to stop the device
> >> then it can safely synchronize the state from them.
> >> =20
> > You say, in this case qemu needs to stop the device, which makes sense
> > (it also has to do this when the datapath is implemented in qemu), but
> > AFAIU DEVICE_STOPPED is initiated by the guest and not by qemu. I'm
> > confused. =20
>=20
>=20
> It's initiated by Qemu. Guest is unware of live migration.

But isn't setting DEVICE_STOPPED a _driver_ initiated process? That
sounds like "guest" to me.

>=20
>=20
> >
> > I'm still curious about how the different components in the stack
> > (guest OS, qemu, vdpa-vhost in host kernel, the PCI function) are
> > supposed to interact. =20
>=20
>=20
> It works like:
>=20
>  From Qemu point of view, vhost-vDPA is just another type of vhost=20
> backend. Qemu needs to stop virtio (vhost) before it can do migration.=20
> So we require vDPA devices to have the ability of stopping or pausing=20
> its datapath. If the vDPA device is by chance the virtio-PCI device, it=
=20
> needs an interface for receiving stop/resume command from the driver.
>=20
> So the devce stop/resume command was sent from Qemu to vhost-VDPA, then=
=20
> to vDPA parent which could be a virtio-PCI device in this case.

But QEMU implements the _device_, not the driver, doesn't it? And IIUC,
vhost-VDPA and the vDPA parent are also on the device side. I feel like
I'm missing something essential here.

>=20
>=20
> > =20
> >>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
> >>>> ---
> >>>>    content.tex | 26 ++++++++++++++++++++++++--
> >>>>    1 file changed, 24 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/content.tex b/content.tex
> >>>> index 61eab41..4392b60 100644
> >>>> --- a/content.tex
> >>>> +++ b/content.tex
> >>>> @@ -47,6 +47,9 @@ \section{\field{Device Status} Field}\label{sec:Ba=
sic Facilities of a Virtio Dev
> >>>>    \item[DRIVER_OK (4)] Indicates that the driver is set up and read=
y to
> >>>>      drive the device.
> >>>>   =20
> >>>> +\item[DEVICE_STOPPED (32)] When VIRTIO_F_DEVICE_STOPPED is negotiat=
ed,
> >>>> +  indicates that the device has been stopped by the driver.
> >>>> + =20
> >>> AFAIU it is not only about indicating stopped, but also requesting to=
 be
> >>> stopped.
> >>>
> >>> More importantly, that must not be set immediately, in a sense that t=
he
> >>> one side initiates some action by requesting the bit to be set, and t=
he
> >>> other side must not set the bit before the action is performed. =20
> >>
> >> Yes.
> >>
> >> =20
> >>> We also
> >>> seem to assume that every device implementation is capable of perform=
ing
> >>> this trick. =20
> >>
> >> A dedicated feature bit is introduced for this.
> >> =20
> > This is not about the feature bit, but about the mechanism. But your
> > subsequent answers explain, that this is nothing unusual, and then
> > we should be fine.
> >    =20
> >>> Is it for hardware devices (e.g. PCI) standard to request an
> >>> operation by writing some value into a register, and get feedback bou=
t
> >>> a non-completion by reading different value that written, =20
> >>
> >> This is not ununsal in other devices. And in fact, the FEATURES_OK wor=
ks
> >> like this:
> >>
> >> """
> >>
> >> The device MUST NOT offer a feature which requires another feature whi=
ch
> >> was not offered. The device SHOULD accept any valid subset of features
> >> the driver accepts, otherwise it MUST fail to set the FEATURES_OK devi=
ce
> >> status bit when the driver writes it.
> >>
> >> """
> >> =20
> > Thanks for the pointer. I intend to have another look at how FEATURES_O=
K
> > works, and how similar this is to DEVICE_STOPPED. =20
>=20
>=20
> My understanding is that for both of them, driver can try to set the bit=
=20
> by writing to the status register but it's the device that decide when=20
> to set the bit.

I think there's a difference: For FEATURES_OK, the driver can read back
the status and knows that the feature combination is not accepted if it
is not set. For DEVICE_STOPPED, it does not really know whether the
device has started to stop yet. It only knows that the device is
actually done stopping when DEVICE_STOPPED is set.

Do we need a different mechanism for the device to signal the driver
that the device has actually been stopped? If the driver sees the
STOPPED status after reading back, it knows that the device has
acknowledged the request and is now stopping down. If it is not set, it
means that the device has not honoured the request. Same for clearing
it to resume.


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

