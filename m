Return-Path: <virtio-comment-return-8218-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10952C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 06:29:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3E1EE2AD51
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 06:29:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1FBAF9867E5
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 06:29:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0FD549867E3; Tue,  7 Nov 2023 06:29:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F12E69867E4
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 06:29:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VvtC4jA_1699338577;
From: Heng Qi <hengqi@linux.alibaba.com>
To: virtio-comment@lists.oasis-open.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Satananda Burla <sburla@marvell.com>,
	Parav Pandit <parav@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Date: Tue,  7 Nov 2023 14:29:37 +0800
Message-Id: <376f7db97906c8365fbb5b06814ab4431dfdcc1e.1699338351.git.hengqi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v6] virtio-net: support the RSS context

Commit 84a1d9c48200 ("net: ethtool: extend RXNFC API to support RSS spreading of
filter matches") adds support for RSS context as a destination for receive flow filters
(see WIP work: https://lists.oasis-open.org/archives/virtio-comment/202308/msg00194.html).

An RSS context consists of configurable parameters specified by receive-side scaling.

Some use cases:
1. When users want some data flows to be steered to specific multiple rxqs, they can set
   receive flow filter rules for these data flows to an RSS context with desired rxqs.
2. Traffic isolation. Used when users want the traffic of certain applications to occupy
   several queues without being distubed.

How to set/configure an RSS context:
Assuming no RSS context has been created before.
1. ethtool -X eth0 context new start 5 equal 8

This command creates an RSS context with an id=1 for eth0, and fills in the indirection
table with rxq indexes 5-8 circularly. The hash key and hash types reuse the default
RSS configuration.

Then, we can use 'ethtool -x eth0 context 1' to query the above configuration.

2. ethtool -X eth0 context new start 6 equal 7 \
   hkey 8f:bf:dd:11:23:58:d2:8a:00:31:d0:32:a3:b5:1f:\
   1f:e4:d1:fe:47:7f:64:42:fd:d0:61:16:b8:b0:f9:71:e8:2d:36:7f:18:dd:4d:c8:f3

This command creates an RSS context with an id=2 for eth0, and fills in the indirection
table with rxq indexes 6-7 circularly. The hash key is 8f:bf:dd:11:23:58:d2:8a:00:31:d0\
:32:a3:b5:1f:1f:e4:d1:fe:47:7f:64:42:fd:d0:61:16:b8:b0:f9:71:e8:2d:36:7f:18:dd:4d:c8:f3.
Hash types reuse the default RSS configuration.

3. ethtool -N eth0 rx-flow-hash tcp4 sdfn context 1

This command specifies the hash types for the RSS context whose id=1 on eth0.
Now this RSS context only has the hash key to reuse the default RSS configuration.

4. ethtool -N eth0 flow-type udp4 src-ip 1.1.1.1 context 1

This command configures a receive flow filter rule for eth0, and the data flow matching
this rule will continue to select the final rxq according to the RSS context configuration
with id=1.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/178
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
Acked-by: Satananda Burla <sburla@marvell.com>
Acked-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
v5->v6:
  1. Add Xuan's ack tag.

v4->v5:
  1. Use 'u8 reserved[6]' instead of u16 padding to align the structure.

v3->v4:
  1. Rebase to Xuan's device stats patch.

v2->v3:
  1. Process Satananda's comments and add his ack tag.
  2. Add link to fix issue and optimize commit log.

v1->v2:
  1. u8 to le16 for field rss_ctx_id.
  2. Add normativation when device resetting. @Yuri Benditovich
  3. Use ctrlq cmd to query rss context capability instead of reading config space. @Parav Pandit

 device-types/net/description.tex        | 85 +++++++++++++++++++++++++
 device-types/net/device-conformance.tex |  1 +
 device-types/net/driver-conformance.tex |  1 +
 3 files changed, 87 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index aff5e08..61cce1f 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -122,6 +122,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
     device with the same MAC address.
 
 \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
+
+\item[VIRTIO_NET_F_RSS_CONTEXT(64)] Device supports multiple RSS contexts.
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -153,6 +155,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
+\item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and VIRTIO_NET_F_RSS.
 \end{description}
 
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Network Device / Feature bits / Legacy Interface: Feature bits}
@@ -1613,6 +1616,88 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 \item If the destination receive queue is being reset (See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}), the device MUST drop the packet.
 \end{itemize}
 
