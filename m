Return-Path: <mgurtovoy@nvidia.com>
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: [RFC PATCH v3 0/4] Admin virtq infrastructure
Date: Wed, 11 Aug 2021 14:43:05 +0300
Message-ID: <20210811114309.7941-1-mgurtovoy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com
Cc: parav@nvidia.com, shahafs@nvidia.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com, nitzanc@nvidia.com, jgg@nvidia.com, stefanha@redhat.com, eperezma@redhat.com, oren@nvidia.com, Max Gurtovoy <mgurtovoy@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi all,
This series introduce a new virtio queue type for administration. This
queue will hold a generic command form and can be supported by all the
virtio device types. This infrastructure will allow adding various
features which would not easily map into the configuration space. These
features might be generic accross various device types and using this
mechanism will allow us to define the generic features once instead of
defining it per device type.

The Admin virtqueue index may vary among different device types and this
series include definition for blk and net devices for adminq index.

One of the features than can be added in the future is creating an admin
command to create/destroy virtual devices with limited resources that
will be managed by the "creator"/"parent" device. This is similar to
Virtual Function in PCI world and can be an extension for it in a sense
of Scalable Function.

The first major feature that will probably use the adminq infrastructure
is Live Migration.

Changes from v2:
 - removed vendor specific status codes (make them reserved)
 - removed vendor specific class codes (make them reserved)
 - added VIRTIO_ADMIN_CTRL_FEATURES opcode for feature negotiation
 - added more device information in VIRTIO_ADMIN_DISCOVER_DEVICE_IDENTITY
   command response (e.g. virtio_vdev_id, virtio_serial_id, etc..).
 - added adminq index for virtio-net device

Max Gurtovoy (4):
  Add virtio Admin Virtqueue specification
  Introduce VIRTIO_F_ADMIN_VQ_INDIRECT_DESC/VIRTIO_F_ADMIN_VQ_IN_ORDER
  virtio-blk: add support for VIRTIO_F_ADMIN_VQ
  virtio-net: add support for VIRTIO_F_ADMIN_VQ

 admin-virtq.tex | 300 ++++++++++++++++++++++++++++++++++++++++++++++++
 content.tex     |  65 +++++++++--
 packed-ring.tex |  26 ++---
 split-ring.tex  |  33 ++++--
 4 files changed, 390 insertions(+), 34 deletions(-)
 create mode 100644 admin-virtq.tex

-- 
2.21.0

