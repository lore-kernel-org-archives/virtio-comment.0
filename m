Return-Path: <virtio-comment-return-7294-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354D3EEB580
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:30:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A32292B051
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9896C986650
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8FBA198660D; Sat,  9 Sep 2023 14:29:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 74CFA986674
	for <virtio-comment@lists.oasis-open.org>; Sat,  9 Sep 2023 14:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9P/QuZCZSxSvpRILPYHLydrl/YD1J2ekVRXeIk/rCAxUD0b2kKaewHzqda4cTfQrs66QFEqxH8psFYHQF50SLJhfJBRWFU7ms2jQxgC5YdJl1Bw7OThR0RJUKW8R+gXJaFZUoh/IIR+uJz9LQOC0u+895ZVdZcbbArOcGjt26f/6DAoQtulR91KOmdUlOa9gBMPEh2SK83+WsdTanAf2ElQuR0QKpS2iCsDXiqeEXLlXRnCjdDZWybEqfcbR7Z7LOSqLKeSLkYzRfFGX8XMgF6WYrT6sPiwARbYsyuNeC9VfLLrdjIbjf05wJp0oo+T9VgO6G6c8RZySbg4kau4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ovdzAn9QpPAV9j63aBEYXcY+tVqWWWDCMhXj2xAl9o=;
 b=H7YwQIRwEu6BanlgtTl16jTybrr6Gswtm3/eEB16LdDOiGIiLyqLCY3Hy0CTKxI7L1tw7I30rmC4Y1a2x6uruN6Uh8LfiF+7TN+3itv/27mB+HkbnZKWPvpTzAfyDm0UYEZfNo/C3xWLnN8Dg69BCxny5iILs50+ym7OFXZEJ09P7bkbj7O3Y+UejFjjS0Rs1IfVvRQ3N76AbY/u7VjChojFrsFQ7Z+Jtg+fmPB2ts1DPoPIUwwTiy3z9ZH24Q6yVQ/+0pWP3LByVnGzZFcOUpt7Y7oEawn3Jgz0dCfkh/MoPbXJ+uMVmGUOtvFZBDV94x7rvlwhl/zJTfDeTTZZJg==
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
Date: Sat, 9 Sep 2023 17:29:09 +0300
Message-ID: <20230909142911.524407-7-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230909142911.524407-1-parav@nvidia.com>
References: <20230909142911.524407-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|DM4PR12MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: d0aa17b4-2dfb-4390-513e-08dbb1413a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NgrbGC7A86Uu9GOLEX7F6bMfBPLe6euyVvgJbgkv1o/xRrzX4KIfnAJoZATkXZUQM4hEwW//1QBceRiqizRV2efSFjdb5UEl5ue2wbiGq7+y5Nsg3wiT3LHBvTPQ7OqIPblHiVYuwD6Fzv5CWp09oLlUULrRVpmfDIy22vR7F/sKtMY4rUvtRw9m1oobO8bWMyDa23lbBouDUTFjI4VhLicvmKvioDTmeE4MSVA44SfE2eN59TbXDXQuYvM+dScs1zc4ZkKvsrSdm2O9+VVKrqwLkh8jTcvfxVNmkYehPdi+B2mfL1qbyHRBbhub6y30cM8fIPItw8lqmLDrex4neaTLLHa9jc/qBUSHEoP41VbQc5l4H29eP4wwfr51XA6tsDCMVSSrqJO3yRLvy1WTkhkOSNqlSI+nluhj5HJ80Qv3r46KxIqq63ZL0IJqcTIbHcAAvOM2qGqrSNwafQD/zKzJvAx99pLMnQmEZeZctSwQy6Dg5IWk4y9joF+qof3lppTyB6gYuzmEBGQ1zBVuQJrUUBleJlYfK6Zo7UxBZJN88ZkpBUAthY2xP0i2YTFAcPvi/HDBSAWV1wilUa6hhuNKSpfmKhPU8r4OFttT96whMf1VGimJNln2A/8YUcyIAmO3n6Ltb6y43S7+UxM0qRyoerX9XwYtO88ANeficrFzSjFZ9jESUv1qUyR2s4EjvZzHOI31lfqpu3Q2XPEPvaxY7rm30GpriU03VKXj6FTD/c/p2IC6wZNoI8TKlHnT
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199024)(82310400011)(1800799009)(186009)(40470700004)(46966006)(36840700001)(5660300002)(8676002)(70586007)(4326008)(8936002)(41300700001)(316002)(54906003)(70206006)(2906002)(478600001)(6666004)(110136005)(1076003)(2616005)(107886003)(26005)(336012)(16526019)(36860700001)(47076005)(83380400001)(356005)(426003)(7636003)(82740400003)(40460700003)(36756003)(40480700001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 14:29:51.3232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0aa17b4-2dfb-4390-513e-08dbb1413a83
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5915
Subject: [virtio-comment] [PATCH 6/8] admin: Add theory of operation for write recording commands

During a device migration flow (typically in a precopy phase of the
live migration), a device may write to the guest memory. Some
iommu/hypervisor may not be able to track these written pages.
These pages to be migrated from source to destination hypervisor.

A device which writes to these pages, provides the page address record
of the to the owner device. The owner device starts write
recording for the device and queries all the page addresses written by
the device.

Signed-off-by: Parav Pandit <parav@nvidia.com>
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

