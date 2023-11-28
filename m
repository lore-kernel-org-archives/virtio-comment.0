Return-Path: <virtio-comment-return-8661-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892F2C4167B
	for <virtio-comment@archiver.kernel.org>; Tue, 28 Nov 2023 08:07:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A7CF42237B
	for <virtio-comment@archiver.kernel.org>; Tue, 28 Nov 2023 08:07:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 790069865D8
	for <virtio-comment@archiver.kernel.org>; Tue, 28 Nov 2023 08:07:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 561369859DD; Tue, 28 Nov 2023 08:07:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 423909864BA
	for <virtio-comment@lists.oasis-open.org>; Tue, 28 Nov 2023 08:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0VxJpi4Y_1701158869;
From: Heng Qi <hengqi@linux.alibaba.com>
To: virtio-comment@lists.oasis-open.org
Cc: Jason Wang <jasowang@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Date: Tue, 28 Nov 2023 16:07:46 +0800
Message-Id: <cover.1701158152.git.hengqi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v4 0/2] virtio-net: support distinguishing between partial and full checksum

If VIRTIO_NET_F_GUEST_CSUM is negotiated, the driver does not support the
loading of XDP because it can receive packets with partial checksum.

This prevents users using XDP from enjoying the benefits of device
calculation and validation of checksum.

This patch set is designed to resolve this issue.

Changelog:
=========
v3->v4:
- Patch[1/2]: Update the description for VIRTIO_NET_F_GUEST_CSUM.
- Patch[2/2]:
  - Streamline some repetitive descriptions.
  - Add how features should work, when to be enabled, and overhead.

v2->v3:
- Add a section named "Driver Handles Fully Checksummed Packets"
  and more descriptions. @Michael

v1->v2:
- Modify full checksum functionality as a configurable offload
  that is initially turned off. @Jason

Heng Qi (2):
  virtio-net: update description for VIRTIO_NET_F_GUEST_CSUM.
  virtio-net: support distinguishing between partial and full checksum

 device-types/net/description.tex        | 68 ++++++++++++++++++++++---
 device-types/net/device-conformance.tex |  1 +
 device-types/net/driver-conformance.tex |  1 +
 introduction.tex                        |  3 ++
 4 files changed, 66 insertions(+), 7 deletions(-)

-- 
2.19.1.6.gb485710b


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

