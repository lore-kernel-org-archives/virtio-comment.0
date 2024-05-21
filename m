Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E183B1CD20
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294126; cv=fail; b=R0t6TyXxPS3HQbk0oZj0io+W5wR0Gt5tc9HiaHjP93cQROXvkB9LMqMRTbuJw2vjGHs9cUwNVojJtMQCxOvbGEpxl641JYEbI+a0Nz3BPhPzsq29dNziuq9PCKsU5Th5aAohEBnxBpQeRnMyJoJVgNrebfhXD6q4EUhBh95+tpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294126; c=relaxed/simple;
	bh=ioCbe2uiyfsWtVCT7vuRntnoxgGcDCM//HESsV+fMf4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XCrnob28qx4TheuMsu5n8IL3BQscAQI8l9eA+mG5x0/Y5RMlST1VgomyxM5u1m/S3LCxh5ibUlbQwu1AF6PbAK2LHZY3WEle0+lYNx1g/A3Nme80lxnErxN7aK2soejaV617dHrv97+WLG8fRaNe5lfamtm1SsZYsYMmiT3v8nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fd8xgD4u; arc=fail smtp.client-ip=40.107.236.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fd8xgD4u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gi9E4xpjd5ixOxs5VE5kxV7+i77jFK+EDxb3p3TDzfsIPph4WwgpcgzK91y0KX5tIJXbeCpx9QROnP2SJ0MIwIBO7za5BlSDiYadXGRm+dqk+TSGHQ/75LOf1m1iUupV2GD0ghP3IJxg9YdklBYNGV+9Z4o+z6nDqp66hd1+B74XPhE6KNbmqQx3t4R+SUrDtS4Im+moY0MdIHq+YajzlCfWfjb1zLxnTht4o2AaQMSvqNK3w+6V4hBJdXYfByyuGnkXFiFby0PE3C4qdLmxjiR/jYCPS787xXRlVyYMi84cw/CAo71rGkiy7W8cQvCmg4Lwxt0to27IkFhmkfF1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVMoFPRIiLGRa7lrOBCJMNieTM9D68iyPYVVCTxI04M=;
 b=ADIdVXrHz9pkzLb/xLkxKzKyPPvvb8WBuRrRfNVXbInZpRw1TIKdCttefc3qoEDWG+G8VPmMjSxhmluQaADdMOt0g/7zwKWn3hvpL1BHFjOvc7UPTrRrBzfIWmr8nfpgrXr6Elx9BrJoYlcZ9LBsQQdENCDOMyYUy+av22HCVPG2xTyHvpbMem/X8Abglih5sqfonUlnCoWs/s8c0ffIhGIWofSlYWmLa2c0mYbr4vvaPtKQK/L/tTpIvTdz4IJh0lLa6E2OsuOxvKcodw81o0zhnTGtNxKWL1z5nA5MlGDUoQoClPtIXeMQ9JESpvzK+JKgHmtw6ma/ot/F4mcd6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVMoFPRIiLGRa7lrOBCJMNieTM9D68iyPYVVCTxI04M=;
 b=fd8xgD4uY+0OcJ+pc3U2xXD45XQvRgdSbWurwsh+chEJUFkJQyDEJeuKWXrdSwImA3nRwzkk5BGZRtiX17lkVBHC/oQDg2Gof3m2mmwrwupEVm6MYUYYRxDszjnsqJcmWe/tPMhA8eZu0bWZoBzmxlk3J5ODSrukcITPtA15ZpC1RCE7maOY2ncqvd3H5wfky7BDRW8aS8I7RRfCIw/4XDRV+QSUlICX8OQmwlmqSQ6lRTGSPMp/wWz+qtH69X+a/rZyzliFaIIpDRxPetaQ/tGkVIZkzG0GrbdaZ0JZf1SO/PLPNn+GOM6Qtn/Un7rVCw181ja2jSHoexaJ9/Qrlw==
