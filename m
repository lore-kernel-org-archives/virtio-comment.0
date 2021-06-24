Return-Path: mgurtovoy@nvidia.com
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: [RFC PATCH 0/1] Live migration for VIRTIO
Date: Thu, 24 Jun 2021 11:08:24 +0300
Message-ID: <20210624080825.43478-1-mgurtovoy@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: virtio-comment@lists.oasis-open.org, mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com
Cc: eperezma@redhat.com, aadam@redhat.com, oren@nvidia.com, shahafs@nvidia.com, parav@nvidia.com, bodong@nvidia.com, amikheev@nvidia.com, stefanha@redhat.com, Max Gurtovoy <mgurtovoy@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi all,
This patch will describe the needed updates to the virtio specification for
adding live migration support for various devices. Live migration is one of
the most important features of virtualization and virtio devices are oftenly
found in virtual environments so setting a standard mechanism for this feature
will allow virtio providers to develop compliant devices that will use standard
drivers for that matter.

In this solution, that is aimed for VIRTIO PCI devices, the PF is the
management entity for migrating its VFs. The communication channel between the
migration software, that is running on the host, and the PF controller is the
admin control queue. Using this virtq, the migration software will be able to
manage the migration process (e.g. track dirty pages, change operational
states, save/restore internal context, and more).

This initial draft describes the entire solution and later on we'll be able to
divide it to smaller pieces and incrementally patch the .tex files.

Max Gurtovoy (1):
  live_migration: initial support for migrating virtio devices

 virtio-live-migration.md | 399 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 399 insertions(+)
 create mode 100644 virtio-live-migration.md

-- 
2.21.0

