Return-Path: <virtio-comment-return-7770-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAC9CDB474
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 97E4CF3F4F
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4AEF99868AA
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2A24D9868F6; Tue, 17 Oct 2023 20:07:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B1EFB9861CC
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 20:07:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McIPoDC3j64f+QsRFsYHdepvv6QiRdeuIE59n+fwz1fnucBmgNLORjL7Kj5RxOQTD+C/nPopF7i0vZtPM/q/9HTsTs7kIXn9cXEvJixCRwCM7QisbvHM3WC3km/vAWb3lJI689zyRdjtZHU3fzB2u22JqNy27LscQsQBvNiUZkTPN50tsc/PWWfaK/Nsn7NEHfoRgXopvI0dydPzYfjZL5ZCpRyB/Tx/XqOsAXkPdtUt/jluGcHi1o79XAZdmRTbd/1aZlVe0bqFhungypv2Q9YhKIoxD3Q+UvmG0EHVVqteMW3Xjdiy+V6fFV0kdKVFY1LF9mON4CEJsZOiTLRPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m630fQizxAqJ4rowlacmNfZQA6vgr/PeWVD0cNjnRTg=;
 b=dlC9668HcUNeIrAuIcanw3XA9J1t3kVHSZpglsjRkF61L7jTG+yalloxbmHonKM+Fn08PJxbYtWhOxyjnS4FE0+2hAcFJHsOkGqtn8AsUAKxfyV3UyS2M6vbHkZa7OV4gmtFoUmJFbjxnGe7aFKIiBEW0UGnSWTcPEdaAcmVSgPw97IcUZjACIchZOdMIB9Mat8g5x0CCOAsUZKrRob+QMcK97VKPhRJWzgfRpr3Ly6QmGfPUQ04KQ1uIFZLkPMfsRf0HSg1zzpirLCpCzxsJKPXFZk/7ccQwTYiNfLoMpdoXqKWxEeQTk/x0KRCItiFz3twLIeE0dLApegR7TMKMQ==
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
Date: Tue, 17 Oct 2023 23:06:44 +0300
Message-ID: <20231017200645.779222-8-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|DS0PR12MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f0f93c-49c5-417f-d59d-08dbcf4cb3e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	siXD3qybVu/PiGjSlXerZ7mwkOcUy/U2Afr9WruEMm67dzuw3qEtYwY+tdFtuZ0BOmHeI8GzhUEzNQpvO8JHmCIOade3rOdmO92nfRogHKTyWKaEdWXI5smMQGFR/0SggdTqNa6ghMbt1+6NMM+95YhYcuOGwHWpy50FvPM5RNnH/8JlpH9RW0FWPQzj2Lk3QLjy2K4KuNyy96XB1GHELiH4F/YXkWB79YdqMEm2vlTm5LFU+/HjysFcU8UWcNLo1EY6vD8gY4KGVbWaGiiNue92tac1kjeq2+sHIJ+2nSROKImXraQT0NJ2Uucy8raBKJqVLD3Ay/TKYZ6cMZjA1EyiAyvKE7Rw7Z1C3t2Rk9ZddG9uxtondE8w1XP4l47SjsxVsWnX2ahwkjbFKL3EuTtMgd94YalzJIdIt38EiDppqQ8ArxGfqgJAnu3/FAi2cWtty5vAhcmBjm+2lyMA61z+3SQ9EB6TmSokP0Th6oK16ZJFrPuBaWJWk+G7OayKQElNvT1SVKRI2ZsN3Kh+KUK715KydqHSV6bXA2VBuFuS9z9BkvYgfY0fqAC9FCWjmRCX3lHeYYzwuaHzS9QrHkbpSco55auaLUp+arZE4NzHlz8+vaM3fQwZ3dyMYmcQClpvB5fUQ0+4R6BzHAuhT6/kBnO89jXTEBHGYEeeYArG/+xQwuq23v2EbZpHsYpFnxnmnBQFvR2ovSQ/PGKTHwR64icrAk1QeEfndYI1+ImMgJGyozM/6VgKoy/9ZolCb05mjS1LHd5P4v8RiF7UGp4h0OqohaUOhMxDHdERWPc=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(82310400011)(451199024)(1800799009)(64100799003)(186009)(40470700004)(36840700001)(46966006)(40480700001)(5660300002)(2906002)(40460700003)(26005)(36756003)(336012)(107886003)(36860700001)(16526019)(6666004)(83380400001)(2616005)(426003)(7636003)(86362001)(47076005)(356005)(82740400003)(1076003)(966005)(41300700001)(316002)(54906003)(110136005)(70586007)(70206006)(8676002)(4326008)(8936002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 20:07:34.4339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f0f93c-49c5-417f-d59d-08dbcf4cb3e8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6438
Subject: [virtio-comment] [PATCH v2 7/8] admin: Add write recording commands

When migrating a virtual machine with passthrough
virtio devices, the virtio device may write into the guest
memory. Some systems may not be able to keep track of these
pages efficiently.

To facilitate such a system, a device provides the record
of pages which are written by the device.

The owner driver configures the member device for list of address
ranges for which it expects write recording and reporting by the device.

The owner driver periodically queries the written pages address record
which gets cleared from the device upon reading it.

When the write records reduces over the time, at one point write recording
is stopped after the device mode is set to FREEZE.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Satananda Burla <sburla@marvell.com>
---
changelog:
v1->v2:
- addressed comments from Michael
- merged theory of operation changes to previous patch
- replaced iova with physical address
- renamed iova range with a page
- reworded and simplified wording using page
---
 admin-cmds-device-migration.tex | 129 +++++++++++++++++++++++++++++++-
 admin.tex                       |  10 ++-
 2 files changed, 135 insertions(+), 4 deletions(-)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index fba3a6b..992d6ec 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -106,9 +106,8 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 address records from the device. As the driver reads the written address records,
 the device clears those records from the device.
 Once the device reports zero or small number of written address records, the device
-mode is set to \field{Stop} or \field{Freeze}. Once the device is set to \field{Stop}
-or \field{Freeze} mode, and once all the IOVA records are read, the driver stops
-the write recording in the device.
+mode is set to \field{Stop} or \field{Freeze}. Once all the physical address records
+are read, the driver stops the write recording in the device.
 
 The owner driver uses following device migration group administration commands.
 
@@ -120,6 +119,9 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 \item Device Context Write Command
 \item Device Context Supported Fields Query Command
 \item Device Context Discard Command
+\item Device Write Records Start Command
+\item Device Write Records Stop Command
+\item Device Write Records Read Command
 \end{enumerate}
 
 These commands are currently only defined for the SR-IOV group type.
@@ -340,6 +342,127 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 discarded, subsequent VIRTIO_ADMIN_CMD_DEV_CTX_WRITE command writes a new device
 context.
 
+\paragraph{Device Write Record Capabilities Query Command}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Write Record Capabilities Query Command}
+
+This command reads the device write record capabilities.
+For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY, \field{opcode}
+is set to 0xd.
+The \field{group_member_id} refers to the member device to be accessed.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_dev_write_record_cap_result {
+        le32 supported_page_size_bitmap;
+        le32 supported_ranges;
+};
+\end{lstlisting}
+
+When the command completes successfully, \field{command_specific_result}
+is in the format \field{struct virtio_admin_cmd_dev_write_record_cap_result}
+returned by the device. The \field{supported_page_size_bitmap} indicates
+the physical address range named as page size granularity at which the device can record.
+The minimum page size granularity is of 4KB. Each bit represents a
+supported page size. Bit 0 corresponds to 4KB, bit 1 corresponds to 8KB,
+bit 31 corresponds to 4TB. The device support one or more page sizes.
+For page size, the device sets corresponding bit in the
+\field{supported_page_size_bitmap}. The \field{supported_ranges}
+indicates unique (non overlapping) physical address ranges in page granularity
+can be recorded by the device.
+
+\paragraph{Device Write Records Start Command}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Write Records Start Command}
+
+This command starts the write recording in the device for the specified
+physical address ranges.
+
+For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START, \field{opcode}
+is set to 0xe.
+The \field{group_member_id} refers to the member device to be accessed.
+
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_write_record_start_data}.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_write_record_start_entry {
+        le64 page_address;
+        le64 page_count;
+};
+
+struct virtio_admin_cmd_write_record_start_data {
+        le64 page_size;
+        le32 count;
+        u8 reserved[4];
+        struct virtio_admin_cmd_write_record_start_entry entries[];
+};
+
+\end{lstlisting}
+
+The \field{count} is set to indicate number of valid \field{entries}.
+The \field{page_address} indicates the start physical address.
+The \field{page_count} indicates number of pages of size \field{page_size}
+starting from \field{page_address} to record. All the \field{entries}
+are unique non overlapping page entries.
+Whenever a memory write occurs by the device in the supplied address range, the
+device records the physical address of the page in which the write occurred
+by the device. These write records can be read by the driver using
+VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ command.
+
+This command has no command specific result.
+
+\paragraph{Device Write Record Stop Command}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Write Record Stop Command}
+
+This command stops the write recording in the device for which was
+previously started using VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START command.
+
+For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP, \field{opcode}
+is set to 0xf.
+The \field{group_member_id} refers to the member device to be accessed.
+
+This command does not have any command specific data.
+This command has no command specific result.
+
+\paragraph{Device Write Records Read Command}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Write Records Read Command}
+
+This command reads the device write records for which the write recording is
+previously started using VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START command.
+
+For the command VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ, \field{opcode}
+is set to 0x10.
+The \field{group_member_id} refers to the member device to be accessed.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_write_records_read_data {
+        le64 page_address;
+        le64 length;
+};
+
+struct virtio_admin_cmd_dev_write_records_cnt {
+        le32 count;
+};
+
+struct virtio_admin_cmd_dev_write_records_result {
+        le64 address_entries[];
+};
+\end{lstlisting}
+
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_write_records_read_data}. The driver
+sets the \field {page_address} indicating the start page address for up to the
+\field{length} number of bytes. The supplied physical address range can be
+same or smaller than the range supplied when write recording is started by
+the driver in VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START command. The \field{length}
+must be same or multiple of any of the page size reported by the device in the
+\field{supported_page_size_bitmap}.
+
+When the command completes successfully, \field{command_specific_result} is in
+format of \field{struct virtio_admin_cmd_dev_write_records_cnt} containing number
+of write records returned by the device and \field{command_specific_result} is
+in the format of \field{struct virtio_admin_cmd_dev_write_records_result}
+When the command completes successfully, the write records which are returned
+in the result are cleared from the device.
+
 \devicenormative{\paragraph}{Device Migration}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration}
 
 A device MUST either support all of, or none of
diff --git a/admin.tex b/admin.tex
index 142692c..41cabfe 100644
--- a/admin.tex
+++ b/admin.tex
@@ -140,7 +140,15 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x000d & VIRTIO_ADMIN_CMD_DEV_CTX_DISCARD & Clear the device context data \\
 \hline
-0x000e - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
+0x000f & VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY & Query Write recording capabilities \\
+\hline
+0x0010 & VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START & Start Write recording in the device \\
+\hline
+0x0011 & VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP & Stop write recording in the device \\
+\hline
+0x0012 & VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ & Read and clear write records from the device \\
+\hline
+0x0013 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
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

