Return-Path: <4f5146a4bcbe59a76698e276216ef4a4d2270b61@lizzy.crudebyte.com>
Message-Id: <cover.1638192251.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 29 Nov 2021 14:24:11 +0100
Subject: [PATCH v2 0/2] Add VIRTIO_RING_F_LARGE_INDIRECT_DESC
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>
List-ID: <virtio-comment.lists.oasis-open.org>

This is a follow-up of:
https://lists.oasis-open.org/archives/virtio-comment/202111/msg00059.html

These two patches introduce a more fine graded control over the maximum
length of an indirect descriptor table.

Associated Github Task:
https://github.com/oasis-tcs/virtio-spec/issues/122

v1 -> v2:

  * "active/pending message(s)" -> "vring slot(s)"
    NOTE: I decided to use the term "vring slot(s)" over the previously
    suggested term "buffer(s)" as I found tha latter too ambiguous in this
    context. [patch 1]

  * "... but does not oppose a limit to the actual bulk data size
    being transmitted."
    ->
    " ... but does not oppose a limit to the actual bulk data size
    being transmitted when indirect descriptors are used." [patch 1]

  * Add common configuration field "queue_indirect_size" and make it
    mandatory as of revision 3. [NEW patch 2]

Christian Schoenebeck (2):
  Add VIRTIO_RING_F_LARGE_INDIRECT_DESC
  Add common configuration field "queue_indirect_size"

 content.tex    | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++
 split-ring.tex |  7 ++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)

-- 
2.20.1

