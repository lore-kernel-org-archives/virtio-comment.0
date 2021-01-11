Return-Path: virtio-comment-return-1627-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E21CF985DC3
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Jan 2021 18:16:23 +0000 (UTC)
Date: Mon, 11 Jan 2021 19:16:09 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210111191609.50fa58f7.cohuck@redhat.com>
In-Reply-To: <dd36fe91-1dc0-6998-4e2a-0f9a8ae47bdf@redhat.com>
References: <20201218042302.8884-1-jasowang@redhat.com>
	<20201221223338.7b5a21e6.pasic@linux.ibm.com>
	<bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
	<20201222075005.69d1cc6e.pasic@linux.ibm.com>
	<ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
	<20201222131404.61e4a136.cohuck@redhat.com>
	<7da54d5b-0787-c78f-4b35-6a4f7ed2f5bf@redhat.com>
	<20201222165431.3f49de29.cohuck@redhat.com>
	<3cf88dc9-4053-0f24-854f-6cc6df2aaac4@redhat.com>
	<20201225083835.62efb230.pasic@linux.ibm.com>
	<20201227044431-mutt-send-email-mst@kernel.org>
	<20201228072104.08339352.pasic@linux.ibm.com>
	<30369ca4-6621-ea70-abbf-01c62666044b@redhat.com>
	<20201229143511.403fdefd.pasic@linux.ibm.com>
	<dd36fe91-1dc0-6998-4e2a-0f9a8ae47bdf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, 30 Dec 2020 16:15:47 +0800
Jason Wang <jasowang@redhat.com> wrote:

> On 2020/12/29 =E4=B8=8B=E5=8D=889:35, Halil Pasic wrote:
> > On Mon, 28 Dec 2020 15:01:57 +0800
> > Jason Wang <jasowang@redhat.com> wrote:
> > =20
> >> Some part of the virtio has enforced an asynchronous interface during =
reset:
> >>
> >> For MMIO the spec said:
> >>
> >> """
> >>
> >> To stop using the queue the driver MUST write zero (0x0) to this
> >> QueueReady and MUST read the value back to ensure synchronization.
> >>
> >> """ =20
> > I read the MMIO quote like a single read is sufficient to ensure
> > synchronization. I.e. it does not require a loop which waits for
> > the read to yield the expected value.
> > =20
> >> For PCI it said:
> >>
> >> """
> >>
> >> After writing 0 to device_status, the driver MUST wait for a read of
> >> device_status to return 0 before reinitializing the device.
> >>
> >> """ =20
> > Yes, this does sound like a loop. And that's what Linux does. But this
> > is transport (PCI) specific. On a spec level, a reset is a distinct
> > operation from setting device status (to 0). =20
>=20
>=20
> I'm not sure or it looks unclear to me for this point.
>=20
> E.g the device reset is mentioned in "Device Status Field" belongs to=20
> "Basic Facilities of a Virtio Device". But there's no "Device Reset" in=
=20
> "Basic Facilities of a Virtio Device".

I think it should be, just to make clear what a driver-initiated reset
of a device actually resets (and that the method for doing so is
transport-specific.)

>=20
>=20
> > It just happens to be
> > mapped to the PCI transport as setting the status to 0. =20
>=20
>=20
> MMIO did the same. And it makes sense since using a single API to=20
> configure/change device status looks simpler.
>=20
>=20
> >
> > For the channel IO transport it is mapped via CCW_CMD_VDEV_RESET while
> > setting the status is mapped via CCW_CMD_WRITE_STATUS. =20
>=20
>=20
> Yes, but I think actually there's no limitation if we want to tread 0 as=
=20
> a reset command for CCW_CMD_WRITE_STATUS.

I'm not a fan of the "driver writes 0 to status to initiate a device
reset" method, but we are stuck with it. I think it's actually not
working well with two other requirements in the spec:

- "The driver MUST NOT clear a device status bit."
- "The device MUST initialize device status to 0 upon reset." (This
  suggests to me that a zero status is something set by the device as
  the result of a reset request by the driver, and _not_ set by the
  driver.)

Also, treating CCW_CMD_WRITE_STATUS with 0 as a reset request would be
incompatible with older devices, wouldn't it?


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

