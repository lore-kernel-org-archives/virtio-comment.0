Return-Path: virtio-comment-return-1798-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DF6ED9865E0
	for <virtio-comment@lists.oasis-open.org>; Fri, 26 Mar 2021 09:02:06 +0000 (UTC)
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Date: Fri, 26 Mar 2021 12:01:50 +0300
Message-ID: <20210326090154.1144100-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH v4 0/2] virtio-vsock: introduce SOCK_SEQPACKET description
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Colin Ian King <colin.king@canonical.com>, Norbert Slusarek <nslusarek@gmx.net>, Andra Paraschiv <andraprs@amazon.com>, Jeff Vander Stoep <jeffv@google.com>, Alexander Popov <alex.popov@linux.com>
Cc: virtualization@lists.linux-foundation.org, arseny.krasnov@kaspersky.com, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

This adds description of SOCK_SEQPACKET type for virtio-vsock.
Basic idea is to add special ops along with VIRITIO_VSOCK_OP_RW,
which mark begin and end of each message. So two new operations
were added: VIRTIO_VSOCK_OP_SEQ_BEGIN and VIRTIO_VSOCK_OP_SEQ_END.
Both have special payload, which provides length and id of message,
to check integrity of every message by receiver.

Here is latest RFC implementation for Linux, with more details:

https://lkml.org/lkml/2021/3/23/580

Also this patchset has patch which replaces enums to defines in
virtio-vsock part of spec. SOCK_SEQPACKET patch is based on it.

 Arseny Krasnov(2):
  virtio-vsock: use C style defines for constants
  virtio-vsock: SOCK_SEQPACKET description

 virtio-vsock.tex | 65 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 6 deletions(-)

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

