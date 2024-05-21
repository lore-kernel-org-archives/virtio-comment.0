Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF6976028
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294661; cv=fail; b=TV+kjDdeZ9lPRNcBYOj+r7RWrAIo5i5RyNGqS0/J/FNWOtAbjyNnthZl5OFBrMOZSiIwYgnauE19Z7vmz5QzP/LcRHJCjXRf41RPX8IQiCxfc8vIyRLvOe4Vb7a/r1jvVszkuW6m4bWvhevlNjyqFl8jzOF2Owf+6YnxHQisJ8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294661; c=relaxed/simple;
	bh=FOAsZubWOBdEqAjyTcCHYhiXv9q/b7EA4CsMEEZnWWI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OKS7kZGR+pEFlMrD3aDsU7KBOQxreaG4QrEY34q3xjjVpkT5RDvfePlyCdrIVXdL+NU15rS6N65I2TkBTg9Bp9yHxRf5IZIG/QHGrJ3mEiaokeVrQf+tgDeWrW7qK9b4x72bUdXp+ovOzxFy5n52FHFedozojwsKhMbD8zes1G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DbBuBb3C; arc=fail smtp.client-ip=40.107.93.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DbBuBb3C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIqRmlFmJqGxgcLsm+NghblIZmBS2Mb7k183kPp7tJtDP1FwHmZGlMIP1Hb6LRz8X0suYHBXF8MZXTzwgWZ8WldYrkKAgbA6DZghOdLSOwfRxEXbY8giFCmkIdJnpz4KElK4LUi9bDOjp89QZAnwv5AzlhVJ4CkyLJN7tvLymu8NcEn5vB1BpBr4IUoYIMTXWp77R7UczC0q3xhSbwLqV2RpOt64oJjS7UQKpIx3AEkRdviba4dw/MPn7tnW4ZgZdYZwRAGqlai5xgaJXlvi0KvBaftT7giCz67Gaq1Rnhs/VzXBRuv++rtdlzdn4D96r7CSeWzuGQe/bzQbXhQabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+XfEnkMaAxBmNzthbQWpm5CiAD1Vkhs9omRTyX0BeA=;
 b=DGYfyxyNs+rtUkg+X+ocQa5t7rBaAwwr2VqW6VbNY1u4UnuPR63gkhlEu+uiNn0CXqVK7VNdAecPtZjZolGXGf8GMt0Oog16B79/7nPoK9ui5DupNFn/oMQPhqmQ7EsBx6ZdtRfxu1dOX8wF87+nw67sL8+nAwzZEIEXQk6GglKYf4QpAlQN42s76sRfGbLJySHc7VyNlv2Ql6/LHo1YnB8lSX6boSV+Jdkyk2vWiEKiht44k5bcPBZw2y+LbNlY5zrntEzS4HaeIx+syNfci4T03p38Uyj5wbsyf9R48olX7qWD/HvjM5Frq8YNIPm6iXKZ+qdNMqdZIFQuyOHDjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+XfEnkMaAxBmNzthbQWpm5CiAD1Vkhs9omRTyX0BeA=;
 b=DbBuBb3CaO08j3hxvfBFo/9S00g/f+Bakz3nYQlHQBDZLSIL9gHKaTgKnHj49EbPeEHmJ9V3dcKBUbmhB79SjhZ6uJMY8YPIilZXCVMYxAgoklXeUoieKbbubm8iUdjTQxQkHLPJaZMCJIZhWf3zn4HsVUJTl7kuWVxucz0wznV29ujQBvwdemU53Dh+2pDlUToeW5AKS3kjJ4IZdrGZ6OwdSUxAFN5B1S9g5vQSNawo/OnLpTXwBcHNTXj8Dg6qPjRqHkrAWQjAYeQFXCZ6yJmXFqsepF7yo2xYr0fMG8WJ2rOZEQiiwUV++laDKya1KjtubUVC3k8gMrJbMZYg7A==
Received: from MN2PR05CA0049.namprd05.prod.outlook.com (2603:10b6:208:236::18)
 by DM4PR12MB7501.namprd12.prod.outlook.com (2603:10b6:8:113::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 12:30:51 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::ed) by MN2PR05CA0049.outlook.office365.com
 (2603:10b6:208:236::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.16 via Frontend
 Transport; Tue, 21 May 2024 12:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:30:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:30:26 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:30:23 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v10 09/13] virtio-net: Add flow filter capability
