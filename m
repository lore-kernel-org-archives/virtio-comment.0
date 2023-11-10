Return-Path: <virtio-comment-return-8325-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE539C4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4DE4471C96
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3C0EB986D10
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3074A986D04; Fri, 10 Nov 2023 12:39:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 22D77986D05
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0DnY+a8+d3AGxcuoM/s11pNJxPLEyiyf9iE2spnw9XMSm8h9ZiMFXt+KZnCwTNfyYEnx2Rmc5Zrx5M6Ur5mNF///na79QhotnoyVAvRd12ORIdoAIi804UyK7F7OF/UxtiBLhongiQxoFqf7OeRZozlCEN5ovWXYldZn4hD/fK98Zm0iufgoLOdggFcidzX2CIRY/KKjbkhAJtIEgskA3WiCigUgZ7XrgRbMuTcPBkzhoOIL+/3vlg7Vh+xSVbsY9mgNfr2+DJc8S7SYdNhoi1J3WPmFAqM/D0B+oW0uXU5aK7Nj9ZfKwRCZZ6g9dx4KGve+8QbDXTqYtl1ZP5xKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPJg0QwIN1orggoiZLRpgx949BEsL1uwrf0PBLHQeO0=;
 b=VBB5z8qQpGKRdYnbgp3EuP5Yz/980VOoREehgJO13RUucLkq93ikg1ofIgmziJdQHq1oCdp7XWH+AagCWbGs8WqlNo4lC1fgBwaBB99Nk7UjXCMqc1K1x0DhHf+bE04Q467lyMPc/807zkUiuf4tP1q8LCZjHXmEKsStFi5L+fAMPKgfwvot23BMocGn4q9w7OLYlFaSgLjyLlBoPezXtE7jQB3otywvG3JzZb93j+g8DBj/b0KuLF8rt74zXL0IgEZJbAftXO0G5MqSGSnM12SPecOTS2wwP4lX1ySHZzR1g1XxmfBog00L770sAa7OP76K7WeE4Knun01Kua8vXA==
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
Date: Fri, 10 Nov 2023 14:38:50 +0200
Message-ID: <20231110123853.2093309-3-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|SJ0PR12MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f476812-2e85-4c7c-4c6c-08dbe1ea1804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JjSvgdNbAxSc0gobcK441eIVI/ENHfllT2jl9DHUrb6hPf/M2CvQm+ewVCohdmdV2mHo9ql0IrFlszB6uC7G13bHdlbuceTXmBIcNK411j/x2A77hSmPG5zBbzFn5J0RdI5iVv/w0F+hsbdg7csuRDaaEsn+B43hVTRtzCG0KEiaU6yBttKH9wSPkHRz/9RRFCNjYUhVwz3of+yOcVhUKXp31YM+Vg5/Z870rZ6sEtRf+40Uk/StyipGwg+hmG07ekdt7/dO2PRQYeSnPlG+6ARGAH80f0bD/qOMXzwgsOpCpIQ1YlkLMifFgRYIiRAm6FUliTdG86/NwL5z8K+uBph2hFnzvCNSWN2L+RALU+lB41LL5W0NxDxIq9e62idKEMeORAy4XMrEH1kZURyD7IfYJsxspNuLwrJvWSySmyRD05CO1AOaKgNeegfkOp/EU8gWzMMGjDr+Wpyjt6x2ohY3jU67X4PEzd40xbZhzqPcW/cGX/T4j7h7o+8dc53OVZAn/4qAndEzSG4JHZUd4lK4X5Nqdk4jdPkX//W71v56ZtxL5gaGezz5SlXgoimRBdtP4ZVX5zo9RXC9oYqvUqxvlr2ZcDoZtqkyqhXB7Vhqo7/98N+ZzXL4SrZptWIx9FqGUyImy7kE8VsNo9Cadt23U9sDNfAkzXSEzsccDVcRfu4DeO1zOfF1cL/M3dQ9B313jKHrHyRJRWY8GuFj1cMIdpOPSuveMuXZoBbFYsbdtvZw+z03yuxFlDmZdiS2McZaxwfISiuWmJoeaFOv5sVauEV6HaFTI5i0bxurcyk=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(478600001)(82740400003)(83380400001)(86362001)(36756003)(36860700001)(7636003)(356005)(47076005)(110136005)(41300700001)(1076003)(70206006)(6666004)(966005)(70586007)(426003)(316002)(336012)(26005)(2906002)(5660300002)(16526019)(2616005)(8676002)(8936002)(54906003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:39:34.2557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f476812-2e85-4c7c-4c6c-08dbe1ea1804
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6685
Subject: [virtio-comment] [PATCH v6 2/5] virtio-net: Add flow filter capabilities read commands

