Return-Path: <virtio-comment-return-7521-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28612E6FE32
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6629A2AC63
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CAF0F9867D6
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3EC4E9866B6; Fri, 22 Sep 2023 13:50:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4EBF19866A4
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Sep 2023 13:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XeBd2y26UpRFveZc1o/scxb1vzxilFCaiwNR462HIIF5uFQ+mAakTOzut4odvf81gUsrOBfvAx8oQ2BTfUcAvg5yJFIYjmNp/JXyThB0wOLXhmvCQmea1nAg5ZZ70NXkxlwP6sgmGTie+NVPHulxryFIRfySMkOJef3dF1Fv3U8YIwPf461lMNbs4gQRzMHJdVh6oDKy4WWdHsxm8Fz+KHJ667/JtPdH+PZNFKGV96aH43JpsOArTR49Nv2OAnmlVcp1UsKzz+Ku3QGa70CP0+UgjczVGu4Wa13wd4BDse1K8xB7NsLQoo54DdEra2/x8kmDZjaABZ2wbrZRgCjPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUmf6T+ZaZoezEpDCPDHIq7Qmu43NZ97v7H+EZzbv8A=;
 b=bhpkVlOLMZtYeSSEQou2P/i9xV2Ach+TBGUPJS7HKAB9vJtyvoe/5atx1V7jpL4s9H2/pN+KAe1lYPDYBcTOUN3P72F7jLgtOvJkVghcYZOU6+M7HwcN+F1O5c7PTAKYz+BqA2fSNOCGIHX1B6WFIkrypLhocWxXOB8dUyz2R/30KrngZxG6+s9+/BlAQR9CGCXosDXl5iJS/g/WkB8dhKtgluKIZdznjcojk9M5eAQyzJyghx4SMz9U7dQp2d79zMQRu19mJXrWZP8/a+MwRTc53dcu5NYaA2pYOUz7RdavwzKpHoWYWm4YSivo6XtdvuP0FkdK8ueMkiGkdYqQzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <si-wei.liu@oracle.com>,
	<xuanzhuo@linux.alibaba.com>, Parav Pandit <parav@nvidia.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Date: Fri, 22 Sep 2023 16:48:32 +0300
Message-ID: <20230922134838.3718-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922134838.3718-1-parav@nvidia.com>
References: <20230922134838.3718-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SJ2PR12MB9239:EE_
X-MS-Office365-Filtering-Correlation-Id: d499bd05-36a2-4634-1e20-08dbbb72ad08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cA9bbBLSbfO6Vxqy/3XMdBxqc9qAFlwAkhy45whhMU6CVNVMi5pg8D3sluyxC+FN6OZy3271q3ZlEq9VNaLFHmXRI5utvnANgp6A/8gtfqEQT8l/0d6LwxrQcndQ4LB+CxaRnhAf6DJF3YA+qidHa1Y7R9Sp/0ZjxMxefBket6zEJdD1laMt4bMBluQNOboCg5HcR4yPth1wcWierEPAc4dkOFSzsS4zZrzBwfk1U0ToSBL3o9C0mrROiIAcydnyVYH5IJRV3Yel/RMv3RjW1DXjc6vVObmcINKT5GCg0dUODTNlkHapXcabOp13kfJyMQxcxBaNJWHUH7mWNtVJlUNdWRplUt9LdisaRbsgvqK0Mjq9U2sTMcA7IZZPrxCyTpbpOn9fAi0Ut0HHwC35ybco8fRM9Z4pdWAdkVfBGO+CSVffgquuEXWr2U9bSrhf4FZ1PzSm3AqPafckkgMTU/5zzdwh9g/sYnofsH4xBLtAsskUWBEtQHtaUEtFh8pslijWLz9tKkvnZMo9NzCF4g0r4h6lFtldgjrfwk3CkAXHzhdR6cjOCn2vylkrAEFKu/7Fwe3kLYXgeyoqfTCczuGd5kjmwGpWoPGJWLbJ0phXq5IcwBWhceE5Cbp19IrllmgkzPVLnBk2VUo+I9u40IxMzlFqe4LlDaXBUyX3L09NYp6Zd+0AQ+fnr1TmTRsG1XtnS8T/nBKGfjP8qYhnW5uKFBF/uG0yQ/zUcPdc6v6gtjXjKoH+x9zWT0AkHKqL0BL3pSqcvienv9GImcm8AK54GnJDmwjlqdnJaKaznLbcuhRNMkNTkQV4uIwza9H8
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(82310400011)(230921699003)(1800799009)(186009)(451199024)(40470700004)(46966006)(36840700001)(40480700001)(2906002)(5660300002)(8936002)(26005)(1076003)(41300700001)(316002)(70586007)(110136005)(4326008)(70206006)(40460700003)(54906003)(2616005)(36756003)(6666004)(7636003)(83380400001)(426003)(86362001)(82740400003)(356005)(8676002)(47076005)(16526019)(336012)(966005)(36860700001)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 13:49:00.5619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d499bd05-36a2-4634-1e20-08dbbb72ad08
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9239
Subject: [virtio-comment] [PATCH 1/7] virtio-net: Add theory of operation for flow filter

