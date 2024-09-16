Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2078.outbound.protection.outlook.com [40.107.100.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878E8E57D
	for <virtio-comment@lists.linux.dev>; Mon, 16 Sep 2024 03:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726456143; cv=fail; b=siXW77qz9DVpBLFbpVWtyVzEo9pfm9++QZjZMKTvOTAvXKSp3L+QLqdtmU2KM8sFvJPsgo1EXVCVgUrppQKTLeNPBlU+y87bFai/rOaZixUTfUeUD2zey2BYNCUj20nFivvfXQKjjV79uC7Oo1azRwkrAAnSghuSInL4JbXOAQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726456143; c=relaxed/simple;
	bh=ROUh+a/aokEzUQQjV7lH0DwgIsJry3a9T14KlAAPRIw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UktphSxCIFOw8kqn3aR5QW5HAxmXMTafPlAFK0vF7Kr3CR+dCh6vDjbkpIixOpQa9SP8XDo98GmnurBnDVTTK/WavHBmgXp5T6jgQH1zsqGVuta67nlBtZCq8rFFw8o/h3kSIO6TwC8vJPvMH3pKwK6Acbmhy0JLfuYRyMNWV1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E4RaLT1O; arc=fail smtp.client-ip=40.107.100.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E4RaLT1O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irGd1RDGk2BRDoW5JiNWXRSZrQ2cSKltYWjdhjxSQo4vyz6rvonalxddvsnOcBKADbQZ1xHwFDmI3OUXFkWIK7a+97Tg84iaZff6iow2AhcTiYMBp2NxXvnAMoP63B4oEMNsEKlXrB5i8W38Riy1NlzZ2hJb9uN0sBkq+0fVaoIbNUD9J9IrR/2MeB/WG9TbBWf4yFEvNxKk4eO/fBBgznchx3lRcBIDudYICGQ8bOvUvrwVdMRkek0k1bunK4WxPMkGDqdU1z2JQbXbRxbA6vyoZAutWd+bcdU2C6KQVucaoFTF5UNBbCLnaLNT5IYHXLiYfHAbbted4yIZ//8lpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0m670vIvXXZyY7Dib4rYYlae+3mXFbkhw3IiVDJNKM=;
 b=A0ASKV+y8gVqnym3xAVPBSy54zoeXTtYnK553wgT2Usf7BN5eOT+FlWLLKfT2E1Bhb6mBgU3IMqJGHfftoK5PMhSA3QEZXikGgLGVvtgHZCNl/KS2AvoyXWFuNTAk5ASTjq2LizD7e1rdqRIM05VCoUXvBiPC0AO0NIdfnZB1/FjNWUNCkikvuLy1dybvsdgS4bT1KfIKco55RQE3r52Uxw+szoTineoFnAMre4QCn4AC8+mYuOta5G9rKS/lmMD8XlJ/ML/+IuBPBna/njVGTN3etNKExmNvateDJNAU0Gvv8ugfM21ooMntuU0Z8SzeWi5eCcYimAbM8pFWoEFzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0m670vIvXXZyY7Dib4rYYlae+3mXFbkhw3IiVDJNKM=;
 b=E4RaLT1OTi5LwCy86YUmtBbvANVPuDn4LqZhQdORSvj4ETICS1p8/wVpfhPhQE05y3Zaxe45OjBHCRFYmn4sNDyg7YayCQYihOc3xoqGx1wq0HtRrtud3I/uddTp5PBzlW7fMqrbvuwrlBlYvGTm50oIrK9JuvVqf7EperSfSHmtZkA7pgBEVihNSpGzphr4IDQNtS05Y0eFAMndVO+oANJZG0SFTktOT7LFLBbRqjXdCGDRiwWF6DMX7YdsGsJsmESbtnnAg6U1Ien46BKSJSuSPz07i+C0vgNMh5lHQWBsdWAWCfyaF/4DPVZgFaFd9KaDBRVZxfdwwrrxZx5iDg==
Received: from SA9PR13CA0123.namprd13.prod.outlook.com (2603:10b6:806:27::8)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 03:08:57 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:27:cafe::9d) by SA9PR13CA0123.outlook.office365.com
 (2603:10b6:806:27::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Mon, 16 Sep 2024 03:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 16 Sep 2024 03:08:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 15 Sep
 2024 20:08:51 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 15 Sep 2024 20:08:50 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v1 1/5] device-parts: editorial: Add missing struct keyword
