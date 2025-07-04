Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CDB184
	for <virtio-comment@lists.linux.dev>; Fri,  4 Jul 2025 10:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624297; cv=fail; b=Y+j3TvmJ0NwPJaeCVSvxsHTfTVvCVFcV1QrUFo/jA/2p2hXTv8dh3lSL4wZyb59EObmcZGDpqT386owtRnG1NzeCxJMr1MJbsylOWY8DNgTgPOIScOwkmgXzDyCaRcscUGlYG3i4crKPJiNPSTf/FbBLDqvRV1DUJB1civCcV9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624297; c=relaxed/simple;
	bh=W4uQ4WdYM7vnN1gAg2oMpRPairnUR3gIda0cQvhvBWM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l5EWrtCtjYA/zSWay1lMz2HusKkI59yShz6ShWVZOf5EJh0+imkHOLTYfmS2SXiVrk7Chv54+mJyt2MnDdtu5vJj8oXShTUmFPFdMZvc8X3SGFPIVkCqWUH6Y591GAoRL3GpMN36LnVXdjaIurIwwox6BS6SzrRpRf40ooz5u34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oRHmRrs6; arc=fail smtp.client-ip=40.107.244.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oRHmRrs6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+iRH0kHD6gyd7W9aweVHSfJxv8YMbQ4qpEvP6KnaDl70yPrQ9n3kRksLASWGKRjA3vWUfHXahF8UHPxLfTKbnsBowfF7CfYhUyg7Yp52SEju7vbWMzqdmhyT1x12TLJSLf0aU4QSz4NqPt3tyy3jd4//NpE7dx2dyHXbClVza4EaE+d7YXGrHhnj72FnJM4xuIlOjy+70Bwqwtkum3TDeZrjjzebekXcj+B06JNaaAO+z0PrO5heisXehM+346G3dgoZkRLuCyNZmMp829cbWYV5s+KSK840K4lH0S8dAVjeom5xDEDJwFY6qeqzveewiuT/KWY7So7hj/kvUzo7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vzql+l6ANiCOyXwaXxWLDlaH1g8/NBrBodT4SdERD7E=;
 b=HMqmcJKLAXE82pvlAOqllTvPYLqTXAmI3Rs1lqBjDPHQCZXrUqfxxQF/AL86FjJDKl+27r7yy4bWAxTmIgdxiWp9fVYIWZr3+DK9yBgi+nxmfL9UkDRhw820vGoY/Gdlr/ZWDV1obZ4oGs79ur/LuHUWl+2b5GcQevnTHA7iiMCFbrl+kJtlXRr2LkS8HsWbwyehQNQ/vvOkSNbYjrgI4C9TNJGsSWMic0mp6Ic+tlX2q9CixSN30bbu+f0eE9vtr42qc71h6VmfZJvjWBSBVAuYwocoAdmLWFeDySIoHcWDmIt8LhiTqKhc5YDk+YUCFbKsNdWdUtQS1cVBa7HbUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vzql+l6ANiCOyXwaXxWLDlaH1g8/NBrBodT4SdERD7E=;
 b=oRHmRrs6vsaAWM368O0+zTGVV83UwizJGipAtRKLFMeuoXRyOpM8gefp7TJp3itM4dCnCnSXeEEYgtNmyha2dflvhwU6PYWRJeOdDD/QOlXcEdmtLOH10P9S4FhLrgFd47bdsGpa6eWB6cHIVQ2zjMrTVe+f6YbqjmkMSFPg4jA=
Received: from DM6PR12CA0023.namprd12.prod.outlook.com (2603:10b6:5:1c0::36)
 by CH1PPFF9270C127.namprd12.prod.outlook.com (2603:10b6:61f:fc00::62b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 4 Jul
 2025 10:18:11 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:1c0:cafe::f7) by DM6PR12CA0023.outlook.office365.com
 (2603:10b6:5:1c0::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 10:18:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 10:18:11 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:18:08 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <Ray.Huang@amd.com>, Zhu Lingshan
	<lingshan.zhu@amd.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v5 1/3] virtio: re-order device status bits
