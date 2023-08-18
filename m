Return-Path: <virtio-comment-return-7195-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EBBC71136
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C29FD26A2E
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B55BF98664F
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A4FD8986595; Fri, 18 Aug 2023 04:36:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6DCEF98654A;
	Fri, 18 Aug 2023 04:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0711RO9ZSM07N+ffDPw3/RvByBvE6X+xFmRFapz21B6ydrBy8c735DGIwksoekVTfQFFcGZQw+hFH4s39uN0vrl6WSsbNVKl/BWehpk7C37rnRTditLD9aJZjBHYI//r+OXpV/lWn2xr7KVMxZnSHhDHLHj/2uRyfM+FIMtdKUaxId02/wpI0xi2qi02dR/15nVmQovhKUZ28lRliWkg1jUeSx70szLZmbGTfiQmFUAX17QF12NUShczcwh0hc35kJ/QWW/Z7kf1Xp01+j50vGlcv4h4fNwgkJw/fR2ZatUn1/4lf6/w6JlMX7/D/DspP3HoPXQ8RLP+Pulr1jtxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRDjlibDo2SzY7yUaKWnMGEmS+AQVSjb7FzJl/jHquA=;
 b=cRJVXBw+kMi8mVbBGu5TGYW7Ri/D8noJNlaeJ4SPEKPUGFls0qpC0mvX0gFW1PiBRgjDD0u4A4DROmOMJpFBfuu9dRDE8Z1UBZOszFE29EoKPgNj25Y6FIOGaKH1w1LqNpfDV4Bv6Pjl7+8j13+8vHI8io12Eyl5y7FYt6l0sOjgAjvkM9x1Rd4KlNQJdjL9Sn9sOQkUJBzqJtITvu/dv69e/cjmDL29DpTIKOflHzuuUgpdZsPIfE6wxlzcnp6vgiW3kuD9o77Qy0GN2mu4G9uNlMYR1hVkN2Z1ZnDlK+fF6xEAT6grEtsXNUS8EeR0vcxaH9VQkNIvmmXfmgUuXg==
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
Date: Fri, 18 Aug 2023 07:35:51 +0300
Message-ID: <20230818043557.496964-2-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230818043557.496964-1-parav@nvidia.com>
References: <20230818043557.496964-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|BN9PR12MB5098:EE_
X-MS-Office365-Filtering-Correlation-Id: 910cd01a-3d8d-4815-68f2-08db9fa4ac1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gTAcRt833Lg4dmzuWUf34bNBbw6PhOrY/Vm5AzENCGnA9wWcPN49+wKQGZqZSyFN/akN99NbErvz/trU6+dD5zDDTZWgfazXLqXHIB6TKNq4gALMPkM1zTWb3RWewMcEWWI+SJfisY7fP760n9vAeHiT9xFsZjjti/UnRib7mQRedzxzH9LFokkDnKIoOamWXo+T7PE/GBB5fPU4i0XA/AkhUs7O1cezRVmi7yN7Ve9X4pPtB4fVbJON4YLfRFPFBGl7ypR7DN6fsEKMo4l2ng1rN5KUQ5QmyAOiBzkxJuaFubLOvisIRHQSIOU830gAt87fW4TlOolB1gHPPMVP1kDuChKAh6PIJxeS5sPhKXZU01noNzGiEDpKyH9yE3m5eohzqifXs8mK9vfOhzEayuK3LnIg6TjK8vjv+sItxKRBN89JjumDlGPBf0j8u0UOC1+7o+KwNME8JrUu+N/hUOulF3naoLnvUG/6mEas80fv3LlR4WhqYS1mMeUP6HjNG1zRnl2+gjrnt7cJYot9Hq9ssbKT2A2Jx31AlQUtpJkiel42BnFw6IR+CIxz1XJz204qAdPUavv0y8lVzxiw/FHrYpwBVpVAqKKuzo57gZN3PQJRAgoq939UBPJthDoItAFJ6akbly3/25WbN/osxBhcljLx5DuvL9AIabFHKkBLz1O76k/dIZibFxFR+t+rsAIomcQqL+fMpA46Qm14qOyYz35KVIlKCcXYWJaXD+2nlYznIvuLVcsKT9O0sx3vFf7Yy86fJl/c834kj/dKxw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(376002)(396003)(186009)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(6666004)(40460700003)(86362001)(16526019)(336012)(426003)(1076003)(107886003)(26005)(40480700001)(83380400001)(36756003)(36860700001)(47076005)(7636003)(82740400003)(356005)(2616005)(2906002)(54906003)(316002)(41300700001)(70206006)(70586007)(110136005)(5660300002)(8676002)(4326008)(8936002)(478600001)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 04:36:21.2999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 910cd01a-3d8d-4815-68f2-08db9fa4ac1f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5098
Subject: [virtio-comment] [PATCH requirements v5 1/7] net-features: Add requirements document for release 1.4

Add requirements document template for the virtio net features.

Add virtio net device counters visible to driver.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v4->v5:
- Fixed attributes query and counters query
v3->v4:
- Addressed comment from David
- Added link to more counters that we are already discussing
v0->v1:
- removed tx dropped counter
- updated requirements to mention about virtqueue interface for counters
  query
---
 net-workstream/features-1.4.md | 41 ++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 net-workstream/features-1.4.md

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
new file mode 100644
index 0000000..ea36f09
--- /dev/null
+++ b/net-workstream/features-1.4.md
@@ -0,0 +1,41 @@
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
+4. If a virtio device is a group member device, it must be possible to query
+   all of the group member counters via the group owner device.
+5. If a virtio device is a group member device, it must be possible to query
+   all of the group member counter attributes via the group owner device.
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

