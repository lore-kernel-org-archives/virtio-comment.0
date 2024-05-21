Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35691763F1
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294647; cv=fail; b=KVk353wc2VdHq2PCe5h7qySlQaGL1M6PPMPNrUlngltOxrRCzFFuLaC6B02IVr2ZUqKHGBIObeJHv/XCF0t71R4bsbtDhGYhXMQlHCsIualbAiA/uMWD6KnirARyc3hH0RQc4pDasb49edCLO8k68kQqmSFKlEKbHEfDDPYwpc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294647; c=relaxed/simple;
	bh=ZyUA/I1YBcIczos9Phl4jtoOYLc3Mp4mpwe2SPPNn24=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZgbKjTSxzEqKV+u6L/RmXc2idGaPV+xmrv4pFfQ9qAvEJrq41+DuLOZzos/JXfJtkMEiGa4LG6UZrPJrFHmgmXQo9DX7TL8SYjS1hY5peIavCYhd+pWoTLBCLZHy84963mw+ElY/qymWYOF11L8mGZYIX/x85fx3h8XlWFwWNKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LO4UQPp0; arc=fail smtp.client-ip=40.107.236.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LO4UQPp0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIR1iQvc/JkN25ztdOvHSCDaKwmsqelmlHFrsSRhSIx1oAvBEfthfcDqmohG6ncPql9ZbSFr3vehlsLF2MygTKRIwFkswoU3vcZqyDKFU6f1IGVnJHQAtLMr1uq6gzU9V/mFLE5KeOiFa1mdP92jbFhAnMfGC/+rBRRBY8Z52vtDgGXxrU6iXw2Xi4/8h7NGhApDcxuUmhRvbsYjTWmkAO4Wv+mJoFALPnQ4Aa/l4RW3hValm9A+sgjiej9Nj4N+hXzmLqcr2rF9DjztcaW0q7a/TzsWDH9Ejx8p6ni6Gd6ZPgzzx/YWQVrrsTrpaXSs6jxh2IOZqZv5pyivm1JZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+RgS96Hs17owDWxTkt3ASUw8XlElc9gZ7GCxxA0n9U=;
 b=LTdRy4oimoGPKr2Mq0o/oWmGAYyt4n5wbVsF/+VhELpZ79HAbgvq0TRXV8HM/lyMrmUAZ3Xvxn3iLtzT0lTu+kxavEPXMYIAX5ppUS7+q5EJziWAEKeXiY1acpY4t/aZih858rTH+k7ppLz/VeVbq5+p1uXHit9BjKHEXYYSZHIGv+Q3szrtSuvVBJGaNWgdO8JynZ89fM8C8eE11upigOMoE7OWxWJFtnNo/tdo0qi1Z7OmfUgAMcrN42xctPAgF46E4yh5OuBAcUyWqT1xsMdnhGX/5oVH0k4j3aSM1JOCCzV1E8iwpoOEx/9eZvHhQZWhzqbWtOeEcI5rUW4dUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+RgS96Hs17owDWxTkt3ASUw8XlElc9gZ7GCxxA0n9U=;
 b=LO4UQPp0/xdXAsdnHaogWAU75EwFoNCXXQnic5Ou5VdbCMabTqFOgJllVg6FI2IN+TTtGhaZZFE0RUPzGdCuKUZVW+gszTcG7NbyPpAqlr1QlnKZH7BXweyVx5Vx6OFoucpVVi6xWcvEbcJWgSUftY29ChQXdsKntqb/5EdBj7tzt2c37twZeXtE6yxpQux4NHCAQXOeP0FqG57Evrg1AmZqXJWVcxgC8eYeIseXN2xZgZ5x5ejaZHeRNJOqrAAfebhcyw6vk+bO8ke2839QHiajg+fvg0ZU1DMQbiVDL/v0yFRCODYyRy1p8v55fM9nnqpAZXfwag9tKqOL6TD+Vw==
