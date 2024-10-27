Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DE9291E
	for <virtio-comment@lists.linux.dev>; Sun, 27 Oct 2024 04:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730004343; cv=fail; b=mIZaSUbAhspWVJ5gcC9rkPBZ0Qd7DOCwSkD0Y632/9cwFWO8vOSNkx7or1lnkNPnziGU4k+g35ZmMxUOuIm0B6Bc0R93GIBFxJHadovu7dcGVcvnDHFPI0VztKDyVZqEVlqB4DYzmLvmWWospSLD4xRlpU81xyDKIQqFrQ1KLLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730004343; c=relaxed/simple;
	bh=sm6/C+Wl108uPu2Tme54+iy/8hs2Uv/9TqvPvyKAoP8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SUDNTZWEn+y9gJWqtnfiUFbnHvvFR04zL4K3r6+b2n1P/s8g6DrtKWIeyMfYU8+sxIJY28EG6xGy+alR3wqWqwzH0BQz2xxg83ZEkLFVj1P+lP0ZzsVzrigrOEaHVet2tGbEzTTJROajjyNIT+oU+3Ci3lOBm57DpG3cUah2b4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VUrlC/EW; arc=fail smtp.client-ip=40.107.244.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VUrlC/EW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A58JcgJXvZA1ZtgE/Dtpt0dN4/KwW00BaOtGSjp7OFcdBEk9fF4BAWLIZMwcNDZxMWz03aMvxo3CEUGsRMPh7XeW19/vw5wo5WJ+e5Y0VnxhA17OvzFM/YHF7psrXR/QggfYBs1J0soOsVLbRI8PgXa0c2NZQx9opcPmbSFFEcAEmA2QZRpjbHY0BZBO5sMZfitkSLvLvlftvqZ2Uo7RI42Z9IC7DItFYckhI/RXbFp4Pzbt9DhUyjz71TKgs0+xjh1ooMiriHCgdJDXDx1tfqmcIILvbAJlxNDZ4qTGouqJKJcQwesBUE+8aAzAZ87OqS0s5wZh2iPND2MRnQlexg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMqyneu/ReWE8ky3OCtvVH4tuidT81GZG9thArmsu3s=;
 b=KyxLj0sRDJhLk+3KA0xcpD2k1CLYyvbTWCotmuAKBzZlPCsz0EDVRcs4l9Tb8Ci4TMKsQ+7A1usV968XQMkfWXWklDli9dGUTOKzoX7birvnw9m44v/7wdU0gNgx4rYklSAJVGvCzGavYJ55vD05EgNrx+2/EfHo6WlVlyTjoCKRmSgRrDSWh8w29BGJtnJqMf6SLgbwToAj+TugkumRVUpG3qLvNbSWUGPN7gyUsQTHH8boXb3K4aipBGfNG2gHopy1AfdEvkPm/xV9hwQ5H6b3/1ZNtOaNDKo/1eRebHId7zdMvLiiJ05criGEse9olgFddHNozkQFmCCthj1KJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMqyneu/ReWE8ky3OCtvVH4tuidT81GZG9thArmsu3s=;
 b=VUrlC/EWYfs+yFmdWmmpJEicXcP7Ypn6INDOVnpay8vAZWmw43KkxrAqU70wYDuFqqnBdYZmmvnB+MYgg7KDXIE1n5e0AhfR4iS6h6EBi7zeKo/0EszPo8nhlPi/i78ZBCEJckbIbfmNj7dZtPvGp7G2CCy9mJT6hFMc6pZVIiU3P+ZHjcquvwk33fFfWe7bLxfRmkU1RzG6F/K2y+DKgcZZNlgfMwKRbxfJBOciAXrImWTAzOZEFI1XuPeraaphr5AFhxYQAp069hywR5EHwVmAMaKm37XWb1J9jWlFQVNT51ATL3SsDvf0WnAAuF3mUZqOjkqOPehOz18VEB/lwg==
Received: from BYAPR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:40::27)
 by PH8PR12MB7134.namprd12.prod.outlook.com (2603:10b6:510:22d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Sun, 27 Oct
 2024 04:45:35 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:40:cafe::9e) by BYAPR04CA0014.outlook.office365.com
 (2603:10b6:a03:40::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.22 via Frontend
 Transport; Sun, 27 Oct 2024 04:45:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Sun, 27 Oct 2024 04:45:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 26 Oct
 2024 21:45:17 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sat, 26 Oct 2024 21:45:15 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH] virtio-gpu: Fix spelling error
