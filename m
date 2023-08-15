Return-Path: <virtio-comment-return-7128-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603E7C0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3665160D3A
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 06E929866FA
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D357A9863FA; Tue, 15 Aug 2023 07:46:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C691C986445;
	Tue, 15 Aug 2023 07:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDhxq6a4isClbg86sTiHQ0VUk3XZDY2bnQkXFbCHghFzMIN0rxdnXMBUL0MuQN5gcpjbkEqjEaoMRxPhXRZf7ySLDqpslWIUw+HgWKyp9zpjaIxCGSr+x0nrY5n1318Hkt6J+JLlds08zwrky7Tkaj5RVPCQN3A6XlYvtGRpd8eorSoWjDKgBZvkZz4wtIFPFDP+g5EywISBsa2nGgmCc6JDo0LZF9TLiZWGQkHdwfjLxUKhE0tY7BiUGTplSZ/E2GUPQAitRmqwMUGPmNA9vZ25volPY8Y6gKLQpCHZjZK42topNY3ryq2emNNUYo91cuispuSi1QN9zijUNcOgHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lzz/EVvf7OeAgD+msbKzfmxRKYIP+9bB6OFgZgPRhno=;
 b=cS/aoR3yyhwXW9KQMxNfLiHBVwnoWCGTRTslfBwzYd5vDdgZffKZIBEruQZBShVjFnIr/iBuO9ImMs+ypavHKkmwNjTiP9eHh7Mt39O1aZLIB/K2HIjYKUqA6Hs27tAA1PiyejMukDrHUcFVz/erE/6shG+No5OMGxZWX8PsSOC82In1r3AZKsJvPWICjo8elYUZ0SIxwx5FZtIXCL+1UVmzlXnwNvbjr+0eTWLcKQqtGPbl6kGibvUHZHVL4dmZlAgY7N452jdd8GiMi+7fedI+enVcK6T3fwDRJc0M0PY+eNqdLYxcx0u0sQ+1TsB92hn2bWJARcj2l0sjjTt1Yw==
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
Date: Tue, 15 Aug 2023 10:45:57 +0300
Message-ID: <20230815074600.473933-5-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: dc9d7e3d-12d6-4b42-a6b5-08db9d63bbb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uw1JepDR8JE8koTdKmJbWH0uRdPsOiafHvNgP3mrpvVqfM33jStcOAl6LXaVLBBZWaFhac53c/J2XjDxP7VO16iaNu65XUvehxiYuPO6Kfd8PKO5Q3z7aE1UtPjoSfyO/0XmVMzzCgGA2a5UY5v+v7lyLmzVpYZGgjZFkp7TRCQk46cCdsjO0umc16jMeUQYbBKlgwlN84scZhC+PQwRYbDb1OUJFDfiJZj3rGzsP84dQvIcxuAGDkCoL0fIqkGhaEhzvlbsVS0qmYd9Y5ahs4/Gnw9XfOo6Lv/EDV3h1ouggaRjHJvaMOfwm04fg8TwdtLQEpr4Gi40cgiKRs/syxXgP+FFU8zqKyGRnHAEI8H61YF3YfJHzX6J80e5rlYZjzJFPdjwA1hbs9Aq9Huliokyl9siE7E+Q8IAsKXngbMDuGUFjrXdOmoQLD8r4ef6Jyz+T5b0kwtaQ0hSYIseXfcDaSRU6k3z0K3+EFGcjp2lnfDIQfqt5MJ0MRQgg92LMlPUMvtIj3Ryu0okkrDiSnjxbtjfA0jHbevc6wOi1N7upuGdiPyT0PUrDk44AXknALobLdQ8qwd00n9tpVQ++NIAcjMRyGyO3GGWJqQzZrPWjiOU1tGrMv0uew0ShjSYCYEKX8T+q8XoBTE3E8yCrmlOAG0v1hmaPesSO6W5T4t4ZMMel5ZmMJPkRm6nyqQjfX61BcpJRJcGUlbPkfAVHdwaRUbgJESbB1bo/jsZX1uFBuk4+w45m1qxipP7+pvQ
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(82310400008)(186006)(1800799006)(451199021)(40470700004)(36840700001)(46966006)(15650500001)(2906002)(47076005)(316002)(40480700001)(83380400001)(70586007)(70206006)(36860700001)(54906003)(41300700001)(6666004)(478600001)(426003)(336012)(16526019)(110136005)(26005)(1076003)(107886003)(2616005)(86362001)(5660300002)(36756003)(40460700003)(7636003)(8936002)(82740400003)(8676002)(4326008)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 07:46:27.8530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9d7e3d-12d6-4b42-a6b5-08db9d63bbb5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
Subject: [virtio-comment] [PATCH requirements v4 4/7] net-features: Add notification coalescing requirements

Add virtio net device notification coalescing improvements requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Acked-by: David Edmondson <david.edmondson@oracle.com>

---
changelog:
v3->v4:
- no change

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
index 72d04bd..cb72442 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -8,6 +8,7 @@ together is desired while updating the virtio net interface.
 # 2. Summary
 1. Device counters visible to the driver
 2. Low latency tx and rx virtqueues for PCI transport
+3. Virtqueue notification coalescing re-arming support
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -172,3 +173,13 @@ struct vnet_rx_completion {
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

