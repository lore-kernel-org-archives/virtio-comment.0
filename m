Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B43018A926
	for <virtio-comment@lists.linux.dev>; Sun, 20 Oct 2024 11:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729424537; cv=fail; b=HcEGXGg6V9xdUHlp3eAHPQ63GTLwe0WxYaM1sAuCVlwlhmhgAK+d9RuNVLQm7J47H0alkiulqBvANnZjRmisWkZ7gqusvjHosOHuFCNaNx9rxlhPSgFe08iO+jtKz28oLnzvmOsl503Zs45QWUuE9AqkXPuCgRuL86JPtxrcMr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729424537; c=relaxed/simple;
	bh=zJous6U7M2CJJhxukYGoTaAFZJ0/Rp5QBGt2Kl1pjR0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GbSS+RTHemy8FI4yzkcnl5alfgwLe+/RsHe8XvCIi29Dh8NB5UTPdqrk+kHYc4N5yC70YBhn42HlRojRKdEbJY0pAI886YsT3cRAMQpiUDmTDdTqW1wZUmnoGZkFVPzqX4KMevkNFeEynBWkz4DtxxaZzXseYfitDL+zQfDTgTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S5/WMXhm; arc=fail smtp.client-ip=40.107.92.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S5/WMXhm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGwgkBAaYmCIcJQRLtyKC7v3n1FOjQpEUYnn6ixLrvAoLtZ9kW/5B6e1SiOlaIVT2W9jsZo1s9MCiYkmstXUqu9C+E02WYaoJ2JIPwwE7Z0MZQFhvkIxZXT0rus5KxXPqagCDi/aFJboT1mLriI24AxNZYw5kapHR5Ey2LAIfMBReoPylKairZormCJ8bMY0UyNi5zPiD2VusvKDGZLPxpO7CxSUR+ECvQINk54grK92GKIcBV856hx97V1zUHL0qchcNK6QAGoVjWzcFBW6IX1lgZCMXKjpT/ekuQEej6DO25/ZMRMyp4uvJptwhIM0jrVuv0EZNJu9VGyTv5uIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLwbFrkUXeAVczf7+AF1QZY/eF3hdrG/gHd8oItRsQg=;
 b=qJ87vuQEZ/P8GGn0MZ/aWxUFyIMLZF0al3Jwb1xgfyyQjUj3rx/yUbz28JM/6L9pdrOO+j2HnydYm8ZiYsAM+fG8n+dD8vWBo0PVzsdQzv9/HMSzMCcoqHjmqmT3Or6OIDfvG9I640Gg5WTFEOmKu3Q8m+dvr/xaNBnySrdcK0LwJZgHF4tNCG8RjqeOqDdNpWJpOWfOcb3AuGqPh2vtIPNK/TiRc9/nOJKPHDPOth/tpesoQ+VJAWxRhzGUH1jSHyP4lFWKRVqWP5KV/ubFLmcz21l08zFDFjCpqvGulOe/GOAi7mvdbG+hFIBX7oLIg4DesOqGNtpgT+CfTisNXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLwbFrkUXeAVczf7+AF1QZY/eF3hdrG/gHd8oItRsQg=;
 b=S5/WMXhmVLUXsK0htR9csbFY/3EknmP9h5HAdPXLhLLTuePA1Y8IAbK5LvBBD4fZCvmecQZ2LMqqeetRbJK9OzolqtBjtGcjIW4yJhswbWs90sJaoKonyOKcpIuUfx47cbyx9FPioM5ciQdMQ3/smupYAnLV2+dt++sFF+sdihJHLwrH3IPIlZ1ueX+RdBPmPb0E6pr+mhoUQKs5rMuIumYXx2jSe5sSB+Ab6d5Pa61aFLWBMiH855JeKd7P5/f9Xu2KgwRtA98dMkrHDIwlBQE8mBQBlieUDMr8HSb7nUX+5FNe5tPqG9xC2esq/Gq6d7c5Z1RdWkH7LjKgVX4lCA==
Received: from MN2PR08CA0024.namprd08.prod.outlook.com (2603:10b6:208:239::29)
 by MW4PR12MB7483.namprd12.prod.outlook.com (2603:10b6:303:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 11:42:10 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:208:239:cafe::ba) by MN2PR08CA0024.outlook.office365.com
 (2603:10b6:208:239::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Sun, 20 Oct 2024 11:42:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Sun, 20 Oct 2024 11:42:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 20 Oct
 2024 04:42:02 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 20 Oct 2024 04:41:59 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v1 2/3] device-parts: Add device type specific raw selector
