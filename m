Return-Path: <virtio-comment-return-8322-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EA0C4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:33:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9D8E17236C
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:33:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 98A84986D43
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:33:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8CAEC986D04; Fri, 10 Nov 2023 12:33:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 750BC986D05
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcWqcJ7/pbAiQhOtKBgq3+q0BRhDNIAJtG5KALs97aEsSCi3qQaRJJf4Ujs/u11FDK1F7GfXviA/n/PGRuAeZbyGqLq5T7o8j5b8/GHn3p7sO6nZVw+RNRNapKbwQRMW0DCn4oA9MigMer0xjA3LN+a3p8nzTZbAB8zrDXMZC40HmmRU23+Vjxw/AJZsAwdri8QvCCrxAWq3PHN3WjZATOr506ns99o3YFnxabPBcAni27y3SFrOAhTNQdRHuDCSmS7U5Q0/+ikMbnb68o89bse+PJ55wr9wC/TKlhgzya7nEeLnXF23RE3b1fZnv1gUKuAbo7Y7WL+fxVyDApVhEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1OJ24AJgNW7a+xdFRs58mjvcbOjKD3Rmhqz7rVZx3s=;
 b=TALk4/D8cGJHMTPf7xbnD2ZrNbuhMukI2IfQ7fHZkqqcX3Vs/aI81l2xTu1cpLUykexo1b+wiqhUzGQcEqQqLXd8JzpOQ+agNGZnVedk7YnNbRRINCsqUrunAtwWaDy2pE9Z0dHVgrGYn9GsfPJE7hlryfhlej+WQRd8yLKLnXvAJOO0+a3QfRYPGQXk/uCpMhZe3Pa8LWADdkOYb0H5X7IE5lfVfExzS3oB7ARyuWRVYM5OvVsWYuIPz8uM0nYepppBPexcuJcslwCcCCOqlkFA+JF8jBQV66dqbhlWgyGXMUwlZ5rstV2SI30sig2/sWhinDeTz/GkNHm+rxKoow==
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
Date: Fri, 10 Nov 2023 14:31:56 +0200
Message-ID: <20231110123200.2082779-5-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|MN2PR12MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c98a919-96ee-46cc-aa91-08dbe1e92316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gvH5pMB79GxQJ0AnMR9JB0FgOs9WONX68xnLd+z+0ugHWq+Y6BuRrzzhKYlC6gjW1Xkeg5lPB9Se0IC3RE5yBeefoJYfj9a/VGLCI8wvPonwMJBVy5XBoRPmc2k4qaIV8rNxhi2ofHWX3zwWPJQEtUl6Np9kFbADzshGysW5RIe82vC9vJfPRF/V2nT3pSrYKLuW1SHB6CZcv50m+XQ9QAZPBUHJOSNEutv2TGryxnSdetcocKXR01i/Vy27cTpX0hs8CGsQe3Ip5x+DykJBR3luBCddzMND1UdJT6hCsnQ3GTrpragQD+T+kGIKgcnTQEhHcLNleiL1PYYQBlZ570czxPqlW/vOMuJjvKMEp7HQRjcvSdzWnN8g0FssFWcT2Jk7MofW1EgVUoMDI40NXUuoaBX1RBM3UeYfRj6E/PCovYmlnTd4/jXEhkonXHe10oplKUGndTttWbq9Do0iiWM500HBHCcTPDdu87uejPs/UaLQyvFbChCIhOZDEnZ2hdumSXVjw1UPhptYE1FRbrX6hVlixMondOQZNRzQBJe9vJqzgt8GNufFx6CGsdXQPiG90rVkotkWXj+5YtzFdyB3AhP4FW2EraHY7jFCSi9dYQw6+qUHNsejRvyvftMnKoMqWVJCjZhXhx5NgOqVOMPeuKeyYPwQzfuTLTrc4ZBYtfbSt4WnCF5cuf8kPaFEhQHEuoa3oaNo7DY4tgiTfE0D4sfRJVXx5qDyp2uNU/Log/dO8QUMsYIVgHr8Yd70yjv7clFyLlopt+00QQmLxAPo9oWEqCwLdl7XFk+cLwI=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(2616005)(16526019)(107886003)(26005)(1076003)(41300700001)(5660300002)(6666004)(40480700001)(426003)(336012)(40460700003)(2906002)(54906003)(30864003)(83380400001)(316002)(8676002)(8936002)(86362001)(356005)(70206006)(7636003)(82740400003)(70586007)(36860700001)(4326008)(478600001)(110136005)(47076005)(966005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:32:43.3343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c98a919-96ee-46cc-aa91-08dbe1e92316
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423
Subject: [virtio-comment] [PATCH v4 4/8] admin: Add device migration admin commands

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
v3->v4:
- made device context read command more flexible for device
  implementations
- improved read command to be finish quickly during freeze mode
  to have lowest possible downtime
- improved description for query supported fields command and
  device context to report the length in it
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
 admin-cmds-device-migration.tex | 241 +++++++++++++++++++++++++++++++-
 admin.tex                       |  16 ++-
 device-context.tex              |   7 +
 3 files changed, 262 insertions(+), 2 deletions(-)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index d172130..50871f4 100644
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
@@ -93,3 +94,241 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 
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
+as 12KB; the device responds 12KB for the first
+VIRTIO_ADMIN_CMD_DEV_CTX_SIZE_GET command, once the driver has
+already read 8KB of device context data using
+VIRTIO_ADMIN_CMD_DEV_CTX_READ command, and the remaining data is
+4KB, hence the device responds 4KB in the subsequent
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
+struct virtio_admin_cmd_dev_ctx_rd_result {
+        le64 remaining_ctx_size;
+        le32 size;
+        le32 reserved;
+        u8 data[];
+};
+\end{lstlisting}
+
+When the command completes successfully, \field{command_specific_result}
+is in the format \field{struct virtio_admin_cmd_dev_ctx_rd_result}
+returned by the device containing the device context data in the
+field \field{data} written by the device, the length of this data in
+\field{size} in bytes. The \field{remaining_ctx_size} indicates
+estimated remaining device context data in bytes.
+When the device is in \field{Freeze} mode, and if the \field{remaining_ctx_size}
+is zero, the device do not have any device context data left that the device
+can report, at this point the device context stream ends. When the
+\field{remaining_ctx_size} is non zero,
+in subsequent reads using VIRTIO_ADMIN_CMD_DEV_CTX_READ command, may return
+more or less data bytes than what is reported in \field{remaining_ctx_size}.
+
+The driver can read the whole device context data using one or multiple
+commands. When the device context does not fit in the
+\field{data} of the \field{command_specific_result}, the driver reads the
+subsequent remaining bytes using one or more subsequent commands.
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
+        u8 reserved[2];
+        le32 length;
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
+For certain fields the \field{length} is always zero; these are the fields which
+represents a dynamic array entries, where the \field{length} is not applicable,
+for example, for \field{VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC}, the device
+report \field{length} of zero; such exceptions are listed in the respective
+device context fields in the section
+\ref{sec:Basic Facilities of a Virtio Device / Device Context}.
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
index e4d586a..ab5f500 100644
--- a/device-context.tex
+++ b/device-context.tex
@@ -66,6 +66,10 @@ \section{Device Context}\label{sec:Basic Facilities of a Virtio Device / Device
 \end{tabularx}
 \end{table}
 
+Each supported device context field is reported by the device in the
+\ref{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device Migration / Device Context Supported Fields Query Command}
+command with its \field{type} listed in table \ref{tab:Device Context Fields}.
+
 \subsection{Device Context Fields}\label{sec:Basic Facilities of a Virtio Device / Device Context / Device Context Fields}
 
 Device Context Fields are of three types:
@@ -207,6 +211,9 @@ \subsubsection{Virtqueue Split Mode Device owned Descriptors Context}
 One or multiple entries of \field{struct virtio_dev_ctx_vq_split_dev_descs} may exist, each such
 entry corresponds to a virtqueue identified by the \field{vq_index}.
 
+For the field VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC, the field \field{length}
+reported in \field{struct virtio_admin_cmd_dev_ctx_supported_field} will be 0.
+
 \subsubsection{Device Configuration Context}
 \label{par:Basic Facilities of a Virtio Device / Device Context / Device Context Fields/ Device Configuration Context}
 
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

