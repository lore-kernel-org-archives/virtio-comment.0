Return-Path: <lingshan.zhu@intel.com>
From: Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH V2 0/5] Introduce virtio transport virtqueue
Date: Mon,  1 Aug 2022 17:32:11 +0800
Message-Id: <20220801093216.362119-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com
Cc: virtio-comment@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This series introduces virtio transport virtqueue as a new
transport layer for virtio devices.

This series defines the concepts of virtio management device
and virtio managed devices.

This series also defines a commands set over the transport virtqueue,
including:
The command to query available resources of the management device
The commands to create / destroy the managed devices.
The commands to config the managed devices.
The commands to config virtqueues of the managed devices.

Changes form V1:
1)Add a command to set per-vq asid(Jason)
2)Add a command to reset a virtqueue(Jason)
3)Add support for packed virtqueue state(Jason)
4)Allow nested managed devices(Jason)
5)Provides device feature bits in the provisioning(Jason)
6)Removed most of the error codes, only left OK and ERR(Jason)
7)“virtual devices” is renamed to “managed devices”, to be more general(Jason)

Zhu Lingshan (5):
  Introduce virito transport virtqueue
  Introduce feature bit VIRTIO_F_TRANSPT_VQ_MDEV
  Introduce the commands set of the transport vq
  Describe the process to present a managed device
  Add transport vq number for virtio blk and net

 content.tex      | 784 +++++++++++++++++++++++++++++++++++++++++++++++
 introduction.tex |   3 +
 2 files changed, 787 insertions(+)

-- 
2.35.3

