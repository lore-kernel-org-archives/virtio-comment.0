Return-Path: <virtio-comment-return-8569-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B94C61D85
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B7BEF42D76
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9B0A59868A9
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8B98E9868A5; Thu, 23 Nov 2023 09:22:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6E58B9868A3
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Nov 2023 09:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwqBmHFHmJg3eCyjs5z4mwmnUj/uMiojajsHxnP5dW1c27AAcAtzfjCC8d8Pj/050bxAZo3vZj5UG94jpSIapegQ6EZhYOC2m7fffaxHA3ercCQ0aSuNQbQOo0gyF4tqyRed1VaaE0MyDyCVfoJq7pmncW8YgBRgNKxLLMeBQpnwSKu4JeFmLxYW1r7kP3qPsUYL4e9w+eEz4nHITYA6XqmN/TIUgg6Ydf9j2HrAwnDHcwcybF2h6FY2rWxgpFajLhYn/CTe0cSpt0eTxDTj25vnRMM7Qpf8IKXcbTYIml8Xt4OFhi55trPWha8+F7+VPrU9btdzmMvbFxEkGSqEtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Olz8GtoFWfkSKRNNSlbEWKeuxRguYzcu7+bBRLr931k=;
 b=aeH5jMtNL0OSiSKRshVmJwYfyYwsQvKInSCZANwzF2cmEr58FvyQfwZk2lHOZVTF40IAr/XLoOnjxD6KzJRFGIfLR/yTX/6dbWS09TeP2qJwfNswE8rkQ1UKSplku/s7U3oi14UfmaXHvWhXn1CTqjQDqLnGUPRGXjILRwKJyyY+H4vHgB33ljJ2hOCYS8hyMG7xKSIt/64mACKNVrEXuQiB39rjGlND490GRFtm1xwSiTI4MXlu5ONHZQfCfK4XW+jk/EJZKXcPBuhIB9ejIwyXdDS7v9lpg34WX5psP4GHL1JsMOTuSZhYm9VKW9zisdLk7+2NjTJB6YWbyUoI3A==
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
Date: Thu, 23 Nov 2023 11:21:16 +0200
Message-ID: <20231123092119.2718448-3-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|IA0PR12MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: 977b818c-86f9-4d92-2b8c-08dbec05a9ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GBj9Jw0GOz3mheQZ3Uma7Mo3msbytvnTayuoMIcDWjUrA/8WOHShjGQy5BuSglHbrjy+MjJNzzQe3CorjU90GMbu2oecmKCiSTG776UK3oYpqdPlCdFguq3C4qFZ8adyR2b+IgGPU6egfdb+ZzW36xTF2bTnxLPI1wdW9DdolyoP8AVR+HcOEs2QDvedxMTPH2VDzMhTJNDKCm/UfrUpvyRDx8to9wB4K0bv/Wt/yRWyqnDPnWRRl+mgQfHLPWfPmHQqpes9RACuzJ/GQ/WhuLkmD2KN2Ry9R7g4khm5U5c/4rqk3+2WXYeE8AKKfxgl3w9sGvfw6s5K9l4ngJ1v8TheDGQz0dpexMkp7SiNdZm/zBPMePBvbtsZ15CkUX2OkslUiiwf3pW3YL0CFV21KF/k58h0i7FwU9dPSVUEAubJ6JbyQKEkG8mJfe+YPg2vmc76e1OkJVJfCbU0Pn5TB5cK35zGpA1L0mbVV4+y/TLIr8+0xnUmDW7K+LVlwQdCWHlVzIBXryxI0Jmpb7JyNK2jSK4IJCTSuHO/gFsL9tQhDGOPqJhwcPQCoTwA4FWpFer5MeYvFu9mSPwhq5Y/jkFkudvMOrEZlZZEo9V1dSciwknojjTj5cWQld5LY8jopzG609itVeRczt+sZ9SVniWilQ9ugEsAn6jJcg/FApdNAav0qnh1s+QTNzCMe0tIynRdElyQY3/K2YWPAwJUvWkv3pVj4s3+om97sthwimtfmksOLVzN/OVUr2YpX9ZDlgccGkCPrtiX+YqW+nRYt5hBZIEjXjRk1sbUScoNMkI=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(451199024)(82310400011)(1800799012)(186009)(64100799003)(46966006)(36840700001)(40470700004)(40460700003)(26005)(54906003)(1076003)(336012)(83380400001)(6666004)(2616005)(36860700001)(47076005)(5660300002)(4326008)(8676002)(8936002)(41300700001)(426003)(966005)(2906002)(478600001)(316002)(16526019)(70206006)(110136005)(70586007)(86362001)(82740400003)(36756003)(356005)(7636003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 09:22:06.7340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 977b818c-86f9-4d92-2b8c-08dbec05a9ad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7625
Subject: [virtio-comment] [PATCH v7 2/5] virtio-net: Add flow filter capabilities read commands

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
v6->v7:
- plenty of grammar corrections suggested by Cornelia
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
 device-types/net/description.tex | 207 ++++++++++++++++++++++++++++++-
 1 file changed, 206 insertions(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 03909ae..10d92d9 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1170,7 +1170,11 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 
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
@@ -1222,6 +1226,136 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
       the flow filters in group_C, the flow filters of next level group_B are applied.
 \end{itemize}
 
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
+When \field{mask_supported} is set, for the specific \field{type}, the
+device can mask packet fields with the mask supplied in the flow
+filter match entry.
+
+For each \field{type} the \field{fields_bmap} indicates supported fields
+of the packet header which can be matched.
+
+For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields
+are represented by a bitmap in \field{fields_bmap} as follows:
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
+are represented by a bitmap in \field{fields_bmap} as follows:
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
+are represented by a bitmap in \field{fields_bmap} as follows:
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
+are represented by a bitmap in \field{fields_bmap} as follows:
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
+are represented by a bitmap in \field{fields_bmap} as follows:
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
+are represented by a bitmap in \field{fields_bmap} as follows:
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
@@ -2389,6 +2523,77 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
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
+\field{max_groups} indicates total number of flow filter groups supported
+by the device whose group identifiers can be any value in the range from 0 to
+\field{max_groups - 1}. The flow filter group can have any priority in range
+of 0 to \field{max_groups - 1}.
+
+\field{max_ff_per_group} indicates the maximum number of
+flow filters per flow filter group which can be added by the driver.
+
+\field{max_ff} indicates the maximum number of flow filters across
+all the flow groups which can be added by the driver.
+
+\field{max_ff_priorities_per_group} indicates the maximum priority value
+of a flow filter within a group. A flow filter within a group can have any
+priority in range of zero to \field{max_ff_priorities_per_group - 1}.
+
+\field{max_match_fields} indicates maximum number of fields of a packet
+which can be matched by the device for a flow filter.
+
+\field{max_actions} indicates maximum number of actions for a flow filter
+that can be supplied.
+
+\field{max_flow_priorities_per_group} indicates maximum number of
+priorities supported by the device per flow filter group.
+
+\subparagraph{Flow Filter Match Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}
+
+The command VIRTIO_NET_CTRL_FF_MATCH_CAP_GET indicates which fields
+of the packet can be matched.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_ff_match_types {
+        le32 num_entries;
+        struct virtio_net_ff_match_type_cap types[];
+};
+\end{lstlisting}
+
+\field{num_entries} indicates the length of the array \field{types}.
+Each array entry of \field{types} represents the fields of the packet
+which are supported for matching by the device.
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

