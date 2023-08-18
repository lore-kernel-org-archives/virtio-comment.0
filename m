Return-Path: <virtio-comment-return-7196-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17180C71133
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7D7FB42C2C
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 749939867EC
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 69F0B9867AE; Fri, 18 Aug 2023 04:36:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4D26A986647;
	Fri, 18 Aug 2023 04:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WH6/5buLjxlQiQcMVXcBSow8+aXYDsVXX+76OH+IZLQIgWJxsLwYBccRDmpK1HLaUgkmifQ36nXYjmDw/dHpTbkuh/yhVNkMGWe8LMadBQkl0Mxzt3pT2p3s83AdWRN9e+a7qfmRHvd+u0Ak7KoM18H29T+HaJJgLjKUKVpaCBRY1w63MB9uWH2dzoXyTa32H5vUfPsgMv87dnftjbJcOqVu/Tt+dGv3UU7aau3FDL6atbBO95uc/qW0e715BocaGEyAmC/WIswZW31lMGWCGfXSy6YQG4MbOtoVsa7sNtRB3dYUgAkVcWHJ5dNyOI8hIjAEiIygPyDAMaIRdxQtdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N06nNw5cOW2Kr/ruwjpiXndBpGfPuu/Mc067Ch/NB+M=;
 b=f5u6HrWapODops9Dqrydi2XhYveS3/iRbhxKN5wazZgvP4wp9JcG7cvIS7K03Vxj0yMaZHrlsN3/TE5mBWbXkSj9oBKBtnuoQiZZTUjH2l6O4phrZHQ2TPFJzOfyKxcsISK1PLPRDqoSmRWYK7wnHB88JqPF4szdoW9NIgPeWv0npP/UHZb5NKPSyjyFbYxfKB4o8lUOtEBapgukesRe/+dBOt47EKfv8UBx52M4uzj27qDL/R36UoCRCHPCIifyUefnRAxN/OVJhVlA40nfdsT3cxCzHEiTe0INKT+73Byx9YHXGNd38ryLbJ95FEBGRi/Abtjr2ZmaaRz79v5WJw==
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
Date: Fri, 18 Aug 2023 07:35:54 +0300
Message-ID: <20230818043557.496964-5-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|SN7PR12MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: 2332dd4c-5c9f-4323-10ad-08db9fa4b02e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2+ZE/ejZSYn4uRPc0bfxGDLtZ4mjSOys+qoLRPZXpD6mHBVLm7B74d/DqlIs6U6PZigzfnO696iB3mywtgZz76c4r5fgnBaX3JEZLQdv6xI7lB/Yi0xyY24H1OQSlQ71O8IwAaisC1FOHw/9Nhku53XrezvqicClQ9qySwFfv2OfrWCtYgbD4H9vRrFihO62/WhBed1Qw9096G9u5ZFZJkbZgNmYb/1HAHt1TZl18nfBMnrxHm9lQ6eijIIUGOb57rVFI53DlWGRjNHewtRcIYJT2ZXww8IlL+RAua3LSbnqLbrzf16u3s9T/N5aRnFAKETus2Mp9KFf95O5EGJbuAJaWrEKlMGXKa4lzSNUno1OXwv3mSeEhIATpqIfyZpx6TiFe12zG//4MWFLDLBNcCBdjtUHNTmLDwAEIABxv/qWATEHX4zVlCfgI3JiO8LyXW9Ciui5l9BBYEspJ3SZ1vF7ag2eLSNqKA64QSA1ONQXxqHBcsx4e6s09HkPqyI1vTTheDcSckBL4AYLD486R7W/dpNj30K0cEE/1dgOpjC46JZH6bMUfjo/Rrreqbwn1Fp/9j5JymINWcYBtUiN+ZIlzn0R5mAnrXPojjLy8UI/TFDTRr3Q2xWtZJDsUc+yi/muvRNsgFgZ98gFdYAXH8lzs3R7jstub0tkbA19EnGuKXa/YO/8qSc7EpDZkmBUMIXJJNtTeoRkmfcgpLhVT9bIJvESEs4WHDz5/++KsFodPG5bnywlE5iZj5ZjcPBn
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(186009)(1800799009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(2906002)(47076005)(83380400001)(15650500001)(426003)(336012)(36860700001)(478600001)(70586007)(70206006)(54906003)(6666004)(316002)(5660300002)(16526019)(107886003)(110136005)(2616005)(1076003)(26005)(8676002)(4326008)(8936002)(41300700001)(86362001)(36756003)(7636003)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 04:36:28.0912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2332dd4c-5c9f-4323-10ad-08db9fa4b02e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7250
Subject: [virtio-comment] [PATCH requirements v5 4/7] net-features: Add notification coalescing requirements

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
index bc9e971..72b4132 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -8,6 +8,7 @@ together is desired while updating the virtio net interface.
 # 2. Summary
 1. Device counters visible to the driver
 2. Low latency tx and rx virtqueues for PCI transport
+3. Virtqueue notification coalescing re-arming support
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -170,3 +171,13 @@ struct vnet_rx_completion {
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

