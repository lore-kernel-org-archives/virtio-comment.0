Return-Path: <virtio-comment-return-6344-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FD7EB64DA
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 429011CA24D
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A5CA9866C4
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 31C7798669B; Wed, 14 Jun 2023 04:23:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 216C19866AC;
	Wed, 14 Jun 2023 04:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNlD1KGIjtNbFoUEE9XLmwzwhjQFXRCobuf5EUvPNPGCo4zUvJOV/F0/UxaKkY8wguZBtKZ4cbKDy3+ubxKA9SadKnBO6Kq8C9CZ8QyrkxqZiUTx3YRqkA6H7vOkyNVW7m2CaFtspGFnDhlilGD2LjXAfd0qz1aZw8x8aMvamN4fMIuXJl1awCESk/IiM1st/Ais1FDEdjL57VXtfZp1jY2WZ5uPpEOM7Dy+8fR9MAqglq3I70iUY+71i2ckDO4piJKEWU69xi5O0n94o/ah/G48SSgF/CFwWB1PM0y0XepDFrWJEw/Jk1NuqvGQfyjaL/lIKsQOy3gSeQ7twmJzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge0yH959AOHRRoxlDIUykx3oj3YHQWnTCYogww28UwM=;
 b=lCSaAPO1mf8drM39sV/0OfySOnZDtN8lOEWKFNCUKxkGkv+5RH5dbJvcIe2XfDwZTJlpxFQPjQtA9eOsr1vxPN8ctx7ivt+I+pZ9Bf9W8NzauO/8yzbHuXP2srFZ21KgbzkqfWHWaaWx9KuR5oH8LziteBVMkkG4PyII67FtPYKSl1qq8EuULoHaM7+U4GNgoSQuA54m8WkZWNZh3gfpm+Isx/fGy7OyPXHt1Ac/wwGO0v11s+Y13+4y7pzxBUJ8h5xbQTIVtCMjas7eemJdrseteXwJ3/ULka2MHuFQ8bVD/LkbZz+/WI7uFCQXLNQzk/RW4D1w6Nr0/H1WvSKW0A==
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
Date: Wed, 14 Jun 2023 07:22:53 +0300
Message-ID: <20230614042257.1252775-4-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|DM6PR12MB4880:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c3b5d7-fd29-40d4-c752-08db6c8f1812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	El4C2vo/uk+GYmxw97CM3qSk9hfJR6NXmgA9iZd2amLkGaySmianGMl7pmZxLRWpbtwexWaU+wulSjIA6T7yyL9DICrFvzqCkYMHZV5VZ4zGMGv76EIqurf6yX2ZNNF5HYEyAc5w8tYLQyJb3Gn24QCl24EHfoMc3jYDY+oZ8GnJo4jpvf6J9fe1xEFECxVHHcY3FSq6oylM0I5nt7uzMMok32ienz6DKb6TA8Ydpiu+EGriKMVgys6H9BXnAdM7kydtG9osrfweKkM+VjMHLt+M5GQ7KH0aYwAqpsGJDS3thXYhIRH63GOr6Dnqu9Arb11FnGRo5aqNeKuVpLH4b2nueuYxPueBwNMZH57QmmXaA9BLm84p0dg7kQFNrwYAqFORi+4rwoqpaOYSlodewevno/nuonACAEOep9k1to3lSKjNUfw/qoDVR6GNXXlU8VUmCSo/kBvdNxojFUoeEC5U+Xn+3nIUKC62IalgAsybNCib5j3c8AEczhhj5Iep94Egb6cAuA6xOL3RK0fWuxjWmlJumwxceMwUsHhQa8GuVbV321mKoDxB6pIuMgfpKSkiFbqQHiSzFNgncmIrWTpC7jPDKO7vIYj50Rv8e6FLKq34tqD76JpRTw/Zq/SHoIJ8o5E47+4OSVh37DcDdapTM9j39BhOd3Lr1KoJubQB1QEghqGvhTtJlIeqrscVhpH4RhhH0VaGUWD/tGlRT1dPtvPQVElR0PLaZnayU+6lSw01+ajKUUBO+6BWeSuz
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(82310400005)(36860700001)(40480700001)(83380400001)(47076005)(336012)(426003)(40460700003)(7636003)(82740400003)(4326008)(36756003)(316002)(356005)(41300700001)(1076003)(478600001)(6666004)(107886003)(6916009)(70206006)(26005)(70586007)(2906002)(5660300002)(8936002)(8676002)(186003)(16526019)(54906003)(2616005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 04:23:24.1657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c3b5d7-fd29-40d4-c752-08db6c8f1812
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4880
Subject: [virtio-comment] [PATCH REQUIREMENTS v1 3/7] net-features: Add low latency receive queue requirements

Add requirements for the low latency receive queue.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v0->v1:
- clarified the requirements further
- added line for the gro case
- added design goals as the motivation for the requirements
---
 net-workstream/features-1.4.md | 45 +++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 0c3202c..3e8b5a4 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -7,7 +7,7 @@ together is desired while updating the virtio net interface.
 
 # 2. Summary
 1. Device counters visible to the driver
-2. Low latency tx virtqueue for PCI transport
+2. Low latency tx and rx virtqueues for PCI transport
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -114,3 +114,46 @@ struct vnet_data_desc desc[2];
 
 7. Ability to place all transmit completion together with it per packet stream
    transmit timestamp using single PCIe transcation.
+
+### 3.2.2 Low latency rx virtqueue
+0. Design goal:
+   a. Keep packet metadata and buffer data together which is consumed by driver
+      layer and make it available in a single cache line of cpu
+   b. Instead of having per packet descriptors which is complex to scale for
+      the device, supply the page directly to the device to consume it based
+      on packet size
+1. The device should be able to write a packet receive completion that consists
+   of struct virtio_net_hdr (or similar) and a buffer id using a single DMA write
+   PCIe TLP.
+2. The device should be able to perform DMA writes of multiple packets
+   completions in a single DMA transaction up to the PCIe maximum write limit
+   in a transaction.
+3. The device should be able to zero pad packet write completion to align it to
+   64B or CPU cache line size whenever possible.
+4. An example of the above DMA completion structure:
+
+```
+/* Constant size receive packet completion */
+struct vnet_rx_completion {
+   u16 flags;
+   u16 id; /* buffer id */
+   u8 gso_type;
+   u8 reserved[3];
+   le16 gso_hdr_len;
+   le16 gso_size;
+   le16 csum_start;
+   le16 csum_offset;
+   u16 reserved2;
+   u64 timestamp; /* explained later */
+   u8 padding[];
+};
+```
+5. The driver should be able to post constant-size buffer pages on a receive
+   queue which can be consumed by the device for an incoming packet of any size
+   from 64B to 9K bytes.
+6. The device should be able to know the constant buffer size at receive
+   virtqueue level instead of per buffer level.
+7. The device should be able to indicate when a full page buffer is consumed,
+   which can be recycled by the driver when the packets from the completed
+   page is fully consumed.
+8. The device should be able to consume multiple pages for a receive GSO stream.
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

