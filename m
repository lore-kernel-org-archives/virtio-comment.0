Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F52E11CB
	for <virtio-comment@lists.linux.dev>; Sat, 14 Jun 2025 18:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749924815; cv=fail; b=GzP/5liMNfh3HzmU32IMdSDTlHJiu0tJXLZiPRitqDNoWcQ9XWAvF/HWIMdvyr/LBjf83MlsHVQpdAQtyZOSPydZNWm0xn5y/X/GsCJEwtSGdz775Ea6NQIXWCAe1aRJLn8iWtMJF7E+C/9uWtfyG2kheFIcY0rv9Z//g/PfMxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749924815; c=relaxed/simple;
	bh=8SUneVXgMRMYHEKvSP7dx9J523qR73xQaVG5z0YgT7A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gCuuoygyJQSS12TOfnjD1uLuRwPNd1tkSrF8Hp2fnqaINtlfF179v4mmeNJjJAM7EKBHuTlLqAtvJWBlFKfrfODV8ujApsqYZeX5GyCk4amDHEQ2UAY4+KmoeptJxBXG7Vut7LMuxjduFy4GV5I43+YhyeEb4VwAPPWpippmS2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oH02IXto; arc=fail smtp.client-ip=40.107.236.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oH02IXto"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkTX9G6i+yfR9WUFw9IOfU5MZm86ClHuYb2KLgfvT+xNl3PLX0xuZ+jazqShNvJZj38BaKp7YgBGiNuWoa3e20mskHHBKIGdDXfcsQ450IW0hP/iM971S8OZK5YltR+NuZeUehDFhDgP/FOxprCAN9tPW4GbWO/qkvwfret6cB9jXDI1EHH+UD+kNl8NAVuAnJgfN/Bdmre6prUQgra3Gz5ETQ/+/ArUb/5sHLCHnGWF/u8COkn54+06w4aktZI9cqm8pacW1wvSX12CEVrz3XIWpwsqDJjTCVLROwXtpxKfNVzWXiT9K3ujlK1AbqQnzuBwoCMKzEna/zyOZoWSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEyCuj/TvXU9kSeyiXBVttHd4pUxgQ+o5nDQwQgnO08=;
 b=rjU8Sc6EVmnoHZIlhn3L7C/zoo9IqvAdUsz/MZlOmxZR1tAsbaKbTqGDzaeqzOOWnPyZC8C9xiRfdE5FtSf9QcV6gCi6uC/vJBt2dq2ek9BtBAeXwNxsN8kACDsf1ND5qTyT3/NZfBlKPIKFK54BJ7QhrL2KJwxF1+qEyNy+JCnKxE2Q96sfiaRDYgo1FgjZu2AjyO9r7Ym7ERrSju7jD4VYhH8Iu77Z81v+yYH554tpswenwad+4lq3j2bl2YHn6o6l3VvwigAeleu6ZYEPd/kgca6ANgEu4qjNGzdbR3tzTotKhB2N7cREf9GP+bmgzifpbampc5CwfIp1aGSVig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEyCuj/TvXU9kSeyiXBVttHd4pUxgQ+o5nDQwQgnO08=;
 b=oH02IXtok6C7C3EytbRZ17FAxgfKaemLw3ux5Ud98/78R+YVBU2EM0vfExlDmFKoHEPl9zCiBbsTgBIh8bffoz+WfsYguoMqQ7v+Ia9Leun1eNzocylMaY74MV9rIxMAqVVspuw5s7C2fjgCxJTHnj5DkWfIOs9/XzuukjeDbDvnoETM5QJ5+68wTjojtxaOEbdiMfEpJIas5hdyowYdQ6L3bVNUnoXzGprI5RwtFSFVXwQmUTMSHAvUPZtv9ZIg9SW3+fT9WCXnTZBb+W5S5HzvnSE7z7d5IlrmhO10qocch7N8w7o15D1tMgZck5TsIRvJljvi88+ZeqiuzOExmA==
Received: from SJ2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:a03:505::29)
 by DS4PR12MB9794.namprd12.prod.outlook.com (2603:10b6:8:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Sat, 14 Jun
 2025 18:13:29 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::71) by SJ2PR07CA0005.outlook.office365.com
 (2603:10b6:a03:505::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Sat,
 14 Jun 2025 18:13:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Sat, 14 Jun 2025 18:13:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 14 Jun
 2025 11:13:23 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 14 Jun 2025 11:13:21 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <slp@redhat.com>, <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH] virtio-gpu: Fix missing driver conformance file
