Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB7AE56A
	for <virtio-comment@lists.linux.dev>; Mon, 16 Sep 2024 03:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726456153; cv=fail; b=sfNk39AEjcCw1as75PfVx5CqkOJv5Amf70AbADsolSPqN2FHJVftOc0USsAaowuMCOaR7FtENOGdLT2JzG6y6EOkxypBvHv4lAO/K8lOBCAq6jd1N5M0tNrGvERqU87vfPsf9QI0/bLlpRONHxMw8HOPjdv+DOfJFODXlvw0hJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726456153; c=relaxed/simple;
	bh=/pMUhjHfrlIP8+NcD9gVdP9J/UOMMpmxYs2nY0s8JQQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O18/VOvmZN4uMzCnIQYfVuFQUH1urVKp+MAVFFF9YjHZxn/WnnbQMqSIm6V6puZ0GjcUQ2BjUb7Uw60GTKw5Z+TcgUFyN7cPK70cnjo42irzbHl8PsMbn66aRC8nVLA2gyvyKuiLkwFJxqSv8pGmlrSCEwjoe1tb6OQbnjCfGY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PzePhF/9; arc=fail smtp.client-ip=40.107.223.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PzePhF/9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4mbI2m38V/1h/5vJFhlsEZzBiNHox+SxnHcSiYV1xula+I7zZxfVAbOL4fIsaqmuU3s6YDvA5uAwSk47lm/6KFcq/DkpkF9SzVyieAcM/V8+R7ATVxt5rZT+y4DnJ3h6RWORC9ebIfX/b0O19+OhUEdIh26MW3jP3n0hoBkvQTgq+b0hGDL6tmhdRUOGLJqwb5mCCGlHjHLnpn6ivxGb5Ms+20rHUTOSy/6TBym/MYIaOIRecMef5spgmrSmXzUTj21UmaUrlrx8Impb4ETX9K9u+EGpTpBwGGwyZMlHYWMLU8AiQNc7wEaVA6zcWEXbMFWhG4TOChEGJBKHsq2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WUAd93QjXgn4PcJZTG6ebWWQbKsxNz+gA3byyipN8o=;
 b=aUQQKm5kZV1JYJr973HDnC/21r6xP/6LlyCqe5IqHxgP3r2oBhbAgkRBc9kOpj5JjYL54zOsALK0fWW2YNcJLAxL8xKeEZsXgrTK+F9qXGAViBajJbi48oVeMRNzmCiSbX6GKnv33DQbRfTvZkbil6bUjNa+yPPQyUScFCEEkANc0SxryGXGHVE+/zM5uV7WoeXwvYmo+OjyX/Np376k9aO6K4c2wnj7MqK44RSTKs+qHysYlU2r/YnmteDNNMWNU8vp+VKidIc6TGslhl9cSiGALd+/Z7NWKhYUFPoIHJGg555E0kcXAvc2ooWSlNXVRl4puvhOjRfkXXUyC37byA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WUAd93QjXgn4PcJZTG6ebWWQbKsxNz+gA3byyipN8o=;
 b=PzePhF/9BldDobj6TWsATEwf9+xWfDXH23pUU2Gw8GiW05UcNuv8sQ6eFrgN6/vF3eo78p50yaHia9sEsSm35EIGGOIi++9cPerSi+3+vmcu5Dv8qhmGxDqJpd+rhTXO7XYXos2eGM1m7Mzn6yv4XL+5MNfFPGgDa7w8WOpXjDg3sNU2C84CNEJOGW2ZDdMIFN1fULu72mls2D+RyWX7lnF48ANpMd1a6cvCaPFv+Pf2mTmIBg1CuvaIAhhxaMlt5hrAqkC2rb4ycnZkAjtVPyzdAO1DlpjyMEwRl+qiceMpSuXFTe4qTCtOiuoJ56Sut0WWPcDSt1JBEcKNAfDOxA==
