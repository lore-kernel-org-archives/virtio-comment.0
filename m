Return-Path: virtio-comment-return-1594-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 68C6B986202
	for <virtio-comment@lists.oasis-open.org>; Fri, 25 Dec 2020 03:18:23 +0000 (UTC)
Date: Fri, 25 Dec 2020 04:18:11 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20201225041811.33dbbd4b.pasic@linux.ibm.com>
In-Reply-To: <67271e1e-96ea-4b28-7449-cdb0641aff72@redhat.com>
References: <20201218042302.8884-1-jasowang@redhat.com>
	<20201221223338.7b5a21e6.pasic@linux.ibm.com>
	<bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
	<20201222075005.69d1cc6e.pasic@linux.ibm.com>
	<ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
	<20201222131404.61e4a136.cohuck@redhat.com>
	<7da54d5b-0787-c78f-4b35-6a4f7ed2f5bf@redhat.com>
	<20201224055247.5f9ce79c.pasic@linux.ibm.com>
	<67271e1e-96ea-4b28-7449-cdb0641aff72@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, 24 Dec 2020 13:51:31 +0800
Jason Wang <jasowang@redhat.com> wrote:

>=20
> On 2020/12/24 =E4=B8=8B=E5=8D=8812:52, Halil Pasic wrote:
> > On Tue, 22 Dec 2020 20:51:04 +0800
> > Jason Wang <jasowang@redhat.com> wrote:
> >
[..]
>=20
> Each vhost devices implements its own ioctl:
>=20
> For vhost-net, it's VHOST_NET_SET_BACKEND, passing -1 as socket fd will=
=20
> stop the device.
> For vhost-vsock, it's VHOST_VSOCK_SET_RUNNING.
>=20
> I don't check SCSI but it should have something similar.
>=20

Thanks!

>=20
> >
> > And since we are at virtio-net,
>=20
>=20
> The feature is not net specific.
>=20

Nod.

>=20
> > I ask myself how are 'new requests' and
> > 'requests that is (the device) currently processing' defined for the
> > receive functionality and the rx queue(s).  Remember the latter ('in
> > flight requests') need to be all completed. I mean 'in-flight' is prett=
y
> > straight-forward for something like virtio-blk, or even for tx but I ha=
ve
> > a hard time with rx.
>=20
>=20
> I think it should be no difference from the view of virtqueue. It's the=
=20
> requests that have been read from avail ring but not added to the used ri=
ng.
>=20
> Actually this ties to the visibility of virtqueue internal state.=20
> Usually device maintains a tail pointer (last_avail_idx).=C2=A0 So in the=
=20
> simplest case when no indices wrap and no out-of-order, requests belongs=
=20
> to [last_avail_idx, used_idx) are considered as in-flight.
>=20

I wouldn't call it virtqueue internal state, but I get what you mean. The
virtio specification is concerned with the device/driver interface. The
driver does not and can not differentiate between buffers that are
available but "haven't been read from avail ring", and those that have
"been read from the avail ring". As you said last_avail_idx is a device
private thing -- a device internal state.=20

I tend to say, that from a perspective of the driver, all requests that
are available, and not yet used, are in-flight. So we have to be very
careful when wording this requirement, to avoid misunderstandings. I
don't think the first RFC is good enough. I will think some more about
this. I'm under the impression that considering virtio console (serial)
could be useful, as it provides a reliable duplex data transfer. I.e.
some I/O is not driver initiated, but dropping packets ain't OK. So, the
data may be in flight without the virtqueue buffer being in flight
according to our latest definition ([last_avail_idx, used_idx)).

Sorry, I have the feeling I'm spouting out half baked thoughts. Thank you
for bearing with me.

>=20
> >
> >>> And IIUC,
> >>> vhost-VDPA and the vDPA parent are also on the device side. I feel li=
ke
> >>> I'm missing something essential here.
> >>
> >> Virtio-PCI driver could be a vDPA parent as well in this case. So we
> >> need stop the virtio-pci device.
> > I used to think about vdpa like a vehicle to make partial virtio suppor=
t
> > in HW viable and easy. I.e. when I hear vdpa I have something like this
> > in mind:
> > https://www.redhat.com/cms/managed-files/2019-10-02-vdpa-figure5.jpg
> >
> > Of course the 'physical nic' from the linked picture can be a nic that
> > supports both the virtio data plane and the virtio control plane (i.e.
> > what you are referring to as a virtio-pci device). But do we still expe=
ct
> > that device to be connected via vdpa?
>=20
>=20
> Why not?[1] With the help of vhost-vDPA, we get the wire speed and live=
=20
> migration support for virtio-pci device.

Indeed.

>=20
>=20
> >
> > The second question is not strictly on topic, but I'm still curious, wh=
at
> > do we plan to do with a lower device that does not support virtio contr=
ol
> > plane?
>=20
>=20
> Yes, the vDPA device just need to implement the same semantic not the=20
> same interface. You may refer mlx5e vDPA driver in the kernel source.

Thanks! I will have a look.

Regards,
Halil

[..]

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

