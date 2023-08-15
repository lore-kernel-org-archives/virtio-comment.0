Return-Path: <virtio-comment-return-7131-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E3DC0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 61714C6113
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2C573986660
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0EC08986661; Tue, 15 Aug 2023 07:46:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AD0ED9866CD;
	Tue, 15 Aug 2023 07:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtyJUlx8LkSqNdb1C2U9MMBrJ8Csc24ZdnAHmymgJLLmdW3ORh+dW/UocZ+fiM4aaNc13/avpMqwLf4iwus+QEyCo6Tw1gURwLbyVPl6ZqzLmP0Yg8ArPjwfPhF9vWqt5IDGz8DXWKmBnlmP0WjHcEuF82m0V3wPALrpEZArfQPXrO7bQX70yvHVkK5o6aANiMBZZhkyIwDs0WBqk3EPFavcs+oQ5hOwcSsB+4zFjGVtWUZy30yIfqg3tj7XFwMZDhGinKHNylST6Sw39B4qYsGtFda+SpCRhuG2/MG6tt0tyldLSurtmXL69f+Xm0TJKWKmj1b2BZw+poKg0aCHEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKimV8o1v4Wh1Q1DS7i+MyIT+UJkXGQBHDCU2aJ0Ngo=;
 b=eDwJheuHJOIFepeaOaWUwSRwjXkomWgBlnGdUKc9TZU1daHTbPTdxxnhZGvz34oyk55RsF+DsEAY9kJxTZXBcoB6bTw8e1D18Dygn4cf441CJec1vf7mrbK58oPkA0hzjsrkjRT1uK/vnCS46JGkZIuPOi+Nk0jrWBPD8ouA+fde8Roy4ZUA7KI4/kjyittfuPLXgWLKvUtcbQE5qkKaIVW0PFbdRBv1py493420EcgWq+p+umwMs4n1/6G3puKI2lEOXXzjT012VaX2swQIU7X5H1GSsKoREemmJIBpWSWkLXHPHFaKh6BUVk6aAk8xLcij5EW4QaRGb67A5ptKKw==
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
Date: Tue, 15 Aug 2023 10:45:59 +0300
Message-ID: <20230815074600.473933-7-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230815074600.473933-1-parav@nvidia.com>
References: <20230815074600.473933-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|LV3PR12MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f6922af-593f-489f-bdc6-08db9d63c00f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GV3eCdkGQ71Grv5L1+bpb4sOEHjvLbE6d7gZ8kIvxmn7FL7Cr/o8G2qHBtoEcs+qnIkME5GYG+jpdMHm9LpyEi/AxGeotBVayaQrxAMxibImLKzyS6xZzppfqrTambfqXvOqlVUBJ5gKXrSSXjAR1Hnhj114DJFhCPJ8KHJ9QGVCs9O2BNdwnzlvXaKXVk18KDvuJcHHvtky++Ovyq35R6ysiUytxX98gANwwEjwl2WfFo3MvDGl4LnqnTYKMcSm61DIcnkmXlzFglqWG1rD44KbRopIg1gLsgPkhgeLbYOwGudPdFtLj2fA5XAJ0hEvP5do/d1YwDO2zaVindw76Sgv+fiZdbpv9TF+vpFYZE/IHh6Ma+m9MV4xRQlbEK9D+WHaQwxmpF/msXA18+vfAxVZRgtIkkXYsr6vHBjjqnaOefVAWClfeVnBoa8RfwmuCIGZtxmLWe44t8BmK2HfZGn/srqtgUPA91zY8T2pg+HCblIRNKt4nAAfvAYnNdRfFnI0jAhFEVNDHFnLW80C0DeIyrtOtmHEPdn1GEqoOQLYDhHKL6woYlTV5OiYzZGV8nXM+vHI3GDzP5h3L5ibCTs3iD8kGeo/hJOPosNu7ah7bxj2iokvayCN5dYZVwD9H61E/iKzTAzLGq6G/SRBiGMd+Z94ygdn1WBrSQpC+dUy3tDeQ2AxsYvIyjCovuWKxnsvPhAM8uLYx5Cw+X7ibDS35XEFulLSEzYkXjRDbmY=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(346002)(186006)(82310400008)(451199021)(1800799006)(46966006)(40470700004)(36840700001)(83380400001)(36860700001)(40480700001)(86362001)(40460700003)(6666004)(7636003)(478600001)(107886003)(2616005)(36756003)(5660300002)(41300700001)(8676002)(4326008)(8936002)(316002)(2906002)(110136005)(82740400003)(70586007)(70206006)(356005)(1076003)(54906003)(426003)(336012)(26005)(16526019)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 07:46:35.1856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6922af-593f-489f-bdc6-08db9d63c00f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9185
Subject: [virtio-comment] [PATCH requirements v4 6/7] net-features: Add packet timestamp requirements

Add tx and rx packet timestamp requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Acked-by: David Edmondson <david.edmondson@oracle.com>

---
changelog:
v3->v4:
- no change
---
 net-workstream/features-1.4.md | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 78bb3d2..82b907a 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -10,6 +10,7 @@ together is desired while updating the virtio net interface.
 2. Low latency tx and rx virtqueues for PCI transport
 3. Virtqueue notification coalescing re-arming support
 4  Virtqueue receive flow filters (RFF)
+5. Device timestamp for tx and rx packets
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -334,3 +335,28 @@ a. Driver should be able to specify a specific packet byte offset, number
 b. Support RSS context, in addition to a specific RQ.
 c. If/when virtio switch object is implemented, support ingress/egress flow
    filters at the switch port level.
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

