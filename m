Return-Path: <virtio-comment-return-7297-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43426EEB572
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:30:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AA8F3217BF
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:30:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A5F88986637
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:30:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9C9E3986608; Sat,  9 Sep 2023 14:30:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6847398667C
	for <virtio-comment@lists.oasis-open.org>; Sat,  9 Sep 2023 14:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2GlpA5vkH2iY/IQ+tqye0Ub3iSuAtLHzaS1AuuI5T0ouaDqhgMjp8lffZJfwhuV6gzwPpc4sSjHxbJ0sjAxFffd0GW9tYIdnn5Mtwa55XEffiGTjyNmeRF/jPnABhiJ2Cn2/21r0UEj2weo2lfxttkMhmssL4YEjFIBw9BoEUrufM3dcNvFUK0uFjsF2xfSdYy369Rn+e77eMrVijJ3OPNrJCBs/1XA1uJcA6bq912MQ5Qd7oNzlE1d4Ig+wKLDeeK8AINnk7WyQrxreN/UWOzBS+x01hlWP8ySoopEssmJ+tN2FHE66QXfGsPJVkMaKbfceNzK0hza1dffHJY4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N77/CrGvsp398V+QYcxdr3Fg79o3KSRtpesY95OhJp4=;
 b=ob7kxg4sc+o9ZZa2EqsKJ+MyJa9JkSt6NNcr2xxIa3Iy801iNDAHsTmbJvMxO1qPZnYuPuxZvvEduXQ7hzEGIxChQdjsWGVGbABEmU1pikGyGcICxoW50HqZ/nFuWnx9rHP1TPBI2i4G+ZlPU2ta8MsmoOYIsWpaYb3vvF8NUfJHFKQDLB7/y4b7jXgSPQFGuYGUvZmOICcorQtHWOOMb5RHCkFJ8GfgjORuyAjfijMwP6lQ8dB2uDhWIxtZ9H2wiDhectbc8s81wwDM+lhXuS1ecy3tkAnxB1G2w7DuHkqpV4kdYSaG0KaGSvDn7/oTzE1ztfTRskdYT9RFjwuq0Q==
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
	<yishaih@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Sat, 9 Sep 2023 17:29:11 +0300
Message-ID: <20230909142911.524407-9-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|DS0PR12MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: 94a1b6e7-5113-488f-99a4-08dbb141414f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KyTP+TzzfWAuf5w05GwXgj0XZ0ptXCL1F+h599DzW5xUYquDYh05qDFCSQTOSwG6447Nr2AYAGrkh6tl+Unz2qBfJG3nsvNPzWEd5Wd2V+aZnuEV7erAe3rJ1DVlJGlSh5lYyIPQRZ+iSd7WCd/YZQ4UHEoSCzCD3PG2hERE0Gsg1Anf0FHSx7uBFkz5sdm8iGFV3WWjUxQp95AEPaFlFoFmaBOzmcG+lw6hqIwLZXSIPMR+wGKpSdYcvRA1udSS7yjbg67EPWFIjif+g7/nSaIUV4nl7CpiWi+JQG10xk3bu3F1KYCoJ5CMg4fVPbKqf9s0NX/woX82vJCdXTLu4sL0KtatCUdhGO92HQ8rfXwsIz304TDvyhLothKD4IlVEqvD2+/sm75LUhm8IhBn3Hz+h0vlwgszf+4GYEkNAG/rjuFGKrKwEcyVYMwQfCMYNq300AelbdKq7oC0TL6syTLmNU6tke0LrpOWMq347sNUhfE107n85Kh2ixxnbdLo9/NJfgEyDY8YJ2yTro2nksGk1m4s76rtnz+63P20Zvb+XV5zFhxXH7poC7J4nBST3Kg+UcJ3a6FoMamwG8BmA+CEIO6aPRK7of+h60EXuci5AbcnKtgEI6yzo0uqX/09qsIYRDo2NJnDEjqIvFzDbyk9RV9q6eGK9M3toxKJif8Y6Olc2YEI+DWa7RF5WtNoTyNk3RycQUbd+qwnT//FDTNikHDiqbGjgpcHL8PkprE=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(186009)(82310400011)(451199024)(1800799009)(40470700004)(46966006)(36840700001)(4326008)(5660300002)(8676002)(8936002)(41300700001)(316002)(70206006)(70586007)(54906003)(110136005)(2906002)(6666004)(478600001)(36860700001)(1076003)(16526019)(26005)(2616005)(426003)(107886003)(336012)(47076005)(83380400001)(7636003)(82740400003)(356005)(40460700003)(86362001)(40480700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 14:30:02.8220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94a1b6e7-5113-488f-99a4-08dbb141414f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9397
Subject: [virtio-comment] [PATCH 8/8] admin: Add requirements of write reporting commands

Add device and driver requirements for the write reporting commands.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin-cmds-device-migration.tex | 36 +++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index 49835eb..09e772a 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -514,6 +514,34 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 and on receiving the reads, the device MUST function same regardless of the
 device mode is \field{Active} or \field{Stop} or \field{Freeze}.
 
+A device MUST either support all of, or none of
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY,
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START,
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP and
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ commands.
+
+If the device supports VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY
+command, the device MUST set minimum one bit in the
+\field{supported_iova_page_size_bitmap} and set non zero value in the
+\field{supported_iova_ranges}.
+
+The device MUST fail the VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ and
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP commands
+if the write recording is not started by the driver.
+
+The device MUST fail VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ command
+if the write recording is not started.
+
+For the SR-IOV group type, for the VF member device, VF function level
+reset (FLR) MUST NOT stop write recording on the VF device and it MUST NOT
+clear any write records already gathered by the owner device.
+
+The device MUST clear the write records which are returned in the
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ result. After command completion
+of VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ if new write record is created
+for the same IOVA range, the device MUST report such a write record as
+new entry.
+
 \drivernormative{\paragraph}{Device Migration}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration}
 
 The driver SHOULD read the complete device context using one or multiple
@@ -536,3 +564,11 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 For the SR-IOV group type, the driver MUST NOT write into the
 VIRTIO_PCI_CAP_PCI_CFG capability area when the device mode is set to
 \field{Freeze}.
+
+The driver MUST NOT invoke VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
+for overlapping IOVA ranges, each IOVA range supplied in the command or
+across multiple commands MUST be supplying unique ranges.
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

