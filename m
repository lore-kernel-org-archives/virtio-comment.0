Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D117256B81
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 03:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729221910; cv=fail; b=Dct2Ya6fS7aN/+2MaDZiTBuVcm1Of274erlC1pzQrlUECPwpXtancG+FhSBklkXWF1aICQQs+M3Ao6bz81SF9UIpc2LKsO5H5wuX80O920EqJG8YK0EQ7Qc4oYo+LHZIqYzSiwdwYw0qldCBhKYxvkWVirsLlS5fK5c86KOycxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729221910; c=relaxed/simple;
	bh=XUM5WPzNtI/4BD7dDJVkM24QaSHE3XMdKWEvC8kDsB4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l//M6XSsfjYshdra1A5nRgBK6hsN1iFBQJRtr7kStOB8BwSLHwhAxkgaPgitlOB3hHiHo5o63GPcYX1YnTY2gaelyQxRQ7LqmJaafabWXUb2uOfaL/l1DGgJ1yCfRpwg0Zs9BP6zOTgwdu8QoEgGcmt5PPBqapDDgjFN1HdG7Ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LTRc1/0a; arc=fail smtp.client-ip=40.107.220.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LTRc1/0a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pM5OGqtHbmAPZ2wGf+KlGu9c+tttCp2xF6pSelVhg1MPN0N0qg5C2J0q+k5LZBjllxnxVO1Ev7GWqXWdBqeOZUr78xv79XAYvKMTvGJSz0l1xzztj7+Ox0AhILxBPAx+ojxaEQppXGsD8gqqm8mdpb42++f9/agUN2iDSRt16ozZer1UkHZKWQkVRIL34dCSLDUYuFrcvqOvmChUw1A7CNm5y3iGgo32yxaHVr8uki0SKk5PghsvCzGzy6jKY16yXR3Gnab6GpolobBMp7gtTBYjMWG+Gss/Kr9AKJW3PoTQPbOkGbSsyGsoLkhypE0fJCEofkbiA/qEVMTlj0euKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bldHxeLSyHiU8Dz50LMqPhjgvFMw0WAqNgBN7oAD7bc=;
 b=Bx13G3Kc/GLXYMGh5sfzCoU53ibPgs6lLvXXicJbHLNpO2/gl8neZrPNDtfRyMt6xFc8Q+KnV1mCzPlG6hfQNFVuF4AS1OUIUJC2WDq51dATCzrxsf4xCOT0sKOCKKJ8gAM8dFSPh7gOgZMQ4HoxqlfjIiD8O1j725TzNvUfkyNZT2+B/nfinRpmDR7MgAKVnDsI4qzN9Z3C5z5TeTqflQm8LpNwJl+9IRiHChfpV1CNdd2RuCSP5VCy+udwL5DpBpwWCFJdyY2Il7mTloHtfgMTwdCP2snIKhEBpBAM701y91+ngy8XZSOoUhWE9rTbfWQRBGBVgPnr9rzPQ0InYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bldHxeLSyHiU8Dz50LMqPhjgvFMw0WAqNgBN7oAD7bc=;
 b=LTRc1/0aYYNZFFzPHhhBxXg52d3gtTK6OYjmxsdRNAovbKQoDrkB/9gqyhUDLjmktB5tR1Fz62GqhOj+JGU6SpnFKh2UHL0LKDnwxW80Wg+9WuRvyq/0zf9yPBUwwgkeg2aaMAjto9/GBtMjTknqt+ecuY0fCc1/rnTDvr5c3X8KCEQwNFegg/UqlpTUztRGeqdHf30ubV4Cc4Zf9wkyCxRS45Yn1XYEs4u3NOGZx1pCdrhxNi9ODcy0EUnEuyCmbp2vBMFM5VpbjtRxQ1XSLJ3oYk+OffCDabG3IHezoCUSmoEgqgVqs2mngavAHt3M/LKMM3BgexFMle997b/rMg==
Received: from PH0P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::23)
 by DM3PR12MB9327.namprd12.prod.outlook.com (2603:10b6:0:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 03:25:05 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::89) by PH0P220CA0023.outlook.office365.com
 (2603:10b6:510:d3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Fri, 18 Oct 2024 03:25:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 03:25:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Oct
 2024 20:24:48 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 17 Oct 2024 20:24:46 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH] virtio-net: editorial: Annotate structure field