Date: Mon, 16 Sep 2024 06:08:31 +0300
Message-ID: <20240916030835.68178-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916030835.68178-1-parav@nvidia.com>
References: <20240916030835.68178-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|MN2PR12MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: f7e27ccd-a560-4fcd-0a40-08dcd5fce765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZF4+uTCkMASwTKjle4qo4nHB0agvmk49k74X5nipfbR85/exCzz4VdQ3OKeP?=
 =?us-ascii?Q?wuz9cmvJpl9yy9renFjJdHVBkR8nVFpCYJ8XCFRufHmf35TaIr76aP7frCxL?=
 =?us-ascii?Q?Zogc+bz4HT6C1RKLZgHvKGSHz6y5rY54bjtgM9QPES29r9cE6IYymQyHlI0i?=
 =?us-ascii?Q?th8U+2OmBflN9rN5VqgqNHHcGVg2dHEE1NZBavw0OiOz1KwkjDLLJHVT5GMX?=
 =?us-ascii?Q?Vgj7BsVS/7uSFGahQheHDFLNN7NgLLjPBZlToWi5jhh0El/zjX8GCkTjE2HO?=
 =?us-ascii?Q?zMWreHgx0cjbZ5Mq9Ic4I3a8lZXF1FM7Y5biEjsmiVeJceny4rJN6vf3AHaX?=
 =?us-ascii?Q?XfXN1Fz/8wwkyJVw9yhc79AET9UMtPgCBq7eLm7ZBJSkEw1g+CzlOYMt2f+d?=
 =?us-ascii?Q?Nsg5PKhYRMnH67YRlsRbn6sPqBtAEwSl6jq+07tfaPdZ9PG06m9wJkTSvvH+?=
 =?us-ascii?Q?fZEPlp5gCGpDB58V/iO/JGVoV2IC66aPLXL3zfZo7Nzaal8F9trLEfiU+eC1?=
 =?us-ascii?Q?Way8fqAyuOPeEBlq1Jw/D3gkjn3459m6SbAELJ3s/NR3wVn6NgQV4S/7ksO+?=
 =?us-ascii?Q?b8X4gE72AUZNGkkvNlu6Gr6IVeIi9nlkpYGXrAwSaYVPc3B4N6czIGvPUC5b?=
 =?us-ascii?Q?XlIWutMYg3aWP+lx6LdrigzAhPOyiof52bdR1P0/oxEhfqFLTDRNtDSy/eNl?=
 =?us-ascii?Q?6I1cfWoBSyBRoNjY7+52pt18rZGO4SfC/AHgJjjq3Fr3UL4/6a5El8vspOui?=
 =?us-ascii?Q?mLKQS8E810iC1erR9WW68agis6fJEBl3TmefSnFK3YwzJb1UkIREmFqFyrLj?=
 =?us-ascii?Q?HwPqXYxl+ZDaKXzYLtmY+t9dLFuyKjeayPW0N4+OvVoQkm1+pmmB0RR+Ieu9?=
 =?us-ascii?Q?Yt2EGs4box74RO4MuiNzzBeu9Em6Xl1j5fZikDyKT5LUncohrpsDWRFYShIw?=
 =?us-ascii?Q?a1zpeyhx4APO+eRUPb+ZeLwwUjLF5RfUvQ9aBcoEQywVzKrYt5SXrUtKYAie?=
 =?us-ascii?Q?1ktde3zpeNp4uiOs2stczYkyYZ/hE+BIMatnuOCuY5Kp06ADxiDWojx5n8tv?=
 =?us-ascii?Q?0KqGnVtDsftAmmVIZInIBj3Ywkxq9K/plKnl8IBZAW9APKKlO1DfMMhennZn?=
 =?us-ascii?Q?PgnOujaxaTqpQZfSiZrQDdUkBOUj/EM0oiybkMmgp1L0HD/JvtBN7UktinKh?=
 =?us-ascii?Q?jDO0U4GtoIJakrrogrTAYspMnCFnfAW2vLachDs/m4GNBYW87v/RLGUeyh1F?=
 =?us-ascii?Q?DmiAAfxWDR/y6Z8u6poLL9AXstiprI6uPFrotjkEcp6xTWn6/jCxcUKOs1A7?=
 =?us-ascii?Q?neVO07H1AV5Gql4AdbFQE/uilTLxcVHmjhwl9X1oBoPdnIWrCjFh9EFLVpWZ?=
 =?us-ascii?Q?4CpLz2IQL+vQURx2NU3Cmm2UqeqS2J7Pq1gbIJEHMT9/DU7rGrtDVoxpcFMP?=
 =?us-ascii?Q?NSCdRZQrhaZoOZxcU4E8Sgk2Kt/Njjo7?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 03:08:56.9306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e27ccd-a560-4fcd-0a40-08dcd5fce765
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336

'struct' keyword was missing in the definition.
Add it.

Branch: virtio-1.4
Fixes: aa4f6f06 ("admin: Add admin commands for device parts")
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin-cmds-device-parts.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
index 4c88045..27d8251 100644
--- a/admin-cmds-device-parts.tex
+++ b/admin-cmds-device-parts.tex
@@ -131,7 +131,7 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
                         le32 count;
                         le32 reserved;
                 } hdr_list_count;
-                {
+                struct {
                         le32 count;
                         le32 reserved;
                         struct virtio_dev_part_hdr hdrs[];
-- 
2.34.1