Date: Tue, 21 May 2024 15:29:33 +0300
Message-ID: <20240521122937.2004180-10-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521122937.2004180-1-parav@nvidia.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|DM4PR12MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f33fc3-f2b5-4284-557a-08dc7991da35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f2JRcu7gCw5LFRwRCKpifmxWHydmrrI//mUR93lP4aMep5foHRINy1WdyCW8?=
 =?us-ascii?Q?Y6ipLI0AmiNcLh8RLjNBQUX4O9TxYKml1JFsEjvBWVWVXpQ+J1Sd6IYDkMx/?=
 =?us-ascii?Q?7fKvaaLEDt+uIabHE2F5Rnfj2nSJM/ug9qox4tTGpw82NhKcPN7OYSVFX9vA?=
 =?us-ascii?Q?eP8ikSUG0Uw6fXG0GV99t5h4kAkV/07QvgaRv8J7kd5WoIs5zV/cXpZtIrRD?=
 =?us-ascii?Q?LxZdoRPr2RfzBPFhi/2JMxxIcrw1ubyUWmjy2XH04QdiICJ22rZrjXlzV992?=
 =?us-ascii?Q?ZZBySNCqV1NtfFPLKVFymrUTtA9cy7suJ4WOUg62YdPButcvipvWuLvXx7t6?=
 =?us-ascii?Q?0vFQUJn/TnqGCobE1894N6yHtEOPClj8lLFp7DuFSsWUXMOZDJ9xA7je9Jhn?=
 =?us-ascii?Q?aCwBVbGzAFrGP/zdn6tqvOYS23SzMmpAuXehwGntv+lWIvrLti4jLd/rnfD7?=
 =?us-ascii?Q?9iaJgRZYlg/77nCKtAiPlWwceSYzD/FFibJI3+4AXtq/YYkSUec8q2ws8eyK?=
 =?us-ascii?Q?PuGONXKAhdXngibfeT/osOvAxjZWnRIPKbtqGMX8GB15OIYY8Mg8D9A9QFX8?=
 =?us-ascii?Q?tv1K4rp/8Jh3lNMe/a042zoD45mdDDB8HeJeHXTECiI5CIO2hI/bHhg2Rfiu?=
 =?us-ascii?Q?3FkNB4209qDZQ4/f83YAyuX7DACs3+XgRs/NtKGoJHs+/pmZnIJMKBeCOJJD?=
 =?us-ascii?Q?HO0+/vaazkEF6CO2mNSuZkNVZ1lqtbL2xCbcc65u5Dwyu0EwtZaHeDe90xh2?=
 =?us-ascii?Q?fxJzgJM1pQMXpga6OZAYoaoGFEZbrKKRwyY+hd1w8Wf54fYED+pnOPRHr0rs?=
 =?us-ascii?Q?T+X0o28gRBijFCm5SEncqqpHki22pOKjTsSuUyo8MCa+Ol2MhKTLwYai8Egk?=
 =?us-ascii?Q?dnuEIfSKgXPP7LViv8b2vMq5nK9yqD8GTOYnwmbGDuaDW7C1bsTHfg+94qd0?=
 =?us-ascii?Q?zbxKV20EI4BjIo16P4ushwYi9ixiGfVEISSawO4JWlkX8DA4IHrmYC+Qvh88?=
 =?us-ascii?Q?QHXyDG45Gs8VkgCYUObr53HF3apb0QID2hu2htbAM0GReCt6UrT3wV8Ds2i/?=
 =?us-ascii?Q?FOCItEw4Ij5AlZDmO3jW9ywBVcTsqxmhJyO0muUwBEv8QDqg8jk26gfBMTEE?=
 =?us-ascii?Q?indNeonhkfPDjNx+3OEBV0LPQYspZQggszoNtn0uzf8JCQnUI0nouqivWCB7?=
 =?us-ascii?Q?YinxJIhh1Zrg3kdzzDXlhoh1dJgJOGSHB38yZL/X7sAeZH8C/PuVUqaHNGcP?=
 =?us-ascii?Q?kjdIlgV1aycYa15TXwgJ+/JyTn+OV882KqsBuq0gK52y42DtfhM7hKpmvwZq?=
 =?us-ascii?Q?iIDUxTfbrixYdwkNuTRpj6eosH1anEGHTxVmK7lmtVhpjXH+EuxRrKqQZg6d?=
 =?us-ascii?Q?sv3As+QP2MTnlGYImjf9EV74dvld?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:30:51.6039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f33fc3-f2b5-4284-557a-08dc7991da35
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7501

Add first flow filter capability that indicates device resource
limits such as number of flow filter rules, groups and selectors.

