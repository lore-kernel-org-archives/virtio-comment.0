Return-Path: virtio-comment-return-1590-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2C348986113
	for <virtio-comment@lists.oasis-open.org>; Thu, 24 Dec 2020 04:53:00 +0000 (UTC)
Date: Thu, 24 Dec 2020 05:52:47 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20201224055247.5f9ce79c.pasic@linux.ibm.com>
In-Reply-To: <7da54d5b-0787-c78f-4b35-6a4f7ed2f5bf@redhat.com>
References: <20201218042302.8884-1-jasowang@redhat.com>
	<20201221223338.7b5a21e6.pasic@linux.ibm.com>
	<bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
	<20201222075005.69d1cc6e.pasic@linux.ibm.com>
	<ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
	<20201222131404.61e4a136.cohuck@redhat.com>
	<7da54d5b-0787-c78f-4b35-6a4f7ed2f5bf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, 22 Dec 2020 20:51:04 +0800
Jason Wang <jasowang@redhat.com> wrote:

> >>   From Qemu point of view, vhost-vDPA is just another type of vhost
> >> backend. Qemu needs to stop virtio (vhost) before it can do migration.
> >> So we require vDPA devices to have the ability of stopping or pausing
> >> its datapath. If the vDPA device is by chance the virtio-PCI device, i=
t
> >> needs an interface for receiving stop/resume command from the driver.
> >>
> >> So the devce stop/resume command was sent from Qemu to vhost-VDPA, the=
n
> >> to vDPA parent which could be a virtio-PCI device in this case. =20
> > But QEMU implements the _device_, not the driver, doesn't it? =20
>=20
>=20
> The device is implemented with the co-operation between Qemu and=20
> vhost-vDPA. During migration qemu need to stop the virtio-net device,=20
> then vhost must be stopped as well.
>=20

Sorry for the lazy/stupid question (it's been a while since I last
understood that code), how does this work with vhost based virtio-net?

I don't see ioctl that stops the old classic vhost (no vdpa). I have
a fuzzy remembrance that we 'stop' the notifiers (ioeventfd & irqfd) but
I'm not sure.

And since we are at virtio-net, I ask myself how are 'new requests' and
'requests that is (the device) currently processing' defined for the
receive functionality and the rx queue(s).  Remember the latter ('in
flight requests') need to be all completed. I mean 'in-flight' is pretty
straight-forward for something like virtio-blk, or even for tx but I have
a hard time with rx.

>=20
> > And IIUC,
> > vhost-VDPA and the vDPA parent are also on the device side. I feel like
> > I'm missing something essential here. =20
>=20
>=20
> Virtio-PCI driver could be a vDPA parent as well in this case. So we=20
> need stop the virtio-pci device.

I used to think about vdpa like a vehicle to make partial virtio support
in HW viable and easy. I.e. when I hear vdpa I have something like this
in mind:
https://www.redhat.com/cms/managed-files/2019-10-02-vdpa-figure5.jpg

Of course the 'physical nic' from the linked picture can be a nic that
supports both the virtio data plane and the virtio control plane (i.e.
what you are referring to as a virtio-pci device). But do we still expect
that device to be connected via vdpa?

The second question is not strictly on topic, but I'm still curious, what
do we plan to do with a lower device that does not support virtio control
plane? In that case we can't go via DEVICE_STOP. Does that mean, there
has to be a vendor specific mechanism equivalent to the DEVICE_STOP
mechanism, or otherwise we are non-migratable?

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

