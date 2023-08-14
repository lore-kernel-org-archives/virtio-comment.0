Return-Path: <virtio-comment-return-7079-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C41C04A6A
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:29:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A0EE842A70
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:29:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5819B9863EF
	for <virtio-comment@archiver.kernel.org>; Mon, 14 Aug 2023 11:29:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 50A2398633F; Mon, 14 Aug 2023 11:29:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3DAB198638A;
	Mon, 14 Aug 2023 11:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="351613530"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="351613530"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="803432860"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="803432860"
From: Zhu Lingshan <lingshan.zhu@intel.com>
To: jasowang@redhat.com,
	mst@redhat.com,
	eperezma@redhat.com,
	cohuck@redhat.com
Cc: virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org,
	Zhu Lingshan <lingshan.zhu@intel.com>
Date: Tue, 15 Aug 2023 03:29:02 +0800
Message-Id: <20230814192904.30062-4-lingshan.zhu@intel.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230814192904.30062-1-lingshan.zhu@intel.com>
References: <20230814192904.30062-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [RFC PATCH 3/5] virtio: The actions by the device upon SUSPEND

This commit specifies the actions to be taken by the device upon
SUSPEND.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Eugenio PÃrez <eperezma@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
---
 content.tex | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/content.tex b/content.tex
index 074f43e..43bd5de 100644
--- a/content.tex
+++ b/content.tex
@@ -96,6 +96,15 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
 If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set, the device MUST clear SUSPEND
 and resumes operation upon DRIVER_OK.
 
+If VIRTIO_F_SUSPEND is negotiated, when SUSPEND is set, the device MUST perform the following operations:
+\begin{itemize}
+\item Stop comsuming any descriptors
+\item Mark all finished descriptors as used and send used buffer notification to the driver
+\item Record Virtqueue State of each enabled virtqueue, see section \ref{sec:Virtqueues / Virtqueue State}
+\item Pause its operation and preserve all configurations in its Device Configuration Space, see \ref{sec:Basic Facilities of a Virtio Device / Device Configuration Space}
+\item Present SUSPEND in \field{device status}
+\end{itemize}
+
 \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature Bits}
 
 Each virtio device offers all the features it understands.  During
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