add second capability that indicates supported selectors defining
which packet headers and their fields supported.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

---
changelog:
v9->v10:
- removed num_types field
- used singular capability
- consolidated capability to one
- removed the bmap due to generic mask and key
- added key_mask length to indicate what is the maximum size
  of key and mask fields supported by device
- added partial mask supported capability to indicate if the
  device can support it or not
- added reference to individual protocol headers
- added actions capability
v6->v7:
- plenty of grammar corrections suggested by Cornelia
- using generic device capabilities framework
- renamed max_flow_priorities_per_group to
  max_ff_rules_priorities_per_group to make it more clear
v2->v3:
- rebased on virtio-1.4 branch
- removed reference for flow filter virtqueue
v1->v2:
- addressed comments from Satananda
- added vlan type match field
- kept space for types between l2, l3, l4 header match types
- renamed mask to mask_supported with shorter width
- made more fields reserved for future
- addressed comments from Heng
- grammar correction
- added field to indicate supported number of actions per flow
  filter match entry
- added missing documentation for max_flow_priorities_per_group
v0->v1:
- added mask field in the type to indicate supported mask by device
  and also in later patch to use it to indicate mask on adding
  flow filter. As a result removed the mask_supported capability
  field
---
 device-types/net/description.tex | 194 +++++++++++++++++++++++++++++++
 introduction.tex                 |  13 +++
 2 files changed, 207 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 58d0692..1d22503 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -401,6 +401,22 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
 A truly minimal driver would only accept VIRTIO_NET_F_MAC and ignore
 everything else.
 
+\subsection{Device and driver capabilities}\label{sec:Device Types / Network Device / Device and driver capabilities}
+
+The network device has the following capabilities.
+
+\begin{tabularx}{\textwidth}{ |l||l|X| }
+\hline
+Identifier & Name & Description \\
+\hline \hline
+0x0800 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_RESOURCE_CAP]{VIRTIO_NET_FF_RESOURCE_CAP} & Flow filter resource capability \\
+\hline
+0x0801 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP]{VIRTIO_NET_FF_SELECTOR_CAP} & Flow filter classifier capability \\
+\hline
+0x0802 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_ACTION_CAP]{VIRTIO_NET_FF_ACTION_CAP} & Flow filter action capability \\
+\hline
+\end{tabularx}
+
 \subsection{Device Operation}\label{sec:Device Types / Network Device / Device Operation}
 
 Packets are transmitted by placing them in the
@@ -2442,6 +2458,14 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 matches the packet and an action is taken. If all the rules within a group
 are ignored, the group with the next highest priority is selected, and so on.
 
+The device and the driver indicates flow filter resource limits using the capability
+\ref{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_RESOURCE_CAP} specifying the limits on the number of flow filter rule,
+group and classifier resource objects. The capability \ref{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP} specifies which selectors the device supports.
+The driver indicates the selectors it is using by setting the flow
+filter selector capability, prior to adding any resource objects.
+
+The capability \ref{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_ACTION_CAP} specifies which actions the device supports.
+
 The driver controls the flow filter rule, classifier and group resource objects using
 administration commands described in
 \ref{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}.
@@ -2479,6 +2503,176 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
       the flow filter rules in group_B, the flow filter rules of next level group_A are applied.
 \end{itemize}
 
