Return-Path: <virtio-comment-return-9029-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAE1C47DA9
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 04:45:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 636CB2AEE0
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 04:45:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 41D41986882
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 04:45:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2812B983F76; Tue, 30 Jan 2024 04:45:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 10930986876
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 04:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0W.exDMT_1706589924;
From: Heng Qi <hengqi@linux.alibaba.com>
To: virtio-comment@lists.oasis-open.org
Cc: Jason Wang <jasowang@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Parav Pandit <parav@nvidia.com>
Date: Tue, 30 Jan 2024 12:45:24 +0800
Message-Id: <1706589924-3036-1-git-send-email-hengqi@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [virtio-comment] [PATCH v3] virtio-net: support setting coalescing params for multiple vqs

Currently, when each time the driver attempts to update the coalescing parameters
for a vq, it needs to kick the device and wait for the ctrlq response to return.
The following path is observed: 1. Driver kicks the device; 2. After the device
receives the kick, CPU scheduling occurs and DMA multiple buffers multiple times;
3. The device completes processing and replies with a response.

Since Linux ctrlq currently cannot add commands in batches, it can only process
one request synchronously at a time.
When a large-queue driver want to issue multiple requests, the subsequent request
must wait for the previous request to be processed before it can be sent:
  1. The driver kicks the device frequently, this often interrupt the work of
     the device-side CPU. In addition, each vq request
  2. Each request is pipelined and there can always be only one request in the
     pipeline, causing more delays for the device-side CPU to wait for the DMA
     request to complete.

These interruptions and overhead will strain the CPU responsible for controlling
the path of the DPU, especially in multi-device and large-queue scenarios.

To solve the above problems, we internally tried batch request, which merges
requests from multiple queues and sends them at once. We conservatively tested
8 queue commands and sent them together. The DPU processing efficiency can be
improved by 8 times, which greatly eases the DPU's support for multi-device
and multi-queue DIM.

Suggested-by: Xiaoming Zhao <zxm377917@alibaba-inc.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
v2->v3:
    1. Update some descriptions. @ Michael
    2. virtio_net_ctrl_mrg_coal_vq -> virtnet_ctrl_mrg_coal_vq
    3. Reword the commit log.

v1->v2: Updated commit log. Due to sensitivity, sorry that can not give the
        absolute value directly. @Michael 

 device-types/net/description.tex | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index aff5e08..dbca203 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1667,8 +1667,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 for notification coalescing.
 
 If the VIRTIO_NET_F_VQ_NOTF_COAL feature is negotiated, the driver can
-send commands VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET
-for virtqueue notification coalescing.
+send commands VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET, VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET and
+VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET for virtqueue notification coalescing.
 
 \begin{lstlisting}
 struct virtio_net_ctrl_coal {
@@ -1682,11 +1682,17 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
     struct virtio_net_ctrl_coal coal;
 };
 
+struct virtnet_ctrl_mrg_coal_vq {
+        le16 num_entries; /* indicates number of valid entries */
+        struct virtio_net_ctrl_coal_vq entries[];
+};
+
 #define VIRTIO_NET_CTRL_NOTF_COAL 6
  #define VIRTIO_NET_CTRL_NOTF_COAL_TX_SET  0
  #define VIRTIO_NET_CTRL_NOTF_COAL_RX_SET 1
  #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET 2
  #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET 3
+ #define VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET 4
 \end{lstlisting}
 
 Coalescing parameters:
@@ -1706,6 +1712,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 \item For the command VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET, the structure virtio_net_ctrl_coal_vq is write-only for the driver.
 \item For the command VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET, \field{vq_index} and \field{reserved} are write-only
       for the driver, and the structure virtio_net_ctrl_coal is read-only for the driver.
+\item For the command VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET, the structure virtnet_ctrl_mrg_coal_vq is write-only for the driver.
 \end{itemize}
 
 The class VIRTIO_NET_CTRL_NOTF_COAL has the following commands:
@@ -1716,6 +1723,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
                                         for an enabled transmit/receive virtqueue whose index is \field{vq_index}.
 \item VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET: use the structure virtio_net_ctrl_coal_vq to get the \field{max_usecs} and \field{max_packets} parameters
                                         for an enabled transmit/receive virtqueue whose index is \field{vq_index}.
+\item VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET: use the structure virtnet_ctrl_mrg_coal_vq to set the \field{max_usecs} and \field{max_packets} parameters
+                                         for \field{num_entries} enabled transmit/receive virtqueues. The corresponding index value
+                                         of each configured virtqueue is \field{vq_index}.
 \end{enumerate}
 
 The device may generate notifications more or less frequently than specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
@@ -1782,9 +1792,13 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 
 The driver MUST set \field{vq_index} to the virtqueue index of an enabled transmit or receive virtqueue.
 
+The driver MUST set \field{num_entries} to a non-zero value and MUST NOT set \field{num_entries} to
+a value greater than the number of enabled transmit and receive virtqueues.
+
 The driver MUST have negotiated the VIRTIO_NET_F_NOTF_COAL feature when issuing commands VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and VIRTIO_NET_CTRL_NOTF_COAL_RX_SET.
 
-The driver MUST have negotiated the VIRTIO_NET_F_VQ_NOTF_COAL feature when issuing commands VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET.
+The driver MUST have negotiated the VIRTIO_NET_F_VQ_NOTF_COAL feature when issuing commands
+VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET, VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET and VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET.
 
 The driver MUST ignore the values of coalescing parameters received from the VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET command if the device responds with VIRTIO_NET_ERR.
 
@@ -1794,10 +1808,12 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 
 The device SHOULD respond to VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and VIRTIO_NET_CTRL_NOTF_COAL_RX_SET commands with VIRTIO_NET_ERR if it was not able to change the parameters.
 
-The device MUST respond to the VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET command with VIRTIO_NET_ERR if it was not able to change the parameters.
+The device MUST respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET
+commands with VIRTIO_NET_ERR if it was not able to change some of the coalescing parameters. In
+this case, all of the parameters MUST remain unchanged, for all virtqueues.
 
-The device MUST respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET commands with
-VIRTIO_NET_ERR if the designated virtqueue is not an enabled transmit or receive virtqueue.
+The device MUST respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET, VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET and VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET
+commands with VIRTIO_NET_ERR if the designated virtqueue is not an enabled transmit or receive virtqueue.
 
 Upon disabling and re-enabling a transmit virtqueue, the device MUST set the coalescing parameters of the virtqueue
 to those configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command, or, if the driver did not set any TX coalescing parameters, to 0.
-- 
1.8.3.1


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

