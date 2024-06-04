Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A2A146D71
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 13:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507795; cv=fail; b=c2jq5LDXblvyL/sLo31TYponYSTcPzmL//wA/5Lsuc6qkoeUw0Tyydvd28wSzYpXIphbmeARD8tsxX5JP8pSP+kk+yzYj1RYO6YiGdKRpek29I7rnR1XnNBi8cQOJysI2QN8+QdPB4offGdW7zOfH/tqYxqFz/BK3cQB88NXM+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507795; c=relaxed/simple;
	bh=Y74onfaJiCvOl26gcyFuJFcxmEOrgj87/jWbvQJKTLQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S5MUCo/p81O80P3yxchvrDr8YE2SC9H63cq9fX64QsqquQAgKe3Ygh4Pfcf3aCj2bpC5WxzNTCZT7uR+lIYcrY9TSXZpaX0rEKErg1+Z+d6/krsT4rtrw40c7CRIMvUY32oQi7HWhr0N8bEYSrmlS7o9Bm+Kuu5vImaqfSuwNSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=arghBAiw; arc=fail smtp.client-ip=40.107.92.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="arghBAiw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWdJrACNR2sbfIMykjyXT0JdTq9vSKWdDXWvfbh1RL/dn6msycKJcercFRVeEOvCrMgWINlg1QUkW/tQWKRXPXZ/Vb80txPs6qZbaAzGEmoq3q/H/N5nZzAYGioSASlGObuuM/8AieCYGNkRGbf5hY9TSh5fHBFAcT/yVs48jsobIgyc+R5vF2tFVgPup38aGcUf/FqTcmVImiOZnIAW9pokLmtsTernj83kmnkQXf3EKx8zKqRO6S69tZbTxJpYiOoSlzKffihbgKF/Bo4c3lWicAOIXp8b+nR0DKaQBJ1m6nxQ4fNuQhtEx03txbaKrL8gWC0ku45GpY5Cm7Azjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XocmiK3w52OUNMkGGqADa8JGSNcj/qj745uhGbeBWck=;
 b=akERLIkUPXCwWjg8F/UgNTZcLTPLN5gWJvGyRkozV2sD9i4hMOmmQ8289N8bhs0Tid1oaSpyvFTO1pQHCIUXYZldNoYmDP8QGFkoKV6exQjTffgAqQUgsEAmVr+IVgC9FtxvfISRyVLZ8WVyGSiDFQH75OLe88WgeV0uFzdiBMqdLC7Mq0bEMVjC8pN4gMO+OuLodw3FMicEGS0OwT8MqJnTzi5q/OGaPWiMdAQFfI3R/A1cgArPLdXQCFd25vBp6JUxHbKvpEB0a/b9EzZrCmT1aOM30xVkZo18RELsypwVQgoScDFlR1BpEntSV7B6k1ZqVIKLxkzqts/tG+ptTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XocmiK3w52OUNMkGGqADa8JGSNcj/qj745uhGbeBWck=;
 b=arghBAiwiuSRfBgK6zFKcWvNJJPktGXuKdiyb65+1e4396dTurbgS0nU5V6AC/HAy7W5v1zwTFveVAhIgOwjh3LXD+IpdbDgOs+fQyaYV1WABX6U+ZFpZrg1yH0PjnZ8hV5sh8QzEVkbcVh8DWydPSV7NyKJeH5kNVuupx11Pj7zyQrReLVj+NA1jaK1w6Moys97NLapB9Tbc1muRUnutLZ+thFipx5o/1dGbYN71vcdqea0HtBr2rlSqIrNvIRlWvcqo9xPLntQiBAi6EtM1Xy9nJfMp8CrmeCcW3dKLqfGaFgjIYQH+xlAAsUqf+pp7tNPiwUzJMoo+azApHa8zA==
Received: from BY3PR05CA0057.namprd05.prod.outlook.com (2603:10b6:a03:39b::32)
 by MN0PR12MB6003.namprd12.prod.outlook.com (2603:10b6:208:37f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Tue, 4 Jun
 2024 13:29:49 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::ef) by BY3PR05CA0057.outlook.office365.com
 (2603:10b6:a03:39b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.16 via Frontend
 Transport; Tue, 4 Jun 2024 13:29:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 13:29:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 4 Jun 2024
 06:29:34 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Jun 2024 06:29:30 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v11 04/13] admin: Prepare table for multipage listing
