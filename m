Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201C6146A88
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507786; cv=fail; b=EbuFbHIdWntGUFOTa0KyNR+wrdVkdydF9HTQ7adxzgNbeD+OG0VtKJH8Y6yS3NKdr0MxV3aEOJ2dXej64Fn7DFI2cAw/xxCCTQwoXxdrZR3uqgcOOh3+3ZjGRuoX3xpq7Bim0BXGah0XQGnAHR0W5WzCSHhA2Nt9jlh95Kr5/zE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507786; c=relaxed/simple;
	bh=QEaMVG3AWj8OHarbGgUbF1oyjNbEZ/0f/bzJDdVPVug=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UEuvG++YlzMoEmZTJUgxr0d+rj/jyR3i0+uUBjGzGpCzUaBVhKPR5POf3SSldGnUBmvmT6Bk4nBiM5OKK9mbjTOn0pX2nfIBlWhB79h5pyReayBDACmIyONE0wAZLmWIobQ/+5WtnL4yISnDxH+3MAttaPW0Y4pNYi1bD2uMKN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ARyaS2yf; arc=fail smtp.client-ip=40.107.93.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ARyaS2yf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Amg3A8mw0yEeRZWKjOi6ADZfVsZWSBqAXeKpkP2cARXUR6Rkxi900LtSNZVJJ3PgJ5zaU3T1N+bzRdl83yPnxcWvKTvAN8IyMWK/Oh1qP5aVzi4ZkAcchPwJ2aMB3kopJgux820uZa1jA7X2oZ27A4G+RKN/GAApPqNFoU/2HA8uwZLGZHAuk8Go98RYfwEFKjBqzJ1B29dl2G30vrlyrYmJ6OFB71fxp0tSZSx6Y3zNAeeWeR7RG8wLm1H805tnccskSlClbeFqd9lO7GyE6rko1PGfU9RR3LfWlmvqTh/wtqiTD9JzV+i8i4AcY/4RWPueCYlP+MAYVuVWopeykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bshnb18KHnGyQkLQ8TeTbWkVp/zWb84xdcfukUKJ3Fo=;
 b=Z+QIWA2GlYyPLfolcwoQkPqPLMGmxSeMYYD1CiIzGIapcUqfbN81NnmN/l2iR7DDcWY+dUItwd1xun41zQcAhkOrowl/rThhr1mwI/T4uDbTgvLN8GIx6HFyh5aeZjG5islVJjww7KU+REda/1s8R1iGyTnWDRJPpzcbJos357ee8cz9fxZaHHBlDERIdDdHs+3Pfi/710J2kEsVTy72xmYGaxnthCFJqnbu9Hdz6OUu//Sn1oSvALxupV8GrHo6O8cK45lAaz4P0rALyx0ZQnVquHA7EnaFsbQDi6ScoHun7sta/X1CzO6gkKBJFZLiC9qP5XwTHz7EElgLVAsnxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bshnb18KHnGyQkLQ8TeTbWkVp/zWb84xdcfukUKJ3Fo=;
 b=ARyaS2yfKs7xtrnrqyBk1eHVYndiBZ1Fn2WZ+J0tzxdwGdxiqXPQN5hh4rd2C/7RhF4nbsJ2SKMNr8+Y6IBglLNKhW5dXFi7rbXuxizTFPswZ23F8QEeXiLo9VYQ514/Ap/EXlSYFNaSNHO7jlbpMzLZhf1H8TCvc74p7CWkCKcyzxRHCfgyrKWTpbmch7Mq2mhQJ/LFD80Kj2IgU3LrDaaPfSaZ0/UHnTCrIAqWHlBQnHyUFa3SKHSbLxOVC9949Nonp8Z3Yi3w7j4tinbE4H5FKOMpSy3XDQK93uU5fuhqD+8jn3Gad/Upj8+nLpsI2+58gB6W9kfOECurJRm4gQ==