Date: Sun, 20 Oct 2024 14:41:40 +0300
Message-ID: <20241020114141.451478-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241020114141.451478-1-parav@nvidia.com>
References: <20241020114141.451478-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|MW4PR12MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: d29cef6e-77d0-4926-a6a5-08dcf0fc3b50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5ZJOrK9kaRfZpyrcw3f4sQ+YguADjK+SeLpXmxkZoeQG949DuagrTpzIS9WN?=
 =?us-ascii?Q?b0TNoqovfbc3IJqZKNjyZkZUR3cWmLhI07eiSRm47zrtP9WQYXyGs9O1vbZU?=
 =?us-ascii?Q?jGeZILbYHPOvbfak0uEnbLETcr81PZC1rTZUL8xl3qq/fWnBtlf4YQWDveML?=
 =?us-ascii?Q?JpQOtAtpxvFDPZbe3oYjr75B8vSPMDLBsaIb7YrK+tyf/iTlwAbTSX/BVT5h?=
 =?us-ascii?Q?DKHl95wpLa4P7zJxBLZOlV2p8CPfnWdl1oceV6J/mAJB19S4W2MCyqJtWczv?=
 =?us-ascii?Q?JtN79lO3LwtrCEFgHtAr/UL+IzJGYmi+cIkJQDSikaynv1Kp7Lq84D+HlFoq?=
 =?us-ascii?Q?eysnFXKQ4Fe6+QPiBx0F0Mqh2K3GFxPV4R25AD7xXgfkXK8PiR/hQdAy7Gy+?=
 =?us-ascii?Q?5AiMkfkxa4b+arzUC/MSvzDlSPpe1D3k2r21YYeE+KyB1xTb1Bz9HqVy16+v?=
 =?us-ascii?Q?Pkbg5KCa3+WB8p5q5PjRnqUK0geUazwtv1pkqhcyha6E4KYRsuHLD72yUrq/?=
 =?us-ascii?Q?uaLrRY+FVOad6hd+0do4tx/dUNjMaVxA8Bqd8rgXdAudKBWHGRKGX6BgBDkT?=
 =?us-ascii?Q?bY7X1BgO+nTFhMOfP7Ks0WGBeolLl5AqkiVVILe+6nWZsUpEczUWvAJqlpWZ?=
 =?us-ascii?Q?Eo9U1QnAz+m6t3q/fpQUhNiKiw26v2xWIS21Is+6AgtxID479L8rInJ1wrkU?=
 =?us-ascii?Q?siI9QgMotCkNvuGt7URbYjGZ8fRajsq2gGSAzuklUkS76tqRf3GFignfH6+q?=
 =?us-ascii?Q?DHJe2qsM8CoiWeWt5yBRLDySQmBUerAiznv6b1DSsYaXm1V9Mrc8zvl0jbFJ?=
 =?us-ascii?Q?/EseQeSxnxotjvn3SiBpAmCsD92ix9EyL2ZP25gn0CIVqFV8TOJit43v4um1?=
 =?us-ascii?Q?vXlhz2r3g1WdS9Fxlb5HZMxXeGj5Qt4iCyVQyhGAc0lf4a5lWoKCmqeucq7i?=
 =?us-ascii?Q?mUrWLMS/yH22MpmDP0muKmRXrJuJfcJQ9hiBxNhQJLsJNkUjjss4xLwgCV3M?=
 =?us-ascii?Q?P57jo8/Q+0ktGejQ89A1/m0Um7vsSidgoZZknr/Y2P1R9iJ2z3dUFKx3almd?=
 =?us-ascii?Q?Pi/KOhiA/U1f1YQAq3FyhnKfADT3gu3CxhpaiyjZ+g/UTWqy7myV7dsd1DzI?=
 =?us-ascii?Q?Q0YUfgPbrkyOWEcIa8le1CssaHcRXMlBMyLAF1sb6gDmTXHTAVqTpt0ReBZC?=
 =?us-ascii?Q?RkJVxsGcTA5BfjKtZMNv240uG9UCE+HoSNFqZNdHTzveNlyoe3ICAl9DGnYC?=
 =?us-ascii?Q?2fmmNxhjn5RFBPP70XjWbiFcnBAyY7VTGgbfHMYMWNFvtpOtXmmOspmnwmXd?=
 =?us-ascii?Q?q/6cnemPBfRI/dUePndYRhrUA2/vWwHTMqPyrxQSEBO67KjEm0hnr1tZ5duQ?=
 =?us-ascii?Q?7KeDnF1pxmAA8heY4x+1XJEFLkTK3MoTOH7m7uuT0V1B4I1Ktw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 11:42:09.5302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d29cef6e-77d0-4926-a6a5-08dcf0fc3b50
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7483

The subsequent patch defines the device-type-specific parts. For
these parts, the raw selector format is defined to ensure that
each device type can specify its format accurately.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v0->v1:
- addressed comment from Matias
- rewrote description of selector without writing the actual
  part_type range, add description that it is device type specific
---
 device-parts.tex | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/device-parts.tex b/device-parts.tex
index e59c0f9..1d6be87 100644
--- a/device-parts.tex
+++ b/device-parts.tex
@@ -21,6 +21,7 @@ \section{Device parts}\label{sec:Basic Facilities of a Virtio Device / Device pa
                         le16 index;
                         u8 reserved[6];
                 } vq_index;
+		u8 device_type_raw[8];
         } selector;
         le32 length;
 };
@@ -77,6 +78,10 @@ \section{Device parts}\label{sec:Basic Facilities of a Virtio Device / Device pa
 only when the \field{part_type} is VIRTIO_DEV_PART_VQ_CFG or
 VIRTIO_DEV_PART_VQ_NOTIFY_CFG.
 
+\field{selector.device_type_raw} is applicable only when the \field{part_type}
+corresponds to a device-specific range. The format of
+\field{selector.device_type_raw} is device type specific.
+
 \subsection{Common device parts}\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts}
 
 Common parts are independent of the device type.
-- 
2.34.1

