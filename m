Return-Path: <virtio-comment-return-6345-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE41EB64DA
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AC11129FFC
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9A54298669F
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 90F1F98665E; Wed, 14 Jun 2023 04:23:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6AD9A98668C;
	Wed, 14 Jun 2023 04:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcH8RPRV+sASeKSO5rvyOnX72GOGDkIWQ8RSWTpj5S73RBO/Q1AfeGZG5blCYv2Ayj1UMGnOWQghRAOl7gizjY3ialH7PXWl+t2z6sEkVlZ/biBAIkwGsLHvzFvd25nSBUMqA5LukvRusALGZAbtb8R6SX3mAlQ/1cllCKcBfkTio2kVoi7+xXlLjnH5bzmMC4hPXFFhgP1p9s+BCE3owHDUiCLaEDzOid99JLNoe16tsL8tpVz3uh5eTE7XTdm01t2CYOPYJs4cyQLjOkwXMyDaMjimwAuGJfon62+2W2PnA9qvZ5AhpkM0Oz4GvRLul/b20bDiiZnwcNKyBx9XRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uasI6msG/h+O8rBYGKOnBjMaD/je16m4N3S20O73Zqk=;
 b=lKhsDkB5pf0fK7LFNktZe/3SEiSUiPtLsG3c18zEZFEYreBf0GvClqx1NYU7aX0s0l2BKz/F/u1gf0sMdM6sHugOcHyYj9h0TOV7tdNdCcP7AixSJUD0T5G8RALvSDs9KtBXd9hPOJy+2SEAriY7eWzw332lDozD1Vn+SbJ7MJEEIQmS+fXl+XD+z+nEng1fQ0gfR00gG0wFuIMZJPSmMJN0IAvxtQrF/+8hGyiHqpVk8zKayYwZabjnz2sk6ZjMjnGyE5QuP056Qwi18xoaXUUa3SOFhTS9IC2GK/I76sYpNBvdQbaXGRCS7VUQy/J//6jxK5CLY5tEqTjdgw2wGw==
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
Date: Wed, 14 Jun 2023 07:22:51 +0300
Message-ID: <20230614042257.1252775-2-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230614042257.1252775-1-parav@nvidia.com>
References: <20230614042257.1252775-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT081:EE_|DM4PR12MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db3ba4f-a7d0-4b5d-2de9-08db6c8f177d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gYqwSPVhsmWmZ4LYDjMbyR17dZHdwixlco4sOWgaNzJ1g54c0soLXLQnxM5Yls+mjk4t7BzyyXl/dLLuI8GaCnfN6fpXeflLRevekdJaFYxAxLgBM5AlHRCEorRVIvyWRlLbTnDqjmObpdf/mSbqa8bfCtWAAISVuvtsx5npfMyi1oAzN3pPjLStQksSCTADA+AhDjYjvjEFt8h9yBStZMPK45FG1/wonUv4XRM4taT5uX3rNLalnWyfKb9jxhuoR9W4eS5AMEKNjImmiEwIj1Eemo3hfz+Gb5Lfcvj0E7wZXjbDCmDUvQBxTr9PaOSGBAdGLm4WqKdJ1KCe/oFzD5NGgLxquhiYyjaTyBGJk8DRuTQc9j89ExfwPCrrrvVNPn00yqYXlcvnWvJxqNi8EoEGNiu5XqBzPuFDdB7AB/1PzMNMl2frJk71dsyeuzUo320q7RfdenGic4L4HM6OjeEuwRNgAazB3gGsGCwCoRMzMAEHHgvrtvyv5Dz9lbFgzTgQSYPBgXiXwL5/OnP3yYn1KDS/X02EMagiX0sEQ3eUzBl4cipwr/H6+RryfWyo57rQCSLgOLAzSQeGHfLxMhHYOBs3R3XI/GKuMkRfMzRGAMYh+XhoUy9I5BliMGIly1QKNn5Y+Cs4mImQ64LNA6c8FJC9b+LA/qhCe3X9OHNbgLuWvHP6ITFCCv1/006oQiWZduT2KS/rzk5+vcqA221BawvWdbSkHojZUaKxRetSvqBYhfAbXaMfFOTYSIEi
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(8676002)(70206006)(5660300002)(70586007)(316002)(54906003)(41300700001)(4326008)(6916009)(8936002)(40480700001)(186003)(478600001)(2906002)(40460700003)(1076003)(356005)(16526019)(82740400003)(86362001)(107886003)(26005)(36756003)(426003)(36860700001)(2616005)(336012)(83380400001)(6666004)(7636003)(47076005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 04:23:23.1228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db3ba4f-a7d0-4b5d-2de9-08db6c8f177d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6494
Subject: [virtio-comment] [PATCH REQUIREMENTS v1 1/7] net-features: Add requirements document for release 1.4

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