Received: from BY3PR05CA0059.namprd05.prod.outlook.com (2603:10b6:a03:39b::34)
 by MN0PR12MB6222.namprd12.prod.outlook.com (2603:10b6:208:3c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 13:29:40 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::99) by BY3PR05CA0059.outlook.office365.com
 (2603:10b6:a03:39b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.15 via Frontend
 Transport; Tue, 4 Jun 2024 13:29:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 13:29:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 4 Jun 2024
 06:29:30 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Jun 2024 06:29:27 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v11 03/13] admin: Add theory of operation for capability admin commands
Date: Tue, 4 Jun 2024 16:28:53 +0300
Message-ID: <20240604132903.2093195-4-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|MN0PR12MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: cb7a9c8e-cdcc-4a4c-770d-08dc849a632d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E4Av3fui37p1z7jav+oRqC05a5LHHLQE0jJLP6npkIhY5CI4PTXPIym8dUVU?=
 =?us-ascii?Q?PdZz2vNruCj1JEnHVobbIEukWI6PcIlkGLFZCQYH6qDKp0qs3WEP1EQkriwk?=
 =?us-ascii?Q?sYVpA9KWLVwd6jGWKZHBgIXrDR0FO9hawPB6+4PlzwNr2BkuKXsiNL4xhRSa?=
 =?us-ascii?Q?8uX2HY8xJ0btaPNb/evQTFGMhb7Hu052fb8SwEg5Y0ALjWPgdRvBTiG0tFHi?=
 =?us-ascii?Q?bhQoxcsu+4Kntp2xduhnuzhzD3bUoznjOHN852f+rZoJMespxn6qOhXLFYJA?=
 =?us-ascii?Q?T8AFHyjNusNESDaO74yKgj24d21OvUU85RjSjEBFz4Ux6uJZkqp4EwL3GBEq?=
 =?us-ascii?Q?01GCk6LqaTnUDDzy2t1EtNwQiKUBQ9ZEZebhmynfr6ZqhI329wqrx4RhzCdM?=
 =?us-ascii?Q?8xPqgAKOav4g+QpuoGplTu1/km47JUoyj+eOAa4suWSOtPuIVq07r0e3DhNZ?=
 =?us-ascii?Q?fbGW31MBAs8WOw2/Jig9+N5B2Hv71sP5ZNoODL/YiNw35YM7kSYSy/CRS0YV?=
 =?us-ascii?Q?yTcpjMQStDUeZ5cYSrnNqJojjoGcYrLwi3lxGydgdDXNjQaUdGKhtHhef4/M?=
 =?us-ascii?Q?RgnJ5es/AjG2JYWpL6w9bv1rfci69ET2OLya2Y0H7Eg+VZOnSiy0q56HlKZM?=
 =?us-ascii?Q?gLPjFUEIXNY+DTX+RonKionfERJqPC63cI+z5nvzeOxx7KkSzj15BW76G9kj?=
 =?us-ascii?Q?073VcoK9oOTc6NWMRo6C9gFpsxZIjWf3yAqYbEiRTlcXa5U6PzuXFWX6xg7C?=
 =?us-ascii?Q?v4QWuXdSBzhcf8bZideM+N3TJ8eZhMXiBzgN2JILNH95qxSR/BIyuIXBV+sD?=
 =?us-ascii?Q?+fgZHNUjqfkbZzUoucv+539Kc8WnD4CwFXBQCC4gPsF27LQfe+nl7ZsLre8W?=
 =?us-ascii?Q?6x27Wk+ZoQJXU5bLoLvp/HhicHOnMxfFGCpFy46jRSdaEHiCoeld9N70MErF?=
 =?us-ascii?Q?0HSJvUrWiMW0GDoUHgqlTwT96ghGE1DqrqQiODVLXt3Dz2KofSgQMrPNjkII?=
 =?us-ascii?Q?GA3FYCoOQRYkl5Jps2B/Ht/2QPgtQl0V+mwvo9MXm50/A37PVgF+7HyFxe1E?=
 =?us-ascii?Q?d6+6V7ndQIJ85gzlq3GIh4gVwwhs2mkRRHLmJpHNwiPewWcw1+AB+vULN8/A?=
 =?us-ascii?Q?MLZQxt3t2X93bd7wwPTAMGug1xYa7q3KuXc6UDAPmJeEfnqKI4gHuU0Ljr17?=
 =?us-ascii?Q?172yGYJ/Ltb16Jj+fkVStg43G7aNiSMS3grMYW480V5IsvqOuE73upha9ROf?=
 =?us-ascii?Q?YfD+YFtTreG9y8TGkjf/Zbo31iImDglZPMmVrzK2Wjy6lQV7CHn/FgfhW5W/?=
 =?us-ascii?Q?fBEZCnYxwwjrb21PT4kuy2JO2qly5bsGCqkUiMuWBTy3rsV/kNUhG+rgkXQl?=
 =?us-ascii?Q?wxFBFiLldgdlZS1kr+DPfc2eGBsJH3lqbEiVd0A910xz9lVOHw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 13:29:40.3209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7a9c8e-cdcc-4a4c-770d-08dc849a632d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6222

