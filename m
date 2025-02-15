Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9F9623
	for <virtio-comment@lists.linux.dev>; Sat, 15 Feb 2025 06:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739599624; cv=fail; b=S9pWfvm3G/ma0uGz36KLibfSC4zSGeGORr0GZZwMDsEjLW6JRoUb+/ay0ZCqqCoA4fWKFzB7lo2ZZHsu1r2e8hCd3lRanZke3DHwYSvNjz5WY1Vjop+bUcL7ThzHN/cc0CMjTaKokXFP4j0fuqFvs8Xuz7CvtTe2C2HsSKHrEno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739599624; c=relaxed/simple;
	bh=ibXfiJY5xj/rWwa1gTWXD1QpaWT/toO71U9RBF8WnCc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F+nlZxIhIK+JBXEyLsOZaqutYso6xrLM8mWnUrBC589uhWjD94CMS78pt6FgGZajjDkJK7ix0Tgs6g74owhahI6O7W7oxzZTYVkywXj3BTUZD+KMbBH3vDVtAVKurYuB+HVuEfbwQ8mla0myU6r9d4WBgUoN+hrAiQRxeazwbBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LLrn6vW0; arc=fail smtp.client-ip=40.107.92.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LLrn6vW0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPjh7//T6P1xSTXdUz29e1NvbfYVSRrm5eM4w19FapEK9EWDFMrsgccgJxUl3f/SH2gOaq+EyEyIV/9ry8sJgG/Ryn3WSWEGWaOFXW+jhKvXJ5SMoW90n6h1bZegcJcirhHLYIoQm9rxKX0yE4yA2Lne5xi69KbIrKjWdTMxKoPcL1/xyWWMMbnlo3Dezr1r59lD91kebtjfHPHl9/UWjWf9AiWCVkcrbkuLZooaoNVc1ylI0Mq1krvwpsOdAzQI0jReL0x7xQmo8JMDf8XnH90Surtkc/GNjideDnqa1kuJGS75F/SnkZrIPM3yhkPiI8R5uuVHrgJxn8vbIN9VAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDdoiT/OUvI38glPeK6nEg1Nmz0Q5hX/U8NVYdb7jX4=;
 b=BtKu/TKlJMTLYnHKcFIE9DqWHCYU28iRpOAzL6zpIQy5fJCFhkjrJ2SJQpTp3jg3DyjszPcyFWvAqSUKGy0NXfRbneTGrZ4diYjRL2xFPB/KRHU4wCXxedJmh7UuEWuTs9c/XE/qy4Nj7c6qULUMw0dX7k4DzbvdmyweDbSu65dSDp2rAAeYl+B0Qre+lu8PgkLBi7gMtr/LWzRgrf4IoU72FbCwIpRbkseLhOprMt+0KAQf3Knu45VYWQOsH8s9NnEEk42Zw2GM/gvmw9mpsU+8WJ5NitEBQPKtIlWfRFvOmU3updD1Sbg6bhhcRLLlqeA+XeSOT/+z71YKtfwzVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDdoiT/OUvI38glPeK6nEg1Nmz0Q5hX/U8NVYdb7jX4=;
 b=LLrn6vW0uBHJrZvpm+HLHwoq7DHvbphAwUUfbeMBz1XfSwohJxOGiFIGtHmSW0CIt/dl1V9ZMjc2mofOxTgPASR3bXx7kozT5xk7hPYw9DDHSaNKJkeejlmuRew6j2d9MAWPUhSxtsOA/Zyf/2b7kpeEoWi2M37RW2q3zbO31NvEBT4eOjbN3OZZxp/0VD8l48w3acHf+m1gJY5+jtf3U7TwRtpt6v0EnpWS2lCYtOG44KF29mdxmlmdHyD2IXmVf++CtiINbsg8YmvwKLuvNzdImmfyPzyz82teOZnk5qyz2GcCwrMWk6ETSJcnCl286IQTk4gG8HsEFMxGYadX9A==
