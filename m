Return-Path: <virtio-comment-return-8663-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C07C4167B
	for <virtio-comment@archiver.kernel.org>; Tue, 28 Nov 2023 08:08:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 684BD429AC
	for <virtio-comment@archiver.kernel.org>; Tue, 28 Nov 2023 08:08:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 625E4986653
	for <virtio-comment@archiver.kernel.org>; Tue, 28 Nov 2023 08:08:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 55EAD9864D1; Tue, 28 Nov 2023 08:08:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 43860986559
	for <virtio-comment@lists.oasis-open.org>; Tue, 28 Nov 2023 08:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R741e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0VxK3l61_1701158870;
From: Heng Qi <hengqi@linux.alibaba.com>
To: virtio-comment@lists.oasis-open.org
Cc: Jason Wang <jasowang@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Date: Tue, 28 Nov 2023 16:07:47 +0800
Message-Id: <5490c3b5b2321e13a9344057d02f2ae5fe9ebf56.1701158152.git.hengqi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <cover.1701158152.git.hengqi@linux.alibaba.com>
References: <cover.1701158152.git.hengqi@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v4 1/2] virtio-net: update description for VIRTIO_NET_F_GUEST_CSUM.

To prevent readers from misunderstanding that the driver can
only handles packets with partial checksum when
VIRTIO_NET_F_GUEST_CSUM is negotiated, we update the description.

Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
 device-types/net/description.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index aff5e08..529f470 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -38,7 +38,7 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \begin{description}
 \item[VIRTIO_NET_F_CSUM (0)] Device handles packets with partial checksum offload.
 
-\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with partial checksum.
+\item[VIRTIO_NET_F_GUEST_CSUM (1)] Driver handles packets with partial checksum or full checksum.
 
 \item[VIRTIO_NET_F_CTRL_GUEST_OFFLOADS (2)] Control channel offloads
         reconfiguration support.
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

