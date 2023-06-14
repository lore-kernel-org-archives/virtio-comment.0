Return-Path: <virtio-comment-return-6348-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AB4EB64D8
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 926B64454E
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8C29A9866D5
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 82F5C9866B3; Wed, 14 Jun 2023 04:23:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 522E59866AB;
	Wed, 14 Jun 2023 04:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oH7NKqn1ZrkRKQK1NwvwLwNjyg6Hw70T/o04Jl+cOHIAf6zKTtOP/m6IwTHrRbzMPmtSFKpTqEgEQdFmhAHfXI6hsFrGs5kXN/PSdT51pWfALizo93AAWSEDXWKD9fQX4pjuhYkcHbDiZOS17j/zr7T0XdHlq4/kFlO52eJfmu3NgrseehzzeDJyeOKCCNWmywYYOVsGwUsg1D6jdB/I780Xa+gsirwunIU+QV6b1CTgrZvvzNhjRufybMsbItOEQuv0RM/aJwIWjIIAfB517wxi5dLP5AcpYdcMuvX3muSJsZKn29CgAQhVBfPf1OZ8xcWUHQPtuqAv8lWZjZ5fCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+lW9D1GLGu1FdrKJMDnEw6GKwzoyBtYBiqXIze74J4=;
 b=NvnbGKqjjRX9yxqQP3gpOkxjd+OOJvzXkkxdNsgRqeHKT6MK58aKYL9mjAztyHKoaPlbZBEbaqqIHXnzTmLBG7+n6gkedkpg/rt7D+36WHXjsEelk3X4R2h+mkWp8fuRJVTJAgmOxi+E4M64y+TD+lzdat2Z/XTkH3JqO8mbkEEa0U3yNPnn7uIH4CRUyhkWzz9mIa0r45/BfPEYfuZC0wmg/jNY166YbwC5mUgy1Igg1U1Ctwh+FlZA1Iba8e8m3RFeAYnd/cA1//5VFbwThr4FMigS66TOKrzVj488qOGA5kRrngXJOW9YFBGiEI2KkMla0STZENHNtc6ZeCyYUw==
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
Date: Wed, 14 Jun 2023 07:22:55 +0300
Message-ID: <20230614042257.1252775-6-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT096:EE_|DS7PR12MB9042:EE_
X-MS-Office365-Filtering-Correlation-Id: 11182dee-394c-4af2-d102-08db6c8f1a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C+olEQmYsKAz8Tm+wy3Ps9jKl4ENvNC40WhbSCOFHKykjoueNV2AlZh6dr3QiEur3ku7cjWEORsKe16yHld+KM/20d05rXsgJqOWD+vRQkygSsfeggt2uHs5r4AdmfWIh5kpLTWriqDWuR3eGZS5tUQffniRMcYoQkz991srPRNtgtpIV/b3CsEYGLKyxuKh1VniDZur8/ok3o5+MN9hHlTfb/nEEszgs84fc+7jqcVxSqJyfcj8X7WWlNxpG6rrSsxY4fSF2zZrgNkS19BElwjjuIxc340y23NylFgyvCqq3+0sUOcAX1vZWnVTzcM8UJiIil+FzKZHpdpH1GnJuaahTHXnf4bnVgOPZMJGJjRwI/Vl5oTZ/Q0oHLg+UdlrQfPcn1UF+ivxEz29rDrZJlVrB2X3V0w1rfxzrtTYPtJMJAwGtaMJ9jaQoQQvcEOJv6wMKUcrrtgZSb5yJKMMsw/s8VY4eSsP0C60bBbZsSHxWdbaQ0HLoomf1W2Fu+YbF38BiVLAOK4tCAyQDi8LYhUTCajcRra/24V/ekbOYNAltL6LJYKASdPaAdF/6EgmSYMnIXKAEfzCWUUhm3mXKxB3boA9WOvd7OLYv1qN4gF611+nJWhMOFIbR/q0GFR8Slk25Bmmi1ofWWClCLhR+AdmoGTvpz4CUae81q3M5gNI1BuaoE0t8ZvoVsho3aoxh3XKlUQc3k1aF5omhgdOCxeuHoNTbU31f7SVbCve3iQtKou+MOOEgBO1Mu3dTLchXIt2QrI6kRfBQpqWZ4YBDg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199021)(36840700001)(40470700004)(46966006)(426003)(47076005)(2616005)(83380400001)(36860700001)(336012)(356005)(82740400003)(7636003)(40480700001)(86362001)(82310400005)(36756003)(40460700003)(478600001)(54906003)(4326008)(6666004)(8936002)(2906002)(8676002)(5660300002)(70206006)(70586007)(41300700001)(6916009)(316002)(186003)(16526019)(107886003)(26005)(1076003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 04:23:27.7907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11182dee-394c-4af2-d102-08db6c8f1a47
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9042
Subject: [virtio-comment] [PATCH REQUIREMENTS v1 5/7] net-features: Add n-tuple receive flow filters requirements

Add virtio net device requirements for receive flow filters.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v0->v1:
- fixed comments from Heng Li
- renamed receive flow steering to receive flow filters
- clarified byte offset in match criteria
---
 net-workstream/features-1.4.md | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index a34556c..fbeb1dd 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -9,6 +9,7 @@ together is desired while updating the virtio net interface.
 1. Device counters visible to the driver
 2. Low latency tx and rx virtqueues for PCI transport
 3. Virtqueue notification coalescing re-arming support
+4  Virtqueue receive flow filters (RFF)
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -169,3 +170,35 @@ struct vnet_rx_completion {
    generated notification. 
 2. When the driver enables the notification coalescing reporting, the device
    to notify again if notification coalescing conditions are met.
+
+## 3.4 Virtqueue receive flow filters (RFF)
+1. The driver should be able to define a receive packet match criteria, an
+   action and a destination for a packet. For example, an ipv4 packet with a
+   multicast address to be steered to the receive vq 0. The second example is
+   ipv4, tcp packet matching a specified IP address and tcp port tuple to
+   steered to receive vq 10.
+2. The match criteria should include exact tuple fields well-defined such as mac
+   address, IP addresses, tcp/udp ports, etc.
+3. The match criteria should also include the field mask.
+4. The match criteria may optionally also include specific packet byte offset,
+   length, and matching pattern, which may not be defined in the standard RFC.
+5. Action includes (a) dropping or (b) forwarding the packet.
+6. Destination location is a receive virtqueue index or rss context.
+7. The device should process RFF rules before RSS rules, i.e., when there is a
+   miss on the RFF rule, RSS rule applies if RSS configuration exists.
+8. The device should be able to add/remove these rules at a rate of 100K
+   rules/sec over a dedicated virtqueue who can complete the flow rule commands
+   in out of order manner.
+9. If multiple rules are programmed which has overlapping attributes for a
+   received packet, the driver to define the location/priority of the rule.
+10. The driver should be able to query flow filter table entries programmed in
+    the device by the flow id.
+11. The driver should be able to add the entry for attributes (a) match
+    criteria, (b) action, (c) destination and (d) assign a unique id of 32 bits.
+12. The driver should be able to delete the flow filter rule entry via a unique id.
+13. The driver should be able to add and delete the flow filter rules in out of
+    order manner without depending on previous rules.
+14. A group member device should be able to query the attributes of the flow
+    filter rules that device supports.
+15. The driver and group owner driver should be able to query supported device
+    limits for the flow rule entries.
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

