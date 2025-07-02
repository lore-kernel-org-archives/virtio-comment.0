Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCB91EDA12
	for <virtio-comment@lists.linux.dev>; Wed,  2 Jul 2025 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446489; cv=fail; b=ROEwPIhbPF8qZyUWns5kGAKtM+N9dCNJm9icjtlnUBEb2K7iZKCynag2fhBq2xa3POx5LhZlqzNAIKWVQ7NUwkGarqXxrNeqwelpSkv8Im+4SN/wQgwX2gJ8ZQfOkGBBrNds1W8A9omiRqX4G5Ns0bZRG3PnbW0cqPvi5Oq4f9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446489; c=relaxed/simple;
	bh=W4uQ4WdYM7vnN1gAg2oMpRPairnUR3gIda0cQvhvBWM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=maBz3twLsV/MRIdZcdf/yuczkXu3KfXAUCofrWnbCZCvN9PfW5HI+a3ZuQIOAC8VoWQyKPW6b2Zo1zVY40Li7s27JQVN6erg9j3Y27faKxHw54IybWO73yYe1Ej4AfPsqZ1pY7HqPqOz7Th4YA0LRFYeFJJq3eocmPV0vOoQqGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=H8vb2Qfi; arc=fail smtp.client-ip=40.107.93.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="H8vb2Qfi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbHwt0YMcmC2Z5L2eXe+zWhyMSPmtp5FcdLrGXueSptVXFaElwBKQy8hDY2GsqBx5PTfJ3CfFQaCekbowtVKhgQfRHW67ejmPygiWwzylp5QJQk0rfsciOez/W6LQ2pWFLsNPbxFuhJQJyfet4FD204/+0tHk61oAObJei43lL4PENKzXj1yOqF7sfjtnjf3IlQu+yGkLuOSHA5Vio6dDe1LSgFwBfLXQAR3mV4KwoysZZ86EFEm2L0VN1Emjo8O7z8yAENlxaortccn/brUeLg9BSOZ1i0u6A2qtmMOwALrxzRNu5AZE1Q5UjhZOB50wqCERoNrvNzqJotaoInnhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vzql+l6ANiCOyXwaXxWLDlaH1g8/NBrBodT4SdERD7E=;
 b=bUlqYl7SWpafQj6TJUy/92Ks9AH2FSb0DSQ9G7uaupeLUCn/OHABAPpYmrMRqiPUIoFwcCk1TfbLNSnTW2QQjCweezxW7AB4i536aijxcqbFpGDe59nYPWeuj/eomUtGgjLMnxhY1strels2a12rkiCdxoh64CJgHa9qoTIv2PQK0TpGr6CMHFovNVkog1fTk3cW1xCR4Sj+/aOS3t8oc7dTBa4OF+rZqstdBdV9A7rbp5p2gtHfPoPHyTrsUhS8KKdhbwrRDwkdEv5RWCJPQxQvS59mk1vKiCn86UisTz0mFqa+pNTTquzeewa7oG2WnLv76m0RY1YW35BqSlrqJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vzql+l6ANiCOyXwaXxWLDlaH1g8/NBrBodT4SdERD7E=;
 b=H8vb2Qfi3KyOzWQa+lsZz5f4exioA41GwOeNqs6QBsQQXMQ4iMNcyI3GCviJiM2tezqxAYSZXZefyBUBbbiRbN37KYd2A06AO4LMLG+pKHH6eZE2YDFfdPWOSgLt7YDhar6BoWFX8cMqsyqcW/HSvz8sjQlB2qdNpue+jDEpEck=
Received: from MW4P222CA0015.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::20)
 by PH0PR12MB8029.namprd12.prod.outlook.com (2603:10b6:510:26c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Wed, 2 Jul
 2025 08:54:43 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:303:114:cafe::15) by MW4P222CA0015.outlook.office365.com
 (2603:10b6:303:114::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 08:54:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 08:54:43 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 03:54:41 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <Ray.Huang@amd.com>, Zhu Lingshan
	<lingshan.zhu@amd.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v4 1/3] virtio: re-order device status bits
