Return-Path: <virtio-comment-return-8135-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7D8C4332F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:35:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B68D72168A
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:35:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8CF57986C36
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:35:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7470F986C2E; Fri,  3 Nov 2023 10:35:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 863A2986C2F
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 10:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373962287"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="373962287"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="738043222"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="738043222"
From: Zhu Lingshan <lingshan.zhu@intel.com>
To: jasowang@redhat.com,
	mst@redhat.com,
	eperezma@redhat.com,
	cohuck@redhat.com,
	stefanha@redhat.com
Cc: virtio-comment@lists.oasis-open.org,
	parav@nvidia.com,
	Zhu Lingshan <lingshan.zhu@intel.com>
Date: Fri,  3 Nov 2023 18:34:31 +0800
Message-Id: <20231103103437.72784-1-lingshan.zhu@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH V2 0/6] introduce basic facilities for virito live migration

This series introduces basic facilities to support
virtio live migration, includes:

1)a new SUSPEND bit in the device status
Which is used to suspend the device, so that the device states
and virtqueue states are stabilized.

2)virtqueue state and its accessor, to get and set last_avail_idx
and last_used_idx of virtqueues.

3)dirty page tracking

Changes from V1:
1)move vq state defination from content.tex to splited/packed.tex(Michael)
2)"the device should ignore resetting vqs when suspended" ==> "the driver should not reset vqs when suspended"(Michael)
3)add dirty page tracking facility

Zhu Lingshan (6):
  virtio: introduce virtqueue state
  virtio: introduce SUSPEND bit in device status
  virtio: dont reset vqs when SUSPEND
  virtio-pci: implement VIRTIO_F_QUEUE_STATE
  virtio: introduce dirty page tracking facility
  virtio-pci: implement dirty page tracking

 content.tex       | 66 ++++++++++++++++++++++++++++++++--
 packed-ring.tex   | 58 ++++++++++++++++++++++++++++++
 split-ring.tex    | 39 ++++++++++++++++++++
 transport-pci.tex | 90 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 251 insertions(+), 2 deletions(-)

-- 
2.35.3


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