Device capability indicates the supported functionality and
resources of the device to the driver.

Driver capability indicates the supported functionality
and resources which driver will be using. Driver capability is
subset of the device capability.

Add theory of operation describing it.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
changelog:
v9->v10:
- replaced 'functionalities' to 'functionality'
- added missing article 'the'
- replaced capabilities to capability
- rephrase for listing for device type specific capabilities
- rephrase the first para description of capabilities
- moved capability type to next patch
---
 admin-cmds-capabilities.tex | 34 ++++++++++++++++++++++++++++++++++
 admin.tex                   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 admin-cmds-capabilities.tex

diff --git a/admin-cmds-capabilities.tex b/admin-cmds-capabilities.tex
new file mode 100644
index 0000000..ef9481c
--- /dev/null
+++ b/admin-cmds-capabilities.tex
@@ -0,0 +1,34 @@
+\subsubsection{Device and driver capabilities}\label{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
+
+Device and driver capabilities are implemented as structured groupings for
+specific device functionality and their related resource objects. The device exposes
+its supported functionality and resource object limits through an administration
+command, utilizing the 'self group type.' Each capability possesses a
+unique ID. Through an administration command, also employing the
+'self group type,' the driver reports the functionality and
+resource object limits it intends to use. Before executing any operations
+related to the capabilities, the driver communicates these
+capabilities to the device. The driver is allowed to set the
+capability at any time, provided there are no pending operations
+at the device level associated with that capability.
+
+The device presents the supported capability IDs to the driver as a bitmap.
+The driver uses the administration command to learn about the
+supported capabilities bitmap.
+
+A capability consists of one or more fields, where each field can be a
+limit number, a bitmap, or an array of entries. In an array field,
+the structure depends on the specific array and the capability type.
+For each bitmap field, the driver sets the desired bits - but only out of
+those bits in a bitmap that the device has presented.
+The driver sets each limit number field to a desired value that
+is smaller than or equal to the value the device presented.
+Similarly, for an array field, the driver sets the desired capability
+entries but only out of the capability entries that the device has presented.
+
+It is anticipated that any necessary new fields for a capability will be
+appended to the structure's end, ensuring both forward and backward
+compatibility between the device and driver. Furthermore, to avoid
+indefinite growth of a single capability, it is expected that new
+functionality will lead to the creation of new capability rather
+than expanding existing ones.
diff --git a/admin.tex b/admin.tex
index 7838301..56c92a6 100644
--- a/admin.tex
+++ b/admin.tex
@@ -306,6 +306,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 might differ between different group types.
 
 \input{admin-cmds-legacy-interface.tex}
+\input{admin-cmds-capabilities.tex}
 
 \devicenormative{\subsubsection}{Group administration commands}{Basic Facilities of a Virtio Device / Device groups / Group administration commands}
 
-- 
2.34.1

