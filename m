Return-Path: <virtio-comment-return-6347-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E86FEB64DB
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5795342934
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 30F4A9866BE
	for <virtio-comment@archiver.kernel.org>; Wed, 14 Jun 2023 04:23:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2842E9866A4; Wed, 14 Jun 2023 04:23:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5D1A3986819;
	Wed, 14 Jun 2023 04:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMYmMDE2pSttw04g1LvQXC3iB6lH7zQJVHWQlkGJnj2FKLsExCbvBDpFHTIH+qaiOTSEvwly5gdf61STglmadDM6Lqoharu3BvyM+J91CumaQgz6bBtV0Wt2YdfaMeqoxZTrTeZAwSeXKpDyYmYSF/Qvz8+D1NoE7cRyN3LEh51QNuzVnbQ2Cht8DaQfQhCbSOj5ODE3XUTqFSmAux6Rzsm4d47CojW1TOIE2Sel6PuWfvgst5iBTZXi+5sByyGTMNmC050Yy7MwGEsFHwlXIvyLn7x6HLh0gT3LfXDI2OYIlT6GLwOre1sw3UTZz7GdvSt0gzAZsauVB2SzJPIuNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOerA0rG3f90tJSrBkQcKv4os6FcFgi5Iib6Ixhwoz8=;
 b=f+AFgzngj+gyIytQolgJyvPaVC+qdJ2d48LSuRIlj+CDov4NoFI+dbTE2oONcDA3esVqFGNkGrTyjeholHHRz3XqbQT1l/KUz0hvn01rRiFe1nh+b+0gLjz+98TsmYsBJF5OLLhFM6F+9xqiROV1yNLBn+qE12nVVJdTPFozz7UE7PGXJwTYQaPajG7lbeaFbnGoZA1Kr9fHaFNBTLvmHY8O76nTFmil3uuOvrf15fWuASVawcG3X6Pm/cCCTXr4WuMj9qSweBC25LPv7+1XVLWZphaE++1AGg07BRjjTw88YRKJAldW9aXaZNNuvczTbBLjQ2jZ5342go78enkVSQ==
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
Date: Wed, 14 Jun 2023 07:22:56 +0300
Message-ID: <20230614042257.1252775-7-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT088:EE_|SJ2PR12MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 88e1934b-f3b6-48e3-2121-08db6c8f1b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3DO/cm+y4RD63Ii0TWrBVCJKrM2P8ffYbT/ozwPE5oyWqvt0oPfhPlWd3bzPuXo8tqRPgCINmXXP8yQc6evsAClPcohvUuj+SpSNuhW2vNhT0vVttETCDNwxXqq+hhWb9WmMJiRSeI5gxbcOunb+KNtmhJXdLxk3y9K89KjkpCyP3Wwo4z83sEfyPIxK4nqzK1rJRQa2lzwIhr4Dklq0f4Jj/fo7Vgq52gEWu29yA+UnixWBWVip5B68dF0+QIPWEKUpHiBts8NtvEEP9FGKoJieSGrHkZ2OkXqTzmKMNa/w5lsJRAzCqreWarCJ2+zIF1dNUUlQMiB4jZPRdT1g4VyTzMT3t6KbdUOADm7f1Yzyb6mQXFg9EYD9kF+94I2eLGQlcm0U83XKDf1JGjRLC0zjqbfHprNcQoLrBL3NurUCSkrD/BejMohzaXOXGZNP0VwgoS7tftOSY8tCoN9kWPhJ7eNELwR1n/T5xuCauazwPIKR+TqWvMba9ejeXuubcxVjXAN6UZpCqNJSho/9WHvJ8M0gCtpo8xlB6rwaDh6ZZlZsj9Fr5TAls6P8awzcyRwF6XU9VqjVePIiVtwrdMXG4fFByF9PcjOoMR+D6ydYJpHOGKH/amYnVJZFRAaFWy6lsgtzsZOtCLojPa9RweYcATdU9r9wsaO5KbZZVPVAcXMRI0Phel7xfPPcGNR6Ak00uogn/NIuaYqLVCXaE7U2qpB+B8/QiX/fnYW5DcrGbHZuE3bWYpch6rDtDPGr
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199021)(40470700004)(46966006)(36840700001)(5660300002)(8936002)(8676002)(2906002)(70586007)(70206006)(6916009)(54906003)(6666004)(4326008)(107886003)(186003)(1076003)(26005)(16526019)(316002)(41300700001)(36860700001)(82740400003)(356005)(7636003)(426003)(336012)(83380400001)(2616005)(47076005)(40460700003)(478600001)(86362001)(40480700001)(36756003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 04:23:29.1029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e1934b-f3b6-48e3-2121-08db6c8f1b04
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8184
Subject: [virtio-comment] [PATCH REQUIREMENTS v1 6/7] net-features: Add packet timestamp requirements

Add tx and rx packet timestamp requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 net-workstream/features-1.4.md | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index fbeb1dd..2b51759 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -10,6 +10,7 @@ together is desired while updating the virtio net interface.
 2. Low latency tx and rx virtqueues for PCI transport
 3. Virtqueue notification coalescing re-arming support
 4  Virtqueue receive flow filters (RFF)
+5. Device timestamp for tx and rx packets
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -202,3 +203,28 @@ struct vnet_rx_completion {
     filter rules that device supports.
 15. The driver and group owner driver should be able to query supported device
     limits for the flow rule entries.
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

