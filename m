Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8690614E2F0
	for <virtio-comment@lists.linux.dev>; Sat,  1 Jun 2024 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717253488; cv=fail; b=Z74ELgCM845fS3/O379McOhUb8FudoywGlQx2Veynfc/WNfzkYaQCoYF/7BK/iwVVKBLk4sO+7dXm2bUzAnIsS7MbaBSeBhI4mlQClO3wMwXkIbpuRpcwtB6m5kOzCpJC4yn3EQh+bWNfdink7lPjumVTOZcYTjEXYPh0B2uhJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717253488; c=relaxed/simple;
	bh=y2WDQkg2pqSJRAtL2AWGan9q3ovuJqdt0qdmY/B3x3M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fK19Dz++FThRtO0rSWgXhNh6pa5i/gelFIdMVjPOWbhjlBHjkEL0/jpf29YyyMmsziTFVDuC6dffa+0CT01HLTVtSpDjlQv0ZAqPvxtuzmnlxjTSetdcKHgVBg05pPtzI++VNFr2Hv0Axr0+bOSAgb4XY6fninnk4A5vxaPiGbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fzbENT1o; arc=fail smtp.client-ip=40.107.223.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fzbENT1o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Co8lmudM+ZFFv/OqLkXwSo2EXxBrolhGmNBRjSwQdSPlQ/x3+JcMcVw3PNf6Vv0g+ffm0Rcon0O1QJcmy/HACxcXqNXxbM/hwEuIsF5mc3dVJCso+a1B9o4Kx6mhkSe+a154wRbdq5BKefQGcOz69cmFUOcyCgWMtOssA8Ynvk1O8rEbrYOt1cTaKe3/o4yqif1RCPPbnQW0Zdz2JAkos2mBTy4utxZedyITckAPmV1QoScHHdxDfvgx6XxMhDqksgBVeP75k3f4y8jf6C71IqfO1FcBw6fQ7j/cnFfRF1E1efy0nOrXmEQlrUNpCFygoFIU2311oKbBLhRSYsCkqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXDYYhF8qgTVNIL2zEsSeOUBxj9VVT3qC+i5uBXMhfc=;
 b=fm55wz2CV2O8NkIRFHAwCvBUWqbMlE+Prj1gs8Sz+wWKRh5r2lcZkVKVsSJQ7TB3qzyWRAL0pGDL8KmXaHx6hq+GOEHwvkJGoXKkEynAFZtHuQfSvMPHOcolaC6gltu/2IMkvh5BRwd5xTk5xdPm3MHyAtEFxzHAkmUtQFSHByc+UwQUq3k8j9GzoWf4rxRph3w7myxXqiUjBfzAvK94kbFlXMb8xmRdLYDqYy/x9afbFlMzXrUQAzVPVt98p7sqrq4qnZoVF6rkwKz0WI8Kb5xL/hofM8IiprRky2JauFSQ200fZ+KUwaGf0b6ppJVRipXYKLuB/2qbIcegTcg9ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXDYYhF8qgTVNIL2zEsSeOUBxj9VVT3qC+i5uBXMhfc=;
 b=fzbENT1orZ8xAxUr6km2iBDiKNKOmX0IpmoMLBiAG5su7ZteRGS28m44Z0Q2/Ahf/gYP3TiJcY61YAtiQnUwZSkTS0K3/lBrlAzePx4o7/XbGd0DBi568pzPPgldsdxjJE5AKN9CfSBCUSSOYlR/OSGVya0iXpfxRBD2TWgRSPz5wXlwID+MEOgbrBlmWj1Emk28d3CPXnYhPIXF6CRXoRZEiBp/CqrCR+G6e01+DGPSPoyXNQKzFThU28Hmj3vqQgC6iY6wXQ48OacHKB6dDZ0+VVKi2F919Cw7RZI5IWtbAbiWoJuMv1oLBJotfpNSLrheGmXv40dnyhSlfiQuDg==