Received: from SA9PR13CA0069.namprd13.prod.outlook.com (2603:10b6:806:23::14)
 by SJ1PR12MB6363.namprd12.prod.outlook.com (2603:10b6:a03:453::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 12:30:39 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:23:cafe::23) by SA9PR13CA0069.outlook.office365.com
 (2603:10b6:806:23::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17 via Frontend
 Transport; Tue, 21 May 2024 12:30:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:30:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:30:19 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:30:16 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v10 07/13] admin: Add device resource objects admin commands
Date: Tue, 21 May 2024 15:29:31 +0300
Message-ID: <20240521122937.2004180-8-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|SJ1PR12MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5ef038-784b-456b-6dac-08dc7991d2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0zDxbHEJMujIiY1+xfyh1QAzTEyuJplm/kbvqACDV0J9TPJeJiejSDzkFGgD?=
 =?us-ascii?Q?IYmoZyvZ/17WGipF1D7sY1cDn6e67KRYa3N23u9cadQkYCldFc3FdyA32ktK?=
 =?us-ascii?Q?y5JYnU51BJXRYVj/C+OpJCqI4JnFMHrNiX73mwEsHqGWcUCYQObP7sI5mVIe?=
 =?us-ascii?Q?YWQUzvQJKDvm+dAh1yRaEyXlRmJw0ep+8F50MhKNJm0eSKUZOOsmDWmGFeF3?=
 =?us-ascii?Q?g1DPUYISP9x2HRit6j8zLUV7mzwwbi7HR7tRakzV4v7LubSfbqhVkwH09pdX?=
 =?us-ascii?Q?AbKPYGeVSiff7Yl93J3IAmrZkLoOszzx9EPADDBpI+d8e0X2SLbeaTEEj2Ps?=
 =?us-ascii?Q?JiMq0+IrjMgJB/xu5xcCJ4IPEgZ98zA9oKp5fQ2ufd4YXzANeJ/QasCo/7tY?=
 =?us-ascii?Q?CTX9PMmobfbNAofPjEcFlXdLk+w14aF4Piruly4JsTHH0IXMUXu0sAHwM2L6?=
 =?us-ascii?Q?Yf7fq3Nw0G3Mx8cJP3uqB0Vq+HhoInXrq4tmq9+T+BhCFO+i9S0yznLKw7tO?=
 =?us-ascii?Q?JllM5Fo0klOPg4xrAf55XiSco/AZ1iT75bLX0i02oE0HJrvWT7nnu+PVhM6z?=
 =?us-ascii?Q?6vcYcQRe0nTh0ebyZA9GEFJSmXJGKayFg0VJtBKFK3GRUMNAeAh/uhOGM1l3?=
 =?us-ascii?Q?TlkytyhLJJSM5SYufhcvtzDW70jO+Lmnlw2LqT6OWwato64Mlphn8SV19YOi?=
 =?us-ascii?Q?GjjLmVRibkV2GtM2jYVmOuvwfJA010NCoOfkMQLdAVrMXRpXw4oPnPU+H78w?=
 =?us-ascii?Q?7fmWleArBRaEuaDKKYxDLq26L3kCbvzTPA2YH/8DFaJoLlXS9tmitmhlb6K9?=
 =?us-ascii?Q?vbWTXy3DYOYfg5kXqNiOl9RXekN8EgofuTvED8OaS/bBVU3JyckwvLmfEnGh?=
 =?us-ascii?Q?Q2OfTOjBO9iFdAf3ZGFXmJg1S1ZUo7VVt/4/T9ddsi2kfrVQM0nITuAyhS91?=
 =?us-ascii?Q?I+bs3nJbHRoj4D/cf4r60flNhUJnkJz6I1MHcKuStlf92nFg0wiN/hVbhbLg?=
 =?us-ascii?Q?U08yHaGGgMaQ/tdAHkl9otsJBv/3xkIQOG9I8yaOcuxwlnLTAtmz46Q+asvi?=
 =?us-ascii?Q?08LEt4Ilw846IU1TQGHEJed3dfHgR3LyQtgf+5+BlttLDZApbQ9fu51NZCi1?=
 =?us-ascii?Q?DZlBEBABnwJUZ7sbMqmhjwKs7iM0d0gCvgTBSPSbpOL5414mlx/v4NzhxF3Z?=
 =?us-ascii?Q?i7Kq46egDjAvySplBS6Vqj+1J1pj0c9VlsITDRiflVZS/PwTzkOkDK/yfKcZ?=
 =?us-ascii?Q?fZeaxjUz87e3EoFWj47DuVr3ccWvf8RCNnrmC+KAWH16jj8nTx1PAj0VnXzo?=
 =?us-ascii?Q?LxSmGOsvYmR60LWErlyZpL+W5Zaqk46oCFyiP01y6a+AKNSfdQ+4Wn0doDS1?=
 =?us-ascii?Q?JBnxEHTjnF32UAxzlITxI8qi/AOr?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:30:39.1315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5ef038-784b-456b-6dac-08dc7991d2c1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6363