Received: from SN7PR04CA0034.namprd04.prod.outlook.com (2603:10b6:806:120::9)
 by PH7PR12MB6905.namprd12.prod.outlook.com (2603:10b6:510:1b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Sat, 15 Feb
 2025 06:06:57 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:120:cafe::15) by SN7PR04CA0034.outlook.office365.com
 (2603:10b6:806:120::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Sat,
 15 Feb 2025 06:06:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Sat, 15 Feb 2025 06:06:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 14 Feb
 2025 22:06:51 -0800
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 22:06:49 -0800
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH] virtio-net: Rename selectors_limit to classifiers_limit
Date: Sat, 15 Feb 2025 08:06:33 +0200
Message-ID: <20250215060633.20997-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|PH7PR12MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: 721891fb-db47-4908-88be-08dd4d86f43d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t3XGHt53Ayc+V3ILPPOrs/mXW0ujGjFIifdZgKD6NdFiTKCDp13V7zsa8L7o?=
 =?us-ascii?Q?ASFSocn2pPVKZyJCf84yV3TyVxBgKqfmrln5NcEaDIoUhYo7LuLkfb4nlXYe?=
 =?us-ascii?Q?472FxzczGZb8u6tgST3ndNOMjBhe/3H+1PRo461i2g9S0Wqr0t9b93qjc0dz?=
 =?us-ascii?Q?P4DhooMSNyI7EAIKlRr30Lh2sb6onxiGSTZURahv+z3vVMV4V+Oqs+aGyLvh?=
 =?us-ascii?Q?YpWuYMtBoY1pKnMFcxnc0BTo3PL9T+VSSbR3TkNc9o8r2WsWo89tGQFz06ru?=
 =?us-ascii?Q?TRNJNlUJqJNeZzJgPWh1+0BuPM1/rUoNMQQx/VhrXwGoyuCZuGNnHo7VCkh0?=
 =?us-ascii?Q?lTPdeuUiGPok6XwXGiV8b9IAmu8PHF2B+vefAwPABoJNoJws2i/4c7fL3BSW?=
 =?us-ascii?Q?aANNuBxyL7LfN+1fdsBLxGMdh+DQ3VuuNG2E1KU2oD3SVXnZHmZEVpajvQRv?=
 =?us-ascii?Q?frq9//ZYK2OdYbC6C5zvPIbuzMFDm+dd6Jf0ZGCQ/tx14NzP+tSG27I2uW/c?=
 =?us-ascii?Q?WjM1OO2t662bDoBYlKsDdNGcGfoxGup3mMimYXwu1luM/LW+WKc/FKtKyeZV?=
 =?us-ascii?Q?Vq0XUQKq5KMsuUJcrmEWB1ylaVJgA60bWeTsMiJLFYnB6eizwA2QdSpXpnQT?=
 =?us-ascii?Q?O5gA88NrAwwsJk4GYl+bt1eWlXXeTzCWS6QG7/d67y5/T7JbZdV3b1OC/r2x?=
 =?us-ascii?Q?MWd0LOMlvXNR9IVtEeu4TQrxg1fkeFuKgpbvDu+5gGLDV+o/OgKx+PbjYy+/?=
 =?us-ascii?Q?4xpwuORi6LOMGO46ezcIFj+LE2hIpq1dDIJHqfm/IPJDxEOn67DkDVKr8/+K?=
 =?us-ascii?Q?V2977LcOTSKEYFHqu4qrqWNdpX0XEaJoa63t4SBJ5q5w868fqIEkrnaQFPEg?=
 =?us-ascii?Q?0OyroNskNv6V1ElIv9ed0glDcSd3/zPWABtZf7QO4roLkjca7q+X8rNPLQ0J?=
 =?us-ascii?Q?K+stzbFiTv/CXiRnxnM5zwKl78dRAzXfYxvE616aBY2O8MkO8TdIkFPooa6h?=
 =?us-ascii?Q?/VthrLgsHqLtAEwNTVMDvqLbz+z8K99ZgsCyXQvK1JPgPqHX8cliMxERJ+Wd?=
 =?us-ascii?Q?YLYbzbLBNhRnofQDETmC8VRoz+y8oszCOiBmErhzfHG5lFNHeR0WqcP1jJQm?=
 =?us-ascii?Q?rudB6xOIkW61fM+5se6RrNBSKJ3hvMcuQb3lJFCOx5oLQy5RhlT5yNmhsu9l?=
 =?us-ascii?Q?SoemRug2JNDykw5QwfIsPuLkS9ZDwWSwuBwzUvTy8TkMC6E/XYK8mbYdt3Ef?=
 =?us-ascii?Q?hfmcntFx2bcN1eGqCc/LiMUNltP75j/vT28/1J7vpXn4lIA7P3BkQJR+MWWp?=
 =?us-ascii?Q?P5u2Qq/aQNI61PPacLvINrEMp4t/6WygnMGJbAeQDcBVoL75cbFbyMe+tplN?=
 =?us-ascii?Q?5R66gGtLt/fubSxRRsfN0jaNyQPdt8tL2a43fDDQWAZTfsxbKoqg5rHwdlu0?=
 =?us-ascii?Q?R09+sSRJpB5S2xmZV+OUEcosYeTV28Q8SbWaYEUdUdM7340oFYloAyOw4gn3?=
 =?us-ascii?Q?RxZcyw1/QRkZUE0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2025 06:06:57.3858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 721891fb-db47-4908-88be-08dd4d86f43d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6905

A classifier object consists of one or more selectors. The number of
selectors per classifier object is already annotated in the field
selectors_per_classifier_limit.

The field selectors_limit is intended to reflect the limit of
classifier objects. Hence, rename it to classifiers_limit.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/215
Fixes: 3b7b7371dbed ("virtio-net: Add flow filter device and driver requirements")
Fixes: 899bb0ca24d8 ("virtio-net: Add flow filter capability")
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index b546cd7..3894c7a 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -2957,7 +2957,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 \begin{lstlisting}
 struct virtio_net_ff_cap_data {
         le32 groups_limit;
-        le32 selectors_limit;
+        le32 classifiers_limit;
         le32 rules_limit;
         le32 rules_per_group_limit;
         u8 last_rule_priority;
@@ -2965,7 +2965,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 };
 \end{lstlisting}
 
-\field{groups_limit}, and \field{selectors_limit} represent the maximum
+\field{groups_limit}, and \field{classifiers_limit} represent the maximum
 number of flow filter groups and selectors, respectively, that the driver can create.
  \field{rules_limit} is the maximum number of
 flow fiilter rules that the driver can create across all the groups.
@@ -3310,7 +3310,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE when the resource \field{type} is
 VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER, if the number of flow filter selector
 objects in the device exceeds the configured driver capability
-\field{selectors_limit}.
+\field{classifiers_limit}.
 
 The device SHOULD set \field{status} to VIRTIO_ADMIN_STATUS_EBUSY for the
 command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY for a flow filter group when
-- 
2.34.1

