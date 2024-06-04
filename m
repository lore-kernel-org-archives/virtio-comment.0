Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2058.outbound.protection.outlook.com [40.107.96.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCE5146A7A
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507808; cv=fail; b=tG4+8fBcukfSmyTUvyitsYm5+KOEs6dwe3MOKPiNvmdtGoDubrCxCEIUIlomnQiiOuD3VOv8GTyWlZn2ny0a2jeytmlDZ7WAzAlJHu83hx6IiD+pS/fyNqEUjqdDo3TWIIF8Q2xGhOp0wn9IQDNjFchzm7CO/6KavF9/KcE5thw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507808; c=relaxed/simple;
	bh=0/s77G2CGiWjLmGORwURwdbm9KqU+RU3J+EZJBzFqC8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B50JDKMcqz7eQdgUZlkMGpLX5wRcq5hMJJPVjzZowz2iwJnHuestw7a8neq5yD3ybKrgZheNjTEedzPn4xTL2Z6hfqnrYIPSZpcVDKVbVybcbkhLkbUpJoUj1cO6RV9NGz/KZF0DprCBn0uhQEFrlcdw8Fel0BD5t/oGOFwO6Cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W7QwJXEk; arc=fail smtp.client-ip=40.107.96.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W7QwJXEk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGibFh0PEbC3DMjmDjIHNEphmX8rCSNASgjsREtUd3IZqMR49JX7gERju83bBXQHY6L3Sqc4o0RnihSR7Ln2fCaU3E5hiEofkc7ZQVd4Y8kb5W708Gx+NcepDoxq1pWlAMN2VO0ZlI21/KG4HqU5lKtaTtHnkZRVs5AaOhDFwpWk4zY6DwYFk2VrGykoA7MbCyWFyNxDtADSl0ZzcYwRmkyff2xbefA3OEJvoACmcpUjXxZW6+Av2mlegC0OX0ymIPhI+Iby8Oo6BaUW7bss87nGMM0Oih2unTtYK1LrYz5LLBgqGPus9pJXwqCcI8HKyWoQKEmNI7mHW/GMcF24jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yS9iFcqc7cH0TJe2roMveVlG7C6ufcvqHR+k9pVZpHs=;
 b=n/VLMLsds28FGdaTfoREVJTk1omjj08DoL1xoP+3qam1SRNq+wIxnOUDJGS2nJtiAVGSlXfv0hwbb7suaML7MpAWt+VbHHmtUiHtLsjd/TaiD5UH35lUtOJMdqHlBFQWCENKawKOXx5No2KmsZpUfMHccW7J+sYguc20Y9Nc74+n7SRPP9Viredw+uAGF9PAFuitxJ0oAAXpil31oXe9FwT0UHZKkPnP8regMXM10yprUqcAEHmPX3OVGIWw6nRwoUwaGpn2k5dyVgorsyKY9jRQU8+6MxdYydBSPyrJKwJwyg4427mjUOh+vN3ztemsUa9nZq3sO58GYZQTZo3ZJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yS9iFcqc7cH0TJe2roMveVlG7C6ufcvqHR+k9pVZpHs=;
 b=W7QwJXEke9vHmt316OIGyo8vIh3nhzW+YsdaFcn8REcidPGFIK71OhM/arEsQ+An220CH5iyzR3qG5bKxhmm/8v736rRyvQJ7t2xCxnXgdALAu0S4KDkYuAuTJ9I9F1JHPwVvIAy00swmxYX5ppeqk6W3Ot/ADEGqmC3w0DGLIifLjUl08Q98ZV5dONu2aP4/V9Xu1QdVxFnjropdcQi6PKkBbZtfHddiT0YP2OIUlEs4jdjoyK4ko0FFeQ+VC/Ws0xpvknyfdzaYoVwB1iUJm7uIpLvQcIdVY7ZWD+9soaGWBlH6s/10WMp3uUJDj0ujey4PwW80wmDiYHNBPWLQg==
Received: from BY5PR17CA0018.namprd17.prod.outlook.com (2603:10b6:a03:1b8::31)
 by DS0PR12MB8317.namprd12.prod.outlook.com (2603:10b6:8:f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Tue, 4 Jun
 2024 13:30:01 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::25) by BY5PR17CA0018.outlook.office365.com
 (2603:10b6:a03:1b8::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.29 via Frontend
 Transport; Tue, 4 Jun 2024 13:30:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 13:30:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 4 Jun 2024
 06:29:44 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Jun 2024 06:29:41 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v11 07/13] admin: Add device resource objects admin commands
Date: Tue, 4 Jun 2024 16:28:57 +0300
Message-ID: <20240604132903.2093195-8-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|DS0PR12MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 23f26389-4d34-48fc-6aec-08dc849a6f6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fV02KbQ8OMOBX5BMlOL71pgYOgHpDn7XGcgwRhCHfmmerRi6otAmFWvkHSF6?=
 =?us-ascii?Q?sCQGirloeW4E17W7LA/e8uMkvlXnaEPoQaQXyQGAwwcvcTI9LZ9538aS8Sh4?=
 =?us-ascii?Q?qANwt2pEJjkHwklHgY2EYnEEwMUaRrMstt2B9XwZtnWccwg+eqNSjea4uwDX?=
 =?us-ascii?Q?USXudea6Pxk0W0ocpj6lkvhsJnWsarKQ3re6D103Xor4BxH1Pdxt2g+jF9bb?=
 =?us-ascii?Q?av/xTGE2UoVCtSM5Np/Uxr98FgIervkHcEmsVluvLJH25g2+1iit8JOj7zmL?=
 =?us-ascii?Q?gCI5EhKIs1IcA5VDMUDJXQOlNdB5JtUC8RK//m6JG3InXbueTOxJdX10cT4g?=
 =?us-ascii?Q?FQ6ito82zC10I82GdPnZbQtu1yCAQe8dhy1O1oYeiaSohTZSomyXYDew4sjl?=
 =?us-ascii?Q?c6e55M51mD7/vceaXgU73CyuEZg8JfOhk82Ja9ysvDpx6wG3gkhVe4ijQZYq?=
 =?us-ascii?Q?2dyQqo2hXfTE1hkvIqdXYnNx/XmjnBNiQ4tkAXlRyyMifS2eVFOu74rOLcOH?=
 =?us-ascii?Q?kfMGq8sS4YqUP+CZj+JIGT+NuaOOx0oD5rPkUqjTKvB/Vf0sWMzXuslTHYSH?=
 =?us-ascii?Q?H2YwBJwYQamS3GesDmD3H5GU71UaywNmWufFeRg7GmL0TJRud86nKyGB3B1m?=
 =?us-ascii?Q?8u/9xWdjVpW4VXEH3wU8mBddJcoplyOyy8/8D8EdrbSUOcgkMURTmC9zwlCG?=
 =?us-ascii?Q?6LrIY3vDNk98NVmCjCz/XI3IILFG90f7VrmEP0fCu/6erAS59keT9l7Opp8U?=
 =?us-ascii?Q?5kBr/8GppoiKAbCAkcsqwO2DhRACZltDiGyRFG0RLCNVvpKD9ZcXJH+Jkbzk?=
 =?us-ascii?Q?gKbVtRbog5eH39l7ZWAFc8O9AYgiKzQ8AtXSmvB9tj3vnFPCuVCGVqLZprh8?=
 =?us-ascii?Q?y5MFoNYeMb5o750qRV9wX6rmU8Rge8tDICAV4BZElh/Y7bRFMka3TzXse1ba?=
 =?us-ascii?Q?2OheMVaNFwNOOYMFLYZNhABAehWDlLWKtA3RXi9O62plF4Jzq5gRS61hh6iC?=
 =?us-ascii?Q?ZH9w5MuJfPO5PGPIzovesdJtdg2ar0Ie09SJQIEkxGOYFUAb8TvY8SI5UZqC?=
 =?us-ascii?Q?4rwgzRxIPMPghgkxx/giPStAzp0WC5B+veXEidV4yseWc8NQ3zfqfQnijixf?=
 =?us-ascii?Q?T8e7K7S3BLUXIC61/woOqEjOEdEbt04+Eg2dx9ffolrj+wqd1XZiO3HAuMO2?=
 =?us-ascii?Q?C+zwPOPt4WiQZw8J228LZO6ZaVaAY46NU4UtPndNqQXscwEx7vGM6QcDGlQh?=
 =?us-ascii?Q?MkD/X9SPFzOt8AA+lu9J4jJdDbEyDzfveAHzZrdsshRA5aJ2r4TeNY+prkE5?=
 =?us-ascii?Q?cbDhi6QKLdhprQXRTngwRxnf6sScaDBmAW/qkiWp0uwAdXa27KD26MW+OBhJ?=
 =?us-ascii?Q?Cmkl+o70THM4kGPNS/QLliiVsvCd?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 13:30:00.7764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f26389-4d34-48fc-6aec-08dc849a6f6f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8317

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
v10->v11:
- addressed comments from Satananda
- improved driver normative for two resource objects with same ID
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
index a74cb3b..291f7e6 100644
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
+The driver MUST not create a second resource object of the same type with same
+ID using command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE before destroying the
+previously created resource object.
+
+The driver MUST NOT create more resource objects of a specified \field{type} using
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

