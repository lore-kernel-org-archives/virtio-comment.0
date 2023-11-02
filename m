Return-Path: <virtio-comment-return-8124-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD47C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 40084774E7
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3BD54986C2C
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 31721986C01; Thu,  2 Nov 2023 13:29:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 11E19986C43
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 13:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdAGSBGm1kxS38zA/hJ/WqluenHmHmKLqVMvY891CfMzlRYk2T8xKLGWt0u/hbkXgjcBCjUNEBK0hYGquJEAQWlr+rRJmWEZIzaYOpgANwdd3MVrvtooBf5NA9t08R5yp/fRMqeNZzsaZk6fHA13XTLDgYng1xvoQmeaYerYaF7mZ4EfEQ7v+Qd0gu+Um97yNJWU1D8vyjSB1rxhSqZFFYY4eSyMo7StNQCaW1mYuyw+cCopwMUw8Ws6ZlfcdRA1gtP6IR/MPcHhP+xvZyan2dhxABQBM0dnRjXgJ5FV0mYTNzuJAZiC/EIOXk4TU/1cQoCFcKMKvSiDRcU6yBSC6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8e45vexGB72ZXUVLrgZ1a8Tv/iWit74WNbjXuuPTqKU=;
 b=Gy5YEM+E5yfrTJnN4EC31+iI77bggaucOpn/AqUU6VJ4LLG4grBz72xfDTNQTjVdY9o1oenbHD+SuRz7RmkjrosF7iFXR0+qA+YXbQsGbKHXI4obco0oz6tipgM2yZgzLJoy0lco8VDVTxQqGFeAgQV7SlWjthrRPVR7tLwEL4mEflF7gM34sOP6VGieKiI5HmUpAjiRAPhjfMlltlXIkls6/QT/5jI9lcAy56KNf9qXrwednsuapX9+wHf7eE1yKR+SdSb8u5GBqe9U/rMCGuDhZo928OrQwrK6+I1dn4oY864QpSk6PxRZmWMWnoJFUardB7+a46oFkghh5m3shA==
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
Date: Thu, 2 Nov 2023 15:28:25 +0200
Message-ID: <20231102132825.1865068-6-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102132825.1865068-1-parav@nvidia.com>
References: <20231102132825.1865068-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|PH7PR12MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: dd04c221-ca6d-46b1-8f74-08dbdba7b400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fxOqSf+f3db3w3tHVXjs1jk4RRvAWZDqucjC4Ye9rMxEIUKnYDbO0/saVN+YFzyHQDhqtB+ZDfyvn0n5Eo2xk1Mexc07pTTOCJMI2fE0/r8PtNQWGicQP+Z499OzZLmYpVBoHS9OieAIEY/JRwYA7AbQvLSkFWtaiWeEeE9lL4MelEcQMPscS7qahzKHGBL1hHO9lETMfzPvlMTVmPjF3AwWox3zKooE3hjTsWJNfFM1dQR4mc25QkDoBA7y1Hu0LY7+22PMNBTe3EsSIwiXaYtQ4t44+axvumBBlXmap6IbDU8GFtANUAZ4k6X2Lse4KHtuDG9dBaKPe4mb1zzqERwwOiQfSAu5Sc6RAvxaeoL36V1rD18E/BNMfqOHNBlF+yPv2GqDqP3+3lfMsBRwYYRWXftwbTq3CfDvUbH0Puf/SxQ1xRBHFZcifm87pEu9HZJjtDCbAh11pULhUJJZJKMhCK7HnqS9p/TWqCJv42aoPmkmdm8KvUj7mkKH4kpnkI4ZOnd90b3qYpmYwdbr2q9zt42BiZH3Xqq1cWnfmY2F+eakQWWmNacby7gsbHLPUzNC+ZT+hiyCk7oAkJdNz36homErk+HGZ72YM/E4yIu21/4Dfn3Uh13O92zkm73Ra42v+rILV9kvYULYuEESdocchMf2j6q8sYwcRb4vX4eOpwpLSPAoNv1tFksvD+ETN8uumKK4VIK/jGIZhMH3WN6GdAIDQXYaP+9AuRbPhq1/rJET0cf0Vte/ZiueIkue4P1Nqty2PdjJaTcTrW4wxoGV+r9OpqXbQHoqH0pf16k=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(82310400011)(36840700001)(40470700004)(46966006)(26005)(2616005)(40460700003)(40480700001)(16526019)(1076003)(82740400003)(36756003)(86362001)(356005)(426003)(83380400001)(478600001)(36860700001)(7636003)(47076005)(6666004)(8936002)(8676002)(336012)(4326008)(70206006)(2906002)(316002)(41300700001)(54906003)(110136005)(966005)(70586007)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 13:29:12.7607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd04c221-ca6d-46b1-8f74-08dbdba7b400
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5927
Subject: [virtio-comment] [PATCH v5 5/5] virtio-net: Add flow filter device and driver requirements

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
 device-types/net/description.tex | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index cbfc18d..5dfe656 100644
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
+\drivernormative{\subparagraph}{Flow Filters}{Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filters}
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

