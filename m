Return-Path: <beshleman.devbox@gmail.com>
From: beshleman.devbox@gmail.com
Subject: [PATCH v5 0/2] Support vsock datagram and mergeable buffers
Date: Thu, 24 Feb 2022 21:57:30 +0000
Message-Id: <20220224215732.2426614-1-beshleman.devbox@gmail.com>
In-Reply-To: <20210528040118.3253836-1-jiang.wang@bytedance.com>
References: <20210528040118.3253836-1-jiang.wang@bytedance.com>
Content-Type: text/plain; charset="US-ASCII"
To: mst@redhat.com, cohuck@redhat.com, virtio-comment@lists.oasis-open.org
Cc: cong.wang@bytedance.com, duanxiongchun@bytedance.com, jiang.wang@bytedance.com, virtualization@lists.linux-foundation.org, xieyongji@bytedance.com, chaiwen.cc@bytedance.com, stefanha@redhat.com, asias@redhat.com, arseny.krasnov@kaspersky.com, jhansen@vmware.com, bobby.eshleman@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

From: Bobby Eshleman <bobby.eshleman@bytedance.com>

This series adds two features to vsock: datagrams and mergeable buffers.

The first patch adds a new socket type (the datagram) to vsock. The second
patch adds a feature bit that supports mergeable buffers (similar to
virtio-net).

Jiang Wang (2):
  virtio-vsock: add description for datagram type
  virtio-vsock: add mergeable buffer feature bit

 virtio-vsock.tex | 139 +++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 129 insertions(+), 10 deletions(-)

-- 
2.11.0

