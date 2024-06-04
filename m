Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3868BF7
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507785; cv=fail; b=hlfMhupnaVVD9nkOSgddvGNWCD9xQvx9Cze2n1pUwoHsCZqOGV+YpLfGk1xH8rh7LGmzGF8DMpRJNg+BHyr3LxTxrgoL8ekIExBNZgLNgdHPUIUUsbSvT/Te6MlbHCAkAIHmPlizvh9HasGsEc6OeQxRGVhiN1lewqw+5c7cblE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507785; c=relaxed/simple;
	bh=y352v9euaOTs22jDKeMmqUOYWhcysTu27ih0JVnSvwY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=epOedXXwDQtwuuYYJGzh4TGiYNVJfZMmL9FF+00oRDFmYcEy4WIt3SRHO1aiBvY2HT9QCh4wcUvdVgWoNyvzi6BNXIXBnp6e2vztSwL+heTm/TYFkb7aFZby/6P5fzpQxmqlzA39h1IvEoKcG2El9fxdoLBZO/jcnesVubBXcIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RJNYE0kB; arc=fail smtp.client-ip=40.107.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RJNYE0kB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZWG1gB2hPYgms+ufQH9+8uqaQNwnxxTRm35Fb+7rdm3b/gEMrDodJ6TBbDeH9Gv1BCX9C4PECmK4oQBoe4gcLPw5ilRQmuQQ7hbkeAtLVf/vM/c/jPL/7H3GZVwF+14cogtZaRRKXKPnuq9IAZMYbncMQKVUljx9XvO5gazZf/VLAOI4DZsaHzqdA5FoyVkOwYW6pi44fDaFIPpLhRUzFDSPTbQgAcujUkAUGusSZCcfUq5CECRyzVE3EXmIGz8fvJMgpm/aAl7OeFE2SLCIbdwA4u3E3+AboCCexDoU4ohbjsuOIYzT6bxRjB/eBPePipzRlLn53Rl3k+4dQm1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5T7JgFmFkZ8aQ0rqZk4JpcQh8g21Jgy+7b2uGBQtaI=;
 b=dGW+ULgWrtbMDhxWZYFhvtQ+ZPN03zdzjVdaxYW7Kv3T1hLJwtAuvIIwm5aRxZe8nnxU2iM1mWkUGVe/1bGUVXZcL3DjhKwsiniQWgtXSBCchS21E14chSISQ3nMbivjRP7SC/vVsXYDd+ZaOBanpGIp9qayguaXFYRCDyo6QlwToI9X5ietAsC1jzW3sSTYKgcicb4tGTSnXMO/fA3gV/5xnvhwvAd2A0dz8EoKtmp8GnloP7zPm1MQU2crgt10bJAar/mJ4qdQFlYKmxd59TkS1wZ1GnVyMxhCqWbOfT/A7Js/ShZ75u6pxuyx5FN+8ejtQI9dmSwlDNJWIfgR8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5T7JgFmFkZ8aQ0rqZk4JpcQh8g21Jgy+7b2uGBQtaI=;
 b=RJNYE0kBgNnexwL2vGvXk5PhrZos5fldL9y38YBnFRoyS/vM7vC0yDxf7Casy3n3b+2BzhdGWRSQLGtozLsSOFy7fP16YydDMlQJLwAMeOgihWny3XzOWPlmVyNo+Ks9JImOhmXcwf9xxaR8B/cIw7CDEvTxAoGvtT95X2A/rHzMArSIAgGv+tO4a9cV3J7WJxssJoEmBTDnQDuUfFeTnu7ugPXC3EhANIM1i6o/PwY+qwfO2DsOq9xI/WKgE5zIjFgGgdzF627r26IIL9K75zQe0uRqMzoZyJfDTZPNSmC1c8IMXPf0+U6A1oHTYIP96Cz7Wn2heAgrHcsVzxsvuw==
Received: from BY3PR05CA0055.namprd05.prod.outlook.com (2603:10b6:a03:39b::30)
 by PH7PR12MB8780.namprd12.prod.outlook.com (2603:10b6:510:26b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 4 Jun
 2024 13:29:38 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::c5) by BY3PR05CA0055.outlook.office365.com
 (2603:10b6:a03:39b::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.16 via Frontend
 Transport; Tue, 4 Jun 2024 13:29:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 13:29:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 4 Jun 2024
 06:29:27 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Jun 2024 06:29:24 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v11 02/13] admin: Use already defined names for the legacy commands
