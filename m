Return-Path: <virtio-comment-return-8043-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB61C4167D
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1B57A1FF99
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 16849986B56
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0CB22986B34; Mon, 30 Oct 2023 13:20:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F370C986B35
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 13:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NR9xEQ218FeWvN3+MvHFrtGsh7RGLGiA/a2nFM4GFk0ABFsgwx2wYqT8xOV8+GOOP7diqtnuwMtKPFW0T7WwwQSywht+xHynxbp2SHbKAmOQGvskwX/NObJr32/8UKON1OfS4qLSoar6YzjUrkhEpjPAdXeiedqpNrhBcknWx3hM5c0Phts6gplVkN1hBVINrEHYAnk3TNNUfVEN2lfTZXqjk3wkJZcW52YsXEd9w53L6S4jog7zd6V6lcsIJ3RGM9WofjFMSXXrysQ+I87nekBe/fqwvAk1h4pFBvFiyRyEgZ5kb1jwAN7HzZFc0awp82wbDVacaF3syhkZH9PQow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htol/1HDNU2phMnOP8MtwvmF5NKa/6t1G4a9gbFQmKY=;
 b=YZQupmyfWcUcM8FIv4P6Mwzy6jm77uPtX1026l1ZeE9fk68lBLzLHrXk6yM+6nGBVM9rgXRGm4tS8/V+Clw6dhpj7VdE9mYph+MB4noEdHZAb/I+2L101bSBxVr13DIadtN6okihznSW9xK01Q9/CsmGqIroIdY5zYjkZR5wED01TjbrntakbvgVR4xW8/j+unlDACaID90SyZljA7OG8WA3Tdu90O9OpuJrQEZEBTTUA385LTa5uYOxmfBxOWLcu/atODe48c2tNC/zF3sB6kbzI8nWl5zZyroJKy2sKlJOcsw2E7+xDJfQoKBh2J28ZTgTWGXKb99LJ/t663UMnQ==
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
Date: Mon, 30 Oct 2023 15:19:52 +0200
Message-ID: <20231030131959.1386107-2-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|LV3PR12MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: d7db89fa-7648-4ad7-bade-08dbd94b009f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UJVScQ+IkmdKZlnhYWi+kNKR8RKdzc8JXcYcvhb4dLJisZDZmtAPzB05Kz8m2caHMUg/bRBGhxUpPdbOg8Zi0yDljYlEiLEtz1sMl+MD7bjPLRHmM8Sv17g6sGjcSsV5etSrtDnF1AnbXK9XHDfArNUlLKXvS0MqZK49pBhjIUNb1GWRUhUlnodY11iJ5qk4vBrD1BZjIVeVtEwOR0CmEyr82nYoHxO6FFwIfbaT4sAxj1weXi+CiepC4rzrsOI5LfsFkftVqRAX86Mrj5KCXbPsuAtNvLoEgSfXuz2YpQ0CyKcLvPjslJ1MqnWc8shSFpo7X1f/QYTAOTNIoK3dWTBf/XYn2TArxcTh3VEPUqMR9+PH3BfdU1EZea49GUrsRMXElV0v2lCLOcMG1reQd01VACeezDKXo1YvmIQccGc0caQRSWPCxJpefKqRjB5VixqIXFcfOgnPYA2xbxv++U95Uuuc9jIG9GJJ1WnJ5T9YYAIhMQC6u7jf2ARVOQgCeswWt/pqq45j43olsJKPJoYSGB2xmWIbmHAAIDOSxD6IK/2qcumtbM9xAeGDamN+Qp+ofkZLH/OYog+rdpPammOcw8H74Ol5T30iCfeZZ+0aK+aN+2gIP8TCf+fcLNkWqPGd1FxdPUzD568znl9SpuwdOM0l8DDeJ2EhFu/FyQoeLZe4RfXJh9CuMU2O6gnfdGFEQJmaprxT2sfL5Mmqc44ri9NsDByIVe6T33Eedbvn2g6b2DT7fBsv3jJ7mcLCit9Yw/GzOkbvcTnT6eyAgq5pTlkW1CcUZckvxbLYYrA=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(64100799003)(82310400011)(1800799009)(451199024)(186009)(40470700004)(46966006)(36840700001)(1076003)(16526019)(26005)(40460700003)(36756003)(86362001)(40480700001)(356005)(82740400003)(7636003)(2616005)(336012)(426003)(83380400001)(2906002)(478600001)(107886003)(36860700001)(6666004)(47076005)(8936002)(8676002)(966005)(4326008)(316002)(54906003)(5660300002)(41300700001)(70586007)(110136005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:20:35.7424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7db89fa-7648-4ad7-bade-08dbd94b009f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9402
Subject: [virtio-comment] [PATCH v3 1/8] admin: Add theory of operation for device migration

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

