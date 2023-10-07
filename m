Return-Path: <virtio-comment-return-7608-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B067E81E1E
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9479772348
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8BFB7986834
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 819E7986351; Sat,  7 Oct 2023 05:15:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7212E98682B
	for <virtio-comment@lists.oasis-open.org>; Sat,  7 Oct 2023 05:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tt+/yLLdI2j6q8mOalehDEHvBSZCnhlORJB0lqwF57/jjNKnpd1bLiBb27wdXraOJ04w/68MxtCFbivxy5cxnNJ5v2GlB7gSsyRPq35XAUMF9lwhCXjNRbNYA/72Eot2sjfW7rK1i6vESY+fbRFWgzz67amo//hUEju/8KfQ2tT2urpxe527n38Fuowms84AIvNDWqjWW572vWGo9MlgOLGVfsxjFZ+ev/laoOrUgJs+VKEoFQbiinKUCrM7/+WUsTI+1X/V/eGHM7iwTQP3dlbaA6PDBDLcly42ijA5SVj6n8DDVzJ582e3ETANiWDg5XzSBVn346ebSLDwvfpXkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJF5BunjlGMgJMeV46yilOoj+34PSMn5SRMD/bVU/kE=;
 b=ahrOxDGQEcHn8cd5lgvp9ULhLqIQnwgKLs2KG86KLdk1+D+FQ7G13uiF0Wyc0XA+krFyUhpw2b11J7Dg8GFQ3vqGRusP7avGYnd8mdQ8AYsMRTAyFU/fDzaqzTscJg0qWAyc4JSBNhgiYa5TCu4SH0tCXCdlAAaqKJohktNIzoIVs3T6LbC0Qk+VKQ+RLLRY33WIprDfXpxEeNBOSa698/VSqeQhr5aZI01XKhrBiS3zI4qbQOqgEN71q5Qu/rXeB6CjF9xhAAg+bGZS0K3HfVhqXU+aeAkMDYN2VhxNiEPBzx823QKI99lcq1T8A7YhqQGmuVrsYQ/52POlxhhhVA==
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
Date: Sat, 7 Oct 2023 08:14:43 +0300
Message-ID: <20231007051443.460148-8-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231007051443.460148-1-parav@nvidia.com>
References: <20231007051443.460148-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|BL1PR12MB5352:EE_
X-MS-Office365-Filtering-Correlation-Id: c547e9c3-3f6c-4eff-5aa9-08dbc6f477d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/TWi1yXUBUYgyTMSNeY9yu4oyi4uvF4vp77aWF/cyIDjOopDOyujwmPYrxz14nTLFnuv6sTLMaesc6pfZBL0gHsJHb9nWMJgtBIzQAtl4Xk6XVb/x+vIjyq+IyXe6KK84la4EyAKIa+WZCDBjLtPIKwjltM0z/QmzG0Ew9mU9jiQmnmeUvO/3hNnKTckhGzYG8SR+LFyRRC2TlJwv7BK21xAfsd6Tvi5J3KaO5PdBXckvoeHnB7OJy8opUYrjsg8rHOH+YVKTpGJ1v5R8/OjBHM8UaNps5wHaqGIiuHbNoKkNT/iJxPUlx2/7sr7/0qsyFfCu/o0DntlmGVKfOr3sJhA+ODwWllA+oOBtAikeVTyDTycLL1scGDiR4cI02AmsLPvgd1KNUhVnrL01ZFYEZLNcztbxEbEcH4UODNdIiOjvkzgXnv/mk3uzlb/nzKbehX3bg9e40DzDgfW9zR//wbY+hu0ipqK53t4nnjkNB779f+ecZozEJa40GYfprjy0lXp0egYNbC6M5aXOwi6RDaJIJr8s0fy0e+exu3fpBrFGZbdeZ4weHXBk8NoXm7y2//1WNS2eWs3wKJnM0pdvHUlSYD3RLM3eeWBci3UiVdavQykJxcf+bY+DGgVL38Miz9IffUeGgAgb9odIJeBty0k60auxjeYrh06Zn7UDiMJQuR0TlWLmop8UE+5nYxLmLWnoIp4zoDS+tsbW5teNkTGTT/8VnSlvub+w5KeoLazwYuCpyPhhnb9K6fKbpgG/6JRPtk6u780ivcAJs9DwE1h7fr91G+GK16UcFyKmCM=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(82310400011)(1800799009)(186009)(451199024)(36840700001)(40470700004)(46966006)(36860700001)(86362001)(2906002)(41300700001)(83380400001)(47076005)(40460700003)(26005)(16526019)(426003)(336012)(82740400003)(7636003)(356005)(40480700001)(8936002)(8676002)(4326008)(110136005)(316002)(6666004)(54906003)(70586007)(70206006)(5660300002)(966005)(2616005)(1076003)(478600001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 05:15:48.6310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c547e9c3-3f6c-4eff-5aa9-08dbc6f477d3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5352
Subject: [virtio-comment] [PATCH v1 7/7] virtio-net: Add flow filter device and driver requirements

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
v0->v1:
- addressed comments from Satananda
- added device requirement to return non zero value in fields_bmap
- added device requirement to not repeat filter type in response
- added driver requirement to order filter match field as it
  appears in the packet
- added device requirement to fail group delete command on existing
  flow entries
---
 device-types/net/description.tex | 126 +++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index cf2836d..1a3ce63 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -2364,6 +2364,132 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 \field{command-specific-result} is in format of
 \field{struct virtio_net_ff_req_result}.
 
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
+\field{max_match_fields} and \field{max_flow_priorities_per_group}.
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
+the device MUST ignore fields of \field{struct virtio_net_ff_dest}.
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
+When the device matches the flow filter for the packet and if no match entry is found
+for the packet, the receive packet processing continues to next level, i.e. to apply
+configuration done using VIRTIO_NET_CTRL_MQ_RSS_CONFIG command.
+
+The device MUST support enabling \field{max_vqs} number of flow filters
+virtqueues after device initializaton phase if VIRTIO_F_RING_DYNAMIC
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

