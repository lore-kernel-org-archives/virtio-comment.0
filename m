Return-Path: <virtio-comment-return-8050-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1721C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:21:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 65F102AEEF
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:21:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5E11F986B93
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:21:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5276D986B44; Mon, 30 Oct 2023 13:21:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D813986B52
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 13:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhhqkRwNVVjq5/B2NaDtWGjY3FveBM+t5Ghxu3Tu3Kd/hNwz7xjq5SKFeNlQuxdLoZ3JlH6wr5DZEAXSJEgK2WY7OBSx1vfx/MZtYrfG6DOvxDAr2WSpVkSA3KCXP76GAFqoho/BfybXKvPPme4t0y27A5l0e1gX3CajJ6wGaIqAFSzYPZYLawZuAUyIdK26uRg2MyC9nCjZtsfR3OC5MUCmimKjhrQUD7/cXSYzvZm2aLC7iw9SX9CuOEYHRBDRCw+PrRNJtvt+gO1e53lcdTIbW8YAWCSEnZ29P8t6c7WL9UEeJfkRZx+B1gJHclM1YtR+iEDhMgweuau8KKbCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBt9sr0QhzfhWq+CkuihR529ExNctkvRr1A7fx9PQ1M=;
 b=jgQ1LNAkTva9cn/Y49vpOJK0fnSaVJOBGJgzDWXih8aIyfPlfpl4o5ZI9dd5SW6WhK7qyJwqxWklGqSGojw/EI1ubgjfveLyRK0CixKVRml2ipJHPweQasFMH7XqtqHEs+oU866ImCZepGi8iCccCygVZi5LeGs8Iz6zTY5YW6JY3IMtv+54VzzOSCJPil7++uozDQHBV3Su/AHvfuODoV68j2p+OU+uPzRMnzKFTVw4gAtZLOoftZu6JfTO95Pq37SaB0ifMtswq863suhYuBZ7zz2+IBE1ESg4KrPMGkZ8eiF+KctVPW7KB19cRDj51V5q61WdSAhC8Bxoeo1+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
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
Date: Mon, 30 Oct 2023 15:19:55 +0200
Message-ID: <20231030131959.1386107-5-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231030131959.1386107-1-parav@nvidia.com>
References: <20231030131959.1386107-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|DM4PR12MB5358:EE_
X-MS-Office365-Filtering-Correlation-Id: 00bd1541-ba18-4188-10a4-08dbd94b0629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n7EibXGX9Unx6SvMAXGZ/kyMbQVKXVlUxnZbFQ2MifgawsnNCwetO4XAPDbCpOvS2YQszE/dCkvBppnQrCbVMejJ0731U/SiGn/M3PdU908K2Wmt42Xb3gXY0B3p0g2LM8C8SwkZcJcnIGBqmhTTkLgtXOYmCwzBdrytprMH2+YM2gK/jp83Fya57rdUn9bdqjQWa9aO8Fkk/ocX+TJBJQTQRoeVj0N1T9RnH/83nWE6h+unvj9e9YhfPPzkiIXTgJXIkE/hChm2FHnQhWTzvgA/jFGazIY58TxplSeMiA1fmKnkZvNiDd3uRl+hzea7mlSlV15a9BXUGbX4foZRJ8gPcRi95aMsJSwV8fzUzho63HLQDCVb+i3hkW9nszdBQsGyQcJe3FJAZ4UBeuoIGwUkqmIDkhGzqQjGRPOfm9pIUxW3GaHUcIt4zAmzyArO016vfKN/xVDsgaWZ9I0jhMhkW+fyeZy6nkvfWNHPIpVBYaapqXqgMcfJBP5TrdT5CER+2SxL1OdDxZ1xGrRJmAdzD3qvqpyy7LS9FDNR68UNG/EQkX7pzPinBlzzazl8j3/F2/ZzvXkNDfdrP+9yAKaImTn4Yu1aehvuoX/QwvSBvfEKPFuj/wWOLvcn9CpXNvFrLB0bDyHL8a4hH2rsJGYNGKTMUX/xc/04+mQ21KNMtTeIdojOX2jU/avy/2q42yjg+UahcU+oLVk4+xWaD/3sbpCWUAzxwBfcNXgADvYpT32/cyqZMb+zdF5Lkk0dreznrCIsnN11QlMzWnXyQA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(64100799003)(1800799009)(186009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(336012)(426003)(966005)(6666004)(478600001)(2616005)(107886003)(40460700003)(110136005)(70206006)(316002)(70586007)(40480700001)(26005)(16526019)(54906003)(86362001)(7636003)(356005)(2906002)(30864003)(47076005)(82740400003)(36860700001)(83380400001)(4326008)(1076003)(8936002)(8676002)(36756003)(5660300002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:20:45.1092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bd1541-ba18-4188-10a4-08dbd94b0629
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5358
Subject: [virtio-comment] [PATCH v3 4/8] admin: Add device migration admin commands

A passthrough device is mapped to the guest VM. A passthrough device
accessed by the driver can undergo its own device reset and for PCI
transport it can undergo its PCI FLR while the guest VM migration is
ongoing.
The passhtrough device may not have any direct channel through which
device migration related administrative tasks can be done, and even if
it may have such adminstative task must not be interrupted by the
device reset or VF FLR flow initiated by the passthrough device.

Hence, the owner driver which administers the member devices,
facilitate the device migration flow.

Add device migration administration commands that owner driver can use
for the passthrough device.

Subsequent patch defines the device context in detail.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Satananda Burla <sburla@marvell.com>
---
changelog:
v2->v3:
- updated read context command to not depend on returned data
  length to close the read context stream
- fixed copy paste errors in write context command for fields
  description
v1->v2:
- addressed comments from Michael
- updated commit log to refer to device context in later patch
- moved admin command table opcode to this (right) patch
- added command to query supported fields of the device context
---
 admin-cmds-device-migration.tex | 232 +++++++++++++++++++++++++++++++-
 admin.tex                       |  16 ++-
 device-context.tex              |   6 +-
 3 files changed, 249 insertions(+), 5 deletions(-)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index d172130..c5030d2 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -66,7 +66,8 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 read or write. The member device context consist of any device specific
 data which is needed by the device to resume its operation when the device mode
 is changed from \field{Stop} to \field{Active} or from \field{Freeze}
-to \field{Active}.
+to \field{Active}. The device context is described in section
+\ref{sec:Basic Facilities of a Virtio Device / Device Context}.
 
 Once the device context is read, it is cleared from the device. Typically, on
 the source hypervisor, the owner driver reads the device context once when
@@ -93,3 +94,232 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 
 The owner driver can discard any partially read or written device context when
 any of the device migration flow should be aborted.
+
+The owner driver uses following device migration group administration commands.
+
+\begin{enumerate}
+\item Device Mode Get Command
+\item Device Mode Set Command
+\item Device Context Size Get Command
+\item Device Context Read Command
+\item Device Context Write Command
+\item Device Context Supported Fields Query Command
+\item Device Context Discard Command
+\end{enumerate}
+
+These commands are currently only defined for the SR-IOV group type.
+
+\paragraph{Device Mode Get Command}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Mode Get Command}
+
+This command reads the mode of the device.
+For the command VIRTIO_ADMIN_CMD_DEV_MODE_GET, \field{opcode}
+is set to 0x7.
+The \field{group_member_id} refers to the member device to be accessed.
+This command has no command specific data.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_dev_mode_get_result {
+        u8 mode;
+};
+\end{lstlisting}
+
+When the command completes successfully, \field{command_specific_result}
+is in the format \field{struct virtio_admin_cmd_dev_mode_get_result}
+returned by the device where the device returns the \field{mode} value to
+either \field{Active} or \field{Stop} or \field{Freeze}.
+
+\paragraph{Device Mode Set Command}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Mode Set Command}
+
+This command sets the mode of the device.
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_dev_mode_set_data} describing the new device mode.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_dev_mode_set_data {
+        u8 mode;
+};
+\end{lstlisting}
+
+For the command VIRTIO_ADMIN_CMD_DEV_MODE_SET, \field{opcode} is set to 0x8.
+The \field{group_member_id} refers to the member device to be accessed.
+The \field{mode} is set to either \field{Active} or \field{Stop} or
+\field{Freeze}.
+
+This command has no command specific result. When the command completes
+successfully, device is set in the new \field{mode}. When the command fails
+the device stays in the previous mode.
+
+\paragraph{Device Context Size Get Command}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Context Size Get Command}
+
+This command returns the remaining estimated device context size. The 
+driver can query the remaining estimated device context size
+for the current mode or for the \field{Freeze} mode. While
+reading the device context using VIRTIO_ADMIN_CMD_DEV_CTX_READ command, the
+actual device context size may differ than what is being returned by
+this command. After reading the device context using command
+VIRTIO_ADMIN_CMD_DEV_CTX_READ, the remaining estimated context size
+usually reduces by amount of device context read by the driver using
+VIRTIO_ADMIN_CMD_DEV_CTX_READ command. If the device context is updated
+rapidly the remaining estimated context size may also increase even after
+reading the device context using VIRTIO_ADMIN_CMD_DEV_CTX_READ command.
+
+For the command VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET, \field{opcode} is set to 0x9.
+The \field{group_member_id} refers to the member device to be accessed.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_dev_ctx_size_get_data {
+        u8 freeze_mode;
+};
+\end{lstlisting}
+
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_dev_ctx_size_get_data}.
+When \field{freeze_mode} is set to 1, the device returns the estimated
+device context size when the device will be in \field{Freeze} mode.
+As the device context is read from the device, the remaining estimated
+context size may decrease. For example, member device mode is
+\field{Stop}, the device has estimated total device context size
+as 12KB; the device would return 12KB for the first
+VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET command, once the driver has
+already read 8KB of device context data using
+VIRTIO_ADMIN_CMD_DEV_CTX_READ command, and the remaining data is
+4KB, hence the device returns 4KB in the subsequent
+VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET command.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_dev_ctx_size_get_result {
+        le64 size;
+};
+\end{lstlisting}
+
+When the command completes successfully, \field{command_specific_result} is in
+the format \field{struct virtio_admin_cmd_dev_ctx_size_get_result}.
+
+Once the device context is fully read, this command returns zero for
+\field{size} until the new device context is generated.
+
+\paragraph{Device Context Read Command}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Context Read Command}
+
+This command reads the current device context.
+For the command VIRTIO_ADMIN_CMD_DEV_CTX_READ, \field{opcode} is set to 0xa.
+The \field{group_member_id} refers to the member device to be accessed.
+
+This command has no command specific data.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_dev_ctx_rd_len {
+        le32 context_len;
+};
+
+struct virtio_admin_cmd_dev_ctx_rd_result {
+        u8 data[];
+};
+\end{lstlisting}
+
+When the command completes successfully, \field{command_specific_result}
+is in the format \field{struct virtio_admin_cmd_dev_ctx_rd_result}
+returned by the device containing the device context data and
+\field{command_specific_output} is in format of
+\field{struct virtio_admin_cmd_dev_ctx_rd_len} containing length of
+context data returned by the device in the command response. When the length
+returned is zero the device do not have any device context data left that
+the device can report, at this point the device context stream ends.
+
+The driver can read the whole device context data using one or multiple
+commands. When the device context does not fit in the
+\field{command_specific_result}, driver reads the subsequent remaining
+bytes using one or more subsequent commands.
+
+\paragraph{Device Context Write Command}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Context Write Command}
+
+This command writes the device context data. The device context can be written
+only when the device mode is \field{Freeze}.
+
+For the command VIRTIO_ADMIN_CMD_DEV_CTX_WRITE, \field{opcode}
+is set to 0xb.
+The \field{group_member_id} refers to the member device to be accessed.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_dev_ctx_wr_data {
+        u8 data[];
+};
+\end{lstlisting}
+
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_dev_ctx_wr_data} describing
+the access to be performed.
+
+This command has no command specific result.
+The device fails the command when command is executed when the device mode
+is other than \field{Freeze}.
+
+The written device context is effective when the device mode is changed
+from \field{Freeze} to \field{Stop} or from \field{Freeze} to \field{Active}.
+
+The driver can write the whole device context using one or multiple
+commands. When the device context does not fit in one command data
+\field{struct virtio_admin_cmd_dev_ctx_wr_data}, the driver writes the
+subsequent remaining bytes using one or more subsequent commands.
+
+\paragraph{Device Context Supported Fields Query Command}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Context Supported Fields Query Command}
+
+This command reads supported fields in the device context.
+Each listed \field{type} of the device context of
+\ref{sec:Basic Facilities of a Virtio Device / Device Context} is represented
+as one entry the command response. When the device support a given \field{type} for the member
+device, corresponding entry is set in the command response.
+
+For the command VIRTIO_ADMIN_CMD_DEV_CTX_FIELDS_QUERY, \field{opcode} is set to 0xc.
+The \field{group_member_id} refers to the member device to be accessed.
+
+This command has no command specific data.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_dev_ctx_supported_field {
+        le16 type;
+        u8 reserved[6];
+        le64 length;
+};
+
+struct virtio_admin_cmd_dev_ctx_supported_fields_result {
+        struct virtio_admin_cmd_dev_ctx_supported_field fields[];
+};
+\end{lstlisting}
+
+When the command completes successfully, \field{command_specific_result}
+is in the format \field{struct virtio_admin_cmd_dev_ctx_supported_fields_result}.
+Each entry in array \field{fields} represents the supported \field{type}
+and its length as described in \ref{tab:Device Context Fields}.
+
+\paragraph{Device Context Discard Command}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Context Discard Command}
+
+This command discards any partial device context that is yet to be read
+by the driver and it also discards any device context that is partially written.
+This command can be used by the driver to abort any device context migration
+flow when there may have been any partial context read or write operations
+have occurred.
+
+For the command VIRTIO_ADMIN_CMD_DEV_CTX_DISCARD, \field{opcode}
+is set to 0xd.
+The \field{group_member_id} refers to the member device to be accessed.
+
+This command has no command specific data.
+This command has no command specific result.
+
+Once this command completes successfully, the device context is
+discarded. If the device context that is discarded was part of the write
+operation, once this command completes, the device functions as if the device
+context was never written. If the device context that is discarded was part
+of the read operation, once this command completes, the device functions as if
+the device context was never read in the given device mode. Once the device
+context is discarded, in subsequent VIRTIO_ADMIN_CMD_DEV_CTX_READ command,
+the device returns new device context entry. Once the device context is
+discarded, subsequent VIRTIO_ADMIN_CMD_DEV_CTX_WRITE command writes a new device
+context.
diff --git a/admin.tex b/admin.tex
index c86813d..142692c 100644
--- a/admin.tex
+++ b/admin.tex
@@ -126,7 +126,21 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x0006 & VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO & Query the notification region information \\
 \hline
