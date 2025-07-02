Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD1823C511
	for <virtio-comment@lists.linux.dev>; Wed,  2 Jul 2025 08:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446490; cv=fail; b=fWf+CLfmxI1+GCnJ2WUdel0jT8k0Vgy05zgGDgpg+JS3j6O1sQXBNXmhc/VgQw/7GS9STEMtyrvllZ4I1LJoZHMxZV4EBWD7CrT50+s7BPPkyPWsdnMRUDg75NY6enbdL0NCMmeRCAn1p+E5lraISWj4QMFpluvRrsk3/uAfh1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446490; c=relaxed/simple;
	bh=7aAmB2oiuTngEZ3vi3fQhrrmBJ5Qst39yO4LhEa0So8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uaQLfJR1+ulo0VEW0CHoAi00CoJqh4Ex6PRrYCU/ZAd3txKZ41b+TluPGRGKdwK5MvYk74jznMg2Wj+KgUbJUobzhgkL1T5MWrd2mnfCccM07Z/XqHcnFqk7j4UOwT+yBoNggFSkoARqxpOFNvqNOI9tMg8evy5riGTkDtK6s0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O+zBAI8e; arc=fail smtp.client-ip=40.107.93.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O+zBAI8e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5MRodbbodcGOn+g/vQTfYXpNsEhoRpt6hif06Xkb0q5wYA61xTPpNq6WKU9U75fFUs6FGwz378n3PFcOcLsLNFwSUuENSEvnQ3LCQIXzVxD7wW3MM1YK/Wx8g1WfPWNqdviP1mTssmnlH+r5KTFwCxXAWOCBW3Mtd5QfaiNZTfWY3Ec76bKSgtq7WPzm4wapXCnXMl7okRGmCvGEdfu08RMypIfRFIhs2tkhmAhIXAebcz08nFlzeEecHNOAUNq8jaAqe3bb46yv8WsQJkNm1qBWKNzrfJsOPtz8ZIvUWT5aVvbTx0E6fohIouaVw/mVgUePkITc5SC/UyQGllJlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDAczGpScni3cKo85Y1AEopbJNUu51OoJhwOxKQUcDI=;
 b=TH27exkhsLh9DTvFBM4IFFGLeZxDV15usLwo7y68PGyhjRRARQZ47FP1dp5wP1Y1SL32LMApOISiU5+bX1lI2xzjmuJzafsMmjvwn5bsiY1888SYRM6vxgvQtVgvmQkYiDIiL5Fsk4QFoos7yIRNrYxULbU2Dot+G8qS71PNAe+bPF/bU+smXPrdv8M8QO0cQgKstcWZUKLDqhdskQmI7bUnBMVdak8XCjIWgpPGG92DsaAoePJDUToAKyaoBRgPK7k4RZIALnumYjxZldm7K5zA1c/OScF6HrFOZBSdvPfYzSYF9bBYNQj3Rx6TX3VNsaZPmhpxtozrJ1CHBETUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDAczGpScni3cKo85Y1AEopbJNUu51OoJhwOxKQUcDI=;
 b=O+zBAI8eFN76F+FCxCUp9XSBV3kU1mx7Q8SFqz4N6WmOW5vrmglMnWAAyGskrVPuawm5Vc8RiP9ZqNxtpeOAHb1VkcREHGdeHVrwGJy7eiErvydlblNyCqbMDU4ZhfaBANMQgx5jG8S9vdgnumTzSKu5AKf4sh2to/KWwDaASo4=
