Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B96B22F74D
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667823; cv=fail; b=ZC1ohkg9VypJPp0jQavTKmHpwe18uOM/zegWkI+We9CJrWmTabenenACXs5zpBirPHJTYc4ekCA7zYQPBgIgfjK3S8BRtD/Upu/MD8+SFkQ4UeD3k/mOIxec3lDb0DGjPoxQxeHfP1bGSeYQENtRYtOOYb9Q7tnrTWDntM7BTD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667823; c=relaxed/simple;
	bh=KjvfhSrGG3+8wUMIDIWsbY0p1Wi1F7rg1j7jpzeyKUA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fv7WGltv14EUguXhkJNwOWBkRw2mD1hgc8kBtwGRMLqfrTznzEUT3aqOnW8l5W1qD1u3m95rJ2xPVXeN1H74vRay5DEOWgaMSsk5yHMvp9ohR9qFY298eYH/esFfxh1iGkzxdbVoAnfFmEDEkcc9tjOHU2610ul9bs4B4lpXWCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hcsWOQ1g; arc=fail smtp.client-ip=40.107.223.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hcsWOQ1g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRMSiT7wl3EmVrQTtAdtVqgaw3PMI+y2CG8bEb2AfhKgPrp3fW2MxOH8Cet4IuHC7vdGkYU2wXRo+DBPWNLCZd5Sx4jOKegCAxl4vD1ng3oaPIhwW9ON6rGzfcei9/t0vcchdS8ZOEb7YFmWPcm/Wg1kQD5ODinJ0n8vY619dBvbKnRMNYDJ39QLq4G3QQq/4WQnWHqBlybn7COFLKrbs0YNNKwR/WGxC16JDBn8rb8k3Pzl9NExo8nafebqL2RNc8VDKf0a9LByP0CaTFMsvChVVaEf31OowsAQmz5PAhF08S6dLIGIfPUcvOgBPVtxtruzvLbNjrlBIXVzz72zdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rq0ArEnljBIP38nQrMgjxiqbOBBRArqcwYw/Zxz64Ys=;
 b=uOVDhrjtWvEPzyzxCC3rA8FXmQJatgPfvUKA9FJ2yzFvmqQ8bRH1X/WzP4vIOK/AStxeHvl+waEAy3ycuGABG8GfE/UGBZdDAnrvKZQYwfH7xLPoHktvRUthWFSnvXlwE86fvMt18h4yQizAvlUThx0p1038WmsoOaDGVuUysBCj5aevK1pEbD90699cm3BinZ67uU/2qSRjxkEOs3Eyzbsd+cik5aEu9Ap2wdAKUV4RYLrHkByfpm2rUjeePQALm4PBZ+/y2Ob/H0YoPwtEWemUjLhCcLQyAhEtLZzQLzpcQHJTbvIVPRDUxI0CDwmMlvHeVjhmIXPDBdgSXH3/sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rq0ArEnljBIP38nQrMgjxiqbOBBRArqcwYw/Zxz64Ys=;
 b=hcsWOQ1gakujFQgGK63y7kbQ6wujpWPalvmOy5UdehkDzi+kj2VxA/txdu0Jgyhmf5hMMIEI48r5xqzzOBrWxiiTE8TYu4fEZ8Z7+6adCQzO7HjGuGcWEp4gA0g7w2/ceF5O5xkrhDANYxQvGkHPSekEoHmlz3VRWYm3HlnYdDs=
