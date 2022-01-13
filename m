Return-Path: <sgarzare@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v12 0/3] virtio-vsock: SOCK_SEQPACKET description
Date: Thu, 13 Jan 2022 17:51:59 +0100
Message-Id: <20220113165202.250429-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: virtio-comment@lists.oasis-open.org
Cc: jasowang@redhat.com, mst@redhat.com, sgarzare@redhat.com, cohuck@redhat.com, stefanha@redhat.com, arseny.krasnov@kaspersky.com
List-ID: <virtio-comment.lists.oasis-open.org>

v12:
- added statement about supporting F_STREAM when F_SEQPACKET is negotiated
  [cohuck, mst]

v11: https://lists.oasis-open.org/archives/virtio-comment/202201/msg00027.html
- reworked "Message and record boundaries" paragraph [stefanha]

Linux kernel and QEMU already merged SOCK_SEQPACKET support,
so I'm resending Arseny's patches to have consistent virtio-spec
and implementation.

I added patch 2, following the discussion about F_STREAM feature bit:
https://markmail.org/message/aoaspjy2jhidwbuo#query:+page:1+mid:obw54zzikgqimhjk+state:results

Thanks,
Stefano

Arseny Krasnov (2):
  virtio-vsock: use C style defines for constants
  virtio-vsock: SOCK_SEQPACKET description

Stefano Garzarella (1):
  virtio-vsock: add VIRTIO_VSOCK_F_STREAM feature bit

 virtio-vsock.tex | 88 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 60 insertions(+), 28 deletions(-)

-- 
2.31.1

