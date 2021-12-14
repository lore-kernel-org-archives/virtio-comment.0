Return-Path: <55b04c584638393050bc76467439550d87e24696@lizzy.crudebyte.com>
Message-Id: <cover.1639494803.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 14 Dec 2021 16:13:23 +0100
Subject: [PATCH 0/2] Add VIRTIO_RING_F_INDIRECT_SIZE and queue_indirect_size
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

This is a follow-up of:
[0/2]: https://lists.oasis-open.org/archives/virtio-comment/202111/msg00089.html
[1/2]: https://lists.oasis-open.org/archives/virtio-comment/202112/msg00005.html
[2/2]: https://lists.oasis-open.org/archives/virtio-comment/202112/msg00006.html

These two patches introduce a more fine graded control over the maximum length
of indirect descriptor tables.

Associated Github Task:
https://github.com/oasis-tcs/virtio-spec/issues/122

Changes:

  * VIRTIO_RING_F_LARGE_INDIRECT_DESC -> VIRTIO_RING_F_INDIRECT_SIZE
    [patch 1], [patch 2]

  * queue_indirect_size field: 16 bit -> 32 bit [patch 2]

  * Semantic change: "per indirect descriptor table" -> "per vring slot".
    [patch 2]

  * Revised first paragraph of VIRTIO_RING_F_INDIRECT_SIZE(40) to be more clear
    that it is not only about exceeding the queue size
    ("This feature indicates ... "). [patch 1]

  * Drop mentioning "revision 3". [patch 2]

  * revised commit log [patch 1]

  * Grammar: "... but does not limit the actual bulk data size ...". [patch 1]

  * Grammar: "... if the device ...". [patch 1]

  * queue_indirect_size field may only be used if VIRTIO_RING_F_INDIRECT_SIZE
    was used. [patch 2]

  * Drop usage of SHOULD/MUST in common description. [patch 2]

  * Grammar: had been -> was [patch 2]

  * Add requirements for field 'queue_indirect_size' to driver normative
    section. [patch 2]

Christian Schoenebeck (2):
  Add VIRTIO_RING_F_INDIRECT_SIZE
  Add common configuration field "queue_indirect_size"

 content.tex    | 44 ++++++++++++++++++++++++++++++++++++++++++++
 split-ring.tex |  5 ++++-
 2 files changed, 48 insertions(+), 1 deletion(-)

-- 
2.20.1