Currently packet allow/drop interface has few limitations.

1. Driver can either select which MAC and VLANs to consider
for allowing/dropping packets, here, the driver has a
limitation that driver needs to supply full mac
table for each type. Driver cannot add or delete an
individual entry.

2. Driver cannot select mac+vlan combination for which
to allow/drop packet.

3. Driver cannot not set other commonly used packet match fields
such as IP header fields, TCP, UDP, SCP header fields.

4. Driver cannot steer specific packets based on the match
fields to specific receiveq.

5. Driver do not have multiple or dedicated virtqueues to
   perform flow filter requests in accelerated manner in
   the device.

Flow filter as generic framework overcome above limitations.

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
 device-types/net/description.tex | 114 ++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..c9a8c52 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -10,7 +10,9 @@ \section{Network Device}\label{sec:Device Types / Network Device}
 removes these packets from the transmit virtqueue and sends them to
 the link. The device may have a control virtqueue. The driver
 uses the control virtqueue to dynamically manipulate various
-features of the initialized device.
+features of the initialized device. The device may have flow filter
+virtqueues. The driver uses flow filter virtqueues to steer specific
+receive packets to a specific destination such as specified receiveq.
 
 \subsection{Device ID}\label{sec:Device Types / Network Device / Device ID}
 
@@ -33,6 +35,9 @@ \subsection{Virtqueues}\label{sec:Device Types / Network Device / Virtqueues}
 controlq is optional; it only exists if VIRTIO_NET_F_CTRL_VQ is
 negotiated.
 
+The flow filter virtqueues are optional; it may exists only if VIRTIO_NET_F_FLOW_FILTER
+is negotiated and if the device reports such capability.
+
 \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits}
 
 \begin{description}
@@ -119,6 +124,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
     device with the same MAC address.
 
 \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
+
+\item[VIRTIO_NET_F_FLOW_FILTER(64)] Device supports flow filter requests.
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -150,6 +157,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
+\item[VIRTIO_NET_F_FLOW_FILTER] Requires VIRTIO_NET_F_CTRL_VQ.
 \end{description}
 
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Network Device / Feature bits / Legacy Interface: Feature bits}
@@ -1141,6 +1149,110 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 #define VIRTIO_NET_HASH_REPORT_UDPv6_EX        9
 \end{lstlisting}
 