+\paragraph{Device and driver capabilities}
+\label{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities}
+
+\subparagraph{VIRTIO_NET_FF_RESOURCE_CAP}
+\label{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_RESOURCE_CAP}
+
+The capability VIRTIO_NET_FF_RESOURCE_CAP indicates the flow filter resource limits.
+\field{cap_specific_data} is in the format
+\field{struct virtio_net_ff_cap_data}.
+
+\begin{lstlisting}
+struct virtio_net_ff_cap_data {
+        le32 groups_limit;
+        le32 selectors_limit;
+        le32 rules_limit;
+        le32 rules_per_group_limit;
+        u8 last_rule_priority_per_group;
+        u8 selectors_per_classifier_limit;
+};
+\end{lstlisting}
+
+\field{groups_limit}, and \field{selectors_limit} represent the maximum
+number of flow filter groups and selectors, respectively, that the driver can create.
+ \field{rules_limit} is the maximum number of
+flow fiilter rules that the driver can create across all the groups.
+\field{rules_per_group_limit} is the maximum number of flow filter rules that the driver
+can create for each flow filter group.
+
+\field{last_rule_priority_per_group} is the highest priority
+that can be assigned to a flow filter rule.
+
+\field{selectors_per_classifier_limit} is the maximum number of selectors
+that a classifier can have.
+
+\subparagraph{VIRTIO_NET_FF_SELECTOR_CAP}
+\label{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP}
+
+The capability VIRTIO_NET_FF_SELECTOR_CAP lists the supported selectors and the
+supported packet header fields for each selector.
+\field{cap_specific_data} is in the format \field{struct virtio_net_ff_cap_mask_data}.
+
+\begin{lstlisting}[label={lst:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP / virtio_net_ff_selector}]
+struct virtio_net_ff_selector {
+        u8 type;
+        u8 flags;
+        u8 reserved[2];
+        u8 length;
+        u8 reserved1[3];
+        u8 mask[];
+};
+
+struct virtio_net_ff_cap_mask_data {
+        u8 count;
+        u8 reserved[7];
+        struct virtio_net_ff_selector selectors[];
+};
+
+#define VIRTIO_NET_FF_MASK_F_PARTIAL_MASK (1 << 0)
+\end{lstlisting}
+
+\field{count} indicates number of valid entries in the \field{selectors} array.
+\field{selectors[]} is an array of supported selectors. Within each array entry:
+\field{type} specifies the type of the packet header, as defined in table
+\ref{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP / flow filter selector types}. \field{mask} specifies which fields of the
+packet header can be matched in a flow filter rule.
+
+Each \field{type} is also listed in table
+\ref{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP / flow filter selector types}. \field{mask} is a byte array
+in network byte order. For example, when \field{type} is VIRTIO_NET_FF_MASK_TYPE_IPV6,
+the \field{mask} is in the format \hyperref[intro:IPv6-Header-Format]{IPv6 Header Format}.
+
+If partial masking is not set, then all bits in each field have to be either all 0s
+to ignore this field or all 1s to match on this field. If partial masking is set,
+then any combination of bits can bit set to match on these bits.
+For example, when a selector \field{type} is VIRTIO_NET_FF_MASK_TYPE_ETH, if
+\field{mask[0-12]} are zero and \field{mask[13-14]} are 0xff (all 1s), it
+indicates that matching is only supported for \field{EtherType} of
+\field{Ethernet MAC frame}, matching is not supported for
+\field{Destination Address} and \field{Source Address}.
+
+The entries in the array \field{selectors} are ordered by
+\field{type}, with each \field{type} value only appearing once.
+
+\field{length} is the length of a dynamic array \field{mask} in bytes.
+\field{reserved} and \field{reserved1} are reserved and set to zero.
+
+\begin{table}[H]
+\caption{Flow filter selector types}
+\label{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP / flow filter selector types}
+\begin{tabularx}{\textwidth}{ |l|X|X| }
+\hline
+Type & Name & Description \\
+\hline \hline
+0x0 & - & Reserved \\
+\hline
+0x1 & VIRTIO_NET_FF_MASK_TYPE_ETH & 14 bytes of frame header starting from destination address described in \hyperref[intro:IEEE 802.3-2022]{IEEE 802.3-2022} \\
+\hline
+0x2 & VIRTIO_NET_FF_MASK_TYPE_IPV4 & 20 bytes of \hyperref[intro:Internet-Header-Format]{IPv4: Internet Header Format} \\
+\hline
+0x3 & VIRTIO_NET_FF_MASK_TYPE_IPV6 & 40 bytes of \hyperref[intro:IPv6-Header-Format]{IPv6 Header Format} \\
+\hline
+0x4 & VIRTIO_NET_FF_MASK_TYPE_TCP & 20 bytes of \hyperref[intro:TCP-Header-Format]{TCP Header Format} \\
+\hline
+0x5 & VIRTIO_NET_FF_MASK_TYPE_UDP & 8 bytes of UDP header described in \hyperref[intro:UDP]{UDP} \\
+\hline
+0x6 - 0xFF & & Reserved for future \\
+\hline
+\end{tabularx}
+\end{table}
+
+When VIRTIO_NET_FF_MASK_F_PARTIAL_MASK (bit 0) is set, it indicates that
+partial masking is supported for all the fields of the selector identified by \field{type}.
+
+For the selector \field{type} VIRTIO_NET_FF_MASK_TYPE_IPV4, if a partial mask is unsupported,
+then matching on an individual bit of \field{Flags} in the
+\field{IPv4: Internet Header Format} is unsupported. \field{Flags} has to match as a whole
+if it is supported.
+
+For the selector \field{type} VIRTIO_NET_FF_MASK_TYPE_IPV4, \field{mask} includes fields
+up to the \field{Destination Address}; that is, \field{Options} and
+\field{Padding} are excluded.
+
+For the selector \field{type} VIRTIO_NET_FF_MASK_TYPE_IPV6, the \field{Next Header} field
+of the \field{mask} corresponds to the \field{Next Header} in the packet
+when \field{IPv6 Extension Headers} are not present. When the packet includes
+one or more \field{IPv6 Extension Headers}, the \field{Next Header} field of
+the \field{mask} corresponds to the \field{Next Header} of the last
+\field{IPv6 Extension Header} in the packet.
+
+For the selector \field{type} VIRTIO_NET_FF_MASK_TYPE_TCP, \field{Control bits}
+are treated as individual fields for matching; that is, matching individual
+\field{Control bits} does not depend on the partial mask support.
+
+\subparagraph{VIRTIO_NET_FF_ACTION_CAP}
+\label{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_ACTION_CAP}
+
+The capability VIRTIO_NET_FF_ACTION_CAP lists the supported actions in a rule.
+\field{cap_specific_data} is in the format \field{struct virtio_net_ff_cap_actions}.
+
+\begin{lstlisting}
+struct virtio_net_ff_actions {
+        u8 count;
+        u8 reserved[7];
+        u8 actions[];
+};
+\end{lstlisting}
+
+\field{actions} is an array listing all possible actions.
+The entries in the array are ordered from the smallest to the largest,
+with each supported value appearing exactly once. Each entry can have the
+following values:
+
+\begin{table}[H]
+\caption{Flow filter rule actions}
+\label{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_ACTION_CAP / flow filter rule actions}
+\begin{tabularx}{\textwidth}{ |l|X|X| }
+\hline
+Action & Name & Description \\
+\hline \hline
+0x0 & - & reserved \\
+\hline
+0x1 & VIRTIO_NET_FF_ACTION_DROP & Matching packet will be dropped by the device \\
+\hline
+0x2 & VIRTIO_NET_FF_ACTION_DIRECT_RX_VQ & Matching packet will be directed to a receive queue \\
+\hline
+0x3 - 0xFF & & Reserved for future \\
+\hline
+\end{tabularx}
+\end{table}
+
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
 
