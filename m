Return-Path: virtio-comment-return-870-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4BC58985DFB
	for <virtio-comment@lists.oasis-open.org>; Wed, 16 Oct 2019 07:50:45 +0000 (UTC)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Wed, 16 Oct 2019 10:50:31 +0300
Message-Id: <20191016075032.83600-1-yuri.benditovich@daynix.com>
Subject: [virtio-comment] [PATCH v2 0/1] virtio-net: define support for receive-side scaling
To: virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

Changes from v1:
RSS capabilities move to device configuration space
RSS configuration command moved to VIRTIO_NET_CTRL_MQ
Section 'Automatic receive steering' extended to describe device with RSS support

Yuri Benditovich (1):
  virtio-net: define support for receive-side scaling

 conformance.tex |   2 +
 content.tex     | 181 ++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 177 insertions(+), 6 deletions(-)

-- 
2.17.2


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