+\subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Operation / Flow Filter}
+
+To forward a received packet to a specific receiveq or to drop the packet based
+on one ore more fields of the packet, the device supports flow filter
+functionality. The flow filter can match the packet for a flow, take an action
+such as forward the packet to the specific receiveq or drop the packet.
+For example, the driver can request the device to forward received packets
+which matches to a specific source and destination IP addresses and
+TCP ports to a specific receiveq.
+
+Each flow filter consists of one or more match fields, a flow filter priority,
+a flow filter identifier, an action to forward a packet to the destination
+or to drop the packet. Each flow filter is independent of each other.
+The driver can add, replace and delete a flow filter in the device using
+a flow filter request.
+
+The device indicates the flow filter capabilities to the driver, which
+includes various maximum device limits, supported transports and
+supported packet match fields. The driver enables the transport for flow
+filter requests using a control virtqueue command.
+
+The device support transporting flow filter requests on either the control
+virtqueue or on the flow filter virtqueues or on both. However, device
+supports enabling flow filter request only on one type of virtqueue
+at a time, i.e. either control virtqueue or flow filter virtqueues.
+Once the driver sets the flow filter request transport in the device,
+the driver can send flow filter request using the enabled transport.
+
+The flow filters are grouped using a flow filter group. Each flow filter
+group has a priority. The device first applies the flow filters of the highest
+priority group to the received packet. If there is no match for the
+flow filters of such a group for the packet, the flow filters of the next
+priority group are applied, until there is a match for the packet from such
+a group or the last group has reached.
+
+The flow filter group can have one or more flow filters. Within a flow
+filter group, a packet may find match to multiple flow filters. In such
+scenario, a flow filter with the highested priority is applied first to the
+packet, if there is no match, the next higher priority flow filter is applied.
+
+The match fields also optionally consist of a match mask. When a mask is
+specified for the flow filter, first the packet fields are masked before
+matching with the fields of the flow filter.
+
+\paragraph{Flow Filter Virtqueue}\label{sec:sec:Device Types / Network Device / Device Operation / Flow Filter / Flow Filter Virtqueue}
+
+The flow filter virtqueues are dedicated virtqueues which transport the
+flow filter requests. The driver adds flow filter request to the flow
+filter virtqueue, the device removes such a request from the virtqueue
+and executes it, when the request completes by the device, the device
+updates the result of it to the driver.
+
+The flow filter virtqueues are optional. The device may choose to support
+flow filters requests either on the control virtqueue or on the flow filter
+virtqueues or both.
+
+If the VIRTIO_F_RING_DYNAMIC is negotiated, the driver can create the
+flow filters virtqueues after the driver has finished the device
+initialization.
+
+The device can support one or more flow filter virtqueues. The driver
+can choose one to up to supported number of virtqueues to send requests.
+
+If the VIRTIO_F_RING_DYNAMIC is not negotiated, the flow filters
+virtqueues must be created during device initialization phase.
+
+\paragraph{Packet Processing Order}\label{sec:sec:Device Types / Network Device / Device Operation / Flow Filter / Packet Processing Order}
+
+Whichever filtering and steering functionality is enabled, they are
+applied in the following order to for the received packet:
+
+\begin{itemize}
+\item apply device configuration done using control virtqueue commands
+      VIRTIO_NET_CTRL_RX, VIRTIO_NET_CTRL_MAC and VIRTIO_NET_CTRL_VLAN.
+\item apply flow filter configuration done using flow filter requests.
+\item apply device configuration done using command
+      VIRTIO_NET_CTRL_MQ_RSS_CONFIG.
+\end{itemize}
+
+While processing a received packet, at any stage if the packet is dropped,
+the next level of processing is omitted.
+
+When a flow filter is matched for the packet, it also stops the processing
+of the packet for next stage.
+
+Few examples are:
+\begin{itemize}
+\item If the packet is dropped by the flow filter configuration, RSS
+      configuration is not applied to such a packet.
+\item If the packet is forwarded to a specific receiveq using flow filters,
+      RSS configuration is not applied to such a packet due to a match on the
+      flow filter request.
+\item If the packet is dropped due to VIRTIO_NET_CTRL_MAC configuration,
+      flow filters or RSS configuration is not applied to such a packet.
+\item If the packet does not find any match in any of the flow filter groups,
+      next level RSS device configuration is applied if its exists.
+\item If there are three flow filter groups configured as group_A, group_B
+      and group_C with respective priorties as 4, 5, and 6; flow filters of
+      group_C is applied first having highest group priority, if there is a match,
+      flow filters of group_B and group_A are skipped; if there is no match for
+      the flow filters in group_C, the flow filters of next level group_B are applied.
+\end{itemize}
+
+\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
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

