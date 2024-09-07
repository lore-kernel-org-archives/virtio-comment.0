Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8409115E5BA
	for <virtio-comment@lists.linux.dev>; Sat,  7 Sep 2024 17:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725731331; cv=fail; b=kd3VyJK0MigPWeMQMlH+53E/S6QSdZmfCSFDCJtkkZgw1qzHYdDHxl6uKV9Xm8b8dS09Xo/4WinXc1VSVQlfqFJq4+JFmKy46aSZR4nVuIlaiQNW/zbOhyxnv5n3CK6TNj76gYxMjildaWkSisLUmYfshHbAuNS78s7jFCf6N3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725731331; c=relaxed/simple;
	bh=xFiSohpCEOcX6cLZU6YsZrMAuma5QzPoZUOmL9Af0ms=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rUW6/RwN5fTS2c/Hsg684WOslJTU6tKbCbvlrP04BjAHwxtUOwcFTzVUoVBYrg4dmUA63HGQKaey1motYyAHIOyXMmYoLntEQpRItzff8U15NP1yAgRpyC8QN03aJO/LUM5gY2PPUA1YwdMZ0rfeJXUR5y4eerujMllJWqSTH4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t6HXGAeH; arc=fail smtp.client-ip=40.107.223.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t6HXGAeH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYySpTRbsrFo9AllRzibKlgg9DJ10fngZBi8O7p80rE+3xKCAW8RpighckD3Uzg5Lok5HZKvYLY1X7oUJZnuOc8cPc0OXY2adkFK+buZV350GRqKNtGHVEeZw49f0DJGQgEUt9HkgRsMLZeRsj3ZDLOIt+SpMTu/JT3YaD/USDKoANFJ8jPpDLf+MKuCKRe+j7vOq8QWlBtJp0hhUCChAaYf62KFEJGPbHYqxXCCUEGtBssCP80dWomDksku5g9Dv/NWgB8LjOPpK5F1hKG3kNeRuPMR/pBQdENOIVMGKRSwm1Iz4v0ljI9RK1dxP57i6MKxfyH0XMGrKzcwW2Qd8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QYYW53xCbXCzJ18V9t/YllckPK9hIlWKYX1OfHUUEk=;
 b=PT73l3PqZIxw3bq+G1zyV75/WGfGKqF1e/Yz3Jr+g198Pow+2yjIH9kTWghpWkPUoWJSfWTgmY5tUbuDr/GluR/mWf2ZmHibq9hAG6iddHtKhk142JeSlG1RHFb99ZIvKW7mq3b2vwYpVGWzQxlRdlKK5jDNAouKDHjd6sTuyv84oZAP1xvJ5od+wBy6xpDLfFO6t3GONsi3/mFmFEql2IaUcvu6YTqfHT875mKrdSLlv/DZozdj+6L9Nggh6bgga5hYQB181FAS8whBhlw/X9bW8lKIdvTYIUV6faXj5jA4HZVhEAmXObNknwm6ioG2kZEIcXI2dviSCO1mivlRQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QYYW53xCbXCzJ18V9t/YllckPK9hIlWKYX1OfHUUEk=;
 b=t6HXGAeHb/zl9fnZWcDsaWqWCvK6O5bOqK3BexhHA2KDficQhhu6X2IIm7eksN07gTsKvCMZeeABliKNFvcESJV91ra4Ikst80x+8yu5XfxYav51ZElqbghWGJvPLdt7vqldAoZYXaXo7ppXBsDlZjjL33o5aM0PpMARRX3uZUhBMxTEDlo9Czumsh2qO12L+zEXRcR9sS0LhZIEVaNKWuLmsLuH0b8fgaT0JDVjXPEXbx0bIiyv7ze1/RLK92WuHdkc5lNAC7eB8HULIbCR/ccG/lOczNECT6z3/DdTsCYMFbDI42gqoSAmCflJFAD8W/ACAEE+VhiaUkFaDfqU+Q==
Received: from BN9P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::31)
 by BL1PR12MB5922.namprd12.prod.outlook.com (2603:10b6:208:399::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Sat, 7 Sep
 2024 17:48:45 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::64) by BN9P222CA0026.outlook.office365.com
 (2603:10b6:408:10c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Sat, 7 Sep 2024 17:48:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Sat, 7 Sep 2024 17:48:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 7 Sep 2024
 10:48:40 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sat, 7 Sep 2024 10:48:38 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 1/3] crypto: editorial: Fix spelling errors
