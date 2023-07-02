Return-Path: <virtio-comment-return-6670-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226A7EB64DA
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DACE342A67
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 98A9D986556
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 74B2898684E; Sun,  2 Jul 2023 23:44:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DDD39986808;
	Sun,  2 Jul 2023 23:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrNfyHX6aI1IVdgPJGipKRLE/UdUdN6Fmnybhl0R244kWKqeEMFAbOUoB47QveNv04DDr7+fc/O01kivHmBO1VYZkWue+RIMgeDUiwqUku7ZwINNdJa3BrkAHakmtzvZDibTU0lPm2tewY+gCtkiFginD9dijOrIDm4HMA2SBOXIvCsTV37lTemXFY8xZm+v2x+xrZ6banUlpucR6CMbD1I3ZGfssCU/c5iTovhT6ZuPv+5g4iU9Lv9Q0nx1WIgk1p1vgLwQmkN3Gsy0yyJTb0qd76Mtuxecr2F9NfClEcutMtCLHN0xpz0Fi3/NiNy0Kg4Ydo4dA9NxHagPCxkqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Dse4p8wTCsvvKyOU+k3+B9j39Q5JHntszWPk8rmOZo=;
 b=crM8OE6M0oARr59nPcdFNqh7Y/dCaAvdG/Ns3vAUaR5S2FYkqdN0aWiqsVDh0L0s1soTDnWsPhal8MtFKEAyKW85Wd0lQASU/7xB4SnK6jbRouRDKranMKVKMESEsM3BwSr7X/BnEZF38YJe6m3sslZTf+o65oUAHuYbQwr8462mj2uzUG7eVHlKalhmPW2OskZ/Wi07UPwzPJazaeCfsdhWfxQzb+XdnGkMpT0oW1u7R1YbsYQnqy43RfpQPfJX+JMrMNf0Sa2eM/3UexFKd8WgqbBIeV9KKONt5ilV8Qg2LCu3IEj+enAhrFqpWv4OkK0Hm9FXpRSXuZHN4HwKEA==
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
Date: Mon, 3 Jul 2023 02:44:05 +0300
Message-ID: <20230702234410.47546-3-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT098:EE_|DM4PR12MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: f91319ea-eb6e-4dd5-784a-08db7b56455d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GpmCDZr/sFJtYhtHHjAEth61FqRzBah1iPRs2a7+20bY1wmG21gxcpFiVnjc2RDt33vkvmd2tcqOruu4l0PReqB30c6m5R1cv1mjnGMg7P8KCV05kjAEpk39XyKR6wKZPS1LS0SiSsrqHbeVQ9wGu7Nz5S+4DqWOfQJauX4uB9hlgXDF6tXsgJxPdlgJeIZq8fXj7gTLtqK9IJWcRKqzcw+W06PSO977gWjl/Yf1oiL9CUL4etEQrusveTbUx75SARbZf3xetO6zZwOtsoiSGNbNfgSmggctaTRPCKcwJvLR4TpmncEmYGowwjo/hOx6B+Za1flWDEY4gtMFL7t8+TLUZSYNr6fLuw5rpF94+8Kk2s3+19qCM1BK+E63i4RN/GuyH4bo1a5kCdQxXHK0ANpDeixcaVnUwCXFGrUythBbBv3G+ZB5zOeyZ7gfGcItjbx3jw5pRCMuoNq8bKSCI8rpAagxbqKglEqrsM61MCcgvgov04VdOOPjJwehPdZ+/W0fR6/BEhUG2OPR1jjkDDOaJHcTFTTdf54hZhdUikngXzUy3ONYHxGT83HXcp/F47q55s6/wG7dULlS8u+1aiDscHCmul0nxqQ8LIpwbC1KkSnbqTkeK1WJAt6MIZYHQSJdvn8NS4hgCmb+d+1OI4UATTHPBfKN47p3WeRXp/OeMnfJfUm/hdiYa0CeIjJYXG5qZnkcDNm/xpCKJjDi+7ZKPHmePMQqxjTmARrJ6LYl/GnHFBMYERtEtGvlTeOC
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199021)(46966006)(40470700004)(36840700001)(5660300002)(8936002)(8676002)(41300700001)(70206006)(70586007)(316002)(4326008)(6916009)(54906003)(36756003)(7636003)(82740400003)(356005)(86362001)(47076005)(40460700003)(107886003)(36860700001)(478600001)(186003)(26005)(40480700001)(1076003)(6666004)(16526019)(83380400001)(336012)(426003)(2906002)(82310400005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2023 23:44:26.3277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f91319ea-eb6e-4dd5-784a-08db7b56455d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5938
Subject: [virtio-comment] [PATCH REQUIREMENTS v2 2/7] net-features: Add low latency transmit queue requirements

Add requirements for the low latency transmit queue.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
chagelog:
v0->v1:
- added design goals for which requirements are added
---
 net-workstream/features-1.4.md | 81 ++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 4c3797b..0c3202c 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -7,6 +7,7 @@ together is desired while updating the virtio net interface.
 
 # 2. Summary
 1. Device counters visible to the driver
+2. Low latency tx virtqueue for PCI transport
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -33,3 +34,83 @@ together is desired while updating the virtio net interface.
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
+   indicating that a packet is located N data descriptors.
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
+6. Ability to zero pad the transmit completion when the transmit completion is
+   shorter than the CPU cache line size.
+
+7. Ability to place all transmit completion together with it per packet stream
+   transmit timestamp using single PCIe transcation.
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

