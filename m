Return-Path: <virtio-comment-return-6887-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8A9EB64DD
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A0BFE330AE
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 94F729866B8
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Jul 2023 03:35:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 811BE9865B0; Mon, 24 Jul 2023 03:35:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C22F698650C;
	Mon, 24 Jul 2023 03:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7ByxrrOYzCCcG6mDqkqJRCIlAd5dg6B8NCsZfGPRC9OefOzLqImBO4sabOB2J71iiniO3V3vGnNQckN3A44TrXu9K2FNM6dX6WdVUqNaQ3KA4Nsw/LF9UUiN3EnLzkPxuBwaNfnECEU3KLZ2KuayRxA5Wz1LsKf2hh7HLp1ygr34DR2SqanNbvGHz6Ci7dgpvWjS8nKbtRfrEvVAh7FEvwzPP0uDeG2K94J7K2FromWzoAsJTOJdrIcSuQMsRsDEB+QN9MBfFGV3/f18HNFsWB0UXkJwrCzoiH6UPtFfb1rL3GiMh6IWIejZKgnm0O/4/SUl1nHsvhJZZYdDkFXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/RImPgfpdFP/JIWNsZqbJZ0PvQ0AlzYRSjEt7JqkvM=;
 b=SA9cdFSjKFSp4Z3uBN7v1NBHljdKizgy9QprgznZStxbvjalx4qKG4C0cfRzEUkmwY8cMndwUVq31Jr2XvgnYcL9TcZYG8mFHA/k5I64SHPQhzzTMPIGWZ29TGLbddPvGQ5sn6v2Qf7/4+5+ds3wNdWwFx3cy0y2mPy5oyV71k0pwgoMSkSkiSJ689keIV7XuN/a+1G8Goz3wUL3M5juc6DC7Z3A/olRIK0cZc+68j3rOvA8FJXdJf/D7X0UZu0BGgRvBzMp/8V2aoh2Tv0sVB8qcW4NU/ahxuXjj+E3NAqNStZe0HyZMvfQT3AZEuPgAiLufdXfCzKDx8IsKX7/Ww==
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
Date: Mon, 24 Jul 2023 06:34:20 +0300
Message-ID: <20230724033421.249893-7-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT055:EE_|SA1PR12MB7224:EE_
X-MS-Office365-Filtering-Correlation-Id: 8513279d-ec3c-494b-56ef-08db8bf6f188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wt27S4prQoAhgGC4tsYTTigNDH12l1MRy3gKrP/76qxQa8DTbsf6ly2HrXt36MQ+y5+00E7Ko4kX0J4WClZ/UMJDA3m756uH4TGG0PnaygquVXZrvsG2XjQ9Wq1Kq0mQRS4bJBmBt4J3iCqpsIA4tnyhA/xN6pzPWYlNcOzcmbDw7KmZ7CGVwhxWuivw6y2IeupPPyVmJSPvg9qQ2hNLM7IrZ4vMt/dVHH6TSPEYCD2wCuqf8IC05FX2eS9EuUKiTgujA47ao1aLS4aT5L402HdAK2ejLdnOgbUQsPFCT1z2C11h+gd40ZvadJAF70AmvtqPL0bAIk72KXqyFRse9H9zIXB2JkRLavC3/HQmzmmvZOnz6NLZKCL+KtD01dovUu7Q0TfsmR7mJyjef+nKPzI4+/4NxMMkuAIdqYr9atSFyORwW24Nc5UNi+cJDfhgS1s9A7L16Yp8pwXFGQdLbHMKFklwUDdpPDNju3KcsO6dQUPOdeDlQhDeuW7aKlWw0nLX+7Dfy4khWj8jr8ft1ccKL0W5GYI5klvDoZtpkM3h/QgCMn3U9N6WBqOhr4Bq9CNsm5m37zZJqd0Ns6v01dIRokhjJAlFloZzd6AHqvpTHbqYMrPG6dX3VwrYFxEGj6dekGwRQpZOdY5CzL8IzRlH6xyi/ThRdvyKRomBX4fPNy7b1K7byWi6r7I22LTjHFvQY9hmz35yRNX/0IqPJuQXUIxeBBSeykYZ855RjBBzTZPF1Qv8Cv7Hk10XiZn5
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(82310400008)(40470700004)(36840700001)(46966006)(40460700003)(86362001)(82740400003)(356005)(7636003)(40480700001)(2906002)(6666004)(2616005)(426003)(47076005)(107886003)(16526019)(1076003)(336012)(186003)(26005)(36756003)(5660300002)(41300700001)(70586007)(70206006)(316002)(6916009)(4326008)(478600001)(8676002)(8936002)(54906003)(83380400001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 03:34:53.2110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8513279d-ec3c-494b-56ef-08db8bf6f188
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7224
Subject: [virtio-comment] [PATCH requirements 6/7] net-features: Add packet timestamp requirements

Add tx and rx packet timestamp requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index d228462..37820b6 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -10,6 +10,7 @@ together is desired while updating the virtio net interface.
 2. Low latency tx and rx virtqueues for PCI transport
 3. Virtqueue notification coalescing re-arming support
 4  Virtqueue receive flow filters (RFF)
+5. Device timestamp for tx and rx packets
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -280,3 +281,28 @@ struct virtio_net_rff_delete {
 	u8 padding[2];
 	le32 flow_id;
 };
+
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

