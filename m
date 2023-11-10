Return-Path: <virtio-comment-return-8324-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132D5C4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6A9A260D40
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6336D986D25
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 588B8986D08; Fri, 10 Nov 2023 12:39:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B299986D09
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:39:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZqcW/qzRZM6YVQNKGJwfZOFR+w6QMpXb2JwEuyA31DKmc32/8plXf013DJmAonyIs+UW4WzX44CEvLF9VqAA/ZDfYR3kemgYKqNpdwYZwz/k/s9UAoy7fD4pkA7jPHRiAnRVRn2/PNDu2opFSBIVicPSsuXPH74HHMM0NTKGV04NNioDpR6aSqwbfaAD+wsjXNx0m7r7Kdl9DrgprMfNQHWjKpmxMf5/J4kM5z9txaLrhu4j0nQ+VlLjEen0IGsV0+dFtE6JNJIgSMj375k0QcVXX8/UUIfOT/pbUytTtmMkIad8zW5eqq1kzc0xONLZtg68tiOvueI8r+SSlpOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ft0JZFvGtA65+J1XR1W07WB2SSaoflMT1etc+wZCKrg=;
 b=hJnKL3cT7bn2hDN2ZFNw8NaRI3iteYCBJUotsSl2dq8bNbN9wZfw7wvPmRIGXPY8hXssdEfMYnDdJg1MHwMTrMal+4phABxg6IGGuM3XhK766eXgCNqloa3cg3xWap+qmJxApZY152X5lbkNvEDXV8i/vHjaDLA07fVZnc6FsUcWEgZzQTrHoOiskebaFh9MDmADsXFAsCSi3H1KoAb+soHl4tqSiL4QZzXo0+Dbc8lXucoHpQFOOZ10WoV1nrTTJOjS6Phc5uewScu7TjmAtESNsFbqhMUlMHyDP5cHB2CZSdnE7vGq6CxK/lTSonu0fGARKaIa/UOs6QVaqywESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
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
Date: Fri, 10 Nov 2023 14:38:49 +0200
Message-ID: <20231110123853.2093309-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110123853.2093309-1-parav@nvidia.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|PH8PR12MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 70279802-c6b9-4bff-323b-08dbe1ea1292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C5GsT+K/leYcB4HgGEESsKNKp3KZNRHpPacprZp6wU5nohu6lBO2jGz1nBiUc4rjo6WRQUfIX9t6D14ZbgPJtQYAZhDFJjuVAdb2HpMCC03+AycsVY16GYrSjI1ADx/W9QGJ69Jzy2RI0+2jhJ/c6p0fKvyx7X/YeuBe7N3eoLKUDvI0nbEK63baug2hs8xHDrb/7LmznRL5h3zydfVct9o930q5jJ5XeUuw53lLEEsz0jYD1I4UIUhzJowz8waAUeSHxoOC0nvoQZ33vH1mWO/T4tYrtj++CeyATDRuokyJH8l0jRXaqQstcxXoh2acXTjh6d198ro5zpsymm/4W7ZHBCKC61FWmZyDcJsqWfZIUgSbh4WEQXSkIsmTOzpQow18i8C+QpZVFQaPqRTVCbMQHN3tCD6CxIZgtO2erLNZvCbgRrBGPECrVcc5WZc8HD0HiFmQKuOgZYxjHuc67OcmBBJXFRTgJ+ssIuqHTy0XQhgfZiz1fFHqSEDe9qgZ9S202QM3FRlOufIkSQ5j/ZdaP4cYY6PGDyWdLmtKxuj2nf5FL6dAdeN7mhDgJH3u10yLJ6DurUHGPNXVUB1W1XlOZTueX/ZTowXpV4M3D0QcdgV55asS5MrMLKzR/j1qhNJcgQ6LwsCiKrOEjqxDosvW7qUVlUuBHWfQf56/XJQQasY10eRCH5hqS9jkoSG9BFOju9tDLH8d6VS43wFAcaWTT60zVyPsoNn7vfrxllCpvH2vo+hnGiFoBDhoZsIRjzAvAZmNEuWwXNUkoBlEMScUIo323gzsNsd71rXmL/M=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(82310400011)(46966006)(40470700004)(36840700001)(36756003)(40460700003)(110136005)(86362001)(316002)(70206006)(70586007)(54906003)(83380400001)(4326008)(8936002)(8676002)(26005)(16526019)(41300700001)(426003)(336012)(6666004)(2906002)(36860700001)(47076005)(1076003)(5660300002)(2616005)(82740400003)(966005)(40480700001)(478600001)(356005)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:39:25.1818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70279802-c6b9-4bff-323b-08dbe1ea1292
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7374
Subject: [virtio-comment] [PATCH v6 1/5] virtio-net: Add theory of operation for flow filter

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
v4->v5:
- to avoid feature bit overlap with rss context patch, pick next
  unique bit 65
v3->v4:
- removed flow filter virtqueue section as dyanmic queues are
  not supported currently
v2->v3:
- removed dependency on the dynamic queue creation as the
  infrastructure is not yet ready
v1->v2:
- fixed comments from Heng
- grammar corrections
- spelling corrections
---
 device-types/net/description.tex | 81 ++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index aff5e08..30220b5 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -33,6 +33,9 @@ \subsection{Virtqueues}\label{sec:Device Types / Network Device / Virtqueues}
 controlq is optional; it only exists if VIRTIO_NET_F_CTRL_VQ is
 negotiated.
 
+The flow filter virtqueues are optional; it may exists only if VIRTIO_NET_F_FLOW_FILTER
+is negotiated and if the device reports such capability.
+
 \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits}
 
 \begin{description}
@@ -122,6 +125,8 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
     device with the same MAC address.
 
 \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
+
+\item[VIRTIO_NET_F_FLOW_FILTER(65)] Device supports flow filter requests.
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -153,6 +158,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
+\item[VIRTIO_NET_F_FLOW_FILTER] Requires VIRTIO_NET_F_CTRL_VQ.
 \end{description}
 
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Network Device / Feature bits / Legacy Interface: Feature bits}
@@ -1144,6 +1150,81 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
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
+Each flow filter consists of one or more match key, a flow filter priority,
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
+The flow filter group can have one or more flow filters. Within a flow
+filter group, a packet may find a match to multiple flow filters. In such
+scenario, a flow filter with the highest priority is applied first to the
+packet, if there is no match, the next higher priority flow filter is applied.
+
+\paragraph{Packet Processing Order}\label{sec:sec:Device Types / Network Device / Device Operation / Flow Filter / Packet Processing Order}
+
+Whichever filtering and steering functionality is enabled, they are
+applied in the following order for the received packet:
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
+      and group_C with respective priorities as 4, 5, and 6; flow filters of
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

