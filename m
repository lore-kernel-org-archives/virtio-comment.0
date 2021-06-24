Return-Path: virtio-comment-return-1912-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0FEC99866C3
	for <virtio-comment@lists.oasis-open.org>; Thu, 24 Jun 2021 08:20:43 +0000 (UTC)
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Date: Thu, 24 Jun 2021 11:20:31 +0300
Message-ID: <20210624082032.44186-1-mgurtovoy@nvidia.com>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH v2 0/1] Live migration for VIRTIO
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

changes from v1:
 - Subscribed to virtio mailing list (no changes in the content)

Max Gurtovoy (1):
  live_migration: initial support for migrating virtio devices

 virtio-live-migration.md | 399 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 399 insertions(+)
 create mode 100644 virtio-live-migration.md

-- 
2.21.0


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