Date: Sat, 14 Jun 2025 21:13:02 +0300
Message-ID: <20250614181302.277794-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|DS4PR12MB9794:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2d7bc8-5ac8-4c21-62f4-08ddab6f2a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Abz5l4RGwfCaKsJNiSJe2iCF4wEnOcWK+w9xO5MWwKclRB/Vl8vrdISKLuDB?=
 =?us-ascii?Q?3g+ubB1UiljDLk1lonr7oog69gB9CsSRZg6aqmbB5XSYWJwhJv6CORyS2bb2?=
 =?us-ascii?Q?sF/3KpjK8BAruABkkzqYFvMSYGb7Xq4yWZwy9hSJAupPQCU+n0NzgsY8zd7w?=
 =?us-ascii?Q?iXYvyytbT12tvr336aW7k1eAsXsYmU8+B80TZQwWj1kdR3Y65lP3LQgdq8Gl?=
 =?us-ascii?Q?twX942NK0U82lflsigX5EHVRTGXvYEFnQFXcx45K4nZu1JwwES+M50CC7ny+?=
 =?us-ascii?Q?r2UxxvOsW11DQkBBOl6iKXR/Bv50RPWxglNfOMI7XyjD0t0RSp38yqt9xbW5?=
 =?us-ascii?Q?23InPw/cttiSX8F2MLSn5EOaF3RXlnGJwX0anczAuTPtAGnYwIyAiu0iD7EN?=
 =?us-ascii?Q?e8llW4CSYx0UHgvj5CXClh5PwzRrQyjPVjkTwWGzPjHKRJWqhUXvNlR+MRQU?=
 =?us-ascii?Q?TPIPVbl8P1BVOrsYQe3chCXEjaz4p2Mvz5BCHZhYhpMO9jjY9x7a3C8y9gBV?=
 =?us-ascii?Q?hczYOjdbyZ8xyMELlsODytLxnN7yFrg4e2qHTjKAiH253JLBzqWcTplPTmTj?=
 =?us-ascii?Q?ErtKDdv/SYhjRrGzzAOzP81lqeKEnD8MvxUdxinto0z1c/nhS5HJco1ocKtw?=
 =?us-ascii?Q?iUQkX/KWSvW8voizDV16jqmi3+fKLyEZ1HANI/TzbV3cI2l5jaUf2DpaBwHP?=
 =?us-ascii?Q?+y74hts5o3h/I9te0qKJD5V/XUKF+BOyRur6Aj8ANNRaHBNTrnBlmWcIt2fm?=
 =?us-ascii?Q?3EO9bjPPyHGaPkDl59CYblAzpe5+yt8QBN8h2rwrmfWg+Gmqj0j0FVgYqYYD?=
 =?us-ascii?Q?A+iU2caVGPYOOqVSAQ3IqgAg+t3cMdACOzhRchFS3zT92i0nHa9qZIoqbaXI?=
 =?us-ascii?Q?8KT1Swf6wNhUs7k+8dFWO6QsRbDQ2C2yiqYkjv+EfC+0FZNaoRSkrvogoiHr?=
 =?us-ascii?Q?8pptTnNmj88Jcsmb1YoPpFVeQHc1AApka05qhUVKCmjiTzb/uZrJi1lit0B9?=
 =?us-ascii?Q?jYxyJBlzLEB1mRPZqwND6XeUa3sPvDi9fU4AVnXqR5J6sDRl7B3roqveaXU2?=
 =?us-ascii?Q?MayqMpbdQV+dwFr7sVUmZyQYGnDD5vRYLWnukFQMR4Nv4gWlAYcRa+nNC7Yt?=
 =?us-ascii?Q?mJ23YNLftFPoy6J8HyuA702jQe5Srr1dNhOC000CUy8BXrK7q5QW1MKchYVw?=
 =?us-ascii?Q?2A4Ffi3vxqJSDVbs+ao14XVOg1FoOT8GnhLrr6nmPYi4kBUER7cYGS01V+lC?=
 =?us-ascii?Q?wFXYBx203GfnPEyD0c+SwoKEX1zDRr+mwi/6wMFotjRFrt2G23uqXECQLyhp?=
 =?us-ascii?Q?C6QtX3KYrnSjQ/im+xTgMREQNsIwhHhgBBGs/xZPJ95SYZeHc3eYAAe3F5UT?=
 =?us-ascii?Q?Tf76APIZWY06ISO3x0Ax2oijIkGzqq5xkDBNDg0kjAQngqKb0AITrpOdT26N?=
 =?us-ascii?Q?DB9HoFY7NW8j1zksYZGx8gdLPkH7z0n7sGzIsDFf/XApzYUWtaUJu5/1Vmdt?=
 =?us-ascii?Q?CS2TCWcgAR+72fulOBXa407EiBaSlHlwsmUE?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 18:13:29.3926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2d7bc8-5ac8-4c21-62f4-08ddab6f2a3e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9794

Cited patch in the fixes tag missed to include the driver-conformance
file. Add it.

Fixes: f52fb20cbe38 ("virtio-gpu: support blob alignment information")
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/gpu/driver-conformance.tex | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 device-types/gpu/driver-conformance.tex

diff --git a/device-types/gpu/driver-conformance.tex b/device-types/gpu/driver-conformance.tex
new file mode 100644
index 0000000..9ef708e
--- /dev/null
+++ b/device-types/gpu/driver-conformance.tex
@@ -0,0 +1,8 @@
+\conformance{\subsection}{GPU Driver Conformance}\label{sec:Conformance / Driver Conformance / GPU Driver Conformance}
+
+A GPU Driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Device Types / GPU Device / Device Operation / Device Operation: controlq}
+\item \ref{drivernormative:Device Types / GPU Device / Device Operation / Device Operation: controlq (3d)}
+\end{itemize}
-- 
2.34.1

