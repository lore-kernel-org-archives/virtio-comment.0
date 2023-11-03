Return-Path: <virtio-comment-return-8139-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618E8C4332F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:35:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D4FDB72358
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:35:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D3ED6986D61
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 10:35:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A6B8C986DCC; Fri,  3 Nov 2023 10:35:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 810BF986C34
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 10:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373962325"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="373962325"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="738043251"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="738043251"
From: Zhu Lingshan <lingshan.zhu@intel.com>
To: jasowang@redhat.com,
	mst@redhat.com,
	eperezma@redhat.com,
	cohuck@redhat.com,
	stefanha@redhat.com
Cc: virtio-comment@lists.oasis-open.org,
	parav@nvidia.com,
	Zhu Lingshan <lingshan.zhu@intel.com>
Date: Fri,  3 Nov 2023 18:34:36 +0800
Message-Id: <20231103103437.72784-6-lingshan.zhu@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231103103437.72784-1-lingshan.zhu@intel.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH V2 5/6] virtio: introduce dirty page tracking facility

This commit introduce a new virtio facility to track
device dirty pages, a typical use case is live migration.

The implementation of this facility is transport specific.

Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 content.tex | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 060b5c2..eb9274f 100644
--- a/content.tex
+++ b/content.tex
@@ -127,10 +127,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \begin{description}
 \item[0 to 23, and 50 to 127] Feature bits for the specific device type
 
-\item[24 to 43] Feature bits reserved for extensions to the queue and
+\item[24 to 44] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms
 
-\item[44 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[45 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
@@ -535,6 +535,27 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
 
 \input{admin.tex}
 
+\section{Memory Dirty Pages Tracker}\label{sec:Basic Facilities of a Virtio Device / Memory Dirty Pages Tracker}
+
+A "dirty page" refers to a page in memory that has been modified by the device
+but have not yet been acknowledged or processed by the CPU.
+
+This Memory Dirty Pages Tracker is a device facility that can record and report
+dirty pages caused by the device in device address space.
+
+The device offers a feature bit VIRTIO_F_MEM_TRACK if capable of tracking dirty pages.
+The implementation of this dirty page tracking facility is transport specific.
+
+A typical use case of this facility is to track dirty pages during live migration process.
+
+\drivernormative{\subsection}{Memory Dirty Pages Tracker}{Facilities of a Virtio Device / Memory Dirty Pages Tracker}
+
+The driver MUST fetch and clear dirty page information atomically.
+
+\devicenormative{\subsection}{Memory Dirty Pages Tracker}{Facilities of a Virtio Device / Memory Dirty Pages Tracker}
+
+The device MUST report the dirty page information atomically.
+
 \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
 
 We start with an overview of device initialization, then expand on the
@@ -910,6 +931,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
    SUSPEND the device.
    See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
 
+  \item[VIRTIO_F_MEM_TRACK(44)] This feature indicates that the device can track
+  memory dirty pages caused by itself.
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

