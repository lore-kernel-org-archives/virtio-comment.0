Return-Path: <virtio-comment-return-6078-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC654C7EE29
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 47F443711A
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 120D898682C
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EE98D98682A; Thu,  1 Jun 2023 22:03:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1C6369867FF;
	Thu,  1 Jun 2023 22:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bytEVBGmI16RsiL7sjuzOcLM8XOdYuakBTeNxWTVu2+GBzy+cA0gOWUzucTGyzAugCQp2WsAgDRL8xhLl3qHNuzVzkKSO1nrdAH9BcwXNSr9OJkAAA1RFIhqo5LCDtO65Xf1UFnOcGTReH+ItATFxzRQ9OoChDxN78NbwVhSGrgbeQkSvRox7iI2ExTrRH+IP60V+wPmvZey3uYlv0Kb51VfdB2ZW1Xbs9aErNWxPDKE00dj6NibCIqWFHWRDMtoXe/76KB9IImjQJXFZWiAeF7V04JYhSZDqKYxb8fq1K/TfiS0/xL7wOmiO0GcoC82b7av1O+Lo9ijSk93qQwYrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDSvLkNLvXAHYIUbt/6icLkkIuU/JJtwNs9cSzDJ9NU=;
 b=C6Cn6Rj1S2sO7FUEGPa2JljutBYCgCeQgOn8zyplfo03f77j+fKJDdKbbY9Y/ezlqD3vGGBCC+8bEH0pnRwrr8pmtYc8bAr9qFGErQVqrv/HadnIxjf1njMgiINqewssJeLjooTHT34RQ0/0L79FYl59bOuImSGflrq0bnoOblDQOr+4jKN5KL29mRoX1K47T/5QEPywK4+R1AC5Hn0p5f48eE1GtgtxqxWM86FrAv/BRnpZj5rxymYyeCidSv/3WcwmDOEOoFsyJNMpld/x5X/sEuQb9d5BbNqWK5U2Dsr5VYkJQ+lyRprws/aQuh9NEXVxxiOjRu2KZLskBIYX7Q==
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
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Fri, 2 Jun 2023 01:03:01 +0300
Message-ID: <20230601220305.587034-4-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT060:EE_|SJ0PR12MB5502:EE_
X-MS-Office365-Filtering-Correlation-Id: 5797de6e-caee-4f6e-d476-08db62ec08ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4x1zdU0AQYmrJgTj/of9vRfzsRxLwqS0IikhIOjXZOJRSp7D0BkjOmR08JBjc6iZY6VwM7fbDb5RBu6zbZmrIzsIuXNLjL8V7wUoVa0hwFoyPlpMZwv+yOVUH3f4UrGdsuK3tH9m9WbYpUGitAJsfsR3gti4n/WMhG5nQogCdhGfkJ9oByaOiOE0BMbPx1M9+OTfH6aMzZRmMcM1sdpjMAM3FTGnyQeUyBTg0JuwB/IZBjw6p/fTYPzwkJ9uh4obFpselbT/Qwdcn4SQIUn+mHZb3TxxHLQUCNSjn1JHTmie3nhST+IJI2s8Y4he1ekT0DU9V8V3T05b9WSfnVU9/X53o88eUoqQ2j/yhE39LwpzzH8s1ut2zt2RhKF2BE0hg5W7J5VkwWE9bJ2XQ/lWSZj7sZr9b6617ZHNyk+6nWjz1Woy6ZVbw+5pxwTzkLL+DrRgzOE1iMIqmwMV+328Yv+UgZedq8aW98V38YvoqFs70yJJtUVFDJrn7NedWZ9DLjti+L6TvyTekOGUXNBK1ZPiE0bez+I49KmQTxsA4vW1eCQsWj6M6PArGavSS0ypOWbsNPaEmhbGjVrhzjxnyCnpHbAmbmf5IWvEwN3FFEVLiQ+c5oiMrWA89wxU9Xt/7sjIPmjUOPTNXu4BfEcQP2A6yHbRS/c6Skj+xGqa8oubFYiHUniD9+Hv6UnTzdRLQ6unPPdCQa/MCJ/BJ6yBtG8g9kwlgG/RaX2+SqZBYhjWLeyJz/oi3ABzdD71j/ns
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(4326008)(450100002)(70206006)(6916009)(70586007)(8676002)(316002)(41300700001)(5660300002)(2906002)(8936002)(54906003)(36860700001)(82740400003)(40460700003)(6666004)(478600001)(356005)(7636003)(40480700001)(107886003)(186003)(47076005)(336012)(83380400001)(16526019)(426003)(1076003)(36756003)(2616005)(26005)(82310400005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 22:03:30.2699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5797de6e-caee-4f6e-d476-08db62ec08ee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5502
Subject: [virtio-comment] [PATCH requirements 3/7] net-features: Add low latency receive queue requirements

Add requirements for the low latency receive queue.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 38 +++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 55f1b1f..054f951 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -7,7 +7,7 @@ together is desired while updating the virtio net interface.
 
 # 2. Summary
 1. Device counters visible to the driver
-2. Low latency tx virtqueue for PCI transport
+2. Low latency tx and rx virtqueues for PCI transport
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -107,3 +107,39 @@ struct vnet_data_desc desc[2];
 
 7. Ability to place all transmit completion together with it per packet stream
    transmit timestamp using single PCIe transcation.
+
+### 3.2.2 Low latency rx virtqueue
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

