Return-Path: <virtio-comment-return-6886-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32645EB64DD
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 670DD2AD53
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D9C57986914
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8DBA09868B1; Mon, 24 Jul 2023 03:35:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 07B7F986494;
	Mon, 24 Jul 2023 03:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HL3X+YyACIhHMextSAsiDjq0qDIw3Sy4NRe6LxZAa8VBN6z0rWoFaQyXGZmP22sseWyMDMP4hjv3IN4NGDznawYwAEymf+IzgPlT8XD+qqYAFiIYlhlVmvl5zMEMKCT6KQbJhcidxEcoNLmFrl1/2dlzOzV+ye/PHiwA0L4BQvs6mjobEq17oo0I9r0k6bL50ixDnAg0xVPC9Q4m0OB9FkbbXGmaXmddqGq+6pd/es0kpmyjJMYbW8Fxl62FJ2IKhn4GKK9fcGerwT8cmIKEY63VrN6QqBGLyzD0qCXvFOzO9Q2dXpvMRAawWfVKw9fM/uYd1mrsrBqA+LUA3jZC3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uasI6msG/h+O8rBYGKOnBjMaD/je16m4N3S20O73Zqk=;
 b=ZZQZ+7aq8egkWASM+wYcYrPyRlRRGRHwtay+6lXewxupnsCQxojdAV7YlNw+X+uRHz9c4knJbQbQgh3X4IwdMsmbehAEkbQi4I0AGtBUUenhwqbf2wF9P1MUSfw44vSDbBsXOSk/5sE/ITB301dne/AeAhjyYd/0SXJGUkEl9cmkgbPQmX3HiIUyGU/+BEC2QykiZe2Ra4/KnvIA1oAuPU0BsN4HjvEJ0YiMJzvb91+WjIJQ/wpxvY3FBxclcR18KgzIEtoH2wFpOhSnfruDgSyjKNEsV96QfajaacwrZpza0NJ7A1Vw1q4JE17V5/EssnCpBopOI28I5vtTpyfqRw==
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
Date: Mon, 24 Jul 2023 06:34:15 +0300
Message-ID: <20230724033421.249893-2-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT098:EE_|BL1PR12MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: ab10073a-4855-4411-4c43-08db8bf6f076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p0wHX+0JCIPxsI4M8+s/ohKH4/NMsgkZAzaM6hHH9VMUQwMx2oPbamUaZZgy5+hn1WB3Z9xkTJ/l4kOzqyYYi4aBOzEJLoer30hG03JrDmRc6KjUbwTT5VQY9Si/Q1GGx4fNOAQQ5c+6ttpcV2Asa2wHM9jyVlfQFXZ0P2UHQgEXkQHVuiKsH+SoBtIaq/VjB6dlxWmbTg/PQzV7sxQDAdqX8oJw4wUZgWOf++s9488+n80wigKqWN4JMitR3KTXZA52bnK1vWuoKeEDlsYFax4EXHxmWTYcvbEmQD7kk5D3IiM6iqr7aYhM1A8Z0Xia3VB1qZYhlq2en43hRRXKIOPy09ADIZ35xTY3xSiX/f1TAZFV1+WNKhikR5y2WXoDzwYmN5dUkLE93Ww2AdVa4JqzCm7K1ZENsk4VLHFy7mPHomibf6TTZUrX/Rsjb8ROgbAEGdDsjxs5peOccEq+gan4Yn66PtGgvaQTgOuihb1P5acG37MNk8TK33qEI4f/0uJD73CQ/p3X3NFR+zNUWRN9c2pZq7i+a+x6fEKAgftyMwuoEjBzRIkk42TDxBl4TFFnws7+dz0lUIqNQIH52W/c0KgkCBIvqVfu3bE/cdc/Dl2ixLezqxSbtfGkQLQ2I0lTGtBvv4gooxWawD/82rKweZoErdDawxPar+q4xv3YozxDXLkbC/MDPn+WFNeXLEE5+e/N1QIbbxR/VwY9Vkkd1yf6WoKmjb/1+n880QI0gQR7shuECGOvSbg2JAkh
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(82310400008)(36840700001)(46966006)(40470700004)(8676002)(8936002)(478600001)(40480700001)(2906002)(40460700003)(70586007)(70206006)(4326008)(6916009)(316002)(41300700001)(5660300002)(54906003)(36756003)(107886003)(82740400003)(1076003)(16526019)(336012)(186003)(86362001)(26005)(47076005)(2616005)(426003)(7636003)(356005)(6666004)(36860700001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 03:34:51.3526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab10073a-4855-4411-4c43-08db8bf6f076
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5801
Subject: [virtio-comment] [PATCH requirements 1/7] net-features: Add requirements document for release 1.4

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

