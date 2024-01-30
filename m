Return-Path: <virtio-comment-return-9048-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99C1C46CD2
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:08:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5AB722AD6D
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A9BC9868BF
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3D27E986886; Tue, 30 Jan 2024 14:07:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 251A1986896
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 14:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIooOBqBR7+Y4XZAYKYP4LgryusrryzUDBvvw0ckq+hq9BF/Rc3kHijNJfU0chFS+/2G08mOT6NcOuFl5BCE6xKy+4vwhWeJglZ1kbxOCBeWZ7gkQP4mcrx+CrpQM3mtazL1kdit9JMnJxv8noCFMDs8J1eUyzMaVfVVVCUShbS4HuYVjqa2lkE2ZayVze28SRukRLk4gNGtP6Tz68anh1hCrJuIuMStlY6cSS+I/YVvOP7WqYKzwY29u7eBBWTAxR/l4ekNlHr6BBsX6BIMSTx0p/yuM7YBghTjQ9z5uPDNsf77ubF8YRkDkYd2uFQ31nz4WHrMjnMD3CXZrKqMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9VoWhB/q6Ty/gv61qJJJgKxG0Nml7npgS3gy6g1NmU=;
 b=BoUCzMs3hbDTJNyTtSGy0HmkYWnIEwYfUpeKRMcGHzW9+shsBykO4KPh0AfpevETOqFPEzKc6jkBfVfRYTQ13QKrWlX1DsSFxXZAU4LgKzuW/NoPkRLVkzksVg+VK0XKhoxBe1U0znPcGqIMh+4u4Y8lXgQGl6QFfQH49XmN2ZrVtLjqaGGnmRQFmr+pbYb/YYR0dPi9ezEqGJNSsBUqR6m8HRI0PTlos3YD79GNbiTvsWv8KkIjz/IL9pTzrx1IIyKbZsMirEDhVwBeditRBXDKmWpIk8D33bjEAv5YFOtpB2E60MQwRds4D5dZ1mKgbcoL8KiYCqX6oDNaVTzFHw==
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
Date: Tue, 30 Jan 2024 16:06:39 +0200
Message-ID: <20240130140642.406882-11-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130140642.406882-1-parav@nvidia.com>
References: <20240130140642.406882-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|IA1PR12MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5c1493-abf6-4a01-340d-08dc219cd578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LoOTOF7unLfimM1ZxCmaxElCSQrWFUrNHmY8i6+Ji9bhlM9jwMjfvwH/uhYVSwoHmt8JZduBlH4Yd5Txv16DRGscRfgYAB4wLt93qs6xpo/1Tl2ojRJwOALFGJyC9YYz2bAtqHm/0o7p7AYj45JSU70CH4DhMhXtyyEf/PU8NYvIKjc8lqmgCerZ+wjTHdtj40hZuExdYyX/F8AKqUaDqfFB/I39QDjvr8hScOrA5X3s1/uSIjGxCnwQ2zAFtUflo70/fi/xEnn02HFoB1MWBi8O5f6u5rdElJeJ6LvBTAUJfHB+PdmRIBuwSU0XnuAlrBFSByhjetNN4ch2WpNIfires8LAbDgs8gBX+DP0yIVAOrnC5jadIshU8qnk6TyaVfSxrHivyxJQQSBBGfqfOufgRH9qsbJMn7wNhPHy9r/tdPPSfq2ksDACCkcE4tRwTRjVaES7PCobwznsB8p4Azhp4oHhlk3cXjLHczXbqJcC+IqqJ1rZw07lKLHmQOmKYzNtPrYv73d6CF+NrAmn2wKFu97bws03pwFsOO8GxnAyj+QOYr83FS93+rdir8rB+OD7drr8WoZEnx3hR7YYfSa3QzhpLEEj98SzYD+SZVXFeCyWRyIZCPmaFMHMITI9AP8XL/G16LC812FCBNJgqXqCstuE1Tj3FwwU8U+hYxHOqee0ogiKBb47yjIANu0b1H7EX5N/ycPWX80AcnQ8ir3ioRpcVW3w5jl4GF8BzVZ1pn1tAxvn7w6QAifxc4rytOKz1A7Tej8uugO5HDHUCurRAIxRwtW8+FdHVsd21D0=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(46966006)(36840700001)(40470700004)(83380400001)(16526019)(426003)(1076003)(6666004)(336012)(478600001)(36860700001)(316002)(47076005)(8936002)(107886003)(2616005)(4326008)(5660300002)(41300700001)(2906002)(966005)(8676002)(70586007)(54906003)(110136005)(70206006)(82740400003)(26005)(36756003)(86362001)(356005)(7636003)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 14:07:45.8400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5c1493-abf6-4a01-340d-08dc219cd578
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6435
Subject: [virtio-comment] [PATCH v8 10/13] virtio-net: Add flow filter rule resource