Received: from BN8PR15CA0008.namprd15.prod.outlook.com (2603:10b6:408:c0::21)
 by MW4PR12MB6708.namprd12.prod.outlook.com (2603:10b6:303:1ed::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Sat, 1 Jun
 2024 14:51:22 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:c0:cafe::71) by BN8PR15CA0008.outlook.office365.com
 (2603:10b6:408:c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27 via Frontend
 Transport; Sat, 1 Jun 2024 14:51:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Sat, 1 Jun 2024 14:51:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 1 Jun 2024
 07:51:09 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sat, 1 Jun 2024 07:51:06 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <jasowang@redhat.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<maorg@nvidia.com>, <yishaih@nvidia.com>, <lingshan.zhu@intel.com>, "Parav
 Pandit" <parav@nvidia.com>
Subject: [PATCH v5 1/5] admin: Add theory of operation for device parts
Date: Sat, 1 Jun 2024 17:50:38 +0300
Message-ID: <20240601145042.2074739-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240601145042.2074739-1-parav@nvidia.com>
References: <20240601145042.2074739-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|MW4PR12MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1b598d-2d8f-4657-4ced-08dc824a4dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BFFUHP5kXcPKA1zfObKGcJDMrMp/t5eDXQwcGokw/vp0VdvYXl4xfhGEO9Gb?=
 =?us-ascii?Q?WUzlBKlMwEis/NJCBO+stSbH7/6Bf5AJP3cjfR0Rz809MZZgYPelsIrQ9KAi?=
 =?us-ascii?Q?cGDlWP/qUPfzcIY/3FHfmkq/ShHnbsIIpiJckqPEqozTHMpL2ik1xRXvoHIN?=
 =?us-ascii?Q?GvfKLursKdMrJx98xexjcHJGAKRDQT/RlhqweUXyosl/rrtRM2AUC+oJWcDL?=
 =?us-ascii?Q?CKxby8VSpFlk1KPkyGHKM7qfP+icXckBJp7KdNTJpQpmscgn0WDOhahrwzv2?=
 =?us-ascii?Q?ENcHAKMbaXrKgzr7T/45W1VO2TXWjIJQD95QwcQHKooQXM7Iw8oot0UzKoJE?=
 =?us-ascii?Q?awfVAukLxc8sZZGaO7cNKHdPXi6/SCsXGT7Ee2jlhQsG4RJhDuyMJG/1WRCH?=
 =?us-ascii?Q?Sd1AdBHMYKTFzs0tCprhA47PD/1RwR2680sIkOpZYgWDfv6ocFfHcrzMrron?=
 =?us-ascii?Q?0HT3wY6rDoSxWF4OokKljXUuLrx/UG9OgfayeOi8qTgn0qFumf36/lD56ysd?=
 =?us-ascii?Q?nv38GZFKnYNUnwFrhtcdTZusDc4vsejW8PEB14oGFitF9BGjGTP6d0f539Bp?=
 =?us-ascii?Q?d8EtUMkh3sEkPXgBL8+VnU3gRrRcakK001EhyKgT8HgZKcxjuNFEg+SiTcJh?=
 =?us-ascii?Q?hAiNNBLgkUAZTfX/oUrJI+lBZYg4l08DeznRzmqTXBi8HipHkg65yJdl1rdw?=
 =?us-ascii?Q?cQ5ZcQWY/RwirzR3Ixe7GgHiDk/bpTSqcOOneHWkWFxXhlsL7nTiakjfbJMn?=
 =?us-ascii?Q?2+FgF6CV9T+6Q4ZoHU2EqNRI3/dK5YE7SWi04+ISxmF728dfAOs/urQOmKzy?=
 =?us-ascii?Q?RntJdCEtg4X1gYgSb56EsF44+n1HTXSK2So1dbj4Ke+xQlHfCtFBzbVLMZsJ?=
 =?us-ascii?Q?KaIVOUwuDmj+0ploPbM3BTpp7Zp+vmRPTKNYDZWScVB5uW+W1rFk+RqInice?=
 =?us-ascii?Q?Xtajw7U1Wl0Jbi1Fc4ng7IOLGXlvFud8kLEPYmhY7WxxpCzzceU8huiKmZbD?=
 =?us-ascii?Q?7tcH+MlqgMh/tF1IwenALy3Ocg4MHA65oqFpvn6VDGhgfTHsdg+BB9X3aIO3?=
 =?us-ascii?Q?ajYYdIcV+azNjtMcySBiaP53KdjgBnD2YmkPFnSllYp16jZNnHKbYNpMKRaJ?=
 =?us-ascii?Q?x2y3Jnqcb9SxBbhScROLdBaFvzCPHBCAslDl93y63tPVzyBTf8mjT5Tsnd35?=
 =?us-ascii?Q?8IDMswMlE7S3ryyQcv6G4EhZ8cfII/HstdjWK8N12aFE/kj9Q0bUX106w1J+?=
 =?us-ascii?Q?n2ig9PHz7ZI0HadGZ+KWod2IJFsBCoc0GXir0f/NB0diyT4ekraMu8GFh7x5?=
 =?us-ascii?Q?YeDOglEsagt403nzPHhtXHBs3wlfXz9FP8NIiNgFhHvEerIbPYzQ8yvGWVVM?=
 =?us-ascii?Q?lZ3JOjU=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2024 14:51:22.2005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1b598d-2d8f-4657-4ced-08dc824a4dcc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6708

A device can get and set the state of the device which is
organized as multiple device parts. This can be useful
in cases of VM snapshot, VM migration, debug or some other use
cases.

Add the theory of operations on how to get/set device parts
and how it affects when the device is stopped or resumed.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v4->v5:
- replaced 'device context' with 'device parts'
- updated commit log to be generic device parts related
---
 admin-cmds-capabilities.tex | 16 +++++++++++
 admin-cmds-device-parts.tex | 55 +++++++++++++++++++++++++++++++++++++
 admin.tex                   |  1 +
 3 files changed, 72 insertions(+)
 create mode 100644 admin-cmds-device-parts.tex

diff --git a/admin-cmds-capabilities.tex b/admin-cmds-capabilities.tex
index 8119a56..9865254 100644
--- a/admin-cmds-capabilities.tex
+++ b/admin-cmds-capabilities.tex
@@ -51,6 +51,22 @@ \subsubsection{Device and driver capabilities}\label{sec:Basic Facilities of a V
 \end{tabularx}
 \end{table}
 
+Common capabilities are listed:
+
+\begin{table}[H]
+\caption{Common capability ids}
+\label{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / Common capability ids}
+\begin{tabularx}{\textwidth}{ |l|l|X| }
+\hline
+Id & Name & Description  \\
+\hline \hline
+0x0000 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO_DEV_PARTS_CAP]{VIRTIO_DEV_PARTS_CAP} & Device parts capability \\
+\hline
+0x0001-0x07ff & - & Generic capability for all device types \\
+\hline
+\end{tabularx}
+\end{table}
+
 Device type specific capabilities are described separately for each device
 type under \field{Device and driver capabilities}.
 
diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
new file mode 100644
index 0000000..9cec0ad
--- /dev/null
+++ b/admin-cmds-device-parts.tex
@@ -0,0 +1,55 @@
+\subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts}
+
+In some systems, there is a need to capture the state of all or part of
+a device and subsequently restore either the same device or a
+different one to this captured state. A group owner device can support
+administration commands to facilitate these get and set operations for
+the group member devices.
+
+For example, a hypervisor can use the administration commands to
+capture parts of the device state and save the result as part of
+a VM snapshot. Later, the hypervisor can retrieve the snapshot and use the
+administration commands to restore parts of a device to resume
+VM operation.
+
+As another example, these commands can be used to facilitate VM migration by the
+hypervisor: one (source) hypervisor can get parts of a device and send
+the results to another (destination) hypervisor, which will in turn
+set (restore) parts of (another) device to resume the VM operation on
+the destination.
+
+The device comprises many device parts which the driver can get and set.
+Administration commands are provided to either get and set all the device
+parts at once, or to get the device parts metadata that indicates which
+device parts are present, and later to get and set specific device parts.
+To get and set the device parts or their metadata, the driver first creates a
+device parts resource object, indicating whether the object should
+handle get or set operations but not both simultaneously. The device and the
+driver indicate the device parts resource objects' limit using the capability
+VIRTIO_DEV_PARTS_CAP.
+
+The device can be stopped to prevent device parts from changing.
+When the device is stopped, it does not initiate any transport requests.
+For instance, the device refrains from sending any configuration or
+virtqueue notifications and does not access any virtqueues or the driver's
+buffer memory. While the driver may remain active and continue to send
+notifications to the device, potentially updating some device parts,
+the device itself will not initiate any transport requests.
+
+\paragraph{VIRTIO_DEV_PARTS_CAP}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device parts / VIRTIO_DEV_PARTS_CAP}
+
+The capability VIRTIO_DEV_PARTS_CAP indicates the device parts resource objects limit.
+\field{cap_specific_data} is in the format \field{struct virtio_dev_parts_cap}.
+
+\begin{lstlisting}
+struct virtio_dev_parts_cap {
+        u8 get_parts_resource_objects_limit;
+        u8 set_parts_resource_objects_limit;
+};
+\end{lstlisting}
+
+\field{get_parts_resource_objects_limit} indicates the supported device parts
+resource objects for retrieving the device parts.
+\field{set_parts_resource_objects_limit} indicates the supported device parts
+resource objects for restoring the device parts.
diff --git a/admin.tex b/admin.tex
index 5b908ae..8ac74aa 100644
--- a/admin.tex
+++ b/admin.tex
@@ -328,6 +328,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \input{admin-cmds-legacy-interface.tex}
 \input{admin-cmds-capabilities.tex}
 \input{admin-cmds-resource-objects.tex}
+\input{admin-cmds-device-parts.tex}
 
 \devicenormative{\subsubsection}{Group administration commands}{Basic Facilities of a Virtio Device / Device groups / Group administration commands}
 
-- 
2.34.1

