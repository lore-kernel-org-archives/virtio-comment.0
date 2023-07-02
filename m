Return-Path: <virtio-comment-return-6669-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DDDEB64D9
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5097E42828
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 441C2986563
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3B10898644C; Sun,  2 Jul 2023 23:44:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1263D98671C;
	Sun,  2 Jul 2023 23:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V523kToTpGx+JiTtTyDG+dr5x8WyRjz40ki+ie5Bwrf3jYsUwzkRJqOe1CFD9GDT4tJzrR068IZTL/ePcN3X+6zaWSiBw7wis7S0Vu8VTiPDWSQABIXaoYvcV2y4evCTnStfe4OONnrvWmkvECm0YWO+ETeuVmSvzhzXVsqzrCfYcXqlUYUz/4UysL7Hc9vCra76600KaqNhyc7LmHCz3V/wreG8bwW0Z9YS3eIfqKW8Xk3f2+WXmu1dvjRiNemi193YtRR5Y2S73YH8Y7W6hrm55C4eE2iVvKE4x1aoaPco1toM+SEunKQrXM6gvn9Unyhw3iUp1SKx8o3+08dDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge0yH959AOHRRoxlDIUykx3oj3YHQWnTCYogww28UwM=;
 b=X+WF48OTC3WkX95nz5ncozGvpemTii1HZ+9UG/xEAO1yOTKfCghE8t76KCbo3Mxn53+pO3uN3ZHCeoJyTQQY2BzyUxzff1s0sON9pzfOIhzkFTapwJ2SFyiqSbesL62PA1bzFC5s1eNlfqcq1MM5tL8WmwuJoqjvxthNGayvcOuDTNp9cin810YQRtqfOgSX9zyn+q3zWLFJwVdtXkZzCLlAAu+R0f9ca92JO1dbplgc04lCo5yErGYCljM698G2GctYezqgDYtkDoCCyN5TC1M+AUE+384zkd6ASiLuWv9/MVXn+k5p2MzDt1SBApQ5DkP3HNoqCiTjtmhWgPDKnQ==
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
To: <virtio-comment@lists.oasis-open.org>
CC: <shahafs@nvidia.com>, <hengqi@linux.alibaba.com>,
	<virtio@lists.oasis-open.org>, Parav Pandit <parav@nvidia.com>
Date: Mon, 3 Jul 2023 02:44:06 +0300
Message-ID: <20230702234410.47546-4-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230702234410.47546-1-parav@nvidia.com>
References: <20230702234410.47546-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT101:EE_|MN2PR12MB4549:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a01438f-0f69-4edf-0432-08db7b564526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bcz+3yW3FNqEfXSU4HwQ1E+7LTiRu7mOhzy7tXSsOJd/xbZCDOPVgUAXCiQOF6MK5VF/TWikLT+dQLyffn3l8RU6P47p2gXoOCLoLy04TdJN0ooFM5T5s5bQ3dUscxorfgALP0qdDcyrZjqKixGYhQkwwWp3Bi7/HtcH1mrefBupxSKMi3u3Dl8OYAGfulBJShUKGQM9hpSCsPX+hdqRVo4lz1kvtZGZLcAljyzUCpxTXBuYPdcCjZuI9JAVvYtDfanW5di6yC/PCFo7YK/w1O0KOg9icZhV7gh3OtSCYmrqOt04Mq/iYEnbdAlE0DmH7bsZTp4J4ErC+/cWW+tUuPqihbc8M+hWJG1GP1eqwMW+5+IFPXE6ZvRNlJONMk0uPhm5Xuc+0tXwlGpsbFKcG7ZtZvqdQmCvQgZuCQ/x4TmedbJo9FdRsPxtp4BV82KiyQWtKySW9IQVZcV7q4Lhj/zGmxUp/ZyqT+b5of/SrWeXTbACzk3U893U00Lo2F5X3Gc41iGsmvoPcRAbw4t282g2Kv6b/I15HBCxpeUQNPuAVtCAiDANVisvH6X7UijYwc/3LboxX7+iQqQpNXUpRtf0UB/+TejDGjRPgKM+ZKPisqkvFCPodf+mPgBjlmNz/PWtQaTuHk0dJ2JAWSRMYXOrlBjv2cFWuASQVuEnFRURt4KqvOUb7cxrlbw0cxCSfw7NqpsTJFuz5GObPnyMF4eF7KcZfNY3oat/sdCZyKNJfGaWjlc15zK1+OFAUAM7
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(2906002)(41300700001)(5660300002)(8676002)(8936002)(82310400005)(36756003)(40480700001)(86362001)(16526019)(186003)(2616005)(478600001)(107886003)(26005)(1076003)(6666004)(82740400003)(70206006)(47076005)(316002)(6916009)(4326008)(70586007)(36860700001)(7636003)(54906003)(356005)(336012)(426003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2023 23:44:25.9018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a01438f-0f69-4edf-0432-08db7b564526
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4549
Subject: [virtio-comment] [PATCH REQUIREMENTS v2 3/7] net-features: Add low latency receive queue requirements

Add requirements for the low latency receive queue.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v0->v1:
- clarified the requirements further
- added line for the gro case
- added design goals as the motivation for the requirements
---
 net-workstream/features-1.4.md | 45 +++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 0c3202c..3e8b5a4 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -7,7 +7,7 @@ together is desired while updating the virtio net interface.
 
 # 2. Summary
 1. Device counters visible to the driver
-2. Low latency tx virtqueue for PCI transport
+2. Low latency tx and rx virtqueues for PCI transport
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -114,3 +114,46 @@ struct vnet_data_desc desc[2];
 
 7. Ability to place all transmit completion together with it per packet stream
    transmit timestamp using single PCIe transcation.
+
+### 3.2.2 Low latency rx virtqueue
+0. Design goal:
+   a. Keep packet metadata and buffer data together which is consumed by driver
+      layer and make it available in a single cache line of cpu
+   b. Instead of having per packet descriptors which is complex to scale for
+      the device, supply the page directly to the device to consume it based
+      on packet size
+1. The device should be able to write a packet receive completion that consists
+   of struct virtio_net_hdr (or similar) and a buffer id using a single DMA write
+   PCIe TLP.
+2. The device should be able to perform DMA writes of multiple packets
+   completions in a single DMA transaction up to the PCIe maximum write limit
+   in a transaction.
+3. The device should be able to zero pad packet write completion to align it to
+   64B or CPU cache line size whenever possible.
+4. An example of the above DMA completion structure:
+
+```
+/* Constant size receive packet completion */
+struct vnet_rx_completion {
+   u16 flags;
+   u16 id; /* buffer id */
+   u8 gso_type;
+   u8 reserved[3];
+   le16 gso_hdr_len;
+   le16 gso_size;
+   le16 csum_start;
+   le16 csum_offset;
+   u16 reserved2;
+   u64 timestamp; /* explained later */
+   u8 padding[];
+};
+```
+5. The driver should be able to post constant-size buffer pages on a receive
+   queue which can be consumed by the device for an incoming packet of any size
+   from 64B to 9K bytes.
+6. The device should be able to know the constant buffer size at receive
+   virtqueue level instead of per buffer level.
+7. The device should be able to indicate when a full page buffer is consumed,
+   which can be recycled by the driver when the packets from the completed
+   page is fully consumed.
+8. The device should be able to consume multiple pages for a receive GSO stream.
-- 
2.26.2


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