diff --git a/introduction.tex b/introduction.tex
index 8bcef03..0d84927 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -59,6 +59,10 @@ \section{Normative References}\label{sec:Normative References}
 	IEEE Standard for Local and Metropolitan Area Networks: Overview and Architecture,
 	\newline\url{http://www.ieee802.org/},
 	IEEE\\
+	\phantomsection\label{intro:IEEE 802.3-2022}\textbf{[IEEE 802.3-2022]} &
+	IEEE Standard for Ethernet,
+	\newline\url{https://doi.org/10.1109/IEEESTD.2022.9844436},
+	IEEE 802.3-2022\\
 	\phantomsection\label{intro:SAM}\textbf{[SAM]} &
         SCSI Architectural Model,
         \newline\url{http://www.t10.org/cgi-bin/ac.pl?t=f&f=sam4r05.pdf}\\
@@ -135,12 +139,21 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:IP}\textbf{[IP]} &
     INTERNET PROTOCOL
 	\newline\url{https://www.rfc-editor.org/rfc/rfc791}\\
+	\phantomsection\label{intro:Internet-Header-Format}\textbf{[Internet Header Format]} &
+    Internet Header Format
+	\newline\url{https://datatracker.ietf.org/doc/html/rfc791#section-3.1}\\
+	\phantomsection\label{intro:IPv6-Header-Format}\textbf{[IPv6 Header Format]} &
+    IPv6 Header Format
+	\newline\url{https://www.rfc-editor.org/rfc/rfc8200#section-3}\\
 	\phantomsection\label{intro:UDP}\textbf{[UDP]} &
     User Datagram Protocol
 	\newline\url{https://www.rfc-editor.org/rfc/rfc768}\\
 	\phantomsection\label{intro:TCP}\textbf{[TCP]} &
     TRANSMISSION CONTROL PROTOCOL
 	\newline\url{https://www.rfc-editor.org/rfc/rfc793}\\
+	\phantomsection\label{intro:TCP-Header-Format}\textbf{[TCP Header Format]} &
+    TCP Header Format
+	\newline\url{https://www.rfc-editor.org/rfc/rfc9293#name-header-format}\\
 	\phantomsection\label{intro:CAN}\textbf{[CAN]} &
     ISO 11898-1:2015 Road vehicles -- Controller area network (CAN) -- Part 1: Data link layer and physical signalling\\
 \end{longtable}
-- 
2.34.1

