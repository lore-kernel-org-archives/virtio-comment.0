Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3C815E5BA
	for <virtio-comment@lists.linux.dev>; Sat,  7 Sep 2024 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725731339; cv=fail; b=UPhwHcJAVL1kdgkFgcq8/BLe3S1KqxPIucEEikLcORGd1RqLOFMN/dhjbeJMyvJL3EWom7C1Kb2WSA7CtfF2mmlad7W+GCTc0XrLTey6bPvnWqdLE/Ze61GDL2xUWRYDn3mfqCZSOKBBWDdwg9QXU3Oj66d00aDf/gXTOWOZwOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725731339; c=relaxed/simple;
	bh=3YkOci2h3NADfKuFxHcHY0uIliXeSPi47EURtKi7azc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V+fwfw8b7aqH1HXVLhF1x8upkWCN8SDnRm/Kl7KCdrzF1/Ou0DqAWOPsepHcw7+IS1Yc/EBY2uiPUoPMaHsbnCC0VdeOVUP3NNo8AEUvGOwRAkf838AmQ1PbXgu0in+sJRttf70TKFttz2jnrQ+r/BkJkwy1lbqPSL79wP1mtzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WpGkH58q; arc=fail smtp.client-ip=40.107.237.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WpGkH58q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJAPO05TpSm2zQmHqZMCRAFkfO30CNhjOV2FCIs0zW86WXUR1IQ/vPG1Qz4yEwh7cvqHK4wYpOH76c8wzc0kNcS8tbejyKaygV25yUwwCA+9zvRODtF8Fg8bUcQwbJVxD7KqWzRUaJNFcdQFpC8kyp8EQbOi2PaPi0Wjv99uxRDSulCFRvAdsDklIYddJcEwrGMhn4MV6i8CLg25+FCIsDvmTKWNxoeZyDjuY91HCq+b8S3suMaVauyREJ9WdaNEWme4OmmlYl+eaDeVLoO5SXsPYANFpX5kSdSFj8ppH+qy0wG0+mkDsdqr08wGtcSyM21GvkCCiE2okeF5lr5Cqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xg7qr8fWRgj33lgvKtBAHFsA7BVMvya3H3TVC/UkjSs=;
 b=sKVFvJmkpRvU2MNWXfSaTzKYSVoEGAkaJHGyTE4qO/eYZ0aDDtvPa+F6VgslsjB99wxPUS3I6u5LVUb6XKOfCdyZVKxR52tUw70YvgschO2z+YmGvyjM64KTmcJtiliUaVTg4iFW1MaG+p2o+p+V4e7PEkg60KdqCPNdv7Nkf6z/i6o5RmzV7H8RJNrszuJU4/BorDpmXLiq501wTaRb9UeEaVH9MU/lRacw0/Dcc90LKAptISMdvqD/Fc4VQsO00DWFitYbBvg6zJkEx6xVmPjJhR65xfS9rEZRSOsffHHjNwpDISaCOb3xDuLp+yjxEtwbTwlxw/OAGCzEhKAwJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xg7qr8fWRgj33lgvKtBAHFsA7BVMvya3H3TVC/UkjSs=;
 b=WpGkH58qfT09M69KhOiyYiLBmIl0TB9i5LxKKBLZ9wTsA6/ZyO8nfa8/wukwQ/9bBTw1leZD90yqjb24nLXJcgWhuBYHO0WBBamPkFnfv0jMb8s8+4/lnkSSsyoh1cN624ywfgiaywXrNIgIiXO3gzqKLoFldLiYaloygwTzar4KmGdlZBgcpFV/b4w+7d3pZM0iyj1BaZ1kK/G96z2qfWgo91CZq+y2zf5qVPLKRQqlfIJQl44GD05BuwrVNi8U7fA6rDu1o2J74Sz5Fy/RXzvQ21NaTCLcNtfbLIYm+XUt2q+YbZSOLyRf4z/wSeeevMjsEym38V8NZz4Epv5EsQ==
Received: from DS7PR03CA0172.namprd03.prod.outlook.com (2603:10b6:5:3b2::27)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Sat, 7 Sep
 2024 17:48:51 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::a) by DS7PR03CA0172.outlook.office365.com
 (2603:10b6:5:3b2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Sat, 7 Sep 2024 17:48:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Sat, 7 Sep 2024 17:48:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 7 Sep 2024
 10:48:42 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sat, 7 Sep 2024 10:48:40 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 2/3] gpu: editorial: Fix spelling errors
