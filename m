Return-Path: <virtio-comment-return-7878-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4B1C0032E
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:33:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 177D888E14
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:33:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0EF3198694A
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:33:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 05A8E986935; Fri, 20 Oct 2023 12:33:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC7C598693A
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Oct 2023 12:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R08s7fl6Y4/3H5LNhNuKiAoZkKE1kucGPiARKonqrZzYjOco9bNrlwKXlBMv1LQbsdoaq+KKqF01XYz1E9INBwTBezCYFfKF/qooPW2bNCMWAIgAzhrWW3+sNxORX83tJAP7wXgaCg7Hy6wFY9S5omRecBJ8BMpiNyH+kUJv1q58Ny2GzGJHvGiIt0w/IJaWeNz5o4oSiWa5J+2XZVa/T7DBRrckIUag5Di00ZbXrZUwp8y/75km/fBu3MjvbIr+rvuD5pDj9p+mMWI1XEvTTgRCS3jX9Pk5FwC6ogGQYD+lnLQPuJwxqFfFHDQ7C4z6BtA377lbZyTgGdcjM61scQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIn9lzOblxCgtKxNPLERQCVfscXWpJEMvxEv2LJuvD8=;
 b=ddOLOrlRHHeVobjCOoldimYGH9UxovcTyxal2UGCS5PhXxnbTGeGgVp+7nCcMW2sYnOMnHBSz7Y3r/BlC8MQBpr4DgaR1Zrzu8dqgSy9yCRegAIkoT6oHu6smUzn3Ffo9/q3JiT2g2FFV2ElPoC7dfj8Q2tEoGmstvPyjlc0/nxLoPzIzwrsmd8cCqgm7iR4QUqWKJQFY5ipgHXd9suXRHWfozgEAaFf1WYSePQSU1LVMpSx2zbTaGChPcchDthoNkb2yY9ipRbejuEflTPFMEZLPB7OqGBTxHBkgfyC7jaHIthYGRMdcxvgufhGviAcxJSm4pAj9q2Gxr0RxTpiEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
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
Date: Fri, 20 Oct 2023 15:32:59 +0300
Message-ID: <20231020123303.1209289-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020123303.1209289-1-parav@nvidia.com>
References: <20231020123303.1209289-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|LV8PR12MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: d75d3dad-f161-4557-2ed5-08dbd168ca18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mEk4wDXxwFB6Qeg0IMKDV1uQ4ifUAtVXf5KyKtgOq444/FMW4vLg/eICjUBPlrP2kMwtALEy/GIAZEzXTxGLLm4BdyEiOSLHswXVBmyXaVK1g0oTL+exNQmueZZpm/T96+5z9hnWBUamAKbLycGk/xisiemQ4g3q7jtN44hLT3/LNaiiNa6kFFHs07cGDxj6kZdKXqqoFOp+pN2ZuxTbOaLD4Hr4n297sB11H2dGCg1DQjZHPbPJTPEubDzz5LGhFR/F1NwbyzyUhaO1eSDcaFjhzbOGrAX0A2qHdNpT9+IlvtOMUH6CCJQir84iG4GOvhNJaSxBToqUGYjBdLh05jFb1jP6nzoWjuQwN4nIgF2wmbf5dwALMx2Ywp29Je6jOjNI6RHoSpEQpceG7bBrPsbPHsBGIQB9A9eJSvF2Ed7sVqAH5yklVSIfouOEusi9ludo59dVnpq7meZW44cG37G5oAv5QivH21PiD2clVadH+2lFnhffWBngPuwmF7lE1oWOZxgxJF+qLcwCo1P4rCMD1mDpg6Jf893DJTwW162ZweTa+eLUoCVAN2C6nj0QA2ygk4Cyfu9hHor4YUlQIJa3ydvsbjpQEyMnVZACFtTPATjiEr3NpLUXQpg9ng0fym/UDAo+tVvPN9lqhXXSq32ALs4o08B9HKFNVaF+xVIImZKJKQHCmcnr29PsxsFgeClUCRa5PK+zRft7AC452Znk7FstXG1cjhEVd6OzXQOR0z1q6ESE9aZB/DwI9OPzKizcCgOBrOIDlDWDr0ecEzigEbTxcvmu8rvhEGTenWs=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799009)(40470700004)(36840700001)(46966006)(40460700003)(2906002)(86362001)(41300700001)(30864003)(5660300002)(16526019)(47076005)(336012)(426003)(83380400001)(82740400003)(356005)(7636003)(1076003)(4326008)(36756003)(36860700001)(2616005)(26005)(8676002)(40480700001)(70206006)(8936002)(478600001)(6666004)(966005)(110136005)(316002)(54906003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 12:33:39.9506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d75d3dad-f161-4557-2ed5-08dbd168ca18
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9449
Subject: [virtio-comment] [PATCH v2 2/6] virtio-net: Add flow filter capabilities read commands

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
 device-types/net/description.tex | 220 ++++++++++++++++++++++++++++++-
 1 file changed, 218 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index b7adfb8..b94daed 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1173,7 +1173,11 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 The device indicates the flow filter capabilities to the driver. These
 capabilities include various maximum device limits, supported transports and
 supported packet match fields. The driver enables the transport for flow
-filter requests using a control virtqueue command.
+filter requests using a control virtqueue command. These control virtqueue
+commands are:
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
+and
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
 
 The device supports transporting flow filter requests on either the control
 virtqueue or on the flow filter virtqueues or on both. However, device
@@ -1181,6 +1185,8 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 at a time, i.e. either control virtqueue or flow filter virtqueues.
 Once the driver sets the flow filter request transport in the device,
 the driver can send flow filter request using the enabled transport.
+The driver enables the transport for flow filter requests using a control
+virtqueue command.
 
 The flow filters are grouped using a flow filter group. Each flow filter
 group has a priority. The device first applies the flow filters of the highest
@@ -1254,7 +1260,136 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
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
@@ -1919,6 +2054,87 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 
 Upon reset, a device MUST initialize all coalescing parameters to 0.
 
+\paragraph{Flow Filter}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter}
+
+If the VIRTIO_NET_F_FLOW_FILTERS feature is negotiated, the driver can
+send commands VIRTIO_NET_CTRL_FF_CAP_GET and
+VIRTIO_NET_CTRL_FF_MATCH_CAP_GET to query the flow filter
+capabilities of the device.
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
+        le16 max_vqs;
+        le16 start_vq_index;
+        le16 max_match_fields;
+        le16 max_groups; /* valid group id = max_groups - 1 */
+        le32 max_ff_per_group;
+        le32 max_ff; /* max flow_id in add/del = max_ff - 1 */
+        le16 max_actions;
+        u8 max_flow_priorities_per_group;
+        u8 cvq_supports_ff_req;
+};
+\end{lstlisting}
+
+The \field{max_vqs} indicates total number of flow filter virtqueues supported
+by the device. When the device does not support flow filter requests over flow
+filter virtqueues, \field{max_vqs} is zero. When \field{max_vqs} is non zero,
+the driver can enable maximum of \field{max_vqs} number of flow filter
+virtqueues starting from virtqueue index \field{start_vq_index}.
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
+When the \field{cvq_supports_ff_req} is set, the device supports
+flow filter requests using a control virtqueue. The device may support flow
+filter requests on control virtqueue or using flow filter virtqueues or both.
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