-0x0007 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
+0x0007 & VIRTIO_ADMIN_CMD_DEV_MODE_GET & Query the device mode \\
+\hline
+0x0008 & VIRTIO_ADMIN_CMD_DEV_MODE_SET & Set the device mode \\
+\hline
+0x0009 & VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET & Query the device context size \\
+\hline
+0x000a & VIRTIO_ADMIN_CMD_DEV_CTX_READ & Read the device context data \\
+\hline
+0x000b & VIRTIO_ADMIN_CMD_DEV_CTX_WRITE & Write the device context data \\
+\hline
+0x000c & VIRTIO_ADMIN_CMD_DEV_CTX_FIELDS_QUERY & Query Supported fields of device context \\
+\hline
+0x000d & VIRTIO_ADMIN_CMD_DEV_CTX_DISCARD & Clear the device context data \\
+\hline
+0x000e - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
 \hline
 0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
 \hline
diff --git a/device-context.tex b/device-context.tex
index 06ed43d..1eb71f7 100644
--- a/device-context.tex
+++ b/device-context.tex
@@ -133,9 +133,9 @@ \subsubsection{PCI Virtqueue Configuration Context}
         le16 queue_size;
         le16 queue_msix_vector;
         le16 reserved;
-        le64 queue_desc;
-        le64 queue_driver;
-        le64 queue_device;
+        le64 queue_desc;
+        le64 queue_driver;
+        le64 queue_device;
 };
 \end{lstlisting}
 
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