Received: from PH7PR03CA0002.namprd03.prod.outlook.com (2603:10b6:510:339::21)
 by DM4PR12MB6304.namprd12.prod.outlook.com (2603:10b6:8:a2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.38; Mon, 23 Jun 2025 08:36:57 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:339:cafe::1b) by PH7PR03CA0002.outlook.office365.com
 (2603:10b6:510:339::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 08:36:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 08:36:56 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 03:36:54 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <Ray.Huang@amd.com>, Zhu Lingshan
	<lingshan.zhu@amd.com>
Subject: [PATCH v3 2/3] virtio: document feature bit 42
Date: Mon, 23 Jun 2025 16:36:36 +0800
Message-ID: <20250623083637.296041-3-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623083637.296041-1-lingshan.zhu@amd.com>
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|DM4PR12MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: 92befb0a-525d-49d0-6a67-08ddb2311d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HKynpBBW9TRfJECLLwBTANxbhIS/fQCHHXCH+TQS9X5ViFV2v91T/PNngaJ2?=
 =?us-ascii?Q?/3uxe72zeP7mCmGGRvZlcam1yM86xcC2kop+D2NAIwIrIOTBZgnG8aqiLXew?=
 =?us-ascii?Q?ikYGLFihR69LbUWOFt1qwBa61BaA7lIjscX3iIJtp/M0GLuNNVI1eSzz/QVt?=
 =?us-ascii?Q?f8iL7zXWpI7KMA4rkN/c9ZNb/tvTgnljTPC0CeNGDLIAvUatEYx8/3uEdoLG?=
 =?us-ascii?Q?bK3X0KBBZd9dtwUnhlvgb3SaaaTSW0xatPlf36QGRSffROcBGhzlsaVYJ/MK?=
 =?us-ascii?Q?I80yDP9GJHrEOdVg6QR8F/yyq6xusgRfKATp5r4Q5QwWPnCc2hUxPkNLO01u?=
 =?us-ascii?Q?ZMlDvPZNJ/cLRjIss0cRnNZ+6o/EbNJ9Z8KjkaLtLNublizhXOp3mvJO6PyM?=
 =?us-ascii?Q?rEoWcWEOeT4io+/3DWwq5WvMtksXOhBaQq1fHLfO413bwtsk3sjZKysbdkKS?=
 =?us-ascii?Q?pT0sVCXIEqDpn0B8P4O7eKOVKorV5zfdbV/XHA2HKge1432ww4jOdlYDrEzS?=
 =?us-ascii?Q?ypjJfyWlmqW2KDXd5grhaRmAOSjX44P/NIug5Nq9d9TwGSuYScbIfPzleY9t?=
 =?us-ascii?Q?qF5WLki+z3RJ2NoBvCwq15FuqAEBxx4jWCDdXecU+O+2b1uwdlZfbDHOR4DQ?=
 =?us-ascii?Q?gl5/47tGrmxxuhFBvwtqNSS/xqXmSbOmrpdrn1UpbXTxTYCCsToUOX7wLK0U?=
 =?us-ascii?Q?Fllv787GSk7sYIgXLkSrrJR8f3Mdd2koI5JgCJ47sC86b9I9oWfOU7+hKTg0?=
 =?us-ascii?Q?6Y1IimVwjtYkTfVsbjH0qe2G3Owel89gTv8ssCm1IEiqJkZwqGb0/INDRqed?=
 =?us-ascii?Q?dYY12Naaic1TJQoWBiSSHhg1CAI0dPixNzmkMWq/0eGj8U72bcVNZgcp2lfW?=
 =?us-ascii?Q?KAIZST/kB33sp8EuBV2JgctG9NCNXSsoTajANN572l9LhaEx7IzB0JnfNxyg?=
 =?us-ascii?Q?CcIFGu1UQH2F+QkpLFyW+kAv7fMhI0Gre7u0e8WFJ24caxZ2NJpMWcriwNbD?=
 =?us-ascii?Q?kz4Q3ozynrfpluL9OqmWccU8152bF8MdFv9NGw4fqQSEw5YcE63t2c51HH3k?=
 =?us-ascii?Q?2XO/yt82yU5r1W+Z5LGn21F0r2QMqr78mJoflNkLxqdBo5YZqXFzW/sVa7Vj?=
 =?us-ascii?Q?kd8C8RMDtUEdnA4QO4WuGwWuoT6eqKm0bkhYqdDrFA0k2RrV5nLZ9A0DUcwF?=
 =?us-ascii?Q?CrikvgIygVAPnO0lMJ/V8M9tInC9AGWY93XqK+S874KuTajVO1uezv9Gq2pl?=
 =?us-ascii?Q?tpJm6KCm3Af84yMqImwy5h1dz8QRR1leOxBx/Co3V8eirRvfJObzJbcGF4Vx?=
 =?us-ascii?Q?Z/BL2+U+FiuBBoDvCcrUn5lqpqgi6+pUrwYD+Epd7ZrcXZ6cX+7PdLJ88iLp?=
 =?us-ascii?Q?6MNbLWFOCG70g6v2/YLH9p/OunWhmxigiL757OrzEchaa6+9EcirX+mNotun?=
 =?us-ascii?Q?FKxvLQ7YW+LvBcyPs0Igv8w4MocM5SfaWkJYqyMaREbXZXVdPx0BlL3VY6QX?=
 =?us-ascii?Q?qAsgYrzEuLWeq0jBXCiLkqwagI+ZqNlP9pib?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 08:36:56.5710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92befb0a-525d-49d0-6a67-08ddb2311d06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6304

This commit documents feture bit 42
VIRTIO_NET_F_GUEST_RSC6

Fixes: 94384142 ("content: Declare virtio-net legacy feature bits 41-42")
Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
---
 content.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index 1efc2a5..2e8da46 100644
--- a/content.tex
+++ b/content.tex
@@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \begin{description}
 \item[0 to 23, and 50 to 127] Feature bits for the specific device type
 
-\item[24 to 41] Feature bits reserved for extensions to the queue and
+\item[24 to 42] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
 
-\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
-- 
2.49.0

