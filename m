Return-Path: virtio-comment-return-1859-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 27D37986060
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 May 2021 18:33:05 +0000 (UTC)
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Date: Mon, 24 May 2021 21:32:29 +0300
Message-ID: <20210524183232.2513690-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v6 0/2] virtio-vsock: introduce SOCK_SEQPACKET description
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Arseny Krasnov <arseny.krasnov@kaspersky.com>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Andra Paraschiv <andraprs@amazon.com>
Cc: virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

This adds description of SOCK_SEQPACKET type for virtio-vsock.

Here is latest RFC implementation for Linux, with more details:

https://lkml.org/lkml/2021/5/20/2386

Also this patchset has patch which replaces enums to defines in
virtio-vsock part of spec. SOCK_SEQPACKET patch is based on it.

 Arseny Krasnov(2):
  virtio-vsock: use C style defines for constants
  virtio-vsock: SOCK_SEQPACKET description

 virtio-vsock.tex | 74 ++++++++++++++++++++++++++++------------------
 1 file changed, 46 insertions(+), 28 deletions(-)

--=20
2.25.1


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

