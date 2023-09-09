Return-Path: <virtio-comment-return-7293-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC63EEB572
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 210801922F6
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0E28998666F
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 00FA4986633; Sat,  9 Sep 2023 14:29:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E4972986647
	for <virtio-comment@lists.oasis-open.org>; Sat,  9 Sep 2023 14:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LU9/3caJt7c5s+MjALBEyiobNN3uXM8qPDPl4NtPXpJb7BoqjQKzbfvqt/lvn+2ye2X3d4XtLQWAH/zKbmWaheAwPhonigR/l4lKttoBFsKlzD0tddQ5rNFjEaXucXtYrocSu2i7e+FJ79RQ3pIA7Jy0Z1CZNPpe2sF1gbpbbqf42UYAXKNkMuw2xeAr4x/vLGaIpybd8PsM8V66vO+DDo4OR2AomzDW+SbJHBYCJTMehg9iIqi+KDMgWHvu2DfeVD7tR6UoWJ32dKKHj64KDT6NwHs15CUoqWPolYZPW8ABrDKyCkCPHEo1vTgZi7G3A+M7jSchGLZm58WQ2VU7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fxi0uoX79Z3Ljr4b7K0WBVBi9JDhvaCtYPSVfunWjr8=;
 b=ZdXGKv99flEXTUHsojg3s3nx/8hq9v7hdm0ncV8YES4pYgfZsQW7iH70dCdO6snc7rKwzY7H8UyTGLifV2H46OhOt1GeSddIQG9XQJQKtF+Fm/BewlWs4wO0dmpC9NFi1J60nqonCkHMn0P7jD4jItPMPmmzhN5cI6BriA0A6jgFk0M7UxsJiasTdINHyN7eSMSP/f9P3v1g1ISoGTyCoQXSkr1LUWj4TDAcZsjGCh4OP7K72cYIPcCXGtSJkMbUT4we4GFExBtdFB2/nQxQ6eZZHPXP2jK6dGE+8f7gjg46oGzoK9D8ZR0KFg0ZGKXOsZQvkrD4WgjCbtOUywCITA==
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
Date: Sat, 9 Sep 2023 17:29:08 +0300
Message-ID: <20230909142911.524407-6-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|CY8PR12MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 286e6a68-e6a1-4752-184d-08dbb1413ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5NnSp/R8UKq17EbkKVVPdbirzt6rEqenUI2ceqcqiZ55ah+ywmt3wS7ICjgo7nRC/LMAEaQitmFYA/7E85QaFrjjrtFiwk0/ufsZWcSxbtEkmoD+wxdxacM2gyWfwurms6RlvAg2DKZP7jn2byc4uLtlJTVAU3L1hRYcFdUe77auGzl2pThXxhSGuzDxsEZ6/TtDVuczRGa5Rj9/s/0IV0TX9Ro2SsUIKbi7Hn5rHbyL6Glh3AyDlkLGe35CvyTXlZtp/scApXBVgL53r7XFpskKAGQQ0FmCJszymVPu2xqqjOMfxSyCBH4gqfZSZM89LjrFrVTYg/Sh+SauFuc1v6Jy+0jGZSGzOR7+G8UOsT3vSH6kRXNMIp0OHsdxClkxfmRFFeAJ8FV2LVvV8hjCkiPnflM+2L9zj3dOko6H9I68OHMXPKg6jziaUtFj2cCWrPqS7lkHYCufPMarbMlDtvUrJSMJJpM8WbZCFZnoaXpooV+/azi+vyqtjs/+HJkg9n/NATXCAlLq6jrkJHBDTXZvB49D95CoHUJaYicImIsbjsC7UP4+Wep6ZUZ872yYQsqViAxpdl3M+Vs7oRTtsBSK07QybNeAuX16DefF+iZ98TzDYMx2giq3Imw8zajBCVjbRDReDToPTSFiiJZ8dcq7Fx6yWgqHacmIGMSP3qhwbc2lEb+2129MGP7PkrwRYyXhKu39ADBkb/dH9cePFucUJj9YVcCVxeVDDuX/xOg=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199024)(1800799009)(82310400011)(186009)(36840700001)(40470700004)(46966006)(4326008)(8676002)(8936002)(16526019)(26005)(2616005)(107886003)(83380400001)(1076003)(5660300002)(336012)(47076005)(426003)(36860700001)(40480700001)(41300700001)(40460700003)(70206006)(70586007)(6666004)(54906003)(7636003)(478600001)(110136005)(316002)(86362001)(82740400003)(2906002)(36756003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 14:29:52.0250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 286e6a68-e6a1-4752-184d-08dbb1413ae0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7516
Subject: [virtio-comment] [PATCH 5/8] admin: Add requirements of device migration commands

Add device and driver side requirements for the device migration
commands.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin-cmds-device-migration.tex | 102 ++++++++++++++++++++++++++++++++
 admin.tex                       |  14 ++++-
 2 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index b7bfc09..88e1af9 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -291,3 +291,105 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 the device returns new device context entry. Once the device context is
 discarded, subsequent VIRTIO_ADMIN_CMD_DEV_CTX_WRITE command writes a new device
 context.
+
+\devicenormative{\paragraph}{Device Migration}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration}
+
+A device MUST either support all of, or none of
+VIRTIO_ADMIN_CMD_DEV_MODE_GET,
+VIRTIO_ADMIN_CMD_DEV_MODE_SET,
+VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET,
+VIRTIO_ADMIN_CMD_DEV_READ,
+VIRTIO_ADMIN_CMD_DEV_WRITE and
+VIRTIO_ADMIN_CMD_DEV_CTX_DISCARD commands.
+
+When the device \field{mode} supplied in the command
+VIRTIO_ADMIN_CMD_DEV_MODE_SET is same as what the mode in the device, the device
+MUST complete the command successfully.
+
+The device MUST fail the command VIRTIO_ADMIN_CMD_DEV_MODE_SET when the \field{mode}
+is other than \field{Active} or \field{Stop} or \field{Freeze}.
+
+When changing the device mode using the command VIRTIO_ADMIN_CMD_DEV_MODE_SET,
+if the command fails, the device MUST retain the current device mode.
+
+The device MUST fail VIRTIO_ADMIN_CMD_DEV_MODE_SET command when \field{mode}
+is set to \field{Active} or \field{Stop} and if the device context is
+partially read or written using VIRTIO_ADMIN_CMD_DEV_CTX_READ and
+VIRTIO_ADMIN_CMD_DEV_CTX_WRITE commands respectively.
+
+When VIRTIO_ADMIN_CMD_DEV_CTX_READ command is received multiple times
+in a given mode, and when the complete device context is already read by the
+driver, on subsequent reception of command VIRTIO_ADMIN_CMD_DEV_CTX_READ,
+the device MUST complete the command successfully with
+\field{context_len} set to zero.
+
+The device MUST support reading the device context when the device is
+in any mode \field{Active} or \field{Stop} or \field{Freeze} using command
+VIRTIO_ADMIN_CMD_DEV_CTX_READ.
+
+When the device is in any of the mode, and if the device context is read
+partially using VIRTIO_ADMIN_CMD_DEV_CTX_READ command, the device MUST discard
+the device context when VIRTIO_ADMIN_CMD_DEV_CTX_DISCARD command is executed;
+In subsequent execution of VIRTIO_ADMIN_CMD_DEV_CTX_READ and
+VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET, the device MUST return the remaining
+estimated device context size and the device context respectively for the
+current mode as if VIRTIO_ADMIN_CMD_DEV_CTX_READ was never received by the
+device for the current device mode.
+
+The device MUST support writing the complete device context multiple times
+by the command VIRTIO_ADMIN_CMD_DEV_CTX_WRITE.
+
+The device MUST fail VIRTIO_ADMIN_CMD_DEV_CTX_WRITE command when the device
+mode is not \field{Freeze}.
+
+When the device is in \field{Freeze} mode, and if any device context is
+written partially by VIRTIO_ADMIN_CMD_DEV_CTX_WRITE, the device MUST discard
+the device context when VIRTIO_ADMIN_CMD_DEV_CTX_DISCARD
+command is executed, i.e. the device functions as if the command
+VIRTIO_ADMIN_CMD_DEV_CTX_WRITE was never received.
+
+For the SR-IOV group type, when the device context is read using
+VIRTIO_ADMIN_CMD_DEV_CTX_READ from one device and written to the anoother device
+using VIRTIO_ADMIN_CMD_DEV_CTX_WRITE, the driver MUST read and write
+device context only if the device PCI subsystem vendor id and device id
+match for both the devices.
+
+For the SR-IOV group type, a function level reset(FLR) operation MUST set the
+device mode to \field{Active}.
+
+For the SR-IOV group type, when the device is in \field{Freeze} mode, any
+write access to configuration space MUST not update any fields and any
+configuration space read MAY return any value.
+
+For the SR-IOV group type, regardless of the membe device \field{mode}, all
+the PCI transport level registers MUST be always accessible and the member device
+MUST function the same way for all the PCI transport level registers
+regardless of the member device mode.
+
+For the SR-IOV group type, for the VIRTIO_PCI_CAP_PCI_CFG capability area,
+the device MUST ignore writes when the device mode is set to \field{Freeze}
+and on receiving the reads, the device MUST function same regardless of the
+device mode is \field{Active} or \field{Stop} or \field{Freeze}.
+
+\drivernormative{\paragraph}{Device Migration}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration}
+
+The driver SHOULD read the complete device context using one or multiple
+VIRTIO_ADMIN_CMD_DEV_CTX_READ commands.
+
+The driver MAY write the device context before changing the device mode from
+\field{Freeze} to \field{Stop} or from \field{Freeze} to \field{Active};
+the driver MUST write a complete device context using one or multiple
+VIRTIO_ADMIN_CMD_DEV_CTX_WRITE commands.
+
+The driver MUST NOT change the device mode to \field{Stop} or \field{Active}
+in the command VIRTIO_ADMIN_CMD_DEV_MODE_SET when device context is
+partially written.
+
+For the SR-IOV group type, the driver SHOULD NOT access device configuration
+space described in section
+\ref{sec:Basic Facilities of a Virtio Device / Device Configuration Space}
+when the device mode is set to \field{Freeze}.
+
+For the SR-IOV group type, the driver MUST NOT write into the
+VIRTIO_PCI_CAP_PCI_CFG capability area when the device mode is set to
+\field{Freeze}.
diff --git a/admin.tex b/admin.tex
index c86813d..3429c4e 100644
--- a/admin.tex
+++ b/admin.tex
@@ -126,7 +126,19 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x0006 & VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO & Query the notification region information \\
 \hline
-0x0007 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
+0x0007 & VIRTIO_ADMIN_CMD_DEV_MODE_GET & Query the device mode \\
+\hline
+0x0008 & VIRTIO_ADMIN_CMD_DEV_MODE_SET & Set the device mode \\
+\hline
+0x0009 & VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET & Query the device context size \\
+\hline
+0x000a & VIRTIO_ADMIN_CMD_DEV_CTX_READ & Read the device context data \\
+\hline
+0x000b & VIRTIO_ADMIN_CMD_DEV_CTX_WRITE & Write the device context data \\
+\hline
+0x000c & VIRTIO_ADMIN_CMD_DEV_CTX_DISCARD & Clear the device context data \\
+\hline
+0x000d - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
 \hline
 0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
 \hline
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

