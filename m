Return-Path: virtio-comment-return-1765-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 42DF9985E23
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Mar 2021 03:47:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 22 Mar 2021 11:47:15 +0800
Message-Id: <20210322034717.35135-1-jasowang@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH V2 0/2] Introduce VIRTIO_F_QUEUE_STATE
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
To: mst@redhat.com, virtio-comment@lists.oasis-open.org
Cc: eperezma@redhat.com, lulu@redhat.com, rob.miller@broadcom.com, pasic@linux.ibm.com, sgarzare@redhat.com, cohuck@redhat.com, jim.harford@broadcom.com, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi All:

This is a new version to support VIRTIO_F_QUEUE_STATE. The feautre
extends the basic facility to allow the driver to set and get device
internal virtqueue state. This main motivation is to support live
migration of virtio devices.

Please review.

Changes since V1:
- Introduce a dedicated part in the basic facility to describe the
  virtqueue state.
- Split the state into avail state and used state, use two le16
  isntead of a single u64 in the PCI implementation.

Thanks

Jason Wang (2):
  virtio: introduce virtqueue state as basic facility
  virtio-pci: implement VIRTIO_F_QUEUE_STATE

 content.tex | 93 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

--=20
2.24.3 (Apple Git-128)


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

