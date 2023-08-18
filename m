Return-Path: <virtio-comment-return-7197-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C810C71133
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B043D60348
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A3D4F9865D9
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9A82998644A; Fri, 18 Aug 2023 04:36:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6CC66986445;
	Fri, 18 Aug 2023 04:36:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VxzE01o+Tqn7WPff/ZElZtDByTPGu6hJPMdmtHMgfJEtM1QN02UC2neaSxL/otwfC8ezVyvrudfG71L6vjDiBSdRymfH0bBu4eHmS4drXcb8G9DpJEa5adhIvKAW1bo5k9To5kh4R1aGRsNt7S0G1mcW/UxtMCywOO+8Hy0Ggl7yaAk0k68aOihWvbRd/n0UFzOLTbp9SOgs072WOxW5f/IACNKmzebKsl+j0jRl+8OeBMvxQcWFOdKipTbHWDnK4/CYeJ14w9nKFl+MZx0sVBxWJQD6WVW2SsFpYSC137Hc1rTGLNSt4AasVtJPeLYSLm5/Fb1dlWpP4WzRBmAOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+Z3xkLK0cUbJU6yCxHOYJUN2hYkv0F01VcgHMOkA3E=;
 b=erhf77ta4cX5nfLCAZcxit6PVJLiaHje4U4keY57ycRrXriM8mefoRXgETOP1owHJVfEQPi/i4X6+5j4ZJsNS25JyM7uvw2TNrGiV+NlhUmjY7q7ZKfxG8Z0Gv50jCLW3r/UeKz+J5sbjvVZa7SZmmIvDc3W3XPRqn8XJJbJF88Rmv/1nC31kEk+NOtzPjBJBpMs2rNK9QoYq2SAVQTldtmn/Wr+pvPW/S18e/OOahPoesyUwd2wyeEKpiSpin8MFPSZX9zg6v7jCcIosn3QGUZ6MMJeNnC7uEBlxbpPCjPJak8h08xTYia2jn0wvWi9n8EWkPS0jZWkMUAj2J0JRg==
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
To: <virtio-comment@lists.oasis-open.org>, <hengqi@linux.alibaba.com>,
	<david.edmondson@oracle.com>, <xuanzhuo@linux.alibaba.com>,
	<sburla@marvell.com>
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Fri, 18 Aug 2023 07:35:52 +0300
Message-ID: <20230818043557.496964-3-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230818043557.496964-1-parav@nvidia.com>
References: <20230818043557.496964-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|BL1PR12MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4a163c-aadc-4e92-9384-08db9fa4ae0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c+m9wHiiDk4BRPGQpl5BLSPjimthF/fnpA8UOakVzv6HypFlkPohRXWbwIq1fC97BFh4riKqao2eb7CM4jC2roKEuhiOCMbVqL2O3jQJKZp2waGAqBs34WKQ6e35CoEK9afFf4jMQrx/BLb/qFJ1XWoZ9Zymg0nous2fOoij+6ptarCzwLOz9diDHl0oXLK66qXw33x+Sp/qX/ZbuDsiVbzg0enAaYlOZbbBP0Xg6VloeSycAQwAH06l5NcOYu9ULZ+1fhmFykCn5qkJDzRCkTi3BhQjVmx8Of65upFjH8bntUDfOo3DX8nMB4psBYazyv3QK8NHCCvWP3atgtLmSq5/CG/ZhSMze2ShP/nzuMkZTs11EqKaTvgy8pmOpouUH6LO+5LyUEHgx6n53IzQpcdhOYhkc04clnH0yWc7+TdGqnHwyPXeCinYbFwGX1hpBLRGo4gkiURsFxSKtAYhjHr8/Ert/0f2Jd+WmNdnrTxkJfozHyedW9MFtLAaIn5LMCf+V7hjYGxWZik66Wzvu+Eqrq6kaDbxEso1SbMjVNDg961wgUcF22SFxqIW8UTP2DwXK3JqBB1jY1i+jLpypg+ctEmtl9rO9nJR6XI8ejAS/0nSXWotcAa2kJzCfBH3B4UUwgYkk6w/DR3C+vP7M5vFtpCyVsixx5UetIFfPGyBThaTH1+60AgTi/BJ5HctYXJZGTAbHIw0yJnYssBC2BxjfH70lG3yq15kfXoqBPQuMzFTyGvOB0K8NOlMw1v0yq9jHm3O4sw2ebh9xThjNh/x6UgatmZEHg0ZX8ft8FY=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(186009)(1800799009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(36756003)(40480700001)(86362001)(7636003)(40460700003)(356005)(54906003)(316002)(70206006)(478600001)(110136005)(70586007)(966005)(41300700001)(82740400003)(16526019)(6666004)(47076005)(36860700001)(26005)(426003)(1076003)(336012)(2616005)(107886003)(8676002)(4326008)(8936002)(5660300002)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 04:36:24.5188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4a163c-aadc-4e92-9384-08db9fa4ae0a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5899
Subject: [virtio-comment] [PATCH requirements v5 2/7] net-features: Add low latency transmit queue requirements

Add requirements for the low latency transmit queue.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Acked-by: David Edmondson <david.edmondson@oracle.com>
---
chagelog:
v3->v4:
- Addressed comments from David
- rewrote timestamp and completions pcie transcation requirement
v1->v2:
- added generic requirement to inline the request content
  along with the descriptor for non virtio-net devices
- added requirement to inline the header content along
  with the descriptor for virtio flow filter queue as two
  features are similar
v0->v1:
- added design goals for which requirements are added
---
 net-workstream/features-1.4.md | 88 ++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index ea36f09..1167ce2 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -7,6 +7,7 @@ together is desired while updating the virtio net interface.
 
 # 2. Summary
 1. Device counters visible to the driver
+2. Low latency tx virtqueue for PCI transport
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -39,3 +40,90 @@ together is desired while updating the virtio net interface.
 More counters discussed in [1].
 
 [1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00176.html
+
+## 3.2 Low PCI latency virtqueues
+### 3.2.1 Low PCI latency tx virtqueue
+0. Design goal
+   a. Reduce PCI access latency in packet transmit flow
+   b. Avoid O(N) descriptor parser to detect a packet stream to simplify device
+      logic
+   c. Reduce number of PCI transmit completion transactions and have unified
+      completion flow with/without transmit timestamping
+   d. Avoid partial cache line writes on transmit completions
+
+1. Packet transmit descriptor should contain data descriptors count without any
+   indirection and without any O(N) search to find the end of a packet stream.
+   For example, a packet transmit descriptor (called vnet_tx_hdr_desc
+   subsequently) to contain a field num_next_desc for the packet stream
+   indicating that a packet is located in N data descriptors.
+
+2. Packet transmit descriptor should contain segmentation offload-related fields
+   without any indirection. For example, packet transmit descriptor to contain
+   gso_type, gso_size/mss, header length, csum placement byte offset, and
+   csum start.
+
+3. Packet transmit descriptor should be able to place a small size packet that
+   does not have any L4 data after the vnet_tx_hdr_desc in the virtqueue memory.
+   For example a TCP ack only packet can fit in a descriptor memory which
+   otherwise consume more than 25% of metadata to describe the packet.
+
+4. Packet transmit descriptor should be able to place a full GSO header (L2 to
+   L4) after header descriptor and before data descriptors. For example, the
+   GSO header is placed after struct vnet_tx_hdr_desc in the virtqueue memory.
+   When such a GSO header is positioned adjacent to the packet transmit
+   descriptor, and when the GSO header is not aligned to 16B, the following
+   data descriptor to start on the 8B aligned boundary.
+
+5. An example of the above requirements at high level is:
+
+```
+struct virtio_packed_q_desc {
+   /* current desc for reference */
+   u64 address;
+   u32 len;
+   u16 id;
+   u16 flags;
+};
+
+/* Constant size header descriptor for tx packets */
+struct vnet_tx_hdr_desc {
+   u16 flags; /* indicate how to parse next fields */
+   u16 id; /* desc id to come back in completion */
+   u8 num_next_desc; /* indicates the number of the next 16B data desc for this
+		      * buffer.
+		      */
+   u8 gso_type;
+   le16 gso_hdr_len;
+   le16 gso_size;
+   le16 csum_start;
+   le16 csum_offset;
+   u8 inline_pkt_len; /* indicates the length of the inline packet after this
+		       * desc
+		       */
+   u8 reserved;
+   u8 padding[];
+};
+
+/* Example of a short packet or GSO header placed in the desc section of the vq
+ */
+struct vnet_tx_small_pkt_desc {
+   u8 raw_pkt[128];
+};
+
+/* Example of header followed by data descriptor */
+struct vnet_tx_hdr_desc hdr_desc;
+struct vnet_data_desc desc[2];
+
+```
+
+6. Ability to zero pad the transmit completion when the transmit completion is
+   shorter than the CPU cache line size.
+
+7. Ability to write per packet timestamp and also write multiple
+   transmit completions using single PCIe transcation.
+
+8. A generic feature of the virtqueue, to contain such header data inline for virtio
+   devices other than virtio-net.
+
+9. A flow filter virtqueue also similarly need the ability to inline the short flow
+   command header.
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