Received: from BN9PR03CA0320.namprd03.prod.outlook.com (2603:10b6:408:112::25)
 by PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 03:09:05 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:112:cafe::10) by BN9PR03CA0320.outlook.office365.com
 (2603:10b6:408:112::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Mon, 16 Sep 2024 03:09:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 16 Sep 2024 03:09:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 15 Sep
 2024 20:08:54 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 15 Sep 2024 20:08:52 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>, "Matias Ezequiel
 Vara Larsen" <mvaralar@redhat.com>
Subject: [PATCH v1 2/5] device-parts: editorial: Fix metadata type name
Date: Mon, 16 Sep 2024 06:08:32 +0300
Message-ID: <20240916030835.68178-3-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff3baa0-3ea2-4953-1f05-08dcd5fcec99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jj1iHH0w+rt+PctQolIuRQZyQvqp8ChynY0QPJqqdRCAus6MZRj5TrhbGxGY?=
 =?us-ascii?Q?PjobYDRYZUWqMvgLBYMNf6U8zz9yHpSe2y9FhNy5FHFEy6OCtkBDAS2N93SQ?=
 =?us-ascii?Q?up1PiDgMYa10lphsyTbFipvmHGXdYjhyk8Unc4ETj0MjovuTmVOtNg/RK9GE?=
 =?us-ascii?Q?8/nZtcTuKB5GzFb+M68tMG1cIJAO5mqyZxBGsvpFASHRKt3d6xi7Tolu+DFP?=
 =?us-ascii?Q?HPZfzgdMb2CnjCCUfryZo8S8BvOaB1ovOkO00dfWHdlIdBvikVHCyDNKDM5C?=
 =?us-ascii?Q?bjw3zYsZ1hI4A9+gQWV7+bm6P8bLc/aJQtt0nJQSsYytQ+9s5e2P06k5YOd2?=
 =?us-ascii?Q?0XSSOAjIQMZDIz8JmNgBS+rIhI5l6lShO+JVqH2eL3gLJjQYBe/H/6usrbPV?=
 =?us-ascii?Q?6oh/D8kdnofp3HH+T4Dhs/ccFHkq/3pl67ftxep4upvjRBpJhdCQmH5a2rnx?=
 =?us-ascii?Q?CUQoWA+jo0Rg58mroblEtDZEVDE1b+3yxhhk80ankat5JFUqks/bH+mROuGi?=
 =?us-ascii?Q?jkrOX/uUq/4iVKAOeFEf5vzE5JSBKFToxf3cz5lJ0OKiYgWLBct7pvPrirNp?=
 =?us-ascii?Q?Bx0d0V/FXbPuZk7T/DTXHuBR6FQNt1Y5BFdQuEMPv67DrYxz06YKBgTAuU5S?=
 =?us-ascii?Q?yEPUTCXHFILBH6lIpRc33cVSs5S7F8zGLqrlI+577/jkpiUeZcTGQeUHXLvP?=
 =?us-ascii?Q?UPX8DCSpFbNiE3geY2Xio7UeJyQbCREj04LTnqrxxE1DqoFx6XX2cLpGbMlu?=
 =?us-ascii?Q?lN3uQVwf0iRAT6lxN/SogrInM67FZeFFQlW9D9qaY1WciymFVRHE1sLpEPph?=
 =?us-ascii?Q?WDeaor6oB6k0aRCN2suQI3NC1E4l6wupxsO4WzSW0YtSyYLG7/0cUHH9otyp?=
 =?us-ascii?Q?VE4K4imQdZO1fetY/8ooHx/3nmaunDJJjdYczzy9wi34qs/lDIiK3xLutQq+?=
 =?us-ascii?Q?LYy523l1tXGj56BdgzBWOAURTKag/0nQyp4ueu2a9xDVZDTid8mxWU8vND3p?=
 =?us-ascii?Q?Isy+pX/md5Pfs9R9gIkF9IhEHgocjWH1xfAlJQypVMLqIN3FqtipvPN+rRMS?=
 =?us-ascii?Q?SmmKiRvwtqoMSzmdmpS9vWM/s1cbluNWA1byB0xMsU11RE1u9oCKL1jyAuMl?=
 =?us-ascii?Q?WCv1Ii/dY/7bM/mKYrmZc0BTlx1GNkDpmdkMBuZlci4pKgzg8aFpkbTNY3U8?=
 =?us-ascii?Q?+16IV/33Q+PiuG+nFr7akC0r9+4amTbaXeJGqXpicFHbdtnNGpjhVAlZQW4u?=
 =?us-ascii?Q?BOditMeBiap0Y+l3hNczxfHjetfqUTcjYTKE+hUg4Z7Qor9nwwOS5my+l9H/?=
 =?us-ascii?Q?0ogm5e8KXchv6B1XEbpq09MYbV4xMj7rq5TC7gMS4I8v8mXBl5m5QkdoMf0E?=
 =?us-ascii?Q?79CHhWUKrRL8U7XzjwPsxUOqjkaeRuqAgDvMExN3YBy4m8fCda4LVMgIfw+D?=
 =?us-ascii?Q?7yhz6KJY7fFsDO7rtVy+B2iJvyQYoJCz?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 03:09:05.5825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff3baa0-3ea2-4953-1f05-08dcd5fcec99
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7819

The description is for the type VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST;
however, it referred to a non-existent definition. Correct it.

Branch: virtio-1.4
Fixes: aa4f6f069ab3 ("admin: Add admin commands for device parts")
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/205
Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin-cmds-device-parts.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
index 27d8251..3a16692 100644
--- a/admin-cmds-device-parts.tex
+++ b/admin-cmds-device-parts.tex
@@ -152,10 +152,10 @@ \subsubsection{Device parts}\label{sec:Basic Facilities of a Virtio Device / Dev
 device responds with \field{hdr_list_count.count}. The
 \field{hdr_list_count.count} indicates an count of
 \field{struct virtio_dev_part_hdr} metadata entries that the device can
-provide when the \field{type} is set to VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR
+provide when the \field{type} is set to VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST
 in a subsequent VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET command.
 
-When \field{type} is set to VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_HDR,
+When \field{type} is set to VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST,
 the device responds with \field{hdr_list}. \field{hdr_list}
 indicates the device parts metadata.
 
-- 
2.34.1

