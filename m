Return-Path: <virtio-comment-return-7882-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37A8C001DF
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:35:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 15B74157F03
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by host09.ws5.connectedcommunity.org (Postfix) with QMQP
	id EDC052A8DB; Fri, 20 Oct 2023 12:35:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 77B9F986977
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Oct 2023 12:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZ8PUWeMNCe5tBYNsHpeo5ffHl1zlFicwgk8X5HYxPAOiWwg7axNnTtDnzPk0lKRaRNAohU2G1DG89zd/eAahhI1ZdSQZKEow5ib7MAkzTsPtlMvnwTTFmTmkltFxu/SU8TQSsAfUiBmHITL0yy44G+WmKX8cXbefTNUTcnCF7ouNu1Ksev10kZ0+v06BY4GU8eYr45jl4tDBFeQwdf7gnr4AqPO8ovZyy41NWIWPShMy8NrVM2wL6gJrPQmdaCxJKbrEvrl9kp+0i1IcquAViSNsOlw5XFFWm49IXPsZQp+DwHqBLmZOGfy4EOYleG7L4iNEr9Xxk/2hA+Jz4Ua2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8Vep4y4A1FGayHRLmg0azj1SI2k4rJKVclkitTfB8U=;
 b=cSrztn+sBBkvUriBgDwBTAxFxdWTNGSbMgiM1y4BURcws/Gupu+0+BzKcbJJ+pqlEc52K4yGo5A9uHMs2pULI9nq6gpdgqh3aJ8ZwrHEqeoGJRohf9gave1lGZa4a7c9srJ+ypkwNhe5L89o+L8JnQ7eAeomrgVFTv2nB02rXOViUyKO6EUelV0TxLXqxlr/P8vi7Ezr9HScMh0sQHMVL6PhUgcow3IPV3VvEkUoRs251D9a/JXPYP9IGUM8oHH0NN1LsGOVWHHXVQFwbB5zmncA4iBYJzjJbs4z2HZYLxO+uS8f42kcoFQBBR64z9daBhvSVb5UienGXvfYYbDrHg==
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
Date: Fri, 20 Oct 2023 15:33:03 +0300
Message-ID: <20231020123303.1209289-7-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|MW4PR12MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e664f4-deaa-4cce-a1a7-08dbd168cf9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b/3g/0ewhzRpuwTvqU3gW22/wFxwC1CmeIDItIu7V67MB2wnHqvHiwJJ42vuQXzhT3vxq/miQ/m1tNxrLHJJwAaczWcQ7yRe5scwzcFpoi0EROW1NBeBIGMguR64Vy2wJtguiIae8Gal1I0ujH9TThrUdt/yNlNb+XXPtIQnptLW3lRC2lkMQmv3epud0p7YW9+hphKRBg3Cmb2LHD64rvVf7xfCnK3QGDE7T1JYjyh/G5E37ey2fiPkFuHYV77ybYFPcIk4VnVRH0/W3pw+56doJV1gGwUmkDe6KVW97UruqUc01P120BsXhgHzNvsAOSFzN+n/Ty0xfxc23PdhyLYaIGeiCNpdcibVKTwlKZ1QdNh6eXrQwfb6TmrvwaqzSGFmQwD0sB2CX37jgv0rYrxYqdgNfbgBpGecH8EWM8k4GwSJpfnIoywVTzqML9f+2EWSX+6/K8kyxZx6ybjlkaACUsrj7nUwpekG5Hl5KVTeFjlCBxAlgUSo2wwaq5gpay4c343WNkzzKxWmN4RlZtIo+PBqSv4SSXZjC7qIeGoEYo0APUrwD8hdqUl6zxUxTmC5Bsrjek8eLZUNKF6Ckrg7L82tRUH1hvmG7olPiHpQe5dQUDWgMGtiSiIeY/DJkVJV/cSx9PnAryVbv0rGux0k0dZdQkHAPyQhRCLzt2eTjyJTxcVg9xPPyCPyOzeFgNdK2z6eKKGVbszTuA48rcKp527XVr++1dHgaA99DPABf28xv4c+Uyd4c3cg6/CS3NEwiAqx4eBoumtM3X+FeWqq8kWiEsoQeDl48iFXZgA=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(186009)(82310400011)(1800799009)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(86362001)(47076005)(2906002)(4326008)(5660300002)(41300700001)(7636003)(356005)(82740400003)(336012)(16526019)(26005)(426003)(8676002)(36860700001)(1076003)(83380400001)(2616005)(36756003)(8936002)(478600001)(966005)(316002)(70206006)(70586007)(6666004)(110136005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 12:33:49.2006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e664f4-deaa-4cce-a1a7-08dbd168cf9b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7214
Subject: [virtio-comment] [PATCH v2 6/6] virtio-net: Add flow filter device and driver requirements

The flow filter functionality consists of the following
four components.
Add driver and device requirements for it.

1. Device capabilities query for commands VIRTIO_NET_CTRL_FF_CAP_GET,
   VIRTIO_NET_CTRL_FF_MATCH_CAP_GET.
2. Flow filter group operation commands VIRTIO_NET_CTRL_FF_GROUP_ADD
   and VIRTIO_NET_CTRL_FF_GROUP_DEL.
3. Flow filter transport mode set command
   VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET.
4. Flow filter requests using command VIRTIO_NET_CTRL_FF_REQ and
   the structure virtio_net_ff_op for the flow filter virtqueue.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
changelog:
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
 device-types/net/description.tex | 135 +++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index ba7026e..e9aff9d 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -2398,6 +2398,141 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 \field{command-specific-result} is in format of
 \field{struct virtio_net_ff_result}.
 
+\devicenormative{\subparagraph}{Flow Filter}{Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter}
+
+When the VIRTIO_NET_F_FLOW_FILTER is negotiated, the device MUST support
+VIRTIO_NET_CTRL_FF_CAP_GET, VIRTIO_NET_CTRL_FF_MATCH_CAP_GET, VIRTIO_NET_CTRL_FF_GROUP_ADD,
+VIRTIO_NET_CTRL_FF_GROUP_DEL, VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET and
+VIRTIO_NET_CTRL_FF_REQ commands.
+
+When the VIRTIO_NET_F_FLOW_FILTER is not negotiated, the device MUST respond
+with error VIRTIO_NET_ERR for
+VIRTIO_NET_CTRL_FF_CAP_GET, VIRTIO_NET_CTRL_FF_MATCH_CAP_GET, VIRTIO_NET_CTRL_FF_GROUP_ADD,
+VIRTIO_NET_CTRL_FF_GROUP_DEL, VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET and
+VIRTIO_NET_CTRL_FF_REQ commands.
+
+When the command VIRTIO_NET_CTRL_FF_CAP_GET completes successfully, the device
+MUST set either \field{max_vqs} to be non zero or set
+\field{cvq_supports_ff_ops} to 1; the device MUST set non zero value for fields
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
+If there are active flow filters already added in the device, the device
+MUST respond VIRTIO_NET_ERROR for the command
+VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET.
+
+The device MUST respond VIRTIO_NET_ERROR for the command
+VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET when \field{mode} is set to
+VIRTIO_NET_FF_TRANSPORT_CVQ and \field{cvq_supports_ff_ops} is set to zero;
+or when \field{mode} is set to VIRTIO_NET_FF_TRANSPORT_FFVQ and
+\field{max_vqs} is zero.
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
+The device MUST support enabling \field{max_vqs} number of flow filters
+virtqueues after device initialization phase if VIRTIO_F_RING_DYNAMIC
+feature is negotiated.
+
+When \field{max_vqs} is non zero, the device MUST report \field{start_vq_index},
+such that it does not overlap with any other virtqueues indices.
+
+\drivernormative{\subparagraph}{Flow Filters}{Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filters}
+
+The driver MUST NOT change the flow filters transport mode using
+VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET when the device has flow filters
+added.
+
+The driver MUST NOT set transport mode of VIRTIO_NET_FF_TRANSPORT_CVQ
+if \field{cvq_supports_ff_ops} is set to zero.
+
+The driver MUST NOT set transport mode of VIRTIO_NET_FF_TRANSPORT_FFVQ
+if \field{max_vqs} is set to zero in the command response of
+VIRTIO_NET_CTRL_FF_CAP_GET.
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

