Return-Path: <virtio-comment-return-7126-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B78C0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ABC6C2113C
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 884999863A5
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 71ADC984035; Tue, 15 Aug 2023 07:46:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 605C498633F;
	Tue, 15 Aug 2023 07:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tzd+nFAlXV6VYccFJj2kIkk7c16taknm3BvQnnoKkf8JZDEeH5N1rfPoAFClVwG9QefKp9br58+LpegKFwo5bARiM5kadJ7+PbVpU++mlFyuMQiyBZfHfTP5g3xOrbqMcv28+TZ+I431lsofDTKySYSGEa48GgsM5gkoasND+7EVwWVKnOQaUmpFBUoCWYIIu4U2RASsvDS3Z83+F95r85p9pr+9OgWH2O81ecn61zoNVnYxv13bnu6Wu5CbcdWkOIUoxJitxz/yd3o+ZPUGoj6MTAk9f4PUJrYvSWmTYJ3QFfmL0KQSBeoN6X3wWjyIpzQplFvyRYq1vJia0twvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MeTthBfvqVFy9FWdx8GEISGGAFvKGBAOu4aMimAU3o=;
 b=EeROXRXioaYhHrbmFZ7vD5I6r+h9RxqXfVNHuYK7RQg3VHtFvIzhDqaU6YeGcE6pVJmZ7iuG/2ZcdMqT216KJyOeMiQiZXjPqu1kGZSLZ+qQw9Z6fF3Z8SougUlwkpcoQmUefDSaLNtEylbPVvBGFxmXInj2O3fl/Dp3mxPJoZYptrNFzPkhTX0p6H6q5pcKlPaif34KrXFNAOzZTWOz2G+2FDWAa3rqqsJ53zvB5fcJXce60/x9e/c96o0ga8dwI2OH/gvhOF5877M9A8QedMmRV/RMOrlwEO2/N9kFFwIMaeJJNmxVSn/ujuOGr2OArZKn2oII7KwWb+sDuexr+g==
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
To: <virtio-comment@lists.oasis-open.org>, <hengqi@linux.alibaba.com>,
	<david.edmondson@oracle.com>, <xuanzhuo@linux.alibaba.com>,
	<sburla@marvell.com>
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Tue, 15 Aug 2023 10:45:54 +0300
Message-ID: <20230815074600.473933-2-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|DM6PR12MB4370:EE_
X-MS-Office365-Filtering-Correlation-Id: f12379b5-5199-4f67-3268-08db9d63b9db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	67a/Ix6+51GzhJwd9vdDw7yFEiDmnrjHs8zyBpZiXTnZ3pSLwJV7WFsQR8HnEH9/xmisXEUQ5JDbWc60vC6iSk06mobwdHtwAWAJgfNKyYsN7OzbRwi6gzByO611NSgK3Wqr7+5xff1FF6bYmkT/whMwmHRSwKLpDLfPamFWLaxNyEfPiRYmcKrRaBRVv+ynO7ZdNvJqoSDZHBRQXoeSyW9dg5l9VTymXz1vuLBqmJJboJt+tEjqsVu/cL4qwOH06yY/61BMkvUv/LFrv5udjUIWwpRon11fYX0iwVt6tBFpnXfmXZySduIGNFpKMIrvAlHT/lBNtsX05YJaTvn1Mfw2JAku5u6XJZ4WsBomQ2jUjijPWz+3sRr4JnssyrFc7dj3xZnvmLz4QWQBU0P0/B9KH0uTK3XFMsk9MLWSIsv5WcaXYIOzPUJeyNgoDcKQ0FiAxFXvzvYe+oSehgxXsLpWIXM9BcA/IuANRg42rdrgyZNgicLkyPhWOCa8t1fUAtK9Kn8/Jmc401dPEXcyVkghZH/9zu4Al/BqUGK8V4VwJkdnLr2T8DKCrC/0jK84uFolwbAEHUu2BxdTvdIMhpSeCK0jUBgd1xUhX4qshjOoxHHIQ+MR5Ptf56xoYbEFVZepqQ2Xphb9iP22FzZ4SSZLCNNr/Eh7dcM1S72OQvPlnt+NX+S5RBbiE3lPGNkY/ViL6UyQTVEa5/Tz3m6ueIfzdYVNy/wY8oZ+MmSRt2UQLaiUTuaqVMxeIq52So+Dj5uMg9AF/44LVm21JlYiSg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(82310400008)(451199021)(1800799006)(186006)(36840700001)(40470700004)(46966006)(40480700001)(54906003)(110136005)(6666004)(478600001)(40460700003)(356005)(7636003)(82740400003)(2906002)(5660300002)(36756003)(86362001)(4326008)(70586007)(70206006)(41300700001)(336012)(8936002)(8676002)(316002)(16526019)(107886003)(1076003)(26005)(36860700001)(83380400001)(47076005)(426003)(2616005)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 07:46:24.7436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f12379b5-5199-4f67-3268-08db9d63b9db
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4370
Subject: [virtio-comment] [PATCH requirements v4 1/7] net-features: Add requirements document for release 1.4

Add requirements document template for the virtio net features.

Add virtio net device counters visible to driver.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v3->v4:
- Addressed comment from David
- Added link to more counters that we are already discussing
v0->v1:
- removed tx dropped counter
- updated requirements to mention about virtqueue interface for counters
  query
---
 net-workstream/features-1.4.md | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 net-workstream/features-1.4.md

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
new file mode 100644
index 0000000..c2b1cc8
--- /dev/null
+++ b/net-workstream/features-1.4.md
@@ -0,0 +1,43 @@
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
+4. If a virtio device is a group member device, a group owner should be able
+   to query all of the member device counter attributes and counters via the
+   group owner device.
+
+### 3.1.1 Per receive queue counters
+1. le64 rx_oversize_pkt_errors: Packet dropped due to receive packet being
+    oversize than the buffer size
+2. le64 rx_no_buffer_pkt_errors: Packet dropped due to unavailability of the
+    buffer in the receive queue
+3. le64 rx_gso_pkts: Packets treated as receive GSO sequence by the device
+4. le64 rx_pkts: Total packets received by the device
+
+### 3.1.2 Per transmit queue counters
+1. le64 tx_gso_pkts: Packets send as transmit GSO sequence
+2. le64 tx_pkts: Total packets send by the device
+
+### 3.1.3 More counters
+More counters discussed in [1].
+
+[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00176.html
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

