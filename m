Return-Path: <virtio-comment-return-6671-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9BEEB64DD
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7A0DF6D02
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1FB5D986723
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D3FED986840; Sun,  2 Jul 2023 23:44:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 568E9986729;
	Sun,  2 Jul 2023 23:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsHehD+Qu8aeQ0Ltz4fPdR+2x23imFLZI8o8WHbp0eCNnDZ3B+7LgALoKstwap0BHuAS7Gxi8oS7/WTtB8eEfkBAw8J+XhAkG3QSbDUSlavkYSIsNoNDgZ8D5GGPxhIqEIbLFd7+/bzd927FX6ds59/t7qTQJ7BCYozmgbpu0dYrlc47iDeqy65Z5PDjrcCIHuISiE2xUX9Yx9lta036HkKd+GSaklebVC/qG3UVWqc0NZUjteh3ImzJpnHt1WBqTJmDA9MLmGS6r0KSpFhxMcXZW73CAHu32bvo8aQswMvP6kdau69X5t0sIpS9nVAPAwFLQXCTfqgkPsX8qUEA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZkuLjuS0RTqSYmV8jbundQJSpd6Nt9fI+cAbZKrHcM=;
 b=TZr5tYY5Ugfw7KZkLyeO3ZweZRW7ZEc2tzjHYeBZ9ESEFbnAOutuo/IQhV50p31aSj7+fsPw6KLI64DcrujHKBEL29F02Wd+dhn2KvV5lxFG+VnATvoTNSv0/8Tq9Ju8oTOPWFmGGzD0E0OmCs9u0N0Xn/FYLagZC9UxBhT5PnwMqokNsjklbKhDTTW5g5EfdABeW0zVs8lir9X+906yt9CyW8m9tXoaTrQQWRidWRgJ+LUKrLx5JzPCdJbUbsy4mdWJF4XY12aUuONlOunDw9AJCctbHUtWVlEZbYDhAZanItJOsBdEQOIcU7I0l5MrGd3TSopeZPnKgcunUlZMZg==
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
Date: Mon, 3 Jul 2023 02:44:09 +0300
Message-ID: <20230702234410.47546-7-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT056:EE_|SA1PR12MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dee9f53-a876-4aa8-3e59-08db7b5647e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zwplZN6IeHP0piYJb7GpenHYdjgdt8gLnO5Z3S6kpfA7b9UBbhQ7BTWQLNsx5oSOw7mM7Kb2g6rvONnR0MjXhzD014//WNK0l5001jqPEurNo4C2TlNzMAWYvmviMzrAdd509JSB2Q9rmLAP9PdGxVaSS3uaSugcbfEj1JuXXFLJKmfY7x4CH1yDbt1tqNDwAOYYsbNrPGKC8lGJRI6Pto+wTBi1QxourCkL8XuNYoV9K55FOtUyFYh6+GS8OQgfdIreUykN+gKZclyze3VVtWwY/YD9WvCSR/40ecPdO7fPMEb0Lj9MohJ/Qek8PYBC9VnGsgvbQq3A7rrgitirV50LWXXti78qOkoCCp2mNg0okobrt4Oh6Pi4j2dujScQf1EseSXH+79NwMoVV67sB7SKOl1yWNwqlQmaf1PgeiiIwwu/UcXXua5nhBVRILSOZ+PBYNLz2vBM5D2BPt6ehbeWU5FWxU++EIVxtgAiRkxfcMZx8TJwyj/VR6UZSg1SiAUnRkhEuf8aIIR2GKbMLtnYfx2fl2sYbRY7CP1fjb0S+g731pMspmUvggzCrEuN/Q+O9Tsv+rGwCkCggBnMRzWKSIC6VU8A4ej+OoUnYuL0tNACPxyv3UBX0uW3Uj8ma86O0/JmBiY0MHt2Bz/Q/paZskATEs3otrf61TE6JV+DtYGFI1wnFqx3Lff4XKPw5mHgaMxPZFK9QYnxM06ikd74EyWY1aNsaJQGKeDasnlLy1Z3Ae5E2pSWeO1+H5rq
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(6916009)(4326008)(70586007)(70206006)(316002)(478600001)(2906002)(36756003)(8936002)(8676002)(5660300002)(40460700003)(336012)(41300700001)(40480700001)(36860700001)(54906003)(86362001)(6666004)(82310400005)(16526019)(426003)(1076003)(26005)(186003)(47076005)(82740400003)(7636003)(83380400001)(356005)(2616005)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2023 23:44:30.4686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dee9f53-a876-4aa8-3e59-08db7b5647e1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5616
Subject: [virtio-comment] [PATCH REQUIREMENTS v2 6/7] net-features: Add packet timestamp requirements

Add tx and rx packet timestamp requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index ae40ee8..466e4db 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -10,6 +10,7 @@ together is desired while updating the virtio net interface.
 2. Low latency tx and rx virtqueues for PCI transport
 3. Virtqueue notification coalescing re-arming support
 4  Virtqueue receive flow filters (RFF)
+5. Device timestamp for tx and rx packets
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -267,3 +268,28 @@ struct virtio_net_rff_delete {
 	u8 padding[2];
 	le32 flow_id;
 };
+
+## 3.5 Packet timestamp
+1. Device should provide transmit timestamp and receive timestamp of the packets
+   at per packet level when the device is enabled.
+2. Device should provide the current free running clock in the least latency
+   possible using an MMIO register read of 64-bit to have the least jitter.
+3. Device should provide the current frequency and the frequency unit for the
+   software to synchronize the reference point of software and the device using
+   a control vq command.
+
+### 3.5.1 Transmit timestamp
+1. Transmit completion must contain a packet transmission timestamp when the
+   device is enabled for it.
+2. The device should record the packet transmit timestamp in the completion at
+   the farthest egress point towards the network.
+3. The device must provide a transmit packet timestamp in a single DMA
+   transaction along with the rest of the transmit completion fields.
+
+### 3.5.2 Receive timestamp
+1. Receive completion must contain a packet reception timestamp when the device
+   is enabled for it.
+2. The device should record the received packet timestamp at the closet ingress
+   point of reception from the network.
+3. The device should provide a receive packet timestamp in a single DMA
+   transaction along with the rest of the receive completion fields.
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

