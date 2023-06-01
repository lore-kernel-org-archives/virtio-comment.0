Return-Path: <virtio-comment-return-6077-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF23C7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BCE1423548
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B7EA0986814
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AF536986800; Thu,  1 Jun 2023 22:03:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 983F69867C2;
	Thu,  1 Jun 2023 22:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3vT38kld4cfoxHnh4iUi3eIiMlqhqN2nzZlS/6olfvAiImZYuLPN4GdfsZKgwbfiusQDUWegusBvdAYFnx8+xkFzAxhWZ1axwO9lJrZE7EuDyGREnkwGdmB63YiEqT2eKbp7DhvR8GChFP+w6P5ki1ROaohW/zAyxiM/wkrTBvaK+J7g/6M/pSlnr/dbo6sPbXdFPkX5Y+OZbf2IinF7bEf0cQQPbAwcQIME3jl33H0kScWvWke6qNjwUb7JxbXQS+VekLXcKTy16BZDa2kril9C7b6wBI5KFJq97Gsp9yqgN4IpDIEdCD1516yXvHgVYImn8STnXrDM0wnwuJGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avYkeph4MbmhsEPY7F1SoVl1h1kDkzck3Lp30zfmMiQ=;
 b=Ded1Q2wsXpl5n5wA5WmOBlbAv167TvpN/n4aj7wa04Jdjci/EQeYPzcaMcgirrbAQAIxLBP2U83kdz7trO440jJC6kh2JfTEj5DP4xC1ObACA8wtiuRjHLvMvzcRoJD1tk7Zj28pNbZjKItGKa0/gOCYsNX5d4n3DQd6P5l2IC1nSYu4eq079kFFkdz3fKDMdS88CByIjNdH/AdLwpUOID0SYQyUMjg8Abp00izd9YNxp1IP9C2jxnI83OOPUcgsxgLP72fMMhdH+nMW2vKrRSRF1SNiNF40kbLJrz/ZgP3zJKe1MP3llxeRsfr7AhktMlVAWBjh7VQjYOGSKr7slw==
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
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Fri, 2 Jun 2023 01:03:00 +0300
Message-ID: <20230601220305.587034-3-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230601220305.587034-1-parav@nvidia.com>
References: <20230601220305.587034-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT024:EE_|CO6PR12MB5443:EE_
X-MS-Office365-Filtering-Correlation-Id: 468412ed-13ab-4182-bf97-08db62ec07b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ie5vzgXQvqZ2292rpdo04jRppb1qiQOnLj/vvdk5gilS/dAZk4mFbzVo6ARTB0aD2FzUJyg/OJlaUmJtvRUoiuVm479VaAun9WyRiDfpuOCNGshZWY6RlCm0oSNRnOEg2OCFqBdX4nYPhka63X9+5vX6XdRAQE/OkH9rGaA4uo3wSDQxRNxuXMYPr/NvWOIpAs3vfSh5/CdEnIqTdyqSNEycdtJ1smMsyXAC/MxSDBKEXzwlhtC2faPJf6LpzEYo6GsE1Tsvla5C+012/K5oErvo2F20ZXcXdywuuLTuXdsP/HwMpE3KDYH4T0ZtQ5Lwcx6lFNM/YFE7bFjntruZ39zphr7Q12S0JNNLBOpwNl5fnf4Cd9dRWx4NclevyvBd1vQJ1nyHzJ8EIniSqwFvHkv6gGc81Kh9XlftVT0fm6rIM5nejmDjQV0yf6MRCzFCHCDIiSNdxRZ8EevDyX8W/Ts8o6l8LgJ4IgqOV3+F/9/VGJh95/ED/0hS5bZs23sCdn3wyfmTpM5jAhoNFVyocCdsF2bLs5MwDfi5A5f8fVpbe81kZdOz35OwykBAUVbMp6mdxEuPyka4q1Bi6I8rDM4UYXYKm3kIWNaco9te3sH30UhUQZJ4OOsdrlhwUS89Q1uUJXyoKzbC9z408LD7mcDoyrse0Rgk7OeoPdmGH5xViB6uLdFqGJ+vQMP6TVVO1n129IllAnQHa6atrI806fpBJfM5UqQzz3vjs3I4tzKJ3w+2AooZf1TJerxs1MX4
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(4326008)(7636003)(356005)(47076005)(107886003)(1076003)(26005)(40460700003)(86362001)(2906002)(5660300002)(8676002)(8936002)(186003)(6666004)(36756003)(2616005)(54906003)(426003)(336012)(316002)(82740400003)(41300700001)(40480700001)(16526019)(478600001)(6916009)(36860700001)(450100002)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 22:03:28.2050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 468412ed-13ab-4182-bf97-08db62ec07b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5443
Subject: [virtio-comment] [PATCH requirements 2/7] net-features: Add low latency transmit queue requirements

Add requirements for the low latency transmit queue.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 73 ++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 03b4eb3..55f1b1f 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -7,6 +7,7 @@ together is desired while updating the virtio net interface.
 
 # 2. Summary
 1. Device counters visible to the driver
+2. Low latency tx virtqueue for PCI transport
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -34,3 +35,75 @@ together is desired while updating the virtio net interface.
    descriptors
 2. le64 tx_gso_pkts: Packets send as host GSO sequence
 3. le64 tx_pkts: Total packets send by the device
+
+## 3.2 Low PCI latency virtqueues
+### 3.2.1 Low PCI latency tx virtqueue
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
+ shorter than the CPU cache line size.
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

