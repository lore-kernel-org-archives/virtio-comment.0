Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71341146A8C
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507804; cv=fail; b=dZ5thz6nrq8HrK8+r7IZQKbkOmdZgvKKqn58e0DOgcPIoyPN/yGSbZidHYKA1aZNJJqJAxdqJVpErbeDZrb5rvgG7MEtVZqfaGqq9D0z2rNxRqaZ0ER99G+ceDrtKiTkdZp0Bh7LoTBqrff/eQt659nbQsQkgzs8HH9ZnMcrS0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507804; c=relaxed/simple;
	bh=5OgYvK7lBx5GVwGx3q+1/I/9E8sOZ1aQqR25c/TYYOo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HnElep1R8lukcdZyIpV6M9dUM83jegn2AxY7z+zjFAm1X3fDfRmUg65oghR0tMrK+zb4XZzNz/ajbG7TJawQNeDDHbws5YT2B32av1OpA03QNQf7IE/dwkdHD1hmwDNpHAIlE/9edjf7wUl5qcoyFLSvvA3RKep6/QihAD4id2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OemG/5zk; arc=fail smtp.client-ip=40.107.237.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OemG/5zk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Krjps//RdNoyk74hIxocBcHm/JQgefVgP3PvUZK+wSx2C4sD+CBtGvycepez/0yx/exVkRCyoLIC79PqyQ2kq8PZZSmq355P1ON3nZtGEt/VYrVzHLOduQFzeLiuDB97XGclGEXFYn075Ox2x4QRL7nFKRY01VSop6w+RUnNfaffPU1WFeFoFfWqykxp41ba6QEe2vYqkmhTeGfOkKF2qPNpz2+KB+gA3Rdbcy4ANuhTsz5WaEkZnZG/H9UE2sLy0iat+NTdyMjsHm6tjPDkRJM9JFbaZXFBaKoARmWUrqPqbN5jyIVDnCdqfHWj4xiZkI2HBSpXsM/z2yRTgUeL1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3u7CLqJDslMdco+ZBawLSDN60ILbSoAwXlEvtC/duwY=;
 b=Q6k4XTeAEwMQNsMwblVWWuTPedH3oyIYiKh+KxT6yZcRh9ZV6kL92nzVU+aa1yA7Ml6U3zr+7v4Qgv04TV9n+l09g1D95grQcWkj4d70eMNjdqJEOhc32EhRVYb+MLCK8b/94Pk3psIeC7StXqscaoWIjyZmXWpuhrf0Ax53jKZZRU6/vci1P/Fzz2N78f/gWyb4V1sls2Txc98LU+WZQbyJbtAQyDAy+zDNFKQUDIzgvhJhKUpE8tWRAO/P0nFdOO2EI1jcFwteS3NmaxBdsGxeFR1hqj64XQtTvQdRFnFGmL85ZyO6DyK9OIJxwwXwW5YtEBGxp788GEn1Y0eBZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3u7CLqJDslMdco+ZBawLSDN60ILbSoAwXlEvtC/duwY=;
 b=OemG/5zkLdp1ojO02Kp5j3/URxtSw8hsjbB5IYZMyR00Web8lrO6hq17V+8SmbqOg1ZJxnrX5ScxjzSHjkGY9+Rv1v0sznar5iL02rNr18KPPJeYWXyjioxriSGkOeriJP/OlPur3vVxGKHNhOtp0Vs1UmBMihlHVDdiwnxXq7zUgrttNFHMBELQXQ3jAJwcdXTifYCod3wjZ3sX9loVAdcA1/emBf86RPqBj2EdiEbGI+Q31YGfS+HBqtvSsCNqLIG5TQd2e2L/9GZTf7muUlSoap6nlPvy5aWCEIfPEPdnlFQJs7JoI7U5n+h4j070X+WUClK0XVyZINBf2to5oA==
Received: from MW4PR04CA0072.namprd04.prod.outlook.com (2603:10b6:303:6b::17)
 by SJ2PR12MB7920.namprd12.prod.outlook.com (2603:10b6:a03:4c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Tue, 4 Jun
 2024 13:29:58 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::2) by MW4PR04CA0072.outlook.office365.com
 (2603:10b6:303:6b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27 via Frontend
 Transport; Tue, 4 Jun 2024 13:29:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 13:29:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 4 Jun 2024
 06:29:40 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Jun 2024 06:29:37 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v11 06/13] admin: Add theory of operation for device resource objects
