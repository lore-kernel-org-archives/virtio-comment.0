Return-Path: <virtio-comment-return-8123-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C049BC4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 304E1749E8
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 259FE986C3A
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1A7FC986C30; Thu,  2 Nov 2023 13:29:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 09F19986C2B
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 13:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1uX/9xRmubApxhl0rqYB9W0YAnQbJPn9mnIQZM3IqRRKmYEB5kucKxDTuyyGJ8stbTwrC2mJIcLg2j08s1TVUnkLQcVRtzzbOnJcotM2Hpd1rSs4nqmX6VL5JsFyGf98fI1mxIimqux+kSHyLfBG1b7hnbC0265qBzU7X9sX7W02jNOVbAvKoNzpgBSjN4Djwp/JgmVJ0LTIyPjIDFUpvjUuN+4ZCBtkNbgATOe40FytNO+6AMf0gAqaPjWHFVUbTn0RDZrO1XPmDmPXyHHqoelfk20Bf7WlN7Dt8zAvAq8Imty6rHGtmA4Rjy6geEIX9KgC7CHIoDWakkrHNbK4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1UyDJ9MiAtHLgqfhkWZ41zuTWwfXJ6nhg1aSksb1XI=;
 b=k1GM+KVqePe2onUcFr4DnG05iCk4TobLiDNiEbg2cnA1qLSXOrosQ0O5W5GAsuYeAhYWFPa7Mn5DhnmzYu2GPqA4z7VCAbQyQxDVxCJCTcWSaifxmxZaTOAWkKFBxFkNXmmfskn4Na3E7O4SAxVfUhxnzxF390meNfCZwY2ff8g3BVWbdO773EHHHfesyktYqvfwaqqymCIlT2VH40EKoT1AeYiYp2gUCz02kUP/EpbNsjlNRnuy5EIg7uINWbObG5TQNBgFeJuHQXnt4YRpJYRnoDRq4pfbiqtjC26keSACXyPt5Sj05oy8yAlWpc0BDeMr8ISZub7i3ykGDFvDsA==
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
Date: Thu, 2 Nov 2023 15:28:22 +0200
Message-ID: <20231102132825.1865068-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102132825.1865068-1-parav@nvidia.com>
References: <20231102132825.1865068-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|SA0PR12MB4509:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6aa75b-2cc7-4d22-05ff-08dbdba7b3ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Rw7oBo72JhaNtWVQQ+w0N6JwwnDeaQPe6sCmZIKZhyqTwHlfjYA+j6xn0kuuJ2H6qlYScMDNC+dTmXZUm7v5qCT4ZMkNqGAXlDQFzlwV5hGOdbQ1/JjhlFH4dtdLfWkQmTxHC33YHH6mFB1Jv8Qr9/fZQfa06KI1y2Ik3xniexcioYkAXIdsTtn1Sj1RS1eHCcKiWIP30I81wsmGiLBaaxIiy3gw5MOsi3AiVE0APjrNCbRj/G+jLigve6e3nrPzumSidbFSK9G2oc2fzEn7lGLqBd4b0hkpZgEvNeeohB0ksIFMLFWWkvTrbLI3vO/S3V0I5ik+DuxtqNj+maU/DhipI7uRxjBCbecIbPFEo0BD/pCGWLB5L7+hi5GBGjCzVhuDPJyaRMAcyzbi11U5Re0tBMyIyD3TZf0weQv6SpOOpMFl3Z5ygHvbciLBIc4blbbkedW6BoLOE41PExoVg0miayzxWLkMg7+TrWAb7pnLlPJ35KcsNFW/2NRGsihcCCxCHEnTMl1HNU42/pdA+KCkVB0wvrNrXjDYxCxiV43ZipXn8Ih49vjueq11SXkPuEIGDBctVdIgGkEX5hdv8kLVoJGXxYmOUjqEFLF0DwONXdw3XKVLaCCYxcT0Eq3cBTOnPyo3E5q23KZm96vUKtuJgoiRV6PrKyPfVG01fOYTen8a+NFjJBy05OdiEUwvUZnXOc6PiGe5h8fF/XxHPLTfpk4hQIlsA13lgNuHsQcNZ7iUGyHDyv+on6IcXPfNbp8uZTLvxECU8I2g97NOGaJYIXNhbkmxXdFKv1fUiuHzncvc9h5u+iAzlJP0ba79sb17jeFWBHqMhCzqvPhtA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(451199024)(186009)(1800799009)(82310400011)(64100799003)(46966006)(36840700001)(40470700004)(8936002)(5660300002)(966005)(4326008)(8676002)(41300700001)(2906002)(40480700001)(54906003)(110136005)(70586007)(70206006)(40460700003)(316002)(478600001)(86362001)(1076003)(6666004)(336012)(426003)(26005)(356005)(2616005)(36860700001)(16526019)(36756003)(7636003)(47076005)(82740400003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 13:29:12.2067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6aa75b-2cc7-4d22-05ff-08dbdba7b3ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4509
Subject: [virtio-comment] [PATCH v5 2/5] virtio-net: Add flow filter capabilities read commands

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
 device-types/net/description.tex | 208 ++++++++++++++++++++++++++++++-
 1 file changed, 206 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 246e44b..ec0803e 100644
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

