Return-Path: <virtio-comment-return-7614-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943FFE95A67
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 064447A085
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 02A7C986510
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id ED225986380; Sun,  8 Oct 2023 11:26:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DFD30986483
	for <virtio-comment@lists.oasis-open.org>; Sun,  8 Oct 2023 11:26:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPZc/RckoC2mEPquFpwDUzyZArcvV8Ak6cbN8N4shbex8dYa5ictCAFFij4iRIFREuEYYh2rD7tkaDFSPxcGYlLWttKhu9COSOVooDFJdmN1YCP+Vir5FlHYIjkQs9sSXeXSEBghSa7ZPAggRU51jkg68zoSHdm21J23rLRP7V8wa1HU5J4TSPOzr2KF5srKJvDxknqhPl9RyWzkEb0UQKBnXmVBlHDh0g2rKwKgvirnvkB1DyMvIUwGKLgTvEAk6HVS5OdQmXMud9pLy7XkL/ZsM4bS8Auz7QLL9iZTBwhikzn/t2eK3E9aKnPAxr+ew9uNVqK8k6i7L+pQzBlkcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9pa0HKsrBAR20QSCQPTNtKhJb7JP2RhD08eCnJqKt0=;
 b=ixjaD4ckBa+CTE8FbbRwZ3gzVI0yMKyXAXHUcxhPkYpj5OU2ypmgkBzFK1Bf7bT9IdzkzNpBn67mOFNK7BVzr2wYgp/A2wCuzeIqIBPTt8slf6zH0bvomWUaXImWQt8YctIx+9TKLnYlpOlAixcC9/CGBXLnPoECXTnz/BQmOOnM4Z/M9yerD7d/QNXx7N688D2prwSFfsidu7FAX6Q80cnW6LJOiFgJ2WELXogwlqMEY1uLRrjH3X3hCZCd7yVu31g0DnSouwSVnHY1ZWlOzrIjgpjH5ytxclXrfUiZSfjYiFk516Ub1sKltY+rC0Uml4BI8QXTzeVPcPJyXUC/BQ==
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
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <maorg@nvidia.com>,
	<yishaih@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Sun, 8 Oct 2023 14:25:53 +0300
Message-ID: <20231008112555.473895-7-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231008112555.473895-1-parav@nvidia.com>
References: <20231008112555.473895-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|DM6PR12MB4896:EE_
X-MS-Office365-Filtering-Correlation-Id: 64890f90-b7d0-4500-c4e2-08dbc7f171c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ywzMnvhIYFTccb9XDdnb+GaTho/bZJX588mz5dqN5++hpxlzr4S9zblNfp9pKmq4391V6z+dhyTwRfa5zCOehOc8dmadFWj5MMtv+U5JSkAPsixIxTrTspAVll3eUy9dCfkkHoDfzMCZMiMqhLHme776mjtj2s0h8Gn57IkrskFllnjQpGlKaCrw9MZ/Fy9tAnuh2LYDFgFzUFRIsArcn7EnjuvxGpYqzja7AJ39/MzbQSiSFGF84rI8ogd67ejTe53Kypi89zNQd+/naVnlM6j29y1P4303H9AZnzYGEBgEV3bpfkOKwVh6J1KHwb3qWplOXc6LfLN0I7XTY/6OjGrFw9a6mDnsJz/kSZO9Gh7vIENoQCcdDI+cOjQKjWl5BD5cD3Y2sxQ9eFF3ZeLsnThaiwgpFo1WyE7yaeXn0MUFGhJMWJM37bIvdZnEU/qo9bUgoBcRr0/WIxNU7VMNCUuRFTommRajW9dDNdHXogv9Nesvbkb29MRV+C60as9nexQpXbXwdm5osBmtm8WkLtRo6XRjjCtpj9JCUPuz1mCY0lC833cboHXzdUDd7Wdh+7LYcZnKd0suZX8t5p89NFtl7HA2glA8e3BhNZq78zISNntI+958a00+1c7vObSR6mXUoKungbESPl1XsZlfIK1R4phpsw/I725VFYBdZ1EDjZUkAnpFmCwCmS4qyUh+S/nKkua23hIJeZjTrNxMecmTx/le2Z6etQXPbxAa2f1P0UlxYAwDVr7uurCiAW0DYMxPQYuO+dXd7aA8x8KPhQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(82310400011)(451199024)(64100799003)(1800799009)(186009)(46966006)(40470700004)(36840700001)(82740400003)(40460700003)(40480700001)(2906002)(4326008)(316002)(54906003)(41300700001)(8676002)(5660300002)(70206006)(36756003)(7636003)(356005)(70586007)(8936002)(2616005)(1076003)(426003)(336012)(26005)(107886003)(16526019)(86362001)(83380400001)(36860700001)(47076005)(966005)(478600001)(110136005)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2023 11:26:41.1286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64890f90-b7d0-4500-c4e2-08dbc7f171c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4896
Subject: [virtio-comment] [PATCH v1 6/8] admin: Add theory of operation for write recording commands

During a device migration flow (typically in a precopy phase of the
live migration), a device may write to the guest memory. Some
iommu/hypervisor may not be able to track these written pages.
These pages to be migrated from source to destination hypervisor.

A device which writes to these pages, provides the page address record
of the to the owner device. The owner device starts write
recording for the device and queries all the page addresses written by
the device.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Satananda Burla <sburla@marvell.com>
---
 admin-cmds-device-migration.tex | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index 88e1af9..e98d552 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -94,6 +94,21 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 The owner driver can discard any partially read or written device context when
 any of the device migration flow should be aborted.
 
+During the device migration flow, a passthrough device may write data to the
+guest virtual machine memory, a source hypervisor needs to keep track of these
+written memory to migrate such memory to destination hypervisor.
+Some systems may not be able to keep track of such memory write addresses at
+hypervisor level. In such a scenario, a device records and reports these
+written memory addresses to the owner device. Such an address is named as
+IO virtual address (IOVA). The owner driver enables write recording for one or
+more IOVA ranges per device during device migration flow. The owner driver
+periodically queries these written IOVA records from the device. As the driver
+reads the written IOVA records, the device clears those records from the device.
+Once the device reports zero or small number of written IOVA records, the device
+mode is set to \field{Stop} or \field{Freeze}. Once the device is set to \field{Stop}
+or \field{Freeze} mode, and once all the IOVA records are read, the driver stops
+the write recording in the device.
+
 The owner driver uses following device migration group administration commands.
 
 \begin{enumerate}
-- 
2.34.1


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

