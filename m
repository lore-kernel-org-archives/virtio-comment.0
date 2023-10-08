Return-Path: <virtio-comment-return-7617-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8E4E95A67
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 477DD1318C6
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 43DF69864F0
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3AECA986380; Sun,  8 Oct 2023 11:26:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2A5AF98657D
	for <virtio-comment@lists.oasis-open.org>; Sun,  8 Oct 2023 11:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpr0SfZ59oGhe2gOdWHrSP+W1pUrAG6yLzlChymct+NzJu5HNVBE1EGp3ElY+wVwCRaR8x8KXJuJUpeZOJSLHrtSbmFe9DPwbzY4UgN97Xq+BpUBjOu9ZbB6M9aA5uEk7Jfr+h+nIA1KP1xtq3A/qzje2Hthu69JCtARtb3UJ7/fsgB8Cew2bYVXC4WIABUh5A9fc2x7M7/AwaCwjSlT6oGvfbKiG1uAWsSLTfkL7PMKaz1Sh7bAaNLA1BwEPOk37ZfLwErNvw5dywFa0BV2Y7KL12lc1in3lq8t+Y0UyY/jEYP0nN7yWB7w9P0LBXJCB6V9tjbu0O63M8SH6WZyLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJowkV5qj4QMAG6aXrM1431M349fwBpPI/93EjKOMzE=;
 b=jTSMKeGlAjFeEUQfLlOgtdtG2PBQAEdpq/Oov2EZ/T/UdjqDf1+PEpwPcCyNm8+hOfsMDVQMSU4ASRh/0PF8Oj2XKNAQaRWONHiR7ZohzgRayKLhDebV4DHLuETM6VLyQF3SZYf5Zk8zcXIe8CvF/+YXQieHCEq5RCZkTbhEd1FD1NhbmUn5uvHU/eIzm/t5bOnxY3QM1KcuP65DaJxDkybMuXH1ljvG/KJMHnL6UG5eOrj2UwJtBcV+EFPjj7tB1dzgwyK8L3mLUZLGPxWRIe1pBvLtsyW7IbvKZ5rziPpMNUMuAqbwogkJKIIOz8L0kpWy2x4pY7zOjlhaCUksZQ==
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
Date: Sun, 8 Oct 2023 14:25:54 +0300
Message-ID: <20231008112555.473895-8-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|CH2PR12MB4103:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f2c8548-379b-4d72-d240-08dbc7f17416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XvixV80f6+LgY630vBtL5ysD+/9podzTCfd/6GXOBgnsEbibdNInEBSApenKds8gWCvNgyP/cUEl/+QDBIUXiKXKS0PsYWZ2TYNL+NOhnVLmXOwme2sauOHWSgnYS5xIOPV4TSZI2FpMaHKCsd6wvHIwMh5EMMamjOkyauwtp9LA4kLnp9zZJZMKxX2kmOLaJ8t65+WcaDZnCcnhKPaklgKDJXvwgsGlJDDNn0xpeCLbaINPQtDUQyJev6x2QNFwcaRNvPH7vZ2IkX2IUdqWXpJ1RBx8qbcTagyPa2f54xv57azWLDxN4W2oRXTqiC3cx+RCPDZ6aB1gMVAdS3+G3XMZ0DEzCzNz6zCE6gePLPnPwkQJ0vqEGGriv2DFYMpL4Kd020cdZYQjZbk0NKPt5sa7b7fxlvSfRw1QD+PHPjOjMi/jUn/NRlEsRyIQ5f20fjHrL/7zT8TRg1RiWdNArEpq9O1LFGK6VmfzoID105nxqWzXVn88Acrvpt/t5CJZvLpBlfmsCyBsjS+2KaZbIJpLu5eNwZg/1Cvw6IzNymNHrd176yzQKmCT4s4gMmg/gIxe5DU5+15YcGm7VJ3jwaxJg7pKOY3nLSGp1tmyJ4ED7kdcqynj2Snt0LqW3dhyqed5+Mclpx9+5NcDGE5WAou3T0nD+tHrTIp21CLJDsSToBOv2t+BSo+J6XW312VZS1vTqITzWILVyePS68vvMCjRAQaFjRYRV4OXK2qlWtQXfnczwAtB7mZIh5r5O8mnI4mr0nvx3s9M4NTczQ+jztPczEOa0+4OuBPaeZ4i0RI=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(82310400011)(1800799009)(186009)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(40460700003)(107886003)(1076003)(478600001)(2616005)(6666004)(966005)(426003)(47076005)(336012)(16526019)(83380400001)(30864003)(2906002)(26005)(8676002)(5660300002)(110136005)(54906003)(70206006)(70586007)(4326008)(8936002)(316002)(41300700001)(40480700001)(82740400003)(356005)(7636003)(36860700001)(36756003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2023 11:26:45.0193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2c8548-379b-4d72-d240-08dbc7f17416
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4103
Subject: [virtio-comment] [PATCH v1 7/8] admin: Add write recording commands

When migrating a virtual machine with passthrough
virtio devices, the virtio device may write into the guest
memory. Some systems may not be able to keep track of these
pages efficiently.

To facilitate such a system, a device provides the record
of pages which are written by the device. In one use case, this
commands connect to the vfio framework at [1].

The owner driver configures the member device for list of address
ranges for which it expects write recording and reporting by the device.

The owner driver periodically queries the written pages address record
which gets cleared from the device upon reading it.

When the write records reduces over the time, at one point write recording
is stopped after the device mode is set to FREEZE.

[1] https://elixir.bootlin.com/linux/v6.4-rc1/source/include/uapi/linux/vfio.h#L1207

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Satananda Burla <sburla@marvell.com>
---
 admin-cmds-device-migration.tex | 146 ++++++++++++++++++++++++++++++--
 admin.tex                       |  10 ++-
 2 files changed, 146 insertions(+), 10 deletions(-)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index e98d552..49835eb 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -97,15 +97,16 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 During the device migration flow, a passthrough device may write data to the
 guest virtual machine memory, a source hypervisor needs to keep track of these
 written memory to migrate such memory to destination hypervisor.
-Some systems may not be able to keep track of such memory write addresses at
-hypervisor level. In such a scenario, a device records and reports these
-written memory addresses to the owner device. Such an address is named as
-IO virtual address (IOVA). The owner driver enables write recording for one or
-more IOVA ranges per device during device migration flow. The owner driver
-periodically queries these written IOVA records from the device. As the driver
-reads the written IOVA records, the device clears those records from the device.
-Once the device reports zero or small number of written IOVA records, the device
-mode is set to \field{Stop} or \field{Freeze}. Once the device is set to \field{Stop}
+Some systems may not be able to keep track of such
+memory writes at addresses at hypervisor level. In such a scenario, a device
+records and reports these written memory addresses to the owner device. Such an
+address is named as IO virtual address (IOVA). The owner driver enables write
+recording for one or more IOVA ranges per device during device migration
+flow. The owner driver periodically queries these written IOVA records from
+the device. As the driver reads the written IOVA records,
+the device clears those records from the device. Once the device reports
+zero or small number of written IOVA records, the device is set to
+\field{Stop} or \field{Freeze} mode. Once the device is set to \field{Stop}
 or \field{Freeze} mode, and once all the IOVA records are read, the driver stops
 the write recording in the device.
 
@@ -118,6 +119,10 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 \item Device Context Read Command
 \item Device Context Write Command
 \item Device Context Discard Command
+\item Device Write Record Capabilities Query Command
+\item Device Write Records Start Command
+\item Device Write Records Stop Command
+\item Device Write Records Read Command
 \end{enumerate}
 
 These commands are currently only defined for the SR-IOV group type.
@@ -307,6 +312,129 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
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
+        le32 supported_iova_page_size_bitmap;
+        le32 supported_iova_ranges;
+};
+\end{lstlisting}
+
+When the command completes successfully, \field{command_specific_result}
+is in the format \field{struct virtio_admin_cmd_dev_write_record_cap_result}
+returned by the device. The \field{supported_iova_page_size_bitmap} indicates
+the granularity at which the device can record IOVA ranges. the minimum
+granularity can be 4KB. Bit 0 corresponds to 4KB, bit 1 corresponds to 8KB, bit 31
+corresponds to 4TB. The device supports at least one page granularity.
+The device support one or more IOVA page granularity; for each IOVA page
+granularity, the device sets corresponding bit in the
+\field{supported_iova_page_size_bitmap}. The \field{supported_iova_ranges}
+indicates how many unique (non overlapping) IOVA ranges can be recorded by
+the device.
+
+\paragraph{Device Write Records Start Command}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Write Records Start Command}
+
+This command starts the write recording in the device for the specified IOVA
+ranges.
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
+        le64 iova;
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
+The \field{iova} indicates the start IOVA address. The \field{page_count}
+indicates number of pages of size \field{page_size} starting from \field{iova}
+to record for write reporting. VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
+command contains unique i.e. non overlapping IOVA range entries.
+Whenever a memory write occurs by the device in the supplied IOVA range, the
+device records the actual IOVA and number of bytes written to the IOVA.
+These write records can be read by the
+the driver using VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ command.
+
+This command has no command specific result.
+
+\paragraph{Device Write Record Stop Command}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Write Record Stop Command}
+
+This command stops the write recording in the device for IOVA ranges
+which were previously started using VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START
+command.
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
+        le64 iova;
+        le64 length;
+};
+
+struct virtio_admin_cmd_dev_write_records_cnt {
+        le32 count;
+};
+
+struct virtio_admin_cmd_dev_write_records_result {
+        le64 iova_entries[];
+};
+\end{lstlisting}
+
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_write_records_read_data}. The driver
+sets the \field {iova} indicating the start IOVA address for up to the
+\field{length} number of bytes. The supplied IOVA range same or smaller
+than the range supplied when write recording is started by the driver
+in VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START command.
+
+When the command completes successfully, \field{command_specific_result}
+is in the format \field{struct virtio_admin_cmd_dev_write_records_result}
+and \field{command_specific_result} is in format of
+\field{struct virtio_admin_cmd_dev_write_records_cnt} containing number
+of write records returned by the device. When the command completes
+successfully, the write records which are returned in the result are
+cleared from the device and same records cannot be read again. When new
+writes occur at same IOVA range or at different once, those records can be read
+as new write records.
+
 \devicenormative{\paragraph}{Device Migration}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration}
 
 A device MUST either support all of, or none of
diff --git a/admin.tex b/admin.tex
index 3429c4e..cffd85e 100644
--- a/admin.tex
+++ b/admin.tex
@@ -138,7 +138,15 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x000c & VIRTIO_ADMIN_CMD_DEV_CTX_DISCARD & Clear the device context data \\
 \hline
-0x000d - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
+0x000d & VIRTIO_ADMIN_CMD_DEV_WRITE_RECORD_CAP_QUERY & Query Write recording capabilities \\
+\hline
+0x000e & VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_START & Start Write recording in the device \\
+\hline
+0x000f & VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_STOP & Stop all write recording in the device \\
+\hline
+0x0010 & VIRTIO_ADMIN_CMD_DEV_WRITE_RECORDS_READ & Read and clear write records from the device \\
+\hline
+0x0011 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
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

