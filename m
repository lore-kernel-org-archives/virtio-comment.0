Return-Path: <virtio-comment-return-7200-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD30C71133
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:37:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 158E171C9C
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE019986686
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D3E4B986561; Fri, 18 Aug 2023 04:36:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0670C98643F;
	Fri, 18 Aug 2023 04:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEMCiusdVa6wnGwKAeK6jHIuypyYIKvETCNL+SsX+FIw39HcLfeoQUYutUCDAPJeqUjZwReFxsoJiCBSAr0XC6W4ZeAMPoLaI5UzGKSGVJveS9FPnqCY1Eu6CmCx+tw55VIuK6IDiy9m5PohBtwM+kE3OyWXLxNR/BsEenHjSFuaxs0789eQqpVjOhkytXuxtWTkp310I4k0P5B+k6iNEGkcsyBYiF74Tja/WOQg64/5udXu+nAN6pcWTNfX7jSZRXX0bFtPOSLdsvjExZWBk6tusJ777UH4KAHt89sVlLjAm7X3TRdPrJ8942RKVp1/SGvkdACLMr1+mwqILmh7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCDz+AWf/5qew/auCYft9Mbq+aAi03k0Kg1idovceuA=;
 b=SKqbc4+4JMc49E7rwqYm65gqrUeaCKXLqU5OZyoPID6QfvhflJM2gkhcrjWqVYyBkYuPqbEFXJvIzkQ0yd0t8pcEjW6GhTDkkChnX62G2Ri3OBhUU2QrSj0cRRLCKMzxPwz2C5NYDGIBYo3n+v8AuqpdmAABcLhjcGBhnUcxVQUTG/CuwfNasNA8T839fHHM/EZGjKJWixE9gjrdgmjue3h3of0orp/AwYNX2DA1qNVq4RUCAdz8uxteJsplc+qUe54EIZ3aGceQ66/GwjKa0L0rKxZ0kgDoj2+EsqzbmzKGtK/8PKwiUlchUlZi1vNyFyU7tAfxgknXTc6M0db9ug==
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
Date: Fri, 18 Aug 2023 07:35:53 +0300
Message-ID: <20230818043557.496964-4-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|PH7PR12MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4cf975-91ad-4412-154d-08db9fa4af3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v2FUlLAjfZcnitj2WELnubfkX874h93Gt4505zjud8JzW8gHGZIJoaHN81hYwyKyikyNMoMKIv+VpjqvXN+D+C909Geyd8ef3wbqynleh+d6neYL/qxAGV4Wpi+uczVOt0Nyky06sdpYsmzLALD1m/dCQBo0wOYSBkiLjEvzE8keYOXxMccpdKPhaxgcbgNMC+vJVGS9sVYdGYS1uyJ+YaaqxBkDEFlGZJrhMxYDJLFCRM8oZFi0L5RP6bey16ykYk5iDnfdNrjdJTBB7OL2D7i+CsKGg9dtiA3jbt0+cYhc3mPiE2j1Y2Bkoz2xNR/f1B5i5gQIuVjrDZXpt8kEUd202ISYwVgH3FewfUgNn4rl2qOypa3jpUsebW6NK0BpYiO5yEECOtIrs5rGyHDuInJPE+WBCPRCfotGH3Lnkc/NlRdZLGV0lpBWBKmSWDvZgkBuZPjNWZBrv7K8j4/kDNw5xE/1+dxILcz1YAJnFy5O9XIcWEmN15jOHaBLRsUXEqFYqmBRBONtTMqmRR49m5tpQw7Id53CzMPiG9U+9Q5pT+BlNOVQJ6aNT7VMwy/Vu58grmkcAb44BzaNYH2Rwt/dFPPK99PwVzc6gkngXuLBgWgKnAp7/Xkm+7qbvG3eYO04prFwk/rLCt64qrayHczW1hnP54qrAogPbQn6yinqiLJw51pI78lT/J4rF8BM
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(82310400011)(1800799009)(186009)(451199024)(46966006)(36840700001)(356005)(508600001)(7636003)(70206006)(86362001)(4326008)(8936002)(8676002)(6666004)(316002)(5660300002)(54906003)(110136005)(336012)(107886003)(1076003)(16526019)(47076005)(26005)(2906002)(36756003)(70586007)(2616005)(83380400001)(426003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 04:36:26.5235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4cf975-91ad-4412-154d-08db9fa4af3a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5855
Subject: [virtio-comment] [PATCH requirements v5 3/7] net-features: Add low latency receive queue requirements

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
index 1167ce2..bc9e971 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -7,7 +7,7 @@ together is desired while updating the virtio net interface.
 
 # 2. Summary
 1. Device counters visible to the driver
-2. Low latency tx virtqueue for PCI transport
+2. Low latency tx and rx virtqueues for PCI transport
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -127,3 +127,46 @@ struct vnet_data_desc desc[2];
 
 9. A flow filter virtqueue also similarly need the ability to inline the short flow
    command header.
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