The device responds flow filter capabilities using two commands.
One command indicates generic flow filter device limits such as
number of flow filters, number of flow filter groups, support or
multiple transports etc.

The second command indicates supported match types, and fields
of the packet.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v2->v3:
- rebased on virtio-1.4 branch
- removed reference for flow filter virtqueue
v1->v2:
- addressed comments from Satananda
- added vlan type match field
- kept space for types between l2, l3, l4 header match types
- renamed mask to mask_supported with shorter width
- made more fields reserved for furture
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
 device-types/net/description.tex | 208 ++++++++++++++++++++++++++++++-
 1 file changed, 206 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 30220b5..eccd8d6 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1173,7 +1173,11 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 
 The device indicates the flow filter capabilities to the driver. These
 capabilities include various maximum device limits and
-supported packet match fields.
+supported packet match fields. These control virtqueue
+commands are:
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
+and
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
 
 The flow filters are grouped using a flow filter group. Each flow filter
 group has a priority. The device first applies the flow filters of the highest
@@ -1224,7 +1228,136 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
       the flow filters in group_C, the flow filters of next level group_B are applied.
 \end{itemize}
 
-\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
+\paragraph{Match Types and Fields}\label{sec:Device Types / Network Device / Device Operation / Flow Filter / Match Types and Fields}
+
+\begin{lstlisting}
+struct virtio_net_ff_match_type_cap {
+        le16 type;
+        u8 mask_supported;
+        u8 reserved[5];
+        le64 fields_bmap;
+};
+\end{lstlisting}
+
+The \field{type} corresponds to following table:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Type & Name & Description \\
+\hline \hline
+0   & VIRTIO_NET_FF_ETH_HDR & Ethernet header of the packet \\
+\hline
+0x1   & VIRTIO_NET_FF_VLAN_TAG_HDR & VLAN tag of the packet \\
+\hline
+0x200   & VIRTIO_NET_FF_IPV4_HDR & IPv4 header of the packet \\
+\hline
+0x300   & VIRTIO_NET_FF_IPV6_HDR & IPv6 header of the packet \\
+\hline
+0x400   & VIRTIO_NET_FF_TCP_HDR & TCP header of the packet \\
+\hline
+0x500   & VIRTIO_NET_FF_UDP_HDR & UDP header of the packet \\
+\hline
+other   & -    & reserved \\
+\hline
+\end{tabular}
+
+When the \field{mask_supported} is set, for the specific \field{type}, the
+device can perform masking packet fields with the mask supplied in the flow
+filter match entry.
+
+For each \field{type} the \field{fields_bmap} indicates supported fields
+of the packet header which can be matched.
+
+For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields
+are represented by a bitmap in \field{fields_bmap} are following:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Bit & Name & Description \\
+\hline \hline
+0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the packet \\
+\hline
+1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet \\
+\hline
+2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
+\hline
+other   & -    & reserved \\
+\hline
+\end{tabular}
+
+For the \field{type} of VIRTIO_NET_FF_VLAN_TAG_HDR, VLAN tag fields
+are represented by a bitmap in \field{fields_bmap} are following:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Bit & Name & Description \\
+\hline \hline
+0   & VIRTIO_NET_FF_VLAN_TAG_TCI & Vlan tag TCI 16-bit field \\
+\hline
+other   & -    & reserved \\
+\hline
+\end{tabular}
+
+For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, header fields
+are represented by a bitmap in \field{fields_bmap} are following:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Bit & Name & Description \\
+\hline \hline
+0   & VIRTIO_NET_FF_SRC_IPV4 & Source IPV4 address in the packet \\
+\hline
+1   & VIRTIO_NET_FF_DST_IPV4 & Destination IPV4 address in the packet \\
+\hline
+other   & -    & reserved \\
+\hline
+\end{tabular}
+
+For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields
+are represented by a bitmap in \field{fields_bmap} are following:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Bit & Name & Description \\
+\hline \hline
+0   & VIRTIO_NET_FF_SRC_IPV6 & Source IPV6 address in the packet \\
+\hline
+1   & VIRTIO_NET_FF_DST_IPV6 & Destination IPV6 address in the packet \\
+\hline
+other   & -    & reserved \\
+\hline
+\end{tabular}
+
+For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields
+are represented by a bitmap in \field{fields_bmap} are following:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Bit & Name & Description \\
+\hline \hline
+0   & VIRTIO_NET_FF_SRC_TCP_PORT & Source TCP port in the packet \\
+\hline
+1   & VIRTIO_NET_FF_DST_TCP_PORT & Destination TCP port in the packet \\
+\hline
+other   & -    & reserved \\
+\hline
+\end{tabular}
+
+For the \field{type} of VIRTIO_NET_FF_UDP_HDR, header fields
+are represented by a bitmap in \field{fields_bmap} are following:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Bit & Name & Description \\
+\hline \hline
+0   & VIRTIO_NET_FF_SRC_UDP_PORT & Source UDP port in the packet \\
+\hline
+1   & VIRTIO_NET_FF_DST_UDP_PORT & Destination UDP port in the packet \\
+\hline
+other   & -    & reserved  \\
+\hline
+\end{tabular}
+
 \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
 
 The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
