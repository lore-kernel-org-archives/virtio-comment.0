Return-Path: <virtio-comment-return-7767-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E540CDB474
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9FC1A7E2CF
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5E59A986922
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3EFF89868DD; Tue, 17 Oct 2023 20:07:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 28EEF98687F
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 20:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNiPJ4dwKGh6BHI5jgP67YiT+fiPRBCmf/UtSZK9bxG6zrxUU9fbl0P3ZoMvFCGrrk90/iW5Y+lM2CCL25jiOo49Qz5IbobACR0y90jSY1xis0W2IF7Kcbw5wb2QD+soIrLRw5P+yOPN9ra7JQdnO/dMQ0dlEyWxws8ApxN65n3LNApcH/UqiOUpJ9WJ3J+YvYZe0pYLUbZvxodGJuaShk3I1PhC0d+jEh20Qs46zk9x4MK119K1Ehe8b60Prx68eRiK7O3xmsVt6uN9NtBE+ig6xppjodSeLx8r3JvkbnMVt4nHHeSFCkBKx9ApCDDcgHKww+w0jN4c60WwFwHsBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IBzD+USHQxe7FoIbIwwlircFOjozy+cXmAnEpC/STd4=;
 b=Q0i5COP6rlveMaD1YHn6lhv6Pf6abo2MSqzmAp8DpDxmE4Lv9DspWx1bKZ4ktFFmx3RHbKa7oz11mkN1YXeZ3GM6H29a83kfcZw0ToEGzHHsURC6/FWcsuXOcNunhdo5jMJDm1FkItFXpKgxL6BeKPPxvif0hF6iqcR5DrmxNGfiu+V38USZ2f8pUAVHz39w87j44MGJpSAVV3ZcHnuMf1g/pvhqgM1QCNSQaWXFVBas4I7SAxdxww+YjXZwqgrgBQvt7syJeOBJ+JpoCEhI622cAlzI47XooNcfYmWZdXGX2Jf95Yq3qG2wDGmRntGoiP+XOERXc2lTXVU7GQs80g==
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
	<yishaih@nvidia.com>, <lingshan.zhu@intel.com>, <jasowang@redhat.com>, "Parav
 Pandit" <parav@nvidia.com>
Date: Tue, 17 Oct 2023 23:06:43 +0300
Message-ID: <20231017200645.779222-7-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017200645.779222-1-parav@nvidia.com>
References: <20231017200645.779222-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|SN7PR12MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: 2506df69-3185-4236-a791-08dbcf4cb26a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ElgXqrAHtPMgm1L0sQDPYZ5lCgKQEZFVKEGKuAwrIN88q6bxdLtMd+I/RjlYyKbAgmYTLa6OVgNrdOfmwpFRQ0hx5leVinsDe+QD3lbtrZLdNPbFv6ztgXZQWBe/wF0Wj6EX2NhHCLnmFqutmC+FkzoIM1hWYZShMxRXjVyN3qE8uGo66wvV1zg9GeC+doabOlH/uvxRycOUCHaw4E+PRj0moxzylNz7DuIpMrRKbNGL05kFmVGpTzaq6PpJPPo1j2+MWubCMSbPhIrupTP5NNonaiqvITXiIZqDW0q5QitVLxfkHoWdiR5WQhwLYsDMv4zF0JnsjOCqb7KGBRqhQ4bz/KI3t82K8JKJvJgqu8V+3iFdtq9UtZf4/bLcKL/ERIjwhBIU9qjPFAcEkhFsZREAtG5QpHwAeutB7juYBKBeMWuDcJ3DpQ9WIL0MZWgczttukc5mFfTz/DUHdnocx/+wz8KjLdN713iLoe7Isp2NV7ucQILHa72EeBaMTf6COG3NJ3q9ZRBsCn+uQHdV0F17w4wEZuiXLmCbvwP5LykImjcNutcN1MaMLvbTmVSADhjCTwRFCRLWC2DC5k98n71QPDSBKUgmfMfh5eO0EKtgd3XkmD7mzq21WKjugoyqkTxWAtSF8tvfKsTe5ve7tr/lkTlCzpQQ6FFCOzByxMmlxjAXm3jhBjcwCRnHhUSrJyIKaiGkpIqlApmNws8BdTw7y3NGZ8iI/uYkL7YPtWqOYwNSX53b6eYtFwqJsoShhwNtl8yuRVgBov+akoubQw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(186009)(82310400011)(1800799009)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(70206006)(316002)(70586007)(110136005)(54906003)(16526019)(40480700001)(86362001)(1076003)(36756003)(426003)(83380400001)(82740400003)(7636003)(356005)(47076005)(36860700001)(2616005)(107886003)(966005)(478600001)(6666004)(41300700001)(5660300002)(336012)(26005)(2906002)(8676002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 20:07:31.9292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2506df69-3185-4236-a791-08dbcf4cb26a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6742
Subject: [virtio-comment] [PATCH v2 6/8] admin: Add theory of operation for write recording commands

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
index 5cd9ec7..fba3a6b 100644
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

