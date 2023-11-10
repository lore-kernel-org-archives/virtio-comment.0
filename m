Return-Path: <virtio-comment-return-8315-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52D6C4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3EAF2749E7
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3AE6B986D18
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2B530986D03; Fri, 10 Nov 2023 12:32:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D91A986D05
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3WN6PScbXajEFfBGhgnpcbJux8RzgR5hA3SR8TbvUjNGV6kupBbIXYT8g5Tb2ux+Vj8ZRZ1ACgDNJsZ5/PpRaJQuIKKrQSatKtwnHGqd3mrL5+tOo80sPArhtK4Q1900sP0mUCc4sknL9vYIuH+kNfP7aORdb/gbr99yZTVaYRuMrbzlZm1PrAZspFmTqkUYfeAV8VkqLNqAQ8jcu+JoWJ222u4ek8OjZPiLMjJZ0X1fQ+Gq2oYFA7pPPuZYPsLTllr0fxZcjMqwuiWzkU+huZOh3st5yB0GT5tVcNdo2ZMVf7EJsHY9HpECLY0ll+NskfFow1rTRdTbE9lPb83TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztBOmiMCszoZMlBQsBOTGNC0WEBrn1SDfvIaFpKaQSc=;
 b=TWuRkmaO3KJ55seI9UV3XDUioKfkmyeHiXshH67t1VgN//x3NLskoIXWE4vSRJPEb5oUhx0sD86/iSu6Vdbu9KzFNPy/zTpuBNYOc4UL4U7boD+0Vn+zl21rdFhWzyN5ROTUWvTAfBmAt+sSz321bLL95ob1ZCNSk9mOG14BjKy/kjmPsmgdmvTYnP6afhq9G9RxIikdcQ8vCLqjGPiJl87v8UfPfF+Fkq1v4Jk2eVddKetbyZwrN8+ulSwC2xopBHlaN+nFg6G3HIkXLNnw9ytD1SzitQKQp/0InqoZqrhaerxAO8lcNfzzhfJM7QU333vZxuR8I408YUnEgFccTw==
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
Date: Fri, 10 Nov 2023 14:31:53 +0200
Message-ID: <20231110123200.2082779-2-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|MN0PR12MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 575789fd-7c73-4b91-e094-08dbe1e91abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/jTZgTXMiVvpdX2KEItFBKdx1hrnwQ5iJ+mW6ID2M5s3WldSaB2jUl70qWBbFFjfcIjJsWWoGgF1xx3cjDf1phEukVkPowCCCEn+b8rU5pHFUC7AgQEyaByXADULgUGkaWigrvFgEKPSyTdf2h6S/krRG584A8maXPyhBqa8EadJDEnYaUl+EO/GBhKyzfoEAaWqoiFGgMGs8/SRvXeD9tcjEhMRodOO27bNxjZ9Y4DzNAyBRIKhkVqXeOuaEjl8DiMkCZsDhL/C+n8P5qBBSNRjs6mieQjp+Ubg9w6G+MYgftGdwtGdDeF61zquFFx6fmBRAw52Ye30l9nGhKpSPTNJZRGslgLADim8BDnnPHHf2B8hqgr/0hl8ZtKCd8R6nhOrcQFbk54lKkof+CTPbsHePKr4IvJy/Q94PUVCuTxjni6D+tj5iJ4J5Paw35hXZWa3FSKLrKEyhoofaX53QGVZ8VExVEUXxeU0MgVdXvQzdaMKX/L+uBSRsVTBmVegP6NeRhEzMqVBQJCTeVJD2/9r664FvIQzAKx1NxNV+YvCUGVJbC/DrNr6/il+MIKjCYMTcNC6Vy+zj8HnnryDDX4HMYo/wcPP8Q9bj7FoyP1ftMqH9ww/q/6nG/q6i7xPHsfCREoXp4+/V8X9kPaSZIpK2SvwUDATUTJrgbKj7hEM9PbwhO7fcr6FZhKB9uhDdsZsINeBSFsZwjINKCO96k+9DgAVuLkJ0MrijN3rRFntynCXB3IgdKQ1RF+3gd2HFLIMnGDwh2AQtc9C4F0phBo/u3w5KhLVmSlAKRAxmCs=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(82310400011)(1800799009)(186009)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(478600001)(966005)(316002)(36756003)(8676002)(6666004)(54906003)(70206006)(7636003)(107886003)(70586007)(1076003)(336012)(41300700001)(110136005)(8936002)(36860700001)(2616005)(4326008)(2906002)(5660300002)(16526019)(86362001)(47076005)(426003)(83380400001)(356005)(82740400003)(26005)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:32:29.3281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 575789fd-7c73-4b91-e094-08dbe1e91abf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030
Subject: [virtio-comment] [PATCH v4 1/8] admin: Add theory of operation for device migration

When a PCI VF is directly mapped to the guest virtual machine,
all the virtio interfaces of a PCI VF such as
virtio common config space, virtio device config space, device
notification region, control vq of current 6 different device
types and of future device types, data path virtqueues are
irectly controlled and accessed by the guest driver.

Since a PCI member device can undergo its own device reset, PCI FLR,
any of the device migration framework on the member device itself
is not possible without extreme amount of hypervisor intervention.

To support a VM live migration for such mapped virtio member devices,
the owner PCI PF device administers the device migration flow.

Hence, to support mapping a PCI VF member device to guest VM, this patch
introduces the basic theory of operation which describes the flow
and supporting administration commands.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v1->v4:
- updated commit message to be more precise for mapping
  a PCI VF member device to guest virtual machine
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

