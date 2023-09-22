Return-Path: <virtio-comment-return-7522-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32228E6FE33
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E29D226A58
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24FD098685A
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AF360986723; Fri, 22 Sep 2023 13:50:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 686479866A3
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Sep 2023 13:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofaAfHJdaPqR86UnkbpRZUVzILWbX6WkXnmY4wxhqMqgZByxeraSFhrC6F8zaVeKeT7RuREUR0FXKPCK0U10m51Oz5EC55+wEPRF+PBcAVRSikhMCjQdktpsqyiDYJ7r5N9QBRspzOrPIPvkjH4lPDuV8pUqk9XocqR13PnH6tteHPuANYPmfP6l1c1bUd4VxKKFlfLaBxYHSpv8B2+TdNs79xf3e03zGlpqYgbqSZT5SIwjcJITAHma2glX7Ev7yLjDPhuj0gubsAbrbVIqaEr08Q/U2f0SKcTvf6Ywq3uLESkbuHVSZtPyHonzevsq5mJxRe1oUIEOSpivGihfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i74mhQVhjFduxLWGg3txQQZMKeJQnPY+t4maxS2sx6k=;
 b=MpNg2KwwHxRM3uwwYtB8pUpzE/1IPRKrtLSJFD1cNrAPbhsF8hGHh2DLCEJZwr9lBUWRIf+DhDCCPW60Lwi3V2v10hPNQhPS8uFP1kbHewWkyv8uTW0d1ND0k3VhCQKOJOL1dQ6ihvNpvXumTP6Hcr5RaIEG1h7z+K7I7aw5ieGtrluGF9XZbObMJclzUuyghvDPkASltulNuzWKov3TGZNXGbq75kWH8nnq//7Gg/Fzfyu+wRfSBNiujAGXxC7V0dosr2diedJpj87h93rtGZgCWvealzrbFuGvuA+UwGfylnLjmNZMwrCgl9FtNzkGEdZHnlqRzouCCOAUPJBKtA==
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
Date: Fri, 22 Sep 2023 16:48:33 +0300
Message-ID: <20230922134838.3718-3-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SJ2PR12MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: f58f7c38-a868-4bd0-dfbb-08dbbb72af0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+P042yAfsrURQVbaeWf+/1l80GRUAij+xcSMJumd4bA7qTnvlF4Z1klTdiU10GFFRB3ovxZwYJYcFBym+J6HtQ0XPowGOl8Uue5AmtX+/W/VhvIJiuGQApSwkefuKnz8hxdJmsOKchUTiKu+B1DKhNunSLH9ritpeSnUuqgsEoGvqnECpBrUHcVjDcaiyYLCNR7rYYGaST9s8UJZDAA2Q+Y9T1JaSN+6Cw9r5CvozFL1eVZZn2RBlTOi48Raqr2+WuaGPxWeN5J9pMV0M/abWLcg4758sJE5KttDZjOvJGb8jSuoagdCcdORLeZtJGJGc/qVl8wHnlqmuSZbmU2dyIvmnSZHCamPwuIVEGIHPswLUbrJJCjlLa+hb7ffoFH7TQqAppx/coy+X/pcwAmoUXZSqe/igi0+Vu6ymZurKLHv5vL72HeVyujMc5DDAL25CwQl8rzXlUXWIydGbZrR4sCiqAloHEZE/kiM1LGbeVtAYfFAdViFZnbrUm5+94CU5Lsf6nJ42xBau2b1XoZtgQijXerjMF9X+ZRvWh1N9TR4/WwllxvBzVlPgl7O6lFUCkKdlFODL0YUs+Im6sj1flhUbc2NSeFaR/CSv5qDbKPoyl6eACBXqI8nrAkrdH3D0ycJhcXs10nc90vl19p6Yhq6vEY4K06s0PDoxSkbTd+cj3rzPJ3p24NM0m2QJnecNOj5BYizizf4jBGQVcaCZZuqpX7pDi+AFRoKCRUlAPt35FmuZpuavxTlZg2BH8n5CM9yM21LhcEapV+/dwdIpKrYeaKedTpTEc4OsmIcoOFBAYAfNiO83Y0eDSHujO3Z
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(82310400011)(1800799009)(230921699003)(186009)(451199024)(46966006)(40470700004)(36840700001)(356005)(2616005)(82740400003)(40480700001)(70586007)(7636003)(70206006)(110136005)(36860700001)(47076005)(478600001)(336012)(6666004)(426003)(16526019)(1076003)(26005)(40460700003)(4326008)(5660300002)(316002)(41300700001)(8676002)(54906003)(8936002)(966005)(36756003)(2906002)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 13:49:03.9682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f58f7c38-a868-4bd0-dfbb-08dbbb72af0f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7920
Subject: [virtio-comment] [PATCH 2/7] virtio-net: Add flow filter capabilities read commands

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
 device-types/net/description.tex | 194 ++++++++++++++++++++++++++++++-
 1 file changed, 192 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index c9a8c52..bf6d4c5 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1168,7 +1168,11 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 The device indicates the flow filter capabilities to the driver, which
 includes various maximum device limits, supported transports and
 supported packet match fields. The driver enables the transport for flow
