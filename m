Return-Path: <virtio-comment-return-8564-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C79C61D85
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 89C8D22371
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5ECAC9868A6
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3B0279868A2; Thu, 23 Nov 2023 09:22:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B24C9868A3
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Nov 2023 09:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jR4ifwu1hhVykCDUbei8YUVyuDcZrC8dDOAgbJH7tqzUAUR4iycqrgyh8LYQyzL46pofITWZTVq/DRBhkE0gDGzozIxDe3OZQoYGhpMvSigW8tnkxp5BKrMrU8DaKE4xlADDeZNOegKSj9HjKZ271Sphwfwq2Hnch4NhcW4mjKzaY6+Fa5n4SrDcvJPse2E9i+U6vgP/zx4b8auzKMnVTtAZdMTq/LZnfg1IhqpXBoIY02Ntqpbf2KmwD18dCR/awYWHncvxkmAuMErgNIBo+0i1+peepr4/h2BJQTYOq95V0nLn2Fl+5IxHbSlHNwc8hTZxlIE/IBxjbvHdQtGwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bdck8MWbcKixqWQb5OUOCG7EiK+fnBySTaVkJe9zxhA=;
 b=mvwQ+Xyb4/5fMaqBOK2dR8kG39IBnZBhWed/n1ZmKgNU1JWFCx9KfQ7musBrfUAvI6JsUgWl3xHcoccqY30J8MOqq+XqKs0p1pSSjc8pAFyXTrLB2s3EapGRKI4bKGZDbjQ88np+2cOpXIX/TbAisE3fQQSWo2tsS33ckXR7fkGI5CtiMNajJpM4UfHQpg/B9yIwSMvGn7WT6YOtJZ7IaNKNEoxmptz8slGZZOM8QxbIlRIYgWjaNeaIC+xK/J6A8aJ2kVMTeWFjkBl35d2AI0t0r1EGPS0zlYZvhISjWd2cEO83w3LLeuwnsLIV4IN6CmQEWbMiylp/87omCCZMKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <si-wei.liu@oracle.com>,
	<xuanzhuo@linux.alibaba.com>, Parav Pandit <parav@nvidia.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Date: Thu, 23 Nov 2023 11:21:15 +0200
Message-ID: <20231123092119.2718448-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123092119.2718448-1-parav@nvidia.com>
References: <20231123092119.2718448-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|PH7PR12MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c8be9d7-cc09-41e0-961d-08dbec05a320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fXA9tzLI5tFhqky/LSWhax+QaZOnbjeQyd95Hd+KC7jmFTe1CB6k1RrklyFLjna1/rnIJgduL8icWhCNKqQ3ch5ldwqEKw1rv5p1gV7YsLWNw8K4hrX4GNv8lYg89Hp5VnS+S4JxWeRrO3UnXqI4hDyR9WHbZ8iiy30Ac3ZRndT6cAdrrqu+IpEOZHGEDoD2aifU/JfRIb0s+gAF7y4aedBzRVBH/S2Q5hW2i71Ykinva+6EKpZgwtEIduyYXygF3FT74exyNpr+1rAwBu5VKkm6qSJxx6AWqWgbZF6xkBo5ohBIOPdB8TYA2pzvx9Khse49LF4QezWJ0AA0GjNBwo4EzKpSg58aPvIOLB9KMEXZMykRjeB2xdeI0VNtH6q68lkZDset41/Zizal5MSZAwchlzYKup3yO69u24WpJIvlRVGhRq6R38xU055Rl8sOS2djCOWe8dHsyCFum27yj+7+yru3pXnEWoP0QWE3Bw/1Jz4Hko+wfDPQTliX8IdfXVYuvxdi1K6Cfn/e80FHIOJ9eg8WUiMRr3/d3xkJ2+4jeaTOV3NuE1sGEZPUVYBARJwbsqLgUUA9Xbe/eg7jTz9ptEyqf5KsIsKVPHrUyGJtpggyyFKW+S55r3pCdc1NRH5zWCvkFqDXZs69/ZDnNB/4f+moel/aj2Wy1UwNI/lgHUKfCKYxSNnSIoWu60KWNubmB8DGasQe80eOQpYzaATEVKIBE9A7ux0vb0ZGfxAandIB53We9knHXJh1LjGehCyOHhAIr5QREC/Bvbp8fKsFlpQBE2PEhvZPOUqSqSA=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799012)(64100799003)(82310400011)(186009)(451199024)(46966006)(36840700001)(40470700004)(40480700001)(16526019)(40460700003)(70206006)(54906003)(110136005)(70586007)(82740400003)(36756003)(356005)(7636003)(86362001)(36860700001)(966005)(47076005)(426003)(336012)(1076003)(83380400001)(6666004)(2616005)(2906002)(316002)(26005)(478600001)(5660300002)(4326008)(8676002)(41300700001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 09:21:55.6839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8be9d7-cc09-41e0-961d-08dbec05a320
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7114
Subject: [virtio-comment] [PATCH v7 1/5] virtio-net: Add theory of operation for flow filter

Currently packet allow/drop interface has following limitations.

1. Driver can either select which MAC and VLANs to consider
for allowing/dropping packets, here, the driver has a
limitation that driver needs to supply full mac
table or full vlan table for each type. Driver cannot add or
delete an individual entry.

2. Driver cannot select mac+vlan combination for which
to allow/drop packet.

3. Driver cannot not set other commonly used packet match fields
such as IP header fields, TCP, UDP, SCP header fields.

4. Driver cannot steer specific packets based on the match
fields to specific receiveq.

5. Driver do not have multiple or dedicated virtqueues to
   perform flow filter requests in accelerated manner in
   the device.

Flow filter as a generic framework overcome above limitations.

As starting point it is useful to support at least two use cases.
a. ARFS
b. ethtool ntuple steering

In future it can be further extended for usecases such as
switching device, connection tracking or may be more.

The flow filter has following properties.

1. It is an extendible object that driver can add or delete.
2. It belongs to a flow filter group (group has priority).
3. Each flow filter is identified using a unique identifier(id),
   has priority, match fields, destination(rq) and action(allow/drop).
4. Flow filter has optionally mask too.

This patch adds theory of operation for flow filter functionality.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v6->v7:
- addressed comments from Cornelia
- plenty of grammar corrections suggested by Cornelia
- removed stale reference to flow filter virtqueue
- removed incorrect stale hunk of a label
v4->v5:
- to avoid feature bit overlap with rss context patch, pick next
  unique bit 65
v3->v4:
- removed flow filter virtqueue section as dynamic queues are
  not supported currently
v2->v3:
- removed dependency on the dynamic queue creation as the
  infrastructure is not yet ready
v1->v2:
- fixed comments from Heng
- grammar corrections
- spelling corrections
---
 device-types/net/description.tex | 78 ++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index aff5e08..03909ae 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -122,6 +122,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
     device with the same MAC address.
 
 \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
+
+\item[VIRTIO_NET_F_FLOW_FILTER(65)] Device supports flow filter requests.
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -153,6 +155,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
+\item[VIRTIO_NET_F_FLOW_FILTER] Requires VIRTIO_NET_F_CTRL_VQ.
 \end{description}
 
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Network Device / Feature bits / Legacy Interface: Feature bits}
@@ -1144,6 +1147,81 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 #define VIRTIO_NET_HASH_REPORT_UDPv6_EX        9
 \end{lstlisting}
 
