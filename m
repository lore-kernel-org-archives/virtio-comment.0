Return-Path: <virtio-comment-return-6891-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDBCC0015E
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:36:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7F31A75351
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7494A986549
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6BB9C986429; Mon, 24 Jul 2023 03:35:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C55759864BC;
	Mon, 24 Jul 2023 03:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSF9KqZ8RyHaxZMqcTW5HOw6oJFgyg4LI06fyu0WU2gHV3/Hkn4dkG0uF5no6D7F3ECGTeKZGKd8caZK/hYc/cVChlZJuI+G/UH1A6L0AdPFuKrMEcNwltw4dlbeUTkqAJejRcWcXnYbuZKHtYLtVGOJxMkwwJCnSggCjNHO5BIXq783QklJ82cixRZenkzsVjN2iplT+u8lukppuV5odV8c8U649aAtfZjT0h3R/rX94tlCgyQki22fWRzDI+TJl6zg3elYDmyojNpaHObpz6W4urmd7TD4stk1iYhpZCXbAw/3Qto0qKtJMlDPY9kYXY29Lzn9msQ4b92+JVmEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=em7Mfw/IDlOXR3nZDuOKAv2+X32bq7r+b95r7djoCBc=;
 b=P1FFLgnxfP7u2QXTXqc4/RaAkXB5ARUxgpXYr4V3Q/P6PhlTRJQdvsg0yMNnKjFfPtDChh4zoa3BfOUNrVFbXCaGgqHMB/LHwCAdi+/8VOSvp3/5CYcMZ5o7hk/l7tVnnc0ZovPGRdTGoRIP6WjQr5mTUe9X9zenuUz7a+FvBLjG9SO5oehAa6frBWYw/bHKjmlUcr1mv1lrOplHqN+XZ7B+DqrfNS+nhwj++0p1DxjQwPOiHpG6CWPkQrHq4tal/TVKNMV/uzRuKEhIOqIXQdXAxGkhA+tBebnOgbZuDTGmVnTXKo74AFWnAzFX4QxKPqPNS5DjKoIfe6RbI+uq4w==
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
Date: Mon, 24 Jul 2023 06:34:18 +0300
Message-ID: <20230724033421.249893-5-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT098:EE_|DS7PR12MB6264:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f07135b-679c-45d0-fb79-08db8bf6f22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+r8pVIhIfdEnw1q2MGTQS28kBa+ZC51slE+gguzQnq8aR0+iAw/NE78MeRrxApxKGz0YwQkNadRUSRpsYB6LlYgUUZOtvJmAcGeg542TzTZ0Qcq4m3QpTTvvxGGFh6sOL7J6sqbNQhUAimMSY7c213pvSwXm6CRUm40+RF023nMstOPmYUxhqWs3g0mJ0G8OgzQ+FHqAokLRQn/NM6Owj86QcCGzqroERTGNKpMjkm+JsPcseLTu0QQK8rM+cGkUgc2s8oLN2If8YngO4PhfsGZnnEQ60E/rjHagCT6qq0GIWitMnS15Zq1YvwUldXfj+l+EOSJUg8mRDqwK4t4bwF2dhXo3bw61TQgfLP7vYvVuynmywUhnq7N8o0EM7b7lE7XiooFDLUSBLpRmkPcTJswhz+p24XciBE3MQ2kv35JbBnOdbGr2kQ1Ciek6oLxzWwiKvplFKOJrq8LmzEZqC5fRlKNjiXcita3XE5D8JjdMllO21MDqiIv0d5NGcqW3KgeVFBrQsGRM9cWirC53VnbYY1eZf0E9x4vuhjTTxCHoAW+1Ij2+ncAlz5yw7Cl5R2n6q2gY71gw6pufzDStNo2megIHggvs6VFnUohDdRW5D7WY2KimSzikVHIG/zsb1NpaRXiS0ZbYQNX6Jqm/c79eV9txkz2YlBdvD1TugtmSTwuPxcDYp2A3H4WCji4JW/WVhuoL7S0n6o4KAdjm6Cq14Wj8/3wXbckbS8XcY3L1AzkNKf6d61ddMyLPUNPS
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(40460700003)(2906002)(70586007)(70206006)(4326008)(6916009)(6666004)(478600001)(86362001)(83380400001)(426003)(54906003)(36756003)(336012)(16526019)(186003)(356005)(7636003)(82740400003)(2616005)(107886003)(1076003)(26005)(36860700001)(40480700001)(47076005)(5660300002)(15650500001)(8936002)(8676002)(41300700001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 03:34:54.2275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f07135b-679c-45d0-fb79-08db8bf6f22c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6264
Subject: [virtio-comment] [PATCH requirements 4/7] net-features: Add notification coalescing requirements

Add virtio net device notification coalescing improvements requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v1->v2:
- addressed comments from Stefan
- redrafted the requirements to use rearm term and avoid queue enable
  confusion
v0->v1:
- updated the description
---
 net-workstream/features-1.4.md | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index e04727a..27a7886 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -8,6 +8,7 @@ together is desired while updating the virtio net interface.
 # 2. Summary
 1. Device counters visible to the driver
 2. Low latency tx and rx virtqueues for PCI transport
+3. Virtqueue notification coalescing re-arming support
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -164,3 +165,13 @@ struct vnet_rx_completion {
    which can be recycled by the driver when the packets from the completed
    page is fully consumed.
 8. The device should be able to consume multiple pages for a receive GSO stream.
+
+## 3.3 Virtqueue notification coalescing re-arming support
+0. Design goal:
+   a. Avoid constant notifications from the device even in conditions when
+      the driver may not have acted on the previous pending notification.
+1. When Tx and Rx virtqueue notification coalescing is enabled, and when such
+   a notification is reported by the device, the device stops sending further
+   notifications until the driver rearms the notifications of the virtqueue.
+2. When the driver rearms the notification of the virtqueue, the device
+   to notify again if notification coalescing conditions are met.
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

