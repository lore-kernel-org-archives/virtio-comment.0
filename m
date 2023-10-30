Return-Path: <virtio-comment-return-8047-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F93C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:21:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A419F747C7
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:21:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 99E5E986B45
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:21:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 904CC986B36; Mon, 30 Oct 2023 13:21:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7C124986B7D
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 13:20:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCLoanwPo5rVxt+woEVyWC57KFWpPElfSRAgh+XXcyJqxWismA+0pZE26Fzmgbc+Ke7Glj6FHFaMje6lZX344USHdtpaYkdwUiyZTOtpYfBKDcuUHQOzg/c9CUNaBG8c6X+LXCCedQ04Dra1xLCBM3mASy3OK5THwMEvaTeLizz9xOQi1ZQv6ihRTFw5eVHU6xogW8iyzgCZtOMTcnttsiv8r2l1FFm2PfZsBmLJi8533r8vOzobDcPBOxHwDePsy0oCjuZAoAts43k+jlFkwyFskvjoYLxp0FQCFIwvwd/DjrwB+59Wqs9BqSbaHdm5D3XIV6f1WzcCtvfJIY1iCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ICLRUaFMAdCPRVI/A/nlSVFyYgGAMHHlKQf67BrpoI=;
 b=kqRFl6dJTQV9Zwu1RT6cPsAEJpxG29fllU09iINw3NhqYQLz6DIMcRCsHiX9fHT4mBJctN2R2u4LYE1BY/x3dOPDAY73Iq9/4rq4DTQFkIKNJBUnmLk/OT7gBhhCWnqj7Av89/LH61DwHl+TqmP/47Z2JFoskWN1zZ6QAZyEAfY7swuDgi9OAW5InQJlsJh6OvbM3mPs4PN0ZO2vMyXf3uvZCJIQR7VrGWr4riZduxw940nRlCcNq6lLXk/5XGEGpV24NGpoqX3Y/odGmH46wRwTVmupR0odCR/HEtINMk1pUA63UgfV/T4rws+4OEUDJ6Tep3WbkcO/rU7xvruR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
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
	<yishaih@nvidia.com>, <lingshan.zhu@intel.com>, <jasowang@redhat.com>, "Parav
 Pandit" <parav@nvidia.com>
Date: Mon, 30 Oct 2023 15:19:57 +0200
Message-ID: <20231030131959.1386107-7-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231030131959.1386107-1-parav@nvidia.com>
References: <20231030131959.1386107-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|BL1PR12MB5077:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a663c4-085c-4e77-d173-08dbd94b09d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	URsj26UcLrmTb9o+r5I0qcmZzVl4lkNc/XoL1OJSKH7z46rdbWYc7Jvn0Jr/IRRkXJ07xp59+PrOoatSh/cyTsgVS4fW158ESkN4waO9phr6JPfAdniEJr4bBxvuzM37/Kz2m5tDHQVE72pRQoCNr6rQ1ASmYsRoyYPGZjNhd4b9QC2omjZZB8ODVUE9YKBhtrcFC3paXrqH6SKydQ6krMo3rQ8jt+M50vZE2hra0N+U6PpeBkZBuvzpTigUxRJiJooMnLBduLNBZhlibwmWYCna89hk3MgI0syeAUmmIVa8PPWq28MDvHUgdpulYhy6g6K0O+z94nCgxsM+prPUWaP1Fq8pm2ejS9dNd4dBltnph1obIljTTu21sTDI+1ZzWoNrZgusbgkBodJcixF2ZR0YiUnaenlPUggVzB/LvFoHWnZsfYnR2VuPYObMuyuz5JG9tyi5fnN4qWaCWpOeJa48Gz8LS1/zsXdzEpFrvnC0RfMVkNJOkD/RKiT8DVEDzkJqvJLd63a8Yprakaaeypg+hJu//NIP2CHiUFi7LwunBwn3yJy8BELzMmLFnxu3GeaL22pQbna8Doz5YE8xfXnMhqV3kq5Km+fKKT8dKlo4v+gjEZzo7Ov453aAnwi3Owk7gMYpa9VIwAIm5wtEwD75SPMzdKFKzZGGhU6/uvtjq+fHqhg8mVrSqusdaMYgmJoUzz1MBhmGF9B79MuGw8F9U8CzuN4lRu8ntTz/SB7Ik9847x3yH9rAPEmzxII2A9YSE6XtKWjbImaoSa6Lng==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(82310400011)(40470700004)(36840700001)(46966006)(2906002)(40460700003)(36860700001)(6666004)(54906003)(70586007)(70206006)(47076005)(7636003)(356005)(82740400003)(316002)(966005)(478600001)(83380400001)(110136005)(2616005)(426003)(26005)(336012)(107886003)(16526019)(1076003)(41300700001)(5660300002)(4326008)(8936002)(8676002)(86362001)(40480700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:20:51.2655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a663c4-085c-4e77-d173-08dbd94b09d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5077
Subject: [virtio-comment] [PATCH v3 6/8] admin: Add theory of operation for write recording commands

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
changelog:
v1->v2:
- addressed comments from Michael
- replaced iova with physical address
---
 admin-cmds-device-migration.tex | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index ed911e4..2e32f2c 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -95,6 +95,21 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 The owner driver can discard any partially read or written device context when
 any of the device migration flow should be aborted.
 
+During the device migration flow, a passthrough device may write data to the
+guest virtual machine's memory, a source hypervisor needs to keep track of these
+written memory to migrate such memory to destination hypervisor.
+Some systems may not be able to keep track of such memory write addresses at
+hypervisor level. In such a scenario, a device records and reports these
+written memory addresses to the owner device. The owner driver enables write
+recording for one or more physical address ranges per device during device
+migration flow. The owner driver periodically queries these written physical
+address records from the device. As the driver reads the written address records,
+the device clears those records from the device.
+Once the device reports zero or small number of written address records, the device
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