-filter requests using a control virtqueue command.
+filter requests using a control virtqueue command. These control virtqueue
+commands are:
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
+and
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}.
 
 The device support transporting flow filter requests on either the control
 virtqueue or on the flow filter virtqueues or on both. However, device
@@ -1252,7 +1256,111 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
       the flow filters in group_C, the flow filters of next level group_B are applied.
 \end{itemize}
 
-\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Setting Promiscuous Mode}%old label for latexdiff
+\paragraph{Match Types and Fields}\label{sec:Device Types / Network Device / Device Operation / Flow Filter / Match Types and Fields}
+
+\begin{lstlisting}
+struct virtio_net_ff_match_type {
+        le32 type;
+        le32 reserved;
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
+0   & VIRTIO_NET_FF_ETH_HDR & Ethernet header of the packet  \\
+\hline
+1   & VIRTIO_NET_FF_IPV4_HDR & IPv4 header of the packet \\
+\hline
+2   & VIRTIO_NET_FF_IPV6_HDR & IPv6 header of the packet \\
+\hline
+3   & VIRTIO_NET_FF_TCP_HDR & TCP header of the packet \\
+\hline
+4   & VIRTIO_NET_FF_UDP_HDR & UDP header of the packet \\
+\hline
+other   & -    & reserved  \\
+\hline
+\end{tabular}
+
+For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields
+are represented by a bitmap in \field{fields_bmap} are following:
+
+\begin{tabular}{|l|l|l|}
+\hline
+Bit & Name & Description \\
+\hline \hline
+0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the packet  \\
+\hline
+1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet \\
+\hline
+2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
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
+other   & -    & reserved  \\
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
+other   & -    & reserved  \\
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
+other   & -    & reserved  \\
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
@@ -1917,6 +2025,88 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 
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
+        le32 max_ff; /* max flow_id in add/del
+                                * = max_ff - 1.
+                                */
+        u8 max_flow_priorities_per_group;
+        u8 cvq_supports_ff_req;
+        u8 field_mask_supported;
+};
+\end{lstlisting}
+
+The \field{max_vqs} indicates total number of flow filter virtqueues supported
+by the device starting from virtqueue index \field{start_vq_index}. When the
+device do not support flow filter requests over flow filter virtqueues,
+\field{max_vqs} is zero. When \field{max_vqs} is non zero, the driver can enable
+maximum of \field{max_vqs} number of flow filter virtqueues starting from
+virtqueue index \field{start_vq_index}.
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
+When the \field{cvq_supports_ff_req} is set, the device supports
+flow filter requests using a control virtqueue. The device may support flow
+filter requests on control virtqueue or using flow filter virtqueues or both.
+
+When the \field{field_mask_supported} is set, the device supports
+masking packet content with the supplied mask of the flow filter before
+comparing the resulting value with the flow filter match fields.
+
+\subparagraph{Flow Filter Match Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Match Capabilities Get}
+
+The command VIRTIO_NET_CTRL_FF_MATCH_CAP_GET indicates which fields
+from the packet can be matched.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_ff_match_types {
+        le32 num_entries;
+        struct virtio_net_ff_match_type types[];
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

