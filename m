Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4688C31A07B
	for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 17:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587403; cv=fail; b=SyWv7g+3s2rpKeftRYiFlu7pYoDjYtUMu0+1dIz67Wit3ZQYU4M7mPGKEKZ/JdJD81DsZrjniIc53xsk/gL0h6O1J9SHxbnYcHqE39t7siD2iFQM9SWFTA8Tz/qqtu26hG92Ss/ObTlYWgY2lHSHh5MDN8Wfvhyav1pwuaUiGGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587403; c=relaxed/simple;
	bh=FksDbrjUv+VhsehyGi9Qw8mHspBVtJzJEJfhOPsyxFU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ARfZuEkrZB0sgT2fP721FO84GcxBd1F6XDPlfpCpvhv18oTP0Ue97fSC5f7vIdMmo6hXUL8xKqLSWmQXdDUv6FSwAk2xQY93GghEJ+4ej578QdhQ1Hu+cuSFtaMj3d45lR2lm+AuytWDY7vFdRdNBlifo2Zr2gwz70AKBgjBfs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FHgpxvnQ; arc=fail smtp.client-ip=52.101.61.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FHgpxvnQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gLKdjP53sxFo7OEAw6OQq9SVC5udQybUALpZShDR0k8ShWpkJGXWpIEIY1v6F1Vg068ceg0BlZnb16nH5mRt7Bk/OsFtWV3PnjsPL8wVkHLVYC1RNPEmdQYQurT+mLGw9yXKFI0gsFYTJM2GJ3T5NFGSQVot4nUaaZA/R0U/KtpklsDmAu7WDqKxmRJvNkrVIZHojl4VAPHLS7CAOZ+HJfhiTTa7Pi/9e6ZpJdqXMaOyZyNZQLSennmquz+vfsOsuZ7/rSQRyvbEWvnaeiNjK0J1U1A6PuluM6BIqZHsOnVqA75XecbUJD+RjRvGE3wD+nvyuv5ekhmUEQiRFUZvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsKBJKYtOkCYUr1d9tqp+T4Offfy/EbG207p6eWi5vk=;
 b=U4KC/HZ//KDwBtbl6NrxEM5wqerNUrXXbgs666cNgq4/M9uyaXzU5Xlw5JfqkpyxyFVVnPhIeRksbgghGPTr6qnTqrnAxuWNuvctV5rmJnvrnIdzkkFj3eRxsrlzuJOOfMSHlcGEwj5GWg3Le7IqoAm8BRlg07hzxgKQJCYjCg/abYhZQmcFYq9Kz2mcmQCE5vRuAdpJtFXO9frvctYslEWStnS5MUpVLgZy6MSRznVMtZB4/mcEaRF02hmjgsr9PAxkPNVxStUzRQyJxIXbWgTihAhT5JyEieAfTbdUyXkb2QzVE2csRs7WPpd7zLf7MuMQm01OVvQ13memSkC2SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsKBJKYtOkCYUr1d9tqp+T4Offfy/EbG207p6eWi5vk=;
 b=FHgpxvnQBVXWPthcojO/AIGpkY9pBROFIB/b5vYVSZhXIFSZPzGZLl6PQK8nSwJVomsDywAY7A3FHqcb1cG8iHEyRKFKMXWKzZq+ZGlYsfhnp8PjYaNX3ZxKiR6eHU2sVlMVXEsjRg/m+gw5ElUakFctpDH85TQm2m2x3b+rBHrVURWd9p8HJpBbJuBvMvDnmvzhkV/YxS9XEiHPphD+54B595IuSi2de025eHJUZr8ByrXPrmK691gwlIAGkFENG5eq0JXgk64hSpjAnVeDB3l0J+Sbn5i8kdXgaVebUhW3JPdUF7Gy27MaV+dWgLuZbxVci1izmKPwS+kHvSH3Bw==
Received: from PH1PEPF000132EB.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::2f)
 by IA1PR12MB6019.namprd12.prod.outlook.com (2603:10b6:208:3d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:49:52 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2a01:111:f403:f910::1) by PH1PEPF000132EB.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Mon,
 27 Oct 2025 17:49:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 17:49:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Mon, 27 Oct
 2025 10:49:32 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 27 Oct 2025 10:49:30 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 4/4] REVISION: update to 1.4
