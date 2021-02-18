Return-Path: virtio-comment-return-1724-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 79E649864B3
	for <virtio-comment@lists.oasis-open.org>; Thu, 18 Feb 2021 06:08:31 +0000 (UTC)
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Date: Thu, 18 Feb 2021 09:07:12 +0300
Message-ID: <20210218060715.1075547-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH v1 0/1] virtio-vsock: introduce SEQPACKET description
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Arseny Krasnov <arseny.krasnov@kaspersky.com>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Andra Paraschiv <andraprs@amazon.com>
Cc: virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

This patchset adds description of SOCK_SEQPACKET socket's type
of virtio vsock.

Here is implementation:
https://lkml.org/lkml/2021/2/18/24

 Arseny Krasnov(1):
  virtio-vsock: add SOCK_SEQPACKET description

 virtio-vsock.tex | 40 +++++++++++++++++++++++++++++++++++++---
 1 files changed, 37 insertions(+), 3 deletions(-)

TODO:
- for messages identification I use header's field called 'msg_cnt'.
  May be it is better to call it 'msg_id' or 'msg_num', because it
  is used as ID, but implemented as counter.

- in current version of specification, some values of headers' fields
  still unnamed, for example type of socket (stream or seqpacket), then
  shutdown flags. Spec says that for stream socket value of 'type'
  must be 1. For receive shutdown bit 0 is set in 'flags', for send
  shutdown bit 1 is set in 'flags'. But in Linux these unnamed ones and
  zeroes are implemented as enums, so may be it will be ok to add such
  enums in specification (as 'enum virtio_vsock_event_id').

Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>

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

