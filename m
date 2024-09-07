Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDA915FCE6
	for <virtio-comment@lists.linux.dev>; Sat,  7 Sep 2024 17:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725731343; cv=fail; b=TcYNN78XyhCRwNWJMLtjxpZabseRHgENYrwYOQALoenwVZyGKlSvwPsRzO+pbDwo4dotn184uCNO/B5nntPfiQqdfiK0Kx7tr919SAsUeWqXbNr4r29AaUIcinZO3jVN+bHS6UAa3MYVysFAzU9gzs2TPJVGoDahtxLXzHLyph8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725731343; c=relaxed/simple;
	bh=qa085LbJa5FBkpQjBt8tjIgobYkFYOgXitxve+vHoC8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F4sjqEexFZJq65wOmttJ22YPLl9EADxqtd0ZB2THZDAcghNn3rfykwwkmCEFyzbggjsrZkbvXl4avcjPLd494UjQABxt5hxHNcmE9tSdPDT5h5NLCSLGlXovhNV7nFvGep+IfZPXs6fQGvI1rLKMdP5SGiBYXbUHXfTScs5BczA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J7yYCNud; arc=fail smtp.client-ip=40.107.93.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J7yYCNud"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYkMLYSO9E9uM8rAXlr6Bo//uqOxQV1bO1u7jgNqCH9dcGo0gAElOKQT9XQe4fd7sVuUzIHDGIDPM1FZ1aPmpuZl+WKOZpKO0UbSQP+CMFUdjuKGA4mdr/yQo1v+w9dANASEynMHkiq9lphRNIUDYLcujR/5nNHeIT2RwolbOYn5fDOkJpZN501eNkKIvrvT5e/xSplMbn1ZQvU/EOCAg/7DCWjMebYvHcM+0OGD6wKiAH0/9tV23tGdCDOWJeqB6tSn3qLxkA9U+W6Dyf305Crhxrr3THgVzakIITYRybXZGm7LfMwUlmzvl56UKz6jcalQ6Qz0N8VJtuE+P93E7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwewgNuPd7do1zKULVX46u/bMZ2tTGOCfXThqLK0yH0=;
 b=oQgw5ntcM+6QpkPnR0X41po5dAkcANHWH1ialEXFRHe5piHakYjDnYwfAroVuKe2DghjomjwI7s4tN1ysMdgR2asAsQkpFRP1gYYthT5EWpEeU2OnRSmkX71nSBXy3BVnF/9+O8+cyw9JXGuP+Z/vOKb9mxwEK9eA4t1ZPeZaUC3dP9QrVdWytUlR0BN4+FRJ0iZ/Yt4M5a43qAk7kG0lHmGHzCawcOUs8uRkhQYNx4HLT9D7Znnrlyii24R6KhNuADs6QdeucVO5khU6QsVTEExdXZmoSnyaxwXi5pTqsiiFm4DKoM+6xZIKcZzEvRxGRqwYiGY5dkNJIe71VR+QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwewgNuPd7do1zKULVX46u/bMZ2tTGOCfXThqLK0yH0=;
 b=J7yYCNudGzIMJnCDoFSQgAOuOlIqfOg2kawyeKDRkmV7RsW23itUoXJfYiJxE2BYYkIMpi5IP555Z/GX7UiWNgOU8rgCVqWpHUblFV32alz+q8je8qwNYPM0BviQc4mMMnV26cWeeCd0VwQTYrrfCz8iXdXfEnk0YGfpSikf9+pCJNRRPQTDsdNj6r58Uix1QILy2Ud3q7qz8jzgNF899Atyr4gcX0FBe789Y8gKjRWrOOtqupvDEa+8RPIue9JMNTOKKYxfepEhWvyGIYAII/zfh5j2CRVqj+KnnUYj9M/6EfiLNcLyGK1JAM6MfbN9mEPUC2loIbpbDe+X4g8Low==
Received: from SJ0PR03CA0173.namprd03.prod.outlook.com (2603:10b6:a03:338::28)
 by MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Sat, 7 Sep
 2024 17:48:54 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::34) by SJ0PR03CA0173.outlook.office365.com
 (2603:10b6:a03:338::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Sat, 7 Sep 2024 17:48:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Sat, 7 Sep 2024 17:48:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 7 Sep 2024
 10:48:44 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sat, 7 Sep 2024 10:48:42 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 3/3] common: editorial: Fix spelling errors