Date: Sun, 27 Oct 2024 06:44:57 +0200
Message-ID: <20241027044457.495730-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|PH8PR12MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: d82c7bfd-526b-4efa-d607-08dcf6423271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Aheouy3xjil/Xhz7unSyigrJeJyBu3EtXFS8TOl38N9FwT9I1v97bdenPTu?=
 =?us-ascii?Q?q/io48IPLfG4XPbdA07GhNJBf9zztp3o+H1onHvrVDdOAjmo320y53vjdr9k?=
 =?us-ascii?Q?PralCxXZYOCFQFw3fLKViy9nOl/bjG2rte408Pk41s9HBdGKk2APw+hZJC8q?=
 =?us-ascii?Q?dI95PpZZEeN8a3LmYQi4gIiOfbfEn1b9rdgJw66XDuk3U1Ss0ZtkcARdsSXj?=
 =?us-ascii?Q?mlUQ6RTtHptLjWhrYN2xI/0O7Uc7vkD6Vw++T6J2uPkT+5c26LhR8BtGJMbw?=
 =?us-ascii?Q?4V8ILVzJuxTqyza5DcRZoGjwW2IcOV5GABcHRG0evNiQQywk56t0HG4xMbGX?=
 =?us-ascii?Q?SSmHCpMdHJgFyqLyEr5bfW8JBQHxa06zuPzdcWP2m6I3zFeXkGZpN7+qza+e?=
 =?us-ascii?Q?sF49sEd2jn4Apa4YB4OVGJzNOF4Jyvs84xuF590YjrD24uuBXmzYAHgMTnXE?=
 =?us-ascii?Q?oDi2o0Rh9vDw3/bXYyA7MLqxk/SF1GjXHssnj++KeLn6t8yb+Onls2jJn6q/?=
 =?us-ascii?Q?1YTxfCOeM/VxaEnNYps5oIopI+LfhUoFM/ZJPfDihuh1UAC8pXpjyKlbRLFM?=
 =?us-ascii?Q?5UrpzDRQ+U5W2oojY92QfdEHQJEVaVZp6EIa1TN+JUwjjK4p247H8SS2SmjY?=
 =?us-ascii?Q?tVW5RfbSyvS1qcV2Z0BKAh75e4WmtodjaEeJTY3VQmySXGrjbb2C/rO2rqGq?=
 =?us-ascii?Q?2jZkGEmHs6KL2h4uGLbFN2unRbEOob2EAd+yDNbElbRkgGiAgsyRglXGtTzT?=
 =?us-ascii?Q?UUuthJsR6VRLpnXkNTSoqFV/OlPGxadlHKUnY1+vOv1/2mDV25WrboVOuV8H?=
 =?us-ascii?Q?m4iwt6Nl5ZxFMaq0ORIo8LwDTy8GVJH3/N2QnCNuThDdhAloMyL+H3COnBAH?=
 =?us-ascii?Q?fLlAQ8hXrE4MIBYgbVpCNyUpNSAvwXGwxFGEToplV7vfGZMwHKQI6Ab7KFG0?=
 =?us-ascii?Q?6gSCPbFQU7QrJDXnyE8a8GX05gTVXUpzcjCDukvOcmvP0c4sOBxNLkT1MjkE?=
 =?us-ascii?Q?qNyrDgzuTDViHncnjXHyAUBWyWc6EtfN075enxx+3fabQXUIJzTQCHrRyVP9?=
 =?us-ascii?Q?vCyJkFDNrL3VojrteyKVgzsMT9x9F/8Gb4mUa3ZYogSYJarjK1ht4U1TzNwm?=
 =?us-ascii?Q?vnv1rDOJNeSLuIiKD2dzgm9JQyPRE6cFDBgkqVrsPS++N4yq0OwSEZe33OYL?=
 =?us-ascii?Q?rl2YG23l2JepkTS3Ikqe2K1/SHSgrwQSTNczMZiwJ41nZmLBGM4H7BuCJU35?=
 =?us-ascii?Q?SCP0F3TDwp1phUklgSRglWq86zS1UfHFZ4AaZk1X0oknt5/1n+avEfOepJFR?=
 =?us-ascii?Q?7ZVctF9AzgHkS+sJoOC8G5sRpBiLUXeIezvN5KtE0LJfNsBQ5o5Z1Z35TD4t?=
 =?us-ascii?Q?2yszltRH9J8vtcXhF1diyia7NXnrcajjf1HhJL7dRDPOp7rI1g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2024 04:45:35.4207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d82c7bfd-526b-4efa-d607-08dcf6423271
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7134

Fix spelling error.

Fixes: fed64230bf31 ("Add virtio gpu device specification.")
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/192
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/gpu/description.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index ba4ea76..c5706bc 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -128,7 +128,7 @@ \subsubsection{Device Operation: Create a framebuffer and configure scanout}
 \item Allocate a framebuffer from guest ram, and attach it as backing
   storage to the resource just created, using
   VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING.  Scatter lists are
-  supported, so the framebuffer doesn't need to be contignous in guest
+  supported, so the framebuffer doesn't need to be contiguous in guest
   physical memory.
 \item Use VIRTIO_GPU_CMD_SET_SCANOUT to link the framebuffer to
   a display scanout.
-- 
2.34.1