Add generic administration commands create, modify, query and destroy
device resource object.

Each resource object defines resource specific attributes for the commands.
Once the resource object is created by the driver, it can be query/modify or
destroyed by the driver.

Each resource object is identified using a unique resource id per
resource type.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
changelog:
v9->v10:
- added hyperreference to quickly jump to command definition
- renamed rid to just id as it is part of the resource related structs
- removed length field from the commands as it can be derived
- rephrase for group_member_id
- squashed the patch that added the error code
- renamed and rephrase 'device resource' to 'device resource object'
- removed performance part of commit log for future and implementation
  creativity

v8->v9:
- changed command name from read_data/read_result to query_data/query_result
  to match the opcode name and description
- added fields_bmap bitmap to support future support of optional fields
  in the resources without inventing new set of commands, for example
  multiple pages in the VQ, PASID in VQ, flow counter id in flow filter rule
  etc.
- fixed spelling from 'destroyd' to 'destroyed'
- fixed 'upto' to 'up to'
---
 admin-cmds-capabilities.tex     |   3 +
 admin-cmds-resource-objects.tex | 199 ++++++++++++++++++++++++++++++++
 admin.tex                       |  14 ++-
 conformance.tex                 |   2 +
 4 files changed, 216 insertions(+), 2 deletions(-)

