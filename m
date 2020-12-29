Return-Path: virtio-comment-return-1607-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5E2FA986382
	for <virtio-comment@lists.oasis-open.org>; Tue, 29 Dec 2020 08:58:24 +0000 (UTC)
Date: Tue, 29 Dec 2020 03:57:56 -0500 (EST)
From: Jason Wang <jasowang@redhat.com>
Message-ID: <439058870.40679654.1609232276702.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201228072034-mutt-send-email-mst@kernel.org>
References: <20201222075005.69d1cc6e.pasic@linux.ibm.com> <20201224055247.5f9ce79c.pasic@linux.ibm.com> <67271e1e-96ea-4b28-7449-cdb0641aff72@redhat.com> <20201225041811.33dbbd4b.pasic@linux.ibm.com> <88f1134c-e1ca-e8e7-2fa6-9d6e1ca68d79@redhat.com> <20201227061119-mutt-send-email-mst@kernel.org> <f15c2348-48e1-412f-4ef9-0f96b79a87d4@redhat.com> <20201228072034-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>



----- Original Message -----
> On Mon, Dec 28, 2020 at 03:05:43PM +0800, Jason Wang wrote:
> >=20
> > On 2020/12/27 =E4=B8=8B=E5=8D=887:12, Michael S. Tsirkin wrote:
> > > On Fri, Dec 25, 2020 at 02:45:28PM +0800, Jason Wang wrote:
> > > > > I tend to say, that from a perspective of the driver, all request=
s
> > > > > that
> > > > > are available, and not yet used, are in-flight. So we have to be =
very
> > > > > careful when wording this requirement, to avoid misunderstandings=
. I
> > > > > don't think the first RFC is good enough. I will think some more
> > > > > about
> > > > > this.
> > > >=20
> > > > Yes, I agree. The problem is that the spec doesn't describe how dev=
ice
> > > > work,
> > > > so if we want to be more accurate, it might require some work not o=
nly
> > > > for
> > > > stop but also for e.g reset (something like in flight has been used=
 by
> > > > the
> > > > spec in that case).
> > > You probably mean the DEVICE_NEEDS_RESET description, right?
> > >=20
> > > =09For example, the driver can't assume requests in flight will be
> > > =09completed if DEVICE_NEEDS_RESET is set, nor can it assume that
> > > =09they have not been completed.  A good implementation will try to
> > > =09recover by issuing a reset.
> > >=20
> > > yes, DEVICE_NEEDS_RESET is unfortunately underspecified which likely
> > > is related to the fact it is not widely implemented.
> >=20
> >=20
> > For both NEEDS_RESET and device reset.
> >=20
> > For NEEDS_RESET, we use "in flight" and "completed" without an actual
> > definition.
> >=20
> > For device reset, we don't even define what is the device expected (e.g=
 how
> > are "in flight" requests expected to be processed) to behave.
> >=20
> > Thanks
>=20
> Because device is expected to just stop:
>=20
> =09None of the virtqueues
> =09of a device are live once the device has been reset.

So it's something similar to what DEVICE_STOPPED wants.

>=20
> and it's driver's job to recover buffers:
>=20
> =09Thus a driver MUST ensure a virtqueue isn't live (by device reset) bef=
ore
> =09removing exposed buffers.
>=20
> what happened to buffers which were not used?
>=20
> I think it's a quality of implementation/device specific issue, e.g. for =
net:
> for transmit, if device sends a packet without using the buffer,

This sounds like an intermediate state we need to avoid in the
migration. Can we mandate the device to make the buffer used in this
case? For networking device, it should be not slow, just wait for the
DMA to be completed is sufficient.

> then driver will resend the packet leading to duplicates.
> for receive, it's a packet drop, slightly less of a problem.

For net yes.

>=20
>=20
> my question is whether such behaviour is sufficient for migration?

I suspect it's not, we need to either

1) wait for the buffer to be used

or=20

2) fail the migration if the device is not stopped in a short time

> if not can we really describe it generally?

It looks like a virtqueue level issue, so we need to try.

> it's possible we need to
> describe it per device type.

Maybe.

Thanks

>=20
> --
> MST
>=20
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>=20
>=20


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