Date: Tue, 4 Jun 2024 16:28:52 +0300
Message-ID: <20240604132903.2093195-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604132903.2093195-1-parav@nvidia.com>
References: <20240604132903.2093195-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|PH7PR12MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ea6550-e71f-49dd-3dfc-08dc849a6044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xdUD82M8GyS/md5XPlFUVWIjkBiv9qL5Wy9ESj1j5XJ8Dlu/c1+PWFAYcc2G?=
 =?us-ascii?Q?ou8sS3KcuRGqzasak3RtItdfC5RzQek5SARj1op50C8VopgNjOCblvP6kkFU?=
 =?us-ascii?Q?PqkP3uAKFEc1ENznpUOhoC0NLJqUu0tIE3Ac1p5bd1c+m9BQVywylZigAHQ5?=
 =?us-ascii?Q?2zFDBs3RvG/bJW7Z29/Kxgs6aNP7P3VvCQVlJ+92NRN+5SVmKkT4xngt81gQ?=
 =?us-ascii?Q?0D9eQgebrmaNURWwl0dVl8HDA0mnY9gWdsE4mJahgP3Ou9vfuyjQmyaeyHRv?=
 =?us-ascii?Q?Q5pU1xxeEql6pRYUlfUH6PO8IvpCaLWBF5rhk1HWHTThxX4Q2Gc7hIGNfLm9?=
 =?us-ascii?Q?aifkrDguFYLADm6rxXCHSJTZ3gduaOfQuiTL58dai+Qy8sI5R/o2JY9cBdxB?=
 =?us-ascii?Q?GnP/jIp/vox2FmL1GE+AUwt/C31szzvA29jjIn3Dmsc7a/BTw8kCpPTV9nUd?=
 =?us-ascii?Q?Eo2FNEni6yS3zkyG/xPTY/RMoTvti+HkOMYt5QPYoRHvIZqcVhOb6z2FrOvA?=
 =?us-ascii?Q?z4gmRA8O98wI+vce3shG04sb/MuxxhtlvjOLrpZp9PjZyuyS0nj5SGEN+Noy?=
 =?us-ascii?Q?XHE9SKqqzXG71nky+XsyWr6LCsz9w16V22gZThA+SRr6z3v1D6sRIoOHLvtF?=
 =?us-ascii?Q?nycKgNhrpPWk9EtCtaSgd+Toh8ouT2e/Vn/JdeO7oA6AVTH7cORR4sKjWH3G?=
 =?us-ascii?Q?y9B1+pQxXeQbLeTUdUYoWqsRksYXbsJ5AgiZ+uKg6xoBGQocnYMIFwFiNn0j?=
 =?us-ascii?Q?ZHSfUIdBYr7fvevn2YDyJ5YytkduE7DivC9HhZvDDFjv8CyqQBAtRmvohAPO?=
 =?us-ascii?Q?A+X/yojjuc7xlJDZDrd4DgY+tghQACpbSLndacV/v0C56grHc7hpYK6yKa8Q?=
 =?us-ascii?Q?RJO5+Qggty2NT/efjUzlu46BqJemiQ6yVN4cOnUnzx4ploMlYBbf3Hf3YZ1n?=
 =?us-ascii?Q?VWckdJg1nN/gfBEjV2PsvCQW4xWWG6EDx+aLoCmQoIZWVWzRo2ix4OUxiB87?=
 =?us-ascii?Q?3GhOGGgKK3mXaf84zaNvO5yRMFzeypRE6m4BgRl38UF44OtPdDVX8f1Kr5/x?=
 =?us-ascii?Q?oIVrj+eoU3XlpgtnNxvnIrODMzqcRRHPWp8XqAR8WaVpKi+Mw2bd14uPtb19?=
 =?us-ascii?Q?UsGhwffr/5y+hkjUM6leSuaheV3GMWq9+I1iENcArvr6dP5B11w7CpGUl7vB?=
 =?us-ascii?Q?aUPuI9pqAMMGjEEBZ/c5KB/7oCqO6FSZFtjErAUN+o7gc6cdiSt3yqgWrOsa?=
 =?us-ascii?Q?yeiVPIsbPmOYbph/4pXCkakBEBInApDzfaypH444h9wJUNgoxpgj4tRXOBCK?=
 =?us-ascii?Q?E2BmbxbiRYAs4i6rGw8NdP0+C6/i8SzwDfqxICBra84ITtL1J5b7k6D8tphi?=
 =?us-ascii?Q?OU4b/FD9o4ojY00Pgs3l7JWRcD5LgtXfQnBtkHBUDQyvvddsJw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 13:29:35.4214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ea6550-e71f-49dd-3dfc-08dc849a6044
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8780

Instead of description, use the existing name for defining the legacy
commands. While at it, prefer the shorter label names which
are already unique and refer them as hyperreference in the table
for quick naviation.

