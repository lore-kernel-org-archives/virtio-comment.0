Return-Path: virtio-comment-return-889-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9C92F9860D6
	for <virtio-comment@lists.oasis-open.org>; Wed, 30 Oct 2019 18:09:04 +0000 (UTC)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Wed, 30 Oct 2019 20:08:45 +0200
Message-Id: <20191030180846.139034-1-yuri.benditovich@daynix.com>
Subject: [virtio-comment] [PATCH v3 0/1] define support for receive-side scaling
To: virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

Changes from v2 (resulted by v2 review):
Removed dependency of VIRTIO_NET_F_RSS on VIRTIO_NET_F_MQ
Added paragraph 'Device operation in multiqueue mode', common
for both RSS and MQ
indirection_table_length field changed to be indirection_table_mask
(which is indirection_table_length - 1)

Yuri Benditovich (1):
  virtio-net: define support for receive-side scaling

 conformance.tex |   2 +
 content.tex     | 232 ++++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 215 insertions(+), 19 deletions(-)

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

