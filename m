Return-Path: <virtio-comment-return-6346-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6010AEB64D8
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D036641F02
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C9ADF9866B0
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C115198665C; Wed, 14 Jun 2023 04:23:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ACADF9866C2;
	Wed, 14 Jun 2023 04:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAyTgHyaK6qvnuDUvVy1+Pxm5wAXZ8osfvLHmPnaDDdThbEmuYrftLvRsV9ZcZDgLZCqssFIiEXipz7Zf12hifNigOhLSJCelGPtiRaALMvtyuktkQ98ljgDThr1Kpj4fYqORTl/3IrCr6ttEjJvwWVS83e02pcivKaOyJL7TmIp2ZBVUVAqwnWDf+T0QYt+yEQaCi5j3rBJAaU6C/ZCy9KAX/ASp7OsLkYm+NB16xSZMDw8FUDrLXonuCebVW9AEc7qxDX0pqQUPgAWa3f219RNMm8RAIIiCUGb0poW1v6SNA+EhBGyMkc+So80wFxQAnGxC5FPa2a96QbnkdPzCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSZSpuR1IWLksBciyzs5nxjZx/QyP7awRsBRtrByWfs=;
 b=jvTbAigH47agNRmH5/XJ5pstLvyc9YEzDokgzA06TzZ2VeqvZeFoEZubxNoT4gqoSeLOxV6PsEu87wMzL27w7roCTxN6KOtSKeprhBxpAaR3Bk5wZwHK52JVfe3L+A2RW7Gv4SglrAsjfoaSiLNDwY1WcTo4mNI08ECyurBXa81aKggX7CsPGN8yDcF1i5Q8xCtkCWRtS3BJWHQypWYwB5rQcfSEpSV/IBRQ/A1rWhAu2EXojj0/X3tQJ7u0RYJv3rW0fk+1a+E9T1GvUg+1U/8sFht9HExtYwSifAexFUQHOCZFnYsroRrf+/C5bcIj3elg7jQfC9aZ/l0mpZ9LIQ==
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
Date: Wed, 14 Jun 2023 07:22:54 +0300
Message-ID: <20230614042257.1252775-5-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT052:EE_|PH7PR12MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: 061d0f4b-40bb-4b3e-ab21-08db6c8f1918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c+82C2qLCgcj4m9rGtOQY5vJv80/lsAWPmaIEfFnNiqFvMu+R8uIWL8O+2m6NOfg1J4kMF87oCtgXNrvqggFNFHWLh8QNyGR3th0rCoVBvf5HeRzWidDvm5WCdWq7Q3V/CSl4sdwHpXKXCfFeMpVP2b+OZA085iZgK9zUiU5Udf3cJhPDR0M4gUfZQOeup5EDf3Sak97K7e1fqWNPXIQhUyJEpSnoSG7HrrExnJntOmUhEaXyViSZn6RsQcLsvqJqAvD/ghJCWUyKeuyFh2pMP2Rwyj2z1s3wb7uEp8axdyKtl8QA+hJ1geRfVu8lNQuB9tqd6nsfgIt3sWkLr+mQrZTSfgR9om/TrtdbCkMWhF5/QiMCEKD8ZZEmCWl/LNn3lFts43+43Zcm3Lo3Yd426b4+7Z85eyotQwEFMfZ03ffw0lkxZ4zxoenz7SFuPMjMxjSgkWC0nUL6qnw1iD2kD/PhMBPrVvw+nhjjvTW4fuNBzcgmHHEDgporwRDuIX1V1s9KAk+6DhXzzs/DQpokIMz8Ry7ItHrKDO/xbOrGcF/dNh8iXhMjencadZ9DEpewZe+yMpSRBUKNYGornQCqWG3NIJ9da7VNfJhu14zCp2GJWp1RFiUILcMk2C99wJK6vhJDkUHBuqbZZUiSUWmLrZoM0XZ5McGLkmtZW1EDLZ0/aacCsfmxPXzzhZuCmAUJHfliA2KxIsoFnR3avHRyLi7e2Vgysm29cMtvZM3YviIlfj61hAcZ5MPLXSH6BaE
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(36840700001)(40470700004)(46966006)(107886003)(26005)(1076003)(6666004)(40480700001)(186003)(16526019)(478600001)(86362001)(40460700003)(356005)(7636003)(4326008)(6916009)(70206006)(70586007)(316002)(82310400005)(2906002)(15650500001)(8676002)(8936002)(5660300002)(82740400003)(41300700001)(2616005)(54906003)(426003)(336012)(36756003)(83380400001)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 04:23:25.8352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 061d0f4b-40bb-4b3e-ab21-08db6c8f1918
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8425
Subject: [virtio-comment] [PATCH REQUIREMENTS v1 4/7] net-features: Add notification coalescing requirements

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

