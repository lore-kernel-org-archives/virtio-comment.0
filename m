Return-Path: <virtio-comment-return-6076-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A230C7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ECF681CA270
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 90BCA9867CD
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7B4069867C3; Thu,  1 Jun 2023 22:03:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 660B79867E0;
	Thu,  1 Jun 2023 22:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qo0FgDWmt5fzBh2YtiFTf+EIFoDA1UveyegftidGdqh8qHA0Tc7Org7sDJRP7n3136aAA+EpPDeq+tg4q9vjp7X9iogsX23/r/wXdqgYNrUzG7u13DbqVyYtd7FW/KqvMRIti8pAtjQdM5qXMkOSBJ4lw/s9HnJyQ/rfLnzfKgeeOQGOcczBUY0T6pmX+wrnDWyjgLAFM4uwFSM+D34QPXqTMG56cozmV1yH63cBllsexImqobdI6qhK5AUbLD1sAK4qMY4PPwWJCSofGn4yChZq6VKZhrOC2X75EDP3gxTRQI9OONNBf5XT90PSM22h0DLPSb9JQJQGonhNQINKwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/DP7082cmwi9KMWsQNRJ1L/2CYUj7pB7aajoTRPpAs=;
 b=AOs2yhdBKE5HdQhgloICuAhYMegNXQJeHkiiraXRANKs2fa6VRITf4Ql4uUNhgJmngePNXRW+5GN0IYoXX5pyNh4KWczZQJzDDtB6LCIzpA9kKizDm1c7ASHto/aU1CUsm7eMAUnqRoDn9lFVbPKg83vtIbcSQaW1N8wu/3EGz8k94E9EQEDqzN9JAMAEd1EKvIOwKTbycL74xxywSHujMFS6lZ8zuJS/L6vIgjIM2LXYO8uhm5X6eKvFDkEW9HJkibcyd5fyDVlfx0oMcXm0EoJDjtYUfP9qyfCLa1h+0qKXpDry0EIFgVJNWsbohNvmXNHEUwIdgQtdXFkIR74Sw==
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
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Fri, 2 Jun 2023 01:02:59 +0300
Message-ID: <20230601220305.587034-2-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT068:EE_|BL3PR12MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 27520b1c-22d4-4735-d79e-08db62ec0909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0ctkFqsVGzYkSQpHddlAqkY0RGycuhAhBeRD+Qbk2gE5cB70CW+uVaYZg98OyWCxHsDGZIVcA1wxsqV5q7ICeYVSqJtmyEV3eIsVlL0H784wBDnqoEd8Bj0rQBwiifp5U+3YUe5PCPihDQPoOfvIFQdv9fy4A4PWro7Mrx5JAltSgV7N1c1N2FMdwGkVrwzYFGN1kkwLk/mUPg/ayVMCPLwD8a6WZhlNZfXHZOmIp91tFF/NqT2m5LL0T6XKStzSFNq7QNv71JDoEMLLLNuCevVay6YMEFLO2EUgLscxd8RBlHV6S0fIQoAtIVg7jT35pgKNFY4BY2tU6E3z9Fk4JfpO+xNXtk0f/8CaT+Y+eZJhZiUpwtbKBy4cyZlfbajfLV4ypJ1WySSr1l/mWpG/ZW9iOJUhC/jes4UE63ZYFfPWTcfgAdYlAUwSVIcWkMurLPIarjg2zTpyCaPFUQeH8Yj4QrDpOsFn5cox1r6yH0g/g6NZ/1HV4NULO45DjbdsdxknRvU/TKNK2dtayd/ReyVa88RiArY6LKENkfVJAJ/wjfDfpy6NJzcYF8DSHmIuLB73bjrj1MmybCHOcUb8Mm2qSrSdFaD4ILJSCVE0YOSu3w3AWviwag549MjbvNA5YfFCY5cw9MhN/R2fXeWr4Cdce6m0rsrSgfMqqXErHft5QC0CFQKMj58hquEpRsWL00OTrwPS4DsKtyO9ul/rlZmWKz+qJ50+rltEEf3PPT2Ez9PmbKK/wzQkfwZ8VMko
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(107886003)(82740400003)(2616005)(6916009)(4326008)(36756003)(7636003)(356005)(450100002)(70586007)(70206006)(86362001)(478600001)(54906003)(1076003)(26005)(40480700001)(186003)(16526019)(41300700001)(2906002)(36860700001)(47076005)(5660300002)(83380400001)(6666004)(8936002)(8676002)(82310400005)(316002)(336012)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 22:03:30.5407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27520b1c-22d4-4735-d79e-08db62ec0909
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6548
Subject: [virtio-comment] [PATCH requirements 1/7] net-features: Add requirements document for release 1.4

Add requirements document template for the virtio net features.

Add virtio net device counters visible to driver.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 net-workstream/features-1.4.md

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
new file mode 100644
index 0000000..03b4eb3
--- /dev/null
+++ b/net-workstream/features-1.4.md
@@ -0,0 +1,36 @@
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
+   debugging purpose using a control vq command.
+2. The driver should be able to query which counters are supported using a
+   control vq command.
+3. If this device is migrated between two hosts, the driver should be able
+   get the counter values in the destination host from where it was left
+   off in the source host.
+4. If a virtio device is group member device, a group owner should be able
+   to query all the counter attributes using the admin queue command which
+   a virtio device will expose via a control vq to the driver.
+
+### 3.1.1 Per receive queue counters
+1. le64 rx_oversize_pkt_errors: Packet dropped due to receive packet being
+    oversize than the buffer size
+2. le64 rx_no_buffer_pkt_errors: Packet dropped due to unavailability of the
+    buffer in the receive queue
+3. le64 rx_gro_pkts: Packets treated as guest GSO sequence by the device
+4. le64 rx_pkts: Total packets received by the device
+
+### 3.1.2 Per transmit queue counters
+1. le64 tx_bad_desc_errors: Descriptors dropped by the device due to errors in
+   descriptors
+2. le64 tx_gso_pkts: Packets send as host GSO sequence
+3. le64 tx_pkts: Total packets send by the device
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

