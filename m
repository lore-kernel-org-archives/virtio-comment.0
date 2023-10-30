Return-Path: <virtio-comment-return-8046-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64131C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C75FD71C8D
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BB8B7986B3C
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AFCC8986B34; Mon, 30 Oct 2023 13:20:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A28DE986B36
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 13:20:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xpn8+aSCIiuoe8zVrzfSOStjtyxTSxYHW+bg2o9qQdE+ov8J3ymbyAmKtSgQC6as5IGae5gBWWzIzWo6RhwCOYPnu+m74hv12ezZpLpZ+SwNypS21/Trm+bqMbentBK2lKSjKHI0CsCc3C/AifVKNXiEFyzgb7kKEJTUenOvqfd3FIVGfPSUHcQlLwGUpjvtBxtnErL4mfI3RQl1ZXlLQ44NqD6+Nw62OS4TXh5fOQxKhNr1qNnjWI7Kgp96cxB8JulEgVgDtpcrQqNlN17ucsGfeYRyVlAFTkeMD7koKLfw3Uyr920FXiMI9JcZB9BT0TrYZp1CcDl9Ojh33V36mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQ+tD5kiFWXTopo2aId6NZcjcjpML70F2ToUXoTbvFw=;
 b=FXTgktvs+Uiwp4pm8/ql7mnieLpkzSfJ0PLB/Vg2dXz3JlfDMCFOI0yp0hP6PZ3ZqQuhMcdEHdXuyGm10c0MUj636DTkg+SYFA1FdSrBEYIuSpPr5y3jSOEP2tmswHfV8MLH8XuBvmQITxgia7jkQDldxEBMe5EYVxHPO21LsnMz/ZMIsiXJhOVeVqIywHkOXPv3B2GMdBTl6rtBpI2NyZRhcyKhzIoJAuQRBSIN/ibznkeTL1pOScSvSbNuf1NADHeh5vMJ1d61yeewS6SbrFEF6eHWCv0iCIghHhrA8vphF6aRLK+I8jgip+bEMpzPSu/+7FIqfCPbq9PQ75ar4Q==
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
Date: Mon, 30 Oct 2023 15:19:56 +0200
Message-ID: <20231030131959.1386107-6-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|PH7PR12MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: df3e3a53-d77f-4edc-7055-08dbd94b080f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1TxCzGmBE5LlD/a2hzFxqUuPHzzREfQT0jHVQkWT6pngTNUODdBTDh1nkCsKPl/4vlVKnyaX2ZyhTG3EMBacn/67LwIhtOWphE51YvJLQ/c7POJd9Ve+djmuXyRLY7vdI4fQCF24m9jbq1RXy7hfStskG5HUiyp60AVW2gRA9v1+/hnRI1rR7NmgCqBNbFpliUMdE5sIo3zS9+XiWWlAqNGpqKeQqkHKkfO3xRr4js3j+VtCDboqSmlY6rmOdFtSx+W90UT3iaPhP8XBxcH0W36gKWz8jsLLs7q/1kcRo7wp/yXMdd63Pg7kp9eWkjozDGaLxO19nmYicE6N9BGWcYOXafxNRwTwDb5L1asgxK0MW+h5refRg6HGI1K5ypWstztS46bUNPRGls0PS1pOLNX8FPMKkF+9hjeaRtLNcDspyvbRGimJCnjghOlJu/TnEwjnijgOMwrd4es+mSGU924srQbuz+2fdyYZJ436LnqcfReyK7fnyIMbUpMzoZXIJTl3ha7hmK3clnGZSk4lUP5qjNy+fhL+0DyOO2vdS2YOYDebBewH5ftZXYaGudkt/qZVgGN3a0j8tQjXZ1rZOENDDKmvkRn9vh8s1SEKnZstdyEO6VuLWmvC+xq1g3xJj/3g18t5QZJM7xmydRmbObcovMrvYKtLE+u6w7PmKEfek32PZ84QHkNT6iHSa92UOtGBb9TH9iweyIl8JOL+4Sy5sbUvexmfRjjayDfWduT7GfRilXgqEOTY4xj3ExFUkNJcGZj0bozHIrD1uXgqzA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(82310400011)(1800799009)(186009)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(2616005)(1076003)(26005)(107886003)(5660300002)(8676002)(8936002)(16526019)(4326008)(36756003)(7636003)(54906003)(70586007)(36860700001)(110136005)(82740400003)(70206006)(47076005)(41300700001)(2906002)(356005)(316002)(966005)(478600001)(336012)(426003)(40480700001)(40460700003)(86362001)(83380400001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:20:48.2967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df3e3a53-d77f-4edc-7055-08dbd94b080f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5998
Subject: [virtio-comment] [PATCH v3 5/8] admin: Add requirements of device migration commands

Add device and driver side requirements for the device migration
commands.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v2->v3:
- added device and driver normatives for {_START,_END}_MARKER fields
- wrote member VF device instead of VF device
v1->v2:
- fixed spelling from membe to member
- removed device requirement line of FLR making the device active
  as it was incorrectly written to mix operational and admin state
- added requirements to clarify flr, device reset, pm and admin commands
- group sriov requirements
- added description for device config space access in stop mode
- removed stale requirement around pci ids
- made device context write command requirements more robust
  for future and backward compatibility
---
 admin-cmds-device-migration.tex | 173 ++++++++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index c5030d2..ed911e4 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -323,3 +323,176 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
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
+The device MUST set VIRTIO_DEV_CTX_START_MARKER, VIRTIO_DEV_CTX_END_MARKER
+and VIRTIO_DEV_CTX_DISCARD in VIRTIO_ADMIN_CMD_DEV_CTX_FIELDS_QUERY
+command result.
+
+The device MUST support writing the complete device context multiple times
+by the command VIRTIO_ADMIN_CMD_DEV_CTX_WRITE.
+
+The device MUST fail VIRTIO_ADMIN_CMD_DEV_CTX_WRITE command when the device
+mode is not \field{Freeze}.
+
+For the SR-IOV group type,
+\begin{itemize}
+\item the device MUST not initiate any PCI transaction
+      when the device mode is not \field{Active}.
+\item the device MUST finish all the outstanding PCI transactions before completing
+      the command VIRTIO_ADMIN_CMD_DEV_MODE_SET.
+\item when the device mode is \field{Stop}, the device MUST accept driver
+       notifications and the device MAY update any fields of the device context.
+\item the device MUST respond with valid values for PCI read requests when
+      the device mode is \field{Stop}.
+\item the device MUST function same for the PCI architected interfaces
+      regardless of the device mode.
+\item the device MUST not generate any PCI PME when the device is
+      not in \field{Active} state.
+\item the device MUST NOT update any fields of the device context when the
+      device is in \field{Freeze} mode, the device MAY update fields of the
+      device context when the device transitions from \field{Stop} to
+      \field{Freeze} mode.
+\end{itemize}
+
+When the device mode is not \field{Active},
+\begin{itemize}
+\item the device MUST not access any virtqueue memory or any memory referred
+      by the virtqueue when the device mode is not \field{Active}.
+
+\item the device MUST not generate any configuration change notification. 
+\end{itemize}
+
+When the device is in \field{Freeze} mode, and if any device context is
+written partially by VIRTIO_ADMIN_CMD_DEV_CTX_WRITE, the device MUST discard
+the device context when VIRTIO_ADMIN_CMD_DEV_CTX_DISCARD
+command is executed, i.e. the device functions as if the command
+VIRTIO_ADMIN_CMD_DEV_CTX_WRITE was never received.
+
+For the SR-IOV group type,
+\begin{itemize}
+\item when the device is in \field{Freeze} mode, any
+write access to virtio configuration space MUST not update any fields and any
+configuration space read MAY return any value.
+
+\item for the VIRTIO_PCI_CAP_PCI_CFG capability area,
+the device MUST ignore writes when the device mode is set to \field{Freeze}
+and on receiving the reads, the device MUST function same regardless of the
+device mode is \field{Active} or \field{Stop} or \field{Freeze}.
+
+\item the member VF device MUST respond to commands
+VIRTIO_ADMIN_CMD_DEV_MODE_SET, VIRTIO_ADMIN_CMD_DEV_CTX_WRITE and
+VIRTIO_ADMIN_CMD_DEV_CTX_READ after the member VF device FLR completes in the
+device, if the member VF device FLR is in progress when the device receives
+any of these commands.
+
+\item the member device MUST respond to commands
+VIRTIO_ADMIN_CMD_DEV_MODE_SET, VIRTIO_ADMIN_CMD_DEV_CTX_WRITE and
+VIRTIO_ADMIN_CMD_DEV_CTX_READ after the device reset completes in the device, if the
+device reset is in progress when the device receives any of these commands.
+
+\item the member device MUST respond to commands
+VIRTIO_ADMIN_CMD_DEV_MODE_SET, VIRTIO_ADMIN_CMD_DEV_CTX_WRITE and
+VIRTIO_ADMIN_CMD_DEV_CTX_READ after the device power management state transition completes
+in the device, if the power management state transition is in progress
+when the device receives any of these commands.
+\end{itemize}
+
+The device MUST respond with an error for the command
+VIRTIO_ADMIN_CMD_DEV_CTX_WRITE, if there is a mismatch between the
+device context field length supplied in the
+VIRTIO_ADMIN_CMD_DEV_CTX_WRITE data and the length of the field
+in the device.
+
+For the command VIRTIO_ADMIN_CMD_DEV_CTX_READ,
+\begin{itemize}
+\item when there is valid context to respond at the start, the device MUST respond
+\field{field[0]} in \field{struct virtio_dev_ctx} of type
+VIRTIO_DEV_CTX_START_MARKER.
+
+\item the device MUST end the device context \field{struct virtio_dev_ctx},
+with last entry of \field{fields[]} with type VIRTIO_DEV_CTX_END_MARKER.
+
+\item the device MUST NOT respond VIRTIO_DEV_CTX_END_MARKER followed by
+VIRTIO_DEV_CTX_START_MARKER in single command response.
+
+\item the device MAY respond VIRTIO_DEV_CTX_START_MARKER followed by
+VIRTIO_DEV_CTX_END_MARKER in two different command responses.
+
+\item the device MAY respond VIRTIO_DEV_CTX_START_MARKER followed by
+VIRTIO_DEV_CTX_END_MARKER in single command response.
+\end{itemize}
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
+when the device mode is set to \field{Freeze} or \field{Stop}.
+
+For the SR-IOV group type, the driver MUST NOT write into the
+VIRTIO_PCI_CAP_PCI_CFG capability area when the device mode is set to
+\field{Freeze}.
+
+For the command VIRTIO_ADMIN_CMD_DEV_CTX_WRITE, at start, the driver MUST
+set \field{field[0]} in \field{struct virtio_dev_ctx} of type
+VIRTIO_DEV_CTX_START_MARKER.
+
+For the command VIRTIO_ADMIN_CMD_DEV_CTX_WRITE, the driver MUST
+end the device context \field{struct virtio_dev_ctx}, with last
+entry of \field{fields[]} with type VIRTIO_DEV_CTX_END_MARKER.
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

