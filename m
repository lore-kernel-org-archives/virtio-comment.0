Return-Path: <lingshan.zhu@intel.com>
From: Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH V3 0/4] Introduce virtio transport virtqueue
Date: Fri,  5 Aug 2022 17:41:10 +0800
Message-Id: <20220805094114.486005-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com
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

Changes from V2:
1)Drop Feature bit VIRTIO_F_TRANSPT_VQ_MDEV (Michael)
2)Extend the feature bits to 128 bits as required in section 2.2 Feature Bits (Michael)
3)Explicit describes the feature bit VIRTIO_F_TRANSPT_VQ should be negotiated with the management device for the commands (Michael)
4)Removed MSI mask / unmask commands (Michael)
5)Add commands to get MSI entries of vqs and config space (Michael)
6)Add a description on the behaviors when disable a MSI (Michael)
7)Removed the section “Management device discovery” (Michael)
8)Remove pre-created managed devices, it is totally depending on the HW implementation (Michael)
9)Detailed descriptions for VIRITO DEVICE ID in the creation command (Michael)
10)Better device requirements for the device config space generation (Michael)
11)Re-use struct transportq_ctrl_packed_vq_state{} for both packed vq state set/get (Michael)

Changes form V1:
1)Add a command to set per-vq asid(Jason)
2)Add a command to reset a virtqueue(Jason)
3)Add support for packed virtqueue state(Jason)
4)Allow nested managed devices(Jason)
5)Provides device feature bits in the provisioning(Jason)
6)Removed most of the error codes, only left OK and ERR(Jason)
7)“virtual devices” is renamed to “managed devices”, to be more general(Jason)

Zhu Lingshan (4):
  Introduce virito transport virtqueue
  Introduce the commands set of the transport vq
  Describe the process to present a managed device
  Add transport vq number for virtio blk and net

 content.tex      | 761 +++++++++++++++++++++++++++++++++++++++++++++++
 introduction.tex |   3 +
 2 files changed, 764 insertions(+)

-- 
2.35.3

