Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: [PATCH v3 0/4] Add VIRTIO_RING_F_INDIRECT_SIZE and queue_indirect_size
Date: Wed, 16 Mar 2022 14:44:32 +0100
Message-ID: <4735344.EBYxvr1mta@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This is a follow-up of:
https://lists.oasis-open.org/archives/virtio-comment/202202/msg00059.html

These 4 patches introduce a more fine graded control over the maximum length
of indirect descriptor tables.

Associated Github Task:
https://github.com/oasis-tcs/virtio-spec/issues/122

v2 -> v3:

  * s/bus specific/transport specific/ [patch 1]

  * CCW: Add new field 'indirect_num' both to to struct vq_config_block and
    struct vq_info_block. [patch 4]

  * CCW: Bump virtio-ccw revision to 3 and make existence of new field
    'indirect_num' dependent on revision 3. [patch 4]

  * CCW: Rephrase description of new field 'indirect_num'. [patch 4]

Christian Schoenebeck (4):
  Add VIRTIO_RING_F_INDIRECT_SIZE
  Add PCI configuration field "queue_indirect_size"
  Add MMIO configuration register "QueueIndirectNum"
  Add CCW configuration field "indirect_num"

 content.tex     | 86 ++++++++++++++++++++++++++++++++++++++++++++++---
 packed-ring.tex |  2 +-
 split-ring.tex  |  8 +++--
 3 files changed, 88 insertions(+), 8 deletions(-)

-- 
2.30.2