Date: Tue, 4 Jun 2024 16:28:56 +0300
Message-ID: <20240604132903.2093195-7-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|SJ2PR12MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e58cb2d-665f-4a3d-0f49-08dc849a6d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|82310400017|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/uhO5KubHGSpfSftoAIKWJ45Zj2L/eV1KGy3UXMbQgJJ2jpJzPcUvPV6/lpQ?=
 =?us-ascii?Q?9WPx8FLAFTT4H5ox6B8Elnl5l2g9m0e2fBDE6ut/LjgYgHbL+EeLpkPCXs+b?=
 =?us-ascii?Q?7XQkMQqKfvWnubIDuKSz1a4btCTCOxRHMNSVJWqR4vR3OgqTyMGNusiUGdtG?=
 =?us-ascii?Q?wO0WKqIGAEjHqTKFKjBTXVUhpUfWHjp/Q3HMw6a8SioVL8usj6u5rTiHDGkF?=
 =?us-ascii?Q?I9Ewc0m5MWK+EAbAVPfYDsRKU0O3KYZ6pgZGctMvIlDcCGyIzrRM9RfGAjua?=
 =?us-ascii?Q?8kWy6MiOYj1737b/56gHJhzKkYQxhOawSuAjxKY3XJU6CU4vZSt0y3Y7ciYr?=
 =?us-ascii?Q?Y+HphSCXvhlnYJv15QkipA/8BZ25TXYfszfW3A+TSJGmk9UpsjazQVU9DT5V?=
 =?us-ascii?Q?FCGiGyuzSANSO7sfCAs3aPOv6xok2KfKjTmMMjug3XuzLBNBorQlvSR1uEWU?=
 =?us-ascii?Q?l2VpSMX72xQYlVpuVTeE/bhuirY6/7XvOMB5HRFz20a/8vdj9bx8IpXK/9yX?=
 =?us-ascii?Q?pnGVnViR/GaUxAr+ri6DlhTcZ/2hXpW7PDk91+RliUfJjrbD+DTvNgN6A+QG?=
 =?us-ascii?Q?l71jpsdI96po7Ws1boe8Bm9LHcj0V1pCvqY07rxMnnOQjG90qqNQDbwZW4Lz?=
 =?us-ascii?Q?JS2CuLMSv0qG+HIeYsjJtFpd1ZOdHjJLI5F3XbqJBsUet54GekNhdRkdMPwR?=
 =?us-ascii?Q?/OZiSB72Biubcq9JN59bxP7LuElv94MU+3ai3f0O0y5w047lGnBCPRDJFnz6?=
 =?us-ascii?Q?TZGlFKdkPJEeLoi0E7kMID0UhRnkqE3JWtm7QQYEfdCAuJNJFn6hhWMeZ2JO?=
 =?us-ascii?Q?cCniigM9NsiEmoP6DUP7N3ztAXJtggVfpgHIGO3/7QNHmlMq9IgWLJURQILv?=
 =?us-ascii?Q?o/yrThBffxWJWlh2VQsh+u3kLzJbDxf9J0nb7SR63YmMqGKJWPTJEDnYkkji?=
 =?us-ascii?Q?dLsxeEm3rc5jlTjLaePPzHb3W0KN3+Myd1fNCLCE3LyYieJ6XfASkGFPRqHA?=
 =?us-ascii?Q?FYJ9MM/wWkAMHAoa3kWSIsU6jJFxbnwvMEWHkuk8PqTW+xqnGVqdC4JwvuY7?=
 =?us-ascii?Q?wPwq9EEF3wVxHH2gfL/mVxxbX1jnuWNiU0+usl2vXFqeCerrPeEXqGukaVNW?=
 =?us-ascii?Q?LE4vnZA3v8/3soGadElasyJzI6QYwHu/ZjwYsuEiEMlQhy/ZzDI2eU9iQzGd?=
 =?us-ascii?Q?HCVEqRxebih6wmohxoOwUMMWfjJ991Bi9MmPbsFGpfaK08LME5w4Ls4f4Q7n?=
 =?us-ascii?Q?Wts5rbdb5CzUQpXv7uev0NOjaNe0yRjA4waMcEJy/asSIkvt6QOpQvs6kWvO?=
 =?us-ascii?Q?GIIrZoU4wrYECEgfXlYDZWi08WwuPcEJJ1iG0odSXcv+b3pZCJ+bcH2nKkCM?=
 =?us-ascii?Q?f+XhQdk=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(376005)(82310400017)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 13:29:57.5522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e58cb2d-665f-4a3d-0f49-08dc849a6d81
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7920