diff --git a/admin-cmds-capabilities.tex b/admin-cmds-capabilities.tex
index 07b8ddb..8119a56 100644
--- a/admin-cmds-capabilities.tex
+++ b/admin-cmds-capabilities.tex
@@ -210,6 +210,9 @@ \subsubsection{Device and driver capabilities}\label{sec:Basic Facilities of a V
 
 Upon a device reset, the device MUST reset all driver capabilities.
 
+The device SHOULD treat the driver resource limits as zero if the
+driver has not set such capability, unless otherwise explicitly stated.
+
 \drivernormative{\paragraph}{Device and driver capabilities}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
 
 The driver MUST send the command VIRTIO_ADMIN_CMD_DRIVER_CAP_SET before
diff --git a/admin-cmds-resource-objects.tex b/admin-cmds-resource-objects.tex
index a74cb3b..41809a0 100644
--- a/admin-cmds-resource-objects.tex
+++ b/admin-cmds-resource-objects.tex
@@ -67,3 +67,202 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 can create resources up to the published \field{limit}. The driver can
 destroy and recreate the resource one or multiple times. Upon device reset,
 all resource objects created by the driver are destroyed within the device.
+
+Following administration commands control device resource objects,
+they are only supported for the self group type:
+
+\begin{enumerate}
+\item VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
+\item VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY
+\item VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY
+\item VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY
+\end{enumerate}
+
+Each resource object administration command uses a common header
+\field{struct virtio_admin_cmd_resource_obj_cmd_hdr}.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_resource_obj_cmd_hdr {
+        le16 type;
+        u8 reserved[2];
+        le32 id; /* Indicates unique resource object id per resource object type */
+};
+
+\end{lstlisting}
+
+\field{type} refers to the device resource object type.
+\field{id} uniquely identifies the resource object of a specified \field{type}.
+
+\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}
+
+This command creates the specified resource object of \field{type} identified by the
+resource id \field{id}. The valid range of \field{id} is defined by the
+device in the related device capability. The driver assigns the unique \field{id}
+for the resource for the specified \field{type}.
+
+For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE, \field{opcode} is set to 0xa.
+\field{group_member_id} is set to zero.
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_resource_obj_create_data}.
+\field{resource_obj_specific_data} refers to the resource object specific data.
+Each resource uses a different \field{resource_obj_specific_data} and is described
+separately.
+
+\field{flags} is reserved for future extension for optional resource object attributes and
+is set to 0. Each resource object uses a different value for
+\field{flags} and it is described separately.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_resource_obj_create_data {
+        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
+        le64 flags;
+        u8 resource_obj_specific_data[];
+};
+\end{lstlisting}
+
+When the command completes successfully, the resource object is created by the
+device and the device can immediately begin using it.
+This command has no command specific result.
+
+\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY}
+
+This command modifies the attributes of an existing device resource object.
+For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY, \field{opcode} is set to 0xb.
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_resource_modify_data}.
+\field{group_member_id} is set to zero.
+\field{id} identifies the resource object of type \field{type} whose attributes
+to modify.
+This command modifies the attributes supplied in \field{resource_obj_specific_data}.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_resource_modify_data {
+        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
+        le64 flags;
+        u8 resource_obj_specific_data[];
+};
+\end{lstlisting}
+
+This command has no command specific result.
+When the command completes successfully, attributes of the resource object is
+set to the values supplied in \field{resource_obj_specific_data}.
+
+\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY}
+
+This command queries attributes of the existing resource object.
+For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY, \field{opcode} is set to 0xc.
+\field{group_member_id} is set to zero.
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_resource_obj_query_data}.
+\field{id} identifies the existing resource object of type \field{type} whose
+attributes to query.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_resource_obj_query_data {
+        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
+        le64 flags;
+};
+\end{lstlisting}
+
+\begin{lstlisting}
+struct virtio_admin_cmd_resource_obj_query_result {
+        u8 resource_obj_specific_result[];
+};
+\end{lstlisting}
+
+\field{command_specific_result} is in the format
+\field{virtio_admin_cmd_resource_obj_query_result}.
+
+When the command completes successfully, the attributes of the specified
+resource object are are set in \field{resource_obj_specific_data}.
+
+\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY}
+\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY}
+
+This command destroys the previously created device resource object.
+For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY, \field{opcode} is set to 0xd.
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_resource_obj_cmd_hdr}.
+\field{group_member_id} is set to zero.
+\field{id} identifies the existing resource object of type \field{type}.
+
+This command destroys the specified resource object of \field{type} identified
+by \field{id}, which is previously created using
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE command.
+
+This command has no command specific result.
+When the command completes successfully, the resource object is destroyed from the device.
+
+\devicenormative{\paragraph}{Device resource objects}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}
+
+The device SHOULD complete the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
+with \field{status} set to VIRTIO_ADMIN_STATUS_EEXIST if a resource object already exists
+with supplied resource \field{id} for the specified \field{type}.
+
+The device SHOULD complete the commands VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY,
+VIRTIO_ADMIN_CMD_RESOURCE_QUERY and
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY with \field{status} set to
+VIRTIO_ADMIN_STATUS_ENXIO if the specified resource object does not exist.
+
+The device SHOULD set \field{status} to VIRTIO_ADMIN_STATUS_ENOSPC for the
+command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE if the device fail to create the
+resource object.
+
+The device SHOULD complete the commands VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY or
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY commands with \field{status} set to
+VIRTIO_ADMIN_STATUS_EBUSY if other resource objects depend on the resource object
+being modified or destroyed.
+
+The device MUST allow recreating the resource object using the command
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE which was previously
+destroyed using the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY respectively
+without undergoing a device reset.
+
+The device SHOULD allow creating the resource object using
+the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE with any resource
+id as long as the resource object is not created.
+
+The device MAY fail the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE even if the
+resources within the device have not reached up to the \field{max_limit}
+but the device MAY have reached an internal limit.
+
+When a capability represents a number of resource objects, the device SHOULD
+allow creating as many resource objects as represented by the driver capability.
+
+The device MUST NOT have any side effects on the resource object when the command
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY fails.
+
+The device MUST complete the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY
+with \field{resource_obj_specific_data} which is matching the
+\field{resource_obj_specific_data} of last VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
+or VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY command.
+
+On device reset, the device MUST destroy all the resource objects which
+have been created.
+
+\drivernormative{\paragraph}{Device resource objects}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}
+
+The driver MUST not create 2 resource objects using the command
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE of the same \field{type} with same
+\field{id} before destroying them.
+
+The driver must not create more resource objects of a specified \field{type} using
+command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE than the maximum limit set by the
+driver capability.
+
+The driver SHOULD NOT modify, query and destroy the resource object which is
+already destroyed previously by the driver.
+
+The driver SHOULD NOT destroy the resource object on which other resource objects
+are depending; the driver SHOULD destroy all the resource objects which do not depend
+on other resource objects.
+
+The driver MUST NOT set the capability related to the resource objects if the
+resource objects have been created using the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
+and not yet destroyed.
+
+The driver MUST send the command VIRTIO_ADMIN_CMD_DRIVER_CAP_SET before using
+any resources related to such capability.
diff --git a/admin.tex b/admin.tex
index d8a19c4..5b908ae 100644
--- a/admin.tex
+++ b/admin.tex
@@ -142,7 +142,15 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x0009 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_DRIVER_CAP_SET]{VIRTIO_ADMIN_CMD_DRIVER_CAP_SET} & Set the driver capabilities \\
 \hline
