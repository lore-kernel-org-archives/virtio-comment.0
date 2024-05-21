Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2067.outbound.protection.outlook.com [40.107.96.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39B96CDAF
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294638; cv=fail; b=ZYEvsyrIlN2BXXOsQimCtp4MD5JxdFxuUHJxZGsZdXqwOjZ3p7iUUehdGaAiuIBQhxRIF8SPGLXT+zQV7ZE1/JSRIHpBHzxwTfFzPGLokWsBFYv9tNCuJEDDvHkaluEIWzDp6fxpSSHd3OKsyGL89i7GAhuu46DURNUahzUK+7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294638; c=relaxed/simple;
	bh=5OgYvK7lBx5GVwGx3q+1/I/9E8sOZ1aQqR25c/TYYOo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZelIxxqb1gESnDHoA6kaqoQMFLkuX727XgnNnY3f+vl6+GdbEoG6ur8jKD9pcgl3096pXiQnlChPAF0D3RbX4FqwHiXPh5quV5GP5dCCWPmbN8TamnHIsJBJhUyVuSkrTmLSPhVqUIIYOzkvw7HiUccnRh13Ana9v4yY2jr5N8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eJy0Dmrx; arc=fail smtp.client-ip=40.107.96.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eJy0Dmrx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKwCRlMJRVs0Rs/aNkl9xH5Ml3xTs6wFGR8Eh6z3iJCPGLuYDtYv10gRLImSPTARXhbqtGwWQq3AozzgFVwiPw1WpUZ3Mf/Gh0G5FMCzVBavaIYvWgRbp8H62BSair0/+MU8TpWAS02BjyTqIPF8ZgvomjK0OWLn33svoED9R1Za2R+zp92adDlTf26iaGcQZmGi6B/k6D3vPyEJ9PDIAq4D6gF/Q2RPW+OdjXWzqDPAlu3X5WPIxDNyasrysbIf1yqXI/LkQjXv2KWkq39gJ7v2S7QIG25qdP8AahI2DW9MjgOjtfh6EWDeiCU4D9KORxzKCpgw91bcZGsl5qp0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3u7CLqJDslMdco+ZBawLSDN60ILbSoAwXlEvtC/duwY=;
 b=E1gRXXEum25Q6zouQk4jbv3s5foAetO7WIvQE84S1CNWRpi3dxCg8FZc7kF9+YM0difk27zmrC/+DCjUG7EHtsnvPto5a/g+aOQGNy5IWNnRWoP0m24/aTDGsCyJAkAB2jPqsB3SBpBS2kQh2yk0qva3mpC3TXR9K53EyZoZuf8fMVkWqCYsCJyDb+7u/XK2aa7ggInM63o6BaHBMih4LDQ5uN53/3/wg+inSL+itw3fLAsIUIUoN6YdxHta/cmbIfe7KaMu6kxPA4ZbmyJSirCDLUTczV40hJPxd2fbufFBa2iIzY8UpwoNDqjwLHRpNVZo8aTHDe6MkHH6v8zWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3u7CLqJDslMdco+ZBawLSDN60ILbSoAwXlEvtC/duwY=;
 b=eJy0DmrxD4Vc7mWJ1z1TEtHqhILDfBXUBcMnhwy98ogLe5leonBaHlE2MFX08lfRFC7f1SB76fLQqGLhWvY1EEQidzmm0v74x/N4KZDqIj0eQ1WErrfM+6fiiIR1USFFXI1frfS6G0AX0TON2rL3Y9/5OC2DHsWVndwMIMrkj7QVfVQmdhQELJoFnuagzh80KvP5RkDzMJRTvjwTuNKZ4yMKjFEKgTW/PuysYR8vp7lJdkqvmLoLw9HMDK02tLY+LPa3nJhfd00Otztyy/D9HFvhaXOjeFwAPaBMc9HEgWAr87u0ZXZmwryuZVjZT8TI26cJihN0Q1HaejcJmM4+hg==
Received: from SA9PR13CA0056.namprd13.prod.outlook.com (2603:10b6:806:22::31)
 by SN7PR12MB7884.namprd12.prod.outlook.com (2603:10b6:806:343::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 12:30:32 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:22:cafe::ab) by SA9PR13CA0056.outlook.office365.com
 (2603:10b6:806:22::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17 via Frontend
 Transport; Tue, 21 May 2024 12:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:30:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:30:15 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:30:12 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v10 06/13] admin: Add theory of operation for device resource objects
Date: Tue, 21 May 2024 15:29:30 +0300
Message-ID: <20240521122937.2004180-7-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|SN7PR12MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: ff0657b7-c09d-4322-a9ce-08dc7991ced1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|82310400017|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9btsuYWpowq+1aEB+VpaKFdOIkUQtHBlsyI7TkINHwiwhKdtWV7e4SXW2L2W?=
 =?us-ascii?Q?YEJeWo3eW7uXQGTB986jHbQXITOyJKxNnSOsa5ZD3z/LLZ9xCBn4sPtdFcwS?=
 =?us-ascii?Q?GQwmd2bL2S0IDpi1kMZhKUcWqbSrcCf6AeN6ffUwGfDvT7jychyb/zEmqUGS?=
 =?us-ascii?Q?U1pHYw8C5OwdWRdOEAMg9N0RZQKU0hhkUrFtd99VeicLXBr/+BrPfen5K206?=
 =?us-ascii?Q?ckYj+ixRYZifPJFIbtW0FfPxAPW3+hgIybo8jctIWB73AkhUtrorZr/Yz4lW?=
 =?us-ascii?Q?GzdwM0ME+8SSFDhkatde9gGdJmdN1C9XkuKxdsBjFQFyC4XhKbusM8eyK8+G?=
 =?us-ascii?Q?pm1H1TFgLwp0f9glDej2n8aBRlJA7P6mVujmxcH6VI27bNOnCxiOUrdQoiF1?=
 =?us-ascii?Q?uJk+leZRwmqBBhYhW+Vt8HsER04mS07US97b+Rn7bVRDrQJOWHZzqSGDgluq?=
 =?us-ascii?Q?29k51lthj8vDYzKjNv48ifkcWHWajNrE33NSVh1Qhun6G6Yj67OP6VBYb+fE?=
 =?us-ascii?Q?YA6Ciij36jYW2+ZyMdAdRrEuuVth6B5uYVXXisOr6aN+qnZ4GnF/AI8NfT0l?=
 =?us-ascii?Q?PazIxE2e/CesaWE8XpllU+HRV3pPCxOG/0XDPRXIVXozduAAP6ci8SimewnS?=
 =?us-ascii?Q?uyCAhKuweHnRajFqEgqpHJN24KTqfR0twrCPIaYCkwtUYIO41+UvFLFKjwED?=
 =?us-ascii?Q?/a/GRnb31es7wHPGZ/YrXBGZU4kgD8bGscqz1BLRsJ22PM8KTdoQUsONNkT4?=
 =?us-ascii?Q?MTh2IoLvA1UsJzWYJWlgsTXOmsphqdXtz6sOmLYh4kYykJdUProx2GPYbmnR?=
 =?us-ascii?Q?lD6q6Y9vyuUkLKIJUThiOF85UIN70zjJtrZTL1OzvSAevPRpyVV+Fn+nkkQR?=
 =?us-ascii?Q?2qYSBqFK6wDzCv81mFxL9Fh3o4l5lqathV1DVgBtpWxJfY+QoU2gulI3iTNP?=
 =?us-ascii?Q?bI1vOhXvd0g3gE3E+cYRoqEjN4eGSbYFlx+tdLVA9kXZN3eQErPYQn9Rd8HA?=
 =?us-ascii?Q?kxDlwfMr6VifkL+YuXlPgxCZvnnzayR2Xz8USGHYqz4pyHs/CwUGUplcPQho?=
 =?us-ascii?Q?TsfjZkisPBhZgDBBTV/j+ZsGcfd7fNLmB0OLbVQVIGCHlMLOjfeIk2MMvoZm?=
 =?us-ascii?Q?Oe4hh19TKgh3leTMceqPxonBmIcaDrEYY48IrA584m1bAnKN5zMo9r4m+Xy2?=
 =?us-ascii?Q?TiitSQRXfywAECteEUjA8J1MiazsGk2bwBNUbX7aGchRZjTI125eBPSh5uOJ?=
 =?us-ascii?Q?jozTKApG/dBpsWhAjNNnEgJFMSalrkGNvB/VWsNaw9ToKgAB9RY4h7Xyv85C?=
 =?us-ascii?Q?j6d/xrLTG3d4accpn0PeZwEc+VLgGCAd3PDwGmL0DWZB3PBlFA5QC6gdLZz3?=
 =?us-ascii?Q?yHBzoWo=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(376005)(82310400017)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:30:32.5427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0657b7-c09d-4322-a9ce-08dc7991ced1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7884

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