Date: Fri, 18 Oct 2024 06:24:32 +0300
Message-ID: <20241018032432.398821-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|DM3PR12MB9327:EE_
X-MS-Office365-Filtering-Correlation-Id: 73fdf19c-cef0-4543-92f3-08dcef24752b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OvA85wXo9K6IWXOpOSSQZWbggGmTDougdYzWC+jas/EQgUl4Qr8P/0PU7prk?=
 =?us-ascii?Q?m+AkNiN/SLQmyksrrIhcmjZLx20o41F2ENSrU9YQJpVqewuiY3yEC5QTHhiE?=
 =?us-ascii?Q?I39iNY1989KDpTqaQTtOgrJm83X+RAmG7N8VDVfxkaE+mWViqxDb3PvgOnma?=
 =?us-ascii?Q?ChAIref3qkyBbYt/P6ijnCorH7eR4vs3zmCoOvr63ocRfNMjE2zPKMD2BUZt?=
 =?us-ascii?Q?0O/3/rsWlRtjkg1pFpo+cfUEDYgvh6+kvM4hacEoFrJxFv8WHjl/moVfKTiY?=
 =?us-ascii?Q?mgfpAsjWFzv+MAQiOyDPHwhF+6LJREPlZBE/058i4xijZjD965KzxWrUDnN3?=
 =?us-ascii?Q?vUbsLZpaSssFmi2hyBY7IE8ZyZtsNsXRWQFfLxFr4gFhiYGiePqGXtniVq1N?=
 =?us-ascii?Q?kQ2RHhDsvOMaEUTa2n/ck+p/IX1jFkm23xETtgubZ1PqrdmgBJZrpm/aRNw4?=
 =?us-ascii?Q?N/mV9vT9TXwAsDo5rN3f+ciMduChnowpSaAFwjD0+L0K9eCZPXNiHpne2p3t?=
 =?us-ascii?Q?Hcc5t3j87Hs9Q4yPobRXy0LWCXOmJzJ6GWCyocFJY9ssBANbiLisJgstnZlG?=
 =?us-ascii?Q?F6CVBDBf7GgXuadUF/Uy5tVnoxnBsRQHa1uWoax0MxzEJFvm2vADe/6At5mS?=
 =?us-ascii?Q?fFnfn+93MjUeh8K5DOuH+CCdSCATXcuGaYYX4D7JuHejdtj8uXeC4YR4uXEe?=
 =?us-ascii?Q?C+zwf2Sm5Zi2STPpaS+7JmqSME99kbDxxsm7Vof2OzUZwi30Nt6DSmcM0PTP?=
 =?us-ascii?Q?f2UGpXet7jM8MqC0GDKOV+YxITIODgY/mAWrqIrMmRdZROheOqAae0+Cpt1u?=
 =?us-ascii?Q?0YVABOjXql/RZ4fS1CTw7FGr09+9kMBVGCPElv4aPBdPFZ/43hXs518vZYtj?=
 =?us-ascii?Q?chyxd0fzZGCzd8coE81Qsll6delAIzzSv/ClSFQlGdsKwiK/EyS/EbsNJDCc?=
 =?us-ascii?Q?z2BKuiYNni8sWV31ZnHO8rGycsB7g503Z+Z7WscnhMfBEBqBZ22JkIBLCj+R?=
 =?us-ascii?Q?PC5BAKyTV8ArI+ykPC804UUfwR1ro96cC+ZpBlgubPtPDqqztxlqg3ugVZoI?=
 =?us-ascii?Q?B8NMa4hKuVjywZZlrtOHqFfT4uBJdDlDdCGOSjtTfQH7pnuWQmBmuAO8oP/0?=
 =?us-ascii?Q?TkG+9BlmECnovZVpE5W5WVCXUZaCgDSWnB2LJPJxpl7v0ifrgl+NzZHdW9oU?=
 =?us-ascii?Q?hysuavLqT1jkMDQ0WEMuyaPbpsMRVwrDxylBR3eXY7IEI563d37zQn6KkmeB?=
 =?us-ascii?Q?ErfuEmNgoxKo11u5peMWnXPtkygM1hcH94lMjX4y7xSMl44L/7Ci99lepm3/?=
 =?us-ascii?Q?kEG+zclijpWIx17TnL+fSobFomGkb6VKAGkyRSMUFBtFIFuRPnsM732dAyrv?=
 =?us-ascii?Q?ujx1aSWLlsrG3bddKwHdPujGX/3kQ0LTSWJhXSrGxtJ7NZ9YJQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 03:25:04.2481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fdf19c-cef0-4543-92f3-08dcef24752b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9327

Field command-specific-data is a structure field. Annotate it
as a field so that generated pdf shows it accordingly.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index b2a0d39..6950114 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1217,7 +1217,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_ERR    1
 \end{lstlisting}
 
-The \field{class}, \field{command} and command-specific-data are set by the
+The \field{class}, \field{command} and \field{command-specific-data} are set by the
 driver, and the device sets the \field{ack} byte and optionally
 \field{command-specific-result}. There is little the driver can
 do except issue a diagnostic if \field{ack} is not VIRTIO_NET_OK.
-- 
2.34.1

