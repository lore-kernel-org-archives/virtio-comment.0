Return-Path: <virtio-comment-return-7613-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6876AE95A67
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 753C377B35
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 28CA1986859
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1AC469864AD; Sun,  8 Oct 2023 11:26:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0920898685B
	for <virtio-comment@lists.oasis-open.org>; Sun,  8 Oct 2023 11:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBAW/4TR/bQLuKuq6YiCl224qLIN491aWQmN3A1nx41PWp3AVLw0lyG1yLV/U9zGRtZPhebDy0myHBHvGxDAtkVP6ADaX71IuCz11FxqsmucAHWCxxcDaLjLFLvZnrFtMDMQYbSFA0ABGLqbfB9jy1pVfBaSPVLYa4TmptngT6eaML17FUQX8C6Zd/4ktRzrcA/8mo6m+Pfay2sjHRoT3XYe7umpm7GuFFd3wupbKdoPVTiLpsYR9gu+D1pqs6SISQEVeiqMAcl4WcEO2yVbyp6fCDtwSzRN5yw/rISO9r9qchSfHZU/5k14AXphpByb/gwoNHmZY0QJ28JIdRsQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzAHvE0otJgE+Zzck/1U+NuPsSFr821q7vazSQrpYMI=;
 b=Sj3w482KCX/pcGLpPwHZOlwIPSxHwxndv2Z9cHoYFquuPwDA7ybt4j4MrTEXcjJ6LOjdcgpzmA5mgR8ZzI3y0OQXv96w5KgBRmQnx/WQYuXJ4ltZjhB2rtMO/VXSzhAALTOHcMVDDXntNtVhFzRNEtJ+b19s+NWPgm7t4gDBKk2m9GXFr6yFKQDjth3RM1Y2MNs9h+EIlu17yBntG7GzEsM1ZF4QfqDQUMj+lpwuLS5RMB61E16sh0zu5mPRHZD3XAB6zZ2TZ7Zk/CMDTOv1iv1+JM0zWww7aShJp+LNaRmy/w7mziwNlvdst7U4m6oxXqnj4Y4f5mzM9P0KKlV9qg==
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
Date: Sun, 8 Oct 2023 14:25:51 +0300
Message-ID: <20231008112555.473895-5-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|DM3PR12MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 58140dff-18e0-43cb-7876-08dbc7f16970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9C1a6cjxRrc9SjItBuWZC92GYFYWqHkyqbZlsU2jdr80onxuBjaGEVJ9WH6yHHsy9Hno6lGoZHhyb1mOVovJiOa5tz1M6i2Z975J+AnHMko/Q818lNlyXYwes5qWi3pVE3ZS28ilH+DQa0gCv5jJQj62x1CAzL+ghMpvxyPPWAZ0ZOvZDWgUwC18OAi3JxgimciEd2630bheWfUMF8it5U2b7q0mEQuAIS8j68w5iL6bgFvfSrkL0d6x1mu3JDH+ymAc6nQzAlRw/Z9tXGpcMkBWZa8cWGAuX4f7ujusA9kBCixsEEVwcC9Yskc+pTNlws8C/puuPgYi03kyZf9FlhSpthBxmQgPqQ94bFWt+/GP3KNFQkSeHpm5OlCVhQpHJhG4Js2EukWGDCambi5QfPJmoPJfBkLY6HzeK33xMlWZ0beI8ee4Hj5etXZZo4odoYohdUDjNB4KdRLcyp4mcLV7SJ5ytYSKBTHOEp6AEbFRvPkueCD0YL7RJHheHaDfyiRKmQ/VaerzhewlUuMFgZEPABr5bB7/UavI6KqbGdnYdUkm4l1Ee+M0KDpv6wrwmCdd886Aj796gSfs9WhJqrnQfBdYkwm8LaZMy0mMBlkYmMV+i1iTfiurSSPoF6cSdt37bBIXAG6IgrRWc/JmMo1Whu89qc/3V3M+BtiFjKUPTTmcBwHwtOV0X0aS9CaEnTWZcKdM0up14/ezAnzGl4dD/0yeaFDP5lHHhG46RMvzBnxDhGgUqZCx5ZVcZ47m
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39850400004)(136003)(376002)(230922051799003)(82310400011)(64100799003)(451199024)(1800799009)(186009)(46966006)(36840700001)(7636003)(356005)(86362001)(36756003)(40480700001)(2906002)(966005)(478600001)(82740400003)(30864003)(41300700001)(8936002)(5660300002)(4326008)(8676002)(6666004)(83380400001)(1076003)(426003)(336012)(2616005)(107886003)(36860700001)(316002)(70586007)(70206006)(54906003)(110136005)(26005)(16526019)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2023 11:26:27.2300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58140dff-18e0-43cb-7876-08dbc7f16970
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9285
Subject: [virtio-comment] [PATCH v1 4/8] admin: Add device migration admin commands

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

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Satananda Burla <sburla@marvell.com>
---
 admin-cmds-device-migration.tex | 201 +++++++++++++++++++++++++++++++-
 1 file changed, 200 insertions(+), 1 deletion(-)

diff --git a/admin-cmds-device-migration.tex b/admin-cmds-device-migration.tex
index f839af4..b7bfc09 100644
--- a/admin-cmds-device-migration.tex
+++ b/admin-cmds-device-migration.tex
@@ -65,7 +65,8 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 read or write. The member device context consist of any device specific
 data which is needed by the device to resume its operation when the device mode
 is changed from \field{Stop} to \field{Active} or from \field{Freeze}
-to \field{Active}.
+to \field{Active}. The device context is described in section
+\ref{sec:Basic Facilities of a Virtio Device / Device Context}.
 
 Once the device context is read, it is cleared from the device. Typically, on
 the source hypervisor, the owner driver reads the device context once when
@@ -92,3 +93,201 @@ \subsubsection{Device Migration}\label{sec:Basic Facilities of a Virtio Device /
 
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
+returned is zero or when the returned context data is less the data requested by
+the driver, the device do not have any device context data left that the device
+can report, at this point the device context stream ends.
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
+\field{struct virtio_admin_cmd_legacy_common_cfg_wr_data} describing
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
+commands. When the device context does not fit in one command result the
+driver writes the subsequent remaining bytes using one or more subsequent
+commands.
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
+is set to 0xc.
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