+\paragraph{RSS Context}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / RSS Context}
+
+An RSS context consists of configurable parameters specified by \ref{sec:Device Types / Network Device
+/ Device Operation / Control Virtqueue / Receive-side scaling (RSS)}.
+
+The RSS configuration supported by VIRTIO_NET_F_RSS is considered the default RSS configuration.
+
+The device offers the feature VIRTIO_NET_F_RSS_CONTEXT if it supports one or multiple RSS contexts
+(excluding the default RSS configuration) and configurable parameters.
+
+\subparagraph{Querying RSS Context Capability}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / RSS Context / Querying RSS Context Capability}
+
+\begin{lstlisting}
+#define VIRTNET_RSS_CTX_CTRL 9
+ #define VIRTNET_RSS_CTX_CTRL_CAP_GET  0
+ #define VIRTNET_RSS_CTX_CTRL_ADD      1
+ #define VIRTNET_RSS_CTX_CTRL_MOD      2
+ #define VIRTNET_RSS_CTX_CTRL_DEL      3
+
+struct virtnet_rss_ctx_cap {
+    le16 max_rss_contexts;
+}
+\end{lstlisting}
+
+Field \field{max_rss_contexts} specifies the maximum number of RSS contexts \ref{sec:Device Types / Network Device /
+Device Operation / Control Virtqueue / RSS Context} supported by the device.
+
+The driver queries the RSS context capability of the device by sending the command VIRTNET_RSS_CTX_CTRL_CAP_GET
+with the structure virtnet_rss_ctx_cap.
+
+For the command VIRTNET_RSS_CTX_CTRL_CAP_GET, the structure virtnet_rss_ctx_cap is write-only for the device.
+
+\subparagraph{Setting RSS Context Parameters}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / RSS Context / Setting RSS Context Parameters}
+
+\begin{lstlisting}
+struct virtnet_rss_ctx_add_modify {
+    le16 rss_ctx_id;
+    u8 reserved[6];
+    struct virtio_net_rss_config rss;
+};
+
+struct virtnet_rss_ctx_del {
+    le16 rss_ctx_id;
+};
+\end{lstlisting}
+
+RSS context parameters:
+\begin{itemize}
+\item  \field{rss_ctx_id}: ID of the specific RSS context.
+\item  \field{rss}: RSS context parameters of the specific RSS context whose id is \field{rss_ctx_id}.
+\end{itemize}
+
+\field{reserved} is reserved and it is ignored by the device.
+
+If the feature VIRTIO_NET_F_RSS_CONTEXT has been negotiated, the driver can send the following
+VIRTNET_RSS_CTX_CTRL class commands:
+\begin{enumerate}
+\item VIRTNET_RSS_CTX_CTRL_ADD: use the structure virtnet_rss_ctx_add_modify to
+       add an RSS context configured as \field{rss} and id as \field{rss_ctx_id} for the device.
+\item VIRTNET_RSS_CTX_CTRL_MOD: use the structure virtnet_rss_ctx_add_modify to
+       configure parameters of the RSS context whose id is \field{rss_ctx_id} as \field{rss} for the device.
+\item VIRTNET_RSS_CTX_CTRL_DEL: use the structure virtnet_rss_ctx_del to delete
+       the RSS context whose id is \field{rss_ctx_id} for the device.
+\end{enumerate}
+
+For commands VIRTNET_RSS_CTX_CTRL_ADD and VIRTNET_RSS_CTX_CTRL_MOD, the structure virtnet_rss_ctx_add_modify is read-only for the device.
+For the command VIRTNET_RSS_CTX_CTRL_DEL, the structure virtnet_rss_ctx_del is read-only for the device.
+
+\devicenormative{\subparagraph}{RSS Context}{Device Types / Network Device / Device Operation / Control Virtqueue / RSS Context}
+
+The device MUST set \field{max_rss_contexts} to at least 1 if it offers VIRTIO_NET_F_RSS_CONTEXT.
+
+Upon reset, the device MUST clear all previously configured RSS contexts.
+
+\drivernormative{\subparagraph}{RSS Context}{Device Types / Network Device / Device Operation / Control Virtqueue / RSS Context}
+
+The driver MUST have negotiated the VIRTIO_NET_F_RSS_CONTEXT feature when issuing the VIRTNET_RSS_CTX_CTRL class commands.
+
+The driver MUST set \field{rss_ctx_id} to between 1 and \field{max_rss_contexts} inclusive.
+
+The driver MUST NOT send the command VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET when the device has successfully configured at least one RSS context.
+
 \paragraph{Offloads State Configuration}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Offloads State Configuration}
 
 If the VIRTIO_NET_F_CTRL_GUEST_OFFLOADS feature is negotiated, the driver can
diff --git a/device-types/net/device-conformance.tex b/device-types/net/device-conformance.tex
index 52526e4..c71341e 100644
--- a/device-types/net/device-conformance.tex
+++ b/device-types/net/device-conformance.tex
@@ -16,4 +16,5 @@
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Inner Header Hash}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
+\item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / RSS Context}
 \end{itemize}
diff --git a/device-types/net/driver-conformance.tex b/device-types/net/driver-conformance.tex
index c693c4f..7081ec3 100644
--- a/device-types/net/driver-conformance.tex
+++ b/device-types/net/driver-conformance.tex
@@ -16,4 +16,5 @@
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Inner Header Hash}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
+\item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / RSS Context}
 \end{itemize}
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

