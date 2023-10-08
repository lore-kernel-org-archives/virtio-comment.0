Return-Path: <virtio-comment-return-7615-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898B4E95A8E
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ECB797C3C9
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E77ED986561
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DD6499864AD; Sun,  8 Oct 2023 11:26:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA5B19865B5
	for <virtio-comment@lists.oasis-open.org>; Sun,  8 Oct 2023 11:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoVR8+HbpT9UBnVWKWHAj6e6DOmOfp1zbiURLFjps5eeMlo7w3h7ntSkTqCCuZYs05vl/41eA+FAFAMwHKsngdfbG+MHVjkI7obrSa6BOkfOS3FFC9mupzsmDMtvK9HFTVPQbtlCHOiPDNUrNl7ozqB84cVBgn29EXCJkiju57NRmbQojyWgCp0bFE6ZokY7JLZT/sDmP85girdLwONrNQicWCmVuUX2x7Dn87C//QVp+Jm7BBw2+QiVrYP7LZRqAXikTk8etogYsjUfqWkpuZz9cOw6et9TVaBM3FtbolH3uE8Q6EZP//k+TKQ48zShoLtBT4OfCYOQtvNK4s+EaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmGJ4yHj12KyLE+/q2jybvrZeU4MzEmfX4QseP1ZL1U=;
 b=VRFdPYvi+mmCA1TbUue6TgWMhDo/H6wLyxMp+iW0+Xr8kQzfimMK7suUYAKW3bBv16PcIXYQATerD/07sx1W2AtIojyMzqPqdCa3fJw9QE7dWyqUDM1+joyc/aXx1o9rLCbDGvNFkHS8lGGpCFoRTYWp6GV9malomgOnBn7PVY32FfQ3VEfAOUkpVPb3Ah8NrPSgYWFW+ixi/ii3RacKmpslx0EP366g2XCLTvy/OtYib96D+hept0hrelmnNM4gzbOua144baF1MV5At/CEItF6fHC7zPYB/nksz8bdzKdpxCXHUbyo7l8GOIT2oMyQnMKw5cC/kcNahgT1xv2ZYA==
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
Date: Sun, 8 Oct 2023 14:25:52 +0300
Message-ID: <20231008112555.473895-6-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|DM4PR12MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: bda8310b-4de0-4eff-9524-08dbc7f16b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NyvzOs3LTgZQ61W35mFrEeNduaICo5xJmlQcjj7R+ws/58c0ykmDh5CgXltBN4MP1g8e9yVhJkkE+3zCRMhHz6+mcr2qe2KgFitCbzMfjPj3vBBIoCHe/SJVbtye2THe3OAQK0loVZK0NOnE6E97E42ecwbnB0QbsiH0gUu+tFZrpe7Ky88asvLLzFsYocq+HjW30NXV13VPgu39hbnWgosI0jd7HCK7kFOvb76cieXbiuO9yrALvRT23odhG9V5A5CQFrALNoyD8tIQyuf1117Rk8kuPiNg0rqFdwdlbEnaQbBRzXwYY56jERNunhzypcFJ+nwATAs4htjIOec96Kc5B+hNGB6n9R5Omxc3lBv9QrH+AmSa7vzfJhPw4617M1btjVnmnQK43UlEhvgVJFGV9RQp3lsNQNxLn3P7uakTY1vFDqIcLuqTzamKTfi9lHKgYGn4fGhIVsENHumfX6yn0HdH7pv2D7buYoBPtwTiJmZnBFk/uA+VRDD6c034ciE4WAwRW/kWFOyX3QPJTVbSzrGKjkcqksxKXM7wtn/4UBRLyyc/QhS1sIMxKGimjnemK53Ch/41vDWv6wwkKn4Iu0yCgxsNUQdsUrL/fui37nmFXNtqLmZwSLeKLxbFqo6UW5buKXft+mD5wAh5IFAGqv3mkAtIldRkxxQiTkPZXuVFDOaQYu61BdPSDpXlK0T2AG5nrCZ+B08b8b8uNEzjf4Z8C0Z7YdQKNojCwAhFIL3pLsKeSjkPhNxseB7hJSblAaaewmLg+d3bhwi5CA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(83380400001)(1076003)(107886003)(2616005)(336012)(426003)(16526019)(26005)(47076005)(36860700001)(54906003)(70206006)(70586007)(110136005)(316002)(8936002)(8676002)(4326008)(5660300002)(41300700001)(6666004)(2906002)(82740400003)(966005)(478600001)(36756003)(356005)(7636003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2023 11:26:30.0715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bda8310b-4de0-4eff-9524-08dbc7f16b2b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6567
Subject: [virtio-comment] [PATCH v1 5/8] admin: Add requirements of device migration commands

Add device and driver side requirements for the device migration
commands.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
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

