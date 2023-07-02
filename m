Return-Path: <virtio-comment-return-6672-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564B6EB64DA
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 47C2360348
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 43679986563
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3A1D4986471; Sun,  2 Jul 2023 23:44:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 15CCD986817;
	Sun,  2 Jul 2023 23:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jU848WO9VxP+Yf+Qc8MbDiWQQ/VIMdpUvPoujjrEwIsBFXWuVFEjpAC8g1Ittmqjkv6zg0d5o9gsWPTN/bTthIb2IOIfH94zSqL5Ta06jduOwdPKG/LW09nHR0Roxazcqe9ujHGW6TF4lvw45Kkho6nM9k1KU4gYbUS7UmSVxB+Y4TQuCQX4CesyAGH/+zaJc7eSZyEXAoYN21u4XgM4xTygJgnc8TX5et1KyC3VLAJRRNjy/U51s9jJFxjoAPvQG4VOYbJVZQ7SC/Khy5pRslVrvX/hcYIHKclsewkR33wuBB89tgTF5/H7DEJHiH9KPXDaX+EDbE1h54TVs243dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSZSpuR1IWLksBciyzs5nxjZx/QyP7awRsBRtrByWfs=;
 b=XEHTKiBKSkcPdlxhzj8luw0sm5t/VX6Z35dM7qGJHwOb4ED7k+MGisUdtrgMDn0k8kp8Pk6MD19ktmXT2v2hsUYqPDSrHnH+GCOC/+czT9lTXemS7EYj/WnlEdvci8z6mhdk2bKIBlcPKqe6UpUUonUZb+rlVBMYSHC1mr5w243JepymJlYwAVqH8SybI4WKzbksLzX/DIBo+8aB9qI2JgEVtlODlNq3A8DtBbjW0+JgVy8DjdRphwD+zGOl9BBIJMC9w9bIAKJ3AhhDva8Uq6APkidZvs+sd5kCy5HmYRbAnQK00n8m9hWt7VMX7NTUtWDbtshUDYsEnN0AowsY4A==
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
Date: Mon, 3 Jul 2023 02:44:07 +0300
Message-ID: <20230702234410.47546-5-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230702234410.47546-1-parav@nvidia.com>
References: <20230702234410.47546-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT098:EE_|CH3PR12MB9315:EE_
X-MS-Office365-Filtering-Correlation-Id: 487ceb57-9dcc-4574-6497-08db7b56472e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wBmEWZfIwXdtWxhdMFn80vR8FLB9lZUA1BQDbPrFoS2YkOcMap6JpJBG8PmwiIAvOtX8Gm1ydQEybcP1RaPbQE8raI+XnzcTCiRVR/j2bn492XLLYwDLiI6gKGHpDwQbdkcZ66gQLsp6uHL/uU/V4txEP76lIJoTIrAvWXggMXtsUYLcXY56fgaEErxBHfhifeFygZu+tGxVBLwThNTauC/VK6p9K6U7Wj3Ro/ydxMx0wVAYZZDlmeNYWyl08dgD0Xc396xf15cT9ouyCJU17NNQ6hdN+f+U7Ed7fcw9qPsVMPtIJ2211wsSCMdPyljQ+NTCC3hpo5ZZSg1DCCSFMA+7UqmvtwB55rGp0xnQjTSOU3F69mvrqb4UkeRGTQL4KEkHFNtW8VggtAjHMTFOBWvj7E5sRuVHBQGxeUaA7BO60nwwG2378aw097ngG3hO4COnUvKLoThTL1u6g8k/LA9eeCuKxvRB1jKsWlP9grn1bViI0onfgFY94O1WkLoAIUSsdVDjELZS2PzqjtAi2RrqX7zRT15do0eZvx70iIrNTekB1mxPuR1VUoGUieg7KxKUmMlMbhYQErzCQvEEtcpwFr8RmXbnmzeIjikXkE2UxoNdVXgH8YcuUnn6hqtveUjppIL5mfnLZbzLgOcyqODHQrBslcJhhmhwmCO75qonF1jex57cCJV+nGjvUkPyXOrGuHSBh7I0wgo6YB30uAq8wBiehRplHi2QOcJn6x5K1solQIJZ9H8+j9Nvf4dV
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199021)(36840700001)(40470700004)(46966006)(40460700003)(41300700001)(82310400005)(6666004)(82740400003)(7636003)(356005)(2616005)(107886003)(83380400001)(336012)(426003)(1076003)(26005)(186003)(16526019)(47076005)(36860700001)(40480700001)(54906003)(86362001)(478600001)(316002)(2906002)(36756003)(6916009)(4326008)(70586007)(70206006)(8676002)(8936002)(5660300002)(15650500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2023 23:44:29.3746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 487ceb57-9dcc-4574-6497-08db7b56472e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9315
Subject: [virtio-comment] [PATCH REQUIREMENTS v2 4/7] net-features: Add notification coalescing requirements

Add virtio net device notification coalescing improvements requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v0->v1:
- updated the description
---
 net-workstream/features-1.4.md | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 3e8b5a4..a34556c 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -8,6 +8,7 @@ together is desired while updating the virtio net interface.
 # 2. Summary
 1. Device counters visible to the driver
 2. Low latency tx and rx virtqueues for PCI transport
+3. Virtqueue notification coalescing re-arming support
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -157,3 +158,14 @@ struct vnet_rx_completion {
    which can be recycled by the driver when the packets from the completed
    page is fully consumed.
 8. The device should be able to consume multiple pages for a receive GSO stream.
+
+## 3.3 Virtqueue notification coalescing re-enable support
+0. Design goal:
+   a. Avoid constant notification from the device even in conditions when
+      the driver may not have acted on the previous pending notification.
+1. When Tx and Rx virtqueue notification coalescing is enabled, and when such
+   notification is reported by the device, device should be able to disable
+   further notifications until the driver finish reacting to the already
+   generated notification. 
+2. When the driver enables the notification coalescing reporting, the device
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

