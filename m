Return-Path: <virtio-comment-return-7296-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6605EEEB580
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:30:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D0BE326A31
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:30:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA75E986686
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:30:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C078E98663F; Sat,  9 Sep 2023 14:30:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE23198660E
	for <virtio-comment@lists.oasis-open.org>; Sat,  9 Sep 2023 14:30:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lj0Jif7I4vuCillOBmIR8nO6YMp8HXz7IzHGLjZA3BG58towiw/L1lZJ0PNv/cYzsU+3zal1vmHQ7kmG+q5Kw7/jRV3+2/sdyydIDctU+VIdyStqh3tL6UsCO3Bw+QpU8Vwq/60fBhlKiHaAoARRk/6Bq2cWNMYRTvW0+hCEsI8aurhQXaKuAGgf4+b3GpBfRw/DWVO9a+ck1BtRWdXSoixuP1Fd01A+eER+CEfbiYD50eqiAasHgBN0XKIXaruPvN8g935SB9XY/xiSA/+idSOLibT23GhqzzC5OW3IY6gLLo2Qudtyaqc0IGyhUpIhbBWmjkPJiTCvjg0wrwoKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PKhJJiPEfd84tod4aHIfMOWXzvMKKfPUiN+HzDFKx0=;
 b=KjbfUD9IXq1CFIQcjzUv+WLTHs8LbpdxE6OGo3kvp0UqTQ7V/0HArmd2tC2cDGKtpP/ENaOVMvY8Nt8KKm9pmVtbejyiA7iKqVDvvfcfB9zeJmn1y90A2RC5nPVsZy5cYMcoI73USCbFPluk+ibo842m0UAlbcbQsMehfI9TdZtt8SR9tnWKu6GGfoDfQLi0ci++woWQ5Id6UIsmeRQjhDQny0pQLDfbg4gicN6LniIgUPZbZzDXj/HeudukhaM/hyd9kgv0PIYAuLzmvO2Tsm+bFB41ZnI+8bBbqQwRqLrPp2/bymkpiMdD7YBJ6aSTNo4XzxgXHVAOU34/rdcXsg==
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
Date: Sat, 9 Sep 2023 17:29:10 +0300
Message-ID: <20230909142911.524407-8-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|DS7PR12MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 3529382b-efb1-415d-17dd-08dbb141408c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WSvaU++G8zpjVLmDgaUGgJhVfAumTZ1+zT2aMKKLe8Nw9WKX/BLpa4SfmFInxHsZfxJlrxie5G3o1xjwGOQWuqoIqWB/Pq9vmTQIZTzsr2PtgJYLNktbXByx79lFhfkTamJieiqUSa+qK79qLInKNuLwMCG02oaK/dP46JqENVDIe2A/EdiwUgg82C7LXGQdf6ol3wbEM11ekWRkCUBFhmwuGdRyba9j/IZfkhM7cYAC0vhaeil/UlSJjzJQi7xP6R3TNFSZZeuO5x8Jvbb+8gjaJIzPF7LnfgOdmPlLXTT95XM11s7UnBCiW8g37hg/So7SszmbbaQpAlGdoMdNHSpaavoR2yAf0VcFgSm9u9HFnsAVWHUMXVe2BinI5P9gwYThG+XjadH+dkrNv5jvgfzuK65t90sY+s9+6QO1Ih1AP0EUmvcnXtxJYWi3nhT2faZcLQiYr82Ym4c/MQBX7xIvPIa5HcpR5E9fr44BtUhED7MaYatRfWYiDaUc9lIp7liZY1mWEKpxEhJCXYPnvUHeWmvUrOghNXH6voDJi16R3nViTf10foteS7u4zGrORmTC8No+IJDfF5vKjO9dZ8HUkcuyX74sLLaMBcvmS5h1JV0s4om8VIp3lvkveU8vcbX3PkWQiQqE3nRqIlluOv9FtNbE7QE5UU29HNdo37AUO7tElLSPTT4YHhOSbRrT6Y5Pdnvcqpp2ncnLcV/bGv5HnAsygWCTIblk+4A0AkIw3hMv9PDd2zs3rS4voh8zZQopom87Ki2GvB0qT1SHHHi41/uAvF2U+/02SDMNGDY=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(186009)(1800799009)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(5660300002)(316002)(110136005)(30864003)(36756003)(54906003)(70206006)(70586007)(4326008)(8936002)(8676002)(41300700001)(40460700003)(36860700001)(2906002)(107886003)(336012)(1076003)(16526019)(26005)(47076005)(426003)(40480700001)(82740400003)(6666004)(356005)(7636003)(478600001)(966005)(83380400001)(2616005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 14:30:01.5564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3529382b-efb1-415d-17dd-08dbb141408c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8322
Subject: [virtio-comment] [PATCH 7/8] admin: Add write recording commands

When migrating a virtual machine with passthrough
virtio devices, the virtio device may write into the guest
memory. Some systems may not be able to keep track of these
pages efficiently.

To facilitate such a system, a device provides the record
of pages which are written by the device. This commands
connect to the vfio framework at [1].

The owner driver configures the member device for list of address
ranges for which it expects write recording and reporting by the device.

The owner driver periodically queries the written pages address record
which gets cleared from the device upon reading it.

When the write records reduces over the time, at one point write recording
is stopped after the device mode is set to FREEZE.

[1] https://elixir.bootlin.com/linux/v6.4-rc1/source/include/uapi/linux/vfio.h#L1207

Signed-off-by: Parav Pandit <parav@nvidia.com>
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

