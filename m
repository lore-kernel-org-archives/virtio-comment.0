Return-Path: <virtio-comment-return-8318-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C6DC4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1B724C6112
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0F073986D17
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 04507986D03; Fri, 10 Nov 2023 12:32:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EB255986D06
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCe7hI4iWrMvses8roGCDYLVFUo1aG9hJ2B9QPpRKF4NVtSxQ7Y5BLdIZjN0gG+YX6R9Blb4tC/4X+YUeENiGsuyNvJe98QdfsocBkB0m2VZ0UBGGSvWYANrFoz1FrWQv2jV+E4moN9e1MqNwL7s6BgQ8rf0w0ec2djqe0/nd4xA9i8c7SdIEEyLoVC1rDMz9GEWBuv1YuYtChbIHcP5r5qbpw2pJRi2i0npTSyfmI3qksKGXuEw3giBm23m8ruQ2H/8LqsDaoPO/6Z7Wquqljdo3xs3QdxH2rNbqDknr5FiHEBuCaCqGeshsnZmhAtmLBQYj6CgbxrdI4SoKdLbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11IqTxE2ACqqwFPrZmqNPT5KlHwACS/fHnCD1XxXM+c=;
 b=Lyx5fwY8A/7uQmMZgrlasIH9EmiHaHcJMBD/hZqBcpGBsgKbIwy4x7GXOVJJ7H+ixG1fb8uE3PuGajuZOA2RrgO//h3t0prh4tIH4+ukUhVW32wx5e6mIDxy6coyfVDNJ6t0FnxOUhtPE4uNsoLG97g83zFejRwJwy2RDroys/KEjgHqwALL8Ww2fKS3Jffx3k8nGlkS4oH52Q05QmwTQ0z7SfUw5QSUmwYAAZqHzwNRGfzcraRXp14EADZXDDCu+yRWPxeIU2UA9scqrtPj/GvUiAjMYaOeH6N0UjZp5HDfkkePZqM4dCzMhWqYAvK/jgd0QVJkiHdSLZQJCpGEqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
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
Date: Fri, 10 Nov 2023 14:31:57 +0200
Message-ID: <20231110123200.2082779-6-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110123200.2082779-1-parav@nvidia.com>
References: <20231110123200.2082779-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|IA0PR12MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e465f3a-1055-4394-4306-08dbe1e924a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PnfgfRF/X1HhIwESvKyQNy6q6D6uLWRlf312wHYiuk/4n7ATsvMTyuBDpVbLa2gOLHTjEw3DJosDbQc4Ju5YZFbBXm0XESVv266IAnCwzChArQCcgndQRzWF1mHo7eTG5Lfk+S76qrNITKocOLmDBkyyAA40NZi+xF+Coid6dwGK61Iajj8jyeaer6ETND2wofS44b95gwhzTQkrkyB5z3GIBu+aTcrzyjBhb8tPBZKbk5M0+ZcCsD0RzDpKN8qWizQKw/wP5hdVvBnzHrHxhdvNLKhcqC6PZopREkPa6cec4DgMIA82cNikDzviyNo76fvOP66mmFfLjwUxeZDtgQsNLIcL4lpcBcTxrZUr8YzRko8oo7ES54z69/kSGs6EQ4DFNAqipjplpAGtF53fE8T3EhaArgNVwnVx0rr7YMu58uM22Z+itllfeSYT2iP8wKO3NOV6SX+LZg/GE9glFxAPOuhD+/OsxDycZSdrXsJotT8TLtvrZTaYIPL6MC+R3iKOs9d6DyRd4hEjiFnoLhdzdiDmsaLaPz99+c09ol4KGXyJvLRhJ6fN3h+w2V6zRQ07vD7hqaIdmumUHWslurFKXEubxsftha2zvLrO9rMIBY24JddH/QffnpMH8UIC8LWu8bEBHdeZ+SGjuRxJI7/QfJ/C+qr9c6peDRcwueTb8ntDrbfwz5UkaCeDKuOkJCilm3oZbGcsomX3MNUe0W2gEfjL8GkYt2XDIaTx5bSkRkHHhhOxbRfPU+NVUFRAwDEB3wADPykBKxPD8lO4xw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(1800799009)(186009)(82310400011)(451199024)(64100799003)(40470700004)(36840700001)(46966006)(47076005)(6666004)(41300700001)(107886003)(2616005)(478600001)(966005)(8676002)(26005)(110136005)(316002)(4326008)(16526019)(30864003)(5660300002)(83380400001)(336012)(36860700001)(70586007)(8936002)(70206006)(54906003)(1076003)(356005)(7636003)(426003)(2906002)(86362001)(82740400003)(40480700001)(36756003)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:32:45.9596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e465f3a-1055-4394-4306-08dbe1e924a7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8375
Subject: [virtio-comment] [PATCH v4 5/8] admin: Add requirements of device migration commands

Add device and driver side requirements for the device migration
commands.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v3->v4:
- moved read context command dependency on output field
- added remaining context size bytes in read response so that
  after the device mode is changed to freeze, the driver can
  get most accurate information quickly to decide when to stop
  reading the context from the device
- relaxed device context formation and processing to simplify the
  device implementation
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
 admin-cmds-device-migration.tex | 186 +++++++++++++++++++++++++++++++-
 1 file changed, 184 insertions(+), 2 deletions(-)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index 50871f4..a429768 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -212,9 +212,8 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 
 \begin{lstlisting}
 struct virtio_admin_cmd_dev_ctx_rd_result {
-        le64 remaining_ctx_size;
+        le32 remaining_ctx_size;
         le32 size;
-        le32 reserved;
         u8 data[];
 };
 \end{lstlisting}
@@ -332,3 +331,186 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
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
+partially written using VIRTIO_ADMIN_CMD_DEV_CTX_WRITE commands respectively.
+
+When VIRTIO_ADMIN_CMD_DEV_CTX_READ command is received multiple times
+in a given mode, and when the complete device context is already read by the
+driver, on subsequent reception of command VIRTIO_ADMIN_CMD_DEV_CTX_READ,
+the device MUST complete the command successfully with
+\field{size} and \field{remaining_ctx_size} set to zero.
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
+VIRTIO_ADMIN_CMD_DEV_CTX_READ after the device power management state
+transition completes in the device, if the power management state transition
+is in progress when the device receives any of these commands.
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
+\item the device MAY respond VIRTIO_DEV_CTX_START_MARKER followed by
+VIRTIO_DEV_CTX_END_MARKER in two different command responses.
+
+\item the device MAY respond VIRTIO_DEV_CTX_START_MARKER followed by
+VIRTIO_DEV_CTX_END_MARKER in single command response.
+\end{itemize}
+
+When the device receives multiple device context \field{struct virtio_dev_ctx}
+in VIRTIO_ADMIN_CMD_DEV_CTX_WRITE command data, the device MUST
+apply all the device context \field{struct virtio_dev_ctx} fields in
+the order these fields are received by the device.
+
+When the device receives same field type multiple times in the
+VIRTIO_ADMIN_CMD_DEV_CTX_WRITE command data, the device
+MUST apply the device context fields in the order these fields are
+received by the device.
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
+entry of \field{fields[]} with type VIRTIO_DEV_CTX_END_MARKER; when the
+device context \field{struct virtio_dev_ctx} spans across multiple
+VIRTIO_ADMIN_CMD_DEV_CTX_WRITE commands, the driver MUST end 
+device context \field{struct virtio_dev_ctx} with last entry of
+\field{fields[]} with type VIRTIO_DEV_CTX_END_MARKER in the last command.
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