This is editorial change to align to subsequent patches.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin-cmds-legacy-interface.tex | 24 ++++++++++++++----------
 admin.tex                       | 10 +++++-----
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/admin-cmds-legacy-interface.tex b/admin-cmds-legacy-interface.tex
index b9c96d4..7b1ce4e 100644
--- a/admin-cmds-legacy-interface.tex
+++ b/admin-cmds-legacy-interface.tex
@@ -17,10 +17,10 @@ \subsubsection{Legacy Interfaces}\label{sec:Basic Facilities of a Virtio Device
 The following commands support such a legacy interface functionality:
 
 \begin{enumerate}
-\item Legacy Common Configuration Write Command
-\item Legacy Common Configuration Read Command
-\item Legacy Device Configuration Write Command
-\item Legacy Device Configuration Read Command
+\item VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_WRITE
+\item VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_READ
+\item VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_WRITE
+\item VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_READ
 \end{enumerate}
 
 These commands are currently only defined for the SR-IOV group type and
@@ -29,8 +29,8 @@ \subsubsection{Legacy Interfaces}\label{sec:Basic Facilities of a Virtio Device
 Bus / PCI Device Layout / Legacy Interfaces: A Note on PCI Device Layout} except
 that little-endian format is assumed unconditionally.
 
-\paragraph{Legacy Common Configuration Write Command}\label{par:Basic Facilities of a Virtio Device / Device groups / Group
-administration commands / Legacy Interface / Legacy Common Configuration Write Command}
+\paragraph{VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_WRITE}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_WRITE}
 
 This command has the same effect as writing into the virtio common configuration
 structure through the legacy interface. The \field{command_specific_data} is in
@@ -59,7 +59,8 @@ \subsubsection{Legacy Interfaces}\label{sec:Basic Facilities of a Virtio Device
 
 This command has no command specific result.
 
-\paragraph{Legacy Common Configuration Read Command}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / Legacy Common Configuration Read Command}
+\paragraph{VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_READ}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_READ}
 
 This command has the same effect as reading from the virtio common configuration
 structure through the legacy interface. The \field{command_specific_data} is in
@@ -94,7 +95,8 @@ \subsubsection{Legacy Interfaces}\label{sec:Basic Facilities of a Virtio Device
 returned by the device. The length of the data read is simply the length of
 \field{data}.
 
-\paragraph{Legacy Device Configuration Write Command}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / Legacy Device Configuration Write Command}
+\paragraph{VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_WRITE}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_WRITE}
 
 This command has the same effect as writing into the virtio device-specific
 configuration through the legacy interface. The \field{command_specific_data} is in
@@ -123,7 +125,8 @@ \subsubsection{Legacy Interfaces}\label{sec:Basic Facilities of a Virtio Device
 
 This command has no command specific result.
 
-\paragraph{Legacy Device Configuration Read Command}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / Legacy Device Configuration Read Command}
+\paragraph{VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_READ}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_READ}
 
 This command has the same effect as reading from the virtio device-specific
 configuration through the legacy interface. The \field{command_specific_data} is in
@@ -159,7 +162,8 @@ \subsubsection{Legacy Interfaces}\label{sec:Basic Facilities of a Virtio Device
 
 The length of the data read is simply the length of \field{data}.
 
-\paragraph{Legacy Driver Notification}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / Legacy Driver Notifications}
+\paragraph{VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO}
 
 The driver of the owner device can send a driver notification to the member
 device operated using the legacy interface by executing
diff --git a/admin.tex b/admin.tex
index 44e0f83..7838301 100644
--- a/admin.tex
+++ b/admin.tex
@@ -126,15 +126,15 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x0001 & VIRTIO_ADMIN_CMD_LIST_USE & Provides to device list of commands used for this group type \\
 \hline
-0x0002 & VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_WRITE & Writes into the legacy common configuration structure \\
+0x0002 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_WRITE]{VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_WRITE} & Writes into the legacy common configuration structure \\
 \hline
-0x0003 & VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_READ & Reads from the legacy common configuration structure  \\
+0x0003 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_READ]{VIRTIO_ADMIN_CMD_LEGACY_COMMON_CFG_READ} & Reads from the legacy common configuration structure  \\
 \hline
-0x0004 & VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_WRITE & Writes into the legacy device configuration structure \\
+0x0004 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_WRITE]{VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_WRITE} & Writes into the legacy device configuration structure \\
 \hline
-0x0005 & VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_READ & Reads into the legacy device configuration structure \\
+0x0005 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_READ]{VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_READ} & Reads into the legacy device configuration structure \\
 \hline
-0x0006 & VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO & Query the notification region information \\
+0x0006 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO]{VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO} & Query the notification region information \\
 \hline
 0x0007 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
 \hline
-- 
2.34.1

