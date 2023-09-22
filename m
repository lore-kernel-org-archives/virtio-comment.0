Return-Path: <virtio-comment-return-7526-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0C5E6FE33
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6507268495
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 78E66986907
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5AB259867BD; Fri, 22 Sep 2023 13:50:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 545DD9866B1
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Sep 2023 13:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyAul4F0K0uh8uyCZO1HjkZFq19k3AciCFQ26rt60dJzXe8LKUFI4gIoyMHGyHGkITC+kNCZEm1p3WFnmmbfeWtLwYhqlbAUMKcj6w5T76cW/TpOfSKVElC2D0ruaqIs6ShAk30V5M9PWB0XQCqGlT2h0SWcnuTJ1+asg/jzUiiLeeegCSumTiZBfXEZ2Bi7ymm7kor3EMcIZlucSBH2J4Z14GgJFuSIptbIomP94MTzWM6MVjkSPxSYqWbM1OrETIKowTFbsbwT7JcZ5KIplSSgO/tRimSBlJzu7NNZ0eFVsGMTP4SOE7PrG8PNV27oKYxnW1P6GWGG87vC6LkMGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ByQTm66WCYZSS18MepiL3Ae6K6HnmSQ8DD2lM3v5+Y=;
 b=axDxufaZLPjFspv1EqiyPvrn47ErM9T3O0oFc0S3hVnOfvIrundEGgCfDXF91B+InFTPtpMwE++AnokiTSVzxzQlaMuOp9EVqX0aw+2A/1AECjlqEvYMOat3uW5QQfbrbn2TSvxcaT+db8cQ3PL9+qHkS106Z6BU8TgiCl6LdJidhSnJRl2bYO3sXG9Z8lA4s4OgCSLAX5FfS5d0s2VxUHeo88hRfUjsDPm6mg/T3jvMOGCg6MKwhZNvM9IvjA3LDEzMtMkl7bJSUVPE3WYCOrUiWVReZdjp5Wk1frd7McJJ3kGlLxeJRLFiKilxKxcnMa9Z1T14tbgNuadQ6yLVmw==
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
Date: Fri, 22 Sep 2023 16:48:38 +0300
Message-ID: <20230922134838.3718-8-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|SJ2PR12MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f6bd46d-a3fa-4933-fcc8-08dbbb72bdfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v05ZwdI2zuwVZH0Pj+LazgUMNE7fv7ZZEfNn8N7Rn3s8GKUF86tuKYIKm+UwnXYAa1rTaGEgL+WoRC51+RlR/kcy9Oo5GI0HJL9ses7b64//h8Py1C83yZQDBg2NthM7LajQq2Sz1/smnsJ31oOQr8btqRyKoGOi4au5aLxYOmv7w+IvaeAROaH5a/edZVzQYNC5ziZBJ4NLBP8PT8PhQyB22llLJ7ACX/cfVoksOJQxCi0QK1Bhcpwf0BTAqcVYdcAJyHZ36OUFZuzvVewo2CRrOC6Whp6bzajPvCvz7OmotFy4rHRcWJhGxACeiV2rDFAMgD/BXkebVJTtdYUTPoKOybVzmiRzSgM4BoYwuY6KIz3cpqEGBhAyWJPKP1YoCJgei46AaLRzZlzwPQS6h5JzdXq9in6jxnCFxjVwurwhRsRYy7yefFS+3mWfo+r6azOHot7ygWoQSyxTBWqseQ3WdVvG/SO1hT/vJ8yVBH53ZixBydAfg+FPzPBSsjf7BkWSNsKcldUxQaG8avUMBFXzW7N3yc4jv7jB8FJnn5NgBPewCWD3xqapwPjyO1AK4fzhqssW6Z5gnQcs1rL+N6quqAB/+WT7zzSbVY+cTtgikJjQK2df2DRCbcF+6qTbsbpa8Boe/ZItNUlV51/SIf7xF/emaqPMQa1jvg4Z0F3WZUcHFFKSopBZwRGUwuO+2SEZ+Fh6gzuxXRj05JSVc/tDwtBkuKNUrVapvwAAfXfojarZ1kT/haKit0SoWNOYt+ea/zU+D5vOxJW1T76qVWuixEMOs+4iDiY/+wE7iSlZycMld5KnIqflxvhy/oVX
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(82310400011)(230921699003)(1800799009)(451199024)(186009)(40470700004)(36840700001)(46966006)(1076003)(5660300002)(40460700003)(16526019)(426003)(26005)(336012)(36756003)(7636003)(2616005)(41300700001)(2906002)(47076005)(356005)(82740400003)(40480700001)(36860700001)(86362001)(4326008)(8936002)(83380400001)(478600001)(966005)(8676002)(6666004)(316002)(70206006)(70586007)(54906003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 13:49:28.9568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6bd46d-a3fa-4933-fcc8-08dbbb72bdfb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9212
Subject: [virtio-comment] [PATCH 7/7] virtio-net: Add flow filter device and driver requirements

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
 device-types/net/description.tex | 116 +++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index a96e47a..6f89096 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -2358,6 +2358,122 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
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
+MUST return either \field{max_vqs} to be non zero or return
+\field{cvq_supports_ff_ops} to 1; the device MUST return non zero value for fields
+\field{max_groups}, \field{max_ff_per_group}, \field{max_ff},
+\field{max_match_fields} and \field{max_flow_priorities_per_group}.
+
+When the command VIRTIO_NET_CTRL_FF_MATCH_CAP_GET completes successfully, the
+device MUST return non zero value for \field{num_entries} and return
+corresponding number of valid entries.
+
+The device MUST respond VIRTIO_NET_ERROR for the command
+VIRTIO_NET_CTRL_FF_GROUP_ADD if there are existing flow filters for the
+supplied group \field{id} or for the supplied \field{priority}.
+
+The device MUST respond VIRTIO_NET_ERROR for the command
+VIRTIO_NET_CTRL_FF_GROUP_DEL if the group identified with \field{id}
+does not exist in the device.
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

