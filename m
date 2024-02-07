Return-Path: <virtio-comment-return-9082-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92312C4828F
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 11D217A2F0
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F0631986928
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E3598986902; Wed,  7 Feb 2024 07:24:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D3D5E9868FB
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Feb 2024 07:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gB4xGkl8kJzxhm2SSvR1EQuRv7YoNsSwKy/81grXuYXaGkDDJPUFWnagMFYcKdm4RRmX9M6YQ0hCU7OEgSQ7hfrON+NQe7QUgR9g22+Yixir4vOnzBexCzFnqyaLEfe+gTfhgZsTaoyb+l1iyTmPOu5YHvNpjGrF/IEvlgN6aC07Uft+u8cvutc32dWzh7gTLP5gIWn3nwgPA6RFUSQpNuyIYqVagZy/g1EaKVijqKqkFh0TKpVSVnEjv7PDNYMzBrFRpoFumq66NekfyiBn+G77EAPP1l+P8OjE7O9vRp8fT/pNJalGcIysL64SDtq+jmp3p/ZEZiHbBu66QH6dag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9T7pKBPyQgHOwmodIMt3FoHuFYl9u96Y5d0enMtCSsg=;
 b=ImvN9cqgS/uW/swGsQ6LpTsTB4fyhcrnvHl18KF7I2SrCxi+N8WaRKlTVjOaB9Uo+BcSD1vZ3WCXZnMWmNvbpPQ9m6UoKXt9QugGT1ZkvdzJXluUCWi6Xtr4msquMRmGVqtibkTioUEXrQvnM7rp0WbFOZDhVQaqTJ96tqB/2vjK23ZB8YxiytH0t1I0Q9GnPDcNauZAigOlKqK0rD3HVo10lxnKiQhCBAizpzCY2DdZtb/lQzNMs4EwEZTCoqrE8nmdICqRyiGzZ3JrkTEQ0aXOIXM4IvCNTchjCKTVFQ1UwcVaKtUTDeqdCoB7d1CNbFwx7RuYQapfGSxOBQUsEg==
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
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Date: Wed, 7 Feb 2024 09:23:30 +0200
Message-ID: <20240207072336.477606-8-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207072336.477606-1-parav@nvidia.com>
References: <20240207072336.477606-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|DS7PR12MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3ff96d-a19c-4ee5-5441-08dc27add193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TttOvMp8IcSey/7Xw3owJ2ekQ9Od/wrVWIO+IybfHnfMc5jqkO8k4sg3mFjnQ0hQ2LvYkGbojNloylH0ouVT/Ys86i0ZtG1cpMd76No1OJBdlcdeGp5ff7oS1ZrbFECGQUHmDifJ9XUaZkO3G0mFvVOEGzPjP8X8y+wHvGrNcO1QDZcWKsR8xwUPb/I9oyg9aUSWcuBWXHmMSD4Rlf+sBUrvuz7cZWSRr2FfBWZKasBJbfxvwv+sMphSliirFTyb4WtCtpPTt/tYDk5HIOKNy5kibCqPnU0s9Byf9uZJzYP7u8tC9IPpzl1fXx8nfo8DQ6c0QTOsAUa3Y8IsYXCIVfSGx+TrjwpDE1kWVa/mGsGIcDB1HbgUiGiC0qgc7Q+uARXMy8G3ktcHOSP7NkFNdYqO9QT0sQ8eaRmV6ySW67zmUvrw8ywl4v9i3TjEN950IpNwe3D3txgG7pJcWPVYsaVKl4po8hu7r2tEHH5jRKBPtKE5PP3TMuSeQaZEYbjAY2e/iWriPVh06JUXYpkWa4mxL5dlVwIvTjutciRdpx9Ij7QjJ3Wgr2vlye4NUFHB+tj2aKWMhn04nc4uFNPQnxnew95mQOgNA+qX7+FsXUn6iVL0Gggbv/jR0XZ0bay7vf4FbROkNvKvN1wNZLYo4803JqDNtbdC/q8bSUsPNmrGq2eTAmUDMdZMfdxkAaDpgy2cTbIVAI0KdkAuydSO/z1o8l7dudp3qHO2YMv5llJGKALKsPRxrDL8PZIa9meztmeEFB0m8ka4LrXj7hA4pfuRTeutPJkUQGs1AOnRSxY=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(186009)(82310400011)(1800799012)(451199024)(64100799003)(46966006)(36840700001)(40470700004)(41300700001)(26005)(2616005)(6666004)(8676002)(336012)(2906002)(86362001)(70206006)(16526019)(4326008)(47076005)(426003)(478600001)(1076003)(966005)(70586007)(316002)(54906003)(83380400001)(82740400003)(110136005)(7636003)(356005)(5660300002)(36860700001)(107886003)(36756003)(8936002)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 07:24:27.7280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3ff96d-a19c-4ee5-5441-08dc27add193
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8229
Subject: [virtio-comment] [PATCH v9 07/13] virtio-net: Add theory of operation for flow filter

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

