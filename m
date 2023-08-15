Return-Path: <virtio-comment-return-7132-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB86C0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9B6E2157F15
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8AE62986637
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7C714984035; Tue, 15 Aug 2023 07:46:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A6E998643F;
	Tue, 15 Aug 2023 07:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qo6oVqwCufCnsEGtqrtMlu2CvIpjjz6TujsQbBwOR4Q7pQWThrNmtsu4QggUmZDSPULxz1PPrE14tXhb78JctK2+aeXQSMtTlcttv6e5B00Ba7hWLK4EAq6Yt+iK/bMFHa3F9i8fdCdSastvY0wW92f9CDDRYC/PJtseCgZjqqZZ3YNoFCK+6X5FFLKicWYsoKfkzC8MOnulLRgD5C8H1bKW990pgeVohMCh06/Xz6saCVdoa19ogA1BuXWLI60Pw1SBYAlfFMTG9mCVRs+1p3Irgq0tpnfn/Lspr5exrSkybL+UJiCCk4deLvO9TJkK9tS7Uo9Oh7kKwIsPTcwk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pLUZVSknJVTKt/qb8TYkBfKEMg77t0M1vo2UcJjxHY=;
 b=BT9gtdJElFePiX1gZRHABX32yJw2bd79URSaLmiFDHyeWRbMyhenq2i+TVAG6yVRiw3xzgEzyWNrS+T7NjlF/rggOJAnmBhAYL+KDtNgXVwO4smxEGvoi7/sXY77SZS86OI8hxUAl2QflgFBWAczsskQ9/PEOgmeO5/KwqUTeQXqAoQfnhQWs3tAqeiMRNiWKWv8cSFY+pxBVOP6jZp1pwWC+FtYabIVCKdxxJ3lSZJ1QfNj5hc5csS1lU4cunXkW7ia6L28d0JRvNxNa9jrFb6AWplaewaSkaO3fEx9aI20fwRJZVdzJkW5+Y7Ye9DyLZmY1SiYc1zfvmIbcNlrAA==
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
To: <virtio-comment@lists.oasis-open.org>, <hengqi@linux.alibaba.com>,
	<david.edmondson@oracle.com>, <xuanzhuo@linux.alibaba.com>,
	<sburla@marvell.com>
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Tue, 15 Aug 2023 10:46:00 +0300
Message-ID: <20230815074600.473933-8-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|DS0PR12MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: 548c25c7-5ae7-4e92-defc-08db9d63c0f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1ZSVi1j4FYwB2zTIqJTvSpV0T4h7DzlE8CSX0gzGwggicOrKayDIm8yJSOUj/ox7ItNI3HOekaEeLZRj2X9Z/g6LV2LRONHkTAvVbGu4sxDYkSqvXy09nRqFNrjd/inDqhP+m8r/eC2G5DK4jgDxb06QIn09UhmvivBcPof/+h3ab5ILnE/1u1qIi8LzFVFmu8GUxxY3D25N4VM27pF4bQt7B66fZZ6Qu5s5TuWMUPFkGkwP0dsYwR+LFX5+DbggJ9LVYZRVEbD6ojZ6j58nYCVdz81R/SmYK6D9zo2p9I/KP6Sn7xt7oBS/kVOCNsGy6nqECfYQvBv+JfslUzQGOlK19ONQFueUrgloVSK6LaUymU/QYfTutQPGIchp6oo0VO7SfPq5E/PDtASMpIdl9+hNjZw7dW9PBdR06GYhZwJihUILRf+Bl1XcrQk5lv7tRIkTcDk6xJvHQJuq/hK+1reffUm9WOgRJ7goTFNZaH5iJ1j3DpEQ/UqRLScTfPBkv+Ed8TvXjEL/cBD3j21sLy/GEvlEJjvFtnpkC/8SUu6TMave7qxwE9bWoMTtLXVqRzeTwiDTAoVEz63jcI2QIUexzPZ1PBD+z8CijsjNMMxozUs8/cV7HVqtSK5v5BLEGLxkMclgurJ0SSqSV4FrgancJNGD4NmeCraSsncMIT5SJu60I8XLWF2dLPEdqwgpBWNl1yPrNUYeIcMcZbOhBlRtSs0/h5GxxN4QVhkrRjw7JEctuHMriEE+849+VJDc
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199021)(82310400008)(186006)(1800799006)(40470700004)(36840700001)(46966006)(40460700003)(26005)(1076003)(107886003)(16526019)(336012)(36860700001)(2616005)(6666004)(426003)(83380400001)(47076005)(5660300002)(8676002)(8936002)(2906002)(110136005)(54906003)(478600001)(316002)(41300700001)(70206006)(70586007)(4326008)(86362001)(40480700001)(36756003)(82740400003)(356005)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 07:46:36.6453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 548c25c7-5ae7-4e92-defc-08db9d63c0f0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7828
Subject: [virtio-comment] [PATCH requirements v4 7/7] net-features: Add header data split requirements

Add header data split requirements for the receive packets.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 82b907a..5e359b6 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -11,6 +11,7 @@ together is desired while updating the virtio net interface.
 3. Virtqueue notification coalescing re-arming support
 4  Virtqueue receive flow filters (RFF)
 5. Device timestamp for tx and rx packets
+6. Header data split for the receive virtqueue
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -360,3 +361,15 @@ c. If/when virtio switch object is implemented, support ingress/egress flow
    point of reception from the network.
 3. The device should provide a receive packet timestamp in a single DMA
    transaction along with the rest of the receive completion fields.
+
+## 3.6 Header data split for the receive virtqueue
+1. The device should be able to DMA the packet header and data to two different
+   memory locations, this enables driver and networking stack to perform zero
+   copy to application buffer(s).
+2. The driver should be able to configure maximum header buffer size per
+   virtqueue.
+3. The header buffer to be in a physically contiguous memory per virtqueue
+4. The device should be able to indicate header data split in the receive
+   completion.
+5. The device should be able to zero pad the header buffer when the received
+   header is shorter than cpu cache line size.
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

