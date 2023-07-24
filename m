Return-Path: <virtio-comment-return-6890-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7A5C001B0
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 18F6945B56
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BDB3F98687D
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AFD40986912; Mon, 24 Jul 2023 03:35:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 975A7986510;
	Mon, 24 Jul 2023 03:35:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgw22DPNvsm2/kzjSAAueR8c3yjhrrGotmHF8MjSnDGSyU8UJX4e8W8T3g37ZMwpnugvbjgtLfNWnBsi10wQ7AhWOeHx5NV1UxoCCxnfDFS9KhwrZcDcW+FnCkGHb8CR6AqOd41zdBKUtDCGHJRYuj4SQdmh52gaGiXwlwT88BsctmmU6Hhqo058Qm4P8eQ28D5OIjGkobFkBMtrE+vkoE22HaqjHta0jDY6XybZhggdDUYBj5nzI0NyKwPHUTztMDvbuaPVBGzZjsREJ5XyVgbod6eOC3En2hSoSAWFQDQ20hBaTyXdfGryXGO8ND6VhhO5BYyAb4bxdKOqZjmvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UR/7rio9duBRhHsWgqZnh0a7/TFfW5EuPNL6Cv1858g=;
 b=Rx5tKtUBXWUyLR/5gh/0PaN1X+R433+ExxAVieGPw53R5356yt3sycFN/ZXWKB3MOmz6uk0v/t6o/i7ndp4ukCH6vmI6p2ohabe4JaqVQ4mgHSAj8kpuz3Jl+tiwlqql++3fYdBLGbklt3xlIfR4mdYUD9TSYkOGQkz9Yxry0cD6Dok4Swar0qDn2RwXkE0aqzCuQZGM4x7IzEHlEyauR0M7io08tCvnsj8bVx/kh/6u0jKfvl5ZPcA/1G/y7hnoDvmYM0hUoeCZU7BBBqovStyYyi9PG0oIsr7+hzas0o5/8HRMJ7kMzLtyWua4yboDcbPyawlE0WI0tW2gqGcU5Q==
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
Date: Mon, 24 Jul 2023 06:34:19 +0300
Message-ID: <20230724033421.249893-6-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT115:EE_|PH8PR12MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 754ee5dc-b9bd-4799-97a2-08db8bf6f2bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YW+JXayl6bl6aT6SfbURUMfavphqNVgzEgY5X9uDBHlTKhhiKQ0PRHiSM5PAu/yXDnsswAMLKh8F5u6nR0ubFboN/KBEDICCmpeNlHrc6eQuL5QJTYCbllZw0g0rYpv3VCo1Cn5esQNhOQbgDJNXY3Irf5aYgqmFCU6k56UgTTBo2lokS8KofKaFiJmrJsiTceLa1AS8XNDr+wq4uifYZNp85+EYXMmVIumBCi7Y0u0SacS4l9EyOVMu7yaH9SrU6eR3JVGLOWwDBFOhyTFeaETHXX35J9hogs2CB0Q9ggT3P5H6lsl+kDJz2Q8rJCoBWIg+fXitTByBn9WqqNd7ZXanaVgUKtQv7ZA6eH04jBHKdJ6GD2ydwkC2s5y7lbjNKhPIi+Yl4rj6zs19SH4EgieYOd6d7tUgSPWvtB3B92uIPpWPdAUUaVyaj5APhCrBOSdBVSbfkQmWGslxMaTZulPxkts/mhgbDcwoCdZhzsgqNa24LtSsUt59MamD0rozvOSBwjOmp7OvqmoUoMlpLkIg6JRAkad6Yxd5ARxTUZqV+YlVsHDruHDtKfvF0xvgEub7X7ZRQ5XUuRmGaVhaenoearxtoVsUJmvop2ONMlh5N6YkM5EcCGlfs2gWmQTrgD9aywbY46Oqrt2sZo6yUhuNCgEPSXJ7VY115MswI6IwoLS2CyoXE80NpAoNACOHyIiiUNqgfXdnfVT12JNwHiCCx8o0u0rcGH5c1KOojB1TPeYPePuD2mafgEF5dgTR
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(40460700003)(2906002)(70206006)(70586007)(6916009)(6666004)(478600001)(54906003)(426003)(83380400001)(86362001)(36756003)(186003)(16526019)(336012)(82740400003)(356005)(2616005)(7636003)(107886003)(26005)(1076003)(36860700001)(47076005)(40480700001)(4326008)(41300700001)(8936002)(8676002)(5660300002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 03:34:55.1884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 754ee5dc-b9bd-4799-97a2-08db8bf6f2bf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7279
Subject: [virtio-comment] [PATCH requirements 5/7] net-features: Add n-tuple receive flow filters requirements

Add virtio net device requirements for receive flow filters.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v1->v2:
- split setup and operations requirements
- added design goal
- worded requirements more precisely
v0->v1:
- fixed comments from Heng Li
- renamed receive flow steering to receive flow filters
- clarified byte offset in match criteria
---
 net-workstream/features-1.4.md | 105 +++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 27a7886..d228462 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -9,6 +9,7 @@ together is desired while updating the virtio net interface.
 1. Device counters visible to the driver
 2. Low latency tx and rx virtqueues for PCI transport
 3. Virtqueue notification coalescing re-arming support
+4  Virtqueue receive flow filters (RFF)
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -175,3 +176,107 @@ struct vnet_rx_completion {
    notifications until the driver rearms the notifications of the virtqueue.
 2. When the driver rearms the notification of the virtqueue, the device
    to notify again if notification coalescing conditions are met.
+
+## 3.4 Virtqueue receive flow filters (RFF)
+0. Design goal:
+   To filter and/or to steer packet based on specific pattern match to a
+   specific context to support application/networking stack driven receive
+   processing.
+1. Two use cases are: to support Linux netdev set_rxnfc() for ETHTOOL_SRXCLSRLINS
+   and to support netdev feature NETIF_F_NTUPLE aka ARFS.
+
+### 3.4.1 control path
+1. The number of flow filter operations/sec can range from 100k/sec to 1M/sec
+   or even more. Hence flow filter operations must be done over a queueing
+   interface using one or more queues.
+2. The device should be able to expose one or more supported flow filter queue
+   count and its start vq index to the driver.
+3. As each device may be operating for different performance characteristic,
+   start vq index and count may be different for each device. Secondly, it is
+   inefficient for device to provide flow filters capabilities via a config space
+   region. Hence, the device should be able to share these attributes using
+   dma interface, instead of transport registers.
+4. Since flow filters are enabled much later in the driver life cycle, driver
+   will likely create these queues when flow filters are enabled.
+5. Flow filter operations are often accelerated by device in a hardware. Ability
+   to handle them on a queue other than control vq is desired. This achieves near
+   zero modifications to existing implementations to add new operations on new
+   purpose built queues (similar to transmit and receive queue).
+6. The filter masks are optional; the device should be able to expose if it
+   support filter masks.
+7. The driver may want to have priority among group of flow entries; to facilitate
+   the device support grouping flow filter entries by a notion of a group. Each
+   group defines priority in processing flow.
+8. The driver and group owner driver should be able to query supported device
+   limits for the flow filter entries.
+
+### 3.4.2 flow operations path
+1. The driver should be able to define a receive packet match criteria, an
+   action and a destination for a packet. For example, an ipv4 packet with a
+   multicast address to be steered to the receive vq 0. The second example is
+   ipv4, tcp packet matching a specified IP address and tcp port tuple to
+   be steered to receive vq 10.
+2. The match criteria should include exact tuple fields well-defined such as mac
+   address, IP addresses, tcp/udp ports, etc.
+3. The match criteria should also optionally include the field mask.
+4. The match criteria may optionally also include specific packet byte offset
+   pattern, match length, mask instead of RFC defined fields.
+   length, and matching pattern, which may not be defined in the standard RFC.
+5. Action includes (a) dropping or (b) forwarding the packet.
+6. Destination is a receive virtqueue index.
+7. The device should process packet receive filters programmed via control vq
+   commands first in the processing chain.
+7. The device should process RFF entries before RSS configuration, i.e.,
+   when there is a miss on the RFF entry, RSS configuration applies if it exists.
+8. To summarize the processing chain on a rx packet is:
+   {mac,vlan,promisc rx filters} -> {receive flow filters} -> {rss/hash config}.
+9. If multiple entries are programmed which has overlapping attributes for a
+   received packet, the driver to define the location/priority of the entry.
+10. The filter entries are usually short in size of few tens of bytes,
+   for example IPv6 + TCP tuple would be 36 bytes, and ops/sec rate is
+   high, hence supplying fields inside the queue descriptor is preferred for
+   up to a certain fixed size, say 56 bytes.
+11. A flow filter entry consists of (a) match criteria, (b) action,
+    (c) destination and (d) a unique 32 bit flow id, all supplied by the
+    driver.
+12. The driver should be able to query and delete flow filter entry by the
+    the device by the flow id.
+
+### 3.4.3 interface example
+
+Flow filter capabilities to query using a DMA interface:
+
+```
+struct flow_filter_capabilities {
+	u8 flow_groups;
+	u16 num_flow_filter_vqs;
+	u16 start_vq_index;
+	u32 max_flow_filters_per_group;
+	u32 max_flow_filters;
+	u64 supported_packet_field_mask_bmap[4];
+};
+
+
+```
+
+1. Flow filter entry add/modify, delete:
+
+struct virtio_net_rff_add_modify {
+	u8 flow_op;
+	u8 group_id;
+	u8 padding[2];
+	le32 flow_id;
+	struct match_criteria mc;
+	struct destination dest;
+	struct action action;
+
+	struct match_criteria mask;	/* optional */
+};
+
+2. Flow filter entry delete:
+struct virtio_net_rff_delete {
+	u8 flow_op;
+	u8 group_id;
+	u8 padding[2];
+	le32 flow_id;
+};
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

