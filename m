Return-Path: <virtio-comment-return-6158-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC751C7EE24
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 17:55:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2360E23D5A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 17:55:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1582B986585
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 17:55:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0BA479864A3; Tue,  6 Jun 2023 17:55:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EF09E9864A8
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 17:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5j88KB7TOFyF43D8FIfF9Q-1
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: virtio-comment@lists.oasis-open.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Cindy Lu <lulu@redhat.com>,
	cohuck@redhat.com,
	alvaro.karsz@solid-run.com,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>,
	longpeng2@huawei.com,
	Dragos Tatulea <dtatulea@nvidia.com>,
	parav@nvidia.com,
	stefanha@redhat.com,
	Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	jasowang@redhat.com,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>,
	mgurtovoy@nvidia.com,
	si-wei.liu@oracle.com,
	mst@redhat.com
Date: Tue,  6 Jun 2023 19:55:11 +0200
Message-Id: <20230606175511.2337208-3-eperezma@redhat.com>
In-Reply-To: <20230606175511.2337208-1-eperezma@redhat.com>
References: <20230606175511.2337208-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH 2/2] virtio: pci support virtqueue selective enabling

Reusing virtqueue reset method to enabling a vq.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 transport-pci.tex | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/transport-pci.tex b/transport-pci.tex
index a5c6719..04c0429 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -375,6 +375,10 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 
 \item[\field{queue_enable}]
         The driver uses this to selectively prevent the device from executing requests from this virtqueue.
+        If the driver negotiates VIRTIO_F_RING_ENABLE_ANYTIME or
+        VIRTIO_F_RING_RESET, the driver writes 1 to this field to enable a
+        virtqueue.  See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Selective Virtqueue Enable}
+        and \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}.
         1 - enabled; 0 - disabled.
 
 \item[\field{queue_notify_off}]
-- 
2.31.1


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