Date: Sat, 7 Sep 2024 20:48:17 +0300
Message-ID: <20240907174819.778971-2-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|BL1PR12MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: 831a4023-ad6b-426d-2af3-08dccf65523e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gJ1564uUAS2mKWn21wP1WojYRdShI/9UAlxZ4BMHzpW66/sEInR2lXZB+v9h?=
 =?us-ascii?Q?r9yLOv2Q14ThDuvQzOgKD8Z7MQYemfIbIZnKjil/Y9IyH8lDoC3F+bYJo8yj?=
 =?us-ascii?Q?KEB67JKJr3OFbZ1F/NqkaHGJB0AfbpEZunJA47MHIJTbD4TPtnJ9tzY7XRUQ?=
 =?us-ascii?Q?nkaLWmwFLddz8wMMRCMaqHOXdDAokB7PHmLzOK3+qqcKJuPszrlBR/h9eaip?=
 =?us-ascii?Q?AFDrvVOWYN8xZhfJeWR3ezDUgD76Q3ZcqjDWGoQNEhieRh/ZiObRA3ZQfBzp?=
 =?us-ascii?Q?CQhbRQQl8VjwelThfDYwHGkdvRitffdC7aqCNiKBPQ5W8pjp7lFbFKDA+klF?=
 =?us-ascii?Q?UpEedn+0uvLzd3nNmIrIE3e4+YGAs49zN2Cep5YDX0I/xPWUmPxPamkkcMsu?=
 =?us-ascii?Q?Vur0/Y/WT3kyTi6qPUskKQs79pHTDj9JHUMzowJCoyWJW8SJkfqoK4GFXh5Q?=
 =?us-ascii?Q?E59qf1ced+sJjW8sfxSokpB3/3CKuD1kqHU7ovOfk+O/0vh4dBPREZRUGoZc?=
 =?us-ascii?Q?cvVucCq+2a6KdGaqTnOgC5Da8uLB+vt8JR/27TeAQqAa22fifxXVw8Zlh2qC?=
 =?us-ascii?Q?pFosQhBcnuCOUJg5LRnwED6kdmz+qdrNdAgGe+cExJi5c0QkKo0oenOXd7hj?=
 =?us-ascii?Q?/9mzLJ1gUfGfgTviEDBshJYv7uy+Mt5IkDaJnS8xxrWx7LKVdF24/1rGHt1W?=
 =?us-ascii?Q?wMT3um7CN9OC5ij+vzTgp1TYwnnto+i91T/SF1VqVyzRSIklBsUHxqCQFpr6?=
 =?us-ascii?Q?BrDMCTUiiGsGlubnXUCUCycgqB8pIzV+HGP/a1svQfEw7UoMwnrWdedkHcX8?=
 =?us-ascii?Q?CeiUGjZQEl0EZ4qJYE3WMeAKvXjxRExUTw3Afmwiu/zyg7J/JQvxJrIudSFc?=
 =?us-ascii?Q?OsAk0CmbS0t7h+CtCN2mlDj2Jt8uituibuj3/wsjxufQEyFEHLOV5mmg0mfT?=
 =?us-ascii?Q?7wwjg5xg8/bguyz69yL/cDNvfna+5LitceX1a9te/UmuIth+zxyG/IMi8aUx?=
 =?us-ascii?Q?AWEVXLnHS+NZHSQYg1CdfPuLOkokvpacvHr28MWxtX1jahNRMk/0H8fRptTX?=
 =?us-ascii?Q?DDBh6QyX/7rPETezB9PhVNoChNMCbRAlqvjqd9pye33m5P4jKL1bF5ToO3Wd?=
 =?us-ascii?Q?lwI/UzrdDXifkvbODCiP7YkRiLlv/3wVHHaoJHgzdVri4/ApX/elbB5KSehw?=
 =?us-ascii?Q?I3YnH1ysbQNVIkMjNiYwfrClKMhtVM4dvPEsGvtaZN5F4UQ2yvK3U1Ge4pch?=
 =?us-ascii?Q?PYntnG2Zxb2mOFaR6Bb9Th4ca10R+KsqmZhAhnYk8lMTCpoHZcsw6UvQTY16?=
 =?us-ascii?Q?mQNW9vfNtkRuCtT8T92xbo4jq9BPTD2rmIpdO5nf/JVG8eQ1pXIiJFd+VezK?=
 =?us-ascii?Q?P40TT30VP9xy9GnqN/KHzyTQF8/OZxud7rSOvpUivajesOuaZ0fS1Nq/BITV?=
 =?us-ascii?Q?/LDdbwqGOCxYyohIZMAV6bNJ1ZON4SBj?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 17:48:45.6189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 831a4023-ad6b-426d-2af3-08dccf65523e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5922

Fix spelling errors.

Branch: virtio-1.4
Fixes: a385dd3366a2 ("virtio-crypto: Add virtio crypto device specification")
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/crypto/description.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index 5705e26..e053cc7 100644
--- a/device-types/crypto/description.tex
+++ b/device-types/crypto/description.tex
@@ -424,11 +424,11 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Crypto Device / Devic
 
 \field{header} is a general header (see above).
 
-\field{op_flf} is the opcode (in \field{header}) specific fixed-length paramenters.
+\field{op_flf} is the opcode (in \field{header}) specific fixed-length parameters.
 
 \field{flf_len} depends on the VIRTIO_CRYPTO_F_REVISION_1 feature bit (see below).
 
-\field{op_vlf} is the opcode (in \field{header}) specific variable-length paramenters.
+\field{op_vlf} is the opcode (in \field{header}) specific variable-length parameters.
 
 \field{vlf_len} is the size of the specific structure used.
 \begin{note}
@@ -509,7 +509,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Crypto Device / Devic
 \subparagraph{Session operation: HASH session}\label{sec:Device Types / Crypto Device / Device
 Operation / Control Virtqueue / Session operation / Session operation: HASH session}
 
-The fixed-length paramenters of HASH session requests is as follows:
+The fixed-length parameters of HASH session requests is as follows:
 
 \begin{lstlisting}
 struct virtio_crypto_hash_create_session_flf {
@@ -1386,7 +1386,7 @@ \subsubsection{Symmetric algorithms Operation}\label{sec:Device Types / Crypto D
 \end{itemize*}
 
 The length of \field{op_type_flf} is fixed to 40 bytes, the data of unused
-part (if has) will be ingored.
+part (if has) will be ignored.
 
 \field{op_type_vlf} is the \field{op_type} specific parameters, it MUST starts
 with or be one of the following structures:
@@ -1536,7 +1536,7 @@ \subsubsection{Symmetric algorithms Operation}\label{sec:Device Types / Crypto D
 \end{itemize*}
 
 The length of \field{op_type_flf} is fixed to 72 bytes, the data of unused
-part (if has) will be ingored.
+part (if has) will be ignored.
 
 \field{op_type_vlf} is the \field{op_type} specific parameters, it MUST starts
 with or be one of the following structures:
-- 
2.34.1

