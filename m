Return-Path: <virtio-comment-return-6349-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5537EEB64D8
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:24:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9E09160344
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:24:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 968199866B2
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:24:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8E30998668E; Wed, 14 Jun 2023 04:24:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A99AF986843;
	Wed, 14 Jun 2023 04:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8eE7eR3Oeiw0r1VQ2DDsJkyrIVbPVirY1uoIWBJO6+07zBY51pqbEypttzoYShWcPgD2q5WOxCoxfkd8ZJqw1lqpqliDcsqHR77JH4SzblvI/o3ynsA4lWJTdjMsR3goOZa7jmbR5T5S7wjSvWrlrn9qUXvnbJE5E0oZlNA5xX/nL/+S1i2mOCIJBIzpIRE3qNZhkgLRG3yAebFJo0fyR4he0biz5o68dsfkiBFCBJ7ur+kofIF9uBV2dFP0X6DhLNvUlkWwANRzz/+/OxzA5WsP/iXG8rOBUYG1Vo6xXxMXwWCYW80wcsVhJxDM/Z80V21b01k+vBNItsfC+nSnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPRMHrSwgLvtRipqK6dYDj16mMQJ7XTfVq7MA2zaJNE=;
 b=S8YOPYSRtPuKMeb2Xl0aQDXRCUDJkjRY0jrM2mwpPzI4thciwZu8gj8FtlWUpJuA2ebg/qbcj8D9+KCJmY+Mz1t3Ip4u0lLRUoCC0FFSjK883oPppIkGsB5k3m5TS34j/JEE7pPuedd+/EAMNLAmsKU/XaYBFS60F4mepFGInP68bYnHcFxm9RuCLk9ZK2PCLhP6S7snGpR0Sdk22XBQYzp1mU5PaMctenD9DSyA/XLBXdsyqk3MRAZ0DSi41Gvq/9hsmE4C6vmswelnyzVvHN/F3ohIr/DuWOFLW/Gll6tSiruXnJ+lCRmlpP1mxTF+tJquKBCGOFcr/nSf9LlDwA==
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
Date: Wed, 14 Jun 2023 07:22:57 +0300
Message-ID: <20230614042257.1252775-8-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|SA1PR12MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b157730-3c23-4602-209d-08db6c8f1c03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bceuKMOzKjvbNfStMi4N8Z1ltZrU7Xm/5ZJmthuvd6zW0MaOaXN/296lSmF0ijgu6Xk19DKFpend76A91NZORQpdYY3pmMPyPUZJVbMC7eXbIDlisYDUwPwgw6DJw784WvAuRsPUaVc0g2X/rtRUNbUUSMJ1RP8s0PW10Vl1n7D2FFbdsZGYo7JORJPlrDp2gBEpU6pWiUKG6PMbsbAiwBIp/SrKc2MqGYWnzN0YIWGsMztlKOO/jhwmxCE1jQHaBbwv8/wHLpj/icf6varB9J0s3mNBJNDQwKSEsaXb4Q4y3EkZUy6fAFFhF5uHgYqhrlDG6jMf3J+4lJP9zBGKvganNmo3jPFuoo0NC7i1qm981Z4B356klSAgz8njPpW74KBJeaMQ4/MrLnevgiaNTYtmV+fR4PnM/c765thFmEECtjBmZ2Xs54reBulbI+jouXIIkXQsMukM4IPQJoRpqJ2UVd4DfzVmRDBSlK0DGjQWMrN2w/0gScQJDH5XhKShKL+TNFJIDsNpWeC3pmyScpa/9OObqlCXvYNchzZQ+oJSplyW4hE/sn8I61lm9SZw4BsPXxjlFdXbuwuf22W07+5Qw+8b4ljh1I7yTea6mGLiK8NQ1rt5l9J5yTVDLpOON+s67qJX3HjV6gp/e17p91EjwubrQPb8FpzTMl1/hIHzXeWCVl+2TIwayyKosQHQ7R5f06p0puMk91TZAlCXV3BJxsz6U+WxvlB/DElwsgA5GGyHsopzHKh3GsQFcWVq
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(107886003)(1076003)(26005)(6666004)(40480700001)(186003)(16526019)(478600001)(86362001)(40460700003)(7636003)(4326008)(6916009)(70206006)(70586007)(356005)(316002)(82310400005)(2906002)(8676002)(8936002)(5660300002)(41300700001)(82740400003)(2616005)(54906003)(426003)(336012)(36756003)(36860700001)(83380400001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 04:23:30.7584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b157730-3c23-4602-209d-08db6c8f1c03
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7272
Subject: [virtio-comment] [PATCH REQUIREMENTS v1 7/7] net-features: Add header data split requirements

Add header data split requirements for the receive packets.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 2b51759..f26b61c 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -11,6 +11,7 @@ together is desired while updating the virtio net interface.
 3. Virtqueue notification coalescing re-arming support
 4  Virtqueue receive flow filters (RFF)
 5. Device timestamp for tx and rx packets
+6. Header data split for the receive virtqueue
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -228,3 +229,15 @@ struct vnet_rx_completion {
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