Received: from CH5P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::8)
 by SA1PR12MB8643.namprd12.prod.outlook.com (2603:10b6:806:387::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 12:22:00 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::8f) by CH5P223CA0013.outlook.office365.com
 (2603:10b6:610:1f3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.37 via Frontend
 Transport; Tue, 21 May 2024 12:22:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:22:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:21:40 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:21:38 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>, Max Gurtovoy
	<mgurtovoy@nvidia.com>
Subject: [PATCH] virtio-blk: Fix data type of num_queues field
Date: Tue, 21 May 2024 15:21:19 +0300
Message-ID: <20240521122119.2004071-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|SA1PR12MB8643:EE_
X-MS-Office365-Filtering-Correlation-Id: eda52720-cd99-4e79-46bb-08dc79909db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+rZ8EH254kmAOjwovl+UGK+j6WJ2j3z8FXBtN8c7z/gTBsaIOnjbSCfJS5Td?=
 =?us-ascii?Q?shVGEjQU/N1DUiy9dr1dmevkaarBMhyrd3RwxQRQTO1VfRGYkMAkhuvnBmPU?=
 =?us-ascii?Q?Y9L8LUuQwiWUOXH5U3EjGJMj59KvRbY7Pj9LY2K/mYztqrPXQv2k/dgtLNRC?=
 =?us-ascii?Q?AAczqChBWzMOXrBIeMe+usToMXncwNjd061W5+7XV7Ic2OHCdbAaQ3fJVk7q?=
 =?us-ascii?Q?2/yuPGPG0BZzYreVzJM6gfmv8KnfgdWnOVRn+NeYPOOeCYjXBTx83gxUg0N+?=
 =?us-ascii?Q?fI/KNcQL34z4kWcCPl2EfaJyV5pvXDZFhxr0ilh4it7p7m50kVg9Fv68kfhR?=
 =?us-ascii?Q?WapwRkjMpiKSWtSD1ERc+PuLVlTW+3ZTQ5ZHYJFm/vLuWh4+Ktyrvmyfzshj?=
 =?us-ascii?Q?FukOgDCSB2A2T+ZdRFf+rdQA4FbnhR0GZDtTElIIHvRCnB92IeCiN1D/B92O?=
 =?us-ascii?Q?z3XUAoU3HtVI8tF/wXNyNkrdjfxzLQnInClxsYMggFznGbiHyAv0lSef9R/A?=
 =?us-ascii?Q?AaRTuLX+jhEguRYM6gR1W1LOwqkepMe2MAKk+uEmilKD0I++GTl91KQcHdo8?=
 =?us-ascii?Q?AcDmnGPD5VEfivIYD903fvBzfI5uzEozKcvu06rO+XyN//btXQhd/9Fk5Uww?=
 =?us-ascii?Q?/bMKYBFZ7uPOAJqQbOBgmsbBmu0QbfDG/npY09jWE3S2SjE1uT1cdk+QYmpI?=
 =?us-ascii?Q?ULtfbJST82AMLzkYO3afBc0a6F4VyqwfA73j+dAzv2deydvT6f9rvKKq34Ok?=
 =?us-ascii?Q?EQYHk+PhSfCExXcuxyHwUShrlQE+lIgd/BcfhlDCgkR+5YpKjzRkYtEjrhPV?=
 =?us-ascii?Q?oQ6Nh1DJJET+4t92FjW9S20x5aJcSFSgtnSZqQjUcMsjWgtsIFjaBgiQKeII?=
 =?us-ascii?Q?yKuc94TgQwExOz3XeN0yYOuofcOfTVty6vUApTH4n5Xl6GkvHU8VtCHDlEmT?=
 =?us-ascii?Q?ROpdBBNK2UHz8/6bE8W8KbuRcb23MGHxerTrU/KMe2EjYyXk4+wCv+JRi+ps?=
 =?us-ascii?Q?hI2bMNV+FLeAUw+dw8aKrdYj1FVrlbX2w703i1crcidTzT3hlDBxukbQocIQ?=
 =?us-ascii?Q?Vaoy5moN6TMCx7BlgvdlOP+IjJj0oW6k0dSIosbo7vjNjIB0p0ZzQlr+Tzhe?=
 =?us-ascii?Q?u7V4srTdfGGSDA9cAbYRGuYtyhbF0orHEkrQLgBM0G2FRRys1c4TpfeRvT+a?=
 =?us-ascii?Q?vK7kmIuybztdBo8m4NM8dYciezNMvj7UCBiypIX2KN9aAz0CqguAmHjLMMYq?=
 =?us-ascii?Q?3iycHo2jhjM1vMi9FREMz6Rk/EhYEqSNl/m+2q8bJMtgxUwZy/v6HEG2eFS4?=
 =?us-ascii?Q?d2QLGGxcAGIRh8zfQph4WiWHn94DR+QKb+Ogjdaj/HqLwt2dZXmDGr+zVSlM?=
 =?us-ascii?Q?Qh4fjicbuUFc0npNdcAq8Io/6sc4?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:22:00.6228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eda52720-cd99-4e79-46bb-08dc79909db3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8643

Correct the endianness of num_queues field to be little endian.

Suggested-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/blk/description.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
index f04c932..2712ada 100644
--- a/device-types/blk/description.tex
+++ b/device-types/blk/description.tex
@@ -108,7 +108,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Block Device /
         } topology;
         u8 writeback;
         u8 unused0;
-        u16 num_queues;
+        le16 num_queues;
         le32 max_discard_sectors;
         le32 max_discard_seg;
         le32 discard_sector_alignment;
-- 
2.34.1

