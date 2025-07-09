Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2076.outbound.protection.outlook.com [40.107.101.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8D92E041F
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752069690; cv=fail; b=MqYND2jK9VLGY53NQHFEyPGU2DPq9I8dxypp1sZ63WBNS6NsidBemkw9EaHmjx/5CO6NmUHdumk/yBqthcbNlCDlaeD/D89ykJ20h5yH/vjoGXUeDXf+/8mPYXKXPJgF6ZxYYwZL6MDLAj/3rsS3LDsaKLSw4+wS5Ln7zQhj+60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752069690; c=relaxed/simple;
	bh=ENJbDEP7SU2dbk9bI7nhhp438w2nxPpD+GlNdMYWSZ8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ORb6i7jG+1AKtUYncXdhFrYv8OqaBtiwTMz09HUC3RocwOFRMwecH/cES4fa7qZhITrSZLkT/89pJO3ytScpinlNYM+EmlKwBQFyxqCY1sq4dkIiQGGdUrhS+eJbAcrxY9kCvNsj9E8SOeUt9YcJzUec7TOUYJmIbP9qR/6TVms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=frifMI/l; arc=fail smtp.client-ip=40.107.101.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="frifMI/l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpkAI3EKMHgg93XaviM6UtSIZ8qLyOmMlWjwXsyrqlrnCFK3jg7FXobQcykshHvjrFuz9NAuyvc0qWHnHKnfCq45LoN40RhlGYny5SX27XkbJuSuTBpm75GMJ0mMW+PoHFoFPJXRZRsbmleOVE7BnH6VC0OHz1qbGyX3a5DV1xjEArGcpZ1Ht1g9vHlzb9WI/lCRRl4vVpjjHuG3NKoVuXSp/Mt0sgC+IZxfJt3vfTQMKTEOs/rcOX2WiCG85oLqJKXbR7yW4jCFUY5XHswyOg11raxl73pZ0Me5djCHDNRlJe1E6OPSNvARsH/+HhTrqFwXOF8ZBHfpfl8CIZLiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/r5yQaDGqr4TnwZwEfnqiK3Aic37kmaSgeIihU0QJXc=;
 b=wJu/VpbYRo6cwHwEMUBb/uVw4ZpjOmc5nE71CMPSvd4fzAmT0QGbgwKyikvo/eav7gRbvyaZR7wsT+yK8/IEHQ3siJxOVM9TfCtKnFYEdEtlIcbacx6MOn1PN4WCvxEfizcxJQUr6RFDYmUTHYfDa+az10fZiM/PK1FzDxN3UY5GpbwQVRZpOYZ1qCbUE1v78AhWQ5o5dZqoAV5W5chlrqiuyDQ++BFELaxVxpjXRtDyFbRZVhIm/JYhFFjlEAQjjj4pDoLGM7UzH4ps5usN6FOrWsQ1IP1N6S/zNlsGadzgySeDZYdJXESpbSRSRKtdlMkMC48hwX1v7MpCDeNlZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/r5yQaDGqr4TnwZwEfnqiK3Aic37kmaSgeIihU0QJXc=;
 b=frifMI/l+bABC/taFXu7onlWCi11NyxXYoqB6GTmYcNxf54r3WuIhc/l8qDD9jxI1oZhO37j8UJ44QbPT6sc0D37J+vBop1IhyNKf8FtNwbU2K1WopUjBFh859wD2rI/BkPtspS7eBnrpdFhKo4EVLoVeIX5KEcjOh5+VdLiT9HO8rESr+dfUeiJDFB+cUlRm5k5XYh1IM5IQ53DB99uHH7WrN6v9v73JGwyhIX1gkHCUF1ZWFGJSMOQC/17eSfSHjMxNwozXkGx4SCf+fLQ/MApQWE/Y3XBfXfLS8nwnsdKyXdPH9KLFXfh9r+EuKtZuxOFWB8mpjvjiO3mn9cmFQ==
Received: from SA1PR04CA0016.namprd04.prod.outlook.com (2603:10b6:806:2ce::21)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 14:01:25 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::ed) by SA1PR04CA0016.outlook.office365.com
 (2603:10b6:806:2ce::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Wed,
 9 Jul 2025 14:01:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 14:01:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 9 Jul 2025
 07:01:04 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Jul 2025 07:01:02 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH] virtio-net: Fix ipsec broken conformance links
