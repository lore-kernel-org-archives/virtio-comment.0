Return-Path: <virtio-comment-return-9086-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C8EC4828D
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1EE372AEE0
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1678098690C
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0BCDF9868DF; Wed,  7 Feb 2024 07:24:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F0A2A9868E1
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Feb 2024 07:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpRZXkJWsxlLJdImZdk/7ch+Tq5SFLeGNuWy3pAyXYH1fupFhxLV2SGCHSHsn6RBmwnoy0X75RcjIc5oVOqk/mJNeKAZlW8KYF8IK57qYbJpPwnJNK4azhCPYZgOSjR8vtEFvR/EU3dKcu0Z2bUMIqayAozWtCVENYC6/ZyLuB3fqkIYZFSBRHLXqe5EuoWvAeHgExKp/Y+p4XJcNovi6V22QW16B+BNWmif9ilvcTmclv8Wj3lcI7bOe5lK1dV6s+JdPJxZBLFyi9GMWdEZY2xETQ0XO1HzOC9bpoWJ9NYywbbyijDTXSKikJtpuN/KPg9+yQn8Ms+3QbwyEiVnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCEdCr5JPyk7DmRCmaP9uq139Jkyn4QZsPoTxjIvADA=;
 b=NSiyLePF+nqEZ3VgPh51qKkVLVAVGmOrZPTOumgbLbERWgM8An7/3SOX8fzxHH6+1TNu0+hZasMfW3/akd388KmEDwZ2d1SlbKD/vtInFZDIs2qrbqM4S9HdGI54mp+6RL9S1eJeD8cp31VGtWuIVMeda8OXzXu90g8CYHntCEdToDChy4RWVzq4B30/q1+XPOHvfTUA8S4AELPxp49tM+09HnGmRVvyRmr64mqmFAv2Ah//jy7Mh7whpKTdFCjCasoOqOa+/1/eLji9mtC8OTvlbyn4xg7p7ouV/Vud1VqiUc3bdsixG42O27Ki3uAH1JlB5HGLCq5ZX/SrAkITZQ==
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
Date: Wed, 7 Feb 2024 09:23:34 +0200
Message-ID: <20240207072336.477606-12-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|IA0PR12MB8304:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b21cad-0f9b-48ee-35f7-08dc27adda2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wtt05fzV28wN7Juaoq4fuj/z1A9t+A4ezDoL8fMQcbryhjRVt1bo9U306Pogd98q/D+8uRnJxQVQ6OtVsvbbZ4JEBPtCGFVMi/3xWdplbX+P5F2QHHkW4WITZCSRMVULcI6RSKjbty0yomQZRsHtqtQOnYbS/IRxl8alYJ9S2JVHOCFjVWmKM3OXH0c6R/6p1mf0BV456/iIplKFIzLAzUxyVVmZ4IkNC6DOoGJXkk7mv/+Hjo+y8EBTzkXTvIgG+BIy1eA82kQljmh86ZkcITv1YiSutUzZ3TKVaXTOH1PLtyXFAJCVHyQBI3xHEkeJ/iylPI80fWztTdXLqw1lGZ0QeXRlOd6YdIK9+Cf8+WLIXB26xKJavlzOgFqaY4zVAJSp/A5ms9YrlxnhXX8ssleHZbUjlyS0TVUBqlIhQMbmK+OzQ7iEK/WMDRNwXWv9ctSOyoWV0bdzLVp3un9S91RolVTwMFnBeFenMOzuBakH4Hqvjo5DrBBRH3qC/IZkjHWo3BDtkKvCOR3+mLNf/SOWHKZb3c+Ef1VYox/G5HuIvykOleQkvgWfUQQxZ414T2WeK2crVgCc3iED9z5AVfD53h1laMlMin6s7ImKEvMnMm8lZey4Je5jym2QP3VP8wopM9JVtJcws2HK2ZP2G8B1afYSFhfursIitgu/+QS9Xo7WFr/W9sENfsECT+3lo5vceCTxQAVskQ+uX8ED7P2b9EOqhI9A+DV6OKjNOsgUKAChq6S2E0UmcmAuWQLxEh1rRB4mYM/TZvAKANurmfXMTQiFUxtBGFRnCg59IPk=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(64100799003)(82310400011)(1800799012)(451199024)(186009)(40470700004)(36840700001)(46966006)(40460700003)(40480700001)(36756003)(478600001)(7636003)(966005)(426003)(336012)(83380400001)(82740400003)(2616005)(41300700001)(47076005)(356005)(26005)(1076003)(107886003)(16526019)(70206006)(4326008)(316002)(8936002)(86362001)(54906003)(2906002)(5660300002)(6666004)(36860700001)(110136005)(8676002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 07:24:42.1426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b21cad-0f9b-48ee-35f7-08dc27adda2d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8304
Subject: [virtio-comment] [PATCH v9 11/13] virtio-net: Add flow filter device and driver requirements

Add device and driver flow filter requirements.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v6->v7:
- added device normatives for valid ranges
- rebased to use capabilities and resources
v5->v6:
- removed white spaces from end of line
- added missing conformance links
v2->v3:
- removed dependency on the dynamic queue creation as the
  infrastructure is not yet ready
v1->v2:
- fixed comments from Heng
- fixed spelling from initializaton to initialization
- added more requirements for multiple actions
v0->v1:
- addressed comments from Satananda
- added device requirement to return non zero value in fields_bmap
- added device requirement to not repeat filter type in response
- added driver requirement to order filter match field as it
  appears in the packet
- added device requirement to fail group delete command on existing
  flow entries
---
 device-types/net/description.tex        | 123 ++++++++++++++++++++++++
 device-types/net/device-conformance.tex |   1 +
 device-types/net/driver-conformance.tex |   1 +
 3 files changed, 125 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index b9d0378..268e448 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -2789,6 +2789,129 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \field{sport} is valid when VIRTIO_NET_FF_SRC_UDP_PORT is set.
 \field{dport} is valid when VIRTIO_NET_FF_DST_UDP_PORT is set.
 
+\devicenormative{\paragraph}{Flow Filter}{Device Types / Network Device / Device Operation / Flow Filter}
+
+When the device supports flow filter operations,
+\begin{itemize}
+\item the device MUST set VIRTIO_NET_FF_RESOURCE_CAP and VIRTIO_NET_FF_MATCH_CAP
+capabilities in the \field{supported_caps} in
+VIRTIO_ADMIN_CMD_CAP_SUPPORT_QUERY command.
+\item the device MUST support VIRTIO_ADMIN_CMD_RESOURCE_ADD,
+VIRTIO_ADMIN_CMD_RESOURCE_MODIFY, VIRTIO_ADMIN_CMD_RESOURCE_QUERY,
+VIRTIO_ADMIN_CMD_RESOURCE_REMOVE administration commands for resource type
+VIRTIO_NET_RESOURCE_FF_GROUP and VIRTIO_NET_RESOURCE_FF_RULE.
+\end{itemize}
+
+When the VIRTIO_NET_FF_RESOURCE_CAP or VIRTIO_NET_FF_MATCH_CAP capability
+is disabled, the device MUST respond \field{status} as
+VIRTIO_ADMIN_STATUS_Q_INVALID_OPCODE for commands
+VIRTIO_ADMIN_CMD_RESOURCE_ADD,
+VIRTIO_ADMIN_CMD_RESOURCE_MODIFY, VIRTIO_ADMIN_CMD_RESOURCE_QUERY,
+and VIRTIO_ADMIN_CMD_RESOURCE_REMOVE for resource \field{type} of
+VIRTIO_NET_RESOURCE_FF_GROUP and VIRTIO_NET_RESOURCE_FF_RULE.
+
+When the command VIRTIO_ADMIN_CMD_CAP_SUPPORT_QUERY completes successfully,
+the device MUST NOT repeat \field{type} in the \field{types}.
+
+The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_EINVAL for the command
+VIRTIO_ADMIN_CMD_RESOURCE_ADD for the resource \field{type} of
+VIRTIO_NET_RESOURCE_FF_GROUP if a flow filter group already exists
+with supplied \field{priority}.
+
+The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_ENOSPC for the command
+VIRTIO_ADMIN_CMD_RESOURCE_ADD for the resource \field{type} of
+VIRTIO_NET_RESOURCE_FF_GROUP if the flow filter groups in the device
+exceeds more than the value reported in the device capability
+VIRTIO_NET_RESOURCE_FF_GROUP in field \field{groups.max_limit}.
+
+The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_EBUSY for the command
+VIRTIO_ADMIN_CMD_RESOURCE_REMOVE for flow filter group resource when the flow
+filter group has one or more flow filter rules linked to the flow filter group.
+
+The device MUST fail the command VIRTIO_ADMIN_CMD_RESOURCE_ADD for the
+flow filter rule resource,
+\begin{itemize}
+\item if \field{match} contains duplicate \field{type},
+\item if \field{vq_index} in the \field{dest} is not a valid receive
+      virtqueue index,
+\item if \field{priority} is greater than or equal to
+      \field{max_ff_rules_priorities_per_group},
+\item if \field{id} is greater than or equal to \field{rules.max_limit}.
+\item if \field{num_entries} of \field{match_entries.entries} is greater than
+      \field{max_match_fields}.
+\item if \field{num_actions} of \field{actions} is greater than
+      \field{max_actions}.
+\end{itemize}
+
+When the flow filter forwards the packet to the virtqueue identfied by
+\field{vq_index} and if the receive virtqueue is reset, the device
+MUST drop such packets.
+
+The device MUST apply the actions of \field{struct virtio_flow_action} in same
+order as it is supplied by the driver when \field{num_entries} is greater than 1.
+
+The device MUST follow received packet processing ordering chain as following:
+\begin{itemize}
+\item Device configuration done using control virtqueue commands VIRTIO_NET_CTRL_RX,
+   VIRTIO_NET_CTRL_MAC and VIRTIO_NET_CTRL_VLAN.
+\item Flow filters programmed using flow filters functionality.
+\item Device configuration done using VIRTIO_NET_CTRL_MQ_RSS_CONFIG command.
+\end{itemize}
+
+When processing a packet, if the packet is dropped at any stage, the device
+MUST omit processing of next level.
+
+When the device matches the flow filter rule for the packet and if the match is
+successful, the device MUST STOP the filter processing chain, i.e. next level
+of processing MUST not be done.
+
+For multiple flow filter groups, the device MUST follow
+received packet processing ordering chain as following:
+apply all the flow filter rules of the highest priority group;
+if the match is successful, skip rules of all the lower priority group,
+if there is no match, the next higher priority group's rules are
+applied.
+
+Within a flow filter group, the device MUST apply the rules with the
+highest priority first; if there is a match, skip rules of all the lower
+priorities; if there is no match, the next higher priority rule is applied.
+
+When the driver has added multiple flow filter rules with same \field{priority}
+and for a packet if multiple flow filters MAY match such that it MAY result
+in different \field{action} or different \field{dest}, the device MUST apply
+the flow filter rule which is added first.
+
+When the device drops the packet due to the configuration done using the control
+virtqueue commands VIRTIO_NET_CTRL_RX or VIRTIO_NET_CTRL_MAC or VIRTIO_NET_CTRL_VLAN,
+the device MUST stop processing this packet for flow filters processing.
+
+When the device perform flow filter match operations and if the operation
+result did not have any match, the receive packet processing continues to next level,
+i.e. to apply configuration done using VIRTIO_NET_CTRL_MQ_RSS_CONFIG command.
+
+\drivernormative{\paragraph}{Flow Filter}{Device Types / Network Device / Device Operation / Flow Filter}
+
+The driver must enable VIRTIO_NET_FF_RESOURCE_CAP and VIRTIO_NET_FF_MATCH_CAP
+capabilities to use flow filter operations.
+
+The driver SHOULD NOT add multiple flow filters with same \field{priority}
+in a flow filter group, with overlapping match values.
+
+The driver SHOULD use different priority for different flow filters
+if multiple of the flow filters MAY match for a packet.
+
+The driver SHOULD set the \field{type} in \field{match_entries} as that of
+the order appears in the packet.
+
+The driver MUST NOT set \field{num_entries} in \field{struct virtio_ff_action}
+to more than \field{max_actions} supplied by the device in the
+\field{virtio_net_ctrl_ff_caps}.
+
+The driver SHOULD NOT remove flow filter group using command
+VIRTIO_ADMIN_CMD_RESOURCE_REMOVE when one or more flow filter rules are linked to
+the flow filter group; the driver SHOULD remove flow filter group only after
+all the flow filter rules are removed.
+
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
 
diff --git a/device-types/net/device-conformance.tex b/device-types/net/device-conformance.tex
index 52526e4..8da520a 100644
--- a/device-types/net/device-conformance.tex
+++ b/device-types/net/device-conformance.tex
@@ -16,4 +16,5 @@
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Inner Header Hash}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
+\item \ref{devicenormative:Device Types / Network Device / Device Operation / Flow Filter}
 \end{itemize}
diff --git a/device-types/net/driver-conformance.tex b/device-types/net/driver-conformance.tex
index c693c4f..79c3572 100644
--- a/device-types/net/driver-conformance.tex
+++ b/device-types/net/driver-conformance.tex
@@ -16,4 +16,5 @@
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Inner Header Hash}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
+\item \ref{drivernormative:Device Types / Network Device / Device Operation / Flow Filter}
 \end{itemize}
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