The driver controls the device by means of device resource objects.
These operations include create, query, modify, and destroy the device
resource objects.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
changelog:
v9->v10:
- grammar corrections with article and others
- rephrase 'device resource' to 'device resource object'
- shifted description of max limit before describing the id
- renamed 'identifier' to 'id'
- rephrase around id
- rephrase from link to depend
- rephrase 'linked resource' to dependent resource
v7->v8:
- added text about administration commands execution rate behavior
---
 admin-cmds-resource-objects.tex | 69 +++++++++++++++++++++++++++++++++
 admin.tex                       |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 admin-cmds-resource-objects.tex

diff --git a/admin-cmds-resource-objects.tex b/admin-cmds-resource-objects.tex
new file mode 100644
index 0000000..a74cb3b
--- /dev/null
+++ b/admin-cmds-resource-objects.tex
@@ -0,0 +1,69 @@
+\subsubsection{Device resource objects}\label{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}
+
+Providing certain functionality consumes limited device resources such as
+memory, processing units, buffer memory, or end-to-end credits. A device may
+support multiple types of resource objects, each controlling different device
+functionality. To manage this, virtio provides
+\field{Device resource objects} that the driver can create, modify, and
+destroy using administration commands with the self group type. Creating and
+destroying a resource object consume and release device resources, respectively.
+The device resource object query command returns the resource object as
+maintained by the device.
+
+For each resource type, the number of resource objects that can be created
+is reported by the device as part of a device capability
+\ref{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}.
+The driver reports the desired (same or lower) number of resource objects
+as part of a driver capability \ref{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}.
+For each device object type, resource object limit is defined by field
+\field{limit} using \field{Device and driver capabilities}.
+
+\begin{lstlisting}
+le32 limit; /* maximum resource id = limit - 1 */
+\end{lstlisting}
+
+Each resource object has a unique resource object ID - a driver-assigned number
+in the range of 0 to \field{limit - 1}, where the \field{limit} is the maximum
+number set by the driver for this resource object type. These resource IDs are unique within
+each resource object type. The driver assigns the resource ID when creating a
+device resource object. Once the resource object is successfully created,
+subsequent resource modification, query, and destroy commands use this
+resource object ID. No two resource objects share the same ID. Destroying a
+resource object allows for the reuse of its ID for another resource object
+of the same type.
+
+A valid resource object id is \field{limit - 1}. For example, when a device
+reports a \field{limit = 10} capability for a resource object, and drivers sets
+\field{limit = 8}, the valid resource object id range for the device and the
+driver is 0 to 7 for all the resource object commands. In this example,
+the driver can only create 8 resource objects of a specified type.
+
+A resource object of one type may depend on the resource object of another type.
+Such dependency between resource objects is established by referring to the unique
+resource ID in the administration commands. For example, a driver creates a
+resource object identified by ID A of one type, then creates another resource
+object identified by ID B of a different type, which depends on resource object
+A. This dependency establishes the lifecycle of these resource objects. The driver
+that creates the dependent resource object must destroy the resource objects in the
+exact reverse order of their creation. In this example, the driver would
+destroy resource object B before destroying resource object A.
+
+Some resource object types are generic, common across multiple devices.
+Others are specific for one device type.
+
+\begin{tabular}{|l|l|}
+\hline
+Resource object type & Description \\
+\hline \hline
+0x000-0x1ff & Generic resource object type common across all devices \\
+\hline
+0x200-0x4ff & Device type specific resource object \\
+\hline
+0x500-0xffff & Reserved for future use  \\
+\hline
+\end{tabular}
+
+When the device resets, it starts with zero resources of each type; the driver
+can create resources up to the published \field{limit}. The driver can
+destroy and recreate the resource one or multiple times. Upon device reset,
+all resource objects created by the driver are destroyed within the device.
diff --git a/admin.tex b/admin.tex
index c8b3de4..d8a19c4 100644
--- a/admin.tex
+++ b/admin.tex
@@ -317,6 +317,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 
 \input{admin-cmds-legacy-interface.tex}
 \input{admin-cmds-capabilities.tex}
+\input{admin-cmds-resource-objects.tex}
 
 \devicenormative{\subsubsection}{Group administration commands}{Basic Facilities of a Virtio Device / Device groups / Group administration commands}
 
-- 
2.34.1

