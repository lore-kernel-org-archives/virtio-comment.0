Return-Path: <virtio-comment-return-6080-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8DBC7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7F51444346
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4AB5A986814
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 22:03:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 29A48986823; Thu,  1 Jun 2023 22:03:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E75A986812;
	Thu,  1 Jun 2023 22:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAnOvdv8+mPzhnxRBSCSIzT7AJOHQVOexvtrLX8Uw4LqtsrlxYJs/bDPe/8hUxSFlqqQ1xy0weh9hjmJxkZ4gElw528qlIVi+KUy/hBcHs8JO2Rtqi0eeDzRX5kwtD8JBAejYPOtvwH3JSk+RQUY1YS1bWRtwAIauQNzfRmbXeMfjYZ8PhVejddPqylgh5sUyVYKYeqaVdgcxVbxc+s1a5VLlYyt54NHLsUx2nknClz8wCnDxKtrHSPt5xdDetxSHIt/PAlwbS6/a98aJ0aC3KKa1GiWKVik5m+aYnCgbtvINtms8xS4CEDNkRB4qSphNwyZd7W9M8LKuuRx66FxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=be5uuALi4mD4aUdwyVKx4eyuxJo6MY4K/SF8iCqLraI=;
 b=mHYfLk9SGN7EYHtWnwh4jGLV8bVvgjWf2dKvgst3xUNuPijuiN/0lMqP52WequAmGwtdgkiV0JKBn5ISv83/hR9EjHuvMp6t+r4TIHxhi19EvOSI76OWd+CyCxnP+84bhkPVAXMKvaQNzoMmMhwqhZm6tZ3bsyXPixlITn4s91VRq2A3VUreYR0a7KfjYpWINaVgRPlqJlA10L5nsLguJXgXevf50wSJHR/v1DyIlweFGWD75yIBtQLV5qzxYK8IndEKYvVfRjRYPFVcojM3nO8crRIFOPG7k5uRzZpZEspJLIdUcKdE2vRVVWchSv+q0RxpN21+e1wnbXZFuN8BIg==
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
Date: Fri, 2 Jun 2023 01:03:04 +0300
Message-ID: <20230601220305.587034-7-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|CH0PR12MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: ca6e53e8-02d2-4944-e5ab-08db62ec0b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GIbJSyQRW4LxqJuFTBWtBJSCtgCuBSUEe2QcEiayNrUge0J2VOWYpbveM0jENCtFYzQA5auCI3oPoIbVfxA6GN6NR9MxPCwMTZP7RhGNtioIJs4USzmQL8uZb2YxLYgbVN6xFK7vyLBZkcEIIWw5v2x9vidvZ2XlE6gyveWilSEU6Nr6LJVcbNevXVXL/auOJqG0BeMdsWsW18yM71dEoWlnXdDoZHFwC99Ri7B+EkAFbQxeDv3oz0iGISZ021THBmi+h+D1sBiSAh5t2WxmyGpjAChsqQZp9NgXrUjFFiOZI+audjs0BK2SCOXyCAKxemKChKm7QFR+uhXzLLmgOPj6ivtr2SL4Rlz9djG2w5CsBf4LHwjMTW15g2epqw2of+kpjWlwPjnFWYECWYM8++H98mxHqgM2MohhPFCRuuzOdldx6h/ACoaz4dPsPO4uIuIQUwfi6ZMlgrB3t48qfypI+5nkUv3BVXCjA0YliJ9t4zi06ITxj/Eg3161Ce/8oE924dCNrmayAYELI0wJ8QJjJwm1XAEaKkAb1oZhXnUk97mEThiMuY/jantgI0fbtwh2ITqRZKKcAyHypS5Y64mLBgfSrwcLxIpgtm1XnI59rQyr6wG4tlYo2zEIp5wbXyf7FSPO2Uq1rDTaxD1aJRXhkUAav/V5o6gUKm/eYDdZn4EaDWwQ3BUSeaRsRdbw2AzOGrXBItv39j33hwTWIUmg4J6eTpq0VAF2bveOC0s=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199021)(40470700004)(36840700001)(46966006)(82740400003)(7636003)(36756003)(70586007)(47076005)(70206006)(316002)(4326008)(478600001)(450100002)(54906003)(6916009)(86362001)(83380400001)(40480700001)(5660300002)(41300700001)(8676002)(6666004)(2906002)(356005)(2616005)(36860700001)(82310400005)(426003)(186003)(26005)(336012)(1076003)(107886003)(16526019)(8936002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 22:03:34.0891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6e53e8-02d2-4944-e5ab-08db62ec0b24
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5139
Subject: [virtio-comment] [PATCH requirements 6/7] net-features: Add packet timestamp requirements

Add tx and rx packet timestamp requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 41242b4..f94848e 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -10,6 +10,7 @@ together is desired while updating the virtio net interface.
 2. Low latency tx and rx virtqueues for PCI transport
 3. Virtqueue notification coalescing re-arming support
 4. Receive virtqueue n-tuple steering
+5. Device timestamp for tx and rx packets
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -184,3 +185,27 @@ struct vnet_rx_completion {
 15. The driver and group owner driver should be able to query supported device
     limits for the steering entries.
  
+## 3.5 Packet timestamp
+1. Device should provide transmit timestamp and receive timestamp of the packets
+   at per packet level when the device is enabled.
+2. Device should provide the current free running clock in the least latency
+   possible using an MMIO register read of 64-bit to have the least jitter.
+3. Device should provide the current frequency and the frequency unit for the
+   software to synchronize the reference point of software and the device using
+   a control vq command.
+
+### 3.5.1 Transmit timestamp
+1. Transmit completion must contain a packet transmission timestamp when the
+   device is enabled for it.
+2. The device should record the packet transmit timestamp in the completion at
+   the farthest egress point towards the network.
+3. The device must provide a transmit packet timestamp in a single DMA
+   transaction along with the rest of the transmit completion fields.
+
+### 3.5.2 Receive timestamp
+1. Receive completion must contain a packet reception timestamp when the device
+   is enabled for it.
+2. The device should record the received packet timestamp at the closet ingress
+   point of reception from the network.
+3. The device should provide a receive packet timestamp in a single DMA
+   transaction along with the rest of the receive completion fields.
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

