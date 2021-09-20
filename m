Return-Path: <david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 0/5] virtio-mem: VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE and interaction with memory properties
Date: Mon, 20 Sep 2021 15:36:13 +0200
Message-Id: <20210920133618.16071-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>, Hui Zhu <teawater@gmail.com>, Marek Kedzierski <mkedzier@redhat.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Wei Yang <richard.weiyang@linux.alibaba.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Looking into supporting virtio-mem
a) without a shared zeropage for the memory backing of the device --
   not allowing the driver to read unplugged memory
b) on architectures with memory properties for RAM (e.g., s390x with
   storage keys and storage attributes)
requires extension of the spec to handle both cases cleanly and describe
the expected semantics.

I'll open a github issue soon; in the meantime, I'll work on the actual
implementation in QEMU and Linux.

For a), I already shared a Linux implementation in the past [1], which will
be simplified once virito-mem memory can no longer be mapped via /dev/mem
[2].

For b), it's actually unlocking virtio-mem on s390x in QEMU/Linux,
initially supporting storage keys but not supporting storage attributes
for simplicity.

[1] https://lkml.kernel.org/r/20210215122421.27964-1-david@redhat.com
[2] https://lkml.kernel.org/r/20210902160919.25683-1-david@redhat.com

Cc: Hui Zhu <teawater@gmail.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Cc: Sebastien Boeuf <sebastien.boeuf@intel.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>

v1-> v2:
- Addressed all feedback from Conny.
- Added patch #1-#3 to cleanup and clarify.

David Hildenbrand (5):
  virtio-mem: simplify statements that express unexpected behavior on
    memory access
  virtio-mem: rephrase remaining memory access statements
  virtio-mem: document basic memory access to plugged memory blocks
  virtio-mem: introduce VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
  virtio-mem: describe interaction with memory properties

 virtio-mem.tex | 72 +++++++++++++++++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 21 deletions(-)

-- 
2.31.1

