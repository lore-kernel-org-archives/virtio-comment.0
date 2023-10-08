Return-Path: <virtio-comment-return-7610-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A23E95A82
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7631A613D1
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6074A986595
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 573039864AB; Sun,  8 Oct 2023 11:26:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 47B5C98650E
	for <virtio-comment@lists.oasis-open.org>; Sun,  8 Oct 2023 11:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuNQaLg9alX3p+Sz5gZGEr9jB2bCdylmwSuj53J6tPA6jAvwmGZGpOwIIZDIIHhY0x5wiqpHfADs6RAlfu4DJLYpabYLNX2xHfwAI+fH1n5CoBQp4xCxh7PBacf0UN5U0XkUY1KOZwmUJiJRMa+si0bGh7iyqcFfftW+ETI4RQ4UN+0KJJcpRWowpG0/vMnBrMo+p1YvjTEhamJRqCgxTrGYKCViJwQHM9XFHaEGXzBVIdgujYpWGZNNEtTUll3w2y40Vtn1VH29DksW32TI3+wHSdlZwyy88IiKlXpfY4Ojzkvr1pBbhPAM6ItsFe78BeseyESVtNd94v6TQJ+RtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CdANvCCcboSsoEUO61s+vhRunSF+ThMqoz3YgMWlLc=;
 b=md+nEC15dJw8J6TjHjo1KHJZdVYHIVpsWzYOzjhpOgkNb5a5rme3iL3et/Vp+HwetyO0LZHSVr90GRoV+n8/2FvFmrAQj/Ghk418zhBIvSc4mWcPal0UJgjcUju5LWbcJNmdFubg8a+SwYVLnUMGZosk57Kzg662Lvmt2AU0YvWTLX90Owy1fBKssumzy4XRETfF4ukjb5/2ahEd1yR360TPMPrPdChyJvYYAVGfvmcTZsmKHFe+AMWh6A0+XOjo6JPD+BPSiu9Y436xnU3Cb9JEG9WqVTejN8z4D0/6f4wWNXvSRCVLdvJSjsrqABYkrPaaAZKQiHJ/9dFxx/x/zg==
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
Date: Sun, 8 Oct 2023 14:25:48 +0300
Message-ID: <20231008112555.473895-2-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|BY5PR12MB4225:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3baad7-d9ac-4d0c-15d3-08dbc7f1647c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WsTXl+Fn+U+hGl9tT8DMvlmafiR9uuPRZmd8vfiT9mIAuHo4BJ9XddBZUUy6VSLjjXcIepAvGeXqnWNflaXbEC65hIRj5rKh1tCd+FDGApdHUEGLbFVVkS/DPWDzCP2LFC0M+RRR82Oy+t31TUj+oMLMLaon7srS4SoU38goeBm6lX8gmOWnxax1vxqfuAf2TuR2Na0R8hRjnvw+x6/iQrPFKuivTpUQ+mIbTm7IHU1wqasHAuLk+HY9wMsQjHFIq9+DCx+bsDdDQLtkAv/Afwx+/4VDdv9b++3xkdmdnNhmn9ESsELJp0wPl7NCTp4sRkRtPTirMjPZSmOnYyRHMOt+9GAXxk4QLY9l+EBWR9vlPiTWSW/Z1rcE9iml0/Xu3VhESzKwHK8e/V3gGuVCuY8AFvUx+Vjp6XvPbQOW1xZEnJY5IaQu8QuJhO3iASWEvhgvte+mwQFBxmkyF5PzjITjbzPGdNEwJZwzaatoA3wf+gtqzTPqu3Vzzzrbz4q60y9nZ1FICzs8Wbmo5hil64M7ivykH6uThGTUApLb3KFzDJMnDRK2G1txWgDYMC8u0gGYsYJedzUu+7+k5EvBatWul+XsqMGTS+ouUeuMSQZM/BpqbtzQcI+AaaMKChlWAv8bj4NMel9Rk77U0hJj/OTvG4t6TkPTHcCfSBd1pyF+zVOxkHrwU+y++aui104W8ve5MTYVoOICRksn2NUSZPvddHSbUrQWi8ykZHDaIGbvk7D6oh1RlilpsrEM+BRA
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39850400004)(230922051799003)(186009)(82310400011)(64100799003)(1800799009)(451199024)(46966006)(36840700001)(478600001)(8936002)(8676002)(4326008)(336012)(426003)(16526019)(6666004)(966005)(316002)(41300700001)(1076003)(2616005)(40480700001)(107886003)(47076005)(86362001)(356005)(82740400003)(7636003)(26005)(36860700001)(2906002)(36756003)(70586007)(5660300002)(70206006)(110136005)(54906003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2023 11:26:18.9175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3baad7-d9ac-4d0c-15d3-08dbc7f1647c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4225
Subject: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation for device migration

One or more passthrough PCI VF devices are ubiquitous for virtual
machines usage using generic kernel framework such as vfio [1].

A passthrough PCI VF device is fully owned by the virtual machine
device driver. This passthrough device controls its own device
reset flow, basic functionality as PCI VF function level reset
and rest of the virtio device functionality such as control vq,
config space access, data path descriptors handling.

Additionally, VM live migration using a precopy method is also widely used.

To support a VM live migration for such passthrough virtio devices,
the owner PCI PF device administers the device migration flow.

This patch introduces the basic theory of operation which describes the flow
and supporting administration commands.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/include/uapi/linux/vfio.h?h=v6.1.47

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin-cmds-device-migration.tex | 94 +++++++++++++++++++++++++++++++++
 admin.tex                       |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 admin-cmds-device-migration.tex

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
new file mode 100644
index 0000000..f839af4
--- /dev/null
+++ b/admin-cmds-device-migration.tex
@@ -0,0 +1,94 @@
+\subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device / Device groups / Group
+administration commands / Device Migration}
+
+In some systems, there is a need to migrate a running virtual machine
+from one to another system. A running virtual machine has one or more
+passthrough virtio member devices attached to it. A passthrough device
+is entirely operated by the guest virtual machine. For example, with
+the SR-IOV group type, group member (VF) may undergo virtio device
+initialization and reset flow and may also undergo PCI function level
+reset(FLR) flow. Such flows must comply to the PCI standard and also
+virtio specification; at the same time such flows must not obstruct
+the device migration flow. In such a scenario, a group owner device
+can provide the administration command interface to facilitate the device
+migration related operations.
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

