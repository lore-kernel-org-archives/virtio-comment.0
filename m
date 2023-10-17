Return-Path: <virtio-comment-return-7766-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64FCCDB482
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 285BF7BAF7
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D313A9868C3
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C73BE9861CC; Tue, 17 Oct 2023 20:07:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 77129986880
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 20:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2RU5LBcdhkbTsK7l0Nx+YsFCL3xgTnSFlqOOQ0Q7El7bv6pE4X3JKjYMLfda9pRxM+cYmDp5ccQnH52XzLhJdRWJtfmK5qWgmxEQNzx9LUDqQRLjL9DXgPfUTy5dgtphPbYsYaJB7lIYR5wLZnYe4XNoF3QVD03qx/W7HdH+Ga6VJhEfECFT4HpUbxgZI5O1NFOyJbGsmD5QG2TehdqgJYD+6pIbvEx+HBVkypwFngQvBGoVsuvHdPB/eWjjaPlRBNuyDtU6Bw0x+EPdPKCVhyHyB2yP/Rx8729kBI6YxdBBilNiPwgR6hXpSveZ4VIkUmd1htAmNCUjze1vMQUkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gtBAl4tiPSM1bVvwH/Nomw/kBzuj5/Yy3YwgUqo65o=;
 b=R3g0ND9AYJWv5cEWBp3c0MYkjXvcDphxO92QwJiTPbPdK+pOPiylj7FckFBf/pEVW3chMvr99dbnj21HYOTTxsAGMgnyVU0ZQLfHQxe9Fix3rk2Orau5JJLHZjt5ZQBuTrNxH9wP0SaBDqqNBbDzo6wDht5WFOdZqcpRMEMdPcT+/In1CNMQ+7F9ICRQ9+Yjp8VMUAonrSaS3GhAGKZV6ura4RgrIJvfvsmJx+TBPZsa+UchjBwdbl7QD5mET0lmL6yLf+Ofgo9TioEasyOLLnmYF0qOIv+eMXGmPg9eJZLJdx/XfM2nWtnSmQ9PgfpEjY2cA/hTar8G0WDeEoErtg==
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
Date: Tue, 17 Oct 2023 23:06:42 +0300
Message-ID: <20231017200645.779222-6-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|SJ2PR12MB8652:EE_
X-MS-Office365-Filtering-Correlation-Id: c7139d4f-9d8c-4507-1ca2-08dbcf4cafa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gxd+HJ2ExQIpUj/F54zaR9fBfAH891oiYB471hhVyL4hEhNaY2g0Ji2WLgdmPuu4wtkdfYGzKxkMNJOcf4ZVsYZCbZtQt+uCoBz3eqb+w/soQPoh12XsBglfRPUmht2NtM7jbPzs7bwXYiUPekkAWjFiYQbWm9115RetyYXyQnMHZQDw3UwWawQk5sBJ6X/sQIH736FmGCule3m+pTbrCOAp7+1D9nN2j3IhnUl8P2QkV/6nwi0dMtNkXhqqAkE62ZU/nygTq5jg+OdPkxxKMea35/ErlJoF+1AAzWR9MaXnO/UYKVnpJeHzLLp1YKIi0hpNAg4gBro+mTeiQVddUWDHomnasnY+l8pfCFa+/8deBS8cEJ4vnG8EryRgNJc6+zMO6xuFfHeS7Gx1J2jHTDNpUvnZrGEG851lzY782Usu4+i0sUsNId7ZJnx1lb3AHx+sfUl7mWVY59ARmOnRuGbQhd7p8yMgESFAE/kSwrwl78hnFrZkxSKrLfENeb77uYVP14Ui8jhaFU/vOqDC5J8cjy6TAfVMVqvEJfzE3r8C5cM+CtdZULqUgZ+j4+D+MYUTG6cg9TyTMSTg0y9EELM/Z16TrFVJ68rV+gfUuqURe2sS8edQaA/lij+4w4E+ziYBfSI0nuF+qTUjMubu9JNorbpdcZcrhYLgQ1CpW5cQOLnYEt1AsH6mc1K9HkSFXtowKiBXh9RisvDb5fLrMOoBv0vGWS9i7nTcinLOK9s3IPDWlPyTogwR4FVbJxY3P0Kz/cqKsF6rIiSYLgjotQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(316002)(966005)(40460700003)(70206006)(70586007)(54906003)(110136005)(16526019)(2616005)(1076003)(426003)(336012)(107886003)(26005)(47076005)(83380400001)(40480700001)(356005)(86362001)(7636003)(82740400003)(36860700001)(36756003)(478600001)(6666004)(2906002)(41300700001)(5660300002)(8676002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 20:07:27.2283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7139d4f-9d8c-4507-1ca2-08dbcf4cafa2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8652
Subject: [virtio-comment] [PATCH v2 5/8] admin: Add requirements of device migration commands

Add device and driver side requirements for the device migration
commands.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
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
 admin-cmds-device-migration.tex | 141 ++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index bbe5902..5cd9ec7 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -324,3 +324,144 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
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
+\item the VF device MUST respond to commands
+VIRTIO_ADMIN_CMD_DEV_MODE_SET, VIRTIO_ADMIN_CMD_DEV_CTX_WRITE and
+VIRTIO_ADMIN_CMD_DEV_CTX_READ after the VF FLR completes in the device, if the VF FLR
+is in progress when the device receives any of these commands.
+
+\item the VF device MUST respond to commands
+VIRTIO_ADMIN_CMD_DEV_MODE_SET, VIRTIO_ADMIN_CMD_DEV_CTX_WRITE and
+VIRTIO_ADMIN_CMD_DEV_CTX_READ after the device reset completes in the device, if the
+device reset is in progress when the device receives any of these commands.
+
+\item the VF device MUST respond to commands
+VIRTIO_ADMIN_CMD_DEV_MODE_SET, VIRTIO_ADMIN_CMD_DEV_CTX_WRITE and
+VIRTIO_ADMIN_CMD_DEV_CTX_READ after the device power management state transition completes
+in the device, if the power management state transition is in progress
+when the device receives any of these commands.
+\end{itemize}
+
+The device MUST respond with an error for the command
+VIRTIO_ADMIN_CMD_DEV_CTX_WRITE, if there is a mismatch in the
+device context field length between the field provided in the
+VIRTIO_ADMIN_CMD_DEV_CTX_WRITE data and the length of the field
+in the device.
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

