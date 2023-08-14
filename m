Return-Path: <virtio-comment-return-7078-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6A8C001DB
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:29:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3F8DD2AFEE
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:29:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 38BC798638A
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:29:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 31469983F78; Mon, 14 Aug 2023 11:29:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 218E698633D;
	Mon, 14 Aug 2023 11:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="351613517"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="351613517"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="803432828"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="803432828"
From: Zhu Lingshan <lingshan.zhu@intel.com>
To: jasowang@redhat.com,
	mst@redhat.com,
	eperezma@redhat.com,
	cohuck@redhat.com
Cc: virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org,
	Zhu Lingshan <lingshan.zhu@intel.com>
Date: Tue, 15 Aug 2023 03:29:00 +0800
Message-Id: <20230814192904.30062-2-lingshan.zhu@intel.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230814192904.30062-1-lingshan.zhu@intel.com>
References: <20230814192904.30062-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [RFC PATCH 1/5] virtio: introduce SUSPEND bit in device status

This patch introudces a new status bit in the device status: SUSPEND.

This SUSPEND bit can be used by the driver to suspend a device,
in order to stablize the device states and virtqueue states.

Its main use case is live migration.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Eugenio PÃrez <eperezma@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
---
 content.tex | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/content.tex b/content.tex
index 0a62dce..1bb4401 100644
--- a/content.tex
+++ b/content.tex
@@ -47,6 +47,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
 \item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
   drive the device.
 
+\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
+  device has been suspended by the driver.
+
 \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
   an error from which it can't recover.
 \end{description}
@@ -73,6 +76,10 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
 recover by issuing a reset.
 \end{note}
 
+The driver MUST NOT set SUSPEND if FEATURES_OK is not set.
+
+When set SUSPEND, the driver MUST re-read \field{device status} to ensure the SUSPEND bit is set.
+
 \devicenormative{\subsection}{Device Status Field}{Basic Facilities of a Virtio Device / Device Status Field}
 
 The device MUST NOT consume buffers or send any used buffer
@@ -82,6 +89,13 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
 that a reset is needed.  If DRIVER_OK is set, after it sets DEVICE_NEEDS_RESET, the device
 MUST send a device configuration change notification to the driver.
 
+The device MUST ignore SUSPEND if FEATURES_OK is not set.
+
+The deivce MUST ignore SUSPEND if VIRTIO_F_SUSPEND is not negotiated.
+
+If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set, the device MUST clear SUSPEND
+and resumes operation upon DRIVER_OK.
+
 \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature Bits}
 
 Each virtio device offers all the features it understands.  During
@@ -872,6 +886,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_SUSPEND(41)] This feature indicates that the driver can
+   SUSPEND the device.
+   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
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