Date: Mon, 27 Oct 2025 19:47:56 +0200
Message-ID: <20251027174756.56284-5-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027174756.56284-1-parav@nvidia.com>
References: <20251027174756.56284-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|IA1PR12MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a0d91a-78bb-4c4e-1874-08de15813b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZtxYB7xHTfgsT7BwCbJqO6ZfZYjPebcw4I/Q58gHmM2KO8erBK4cH15aKzun?=
 =?us-ascii?Q?J2wlr9enOtHKWSyXPfV85V1QnBFmcAMLC7tRiKj2M/9pUmNYEqthcNcCp0Do?=
 =?us-ascii?Q?Kl9moGTY1bMG7L+PHYOfQPzmcKjUyg7dZ1l2BbiFrWWm1mAXbiLjwcOpTIFH?=
 =?us-ascii?Q?hoihsATu1JBBHus8wgR1KEo3zIyBqyJiCFuC7BuKgGYGvFOMcHh5zWhOJ+Td?=
 =?us-ascii?Q?M/5HYn0J1gVJ3pbCQJwVDmPvF5i03twT4MLi6+rFyxU72iqKbzJdHnMtmKPo?=
 =?us-ascii?Q?l+AcPBYY1JvNT24id6oRG4ma76u14iykh4y6VsXp199SZBdAtCh72T4lBapF?=
 =?us-ascii?Q?3/3UpeRlokhFB5PMDzEtQIvR1VNoGaTY4OVOXjcU6PCtowiuN79Hf6uocXoN?=
 =?us-ascii?Q?ghDliUp9c76nXGv+mBk7z+gdQAWE4/kRpphkUHFcGWgHt4kXGf0DLofmK/Z5?=
 =?us-ascii?Q?kobqtSqw8+dPcHra6yQzB8JqK6OqqPnV+h9jVjzMciaFfnCG/8leHPHCNLfT?=
 =?us-ascii?Q?1x9L9XrwUtLUin/QqN/YZy2y9Af4pjMTEET+UknVbJTEp/5OCN/sKteM7jv4?=
 =?us-ascii?Q?nTOoELJM11YeGVWtpR+sVybPp9L0q0SbM9YMrkZ3oaspav0889RQZnvrDAf7?=
 =?us-ascii?Q?I4sKLOkxWu6ElT9179m7TJcEqYf7gNDS+W+xbKrt885y9aCOUHNNUP9P35El?=
 =?us-ascii?Q?8umG7CdU0AkiRDQmQV7jcjoGjlLjURczm6r2Dg4qcvjufPOznIFqQoPSlrNF?=
 =?us-ascii?Q?36Lwv7bUZ7nzm8sFrVRCNL/G3NNFZzxFeQrguD/t9siFXN5W6YfrsI7Vf3KD?=
 =?us-ascii?Q?LFvqImuLYQ6r1E4rZIB+FA8vAvZtRl58333LiEx4jZhZlY9kqDPWmvbHGQUJ?=
 =?us-ascii?Q?mPE9D5cqaOng8f0QMZNkdGvyyRnhs3wWrZnF1q+j+looZtYsF1WD8b0GYuy9?=
 =?us-ascii?Q?p+nXAXKMmLCCE74APYcxkxM0/fo+ykPyCkj+WuIwbSuLNnl8UkYU9LsmmhmN?=
 =?us-ascii?Q?Sy7cxh1cXWiDLlNZj/TEhmXmvREZNS1FTyO3+Iup356jbnp8/xYXq2LXoEo4?=
 =?us-ascii?Q?QYYsnyVZ308lpfQRSLhBKEob6oBM9hP2wWFyZwV/hY+0QICLqvh9SUUV6f8/?=
 =?us-ascii?Q?2nz1/NuZZbaE0LhMBuPP5nmWs48iFga4S83mrcOxgoYNffnksvSzhPehQPaQ?=
 =?us-ascii?Q?niFtlg1hMy1P9XzKQBvaFttZyy93DykpH/a6zaKyTXmzqJ4wbI0Ykvs7SYAi?=
 =?us-ascii?Q?Eqtk0jG+8KdI4CG0qFX7xVAVCERtiU+Lz2sL1+lXCi+h/iQjwwW/lUpPvqIl?=
 =?us-ascii?Q?+F7aSPfwRbK3ghP6LgZX7fgNAF3YzehA5f+sCCIST29cP2OY4OELSmZ+f/L2?=
 =?us-ascii?Q?Q3JhfFADKyH4Io+4A5A5brP5hwMzYDWWu8mhPOJlNEUtfwqs+T1s1k9ZDCkl?=
 =?us-ascii?Q?pzm9fY3eym4cPGZIWPXNjNbvzxkwJ0SUdE15ENpkDczcz0W9tOMMAwqV2qS0?=
 =?us-ascii?Q?cCc4DiVU/HSqB2np33va0NDiJmhJSE+OEESYCfW1ehU6sHd96BmAf2w2tEri?=
 =?us-ascii?Q?TxAl8kVcDR3I7afCiuQ=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:49:51.6923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a0d91a-78bb-4c4e-1874-08de15813b00
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6019

Update the revision to 1.4 working draft and date.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 REVISION      | 2 +-
 REVISION-DATE | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/REVISION b/REVISION
index ba56baf..e3c043e 100644
--- a/REVISION
+++ b/REVISION
@@ -1 +1 @@
-virtio-v1.3-csd01
+virtio-v1.4-wd01
diff --git a/REVISION-DATE b/REVISION-DATE
index d149b6e..bad33a6 100644
--- a/REVISION-DATE
+++ b/REVISION-DATE
@@ -1 +1 @@
-06 October 2023
+27 October 2025
-- 
2.34.1

