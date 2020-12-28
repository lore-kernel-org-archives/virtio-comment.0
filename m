Return-Path: virtio-comment-return-1605-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E1CCD98630D
	for <virtio-comment@lists.oasis-open.org>; Mon, 28 Dec 2020 12:27:33 +0000 (UTC)
Date: Mon, 28 Dec 2020 07:27:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20201228072034-mutt-send-email-mst@kernel.org>
References: <20201222075005.69d1cc6e.pasic@linux.ibm.com>
 <ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
 <20201222131404.61e4a136.cohuck@redhat.com>
 <7da54d5b-0787-c78f-4b35-6a4f7ed2f5bf@redhat.com>
 <20201224055247.5f9ce79c.pasic@linux.ibm.com>
 <67271e1e-96ea-4b28-7449-cdb0641aff72@redhat.com>
 <20201225041811.33dbbd4b.pasic@linux.ibm.com>
 <88f1134c-e1ca-e8e7-2fa6-9d6e1ca68d79@redhat.com>
 <20201227061119-mutt-send-email-mst@kernel.org>
 <f15c2348-48e1-412f-4ef9-0f96b79a87d4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f15c2348-48e1-412f-4ef9-0f96b79a87d4@redhat.com>
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Dec 28, 2020 at 03:05:43PM +0800, Jason Wang wrote:
>=20
> On 2020/12/27 =E4=B8=8B=E5=8D=887:12, Michael S. Tsirkin wrote:
> > On Fri, Dec 25, 2020 at 02:45:28PM +0800, Jason Wang wrote:
> > > > I tend to say, that from a perspective of the driver, all requests =
that
> > > > are available, and not yet used, are in-flight. So we have to be ve=
ry
> > > > careful when wording this requirement, to avoid misunderstandings. =
I
> > > > don't think the first RFC is good enough. I will think some more ab=
out
> > > > this.
> > >=20
> > > Yes, I agree. The problem is that the spec doesn't describe how devic=
e work,
> > > so if we want to be more accurate, it might require some work not onl=
y for
> > > stop but also for e.g reset (something like in flight has been used b=
y the
> > > spec in that case).
> > You probably mean the DEVICE_NEEDS_RESET description, right?
> >=20
> > =09For example, the driver can't assume requests in flight will be
> > =09completed if DEVICE_NEEDS_RESET is set, nor can it assume that
> > =09they have not been completed.  A good implementation will try to
> > =09recover by issuing a reset.
> >=20
> > yes, DEVICE_NEEDS_RESET is unfortunately underspecified which likely
> > is related to the fact it is not widely implemented.
>=20
>=20
> For both NEEDS_RESET and device reset.
>=20
> For NEEDS_RESET, we use "in flight" and "completed" without an actual
> definition.
>=20
> For device reset, we don't even define what is the device expected (e.g h=
ow
> are "in flight" requests expected to be processed) to behave.
>=20
> Thanks

Because device is expected to just stop:

=09None of the virtqueues
=09of a device are live once the device has been reset.

and it's driver's job to recover buffers:

=09Thus a driver MUST ensure a virtqueue isn't live (by device reset) befor=
e removing exposed buffers.

what happened to buffers which were not used?

I think it's a quality of implementation/device specific issue, e.g. for ne=
t:
for transmit, if device sends a packet without using the buffer,
then driver will resend the packet leading to duplicates.
for receive, it's a packet drop, slightly less of a problem.


my question is whether such behaviour is sufficient for migration?
if not can we really describe it generally? it's possible we need to
describe it per device type.

--=20
MST


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