Date: Sat, 7 Sep 2024 20:48:18 +0300
Message-ID: <20240907174819.778971-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240907174819.778971-1-parav@nvidia.com>
References: <20240907174819.778971-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|MW6PR12MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 5195ba02-6d0f-44d3-52ed-08dccf655572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Garij0Jrkyz1oTf+Uf5I2ofdgyt3sPEeYPabGvrEC5p5R2RIapTtZZQ5J1C6?=
 =?us-ascii?Q?7yNyS+2+d0Xen+kB+2hV/Q9aLPhXkpG//zrNKfV2proc9LXK9odu+sXapvJZ?=
 =?us-ascii?Q?XfIKpMQ1cLj6ZIs8wiUg1KBY8Gahxk3moMkqJCoTd+zLA3zZfS3Q6w4gs+U+?=
 =?us-ascii?Q?roLxrVGqSZjSHtHjY1GYQEihJsRUdZBbJodpMBY5rdpl165cdqXxkEpzpH5q?=
 =?us-ascii?Q?Cq7nQHxKxZ4B/a0xZSW942Wn1m4inNhBpTYM/YCApuiWIpeD8rMmIU0s2qZ/?=
 =?us-ascii?Q?4OsdDm7r5ydlV7ZxtEImckg6eWctvki89G592LmqhskPQEp22JL1ESf4SX5I?=
 =?us-ascii?Q?N496SYRk4KrEBQhBbP88NRgXxnJMPFB2C50P3aMAnkojL3aKt26UnwjX6ons?=
 =?us-ascii?Q?9sOu0JcdaVDi/1uEiJqkKtC5UOMGLza8jbca56iMRya2En/euVMpyin+Fjqp?=
 =?us-ascii?Q?Ny0aSoSVW15JK4mU9S3tFxygWFPqD71014K4SQJ3oeyr9nJ54YtrXadQV9mT?=
 =?us-ascii?Q?RmDk/MBWIGsSpU7dfRprB86o3ZLLARZqTrn2+24N0PAhcOmB89qHepVB+WKx?=
 =?us-ascii?Q?8ZC+fo74hW0KmuGa6j7LT6oSM422LuXoL5L1yiVH+ViTlb6YsUsWFlXtwqq0?=
 =?us-ascii?Q?4EUtqHiIybRuYcSt7siM6rGYwMtVLwzVqm35SfUMCzQ76TzLMgV5JLJOHAGN?=
 =?us-ascii?Q?Fpa1oJlmk9nRgHbhjaOzrEdxIZQsyF/jnSz+gAynWy/EpugYDmTnmqLraio+?=
 =?us-ascii?Q?Q5jnfjHYPI5LGycRi9i8hoRX5rylPCrTlo9rUTop0lelJTKsZG+7rxFUv+kT?=
 =?us-ascii?Q?92Q+NPPtTfyT15VcjvH8Rl+3LMomLwLHDpRbsAiOhZbtcGVn14zs8uKI0Ldi?=
 =?us-ascii?Q?0W77TrihHkZMTQikx/2aSge8tMbuo8+1Tup7mv5ikYVmufC1FeXd2zJaFYhE?=
 =?us-ascii?Q?O4hsdYt3t2GzmuGXjT222+/cSx86hQge+Ar6HgHQ2BQzvL9wgvw0FkUFYtuX?=
 =?us-ascii?Q?P1vJQY7eBWsoiUp3SWMUQlQkWJv6zYwbSnqOZXwabGto2aSR3rXeAYjkgvWK?=
 =?us-ascii?Q?jHF/dMX+IVh4BQZgbGW1ZhAkZfnajdc+ZWJ9SH+VSGU5OtQIHzYGIfVf49gN?=
 =?us-ascii?Q?NFQnyFWyRkz3CLv0JB9vGGW1zCXCwyBfEjCrjz0Bb/MM3c2prEARUepyZoY7?=
 =?us-ascii?Q?VUhzsCMcN9a0R7ji0BwWH6hZd7Ut/9GVJY79WvuD9RNCxfR1ozeroHbuevaR?=
 =?us-ascii?Q?cuPAjaar9/ITroHBUQpyayHgRLD/RuMBuMGtsvOgH3v85yD8j/b3W0VYn9Kf?=
 =?us-ascii?Q?qTte8RkkTDcoFCCLm3WnICLMaBWlIS5fpWMCKKEw1IBt2SoBemv+turhpJe4?=
 =?us-ascii?Q?ZgPY7LeQGasuuItnI67mkNhsY37ErVCVRSf9Erud9N+927IcRLobEOuNakcI?=
 =?us-ascii?Q?+8bzRUhxuT1a3dujHvxI7VwwdtsZz/yz?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 17:48:51.0720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5195ba02-6d0f-44d3-52ed-08dccf655572
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8913

Fix spelling errors.

Branch: virtio-1.4
Fixes: fed64230bf31 ("Add virtio gpu device specification.")
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/gpu/description.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index 66e4873..ba4ea76 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -166,7 +166,7 @@ \subsubsection{Device Operation: Multihead setup}
 
 \devicenormative{\subsubsection}{Device Operation: Command lifecycle and fencing}{Device Types / GPU Device / Device Operation / Device Operation: Command lifecycle and fencing}
 
-The device MAY process controlq commands asyncronously and return them
+The device MAY process controlq commands asynchronously and return them
 to the driver before the processing is complete.  If the driver needs
 to know when the processing is finished it can set the
 VIRTIO_GPU_FLAG_FENCE flag in the request.  The device MUST finish the
@@ -345,7 +345,7 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 display).
 
 The \field{enabled} field is set when the user enabled the display.
-It is roughly the same as the connected state of a phyiscal display
+It is roughly the same as the connected state of a physical display
 connector.
 
 \item[VIRTIO_GPU_CMD_GET_EDID] Retrieve the EDID data for a given
-- 
2.34.1