Date: Fri, 4 Jul 2025 18:17:37 +0800
Message-ID: <20250704101739.354522-2-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704101739.354522-1-lingshan.zhu@amd.com>
References: <20250704101739.354522-1-lingshan.zhu@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|CH1PPFF9270C127:EE_
X-MS-Office365-Filtering-Correlation-Id: a250eee5-2ddc-4d4b-1ebf-08ddbae41486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jTnp2od4tnLEaUVnR411qdrDTR2YkzZEUy3DlVKvIrO9UDLG3LAOSNIughQa?=
 =?us-ascii?Q?DGBoxaUZ3llJvE9G6z604RBzNk5bL+jKFgzQ0Rmv1MRMkpa9AU0s4tOxx5RJ?=
 =?us-ascii?Q?xp9hqTImk6LZYT19Ld2kfVHkn5tgAfOEvIR7QnBO7xfpr+tn9ZfJslfP+49x?=
 =?us-ascii?Q?64e+d5iZHqCaApzKrSKkYiLgRSxKvOKV3jknrG7kxp122RFohgRDTICUg3br?=
 =?us-ascii?Q?nkV4bmPWH1/qMCmPcHg8Li+4XodVft3pFeVnfC/oEdRLSLTgQ7wtclaPOBGp?=
 =?us-ascii?Q?1mzc0T/ziJuS8Bsd6AIInbeV+G+N/0fiy6822sOaHfks/0AIFvaq0SixrzeH?=
 =?us-ascii?Q?GtNEMfQePnOwxV8IoLHQuMSekj090vWMz9T1f8cO46brYmXSXt/MLgmSoNAH?=
 =?us-ascii?Q?r8js+dkelxdWA6lkPD8Rvkxx4SRS5UXOhOioE0izkaNIfIoARtjoeLZTaZlq?=
 =?us-ascii?Q?usZmgBQEn+pNZ7gs2dLcwwcdHY2jumoRKBc6lkiis6FZSj7vtzE8DyvlBsAl?=
 =?us-ascii?Q?krxQmk3k453bOmChesuS327sZdFtemOjtwCQ1r7CbXSCZMlqt0jreQO/NW41?=
 =?us-ascii?Q?3yBtngXJCrrloUacS5NyQmk+nhm3fnUhhkuKwKgQMCDUsdUKQnRd/wi3NtZk?=
 =?us-ascii?Q?uTZEkWI7kO+rUC3LsIFU6zX0gKi9Jvywh6jWTHO4HS7ZdMDFyQJJT4A7iJB5?=
 =?us-ascii?Q?q7KtuyalNSyYqk+VuyawdozUvPDMGtBkL5dp4JwTeKerY6c629QmdlgwpjMT?=
 =?us-ascii?Q?W1+LIwmyWG/yt49xyvr6gi1VRYoANH5Zcf1jsxb1Ek0k1iLstFoSp2uyZD81?=
 =?us-ascii?Q?UsWeosY20nk5oCEVfcwRQqOhJ/d6isbqHqCRW4OQjwqLehbzG2g55uMyjZCZ?=
 =?us-ascii?Q?vW/PVX3Msi47+YFXJvBGtmZX1JyzDJdxubHvJrPv/99yaBApev2lqXz3UGxI?=
 =?us-ascii?Q?O1lKJ4dfe+efDBqKSIuXVKYG+ZAFe/LeEQ/BcmeIKXSatfSy54y0Y7l/uOhA?=
 =?us-ascii?Q?iSYq9jv9djuWTjuzhkEA4fZd82VQzhq7mvLuh/K1buJDScwjZZvg7Irf63Bc?=
 =?us-ascii?Q?dSh07EAi+xzXs0sU2wQN7K+0vxeybtGOhXFtsOi/FFC2uiLCAU3H9zNusgdi?=
 =?us-ascii?Q?IDZHRQT64GKx5NgIMr7TPaiEclUBu0V4d1ksAfHmbJuNVjAjE3PGS5eSmvwo?=
 =?us-ascii?Q?m02dGPfM1gXj9ruQzItA6SNtHpLwc4HwACngyG/Tuc8bQje4+m3kFA/scQOz?=
 =?us-ascii?Q?l8mt12ipALM/llBWEMkeVHJCAcMIDzjOO9UibTNFNuHLvSYQ5YfaWZ24dQ5C?=
 =?us-ascii?Q?HpL+oTQaWFQjfWGbkpTt8KyUBNZDEDOVkIE712KO+QXqTVdORtV2by+y23qf?=
 =?us-ascii?Q?PHgO2Fhp0Htt/RBBhm0haYOARCH+LbQbGl7DA3KpASA66XoaOFmxQpfk0m8V?=
 =?us-ascii?Q?qchb6dlUQtg3Xlotqm5uQLnn26exNbTZYSu3o40z5uYxl4BRSFP3i7tCbDdH?=
 =?us-ascii?Q?kRN5TjCdYjIibssEAPJ31Zq/oETJrtHYO4f6rL7qW33mFk/mOnfsVwUdWg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:18:11.5318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a250eee5-2ddc-4d4b-1ebf-08ddbae41486
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFF9270C127

This commit re-arranges the device status bits,
to list them in ascending order.

Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/229
---
 content.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/content.tex b/content.tex
index d3fc6a4..1efc2a5 100644
--- a/content.tex
+++ b/content.tex
@@ -36,19 +36,19 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
     this bit.  For example, under Linux, drivers can be loadable modules.
   \end{note}
 
-\item[FAILED (128)] Indicates that something went wrong in the guest,
-  and it has given up on the device. This could be an internal
-  error, or the driver didn't like the device for some reason, or
-  even a fatal error during device operation.
+\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
+  drive the device.
 
 \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
   features it understands, and feature negotiation is complete.
 
-\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
-  drive the device.
-
 \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
   an error from which it can't recover.
+
+\item[FAILED (128)] Indicates that something went wrong in the guest,
+  and it has given up on the device. This could be an internal
+  error, or the driver didn't like the device for some reason, or
+  even a fatal error during device operation.
 \end{description}
 
 The \field{device status} field starts out as 0, and is reinitialized to 0 by
-- 
2.49.0

