Return-Path: <virtio-comment-return-6885-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5403CC0015E
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 07ED41CA26F
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 879269866C9
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 282939866C4; Mon, 24 Jul 2023 03:35:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC21C98643E;
	Mon, 24 Jul 2023 03:34:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBD/GOXGEElZ84JpJcP9TttuC/1pWykx1mUmxougb7mBChV45qBQC8iLzIs0SezjioNdGGOdiN1WYQ7DziQHkeBcfouDLO5Up2Z+IfcLrzFklJp9OcZ9FdVnjTrmbSK2mVMNX5TPUNmwKIO7vKgVgKzT/ZsEvke1AaYdhaQwbwFfMXwSJHPN4IQI/jKGziZJ7kWGD4LiqEFTzSWU2S2uQtR/4IIkodz8P5RivmdV8h4KK6Bkn3HJyR4USlSNon40d1v+6gAbWeBE3AvSNfP0awRbdPHCkC0C7mmR+2y1Cv9eN3xo5k1CsxNRPKhnI3whSS8+Or8m7vgqctQGPRpDRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ha+UwY8gx5X9Lgc7ynETk8mz2AtzTa3SWEBMe1WpGak=;
 b=GEChK52+OzbkI5MJm9yTx9GRhjaagVKESCQgPzLg792XQT5cuWn7OL1YJX5tDQ7QmEcW5Vzo+QZ6YlW1enUpMdElcVnr0LyfwnDksPKoI0M5mDq7C1P6dSfi9IO+V27zgXYub6OKTsOqDCr/n8Mjn+FDot0ZBEo/fO/kony9F25k/yylTub2fTVr2PMttWeEsZQ8KI0SslOLZvUKmhXcMrNQQ+Z3M/FASb8zgs/ZwDuOEozLZBpwvhg5UF5fRAAs5Mh8jRHLP9jgJx8yzVLoq6r6sKlJSTTn6AvwDCUCiOk2hsuyua7BinmmspogO+5oCwE8guogppgIKcTXMwZFzw==
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
To: <virtio-comment@lists.oasis-open.org>
CC: <shahafs@nvidia.com>, <hengqi@linux.alibaba.com>,
	<virtio@lists.oasis-open.org>, Parav Pandit <parav@nvidia.com>
Date: Mon, 24 Jul 2023 06:34:16 +0300
Message-ID: <20230724033421.249893-3-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230724033421.249893-1-parav@nvidia.com>
References: <20230724033421.249893-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT091:EE_|BL1PR12MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: edec1d5d-4578-4dd3-dc5f-08db8bf6ef0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zl41kCfvrVQbRe8jeNiQWO0LRiygE59XPqm29meqQmL1qxrdMIbsp4CKWaO0u+Dcusv1A1ILoShl6GB+4z3rf/A2jQNct+66AdjQ//Qw/0Qtj+7tyXQwrZh4cFJ4EL5Ud1kTORP0T1l1EBWgBoYay0moXbDfOAk/1zn38lxWzO6ixGKBBU46nMPxyy3xNFuTFpYediSXXV0d3kVImCnE40itZL8XA9BiPPlKJiL8eQFCD44ZIIXbfruGMBD1fKQyd4QAsYStvgZ4bF/rJpj7SaIvp9i+D8ZSjFD8S+R5F9NKmE0I0mkgkp7mym9bF0Z+ZMyMGKY7Xv8BgJfT4RkGd4UbQh2d9JgjpctzFbuJFidI4WwFyyOm4CpR1rfU/bFJq/ls6pnWciJy6E8vVg3MhY/UiKLb/d/On0ncm/aX6tGjVD/O7A0qoQ2VrotALnHWFFrYcx6yIM2lTAO0F2waGOMZTw7mY5UjOiMoLfKKM2VtSr+jkn49rEnVsRS7oTKVOdSfeLSuzcTI96Gzf99sbGWpfkfQlFmOoBoLpk2UDfxxFLU3YO1sjzBZElqT6opK4WgaTszH3gZ+82J+kSY14DgSj8cV3M1gWrlm0eZm5YQxNH2l3+nrQOZu1nwA2dIewQ6ly26XiDrcqggNlrr09Gk5qWcRDtsl21mFv72wP8Myd3RU3jHaZJ0gmUpoyndHWW/jotPqZOBh3M7bZG2vpV6ovGFH4h/xsxDrUVN7C0HvfPjnJyZ0jxZpz7ydfx/t
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(82310400008)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(356005)(7636003)(36860700001)(2616005)(426003)(47076005)(107886003)(36756003)(83380400001)(16526019)(8676002)(8936002)(5660300002)(478600001)(6916009)(54906003)(316002)(70206006)(70586007)(4326008)(41300700001)(186003)(1076003)(26005)(336012)(6666004)(2906002)(86362001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 03:34:49.1129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edec1d5d-4578-4dd3-dc5f-08db8bf6ef0f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5972
Subject: [virtio-comment] [PATCH requirements 2/7] net-features: Add low latency transmit queue requirements

Add requirements for the low latency transmit queue.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
chagelog:
v1->v2:
- added generic requirement to inline the request content
  along with the descriptor for non virtio-net devices
- added requirement to inline the request content along
  with the descriptor for virtio flow filter queue as two
  features are similar
v0->v1:
- added design goals for which requirements are added
---
 net-workstream/features-1.4.md | 88 ++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 4c3797b..eb95592 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -7,6 +7,7 @@ together is desired while updating the virtio net interface.
 
 # 2. Summary
 1. Device counters visible to the driver
+2. Low latency tx virtqueue for PCI transport
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -33,3 +34,90 @@ together is desired while updating the virtio net interface.
 ### 3.1.2 Per transmit queue counters
 1. le64 tx_gso_pkts: Packets send as transmit GSO sequence
 2. le64 tx_pkts: Total packets send by the device
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
+struct vitio_packed_q_desc {
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
+7. Ability to place all transmit completion together with it per packet stream
+   transmit timestamp using single PCIe transcation.
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

