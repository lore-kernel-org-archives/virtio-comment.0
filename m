Return-Path: <virtio-comment-return-6079-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D21C7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 23D4842902
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A9C5A986852
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5566F9867F7; Thu,  1 Jun 2023 22:03:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 25D02986816;
	Thu,  1 Jun 2023 22:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GceqAUmP2/SxKAot5/Q3pShx1KDXLpV3zYB8P1i5AYOxxutSxLtVYhHXK3D7zwWE5jWkG2khrq16SRcNmYpLbBgxd8w+mLytDcv27CCaeHiLEaDKPcAFSL4JngBYXIVUc9OFnOV/CdIJmzgG1bfBlRgV5ER4AFpf+H7ur7KHim03kqWDY7v0A5uVwLFetqHFkaP+8+YNgW+xx8aBSl9HCamXHpEdomLMzKVa9WHHAeMirHRp7WBnfp8kUlrrEztCvDI89HAmWvSD6r5jo7oAoi9fUfiP1uDN+hwkWjS2yVtTrU1zCYJpwBeQhO8/R1te1Au1TE5C8iyCKTBFIbWRKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTRA1EN6mUKb8RG5pA1tJZxmwRzgzwNaLpUXVpgsT/0=;
 b=dJE7gd8163/jTNpwKQGxfq9i7mf6A1brYGl27c656a5ZKWOOf0kqoQ7iYIk1njWV0Rc4dkz2fVOlOYBN/qQGfgmJ2GygUfLHS2xv10D/y9ntRIudPTo5oJqPQzvHkQ8adgt+xPaoYEcggxcAr3E8d4uDkX7ll9JvwEVfqi22DXcDlKD6zwFp1RtyRW9X28qMZ6MWB2hNQ/RQwTz5GBq59hYKWMmRNZHGLdPXX84gP1Gh3ZBuDaVg2rSqSet/JjMUMlKKL8RSDUlQ9YYc6P1h4pHV0aTZE0zjxc3uew3qDxhTffgYchspI4fxYwoTYTTRRqDoQ7+7nwi+o7FCd9ADCw==
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
Date: Fri, 2 Jun 2023 01:03:03 +0300
Message-ID: <20230601220305.587034-6-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT027:EE_|CH3PR12MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e10f788-eacf-47fa-3f21-08db62ec0a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hWsqDDQSEyEdspIIMgmPAFEbEgb6XISWk2dDN9zA5YIAPj5qb0Sk54nss7wFCd4kpFoIAn4puDHvWzwbmi7kHBr0P1tsfDUv8vHyfgHkpnFYw39bbOq5QX+VY75B9IK4rwE0o5l7rNLwo8JZGGRIoWQDB7yYEE3r5Xhb/N0Y75wPHti/1slgagdVXXBQcnLL5n09S8Bpc2+QcR0MKX0mTID6lCxQMs7IY2Ctp+EYH6Zakcw9e0No9XLjRO2dKrCFSvN0fJ4++5eYAp93bf8uMmjAxAkVLA2WHDe8rRZUKQPToNtM8LBmlTURKMAPGTJar8P4g1l9eWx8dVYoYW+VNSy8XHIeGDJ5gR9mUqTu5DZvttZzHPufOgDMWwG+HThySIZHnZRd1rpnVQ4EZJtepwXT5p/bIVBpoxrMOmLFysM72ZZVYmUIHRkKJK3RSGuL0pXKI+pKHQVEjX8XIGxm3vdJTzgY0XXe+oxO6O01vyLew651YrwkcxQWgCJG5egOQj1srm4b5iUDzT4+GPI0g5/daSUvgreBu6cf68J+/14qVwQm4dm6Ny6AwD7sOBlXZuMFJ2C2JIy+0sH68es2gBzLGQM5Qrj63z7YeT2QQHbOPHWaA2z/ZDe87VrIb8Jqz3EKMbsT+cQIFrTpqX42jwtpJgvkqpzTGRNck0NwqrohTKisFdZt6PnQ4JtDH5Khc+HS+GpVoh7WIWNmD3xXTXEKYrlFYeExGAVjWlJxQoTOEbWXD8+spPKFUCC0jawUYPEdgd8iDgJ8gKRelXEvJ5pwcQxZRq4QovCLNEtLNgU=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(46966006)(36840700001)(40470700004)(86362001)(8936002)(5660300002)(8676002)(2906002)(6916009)(4326008)(7636003)(356005)(316002)(82310400005)(70586007)(70206006)(82740400003)(450100002)(54906003)(478600001)(41300700001)(6666004)(40460700003)(107886003)(1076003)(2616005)(40480700001)(26005)(47076005)(336012)(426003)(36860700001)(16526019)(36756003)(186003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 22:03:33.1411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e10f788-eacf-47fa-3f21-08db62ec0a94
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7522
Subject: [virtio-comment] [PATCH requirements 5/7] net-features: Add n-tuple receive flow steering requirements

Add virtio net device requirements for receive flow steering.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index fc36f31..41242b4 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -9,6 +9,7 @@ together is desired while updating the virtio net interface.
 1. Device counters visible to the driver
 2. Low latency tx and rx virtqueues for PCI transport
 3. Virtqueue notification coalescing re-arming support
+4. Receive virtqueue n-tuple steering
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -151,3 +152,35 @@ struct vnet_rx_completion {
    coalescing after processing the packets per VQ. This ensures that when
    networking stack decides to poll, no new notifications are generated when
    per VQ notification coalescing is used.
+
+## 3.4 Receive virtqueue n-tuple flow steering (RFS)
+1. The driver should be able to define a receive packet match criteria, an
+   action and a destination for a packet. For example, an ipv4 packet with a
+   multicast address to be steered to the receive vq 0. The second example is
+   ipv4, tcp packet matching a specified IP address and tcp port tuple to
+   steered to receive vq 10.
+2. The match criteria should include exact tuple fields well-defined such as mac
+   address, IP addresses, tcp/udp ports, etc.
+3. The match criteria should also include the field mask.
+4. The match criteria may optionally also include specific packet data offset,
+   length, and matching pattern, which may not be defined in the standard RFC.
+5. Action includes (a) dropping or (b) forwarding the packet.
+6. Destination location is a receive virtqueue index or rss context.
+7. The device should process RFS rules before RSS rules, i.e., when there is a
+   miss on the RFS rule RSS rule applies.
+8. The device should be able to add/remove these rules at a rate of 100K
+   rules/sec.
+9. If multiple rules are programmed which has overlapping attributes for a
+   received packet, the driver to define the location/priority of the rule.
+10. The driver should be able to query flow steering table entries programmed in
+    the device by the flow id.
+11. The driver should be able to add the entry for attributes (a) match
+    criteria, (b) action, (c) destination and (d) assign a unique id of 32 bits.
+12. The driver should be able to delete the steering rule entry via a unique id.
+13. The driver should be able to add and delete the steering rules in out of
+    order manner without depending on previous commands.
+14. A group member device should be able to query the attributes of the flow
+    steering that device supports.
+15. The driver and group owner driver should be able to query supported device
+    limits for the steering entries.
+ 
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

