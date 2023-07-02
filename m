Return-Path: <virtio-comment-return-6673-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F87DEB64DA
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 374EF71CA0
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 21BE4986634
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1826F986471; Sun,  2 Jul 2023 23:44:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E06D9986560;
	Sun,  2 Jul 2023 23:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbbkEqnx4Ml/Y16gqhYv94olKak4mVwMk0eMqD1lRL83bEHLSx1dMOhZvlLXUjR6yW2xiZiSFfilrmBe63MqWgJzYeaARc4bwKIr009VCsrAGk5LN53/g7ua4tmmArGt4ZC26rldbguFYyHZrmZvfPDhU48p/0yEABPbr3VBdSpXEfqA3/GhGl+FIq426wrv0aYpiDUBc38U7Th0lIkDQbHOVRLKWp3BUysQxTXZB/VUv7D1VAdj3Ezf34zSCVSF7em2oZKJ4r7jY+ksOiEDxW7BsriQCNu3NEfccQOoYUy6T4qRAxP8yiU9iqzmPTm+9aDYFHfHQRKHcyBrhW9E0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uasI6msG/h+O8rBYGKOnBjMaD/je16m4N3S20O73Zqk=;
 b=YKkz/zWx3o0iufQoBiSHAmB6+Q637G+YgWksUdoRfk9n9yyc19OZ1ZPyerpqEVsU66oPfTBpwdX1NKGeu8bGAVzCqIOjhy851YRF8DEVoB33FZBRcigaTREjFvtSczc/H4R9Nf+3nljmeCNngipWEZKjkICwY3dkh/G/E+Rq2Lj29qCDzKHZgT2u8z5hC1DIyCjg1aBwQ3iXCx8GWdLSXelKwb0DsH7VDVFhcBaBHs8s+zksokFUQorma5aJmmMCm5CrZoU4Ap/oWKqElHSutHNgEZImMM77elzrHNAlIBGhSh9uDRpeniXajM/Q/gfwJPAE4JtEqfO3I/4zZBLVfQ==
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
Date: Mon, 3 Jul 2023 02:44:04 +0300
Message-ID: <20230702234410.47546-2-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT101:EE_|BL3PR12MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: b35e6ae3-30ff-49e8-e545-08db7b5644a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g4LddncrmAFg/rvLtObXCCYYIaBstd7g+K2WLSQueu6qLGRk9FFGHo61WjIJUZFZWCP/f/tkTn+a1S+EokLQLDjcIJDi5cPW1fa9WSuHWSl0vHSFxihrZ/I5+nSt6lNzPCWqPRy2JSRPC9G3UFg8Hlk2v8UcyprmGXb9TehiGIJlnQL/35seEAqKHqMOu+R/20Oly2fP/dGip3syop90lEwgm9GV6UQttmZ2I6n7Alw6VZ0Ex4qO/gXS1ox/Xs6sMrTGhx9tM5hDJ3/c/bMq0p/p7ivuJ5oFdaEEGKHDUZAA9izk2ZQafTu4yl34ywh9PT0quAFFKftpqGbXYRwsKZr2vpKeVhIb/YfUKrKHol3ylvS3tPtknItBuUiJjmeHHw+g/AEj7vnCyliUL0ZC6swmLKqf7VH6gMdM0/9gYP8pZJqKEZ8kGJyz4QNMx91uRXw6WN74haz4WAXHYrU64TokfYJbHXmsxhQmN2EI1tVmZNsgCzTK5uyBc9B/LrMBHnqBqDojwVKUNnIJXqwc9vpt0FruymOXNDjClfA2XOSzk9vn3HZUKkXQjXCjobQroVkWKUQ6WIaOtUD15ZAptphpqBgKIPdVEpGwv8OljM4QT24xpeC8purvkxWgzjDqXI/+IhPItXjxW3b7VAHBKvu+4xx2l13gGIJAXcmWqHKQPIFyVhzc42rPeEjAoOySdpdhH6uzTTal0uR/VVvRpqOohQ6r5I7JR6KLhbpjVanr9wrMOMrEx2QJP2Ztp/Uu
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(2906002)(41300700001)(5660300002)(8676002)(8936002)(82310400005)(36756003)(40480700001)(86362001)(16526019)(186003)(2616005)(478600001)(107886003)(26005)(1076003)(6666004)(82740400003)(47076005)(70206006)(316002)(4326008)(6916009)(70586007)(36860700001)(7636003)(54906003)(356005)(336012)(426003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2023 23:44:25.0424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b35e6ae3-30ff-49e8-e545-08db7b5644a2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6452
Subject: [virtio-comment] [PATCH REQUIREMENTS v2 1/7] net-features: Add requirements document for release 1.4

Add requirements document template for the virtio net features.

Add virtio net device counters visible to driver.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v0->v1:
- removed tx dropped counter
- updated requirements to mention about virtqueue interface for counters
  query
---
 net-workstream/features-1.4.md | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 net-workstream/features-1.4.md

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
new file mode 100644
index 0000000..4c3797b
--- /dev/null
+++ b/net-workstream/features-1.4.md
@@ -0,0 +1,35 @@
+# 1. Introduction
+
+This document describes the overall requirements for virtio net device
+improvements for upcoming release 1.4. Some of these requirements are
+interrelated and influence the interface design, hence reviewing them
+together is desired while updating the virtio net interface.
+
+# 2. Summary
+1. Device counters visible to the driver
+
+# 3. Requirements
+## 3.1 Device counters
+1. The driver should be able to query the device and/or per vq counters for
+   debugging purpose using a virtqueue directly from driver to device for
+   example using a control vq.
+2. The driver should be able to query which counters are supported using a
+   virtqueue command, for example using an existing control vq.
+3. If this device is migrated between two hosts, the driver should be able
+   get the counter values in the destination host from where it was left
+   off in the source host.
+4. If a virtio device is group member device, a group owner should be able
+   to query all the counter attributes using the administration command which
+   a virtio member device will expose via a virtqueue to the driver.
+
+### 3.1.1 Per receive queue counters
+1. le64 rx_oversize_pkt_errors: Packet dropped due to receive packet being
+    oversize than the buffer size
+2. le64 rx_no_buffer_pkt_errors: Packet dropped due to unavailability of the
+    buffer in the receive queue
+3. le64 rx_gro_pkts: Packets treated as receive GSO sequence by the device
+4. le64 rx_pkts: Total packets received by the device
+
+### 3.1.2 Per transmit queue counters
+1. le64 tx_gso_pkts: Packets send as transmit GSO sequence
+2. le64 tx_pkts: Total packets send by the device
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

