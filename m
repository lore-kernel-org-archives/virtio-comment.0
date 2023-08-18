Return-Path: <virtio-comment-return-7201-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F007C001DE
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:37:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CEFC9799CE
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:37:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BFEB1986514
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:37:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B6B7898648A; Fri, 18 Aug 2023 04:37:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1F8039866FC;
	Fri, 18 Aug 2023 04:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXIrUux3b22Nh6PlCkkPHRECsdZPFNaw5kv2K5alvY+XPiIwIAAQHvay5rYHuRenLxoKdHi4Sn7hQWySoYV4otMk6RDmeIB0x/vJF0kLZKbgJnPM/ktQK3MB58tFimZcwkO4PENLd+2Xl9lF83DDRsHxmVRVw8SDvH/VNdPrmOPedxaw21IIBnOY+vYVgxIqhGzaF7HfGc91gTDAX9xEYMlce+ArlGwRK1dpY2jkcl7jLwBL7dBxMfUBnEP8amR+UyO9LVOnRIau6ua/yOcJE7QDAN3dSQ4oBgYn1fIONHhYTd9ePhrIgB5VnJSdy22B/HfpzCL0u4QpgPTU4T0O0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtT5efxqJ1N47f0XTNDf1Cbq8PRWQIt4bKbjQTqm/kk=;
 b=DD4k/IvTJdBB3JQ+Ea3BurY95g2riKxagJgeaBlUE+gyGAJ2LAvZxH37QJHB98AOC7XHcTYE5oJ3zUPoo5fe7nFUgUCm47Dmm78MZS5uZk27YO1Gwf0j9mMOcrOhpAwjEF/VkDlQpXoLfRtvchIw+i5OWDGWbUpFDnXzcbM6fcGoF3dmFJ/wEpp1LpyIfjR2P7sLWc5N1+SpJjyf6mMwHFRSyldixACbQLjXr9Je52poMSToJvAJ/udTiGo/JpDbMUJJEbo7cH0izEz85A2aBsDKmJ5uaLnjt1XNcZuDtGaTj9ATP0jCmHmKUSvEn3aprd/twK2q7LoAIRGFBlw6nA==
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
To: <virtio-comment@lists.oasis-open.org>, <hengqi@linux.alibaba.com>,
	<david.edmondson@oracle.com>, <xuanzhuo@linux.alibaba.com>,
	<sburla@marvell.com>
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Fri, 18 Aug 2023 07:35:56 +0300
Message-ID: <20230818043557.496964-7-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230818043557.496964-1-parav@nvidia.com>
References: <20230818043557.496964-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|LV2PR12MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: da706d7e-4661-4ca1-e4e1-08db9fa4b29c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1UtjH185vounaVYZ2kV9TdbbKzMuP/OxjDSMO6pnKkcWi1gRJke4Bc7n17tVunlsP4fdcphKB4ncx3G7Wsn1tIQwaLu61IEKIsjbH8aUdRGScmvsERfA2BEpbWtz888Ou/xPKQPTDTkBCLYuI53UHex/0jZtF6rodeo9yDFQI15lLfaQ/eNBM1W3ShbPetp9DpIVQiF8xn7DM0kBtnN0bhrIu7GVwKoorgrpAQgzAtqy+ubOzagw3Jk6fIKxNTwC4x2kogSXiU8SzsOOSK2CFjD0An/h6bnKpSqerq2lowK0EGcBnzmyV9EjDZoxB9LIKUzWSJeus3uTM6hoNRU1WVNZ4O8oyWCsfyAoabcGS8TzCE9b/MFlHKvfHzF2fo7/uDDk2KWMOYhJRwoP5Uoz2WxIW7y7GBnJdsN4XsCd8OMFuB1onwMXpYGTql6hkLanR2B2CN+UNz2b7AleFoIgA2nvEIu3Dn65E1LqS5o9dlFxIPYT3W5SQZsYXmKQDfl0XlmAMP3ua0J/BcPCNCpvQ4VTUYNdQlSV+gWnZ3B1liri4364qSJn0AtFeOy3d/HnRusmYWjQwqH+V184mKgqJV/3JTic5tzUpiElSnBIUU9fVl5F3ED1siAmEIg2NDzXgn7Ao9SlHEe8rU0ZEnCEZkPTN4XaB/FUlgaNeqOMOJvv4q5JlzAXOhvOkdCysjVek9ZHeXUy1Ei5gizjuzJVnJbp3wPKm5n4ZiSkt5B4tQM=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199024)(186009)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(86362001)(36756003)(82740400003)(356005)(7636003)(40480700001)(478600001)(5660300002)(107886003)(2616005)(110136005)(16526019)(70206006)(70586007)(6666004)(26005)(54906003)(316002)(1076003)(4326008)(8676002)(8936002)(41300700001)(40460700003)(47076005)(336012)(36860700001)(2906002)(426003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 04:36:32.2199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da706d7e-4661-4ca1-e4e1-08db9fa4b29c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728
Subject: [virtio-comment] [PATCH requirements v5 6/7] net-features: Add packet timestamp requirements

Add tx and rx packet timestamp requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Acked-by: David Edmondson <david.edmondson@oracle.com>

---
changelog:
v4->v5:
- relaxed mmio requirement on feedback from Wiliem
v3->v4:
- no change
---
 net-workstream/features-1.4.md | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 330949c..31aa587 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -10,6 +10,7 @@ together is desired while updating the virtio net interface.
 2. Low latency tx and rx virtqueues for PCI transport
 3. Virtqueue notification coalescing re-arming support
 4  Virtqueue receive flow filters (RFF)
+5. Device timestamp for tx and rx packets
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -344,3 +345,26 @@ a. Driver should be able to specify a specific packet byte offset, number
 b. Support RSS context, in addition to a specific RQ.
 c. If/when virtio switch object is implemented, support ingress/egress flow
    filters at the switch port level.
+
+## 3.5 Packet timestamp
+1. Device should provide transmit timestamp and receive timestamp of the packets
+   at per packet level when the timestamping is enabled in the device.
+2. Device should provide the current frequency and the frequency unit for the
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