@@ -2392,6 +2525,77 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 of the driver's records. In such cases, the driver should allocate additional
 space for the \field{command-specific-result} buffer.
 
+\paragraph{Flow Filter}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter}
+
+If the VIRTIO_NET_F_FLOW_FILTER feature is negotiated,
+
+\begin{itemize}
+\item the driver can send commands VIRTIO_NET_CTRL_FF_CAP_GET and
+VIRTIO_NET_CTRL_FF_MATCH_CAP_GET to query the flow filter
+capabilities of the device.
+\end{itemize}
+
+\begin{lstlisting}
+#define VIRTIO_NET_CTRL_FF 7
+ #define VIRTIO_NET_CTRL_FF_CAP_GET 0
+ #define VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1
+\end{lstlisting}
+
+\subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
+
+The command VIRTIO_NET_CTRL_FF_CAP_GET provides the flow filter device capabilities.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_ff_caps {
+        le16 max_match_fields;
+        le16 max_groups; /* valid group id = max_groups - 1 */
+        le32 max_ff_per_group;
+        le32 max_ff; /* max flow_id in add/del = max_ff - 1 */
+        le16 max_actions;
+        u8 max_flow_priorities_per_group;
+};
+\end{lstlisting}
+
+The \field{max_groups} indicates total number of flow filter groups supported
+by the device whose group identifier can be any value in the range from 0 to
+\field{max_groups - 1}. The flow filter group can have any priority in range
+of 0 to \field{max_groups - 1}.
+
+The \field{max_ff_per_group} indicates maximum number of
+flow filter per flow filter group which can be added by the driver.
+
+The \field{max_ff} indicates maximum number of flow filters across
+all the flow groups which can be added by the driver.
+
+The \field{max_ff_priorities_per_group} indicates maximum priority value
+of a flow filter within a group. A flow filter within a group can have any
+priority in range of zero to \field{max_ff_priorities_per_group - 1}.
+
+The \field{max_match_fields} indicates maximum number of fields of the packet
+which can be matched by the device for a flow filter.
+
+The \field{max_actions} indicates maximum number of actions for a flow filter
+match entry can be supplied by the driver.
+
+The \field{max_flow_priorities_per_group} indicates maximum number of
+priorities supported by the device per flow filter group.
+
+\subparagraph{Flow Filter Match Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}
+
+The command VIRTIO_NET_CTRL_FF_MATCH_CAP_GET indicates which fields
+from the packet can be matched.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_ff_match_types {
+        le32 num_entries;
+        struct virtio_net_ff_match_type_cap types[];
+};
+\end{lstlisting}
+
+The \field{num_entries} indicates the length of an array \field{types}.
+Each array entry of \field{types} represents supported match fields of
+the packet by the device.
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

