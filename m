Return-Path: <virtio-comment-return-7290-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3ADEEB580
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8DCEAF3F52
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8110F98666B
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 78FCE986637; Sat,  9 Sep 2023 14:29:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6BE61986640
	for <virtio-comment@lists.oasis-open.org>; Sat,  9 Sep 2023 14:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAxcx+6reHRNEHPWLrf6/Mnwz+sseDqmcWTbnQSlBF46an2KMs3ZYGVKUheM7GQTef6q077cYr2PFR1Q5aXgrf0HNuq9+B6nureo7Gb2LHSv7Qi2pcx5wYGNqm55I90R4Q0SnzXbyiae5Z4kpdLhxEQxqOT5GqpmG8E/NJptAka9dSFQyvG0S36xkB5w0LMPJTTDNIGXlmJmwionck56u85JzF1+YhnhVmKBvZSFWErmuOWNk1iJlPCabXIfLHp9n/O1CtFeCOb+8x7V6s8kEQfYj90RaBUuyX9taILfVv8bVflBCirah8Jnz9h/6SiFqEqqdc6ZMLt1M7v4CByAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJlocRPC1ukIEnsutDMC42gcAfxhpJTXYICOKitMJfs=;
 b=T6XRXw2S/t4wk77Uij9yZD7lzS6pxTe6sXQ+5lmcTEsc3DNHaj/b/YyNcUEQ6OUKnZIJ5SykhcsirDVZYvK7+6gV6Ei8TRe0qhrTt5HzpHHNq1cILrxidisJ0yYdGgkoAmt11nS86J0VFFgtONuO0pVSc3ge/1NquwuYwAAvzplaiDCaBdLT7D0uV4TYbezyr2oIGl6784Yh47kqo+2mVj2aSTvCiUNoQyYmc4LBsDe7R7F3leJzVJWOcbitjYZT3/oFQWjCP8JowUhyTzHn4LF7zYTbVCQo8ZQ+vwZX0mkzlil+tKDsBDUrys+zcWLNr7MAUopBpc/BdPZ6+NvZpQ==
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
Date: Sat, 9 Sep 2023 17:29:04 +0300
Message-ID: <20230909142911.524407-2-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|SJ0PR12MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea4d349-5603-48cf-2cd1-08dbb1413295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AyQx43hDYRLuNCCOXVTodKKKnTZOOkENV0+rboTDHba5lAZx8OwnOwiuTPc8kotXoqQJNHcUvJPK0VnlOfeKaUiaLZzmvehs4tYn6xhlzgsLlQB4YUOk8GbsOUh1JVO1pvJi69pwlJP/Pod+EGqjCbfzr2xFq0UrJZGenzm01SVFRERUuzsEeM+iCCnrXf5pqh1jKYrOO5/B5BeyrbQTA+YN25R0QPuWstDBMN3HPPF+DshmrALHOdqq2EGY+RTZepw5SkWAHVMlVB6CFutZzP/UZUJ45XreMuwGHixu8mylJdU5ZzZjCV+EqkUHyDDIYaGTbQ/EhEdRH/R0e5fz++SVbdzefYFr1Cw3rvUx892F2Qfz/LglbWxgiH8qyW0yiya8leJW1QF6to4DUwb/jPYWPLA7OO04CJ/lvKScKDEJrFCcqcagNFvjkZvEgxsvTPITU2V3BdFhFjXym9y7Mp2G/QCVi40ftpWNoiyrBskWTe9k6VVqWbxyvhAguzZBVu3zxmxZp84xYo81aVPqm21MOM0fBQvq0yD/WmjUELEhHKDAtpwIQXBx0DFp5H0T75Z1cjr6zCu+0IsfYA3/Mg71lNw4is13EjuORChh/u3E/H0ejN2RFn5wu936RtpUQmAKHGrWE6wB97yRC1vbKVIJQciaZ/iI8yrf1lNp6Gj0JlNASQTg6zCdYfJil1naDTJWplEmCJNF/OMKtZL9OFnirNM+5BB3t6DNbveWD5i/NF9bdrkoC2jpRWya9VkcWG+PP23zwffkvL58jYIcZwLF1zqLXxAMp3paJ2RW7I0=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(82310400011)(451199024)(1800799009)(186009)(40470700004)(46966006)(36840700001)(4326008)(26005)(8676002)(8936002)(47076005)(16526019)(107886003)(5660300002)(1076003)(2616005)(83380400001)(336012)(426003)(36860700001)(40460700003)(41300700001)(54906003)(110136005)(70586007)(70206006)(6666004)(40480700001)(7636003)(316002)(36756003)(478600001)(356005)(86362001)(82740400003)(966005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 14:29:38.1122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea4d349-5603-48cf-2cd1-08dbb1413295
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6965
Subject: [virtio-comment] [PATCH 1/8] admin: Add theory of operation for device migration

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