Received: from MW4P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::15)
 by SA5PPFF3CB57EDE.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8eb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Wed, 2 Jul
 2025 08:54:45 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:303:114:cafe::a5) by MW4P222CA0010.outlook.office365.com
 (2603:10b6:303:114::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 08:54:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 08:54:45 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 03:54:43 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <Ray.Huang@amd.com>, Zhu Lingshan
	<lingshan.zhu@amd.com>
Subject: [PATCH v4 2/3] virtio: document feature bit 42
Date: Wed, 2 Jul 2025 16:54:20 +0800
Message-ID: <20250702085421.342224-3-lingshan.zhu@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|SA5PPFF3CB57EDE:EE_
X-MS-Office365-Filtering-Correlation-Id: ab4c888e-e92b-4a32-2e02-08ddb9461806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qucPJso3gZqoLpEOogP9GxWtbD3RCsHJ/jdREiE0w841zJLYxGxau6vhWc+L?=
 =?us-ascii?Q?BMzvscIT0v8HUSLsOYEoH0+o6gEygR8UPvivAaT/qbkkngfAyhsP0dbDXzmp?=
 =?us-ascii?Q?fI0lXd8uF9QGdNOgfMEyNGaVKz5qMyPUuHe/jL3MMQU/BWpDtp3WLLqCoXBq?=
 =?us-ascii?Q?p9WPx/jigMk/W667JkxA9Mgb4ph++J25tij8q/9nu0jdnbePi1FSWsBky3Gx?=
 =?us-ascii?Q?uIy9/q7AY0bUsOAI9oaXYqYpz4ysuqgUkmnNQCxOisVOhePvmGGkiVMU3oia?=
 =?us-ascii?Q?XEWV7+YIDAmriYxaDb+vKz/TEjcrLSxCH5oi2Y4Rb+7WGfq4ctrtBWxpL/hZ?=
 =?us-ascii?Q?p3Iq91Ah3AM9NI053qOQ/PNdRYOihEfSet1nn4zgeGUnuCF/pZAGC+8eF7jD?=
 =?us-ascii?Q?+MLFTyxqYBBQ/+G5u/bcUObNxtJV9pUTpvWL7W6f9WltWGNinj9Kz/+bmraS?=
 =?us-ascii?Q?t4XKMr52B3aAm2ce6LWv/meKCfWNpS6ph8Pv2JWWbYyVetCjIi3SomjZ3jNl?=
 =?us-ascii?Q?/FwC9vBI/E8nFZa+gxuiKjYJS0/XrlXqycTqr/Ldo6IoZSnU/d0hfzsGBYPO?=
 =?us-ascii?Q?dE2/X7tHtbmTP0APlAbNtcKzsiKwTOHzZH576b9SdQ984ckKldmFPlBaxfbA?=
 =?us-ascii?Q?1vSaKFIyNJ/DvP7RcC+i39ZA6b6Pl5bLL3+0V7sBY5dMRi7DVlwd3DhoGMrI?=
 =?us-ascii?Q?m2iWl1H3re8cLcXD7BJ5ox+xcZYaUI3q7P0+uhH2qsm9HwUfUpfrUZjPc+8X?=
 =?us-ascii?Q?lc4U8J3kiblL7Biu6JdGESUKvant/nDthe5mrXDIt0/XU3BPS08fgrH8dwin?=
 =?us-ascii?Q?HuiyHOMUSzJQJGdnJIk9FIaHkDz+1TyEqmIeT9576GKTglKfb7Z16NKxollM?=
 =?us-ascii?Q?YXYdNjS68vGYNoxJXTrEK5OzPJmeIrM2Bd9ImmtB/3G+UHd/CGzOpcGDPfoP?=
 =?us-ascii?Q?DnKG+SBgtB7D4LO1pGwxAs1/srAruPjBOwEAP/5eGTdKIihjACEteE0I3dph?=
 =?us-ascii?Q?vIAytBXVT4fcnRYzFZToIIbPLe5EdLYk44m713mKCK1djCrH/J1wMFEwDroU?=
 =?us-ascii?Q?kHvhQST3Erduk72ohCXotGXMLEQeRb++ZmaNUCzIPnPuyxLrtvev0an0Veme?=
 =?us-ascii?Q?J7AskwFBmXTaYnu/hC1aC4eUEDtjCurtgVQTZL+wd1zj7RT1L6dgLNTUnSpR?=
 =?us-ascii?Q?6nj2Mfm2PNsOTynv4cRvKPjO/Qmk7YyxJCcwZwicuDj/ua+zMDUSiS+P+EkL?=
 =?us-ascii?Q?u6EX5T0lp6PCLLbgn6NMi4s2j2UbG5kgPFxCtqF/3X0v8VYqhPIXsXexRQq7?=
 =?us-ascii?Q?SoQMF+8fdYK6Nw1ExXTInUchCX2x2ojs62845kSfRbYv1WXwVOJ2CUDlt1Ds?=
 =?us-ascii?Q?ulS+/LGs3RKNZ12e08LVlia8etslrRbgIvvVSWqPI32cozxg6Mt9EBYIAhXO?=
 =?us-ascii?Q?p5dywva2gSEtRB3vtWQO0GbB7LXrMNFqkQJlCbsiueduBF4orMqYz6t37p1C?=
 =?us-ascii?Q?pqY1OlStufrbgFQrptySHQg28+ftPNHo9ENF/cny6MZuWJK7dr4X+m+InA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:54:45.7040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4c888e-e92b-4a32-2e02-08ddb9461806
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF3CB57EDE

This commit documents feture bit 42
VIRTIO_NET_F_GUEST_RSC6

Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
Fixes: 94384142 ("content: Declare virtio-net legacy feature bits 41-42")
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/229
---
 content.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/content.tex b/content.tex
index 1efc2a5..9213dc0 100644
--- a/content.tex
+++ b/content.tex
@@ -97,12 +97,12 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 Feature bits are allocated as follows:
 
 \begin{description}
-\item[0 to 23, and 50 to 127] Feature bits for the specific device type
+\item[0 to 23, 41, 42 and 50 to 127] Feature bits for the specific device type
 
-\item[24 to 41] Feature bits reserved for extensions to the queue and
+\item[24 to 40] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
 
-\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
-- 
2.49.0