Date: Wed, 2 Jul 2025 16:54:19 +0800
Message-ID: <20250702085421.342224-2-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702085421.342224-1-lingshan.zhu@amd.com>
References: <20250702085421.342224-1-lingshan.zhu@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|PH0PR12MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d51467-32eb-481b-85ed-08ddb94616d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pP48mTb2HLayF/s69h4JpFqlZ5nM/ySuKgEgEj+2W/V5UxTTv2DtUYtRhGMT?=
 =?us-ascii?Q?c69AmWIHy0mBf0937WBAB25GsIX6jt6ci3GfSKWlE+7SOWd/eRKRk+c3btGY?=
 =?us-ascii?Q?eUCgnC2SD03gmBtcvDFbHtwLe+GUFrMz/3qsTcyztWaMNjC92XsFjtTOPhDU?=
 =?us-ascii?Q?mG2z3s/LGwYicmdc7KpuIH/LmjSV8+wKhOM2FLVBdevRP6iA7mh9oFkU2OdC?=
 =?us-ascii?Q?dUYhRhOdjxKgyI+EjH0vAjKpt7QgOZwqI7w03gNctDhoYkIrxxuH//a6y7J2?=
 =?us-ascii?Q?Y6J5Ratbu/FcEtAyEJ+odATCd8WMdzdgyuzpCALB62gTQX/mmifrgg0ovNGM?=
 =?us-ascii?Q?NlJO1KtdUBl22jP7h9ouqc+Ihm2r0tAtXVH+gtldQaYq07d9kJXTrsqxqqvJ?=
 =?us-ascii?Q?TvjrAopUMGBaKzli9Dp88XM0YPFp/FoDTLNrE8z+qBiVOxJB2jV9NbN0WwpB?=
 =?us-ascii?Q?gjlzQ5CB5mPhrVl5gZ4S54+HrC63pghP8BRG3pCSZUsiqw8wXXkbGfJWzzoh?=
 =?us-ascii?Q?JEQIepDDApdW39sEqI9J/d/lHqfw55ufHK+o1ZyCmXZBsQzyjhFPkm1LeOad?=
 =?us-ascii?Q?k4Enm0RPeG/V3HsaqPGYuJT7T0W/s+IAoWPSQu2UuOSL76+mQ/PRkdqKgQzK?=
 =?us-ascii?Q?u83oI05bmedwL77hqX5inQXC4lrRx+vNEnATMmfykk/SJ7DW2XRLsKdo2epI?=
 =?us-ascii?Q?I7t/mRWyPyGJn/lJaibhEyZFvbh9KXOBjzHXrkNrlOnfCSJFnQqLWr8pq1NZ?=
 =?us-ascii?Q?HRlEarNSC5MPkkNmFr82jAL2I5otHFh5mQtS/l6Y4YjenWemN0/AVhPw3xDr?=
 =?us-ascii?Q?91Ug0AMg/HWCBhVNoVoQPq+sWo/wUlM7VYYgQLiHgADs2Chgz+vrcw34JmE+?=
 =?us-ascii?Q?JgvYhpWEb4vlEYnyFSzON0Fuev0BJea4M/2kQTPodxpWuBIRUhF337hSd1Mr?=
 =?us-ascii?Q?/V7ehZdvcCGJ0g+YC3prZLnLBpmawPso1L1riRWL/kidVsL/PgWJhbfAJ7R9?=
 =?us-ascii?Q?W7OoPrijiY1cujg465IpATOxKmXJTnYOnuup6EC90oYsJczYfRwRus3ab6oG?=
 =?us-ascii?Q?r1+JuAONr9XVRsE5G1l85AGn9fd3BcVPzB9S+a5DKe6gp9Bj4x8vEDVyPkZh?=
 =?us-ascii?Q?5uiNAmlLLtHTtvnsVcDRNFctaQWz0I+Y/Zt32+N2QsBAhnL0gAfb66p4xE7o?=
 =?us-ascii?Q?uYMEVm+mbOrlOsBZDDAiyNGlvswl7HsJb6ogqk4pLtsKY+pCm5yOz6iHFHob?=
 =?us-ascii?Q?XpTZNF7N3+X48W+KGPN8qSsv+aWpmh2RH8R1F0uhghI58SuPHtWjQB2pyO7V?=
 =?us-ascii?Q?xkibUvheePIldNBUn6Ih9qx8uls+Iu68YaXx5guO5NsxGbfIVpGtYGv7R+40?=
 =?us-ascii?Q?MQlRYIi0985x2AUXsvOuE4WNasx2BgRRFaM9aB8Nri+8SkwImF1iXIClqnyH?=
 =?us-ascii?Q?RJc1HBV8yHj0hy/AKnqGANZT9bVBifTsjRYFTTmAF7DbEPL5SRlMtmNTEk7+?=
 =?us-ascii?Q?6raTpK9xwh7ZYiOltz/7BCATgQssCGNyFdXTNJd55f7YeusHrU0Sc/hy9g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:54:43.7351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d51467-32eb-481b-85ed-08ddb94616d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8029

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