+\subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Operation / Flow Filter}
+
+To forward a received packet to a specific receiveq or to drop the packet based
+on one or more fields of the packet, the device supports flow filter
+functionality. The flow filter can match the packet for a flow, take an action
+such as forward the packet to the specific receiveq or drop the packet.
+For example, the driver can request the device to forward received packets
+which match to a specific source and destination IP addresses and
+TCP ports to a specific receiveq.
+
+Each flow filter consists of one or more match keys, a flow filter priority,
+a flow filter identifier, an action to forward a packet to the destination
+or to drop the packet.
+
+The match fields also optionally consist of a match mask. When a mask is
+specified for the flow filter, first the packet fields are masked before
+matching with the fields of the flow filter.
+
+Each flow filter is independent of each other. The driver can add, replace
+and delete a flow filter in the device using a flow filter request.
+
+The device indicates the flow filter capabilities to the driver. These
+capabilities include various maximum device limits and
+supported packet match fields.
+
+The flow filters are grouped using a flow filter group. Each flow filter
+group has a priority. The device first applies the flow filters of the highest
+priority group to the received packet. If there is no match for the
+flow filters of such a group for the packet, the flow filters of the next
+priority group are applied, until there is a match for the packet from such
+a group or the last group has reached.
+
+A flow filter group can have one or more flow filters. Within a flow
+filter group, a packet may match multiple flow filters. In such a scenario,
+of the matching flow filters the one with the highest priority is applied,
+skipping any matching filters with a lower priority; if there is no match,
+the next higher priority flow filter is applied.
+
+\paragraph{Packet Processing Order}\label{sec:sec:Device Types / Network Device / Device Operation / Flow Filter / Packet Processing Order}
+
+If enabled, filtering and steering functionalities are applied to the received
+packet in the following order:
+
+\begin{itemize}
+\item apply device configuration done using control virtqueue commands
+      VIRTIO_NET_CTRL_RX, VIRTIO_NET_CTRL_MAC and VIRTIO_NET_CTRL_VLAN.
+\item apply flow filter configuration done using flow filter requests.
+\item apply device configuration done using command
+      VIRTIO_NET_CTRL_MQ_RSS_CONFIG.
+\end{itemize}
+
+While processing a received packet, if the packet is dropped at any stage,
+the following levels of processing is omitted.
+
+If a flow filter is matched for the packet, the following levels of processing
+are omitted as well.
+
+A few examples are:
+\begin{itemize}
+\item If the packet is dropped by the flow filter configuration, RSS
+      configuration is not applied to such a packet.
+\item If the packet is forwarded to a specific receiveq using flow filters,
+      RSS configuration is not applied to such a packet due to a match on the
+      flow filter request.
+\item If the packet is dropped due to VIRTIO_NET_CTRL_MAC configuration,
+      neither flow filters nor RSS configuration are applied to such a packet.
+\item If the packet does not find any match in any of the flow filter groups,
+      next level RSS device configuration is applied if its exists.
+\item If there are three flow filter groups configured as group_A, group_B
+      and group_C with respective priorities as 4, 5, and 6; flow filters of
+      group_C is applied first having highest group priority, if there is a match,
+      the flow filters of group_B and group_A are skipped; if there is no match for
+      the flow filters in group_C, the flow filters of next level group_B are applied.
+\end{itemize}
+
 \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
 
 The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
-- 
2.34.1


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

