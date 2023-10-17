Return-Path: <virtio-comment-return-7769-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F812CDB482
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D52B3C6222
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CC7789868AA
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C15B8986883; Tue, 17 Oct 2023 20:07:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 96BA39868B2
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 20:07:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKUFnD2vrdD0FpzRd3Vsif7ZKZvwib9FMI0LntXpd2+WPFsF/e+PEnDS74Pv/IuuWBU60ZzVchzT8FQidD6ySDP8ZVi54IqYqEh3sdzFLNvzEaKxxNVBsUn5x8Kk8ySYVBZKFdA8RG+0r95Ngajq2t0cTzv0OrpCHvJEd0IdWveqHbOS7Y2F1NxNmOfHOIpaVL63ZKYXj3k2VpJS2g+P+ApmoiDSgD8PmgV7Iuuf37QI6GxvS0DvF0BvJqNZCPwzH1D7K6/SYPMoa489X26UJsrYKxXI1m2QaPisV26cstO31MPGZxSiOrVU6m05k7n/Po8ndTyjpV4hOApHtx0XmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtD+lHsTuKQFw23COp/tRr/TvarPeHgvUFx338UrJfM=;
 b=SNeMVCy8jXokIPHCHRHJ/Sr1UzFtzrR1VyFXPHSritoCbtcy+WfeEKJgdM1emCa0/gOMRMU0JAfOQastvWeKyk1vnxtKxb7lKZ82u7TT87zZ7zw0Zp3fMED98FCQVJxqyLtcxWRp7l3WpCDsHEp4DMY7az3wTOpZ2PRI35vs1drHhlkUmW56J8lsfzzcefulvyt5OfnCZHKVEkNIAQ0oRHRF9tX1PR/NFFuDnsT6sJrpOWD6MY8iAdbZB3A+WA2hY3KmA4RT049M4Cu2Klrd/2KzK58Bkl2c5CzPQN4gmtKrh7tGP6XaQ+EGoLWcl8LgSHFMIuOiS3f8ZoVg077dzw==
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
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <maorg@nvidia.com>,
	<yishaih@nvidia.com>, <lingshan.zhu@intel.com>, <jasowang@redhat.com>, "Parav
 Pandit" <parav@nvidia.com>
Date: Tue, 17 Oct 2023 23:06:45 +0300
Message-ID: <20231017200645.779222-9-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|MW4PR12MB7432:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa59f03-5818-48e1-17e2-08dbcf4cb8ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9KVGaxQ3/46uYzYu3lIbj5ZFEgT+NTEF2aGVJgc97sy45STsaoxv6biCqTGb0pxgOibgtIXI2WikGFcL2GU4RhtrdAsrYrgPmPk4KHzIypeK9hyikSr840/K31GYANVv0mA4Q5CiFYrqMtPnxkzlE0BgOqq4LOTgrWD8sILitvimTBUUx/vSYIvGUMWcvK79yQfpIC+Gmi17SxZXLmzB40f+TgAt4ncZZyG229vxiDfauCIHZ0XX/jEP+ezZkbFYK04i6g53YIkMec5zHulrjjcNkNesqlBaLc8c+GOWfB6mElGKe6t10fzoLb21jaQ+86mIQYzmf+mslvs7ErDogZ/YQPLjhNfb7GIDocJM981/xOVaukMzSBRDWqcTh10hXBkesw9jmiq//rPt+z0JJwqUSFNDdrr1PTAKbR5tRuPORxBdehchW3ahJCUksIDhqAx28qdKT1MbhWrnGpTUxGSR036BNB9G2JsI/HEPbllcC9REg/mvg08U7r1jNRoPToYOlXjBIwlsvhMn+BORsOBIycpkcSE7uEb/T+D8PcoJCXJ5jeYtRaDW9v9XeTj9+Vb+yyS+1dxB0w2FyBxgKiHUQc8uXMS/T4aJ9o9LkUbM88trOOj1j4QeYFa0ZwryPrBgGBQ/yfctJlRRWMrjyEZTV2jgvhzf1H7l9qLYGR2y4YuxkGg+apEGYcYAGVerLHhrqcXAf7LyF5mdF2GtDzTKZAK5LtkXzq+irQrp1qK/z6BqaLoKlavvvj1KScpKtb1aR7FACAgyfXtmS9RRoxQS/L/VyyPQg+MfdZMk7hk=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(64100799003)(186009)(82310400011)(1800799009)(451199024)(40470700004)(46966006)(36840700001)(966005)(70206006)(70586007)(478600001)(2616005)(1076003)(426003)(316002)(110136005)(107886003)(16526019)(54906003)(2906002)(8676002)(4326008)(5660300002)(41300700001)(8936002)(26005)(86362001)(82740400003)(47076005)(83380400001)(6666004)(36860700001)(36756003)(7636003)(356005)(336012)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 20:07:42.5585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa59f03-5818-48e1-17e2-08dbcf4cb8ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7432
Subject: [virtio-comment] [PATCH v2 8/8] admin: Add requirements of write reporting commands

Add device and driver requirements for the write reporting commands.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
- addressed comments from Michael
- renamed iova range to a page
- removed duplicate device requirement
- allow stopping write recording multiple times even if it is stopped
  so migration driver can start cleanly at beginning
---
 admin-cmds-device-migration.tex | 36 +++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index 992d6ec..01826c7 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -581,6 +581,34 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 VIRTIO_ADMIN_CMD_DEV_CTX_WRITE data and the length of the field
 in the device.
 
+A device MUST either support all of, or none of
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY,
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START,
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP and
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ commands.
+
+If the device supports VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY
+command, the device MUST set minimum one bit in the
+\field{supported_page_size_bitmap} and set non zero value in the
+\field{supported_ranges}.
+
+The device MUST fail VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ command
+if the write recording is not started by the driver.
+
+The device MUST complete VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP command
+successfully, even if the write recording is not started by the driver
+or write recording is already stopped previously.
+
+For the SR-IOV group type, for the VF member device, VF function level
+reset (FLR) MUST NOT stop write recording on the VF device and it MUST NOT
+clear any write records already gathered by the owner device.
+
+The device MUST clear the write records which are returned in the
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ result. After command completion
+of VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ if new write record is created
+for the same page, the device MUST report such a write record as
+new entry.
+
 \drivernormative{\paragraph}{Device Migration}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration}
 
 The driver SHOULD read the complete device context using one or multiple
@@ -603,3 +631,11 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 For the SR-IOV group type, the driver MUST NOT write into the
 VIRTIO_PCI_CAP_PCI_CFG capability area when the device mode is set to
 \field{Freeze}.
+
+The driver MUST NOT invoke VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
+for overlapping page ranges, each page range supplied in the command
+MUST be supply unique ranges.
+
+If the write recording is started by the driver using
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START commands, the driver MUST explicitly
+stop the wrie recording using VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP command.
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

