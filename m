Return-Path: <virtio-comment-return-6157-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD60C77B7A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 17:55:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D45C329FCB
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 17:55:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C032A9864D1
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 17:55:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B5FE79864A3; Tue,  6 Jun 2023 17:55:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A5BBA9864A4
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 17:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: zZyIFBcNPvCUseGdTjeTSg-1
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
Date: Tue,  6 Jun 2023 19:55:10 +0200
Message-Id: <20230606175511.2337208-2-eperezma@redhat.com>
In-Reply-To: <20230606175511.2337208-1-eperezma@redhat.com>
References: <20230606175511.2337208-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH 1/2] virtio: introduce selective queue enabling

This patch allows the driver to start the device (as set DRIVER_OK) with only
some queues enabled, and then enable another queues later.

This is the current way to migrate net device state through control
virtqueue, in a software assisted framework with vDPA:
* First, only net CVQ is enabled at DRIVER_OK
* All the control commands (mac address, mq, etc) needed for the device
to behave the same as the source of migration are sent
* Finally all the dataplane queues are enabled.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 content.tex | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index d2ab9eb..ea4a6d8 100644
--- a/content.tex
+++ b/content.tex
@@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \begin{description}
 \item[0 to 23, and 50 to 127] Feature bits for the specific device type
 
-\item[24 to 41] Feature bits reserved for extensions to the queue and
+\item[24 to 42] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms
 
-\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
@@ -398,6 +398,13 @@ \section{Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Virtqueues}
 Every driver and device supports either the Packed or the Split
 Virtqueue format, or both.
 
+\subsection{Virtqueue selective enabling}\label{sec:Basic Facilities of a Virtio Device / Virtqueues / Selective Virtqueue Enable}
+
+If the driver negotiates VIRTIO\_F\_RING\_ENABLE\_ANYTIME, it can enable
+individual virtqueues both before and after the DRIVER\_OK. The way to enable a
+virtqueue is transport specific, but it mimics the re-enabling after an
+hypothetical reset.
+
 \subsection{Virtqueue Reset}\label{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}
 
 When VIRTIO_F_RING_RESET is negotiated, the driver can reset a virtqueue
@@ -870,6 +877,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_RING_ENABLE_ANYTIME(42)] This feature indicates
+  that the driver can enable a queue both before and after DRIVER\_OK.
+  See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Selective Virtqueue Enable}.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
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

