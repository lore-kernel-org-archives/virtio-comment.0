Return-Path: <virtio-comment-return-8974-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83077C47DD3
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EB466C622F
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E2606986800
	for <virtio-comment@archiver.kernel.org>; Fri, 19 Jan 2024 19:26:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D69D09867ED; Fri, 19 Jan 2024 19:26:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 22DB498680A
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 Jan 2024 19:26:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+sxXHaZuyNMBMa7JpjJtIqDc6dboCbnC0RJ3P2Uw1MwZQF53mDqJnud8R8A7PPnOkKW4V58X24NKBXwqLzu/RuDyzwPqMtDV4+790yqWaWrKIwzmglGi0BXgyKZB1dPejAyAYrcJJpk3GEvvfoEYHUgEnYxXzGFAe7NBLktGu7+Ois8VjeXVVi7dTdIq5fLhcmiiQV/hR9ITeMELqcU4WA/9uoivZOWWiupT8ULeP/TLtuCNbogLeN1Mqk5Z/IwwItJt25ssQicRJoj1qvAo7uedB7ahsMTKPt+hN3dFtcCXr81aJ4jEfe6SlsP/U1j8Cb5Vtiy/lNLzL12FelV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxXZpkc4BdmpVVdV+6zpDa6QF2Pm61g0AoW1/2C3H+k=;
 b=FVAlYOdCNqgdqrXwobmCb0M4lmm44ND+SbJcT5ifTOg0Yuom95vseOr3fic8UeabCmlYwNYsPXnL00KQ9eyHBnnACPsIvfv4TurYzyflAjtbdLzn+CADIjIJyrBS+8JkEUlQ/qZz7dq2K2M9MEupKR4dGy5jxPyTNGBjJdMpSU3y4hBaOCub7IuO/Rqa2qjeVwRUhP7JMl6bi838zZ3BAYOgmEhA5g84nHb2FpZo1DmejI+x4DaxNIRh8V9KueglVzWNagzkVShYDGCaFTDpd7BI37HV+lgrHOyrNW7cEhv+GL9U6XOGS9OyrngZFZxFJW0bOB6AJ2mWdMq5f6USsQ==
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
Date: Fri, 19 Jan 2024 21:24:47 +0200
Message-ID: <20240119192452.3571467-9-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119192452.3571467-1-parav@nvidia.com>
References: <20240119192452.3571467-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|SA0PR12MB4462:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5aa0c3-994f-4838-7635-08dc192478d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZNDTioAmWDmiG1yspSqkAefaKF5Kj2Zy0BTlv7hZXxgB1eRyxGjMxBr58ohWJdsf1VwSUQDAlBqIHzlyGjEk4uCMyelFm8BwD5jK7ge1G/X098ZT7SYU8OWdyA8edBRpYK2L860JIukcZ1wV3P5DRkStoUsMfFVXp7xpg5MZUV591bV/dMU2XU2b+bEYIzWQ0rTU9Vvt6LTpgJ4BUTTkLYVYcSRQaP0gqIuTjITzAeTaezT6lcA49wP2m5SOVwFEqXjJu0E7XtW7Vb6EMFrIFoYa/vcGqX1s0yfjptu538PJYEyuy0Zyamd9kkB8zV4E/jLec12kxJQGiqMdQcan5MY6o/h7HV3O1LkgCAS9Y+V6MsiDQNzTj+hL2j8FuIJ3LIonVle0jtgU7clmvQFb3YU0p8uY/uAoeMgthn275wN6f7ugJvynVm3nBG/mjLp2+LQ4wRjsfM/DGSdESgusI5oyUrBwA+TldbMvH8adXgpAetv98a5qfEvf5rBZ+5myFXzGKgISQAGlg4bOgKCbPnK82Y0yrCbW254WkdspLB79TMoInu/JBwcqcP+hs3eMTx2aSiNTc9BdMvX3Hm/PosKqXSTuepcTBS/4orDQCzNdZ0ThJpUjym1qI1DIiQMLP0D9/lDG2Kyii2QkMeYKopzUlA2tjA9MBl8WRQuUE64LJYOszKoHnJjaGgxjZZJWVeqinxpSo6gK3FJUclh0vFRt7/EuTPG+/6ZFCWUnHXcCLkXL0hP5P1+oVFwylyzjqpLSynh2KEHk1AxnrLA+FLbvhp6A2nTSjinsj27d17M=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(82310400011)(451199024)(1800799012)(186009)(40470700004)(36840700001)(46966006)(70206006)(110136005)(70586007)(40460700003)(478600001)(40480700001)(966005)(316002)(54906003)(8936002)(6666004)(8676002)(7636003)(86362001)(336012)(426003)(47076005)(2906002)(36860700001)(82740400003)(356005)(83380400001)(41300700001)(5660300002)(16526019)(26005)(4326008)(36756003)(1076003)(107886003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 19:26:01.4246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5aa0c3-994f-4838-7635-08dc192478d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
Subject: [virtio-comment] [PATCH v7 08/13] virtio-net: Add flow filter capabilities

Add flow filter capabilities, the first one indicates device limits
such as number of flow filters, number of flow filter groups, support or
multiple transports etc.

The second capability indicates supported match types, and fields
of the packet.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
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
 device-types/net/description.tex | 205 ++++++++++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 407139b..efe363b 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -398,6 +398,88 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
 A truly minimal driver would only accept VIRTIO_NET_F_MAC and ignore
 everything else.
 
+\subsection{Device and Driver Capabilities}\label{sec:Device Types / Network Device / Device and Driver Capabilities}
+
+\begin{tabularx}{\textwidth}{ |l||l|X| }
+\hline
+Identifier & Name & Description \\
+\hline \hline
+0x0800 & VIRTIO_NET_FF_RESOURCE_CAP & Provides Flow filter resources capabilities \\
+\hline
+0x0801 & VIRTIO_NET_FF_MATCH_CAP & Provide Flow filter match capabilities \\
+\hline
+\end{tabularx}
+
+\subsubsection{Flow Filter Resources Capabilities}\label{sec:Device Types / Network Device / Device Capabilities / Flow Filter Resources Capabilities}
+\label{sec:Device Types / Network Device / Device Capabilities / Flow Filter Resources Capabilities}
+
+VIRTIO_NET_FF_RESOURCE_CAP capability indicates various flow filter resource limits.
+
+\begin{lstlisting}
+struct virtio_net_ff_resource_cap_data {
+        struct virtio_resource_limit groups;
+        struct virtio_resource_limit rules;
+        le16 max_match_fields;
+        le16 max_actions;
+        u8 max_rules_priorities_per_group;
+};
+\end{lstlisting}
+
+\field{cap_specific_data} for VIRTIO_NET_FF_RESOURCE_CAP is in format of
+\field{struct virtio_net_ff_resource_cap_data}.
+
+\field{groups} indicates maximum number of flow filter groups.
+
+\field{rules} indicates the maximum number of flow filter rules
+across all the flow filter groups.
+
+\field{max_match_fields} indicates maximum number of fields of a packet
+which can be matched by the device in a flow filter rule.
+
+\field{max_actions} indicates maximum number of actions per flow filter
+rule.
+
+A flow filter rule within a group can have any
+priority in range of zero to \field{max_rules_priorities_per_group - 1}.
+
+\subsubsection{Flow Filter Match Capabilities}\label{sec:Device Types / Network Device / Device Capabilities / Flow Filter Match Capabilities}
+\label{sec:Device Types / Network Device / Device Capabilities / Flow Filter Match Capabilities}
+
+VIRTIO_NET_FF_MATCH_CAP capability indicates which fields of the packet can be
+matched.
+
+\begin{lstlisting}
+struct virtio_net_ff_match_type_cap {
+        le16 type;
+        u8 mask_supported;
+        u8 reserved[5];
+        le64 fields_bmap;
+};
+
+struct virtio_net_ff_match_types_cap_data {
+        le32 num_types;
+        struct virtio_net_ff_match_type_cap types[];
+};
+\end{lstlisting}
+
+\field{cap_specific_data} for VIRTIO_NET_FF_RESOURCE_CAP is in format of
+\field{struct virtio_net_ff_match_types_cap_data}.
+
+For each \field{type}, supported match fields are listed in
+\ref{par:Device Types / Network Device / Device Operation / Flow Filter / Match Types and Keys}.
+
+\field{mask_supported} indicates if for a given \field{type} if the filter mask
+is supported or not.
+
+\field{num_types} indicates the length of the array \field{types}.
+Each array entry of \field{types} represents the fields of the packet
+which are supported for matching by the device.
+
+Each array entry of \field{types} represents packet match fields.
+
+For each \field{type} the \field{fields_bmap} indicates supported fields
+of the packet header which can be matched.
+
 \subsection{Device Operation}\label{sec:Device Types / Network Device / Device Operation}
 
 Packets are transmitted by placing them in the
@@ -2351,7 +2433,10 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 
 The device indicates the flow filter capabilities to the driver. These
 capabilities include various maximum device limits and
-supported packet match fields.
+supported packet match fields. These capabilities are:
+\ref{sec:Device Types / Network Device / Device Capabilities / Flow Filter Resources Capabilities}
+and
+\ref{sec:Device Types / Network Device / Device Capabilities / Flow Filter Match Capabilities}.
 
 Flow filter rules are grouped using a flow filter group. A flow filter
 group is a device resource. Each flow filter group has a priority.
@@ -2404,6 +2489,124 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
       the flow filter rules in group_C, the flow filter rules of next level group_B are applied.
 \end{itemize}
 
+\paragraph{Match Types and Keys}\label{par:Device Types / Network Device / Device Operation / Flow Filter / Match Types and Keys}
+
+The \field{type} for \field{struct virtio_net_ff_match_type_cap} corresponds to following table:
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

