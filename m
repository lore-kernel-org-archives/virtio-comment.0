Return-Path: <virtio-comment-return-6889-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A190EB64DD
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C04FE42B61
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7545A9866C4
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 38F35986882; Mon, 24 Jul 2023 03:35:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5A6E5986509;
	Mon, 24 Jul 2023 03:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcIqnsRWaP7W/SnXFd5Cf7X4f6NR5hMGx2ocbdtpCdERjGRlSVSA8MF9bBh6Gyur6S/3b0HCMipYDwFl98J7sjLLU/Gn7WNNhuxARoxkK0s2WHwbjER6+ZO8SLBbN9H4/+L3DHetkhP2MWYxzO/0wx5FdEaa49AhFyrCh5BnH2arw0L5NbSezu8Mr0r6tXFNOa+uo2zXi0tR4lNlc/evoAXO0GuvWnhv/fAbim9egkxOOICVmSsAUOnZypoMjtkYd4gCsGcW2KwonQihJmDLokyb2L/VKsWFQiWkjQDvGGLri3FClCnqfpoCM0dhepP5+XgbmIY3Gw4fvgu2cz41eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYjVGbDWAf0W8mEhSPD6/E0O01cEMk1X846w7KjBM5s=;
 b=c1kvdEp1w496N+gJy+OnyBYLkp7fiHJVl6JqgkExQ9+A73KRHePqduIsvZpKs81M4bU6evw08O/eCubBg97ViGfuUsXtKyflMSx6tRHrS/LEWtn2kfgEvyvQ8qWfAQ4bcshKJmlNgRnzZ6V8osdQJS0mU/1urfwTc84k0Vpa3ZocJoYbGrQgVhejd3M91c1Es3x72pUyuZJP854Ap1z/2DRTJQadCyyH2v8DQqoJYnBvU/Zgv4dCy5Ni3jZNQUpwulCV9n9C4vOA4xht8BAU45QKLwnGPRPbQGp2hMtFix0sIwRj2cRhqyAIyPkjLDtZ/VmOv1BHV7n5qYO5i0/lMg==
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
Date: Mon, 24 Jul 2023 06:34:17 +0300
Message-ID: <20230724033421.249893-4-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT043:EE_|SA0PR12MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 8785ce51-2507-4a83-edba-08db8bf6f1e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IECO4FtG8Yie1wyPwUSARHVkSiJ19TS+CzfpGuKIC4GC4QaJdWkmH47g/ws+B3Gd0wiZhFyDf2E3LX46fTHye1w1N9f88YGLq/AubcT1e51GN4LNXygnpqkXcXkkBlYHEu/R1kzI3CNL39JnoU4cRFtM5r2Ili1K0nmjoQ148V71VinvqM/rfO8lqkPIVYrc587DVx9nNeV8CkpTuR8YzNGH4lwdCLXk0FlzC2wYKdm0I41hsvhjaRqdumqMDnKbJzD2/obtWf5Pbz8NtxjjfswHKWXhCn4iU40xhOgVKK2lIRMK1TatWwg/OLyO2fmZQYhQh9IjOhzIci8Dv35QaBsrWKFdx3J0hz0WoeJvSb5eUkF+7FSvnGmcsclYl6cvzTSOwxJhF4BjdUo4LFl43BlY2nke3W4aWF8ke74kysSkGTiRd/kALt4CEwpp3pJrL34B8sYiLUnJ15N5oWy5FZlR66XS7P4Fr9EqhydfyWssxrV9undxP/s0agTkBnMUzzueCH6QtJL6SkdNbuty9Nd850h6sNMOzW7koj96S5ZqVO1xVG+KnmFSaASnvdraiYvB9aeWi17dR9rtMeC4bTKi98zljKLW/LmbpCEe9RyCcHZ9o4rY93k22hDmdo1Y1DkL6pT2XTo8qOSkurYl4f6Vv8eulUroiv7T7XRJqB2cI3dBnYsXQtG3V2r4eb1dY9yXxpVjE3XfMkO9LJ+Zplax038fRShc2Tg+ngQqr1t4MbWeXpT+VoIh55sj33lP
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(40460700003)(2906002)(70206006)(70586007)(6916009)(6666004)(478600001)(54906003)(426003)(83380400001)(86362001)(36756003)(186003)(16526019)(336012)(82740400003)(356005)(2616005)(7636003)(107886003)(26005)(1076003)(36860700001)(47076005)(40480700001)(4326008)(41300700001)(8936002)(8676002)(5660300002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 03:34:53.7291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8785ce51-2507-4a83-edba-08db8bf6f1e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7089
Subject: [virtio-comment] [PATCH requirements 3/7] net-features: Add low latency receive queue requirements

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
index eb95592..e04727a 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -7,7 +7,7 @@ together is desired while updating the virtio net interface.
 
 # 2. Summary
 1. Device counters visible to the driver
-2. Low latency tx virtqueue for PCI transport
+2. Low latency tx and rx virtqueues for PCI transport
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -121,3 +121,46 @@ struct vnet_data_desc desc[2];
 
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