Date: Tue, 4 Jun 2024 16:28:54 +0300
Message-ID: <20240604132903.2093195-5-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|MN0PR12MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: 702d6cd9-fbb6-4a0f-dfd3-08dc849a687f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?azGt6set4Y60+luIWW78ifLVpJOWfJljxY8Nvc4Xf8Z7SC4zw/9AMYKOAR6X?=
 =?us-ascii?Q?FiGfme+zZqHnQA/p376IU/Gxw3tWZbVoJ1SSszJePeOYxUwf/4orezja7wKI?=
 =?us-ascii?Q?AZePHgVvgbA3rMNDP7N75je2FIOn0UdJ2/LILKIhvWi//U5jhCufVkafPt7k?=
 =?us-ascii?Q?A615eNAe4VKwdC+zAEvyFKnARbajfYc3qdVBiEeYNOAZolycfgHV2AaoSimb?=
 =?us-ascii?Q?uOdRmIzALXYu1qIdDjIdBOh9OmRJNIuIwDWxhKgeCA9U+fFR2gaIeEmU4twW?=
 =?us-ascii?Q?OgdFzzznq+7ZfSY1oln1O/Iymw9u0NESjpFHPmYr2V/9Be7I/sO490F+2tn1?=
 =?us-ascii?Q?mf4LiBD7+yx/oB17ACnBFZkQyjc1tZAvjF+v+qwgXZvroAIBNqdz4ys2gSzL?=
 =?us-ascii?Q?lify2FHAQ9wh5PJF7QpuAJDDb8LcXtTN4HcwTxdFiG3tBf0YU5YR60PyISRa?=
 =?us-ascii?Q?ngjvrcE0CwjrQfiI8a6aUSieF8PrMJbgP3Tbgo4aWI2i+UWI4+EVbMr2Kr40?=
 =?us-ascii?Q?ocK7+KRq3SIEQyKI/HrFpFhOOTGZL5xsoXN0VPOgMHRHvDxdWeqoxb0X4Qiu?=
 =?us-ascii?Q?7PvZKTLiEMedTHiLZJ+P4je6aK+0fbAT1gnGktN+vvwMiVR0WnQwLrIJE8Sz?=
 =?us-ascii?Q?4MThfrcS7LPY46GDhM0n6NwHvaoIksWmgnFs8Dw8b7DJnwuslCClMOv7iqRW?=
 =?us-ascii?Q?kKuLd/P6PUuhnyGwCKFV8O/cTfw5IFEFNmv6OeOiQmkSeKvCkUCTF4IPcS9+?=
 =?us-ascii?Q?uzOstk7SRUYbWMIX7XLjIsR6R//P/FhIlmASWXhRGtbsodDEpAnwWzBVkJC2?=
 =?us-ascii?Q?PqllsM/FkLf4nXsDziEY18HhR+AjnpTQGs0s8P3SrT2OEfVyu79SlIrOXalN?=
 =?us-ascii?Q?qyqUP+UzohY8NqgKdamWOoeV/GtViWTrzAw7taBlGP+7BUNJHW5zfyZMJDxi?=
 =?us-ascii?Q?MPxOkp2UcJd9m5VQTL2V6eVY5fiFRTM1vAMNGCZf+m6+JP7bApwtJsEJ4ptK?=
 =?us-ascii?Q?/1WZuXT87iYa2z1/0nCxVfbyhBmuHyEVyq6+Pxeo8RSDlQ+aHOeUEWiymUQn?=
 =?us-ascii?Q?BNaA3grc6I6fCti0dZPJ2885X34Hhp/d9uVmIZK6oelI80DIEoxh3BdLio+e?=
 =?us-ascii?Q?QrHXDNy9UMRzVdlgHh2fpLBK15iodLDVG7ZxYMkFNM96wQGz70pm3Jmyl9zN?=
 =?us-ascii?Q?4YQgDeGcB8ZX4pHoiYXnvLyANla0pkAwFqRl9kuvOU+QM0nZ5brr9sZgwsYF?=
 =?us-ascii?Q?xOe0pMbXVXYz2bPexRA7zvH9i0jM6M9LSWDE09UqmgEC1Wakt4uLU1bL8bTM?=
 =?us-ascii?Q?1TBvNuYs0eOhHXF/uf2lt4rWyqVT+lO7FC4iAi19xYpUeFIk213B02oyqLWu?=
 =?us-ascii?Q?0i32vf5vZDMVP6OS4ovXXjWoO+6+?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 13:29:49.2339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 702d6cd9-fbb6-4a0f-dfd3-08dc849a687f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6003

If the table spans across two pages, it is not readable.
Make use of xltabular package that supports table spanning
across multiple pages.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin.tex  | 4 ++--
 virtio.tex | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/admin.tex b/admin.tex
index 56c92a6..c93c74c 100644
--- a/admin.tex
+++ b/admin.tex
@@ -118,7 +118,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \field{opcode} specifies the command. The valid
 values for \field{opcode} can be found in the following table:
 
-\begin{tabularx}{\textwidth}{ |l||l|X| }
+\begin{xltabular}{\textwidth}{ |l||l|X| }
 \hline
 opcode & Name & Command Description \\
 \hline \hline
@@ -140,7 +140,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
 \hline
-\end{tabularx}
+\end{xltabular}
 
 The \field{group_type} specifies the group type identifier.
 The \field{group_member_id} specifies the member identifier within the group.
diff --git a/virtio.tex b/virtio.tex
index 37e49b1..7c52a40 100644
--- a/virtio.tex
+++ b/virtio.tex
@@ -35,6 +35,7 @@
 \usepackage{xltxtra}
 \usepackage{etoolbox}
 \usepackage{tabularx}
+\usepackage{xltabular}
 \usepackage{underscore}
 \usepackage{xstring}
 \usepackage{enumitem}
-- 
2.34.1