-0x000a - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
+0x000a & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE} & Create a device resource object \\
+\hline
+0x000c & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY} & Modify a device resource object \\
+\hline
+0x000b & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY} & Query a device resource object \\
+\hline
+0x000d & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects / VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY]{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY} & Destroy a device resource object \\
+\hline
+0x000e - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
 \hline
 0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
 \hline
@@ -168,7 +176,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline \hline
 00   & VIRTIO_ADMIN_STATUS_OK    & successful completion  \\
 \hline
-06   & VIRTIO_ADMIN_STATUS_ENXIO & no such capability \\
+06   & VIRTIO_ADMIN_STATUS_ENXIO & no such capability or resource\\
 \hline
 11   & VIRTIO_ADMIN_STATUS_EAGAIN    & try again \\
 \hline
@@ -178,6 +186,8 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 22   & VIRTIO_ADMIN_STATUS_EINVAL    & invalid command \\
 \hline
+28   & VIRTIO_ADMIN_STATUS_ENOSPC    & resources exhausted on device \\
+\hline
 other   & -    & group administration command error  \\
 \hline
 \end{tabular}
diff --git a/conformance.tex b/conformance.tex
index 8b77eba..297b78a 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -100,6 +100,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:General Initialization And Device Operation / Device Cleanup}
 \item \ref{drivernormative:Reserved Feature Bits}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}
 \end{itemize}
 
 \conformance{\subsection}{PCI Driver Conformance}\label{sec:Conformance / Driver Conformance / PCI Driver Conformance}
@@ -183,6 +184,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions}
 \item \ref{devicenormative:Reserved Feature Bits}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}
 \end{itemize}
 
 \conformance{\subsection}{PCI Device Conformance}\label{sec:Conformance / Device Conformance / PCI Device Conformance}
-- 
2.34.1

