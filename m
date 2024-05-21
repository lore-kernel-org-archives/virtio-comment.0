Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE3075811
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294622; cv=fail; b=J4UFAKrp8ninvwlixMr19v9sFALPcVM5JCOC5wCakpdKGUdVWjuPsVSztuAC4b7aBRQTPIcd4ph0OngOrXDnb7wvRXVA4cxsWfsamFkWEh5DDRdzZOz6xP08k7h+glfmD2QJHiR7Iim3KQQT5BGlceK8BN1S7RysQ/z65uoxQNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294622; c=relaxed/simple;
	bh=y352v9euaOTs22jDKeMmqUOYWhcysTu27ih0JVnSvwY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DmDSZVx8IW/FY9449HwCaNWxCsInyrmS7ecc/QcSdp5nU0Uy54oVQZU3K0mfUpgYQ+phhQUhprq8o6z1IN0MjeLxMcHSqgef37OPSg2WUzEJ05YGB1OyJDrB/SweGXqkHlRSHUn3HI6dBrVGPQ12uu45pOnCZKi+CqGiLlC+aGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WtPnOgGL; arc=fail smtp.client-ip=40.107.236.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WtPnOgGL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILqGvgngU04I5Xy5nLoIMvHKAXtjwzC5a/P/UT2poAJ0eymJVW+HjJ79ZhZOfqVf/VukvyJwNc58k6+JCWcCJRqhT5AIbwjvEcmvl2XhOziolOz39s7nmM9MmcK8M1FkLerU7p/4yDWoWSgi7RSH1tsaGl0DwLfCgulshG0IIkhzkaXID6yh4zWiQKtWnOH0XmeiXlV/h0F9at9IIbtU3GdG0RySb2eXMIBEUNpy/TTd9Dtky7rDHTz90rs0pBMgLU7tqsVcm6vjYufS1mvcd7qcjAOoafWnSf8BeZ59VWijABdUIZtNJcpO2309C55c1h4YtSOQDn0H93DmLtdAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5T7JgFmFkZ8aQ0rqZk4JpcQh8g21Jgy+7b2uGBQtaI=;
 b=HXNu50LDJnSMjIza4s78WE2GUjc5sJ8vEhQhS0zTUYP3TEAhH6+nxboNW9kirmIRBPUMEoYloH9W64eq6QTnHfKgy6SABBAlJpZP9E1rTR9y0aBNxawNW66U/nQuIu+BA3BzVnUXtgxNfbDO77oBOJuLpC9SE77fmS43kL3I9lEdtgoOG3kFRWfa+yce2/kZVpOcACA/Qv7JyYS8Z8AFFBdn5mGVp1cVrEFzTDk2iqK/jVpTRS4/WkCIWgvW/k1/Qprh1u9wZfphC4aLkeMcWgM6oPHlsDGaMtN2kHKS75mxOgwv3e6JSSmJGCj9MNryT6PsBreQWGFnfXCcWoLlkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5T7JgFmFkZ8aQ0rqZk4JpcQh8g21Jgy+7b2uGBQtaI=;
 b=WtPnOgGLaB/h5HBlsc86FornlIuImaqT+YTt/CB4MKpQS+TnJ4ITanqbRjeTUQkQ0lk0y0txIM3LAkRfPkisIy3yJRuU65hQfc7gSbYtc7u7nU76F+U/wxz8cuvgnd7ucMEgOyhSus98gwbwkTcjI14F6piAJTFB6TPUiWbWfkAkVy7zRIWfrdtnUh9MpeSxw1QekQ47X3HD2DXGzg7tieXn5Kvm1/9/yMmbMiaA3ig/ElKxviMHhCepHEMRWAwpXyU8sXIeQIgu5Vq4sjae0ETxBASn3M6r7hZD8cjkqlEelTGkMpy3vmgL+W44ULGeDYLKw/0WPj4l85zxQfOb7w==
Received: from MN2PR15CA0017.namprd15.prod.outlook.com (2603:10b6:208:1b4::30)
 by DS0PR12MB7512.namprd12.prod.outlook.com (2603:10b6:8:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.18; Tue, 21 May
 2024 12:30:15 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:1b4:cafe::9a) by MN2PR15CA0017.outlook.office365.com
 (2603:10b6:208:1b4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34 via Frontend
 Transport; Tue, 21 May 2024 12:30:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:30:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:30:01 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:29:57 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v10 02/13] admin: Use already defined names for the legacy commands
