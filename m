Return-Path: <sgarzare@redhat.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v10 0/3] virtio-vsock: SOCK_SEQPACKET description
Date: Wed,  5 Jan 2022 17:35:02 +0100
Message-Id: <20220105163505.192146-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: virtio-comment@lists.oasis-open.org
Cc: jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com, stefanha@redhat.com, arseny.krasnov@kaspersky.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

v9: https://markmail.org/message/4s6kfbeblxw4vzk4

Linux kernel and QEMU already merged SOCK_SEQPACKET support,
so I'm resending Arseny's patches to have consistent virtio-spec
and implementation.

I added patch 2, following the discussion about F_STREAM feature bit:
https://markmail.org/message/aoaspjy2jhidwbuo#query:+page:1+mid:obw54zzikgqimhjk+state:results

About patch 2, the vhost-vsock device in the Linux kernel doesn't set bit 0
(F_STREAM), so at this point I don't know if it's better to use a negative
feature flag (e.g. F_NO_STREAM) or we go for F_STREAM and send a patch to
linux-stable (and QEMU?) to solve this issue.

Thanks,
Stefano

Arseny Krasnov (2):
  virtio-vsock: use C style defines for constants
  virtio-vsock: SOCK_SEQPACKET description

Stefano Garzarella (1):
  virtio-vsock: add VIRTIO_VSOCK_F_STREAM feature bit

 virtio-vsock.tex | 93 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 65 insertions(+), 28 deletions(-)

-- 
2.31.1

