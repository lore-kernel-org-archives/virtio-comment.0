Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AB21B85DC
	for <virtio-comment@lists.linux.dev>; Sat,  7 Sep 2024 16:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725727975; cv=fail; b=eYyZ3X/SXQH0uOSS0B/r3sWtdu3gZj+z3hmh6z40GRMhXGoSJrJT84vGWmTOMcGR9yxwfpkfxAStlDh13JJnld7Y5DTcasgSbfnB6Pplyc9B2zlf478Z0AoUM78h6K715vsTBVA3r6+BPCuLS46TlEmjWPoBLhdef0gslHfKnQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725727975; c=relaxed/simple;
	bh=dVuNbLlBLDkcyP3fBDIeIdtOc6jCcqVVke4RaR9uqBQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SnnDgJktlmq/cO2Z4CDL3GvIe31KWEdh/5H98X5ON3egigY6+eS5JpQosawxnNKaSoo6/qzKODjmquq/ketTZh2589knUm87cOZ/44AfUOuzhItSAgBKQ3gvE9qDx2asOw0RNnOYMcGPMWfL9c5zDBCNyKCmhyim7dy+LhaaLF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KyTifwED; arc=fail smtp.client-ip=40.107.237.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KyTifwED"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUqUA7c79psraYqHhhyLHLq09j0XHKQl7bmT30KJuWFllRVCbWpb0rnJmDurXt7ZBYyXdM7n3tb1xOdmL3oWIdgjNxUIXOApLVUwM8DhogTv4qGnBVx5xTnn/IaRbTXyUOmVoM6Wi3bIYFYKO+OLoK6yy1AgUoPoyIMtGonVACVjxCUMNNuitZnAD+iwtTRjxrvQIqh8C4ZL/EeDOSv828Unmk4/aQreC0R81jy+AixE4OljN+c5WWDdDMEgqSGtnT4AuYsSXOJPy+3mavsIq3kSJehZl1kQ0SvlRSAxDW/kUr2Z7vH/AmUGeFiQFOMNUFEZQtq3PAQ7syw31+UCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRWXQWOuCX/wy5BZlO7uQ7wimzibk8BF+8DivxwCKoA=;
 b=d11lLKzPt11nzutKAXU90yqO1KJ1gAI/mJCL7KtzahaLSlKvkSCiFi0yJRTfTwh0Pl9kBmFVyjezuDssbZPMXn5K0+xhLdGnhehxteXuKI4RIKEeA7rpOQz/DGMhcxP0Jhz6u+xiAS3Io4ykaBlNDM4FOas4378kuJeXm1ZAZIWWCA6NjLmqhEL+Pzs7pm/Mbe7qJS9DLNBTVX6DfyvJa8FO+U7rEvet5/wTQ1sdmebP5QVZn7LWgxtQkg1K/cQN1haTy+DlFrgptQ9E1tNe1s29sHlAhb8jU5ntuNiVwWSTYfVKOfAYnwI5DhjH1Qzb+fnNQ967kVDNl8DwNNS5HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRWXQWOuCX/wy5BZlO7uQ7wimzibk8BF+8DivxwCKoA=;
 b=KyTifwEDpnW1cXXnZFq78hlGudl/D0rpy64O3HI9PhS31Tw8gmpm55mEVK3wS/rteAhlHIEepUzYBZSHZyawr9fUBDFqvcQZ3RN4xPcd7RxB6MeyAlZp4nufZHTxbR92rJX9el5EVhQPyRu4v+afl8zI7vpIaj07qVuxSlobGQts6+DmxNaKLTqAXUYfbnhGkPEAOimYVj2bhBdBeDeBdKemSsKxN9XZut94im8bzhakrgI1dEWH5djwjWksiX485N7nhb7LXNVOe4H9t/jYvNxwxkP32CbYf+e9wFYw9rVRPjp1SFzxATO89sv0Exw+qjhV7fYIxKusWT6Z38dTnQ==
Received: from BLAPR03CA0127.namprd03.prod.outlook.com (2603:10b6:208:32e::12)
 by CY5PR12MB6597.namprd12.prod.outlook.com (2603:10b6:930:43::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Sat, 7 Sep
 2024 16:52:48 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:32e:cafe::11) by BLAPR03CA0127.outlook.office365.com
 (2603:10b6:208:32e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Sat, 7 Sep 2024 16:52:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Sat, 7 Sep 2024 16:52:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 7 Sep 2024
 09:52:33 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sat, 7 Sep 2024 09:52:31 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH] device-parts: editorial: Fix metadata type name