Date: Sat, 7 Sep 2024 20:48:19 +0300
Message-ID: <20240907174819.778971-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240907174819.778971-1-parav@nvidia.com>
References: <20240907174819.778971-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fd5fcfd-e63f-47a5-18fb-08dccf655744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t3NJ75iin5ei410C2CJH7JFJFJmvbrqJvIPzTPBDIAUEF4zCKowRzKDTGu+q?=
 =?us-ascii?Q?Pr+O3a50fijcvWWokOPdtbZgzG0ZqvA904jlC4C0ehXMQsSjGxRwuomSEdPk?=
 =?us-ascii?Q?sivfmu0WDly9SuKCMfF46vBWup0nZaOL8Nejfw/0lCVYfGDEHUEolCyCFYX/?=
 =?us-ascii?Q?rq0n5lVmMYD1eIKa7Rcw9mW1jCSUnciEY9BGhchqSJSowgEzYB/UYZrJEXMz?=
 =?us-ascii?Q?Dz5ta1x+qK1UmviT4m+kqZNVirsJt7+r5yFbxkB7DE9hd7hZnaMcxUB1+Nht?=
 =?us-ascii?Q?8m8H6j80svUbNXl84i25PFDGXA2bHDrN6DWmv3Pvu5hi/nWzqd7ojl4Jo9Rd?=
 =?us-ascii?Q?JhbVeSoiePdY7vfoRaQXfrjnwQLUpV66wOH0KQOGO4CcGCbpe0An4Pv9TPIP?=
 =?us-ascii?Q?RziyVQvthH8kUV0kg6l3mPvN6S/89Ab2/Fn8SMF/ZcCcf/M7fR/PQ2h16LBb?=
 =?us-ascii?Q?zuBHrxvfLbHOUzlZ0nbkewKKcUSQH7OBxPoz8vRs/9VfsSaP+Ot5NRsQATML?=
 =?us-ascii?Q?DdJ3Y9n+ssWKe++snjyyC8tSaoF708vWUSTgjqybLRILFbnfo654Qx+Fe0yF?=
 =?us-ascii?Q?jPFnC5D4uSB0RNf+n0UW+4uFRqjzOn54YyliGu/mdDGDIq0jee0MoRte62hy?=
 =?us-ascii?Q?MAKr2nun38FNwo/HKAB3KR14Wzhm02RjNENpeROqtisYyZYQ0kj0mvr/JtPc?=
 =?us-ascii?Q?x9u31ahu9S8T3MxxrVcjRM2a1eYFQBiGKWOOeA25GgziGlqmfM1D+/Bzibtv?=
 =?us-ascii?Q?WU5TZ+uMCUIXtHWSiVRoWPOybags1JuOJlZXuOhMadfqeUoWpRF7dhbJgyVj?=
 =?us-ascii?Q?QtPciAPoHURJ0FFKFMu9k+dQc5DZamHTC2kSTyiiSAfj785yWlEjdZVFSrI2?=
 =?us-ascii?Q?rTsliA1gIuLEsFrNY7MNHgJFT0jUDhxwR8etMki0RUwEijaTrr2XbIcp6/BT?=
 =?us-ascii?Q?yOH4Hh6xLuXpZKIzl5VcjBujIIVAgXKaYog8Pe59HGFPiZAFtPcJRxyyCT+/?=
 =?us-ascii?Q?Z6aSD06QG+KO35DxVYjNpSi7O/+8PPgoIkHD8a9GnGqvWsX5ESDk8SYyjhN0?=
 =?us-ascii?Q?0tymRwFu4kh4JigK1OkePqM+I9VVyG/30YSxW2YqiFeQiymPoV66D9WSdUfv?=
 =?us-ascii?Q?5YD6ys4if8jUAlnCXuovBHmk0VAdVNP0z2+Y8ed0TwCA/tCfGnCMUukJrO7i?=
 =?us-ascii?Q?Bp4zSIFqhgrlzOeA0mT1RY2HeO3BhB79rxMfJbJtODpiZq/R/MnIKPih5V3N?=
 =?us-ascii?Q?4blFX7aotK5MD5emi32+rFHeOqAKy7GQcpNTb3UO/n6baGELvR1EaVUFFVNf?=
 =?us-ascii?Q?SmNE6Ey6kphqUhobtcAizTAx3MsOWGsnr5tGqd3woct+CB+ruKU/+V+Z7Ksg?=
 =?us-ascii?Q?Y40HEAvsSzejojiTkukVYPuFMnLxmsHUt7ctHTdbMZxufqfmBD6KtpuAIsQh?=
 =?us-ascii?Q?A/q0dtKHTW9zEjQxvt4uxuKfFZVXMrI9?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 17:48:54.1244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd5fcfd-e63f-47a5-18fb-08dccf655744
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7312

Fix spelling errors.

Branch: virtio-1.4
Fixes: 5f1a8ac61c15 ("admin: introduce virtio admin virtqueues")
Fixes: 68f66ff7a3d9 ("content: define what an exported object is")
Fixes: ef16b644cc25 ("content.tex: spec text converted to latex")
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin.tex   | 2 +-
 content.tex | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/admin.tex b/admin.tex
index 95054ed..845ca02 100644
--- a/admin.tex
+++ b/admin.tex
@@ -496,7 +496,7 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
 than one administration virtqueue.
 
 If VIRTIO_F_ADMIN_VQ has been negotiated, an owner device exposes one
-or more adminstration virtqueues. The number and locations of the
+or more administration virtqueues. The number and locations of the
 administration virtqueues are exposed by the owner device in a transport
 specific manner.
 
diff --git a/content.tex b/content.tex
index 12f9224..c5e7d5a 100644
--- a/content.tex
+++ b/content.tex
@@ -493,7 +493,7 @@ \section{Driver Notifications} \label{sec:Basic Facilities of a Virtio Device /
 \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Exporting Objects}
 
 When an object created by one virtio device needs to be
-shared with a seperate virtio device, the first device can
+shared with a separate virtio device, the first device can
 export the object by generating a UUID which can then
 be passed to the second device to identify the object.
 
@@ -508,7 +508,7 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
 \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
 
 We start with an overview of device initialization, then expand on the
-details of the device and how each step is preformed.  This section
+details of the device and how each step is performed.  This section
 is best read along with the bus-specific section which describes
 how to communicate with the specific device.
 
-- 
2.34.1

