Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2052.outbound.protection.outlook.com [40.107.102.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304A5187569
	for <virtio-comment@lists.linux.dev>; Sat,  1 Jun 2024 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717253494; cv=fail; b=ozoSaW5aDA9/4r5wy7tPbozIqmEu5W9shVDqVt1YjmlphoJlymyhr9FAMFMS/f4UcUpfzgZRA/CFCM5R7+0is+X54eCriCDrAvlsE9SYpz+4I8Zr5k7lXHjBOtR70zZZX6NeLEDflIxuE5+JnTMFutKTkLrRMGG52ZSHFtlVq9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717253494; c=relaxed/simple;
	bh=M/E0lhoktQ+5/d9ovcA829WbQ81hskL7cVNf5oiuqtk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BMNZkSrbbJ39Dn+4MI9hJqUWp1edzqKTo2iG+vOSSRFSCg1+UWjo3TqX6R8SO6UZ3PHVDla7OZpuleiLYwszoG2yzTY6LOLHZFdTKXdBj9p9QwmizpjGIy8DdwLP8A3iGIdqXojsPOJFRnCE3ha1ngTfSX+GeOqanco1XWwJl+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IWx1lwcG; arc=fail smtp.client-ip=40.107.102.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IWx1lwcG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzOq5IXm97mXBJAPb+2ftUFyFxXiD7J2b7Y29edkIsEm1cqzWgEh/3PQ4y17pFMW+b0FLYFwOgq0wMzhnYMNG/eVyZ8PgIyCtK0VENM6HGV7DYLbYCq2mFGVitLvVK/9hpsbf1jkUWymAoHOkA7hI7GO0RhjiRETlXwNF0TROpi+dTa9XzekEJ7qjKWszZF8q5CwN3lQ/rQJNykPByoNhyGcUbmVmJeO3cjzxRZ0L6S76sxrLw6egk8dWwS5PrFmNJhacXMZGLy0YNRaIxjUeactZ6JG4znbO8nLCFDOVRLYnlNJzu5Un2okN2C/MHtdBc/OXiq18Br40r5Qu6B++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcr7mEDVmRnAO2vMMRh9h3e6V9dQVGlhImITKLo0a1g=;
 b=HCBnZaVEE8cym2Ej7aRY8tluJ0QddCLYlrA8ZLK5JCwoba2cAJkyQsvR1nThUcwXlU8no5R+78pSHs9Zlv9jNoVj112Wb2izOPSx70OcfGIDpKhBy7Vs1TBACXETe16KvSAGl0BHeO+GVM6k4VmGmr89c1hX0jfuTTDUszP4yzOwZXRIlevNXabV3qOu++wW/3lb7SX39UxDDeQTAIJrxWL9x8kfVUYxpk/0fHLFURaeaT2pPaevJPpvOEvsMmKOpDz4NGkVLneTttHOpqVZYVtta2362YAQ05UBS+8kBAuUO3YnteypMMy73nACkNU3CctFpOC1uDjvQYCK6WFIzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcr7mEDVmRnAO2vMMRh9h3e6V9dQVGlhImITKLo0a1g=;
 b=IWx1lwcGF9Bd8p0rocZfxsUsmtj8IVWjF8JHQJq2TLyqSaOBZN6C1WKJyc+nQCJFHxt9N0ARMX9sfPu6kWqDkxiY4anDgWmnN+et4Wj2St2yqVxx1NOj8O0XivF7jU/Ri3SNow41J/TUcG9kugbhu9pHelsxwUTqF86k2Z2B74uSXeEOSEW1KdFgsYEyFJZuTpjOIT/Cm6YvEWMk5A1zBNEjoyWWGT66xT/yPVEFYB4g8j6Vf/SffryWHvTTNSiEZw/bDuqKA8rWMLRJKOc0Zuw7TefAW9Piu63OuLVjmgrzq5iJPH5CIBWzXrVlbXcLSw8VcIKys6KA3d/SuZp6qA==
Received: from CH0P223CA0011.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::26)
 by IA1PR12MB6484.namprd12.prod.outlook.com (2603:10b6:208:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Sat, 1 Jun
 2024 14:51:27 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::c8) by CH0P223CA0011.outlook.office365.com
 (2603:10b6:610:116::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27 via Frontend
 Transport; Sat, 1 Jun 2024 14:51:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Sat, 1 Jun 2024 14:51:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 1 Jun 2024
 07:51:12 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sat, 1 Jun 2024 07:51:09 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <jasowang@redhat.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<maorg@nvidia.com>, <yishaih@nvidia.com>, <lingshan.zhu@intel.com>, "Parav
 Pandit" <parav@nvidia.com>
Subject: [PATCH v5 2/5] admin: Extend resource objects for sr-iov group type
Date: Sat, 1 Jun 2024 17:50:39 +0300
Message-ID: <20240601145042.2074739-3-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|IA1PR12MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 49195832-b454-4f04-7b04-08dc824a50ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z8e8yrvs++S1iDbgTlOdzhY1hC+M+uYfaHFAveBfvlhxBOMGFCux3OXzv6Jj?=
 =?us-ascii?Q?MCj416SYSsoCkorHNv0Ummel5TmL7AVqJjC0GAThk7c6qQTW4+RPpNADsayd?=
 =?us-ascii?Q?ZaX6FHrqrLuLTERnVmLQxYqIJqb1eg6f7Jm8XlWeQmEixqsBytSK5Lwfjs/j?=
 =?us-ascii?Q?gVKZbNdhPGkrLPIsFBIsGxEJh2w6oJZ/YYJImL3q1t+bvcL/g9kQ9nTXJv4Q?=
 =?us-ascii?Q?zJd2DsLB+Jhk2IQhPL9iuJD+KQNO+dYGupGhmgrh4aIEjanfY8N1V0atqUre?=
 =?us-ascii?Q?Upk1JmOSvtHM2vpXXbuBTpQRZuH47a+P6ne4xs56+8FcNDEre4P7+7FTGV3F?=
 =?us-ascii?Q?2Xw6msF4A7X5jqXwSmy347UB0BZGzYfi2oOf5+haQ4rQOeYyMpHNtT6jWjyN?=
 =?us-ascii?Q?HB2qdyOzXPPFKlSoXiVjke6blzYqxC7v6kUiS/RhV29LOxgJIDOV00wzRZsD?=
 =?us-ascii?Q?T+7xTlMoQzu/0tYISPFDg9/WC1w2VkiakGr1T3OYXoS2lL2NGn5YTtJuuB9g?=
 =?us-ascii?Q?ymK/i2WPekdoWsNO/nAVZC7aHphvkCYf84V/AZFtk3Jg8yx7mHTZZ8T2oZoo?=
 =?us-ascii?Q?5qP7k/rBaXsIuU4HLKUGLDroAsRpimoyjj8QIiWJVt5Ft+Zkf68ZiDg9V4Xk?=
 =?us-ascii?Q?qgY9mPmrQ5NvOvAuvz6pVGp6/9Zj9tLBT+FUg2lGJCitWx42Xca6cuurFGDo?=
 =?us-ascii?Q?4deKofwZvTRvJbuHP4TDeE5tdNTyNueMAwCk/ukmNiqwCil4wiztTFXIdvP4?=
 =?us-ascii?Q?HZ4/hRf/uS5vri9TcX2LUfdyos/5T/wg+y9d1oaWhTVIQAtxFt0XMz7gZJI8?=
 =?us-ascii?Q?mmaFdU7P0vFTQO4WLQxhGzLIkXdlnMP4ji31jRWNEnKynuzXHZ1Vx6BkeTXn?=
 =?us-ascii?Q?xmhFXEzCImvoFFKTkakeGwhfYkX8u068ylErj6z1yfN63vt65yZeyzBH3ReA?=
 =?us-ascii?Q?GkH5Cqkrky3Vw5nDSbn3sM9YqHdH5T8LGHLCSO3GpKN+RlAVCh/xEasASPij?=
 =?us-ascii?Q?1/JEVqVOAJ+/sbrpxfjmS71cENt1V7TF0tMGLAPH3zZNKY/lYJmBGXA/Pctu?=
 =?us-ascii?Q?9kTnDghZVBc3NheBJzAg53Rl34rM5d/sJ+aWRwU+y88PParg69d8R02Gtw8B?=
 =?us-ascii?Q?ftx6VBV3+65DqXmoRxlYxq1Bf3tsbgqM9X6JrL3AAUQKVHovQJ29A66Ty4vS?=
 =?us-ascii?Q?f7SjrrB3KnTyAhHWHH/TxE8qMVTa7wIXLMNeaVsCO0uenYHzM0eBogfx+Kgw?=
 =?us-ascii?Q?Glpt6QMiZjFi1QGd6xp7R7mcSiTfzLvyePlgYG+6xhqQqCL4gDEDt7AKA5Sc?=
 =?us-ascii?Q?J1HxxY0m60ozKnLp4wC3oX1CvuAY0gYbDWwQIxsM74Ct3b29mXgHbbVVIXbW?=
 =?us-ascii?Q?fzfK4/iu9pgNcpNcFdUlqlGyr2lv?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2024 14:51:27.4783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49195832-b454-4f04-7b04-08dc824a50ea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6484

occasionally the group owner device accesses the device parts
of the member device. Extend the usage of resource objects
for member device parts access.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin-cmds-resource-objects.tex | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/admin-cmds-resource-objects.tex b/admin-cmds-resource-objects.tex
index 41809a0..acba22f 100644
--- a/admin-cmds-resource-objects.tex
+++ b/admin-cmds-resource-objects.tex
@@ -69,7 +69,9 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 all resource objects created by the driver are destroyed within the device.
 
 Following administration commands control device resource objects,
-they are only supported for the self group type:
+they are supported for the self group type, occasionally some resource
+objects can be created for the SR-IOV group type as well. Such sr-iov group
+type specific resource objects are listed where such objects is defined.
 
 \begin{enumerate}
 \item VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
@@ -102,7 +104,8 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 for the resource for the specified \field{type}.
 
 For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE, \field{opcode} is set to 0xa.
-\field{group_member_id} is set to zero.
+\field{group_member_id} is set to zero for self-group type and set to
+the member device to be accessed for the SR-IOV group type.
 The \field{command_specific_data} is in the format
 \field{struct virtio_admin_cmd_resource_obj_create_data}.
 \field{resource_obj_specific_data} refers to the resource object specific data.
@@ -132,7 +135,8 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY, \field{opcode} is set to 0xb.
 The \field{command_specific_data} is in the format
 \field{struct virtio_admin_cmd_resource_modify_data}.
-\field{group_member_id} is set to zero.
+\field{group_member_id} is set to zero for self-group type and set to
+the member device to be accessed for the SR-IOV group type.
 \field{id} identifies the resource object of type \field{type} whose attributes
 to modify.
 This command modifies the attributes supplied in \field{resource_obj_specific_data}.
@@ -154,7 +158,8 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 
 This command queries attributes of the existing resource object.
 For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY, \field{opcode} is set to 0xc.
-\field{group_member_id} is set to zero.
+\field{group_member_id} is set to zero for self-group type and set to
+the member device to be accessed for the SR-IOV group type.
 The \field{command_specific_data} is in the format
 \field{struct virtio_admin_cmd_resource_obj_query_data}.
 \field{id} identifies the existing resource object of type \field{type} whose
@@ -186,7 +191,8 @@ \subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio D
 For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY, \field{opcode} is set to 0xd.
 The \field{command_specific_data} is in the format
 \field{struct virtio_admin_cmd_resource_obj_cmd_hdr}.
-\field{group_member_id} is set to zero.
+\field{group_member_id} is set to zero for self-group type and set to
+the member device to be accessed for the SR-IOV group type.
 \field{id} identifies the existing resource object of type \field{type}.
 
 This command destroys the specified resource object of \field{type} identified
-- 
2.34.1

