Return-Path: <virtio-comment-return-7765-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E75CDB474
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7D7582AF7B
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 761C6986899
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6B4AB9861CC; Tue, 17 Oct 2023 20:07:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4AA12986888
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 20:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6Sou0lSSilm7Ic5RlXOgNr7U6eyV56MSSgOviOlx8VVNgJdZ2cWM4RzoDEsLSQitHmzgU4HXvSx34FViSWGoOA7qL1LgnbWrTzGcTZm8UsUcSNObxGBg/S+Vmyyrd9hBvc4IoVuxTrgPMuDFvU0Ay58OKXfzVaaaBqkA3Kn2xiQjkc3h3/lCa017Qbh47iryjICHIuRR+PkPIN7f11zW57fJwrjHmHshqxrd/qt/SFijPRMfQ7uRX47wTc9WmA67BjPfS/Oll4jJGjxHc11qbAPeL0NeKr01N6XFI82ZfvL0NA/tVJa3oHB2DEyg349+O4smFmIuLQVoS9vzhoBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htol/1HDNU2phMnOP8MtwvmF5NKa/6t1G4a9gbFQmKY=;
 b=nWI9OxDJ01hFp2wsjESEBU3M0yGkKShuZ8JDZj1u7sRYIPm3TvA4BoHQWSHFTjPJ5DL0N/c0NvuLkm6PSui7ks01aTaGU4e5eFARw0sOK3B4UJR9D7kMHKGdae/ILX6Zh3MtEVpE0ACeU9TCzbUcfKWNj17t0egDCm4X5zFzJfqOp12ZSp5A+rIQ8IDOdZufGhLkFZ7H9mSU+H+aKKvzNnqs4VbJS2dECoGDyfJAOsiUmXNFETblz8BRWKtqbBD/EgcGOzWQOn6aN5g4DeMklw8msyBlqJWeZ2oBu7WcBXN6ceJmCfDJMSuhvCrG23gTczP/LB4cUKdMvRZjRDojlw==
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
Date: Tue, 17 Oct 2023 23:06:38 +0300
Message-ID: <20231017200645.779222-2-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|BY5PR12MB4853:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aabaf16-69b3-4c2b-8691-08dbcf4ca8ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vWeZALWwG70IFh5Qt6jn4w9tH0/a9U6X4P/mTYW0SoANhvgWBoqc2wpHVMtz6x3Z4u666RDkGeIgd7Iv9BlG62wnlVSBJhaXhJ9QYIPfItBz0tJ5SMZSI07sRfEePjxyCeTIVdEOena1FiH5+I0dsyJZQXVqSb/XwYJ9K3x5M4JQ3HJdyUwPAk5bOYaFWznVZo0WixpqUhU/Ynhvxqf+4ZUCnmitNVc8VZKyf5lvC2C413eDnNMd4/l7/sG7aUMGjd8qsgoyWNS8PWFE638nE+BfxWVniBLtft8a8UmT4TlCuf9vA/rM1Wv12T112h93RTFrZKMi73NfO84Z9RxlGAqc2Hq088r5ey/R+2SAfRVrKxZsfl0oSFWJs3fVA5ZVfBg78KyoXGEsjFpRbBoREZc42txtibBoP9U/owIP6B1Zgg9qcbH5SmBs7qkV+X8VsfBAtG2TEy7Q8VmiHRQaVVLXM/9A3in9MdSDdR5B2XW2x4SshBeezNmk1E0fawG22c8yVgHk8dCH/ttgeHQdGXrS9R0oGW5Mzi9NygJLk5opyFQz4kkdF7x3ta5Ei3iSjN8LT4ixkbmDtw9QRVmkxJ28Fb+MF+KhxR3kmewmztilwy4DllAdPhA+GfRjgZFKBjftOerQAtYg29PT67XcieOo+9WT3UfvlXUUx91lIvHHePWzMG3rem+xqR3Qyv98fhqg0YM/lGNNjUicvH4EjKqVr4uleLWzOpL137rtN2dgzX4tmOhbXAxRWk3QsucV6rrlfCcAL/sEDl/5yLC0cDlpT9qAUSNYkgJWX/5VCMQ=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(82310400011)(451199024)(1800799009)(186009)(36840700001)(40470700004)(46966006)(110136005)(966005)(478600001)(6666004)(82740400003)(36756003)(356005)(7636003)(86362001)(1076003)(40460700003)(426003)(26005)(107886003)(36860700001)(83380400001)(16526019)(2616005)(316002)(41300700001)(5660300002)(54906003)(336012)(70586007)(8936002)(8676002)(70206006)(4326008)(2906002)(40480700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 20:07:16.0163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aabaf16-69b3-4c2b-8691-08dbcf4ca8ee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4853
Subject: [virtio-comment] [PATCH v2 1/8] admin: Add theory of operation for device migration

One or more passthrough PCI VF devices are ubiquitous for virtual
machines usage using generic kernel framework.

A passthrough PCI VF device is fully owned by the virtual machine
device driver. This passthrough device controls its own device
reset flow, basic functionality as PCI VF function level reset
and rest of the virtio device functionality such as control vq,
config space access, data path descriptors handling.

Additionally, VM live migration using a precopy method is also widely used.

To support a VM live migration for such passthrough virtio member devices,
the owner PCI PF device administers the device migration flow.

This patch introduces the basic theory of operation which describes the flow
and supporting administration commands.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v0->v1:
- addressed comments from Jason
- simplified commit log to remove wording of flow
- added link to the device reset section
- addressed comments from Michael
---
 admin-cmds-device-migration.tex | 95 +++++++++++++++++++++++++++++++++
 admin.tex                       |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 admin-cmds-device-migration.tex

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
new file mode 100644
index 0000000..d172130
--- /dev/null
+++ b/admin-cmds-device-migration.tex
@@ -0,0 +1,95 @@
+\subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device / Device groups / Group
+administration commands / Device Migration}
+
+In some systems, there is a need to migrate a running virtual machine
+from one to another system. A running virtual machine has one or more
+passthrough virtio member devices attached to it. A passthrough device
+is entirely operated by the guest virtual machine. For example, with
+the SR-IOV group type, group member device VF undergos device reset
+\ref{sec:Basic Facilities of a Virtio Device / Device Reset}
+and may also undergo PCI function level reset(FLR). Such operations
+are in control of the guest virtual machine which must comply to the
+device reset requirements and the PCI standard; at the same time those
+operations must not obstruct the device migration. In such a scenario,
+a group owner device can provide the administration command interface
+to facilitate the device migration related operations.
+
+When a virtual machine migrates from one hypervisor to another hypervisor,
+these hypervisors are named as source and destination hypervisor respectively.
+In such a scenario, a source hypervisor administers the
+member device to suspend the device and preserves the device context.
+Subsequently, a destination hypervisor administers the member device to
+setup a device context and resumes the member device. The source hypervisor
+reads the member device context and the destination hypervisor writes the member
+device context. The method to transfer the member device context from the source
+to the destination hypervisor is outside the scope of this specification.
+
+The member device can be in any of the three migration modes. The owner driver
+sets the member device in one of the following modes during device migration flow.
+
+\begin{tabularx}{\textwidth}{ |l||l|X| }
+\hline
+Value & Name & Description \\
+\hline \hline
+0x0   & Active &
+  It is the default mode after instantiation of the member device. \\
+\hline
+0x1   & Stop &
+ In this mode, the member device does not send any notifications,
+ and it does not access any driver memory.
+ The member device may receive driver notifications in this mode,
+ the member device context and device configuration space may change. \\
+\hline
+0x2   & Freeze &
+ In this mode, the member device does not accept any driver notifications,
+ it ignores any device configuration space writes,
+ the device do not have any changes in the device context. The
+ member device is not accessed in the system through the virtio interface. \\
+\hline
+\hline
+0x03-0xFF   & -    & reserved for future use \\
+\hline
+\end{tabularx}
+
+When the owner driver wants to stop the operation of the
+device, the owner driver sets the device mode to \field{Stop}. Once the
+device is in the \field{Stop} mode, the device does not initiate any notifications
+or does not access any driver memory. Since the member driver may be still
+active which may send further driver notifications to the device, the device
+context may be updated. When the member driver has stopped accessing the
+device, the owner driver sets the device to \field{Freeze} mode indicating
+to the device that no more driver access occurs. In the \field{Freeze} mode,
+no more changes occur in the device context. At this point, the device ensures
+that there will not be any update to the device context.
+
+The member device has a device context which the owner driver can either
+read or write. The member device context consist of any device specific
+data which is needed by the device to resume its operation when the device mode
+is changed from \field{Stop} to \field{Active} or from \field{Freeze}
+to \field{Active}.
+
+Once the device context is read, it is cleared from the device. Typically, on
+the source hypervisor, the owner driver reads the device context once when
+the device is in \field{Active} or \field{Stop} mode and later once the member
+device is in \field{Freeze} mode.
+
+Typically, the device context is read and written one time on the source and
+the destination hypervisor respectively once the device is in \field{Freeze}
+mode. On the destination hypervisor, after writing the device context,
+when the device mode set to \field{Active}, the device uses the most recently
+set device context and resumes the device operation.
+
+In an alternative flow, on the source hypervisor the owner driver may choose
+to read the device context first time while the device is in \field{Active} mode
+and second time once the device is in \field{Freeze} mode. Similarly, on the
+destination hypervisor writes the device context first time while the device
+is still running in \field{Active} mode on the source hypervisor and writes
+the device context second time while the device is in \field{Freeze} mode.
+This flow may result in very short setup time as the device context likely
+have minimal changes from the previously written device context. This flow may
+reduce the device migration time significantly and may have near constant
+device activation time regardless of number of virtqueues, resources and
+passthough devices in use by the migrating virtual machine.
+
+The owner driver can discard any partially read or written device context when
+any of the device migration flow should be aborted.
diff --git a/admin.tex b/admin.tex
index 0803c26..6eeef58 100644
--- a/admin.tex
+++ b/admin.tex
@@ -297,6 +297,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 might differ between different group types.
 
 \input{admin-cmds-legacy-interface.tex}
+\input{admin-cmds-device-migration.tex}
 
 \devicenormative{\subsubsection}{Group administration commands}{Basic Facilities of a Virtio Device / Device groups / Group administration commands}
 
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

