Return-Path: <virtio-comment-return-9085-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0286C4828F
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 639822AEEA
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4DBEF986959
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3EBC19868E2; Wed,  7 Feb 2024 07:24:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 80D7998695F
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Feb 2024 07:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHzLHaGJbjymvSKrrhLopndEM/40jY+nZUHEeAK0QIdZ7qxB3bjRNirKU2aEcaH3Ie1JWbTREl+P+g+zHYl+fXNmYAsxOfBwkOdgmy/OJ0QERgGBYFjoG8cAvG/23xbSxPrj8d5GvLh7jAvMyMKJ2VrRSAbvF87zoLyNXuKwbJz/Q7gKkUBC8o2AmAElfHyUF9FiZmsOBPNPSJoepBMrwTUw33t2QKJ3EnsPF/iGOtntCdxuoVYJNe+s1UkCDJ7YXnqlKGGOZd+y8IGo92CEGWnAAO9QMTDGyOyytgURAHA5UJkuy+H4itFc4iYxHqinJjXMHfvFI/RiOTk9wnqHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxXZpkc4BdmpVVdV+6zpDa6QF2Pm61g0AoW1/2C3H+k=;
 b=GleQ2Kka1fAXeRyO0ETJb/xaR4oWZTC1RPF8sg2A32OAEZCt1na3rEkYDnuUlRtfbirqII0kyii5fBjMsUQPRv/YERu7bppNMcbV+5oyiYR10MOmBd2g0xosfDsy9+cmN8OWzbGenO7lpsIJ+HSuBcbDfXUjEgN2eCdyQryzfSKHloSSeNKtRaYXzWRxII8BiO+7wGVwbZUUq8apYKPgHevZU6BnkkwdoAVVyG3yMQ1JStLxXTw87xzXwqFC4JUG87scBxzZy16nKLdGKt3C5JuPKEFySJL3yexaFD3V2Owwe2t2OIOWyd0fBR+rvNKSGRfTS4MqUR8DqiHlf/etRg==
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
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Date: Wed, 7 Feb 2024 09:23:31 +0200
Message-ID: <20240207072336.477606-9-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|SA3PR12MB8804:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b761e9-7914-4904-b766-08dc27add6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2NyodjapEN6Px1j9MCNLGxf84e1NlDrq+MaEkzMy6IKgMw9QyVLRTBYksVBGXFP5zV1qvCBvknJqHLTawm4iqGFFMOcrqaUeN8ch5I63SF6GLFzJEOSUTJKnMxAz96TJkYPhAdMoVVLQ+w0BRAi/UWc+2xVbe/w/dll07MPoK+8snqy7agrEZqlUb2rJNTX0pcsHeg8A2Wx4f1iKl9kHkRdunrqM1zV9vDt3jLMAFz2aU+XchMr9DijdUwu/WyK8obnqtBb57XkSW3l+8yPJ6tFOSwEpI2AvwWwEshfKnZUnimjJvxT/65u/x6WAGkVqLFhCdAxk186ho75BcgLarpQRt25Y3r3O6gxb5zLQTX5/A1aoE2r35jVLVSuu8YSIutpzy2GedIaXpBJUJv6DuF9qcKHrlrGXZLyGN5Bp0Sxd137kCzT4zmqSB51yESv7Y6xlhsIKF977Oi6vP5NKkOvLoAXp2uB8HKEM9ysyW1nlFJQ10YvuaV9o5vX0/lesUMM465cDm8qvRlI8nbJJ/f1xWisxB/lb79AS0V17NZhfz93fwYroceFtNhs6veb2VxkjcPEoiP8KFwwDeXCgtqU9cEYBLWuqGg/ENDjpSyJgEI0vut1V9Gb5pmk3fUEF3Bp9y3P67Q4hqcgdxoZgDaiZy0Nx1WUSAqpXSC2U95uf8AwjL9ooGo8D1So1WnuN0+EDE56GeLhIZ6qCUv9nTKf84ikj7vYoDz69ppELuMZVFUKxIm7btfynx6kS9W0tINGKBsUowvUryceBCyzTP5r5p9LTTVScaBCHmWJlAMc=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(82310400011)(1800799012)(64100799003)(186009)(451199024)(36840700001)(40470700004)(46966006)(41300700001)(70586007)(2906002)(86362001)(5660300002)(8936002)(4326008)(8676002)(70206006)(316002)(54906003)(36860700001)(478600001)(36756003)(47076005)(82740400003)(966005)(356005)(6666004)(7636003)(110136005)(83380400001)(336012)(1076003)(16526019)(426003)(107886003)(26005)(2616005)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 07:24:36.4705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b761e9-7914-4904-b766-08dc27add6cb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8804
Subject: [virtio-comment] [PATCH v9 08/13] virtio-net: Add flow filter capabilities

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

