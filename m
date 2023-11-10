Return-Path: <virtio-comment-return-8328-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF80AC4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 33DF1613D1
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 291AD986D1E
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1DDA8986D03; Fri, 10 Nov 2023 12:39:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0E169986D0C
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTWjt744mZ0qNy3rd1SXBmUHLIb1fPy0sSRQFTJwr+2Y3GifZv7O8jw6ajwxdmHXl68nIytq7DNf0OepbGhN9BW3hrFHC8ifnc2iVxuiQlR1up0clTF4XqjMfI1CXF9DtpoOLkiakx7ygAnlBByVbCUnlJl9yc6xj4+DvC+jHaCdLgYRa1DcmXn2AsH+VGQdYoj1Y644P4rRPSR9m0furoP1vCXVPnsapBfgzFSQdPN6SlF/EMbP3msS2j5iYGoW+DhTH/ep0XczggsqApaYTIGJVKhTv9AfoDpOwm337+i2PAEHjU/+KVcBUikkATFb+IwfPr5kSQGiPAeUxi7iOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZToLV1Vf+91itBLhgslqgsi8pGGEDNQUSKTqItaIKc=;
 b=SfVPHjGhfNUaLRt+C/kfAEYsW6M9mwXULR5UtJAuPw476jZVJLjwTH44LYI8/S3XiFQDQSehv8gRZ2RXDhT2WSVGVpMXyAsGhMLdgbBz2kb4ziZIzTTFFlOv+EHbG4brkSfJog4I5LnUQ4XDYm3zxXrIVKihZ3ql8npRxmuvQlSubUHEicRQAguXz4GTpnyGnBUL82IdOPnao3lKm6QE2e+Z9udoJ1eLHdb14vOHOeVyTeSaJb3Vu6ksMgRooH9ZTEtTqwPJAf3Rv1BPXp/9kiAfOV4/CNkloejUWBpOTAv/t7KuDbjQ/1RmhHxus5YyW94FAiVnkyI3I/Yx4/YVgQ==
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
Date: Fri, 10 Nov 2023 14:38:53 +0200
Message-ID: <20231110123853.2093309-6-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|BN9PR12MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2ef7dc-ea92-4290-7d5b-08dbe1ea1ea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Sgs2OyQKA+ldMspZocYH0Av+bswoZd63MD/bEcQbM/t4IzwkvDUbqrXieaf2tJYiSX4WXgoSk9oX8o98//CFlp7femQyxbr+HQEBf8fAa8jFchzLKMMpHWwTxYiJdF4YIclkavoEZdx1InS+vCwCPeYbfPXXXX5FgbrwUdinK6zE5N0yR/F6Zk+n/iI9y5q8Ndpgrj+xs8LaGLVfa5daNQaiQY1j3zhsVVN6/kqpv1gvmC42pd9f7ve0n2XC90Q/cECWiJHUvdRID/uEzEESZqWow+FY0ZK8pLmB4eNosLiPtuotkjhG6mD7z0b5j6tYsCP/wBJ3Uv/UTtgEByVC81KQAVU0tsB3+mGoL3FfGfrJgnhd0R0q1KiMfaQGIxz3kpJj+qVi+ObZu+2vMDdO/6Pq0ifKM6fy3XyNGTRuSi3p8QqAokhwsqmsRZmRkRrjCA0cS9WCBdJSdU91cCXHgby3NdBkf/EjrQyYwMjaP4tlV4z7NT2k9e6sLSh6m+AOQ0Vf4W4Y2P684GiTb6VDrlrkMc1sQ3QXIrufV9qnkbTeEKgI4ZAA7A8WNpsuhyd9PcLnbqblzdsCuy6QX8WFX19KXD4Vn2JspKTnUs1eLpDFwsxBIKCBnkPwZzC1QsgsnIWBKrWOPMY421RMi76FbKX/g6Kt5nRi2m9xvQba5Qln+ZQ5Cny5SjfHqOhonYGFKz56bapVr7udQ76GyykZ2hfgwwvC8UrwtlIBr1x68uLGFL/SZYz3WjnoT/V6GYenOK4mMoeQwQ5zMC9YOwDeXw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(451199024)(82310400011)(1800799009)(64100799003)(186009)(36840700001)(40470700004)(46966006)(4326008)(83380400001)(8676002)(8936002)(426003)(336012)(40460700003)(47076005)(36860700001)(2906002)(5660300002)(36756003)(6666004)(478600001)(966005)(86362001)(70586007)(16526019)(70206006)(54906003)(40480700001)(1076003)(110136005)(41300700001)(26005)(2616005)(356005)(82740400003)(7636003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:39:45.3653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2ef7dc-ea92-4290-7d5b-08dbe1ea1ea3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5164
Subject: [virtio-comment] [PATCH v6 5/5] virtio-net: Add flow filter device and driver requirements

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
index c1a08f8..b8583d4 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -2837,6 +2837,110 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
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

