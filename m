Return-Path: <virtio-comment-return-8568-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F815C61D85
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1C74A216A7
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 08D8C986E63
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EA2039868A2; Thu, 23 Nov 2023 09:22:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CECD6986E6C
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Nov 2023 09:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+WqnWN3MeKHPuT327CGAIXp1VYpqLxnOSVCgXqOchrf6Eb5as8qARIBGVbIKwMG7On74om5V+Nf3OaT2MTuP7SK4eOCbmJYIuI0vhKrv9LCk7Tjln9gXTV6Hr5Gl07y373hRF/JwB1EYXLzft3Q5P9X5aPbYo5dLWJd3Q/q4XwvtpUTHISg54S/CZ/oENYPRWG6p9yNeK9vjuhnAsMtL36KwS33niLY2fB693ARFa1VVQMjj+WiuQ/2vFMzG51pyrP3dE/bkEp2udhqVXc3640G8bUyPK+UQPtwgZniCqu0nyA0zLoxGnvip+LTCcHnLSqBbmWG0SjVKJgy4OUf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9HzBjWZopyFRvumOo2OpS8Rc2qz061yHhujAyuVyK4=;
 b=mlTNAca7mvm2brajrx/CSgGrZ6Qqi8b2FqH4IrqZcbRPe8wgbVtlN5CDV8n+5/MVcQLn6/H753rHFMe6gcLsT7GoT6XZzDgFU/fYWn7elV1qWv8pB7P4y/lutm7Poq3SRV1/KK9wSavp5CigxIvm/z2BS4bEE4MzyDoDZ63WgX5HTzdI2TwfMAUbFqvKMNMTSC7EhIjZv18xiQYIql5OLuYaPj5R/51Py2Xj4niUCOZBgSLAFv6HIL9gOgRyz6EIx9DvCODX9T2kWt7r+yI/+Hx12LzusStM0Z6oUBO/JR2PdNyceFnpf0XEbsaNDiEiNwASs9dp5DnN6wDMYQmQ4g==
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
Date: Thu, 23 Nov 2023 11:21:19 +0200
Message-ID: <20231123092119.2718448-6-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|BN9PR12MB5099:EE_
X-MS-Office365-Filtering-Correlation-Id: 423595f0-8aad-4d9f-04fc-08dbec05acc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7Eh9miT+0sb3FruAk+oOFBpWUah1uyDMwwEH4NXmb3ExfsylWe2gBLTgmn6PvxLU2kn/z0r/uTK9xPAm8UXMRD3F6Csjf+kjVC+WYAa49C9Si8OBAgCsneqbQ8VivASXiDHaAFDuiDi+HHxS3JhIUdf+fWwv+OguUIcNXR6/uLvH75SEymUAj1l7lBmMurcis1Srx2i8KSz7VGw1fNcMb0R8l2V0qIKl9bKw99l2cl3cfpfoKFJvM2xao1cTezCfBD6OUrSSps1FHJmLyhB+7ntJuZCoxj9GAMILwe8RFrH54WJPcD3hN5jp9ZzzZCuocJm5qIMJ6T4Tm8XPvCDOvIJCjVm0xWyLZ6lnLzH7HIOoAP1MNtf0DQP8jridFhPxAI339B2Acp5cSiYL0lER415MspF5aZMdG00emc++vTh4c41CtsAM2kTS4RMcU+2v9Ao+v5L1MTYma5okhB/9rpV4IpARPwDe8f++wWvvdAcm3q+zvuYDlesYiJ+Jjcdjxd+KkUF3pXaTmFSxpPnMAW+qtjQ/ZYJjHEbeUoHPYqTylPjUlohesZa7s8goLrs0LZSvw4itBhPFScaT/23EGAJQ7+VLSotRMNYv+o6SicX/MkwuSnXV8fWpc7zT88GrKENiRQWwryvayzuGQ9vRBPIqTTHqVhjB7qn/YILeuKDGcyGdOCZcveNvEfxie09rfWwYSLXoGmOcWrEkfaAAfr5lVsDYJnA44iXTYyxAVyX6oZgNpvySrp8I6jmQkyzH3gf5r5fd8t9BSGuaz/vsaw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(186009)(64100799003)(451199024)(82310400011)(1800799012)(40470700004)(46966006)(36840700001)(40460700003)(70586007)(70206006)(110136005)(316002)(54906003)(426003)(2616005)(36756003)(336012)(83380400001)(1076003)(36860700001)(16526019)(966005)(6666004)(26005)(478600001)(7636003)(356005)(82740400003)(47076005)(86362001)(40480700001)(5660300002)(2906002)(4326008)(8936002)(8676002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 09:22:11.8192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 423595f0-8aad-4d9f-04fc-08dbec05acc1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5099
Subject: [virtio-comment] [PATCH v7 5/5] virtio-net: Add flow filter device and driver requirements

The flow filter functionality consists of the following
four components.
Add driver and device requirements for it.

1. Device capabilities query for commands VIRTIO_NET_CTRL_FF_CAP_GET,
   VIRTIO_NET_CTRL_FF_MATCH_CAP_GET.
2. Flow filter group operation commands VIRTIO_NET_CTRL_FF_GROUP_ADD
   and VIRTIO_NET_CTRL_FF_GROUP_DEL.
3. Flow filter requests using command VIRTIO_NET_CTRL_FF_REQ and
   the structure virtio_net_ff_op for the flow filter virtqueue.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
changelog:
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
 device-types/net/description.tex        | 104 ++++++++++++++++++++++++
 device-types/net/device-conformance.tex |   1 +
 device-types/net/driver-conformance.tex |   1 +
 3 files changed, 106 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index e7e80ab..ae5baed 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -2838,6 +2838,110 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 \field{command-specific-result} is in format of
 \field{struct virtio_net_ff_result}.
 
+\devicenormative{\subparagraph}{Flow Filter}{Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter}
+
+When the VIRTIO_NET_F_FLOW_FILTER is negotiated, the device MUST support
+VIRTIO_NET_CTRL_FF_CAP_GET, VIRTIO_NET_CTRL_FF_MATCH_CAP_GET, VIRTIO_NET_CTRL_FF_GROUP_ADD,
+VIRTIO_NET_CTRL_FF_GROUP_DEL and VIRTIO_NET_CTRL_FF_REQ commands.
+
+When the VIRTIO_NET_F_FLOW_FILTER is not negotiated, the device MUST respond
+with error VIRTIO_NET_ERR for
+VIRTIO_NET_CTRL_FF_CAP_GET, VIRTIO_NET_CTRL_FF_MATCH_CAP_GET, VIRTIO_NET_CTRL_FF_GROUP_ADD,
+VIRTIO_NET_CTRL_FF_GROUP_DEL and VIRTIO_NET_CTRL_FF_REQ commands.
+
+When the command VIRTIO_NET_CTRL_FF_CAP_GET completes successfully, the device
+MUST set non zero value for fields
+\field{max_groups}, \field{max_ff_per_group}, \field{max_ff},
+\field{max_match_fields}, \field{max_flow_priorities_per_group} and
+\field{max_actions}.
+
+When the command VIRTIO_NET_CTRL_FF_MATCH_CAP_GET completes successfully,
+\begin{itemize}
+\item the device MUST set non zero value for fields \field{num_entries}, \field{fields_bmap}
+and set corresponding number of valid entries.
+\item the device MUST NOT repeat \field{type} in the \field{types}.
+\end{itemize}
+
+The device MUST set VIRTIO_NET_ERROR for the command
+VIRTIO_NET_CTRL_FF_GROUP_ADD if there are existing flow filters for the
+supplied group \field{id} or for the supplied \field{priority}.
+
+The device MUST set VIRTIO_NET_ERROR for the command
+VIRTIO_NET_CTRL_FF_GROUP_DEL if the group identified with \field{id}
+does not exist in the device.
+
+The device MUST set VIRTIO_NET_ERROR for the command
+VIRTIO_NET_CTRL_FF_GROUP_DEL if the group identified with \field{id}
+has one or more flow filters present in the group.
+
+The device MUST fail the operation VIRTIO_NET_FF_OP_ADD if the
+\field{match} contains duplicate \field{type}.
+
+The device MUST fail the operation VIRTIO_NET_FF_OP_DEL if the
+requested flow filter of identifier \field{id} do not exist in the
+the device.
+
+The device MUST fail the operation VIRTIO_NET_FF_OP_ADD if the
+\field{vq_index} in the \field{dest} is outside of the range.
+
+When the flow filter forwards the packet to the \field{vq_index} and
+if the receiveq is reset, the device MUST drop such packets.
+
+When the flow filter \field{action} is VIRTIO_NET_FF_ACTION_DROP,
+the device MUST ignore rest of the fields of
+\field{struct virtio_flow_action_entry}.
+
+When the driver has added multiple flow filters with same \field{priority}
+and for a packet if multiple flow filters MAY match such that it MAY result
+in different \field{action} or different \field{dest}, the device
+MAY apply any of the matching flow filters.
+
+The device MUST follow received packet processing ordering chain as following:
+
+The device SHOULD set \field{device_status} to DEVICE_NEEDS_RESET when
+the driver has not set the flow filter transport mode to
+VIRTIO_NET_FF_TRANSPORT_FFVQ and if the driver enables the flow filter
+virtqueue.
+
+The device MUST apply the actions of \field{struct virtio_flow_action} in same
+order as it is supplied by the driver when \field{num_entries} is greater than 1.
+
+\begin{itemize}
+\item Device configuration done using control virtqueue commands VIRTIO_NET_CTRL_RX,
+   VIRTIO_NET_CTRL_MAC and VIRTIO_NET_CTRL_VLAN.
+\item Flow filters programmed using flow filters functionality.
+\item Device configuration done using VIRTIO_NET_CTRL_MQ_RSS_CONFIG command.
+\end{itemize}
+
+When the device drops the packet due to the configuration done using the control
+virtqueue commands VIRTIO_NET_CTRL_RX or VIRTIO_NET_CTRL_MAC or VIRTIO_NET_CTRL_VLAN,
+the device MUST stop processing this packet for flow filters processing.
+
+When the device matches the flow filter for the packet and if the match is successful,
+the filter processing chain MUST stop, i.e. next level of processing MUST not be done.
+
+When the device perform flow filter match operations and if the operation
+result did not have any match, the receive packet processing continues to next level,
+i.e. to apply configuration done using VIRTIO_NET_CTRL_MQ_RSS_CONFIG command.
+
+\drivernormative{\subparagraph}{Flow Filter}{Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter}
+
+The driver MUST NOT send any flow filters specific commands having class code
+of VIRTIO_NET_CTRL_FF when VIRTIO_NET_F_FLOW_FILTER is not negotiated.
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
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
 
diff --git a/device-types/net/device-conformance.tex b/device-types/net/device-conformance.tex
index 52526e4..1228c27 100644
--- a/device-types/net/device-conformance.tex
+++ b/device-types/net/device-conformance.tex
@@ -16,4 +16,5 @@
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Inner Header Hash}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
+\item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter}
 \end{itemize}
diff --git a/device-types/net/driver-conformance.tex b/device-types/net/driver-conformance.tex
index c693c4f..9f9b63e 100644
--- a/device-types/net/driver-conformance.tex
+++ b/device-types/net/driver-conformance.tex
@@ -16,4 +16,5 @@
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Notifications Coalescing}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Inner Header Hash}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
+\item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter}
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

