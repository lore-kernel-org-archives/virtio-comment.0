Return-Path: virtio-comment-return-1611-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F80A986382
	for <virtio-comment@lists.oasis-open.org>; Tue, 29 Dec 2020 13:35:20 +0000 (UTC)
Date: Tue, 29 Dec 2020 14:35:11 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20201229143511.403fdefd.pasic@linux.ibm.com>
In-Reply-To: <30369ca4-6621-ea70-abbf-01c62666044b@redhat.com>
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
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, 28 Dec 2020 15:01:57 +0800
Jason Wang <jasowang@redhat.com> wrote:

> Some part of the virtio has enforced an asynchronous interface during res=
et:
>=20
> For MMIO the spec said:
>=20
> """
>=20
> To stop using the queue the driver MUST write zero (0x0) to this=20
> QueueReady and MUST read the value back to ensure synchronization.
>=20
> """

I read the MMIO quote like a single read is sufficient to ensure
synchronization. I.e. it does not require a loop which waits for
the read to yield the expected value.

>=20
> For PCI it said:
>=20
> """
>=20
> After writing 0 to device_status, the driver MUST wait for a read of=20
> device_status to return 0 before reinitializing the device.
>=20
> """

Yes, this does sound like a loop. And that's what Linux does. But this
is transport (PCI) specific. On a spec level, a reset is a distinct
operation from setting device status (to 0). It just happens to be
mapped to the PCI transport as setting the status to 0.

For the channel IO transport it is mapped via CCW_CMD_VDEV_RESET while
setting the status is mapped via CCW_CMD_WRITE_STATUS.

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