1. It is an extendible object that driver can create, destroy.
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
- removed dependency on feature bit and control vq
- rebased to use device capabilities and device resources
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
 device-types/net/description.tex | 79 ++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 0cc03fc..407139b 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -2325,6 +2325,85 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 of the driver's records. In such cases, the driver should allocate additional
 space for the \field{command-specific-result} buffer.
 
+\subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Operation / Flow Filter}
+
+To forward a received packet to a specific receiveq or to drop the packet based
+on one or more fields of the packet, the device supports flow filter
+functionality. The flow filter rule can match the packet for a flow, take
+an action such as forward the packet to the specific receiveq or drop the packet.
+For example, the driver can request the device to forward received packets
+which match to a specific source and destination IP addresses and
+TCP ports to a specific receiveq.
+
+Each flow filter rule is a combination of one or more match keys,
+rule processing priority, a rule identifier and an action to forward
+a packet to the destination or to drop the packet.
+
+The match fields also optionally consist of a match mask. When a mask is
+specified for the flow filter rule, first the packet fields are masked before
+matching with the fields of the flow filter rule.
+
+Each flow filter rule is independent of each other. The driver can create,
+modify, query and destroy a flow filter rule. A flow filter rule is
+a device resource that the driver can operate using device resource
+administration commands described in
+\ref{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Resources}.
+
+The device indicates the flow filter capabilities to the driver. These
+capabilities include various maximum device limits and
+supported packet match fields.
+
+Flow filter rules are grouped using a flow filter group. A flow filter
+group is a device resource. Each flow filter group has a priority.
+The device first applies the flow filter rules of the highest
+priority group to the received packet. If there is no match for the
+rules of such a group for the packet, the rules of the next
+priority group are applied, until there is a match for the packet from such
+a group or the last group has reached.
+
+A flow filter group can have one or more flow filters rules. Within a flow
+filter group, a packet may match to multiple flow filters rules. In such a scenario,
+of the matching flow filters rules, the rule with the highest priority is applied,
+skipping any matching filter rules with a lower priority; if there is no match,
+the next higher priority flow filter rule is applied.
+
+\paragraph{Packet Processing Order}\label{sec:sec:Device Types / Network Device / Device Operation / Flow Filter / Packet Processing Order}
+
+If enabled, filtering and steering functionalities are applied to the received
+packet in the following order:
+
+\begin{itemize}
+\item apply device configuration done using control virtqueue commands
+      VIRTIO_NET_CTRL_RX, VIRTIO_NET_CTRL_MAC and VIRTIO_NET_CTRL_VLAN.
+\item apply flow filter configuration done using flow filter rules.
+\item apply device configuration done using command
+      VIRTIO_NET_CTRL_MQ_RSS_CONFIG.
+\end{itemize}
+
+While processing a received packet, if the packet is dropped at any stage,
+the following levels of processing is omitted.
+
+If a flow filter rule is matched for the packet, the following levels of
+processing are omitted as well.
+
+A few examples are:
+\begin{itemize}
+\item If the packet is dropped by the flow filter configuration, RSS
+      configuration is not applied to such a packet.
+\item If the packet is forwarded to a specific receiveq using flow filter rule,
+      RSS configuration is not applied to such a packet due to a match on the
+      flow filter rule.
+\item If the packet is dropped due to VIRTIO_NET_CTRL_MAC configuration,
+      neither flow filters nor RSS configuration are applied to such a packet.
+\item If the packet does not find any match in any of the flow filter groups,
+      next level RSS device configuration is applied if its exists.
+\item If there are three flow filter groups configured as group_A, group_B
+      and group_C with respective priorities as 4, 5, and 6; flow filters of
+      group_C is applied first having highest group priority, if there is a match,
+      the flow filter rules of group_B and group_A are skipped; if there is no match for
+      the flow filter rules in group_C, the flow filter rules of next level group_B are applied.
+\end{itemize}
+
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
 
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