Define flow filter rule resource consist of
one or more match key, mask entries and one or more actions.

Currently it covers the most common filter types and value
of Ethernet header, IP addresses, TCP and UDP ports.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v6->v7:
- plenty of grammar corrections suggested by Cornelia
- adapt to generic device resource framework
v2->v3:
- removed references to flow filter virtqueues
- removed one partial sentence
- added text for delete request
- aligned request and opcode values to just say request in the defines
v1->v2:
- squashed with match fields definition patch of v1
- added length to the flexible array definition struct to benefit
  from future runtime length bound checkers listed in
  https://people.kernel.org/kees/bounded-flexible-arrays-in-c
- renamed value to key
- addressed comments from Satananda
- merged destination and action to one struct
v0->v1:
- reworded add flow request text to consider optional mask
- replaced respond with set
- added mask flag to the type
---
 device-types/net/description.tex | 165 ++++++++++++++++++++++++++++++-
 1 file changed, 164 insertions(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 05979e7..b9d0378 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -485,6 +485,8 @@ \subsection{Device Resources}\label{sec:Device Types / Network Device / Device R
 \hline \hline
 0x0200 & VIRTIO_NET_RESOURCE_FF_GROUP & Flow filter group \\
 \hline
+0x0201 & VIRTIO_NET_RESOURCE_FF_RULE & Flow filter rule \\
+\hline
 \end{tabularx}
 
 \subsubsection{Flow Filter Group}\label{sec:Device Types / Network Device / Device Resources / Flow Filter Group}
@@ -499,6 +501,95 @@ \subsubsection{Flow Filter Group}\label{sec:Device Types / Network Device / Devi
 };
 \end{lstlisting}
 
+\subsubsection{Flow Filter Rule}\label{sec:Device Types / Network Device / Device Resources / Flow Filter Rule}
+
+Each flow filter rule resource consist of one or more match entries and
+one or more actions. The packet is matched against one or more match
+entries of type \field{struct virtio_ff_match_entry}. When the packet
+matches to all the match entries of \field{struct virtio_ff_match_entries},
+the device applies one or more actions of \field{struct virtio_ff_actions}.
+
+\begin{lstlisting}
+struct virtio_ff_match_entry {
+        le16 type;
+        u8 key_len; /* length of key */
+        u8 mask_len; /* length of mask */
+        le64 fields_bmap;
+        u8 key[];
+        u8 mask[]; /* optional, only present when mask_len > 0 */
+};
+
+struct virtio_ff_match_entries {
+       u8 num_entries; /* indicates number of valid entries */
+       u8 reserved[7];
+       struct virtio_ff_match_entry entries[];
+};
+\end{lstlisting}
+
+\field{num_entries} indidates the number of valid array entries \field{entries}.
+For each of the valid entry in \field{entries}, fields \field{type}
+and \field{key} are in the format described in
+\ref{par:Device Types / Network Device / Device Operation / Flow Filter / Match Types and Keys}.
+\field{key_len} represents the length of field \field{key}.
+When \field{mask_len} is non zero, \field{mask} is present and has
+exact same format as \field{key} and \field{mask_len} represents the length
+of the field \field{mask}.
+
+\begin{lstlisting}
+#define VIRTIO_NET_FF_DEST_TYPE_RX_VQ 0
+
+struct virtio_ff_action_forward {
+        u8 dest_type;
+        u8 reserved[3];
+        union {
+                le16 vq_index;
+                le32 reserved1;
+        };
+};
+
+#define VIRTIO_NET_FF_ACTION_DROP 0
+#define VIRTIO_NET_FF_ACTION_FORWARD 1
+
+struct virtio_ff_action {
+        u8 action;
+        u8 len; /* indicates the length of value in bytes */
+        u8 value[];
+};
+
+struct virtio_ff_actions {
+        u8 num_actions; /* indicates number of valid actions */
+        u8 reserved[7];
+        struct virtio_ff_action actions[];
+};
+\end{lstlisting}
+
+\field{num_actions} indicates valid number of array entries of \field{actions}
+to apply when the packet matches all the supplied match entries; these
+\field{actions} are applied sequentially to the packet.
+
+For the device resource VIRTIO_NET_RESOURCE_FF_RULE, the
+\field{resource_specific_data} is in the format of
+\field{struct virtio_net_resource_ff_rule}.
+
+When \field{action} is set to VIRTIO_NET_FF_ACTION_DROP, the matching packet
+will be dropped by the device.
+
+When \field{action} is set to VIRTIO_NET_FF_ACTION_FORWARD, \field{value} is
+in format of \field{struct virtio_ff_action_forward} and the matching packet
+will be forwarded to the specified destination, i.e. when \field{dest_type}
+is VIRTIO_NET_FF_DEST_TYPE_RX_VQ, it is forwarded to the specified receive
+virtqueue.
+
+\begin{lstlisting}
+struct virtio_net_resource_ff_rule {
+        le32 group_id;
+        u8 priority;	/* higher priority rules are processed first */
+        u8 reserved[3];
+        struct virtio_ff_match_entries match_entries;
+        struct virtio_ff_actions actions;
+};
+\end{lstlisting}
+
 \subsection{Device Operation}\label{sec:Device Types / Network Device / Device Operation}
 
 Packets are transmitted by placing them in the
@@ -2510,7 +2601,8 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 
 \paragraph{Match Types and Keys}\label{par:Device Types / Network Device / Device Operation / Flow Filter / Match Types and Keys}
 
-The \field{type} for \field{struct virtio_net_ff_match_type_cap} corresponds to following table:
+The \field{type} for \field{struct virtio_net_ff_match_type_cap} and \field{struct virtio_ff_match_entry}
+corresponds to following table:
 
 \begin{tabular}{|l|l|l|}
 \hline
@@ -2553,6 +2645,21 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_ETH_HDR, the match entries
+\field{key} and \field{mask} are in following format:
+
+\begin{lstlisting}
+struct virtio_net_ff_match_eth_hdr {
+        u8 dmac[6];
+        u8 smac[6];
+        le16 ether_type;
+};
+\end{lstlisting}
+
+\field{dmac} is valid when VIRTIO_NET_FF_DST_MAC is set.
+\field{smac} is valid when VIRTIO_NET_FF_SRC_MAC is set.
+\field{ether_type} is valid when VIRTIO_NET_FF_ETHER_TYPE is set.
+
 For the \field{type} of VIRTIO_NET_FF_VLAN_TAG_HDR, VLAN tag fields
 are represented by a bitmap in \field{fields_bmap} as follows:
 
@@ -2581,6 +2688,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, the match entries
+\field{key} and \field{mask} are in following format:
+
+\begin{lstlisting}
+struct virtio_net_ff_match_ipv4_hdr {
+        le32 reserved[3];
+        le32 sip;
+        le32 dip;
+};
+\end{lstlisting}
+
+\field{sip} is valid when VIRTIO_NET_FF_SRC_IPV4 is set.
+\field{dip} is valid when VIRTIO_NET_FF_DST_IPV4 is set.
+
 For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} as follows:
 
@@ -2596,6 +2717,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, the match entries
+\field{key} and \field{mask} are in following format:
+
+\begin{lstlisting}
+struct virtio_net_ff_match_ipv6_hdr {
+        le32 reserved[2];
+        u8 sip[16];
+        u8 dip[16];
+};
+\end{lstlisting}
+
+\field{sip} is valid when VIRTIO_NET_FF_SRC_IPV6 is set.
+\field{dip} is valid when VIRTIO_NET_FF_DST_IPV6 is set.
+
 For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} as follows:
 
@@ -2611,6 +2746,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_TCP_HDR, the match entries
+\field{key} and \field{mask} are in following format:
+
+\begin{lstlisting}
+struct virtio_ndr_ff_match_tcp_hdr {
+        le16 sport;
+        le16 dport;
+        le32 reserved[4];
+};
+\end{lstlisting}
+
+\field{sport} is valid when VIRTIO_NET_FF_SRC_TCP_PORT is set.
+\field{dport} is valid when VIRTIO_NET_FF_DST_TCP_PORT is set.
+
 For the \field{type} of VIRTIO_NET_FF_UDP_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} as follows:
 
@@ -2626,6 +2775,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_UDP_HDR, the match entries
+\field{key} and \field{mask} are in following format:
+
+\begin{lstlisting}
+struct virtio_ndr_ff_match_udp_hdr {
+        le16 sport;
+        le16 dport;
+        le32 reserved;
+};
+\end{lstlisting}
+
+\field{sport} is valid when VIRTIO_NET_FF_SRC_UDP_PORT is set.
+\field{dport} is valid when VIRTIO_NET_FF_DST_UDP_PORT is set.
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