Date: Wed, 9 Jul 2025 17:00:49 +0300
Message-ID: <20250709140049.507870-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 998f013b-9924-4363-293d-08ddbef117f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ShF0KAAfpM3uOcQEjaWRjsGtE5npRdtfmwa8X/xnoODnRyrORM3LoEdNVwQQ?=
 =?us-ascii?Q?vxTzCFygK3u8NRkAsxl+va27Tzf4Z/gw/FHQcWIAHp8fUQDVEGy4s8hTK9gc?=
 =?us-ascii?Q?ca91qUBEkvrrN8arSGzp4pHD5QKrxp16S/tPJ2EZrbsABIwJUfFldJT+Gawj?=
 =?us-ascii?Q?GHS18TJw7BNQ7mJSlxVRgsax86VnP37LsVxMGEOlVaQjPHYXXXzeh5Zfq+lG?=
 =?us-ascii?Q?fxlW4uqehFgeTqdZQ7MDzMy4OyyWfI93AmgHTlbCwjPmFgTyn531K+el+V3X?=
 =?us-ascii?Q?qTXSa+WnDhw7r3UaHWevysyf/px/NK31yzDV5RcaqUFADdJX+Z5qGXDHPgVP?=
 =?us-ascii?Q?VpHUnQBZA0sIFvrxPLuV3AsSif+PPL3O1p+vOFMZtXzO09Z2vScs7SIPzJ5i?=
 =?us-ascii?Q?J372nIDP/xXWgYqRukwShEKOn1JGfbJDOJ/gZqoSNfh6Km+HXGdF7y8cYfya?=
 =?us-ascii?Q?7x8GbF2GutM8lKYWm/eqE8ThpWEXgd1e01g/WM0UqUzpTKjAowEzUqLUUQyz?=
 =?us-ascii?Q?VgmD6lJlIILRfOn3AzFQmVWxPBAhKlHXaBl0NjdvHEbLLLSiA6Ml9qsaHPxl?=
 =?us-ascii?Q?k4X3Am4jAeN3yI+So43w9G6a0xVoQJlxFoCuMFALS5Oj917Mlx/b5febVUau?=
 =?us-ascii?Q?GuG0K7H7t7m5iw5mp2c++z8OicY9uFC1H6yVel+/fWNStxlIW8fO5EInF8Mf?=
 =?us-ascii?Q?NpFrX3VMJACfmQ/JwyRqcZSvg7HF/GyAjiYb6i42egsfsHUj7HwFFz6s35Vj?=
 =?us-ascii?Q?K1Zf/lvHKrxUuGdM7dzE4Dbr6mn3xiA0PAUzY3Naf/wxcZpGS6Ty/U/sCoYL?=
 =?us-ascii?Q?6wGO/Sc8BPI56nfY3v76pMIaWt1LZezjhfjrKFPHYUWOvGfl+bkef9UZpNeq?=
 =?us-ascii?Q?J5HZQ4tPq1IZWJgMqhTGrUqc8ttBjmSY1pYbHV8MZi8h7LTbymI6kbqpojOs?=
 =?us-ascii?Q?SsNX0kt+VcMwxi1AEkInFz+df8RJJPrzvr560Bm2IIxTm20GFZD7KO8Bmjmx?=
 =?us-ascii?Q?Q6At/0ViQvcy2QuFVlKtMZoyNny1fh9EOj2pAGeX6p7RSBJ7N0noCp22wai+?=
 =?us-ascii?Q?1/ySFfNdlWGGVTYlIosAefLXYB0Xa9Ve4dfK4NuzmEQVEgeMyS+LvX7jJ/2l?=
 =?us-ascii?Q?Q0ywqRURTC2sPiCfLP9GEBHs8citnUwys59IQsxCQ0bDCBnQyp34Uv8YASS3?=
 =?us-ascii?Q?RLeME6+pm/ogitdpyUzUq71EE89Ro7afNuGIROlHdKRUOI1Q5abd8x03HKc1?=
 =?us-ascii?Q?blSE4j3m+r0wS/EmOLuNhtTt7avlZTFjZhmjyr1TJHtvJfUa7GDdfaL7tiU2?=
 =?us-ascii?Q?S1YgjG0Ol1ccE8b8MydLoufCr7dEiOm3DhbXWzKiaJNsEFV232513i/9IVrU?=
 =?us-ascii?Q?jTo1xJy1fE/T3QXGZE5E7sA2rL6/tsdpb3TIi3p9/9g3X7BDslLtnXTg5aoo?=
 =?us-ascii?Q?cwD/EEN1zCPFyvEcY0+Lnn+ROeSSMpCKHzrFwdUc5a4EfkIVB+QLKp9pk1YG?=
 =?us-ascii?Q?2c3ueN8UWjktlNUV1re0ykG4eb16z+VD5FuR?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 14:01:25.3309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 998f013b-9924-4363-293d-08ddbef117f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108

Fix the broken conformance links for ipsec device and driver
requirements.

Fixes: a0b809a7ddbd ("virtio-net: Add IPsec operation device and driver requirements")
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 415c7fd..da9ff17 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -3599,7 +3599,7 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
 
 See \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA}.
 
-\devicenormative{\paragraph}{IPsec Operation}{Device Types / Net Device / Device Operation / IPsec Operation}
+\devicenormative{\paragraph}{IPsec Operation}{Device Types / Network Device / Device Operation / IPsec Operation}
 
 When the device supports IPsec operations,
 \begin{itemize}
@@ -3656,7 +3656,7 @@ \subsubsection{IPsec Operation}\label{sec:Device Types / Network Device / Device
 
 On device reset, the device MUST destroy all the resource objects which have been created.
 
-\drivernormative{\paragraph}{IPsec Operation}{Device Types / Net Device / Device Operation / IPsec Operation}
+\drivernormative{\paragraph}{IPsec Operation}{Device Types / Network Device / Device Operation / IPsec Operation}
 
 The driver MUST query the capabilities using VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY
 to discover the capability types the device offers.
-- 
2.34.1

