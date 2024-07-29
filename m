Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2042.outbound.protection.outlook.com [40.107.100.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D99E13B783
	for <virtio-comment@lists.linux.dev>; Mon, 29 Jul 2024 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722244840; cv=fail; b=FxQiY4ViHfvBuvqjA9kB9uN/3LeN3KJgUGjCDgnK2UGd8IN+Okazr0mHHmj08vh3Rmf1Pjg9cp7tzgXFXJDAAotLUdTuIulh35gxRVJWBUSWDyi+M92P3LnMjKf+SMfoam0n9LaUwGP266zNVrwW1edXFeFYDIxcqpTODCLOiRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722244840; c=relaxed/simple;
	bh=ROUh+a/aokEzUQQjV7lH0DwgIsJry3a9T14KlAAPRIw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VEJybo9pY2A8I4KsfXfbQp8XCZGQfQs38C+ifDgnhYHc5uZPd+sLiZfgG5enY6J7BBQJ0AsKJ1YocTLF0zP9QNHGtIVKMBPWrwpEo1K/fc0kJDf0oOW2kWRebDOd2YWgMhWfsB2bPyGiLrX9b7btqNNWmiuxIMvCicCpfP3ECTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bTTAv7nw; arc=fail smtp.client-ip=40.107.100.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bTTAv7nw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEFnlzIJhnBaDG2Ls/KPRMzwfDphM34GCiNNZeKgfGA8fKhYSes67gR1sIEZlmbLdUbgSEygeEtgYRMv8VaaG3JErN1O3JcOay0LoOo+9T9AseWKh2Xeoyq4FiMKP5k1YmWOMRLqmAhxLunE4IX0fdY9bzcJGP6KW/96T1rwtfAHkw4p1G2qvgpIFfUcUExgMw48LR/tzAqo6bO1+KOiE89eVCxfuageXQZ01YiOuA33Yfiw+Nq43NuxTu+QOiY9FsQA3+wY21nKPmwQlGkyCWxTzZrMUzh0tBWopsWeWeS6nuC1iBIGfhMgSK3dcZ8s3RG/18P4WzsnjovA+RseOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0m670vIvXXZyY7Dib4rYYlae+3mXFbkhw3IiVDJNKM=;
 b=Gc7eRoGnXYzGpWTz+6B3FScPiLwfWogVfnj5Gz5bBcooe1CvO1V9HQXcIjpQBVSWVMIf8oQBSs+cR3DIdrb08qPw2v035zYRzvjkVmks+wsuUi+xXidstxD7ef6DBvhPHWdvRvshC3ChGsvWQzKz4msBraKPd3FnP2SiIsGyvwjG7peHRc/W/xnhu+CeMYYwbW5mu/DCt19Xvrw6bVPjrwkgnBYAqJy1LCEyxzk5ndMkh5bdFLo5g1C2UaptSYgzVb00E43WusQQBycU6pZvnNJMeRjoYdl5MKKZxkg4xJowOdaAp1BQ5OUl3DFUiuSPTer3uvTntOTMZhPQBSO+yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0m670vIvXXZyY7Dib4rYYlae+3mXFbkhw3IiVDJNKM=;
 b=bTTAv7nw0zwiIQrlVZ2sK54ubjh96g3DFUoiJKaxryoGIqvFEKvcUHkHOX2FVBA+M1k7FPgkEGGiCOK5DdMZkTFhaWdo9cES7xJ6SMiFGjILrxmWuD42JhKY2aLG/SCDxHwlLdxwyeg5rvMQadw0v5vrC5TX/12rA/coWX9isDz08DvY/LsZo9y99ZcbDr2fgE2c34hAY1FZO7x71klrkKOzzRM/RH8DCFLZxaVXPl2YtL/d81LhfcPqEtTRraBHw8IOb+XiPzwc2s7kPH0s6MboEL0oFQj04jB5aKXPVwG5a9ZFHoN/3oRjzgmfIBqw8khxeCHQgXpg80RGEDZQnw==
Received: from BYAPR01CA0004.prod.exchangelabs.com (2603:10b6:a02:80::17) by
 DM4PR12MB5889.namprd12.prod.outlook.com (2603:10b6:8:65::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.28; Mon, 29 Jul 2024 09:20:33 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a02:80:cafe::d6) by BYAPR01CA0004.outlook.office365.com
 (2603:10b6:a02:80::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Mon, 29 Jul 2024 09:20:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 09:20:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 29 Jul
 2024 02:20:21 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 29 Jul 2024 02:20:19 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH] device-parts: editorial: Add missing struct keyword
Date: Mon, 29 Jul 2024 12:20:05 +0300
Message-ID: <20240729092005.425107-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|DM4PR12MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: 0feec08b-11ad-4661-c263-08dcafafb2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b49H5Fay0obQpUj7WQuFUPCNsLt2y0YJhnNeJLqB85tl0pjAwXmgl/QtGjD0?=
 =?us-ascii?Q?scsGdLegKBnLKxl6A/RYBpSF/8yDaYSWTdMMX5VL7503Dc667d5pCIYkrUrC?=
 =?us-ascii?Q?ihpnTl1KVQkmPiqk9G6m8KVSLSA58sjS/MfzKv/iOY3nYrTC90rLv035DJB0?=
 =?us-ascii?Q?rREkVTOuXY8GKHZkW545iFgAvKbp2PL5JzJqkNuZBSpN1L4EEoPwIfa8llYs?=
 =?us-ascii?Q?IKTzgKktJQE2z8U0W5sXbAxc3ZrjPBI2bkMU80By4u8VQsI9AvFfp0Bp6Vhd?=
 =?us-ascii?Q?L12ZiD70CdvLDxyPLfOQyReNSVi8ipEsvFd2eNqeh6AgqSM5k2Pts6XEuXQ5?=
 =?us-ascii?Q?NAteP5nL2fIMTYKDuMWIYjYw6uxHsByxX5Kwqrj8fAhddQK68PIK26O2dRSj?=
 =?us-ascii?Q?bjIu9HmAap/sb/u2stAEvJvwbYcyP57SZ8BhQScbVY+GrbTFsd/34IBo1reM?=
 =?us-ascii?Q?HX+3MGURO2q4N22syUKVJWBmSTnphrmefeQIOj9FnCynezLObZ+xpVGwhma8?=
 =?us-ascii?Q?nKiD89YwMb6ZSzLRtb2bFnIBdfbz7T6GyzlBBwu3m0H6YktH9ah0ll116lFs?=
 =?us-ascii?Q?Fqa2x1XQ1CaPR9ufjsidItmTTSiGoxshKFDxatniwug2B2MmwYzlO0nIAhnK?=
 =?us-ascii?Q?RdyTI9p58JxUKSc6IRYauOtyRz0FK0avCCVtimkC7qDJadOl6mdaueeZpZgd?=
 =?us-ascii?Q?1hIDy95LP2WXHWQIFkbhMnkwk2GtvvJbO7S92F0uPOaCugObyJK6wQrP/L3Z?=
 =?us-ascii?Q?JLvpFtuvLIb4NkI2sHgEcYao1KYGAMf9Ze2w+Rl0wwhwZ4APuV8ILWbODBO4?=
 =?us-ascii?Q?WAiu+0IgFou2UGulOsyudpNNp7QYv/czqfOAfpzE1JgUYzSX/2Lqiv3XLVBr?=
 =?us-ascii?Q?yy4mZxuuP4SzTRXouSCACO2LjdLJFO6TcoyyXwPvTbZAcnMJWYf43/+yXXIg?=
 =?us-ascii?Q?L1Vx3SAByzRW46NMPkXe9Hki8Tnnm8ukmnuri1HJzjWZAIfkMEeBFDi5TT4k?=
 =?us-ascii?Q?hQBzgZyPM52D6IVUhqCEQAwmT4co1Omcf1Zon/DT6VHK9uEHhZQ6Ne/zZK5i?=
 =?us-ascii?Q?rU4DMOnQL4oRDqH6ooHUIZSzJLk+HYy+ADHosj40wp1uJpeRkQKek0qHE5Q1?=
 =?us-ascii?Q?WSV7GpS28oF7d3xJ8ymq/ykvK0beYB6K2ZlZ6C2hG8rrgrdi0M8Rodvk6kqN?=
 =?us-ascii?Q?WIyc1JM9VsNApWn8COWylOnWreE1v+2ET+IdsIo5093D8eT7s1LGPLlqkOib?=
 =?us-ascii?Q?jq/2lu0sp8AdXUE264XHrVyGglxB7PHT24Ylr6Fzk6tfjoK/kUgK/HUwsQDo?=
 =?us-ascii?Q?3lEzhqPsE7dIESRewXq7dWQCCQLj/LrwfEgY6l47W15fgfLcyMCMSAnEkxeh?=
 =?us-ascii?Q?WNuTdHQ5I6KBQzBNWltn6JglWyR8Kf3ZS2Ewr3ZVaelPsxBSaPCmqicAkTjG?=
 =?us-ascii?Q?r7S4oPY0uSVEzIcfSyEqWmKzzyDZypET?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 09:20:33.5151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0feec08b-11ad-4661-c263-08dcafafb2e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5889

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

