Return-Path: <arseny.krasnov@kaspersky.com>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: [RFC PATCH v8 0/2] virtio-vsock: introduce SOCK_SEQPACKET description
Date: Mon, 16 Aug 2021 11:55:25 +0300
Message-ID: <20210816085528.4175303-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: cohuck@redhat.com, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Arseny Krasnov <arseny.krasnov@kaspersky.com>, Andra Paraschiv <andraprs@amazon.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>
Cc: virtualization@lists.linux-foundation.org, oxffffaa@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

This adds description of SOCK_SEQPACKET type for virtio-vsock.

Here is merged Linux implementation:
https://lore.kernel.org/netdev/20210611110744.3650456-1-arseny.krasnov@kasp=
ersky.com/

Here is extra patchset for record boundaries:
https://lkml.org/lkml/2021/8/16/205

Also this patchset has patch which replaces enums to defines in
virtio-vsock part of spec. SOCK_SEQPACKET patch is based on it.

 Arseny Krasnov(2):
  virtio-vsock: use C style defines for constants
  virtio-vsock: SOCK_SEQPACKET description

 virtio-vsock.tex | 91 ++++++++++++++++++++++++++++++++--------------
 1 files changed, 63 insertions(+), 28 deletions(-)

 v7 -> v8:
 - Message and reconrd boundaries description rephrased.

 v6 -> v7:
 - Added record boundaries bit description.

--=20
2.25.1