Date: Sat, 7 Sep 2024 19:52:18 +0300
Message-ID: <20240907165218.778501-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|CY5PR12MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: 509a7c7d-a46f-4359-79da-08dccf5d812b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jXn/n3rnmOMW5SFM3CcFnCY9rFrxQGKlwCvt+DPrsMTiF2x26Jj50LVckush?=
 =?us-ascii?Q?IrTEPtFncKFmBqVw054WK/+vD2vaHnd3tnRwtPtISi2fdasRKhSCDiJllq8g?=
 =?us-ascii?Q?digVvDNdZAEWZCwj6UQC/5YrfakDwxlIpeGgiypEUHXvoxJyzx1nFJ6xEUgW?=
 =?us-ascii?Q?Ad2U3lsmtlVmQwwevTiBeJyJHx2C5tIOHFDwamcjYIAlNa8AD4xMAjDz+Dv2?=
 =?us-ascii?Q?HRA+5KF4ysq6ee2JbprRKkAR9q5E/bHUi898wiEsRXOAPCkGFFPjk/mtanKr?=
 =?us-ascii?Q?A0q1jBoHTi4l0DaYl9wWBPyEImOY3RTYRZIsuIS6W+4/BV/tFOEWKDkrH88v?=
 =?us-ascii?Q?bADrfARdZFqUFwsQjx20NPWNEJEcE5kaOoDkc6bMQn4sg+o/oqiEoGyFRM9y?=
 =?us-ascii?Q?n0ZSbBIuf8HOHxaGs3464ki3z4P74dCt+3EnNbRR3nmefp2NGKOawUy3DVSZ?=
 =?us-ascii?Q?TQaVYI36THL5cJ2If+W9iOuGNDUt8TpCQ6Sv84B1QuBtIyQRqJemZEPWTA31?=
 =?us-ascii?Q?aFNsPN8cdKEoJuKQoanmK+W8OWizI/g5eu1beDJFFYvUFIH9QjxnlxED10y+?=
 =?us-ascii?Q?FfQuPfEVEHBePQkCxerviC5Wu3su3K9Dj5n/2ktxwR6G4sOGq7q97teNz8NG?=
 =?us-ascii?Q?/oix9OoQPF8LZHaGn9lD6yDwy6B8nyk9PXsYAphGN22nY2RcNcAaWxt7EeN7?=
 =?us-ascii?Q?gN8+u07AE8xFwtoA6NMG5BG/XUznwBRY8P2ehRJsSA8RqnbCRESNXf5LW6gC?=
 =?us-ascii?Q?nAneiBgIeNQWZEW5tVRndHrGvLJiTyxQj8C3jvYFmxuYNkNOH3V4P2CO0wXJ?=
 =?us-ascii?Q?QP4Ub+5fK9kdPR8Ub1S9P8oyhmCIf/EyYVJA6dFKX4WorTGRkSei7XaeSscD?=
 =?us-ascii?Q?LXkypnRRbL2mg9aS8iSJqN1crF1FpZLyNYwiho6JVqRmT8pTSYWi4MGp5fr+?=
 =?us-ascii?Q?IlUc//6ZRuK/TQx7nd++bm+9zirqbDsA3Zrnv5Pd5NYRw4AnHAeej3+AuwXg?=
 =?us-ascii?Q?gzLhPGqygXmodcuL4+aVOJIcRn2CrLWWY5JNixWty233jLefE3yjY4LHIpRP?=
 =?us-ascii?Q?bTXuXKV71aKuXkq1biJ1ZlD5J33EI21VppT7kZkEv6MpAy0fBnF2UfTSgq30?=
 =?us-ascii?Q?WhtxzB+xOqzLo0jYBoFmh3enLrbEr56Yg1AhkQlpFx2WyB9ye9ZFJZjPiAqv?=
 =?us-ascii?Q?vpuqgmjkI2V7k0Li39T+7eC8873fcOjjUu/j7L9jQk9Tkicf69X6UN5SToJk?=
 =?us-ascii?Q?yqS75mNNVlmmO+M2xCdFI4R2pKTXwcAKhAxzIQeNf8QCNDFug0hR0ndzFPiw?=
 =?us-ascii?Q?PCAtktRdJgkuGBQYKLkQ8pOk+z0rjFFnWt/I9221ysyzkvZ/y1/nolY9pKzV?=
 =?us-ascii?Q?39SvkLB45+f6jlEfRDXJJeZG2q4gnleatrtiXHdPSb1wSfXS/mjfPslFWKHn?=
 =?us-ascii?Q?jzuiqqrOHENQT4RJn7+fGON0ZAFBH+CG?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 16:52:48.3754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 509a7c7d-a46f-4359-79da-08dccf5d812b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6597

The description is for the type VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST;
however, it referred to a non-existent definition. Correct it.

Branch: virtio-1.4
Fixes: aa4f6f069ab3 ("admin: Add admin commands for device parts")
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