Date: Tue, 21 May 2024 15:29:26 +0300
Message-ID: <20240521122937.2004180-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521122937.2004180-1-parav@nvidia.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|DS0PR12MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 93057aae-7da7-49fc-7ca7-08dc7991c488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w9XWIilD7MS3WVgwS1dLmH0SoZViut+WdpO15AjX61k9qSAMjvo4d6Aw+l56?=
 =?us-ascii?Q?m/8uUIzGVqkmek4iWuvdN+iGx9/8KkTmpfMZhaQLrMVXHemwotLAmYRaiCOV?=
 =?us-ascii?Q?6TOz3X9lMgpkK5I6dCDsSVpVUrpWH5/Qdcj86xlhNMDUIfI1GIO5oTGnIDtI?=
 =?us-ascii?Q?w4r5FO7iv6f9wgGaVHD8xr2aBkN2g43JpjIhh+LdfWxrApoEXeAEKE+tfaEE?=
 =?us-ascii?Q?LqXcmupiCGvMEMBzAiYohpTiI0YXb6ws40RpGpQT8DUd6m5K3dhb4VvRFo3K?=
 =?us-ascii?Q?kv+wK86SV20UcGPv8x3jcqD0PZW25HGjlxo4AyugW7y2HBgtHbuxHEjEfACj?=
 =?us-ascii?Q?tjUvaG3QmTzjoX4vlNg+pnOX/Ny+ZGZ6KXsmNOZwi6VAnRZY1bH5aytz/zME?=
 =?us-ascii?Q?zQsmsu3RbYInUjDu1plYlJmLn+Qz6Qdu+p8Q/siLPuFuyt93EYLQj9LWuAqg?=
 =?us-ascii?Q?AUNp9U0tMiVTDm0ImLpo78Gxb1b85/G0AagdKaKOrO1n3veNcDcZsGfoUiMn?=
 =?us-ascii?Q?sfE3m8Yq4GM7C59j+NUdAtXLYL3ME7tYVjPJdx7NI60xRIqV2doof7mOXYOC?=
 =?us-ascii?Q?VoOQlaxRJwrBwQZMEopZNab7al2qlOOXIkezgIa5nnY7sqUzicp8zwJhaDGO?=
 =?us-ascii?Q?LJYxrmDDPVRdrivTLRz1ozHaqjCtIQBiWV38+9r806xdO9/YUWy3Cg8DyOuA?=
 =?us-ascii?Q?q9SOncO+roase7QSTwWSYsln7VRSRUEEqFbXeK2KnbYwVnMjsgOJR+T1Ze8t?=
 =?us-ascii?Q?hHcQGPsa2pueFe77eZvLy42AZL1AaCXJynMUBgoX26FMXgpYov8plpduOuZr?=
 =?us-ascii?Q?RIHfjSZOFm1ZCabOQRkwA4Pd25UO9Mbq9nxO3+V8FR3LWl8WNH3wxdZ2ru8F?=
 =?us-ascii?Q?waiN9neZAaTyZE++akaK++K4lmrV1NM9iWeUtkaIauwJ0GK2bOrat5mxI3F1?=
 =?us-ascii?Q?m8OgzSyifJAbyPU5cXBiNINJJJKfGCYf0Bo2R7g7mwYoFbX/UtZpjTNg6/ZV?=
 =?us-ascii?Q?G8rzTkiY2YROECHcIOi+svRZQiP1ravZEwE91IPDCxVakhkwtu3y95uQlYpo?=
 =?us-ascii?Q?YQRvoX5tgTv5q6etJQHoaABEvzxAP816L9tVXYtzafhEiIpdiozVcYRrjQRy?=
 =?us-ascii?Q?QLHDzzR41jmF89okjPeQclZtPRV/OIUwTPrBjdcFR1NceK8sweULpIK19zky?=
 =?us-ascii?Q?mi7Lca66Wl1bTmI2lxttwP2Qnloq0VQb3CP+wGGMIX1TA1VGPPvUjcDYhLY/?=
 =?us-ascii?Q?D3WULNiFaAfwkIOntSBmiVwDkEVU8iEiveJ/fZ0rBOCuyIDAi25rK+7MCL9/?=
 =?us-ascii?Q?miuYTcnzlqGBKaE4Fr/0dSRlCz92u9ArDsxP+nqGYjMIRtdtN7uUmVyVo0V8?=
 =?us-ascii?Q?DB8tkN2BvrCEkFnnIc2cHuqQ1JTG?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:30:15.1453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93057aae-7da7-49fc-7ca7-08dc7991c488
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7512

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

