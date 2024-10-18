Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBA818C34C
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729257495; cv=fail; b=KSCcRFCEaEPu84fskR6u7EMDSP0IJz2vCdX/BzQ70+WOQdSQIwz3cpwpYMGolyChi3dLIl1qen+KZvs+b/leZMxNXY4C5Ow75A0SKXoy6qI8a/g0MAqRe0ZTEXcTe3dpJWCZJA0uo9IY3ROoglsVDFxQOftZnTXZPMjCP1YsMYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729257495; c=relaxed/simple;
	bh=VsPrDHU411ssC6GabFAyMrGa+Ef6DtwH86tSukK7Eaw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cg20SdpNp2HIsDPl7fstEy6TWOOS0/DECyG4gbHUP7JVKPqPVOHYOG38rrGTaeoFgv+ja4ynjB7CWHtTdhi+5cF1RL1HPR2Cel5M1hQMsvM28iDDXyUaH4+awzCeI6C5MBvG9xBZQjeWpqSco+0TYeclFUI464ERSw1vB1l/YR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dHOW0iOe; arc=fail smtp.client-ip=40.107.100.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dHOW0iOe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRWuHOR2Tj62vfiOfXFwgV6lVQX7oB4MHEW0DTmS8qsH3EDG5ofknKJZnsW7SOHpof+o1sbivPyqO8522+za73X7KpmxuxUJbulTzYsaAYZovY9WoHwKC9i7CPNGEtG9uuastOyhaXZ22ejElzWTI22FwNKJqJJ2JCTUWkM7TGc5w/fIHc51b8QhXWjXfk9cLnvXjas58VCeKovc7oK+M0pNvNsoVoY8VofKZYkavUA6+6od3ZTHs19OlLCzZqsI9YHJcrXVa6I4M2P7pXOGmyMz8OE1pTidefvKwT17GZj2VZsA9HqaHC/AI8Rsx00zkhelMR4YMDQ2fvLO+efUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bthu2uD8UdZ/BA6NEJ3QTkYIrTeOWio/7iVscTGAlwk=;
 b=X8OKcnt0v4epQjmrZsXyDnRtSRWvxU4Vpf6fKClzmHdM1BrQFLVEHES7DNqr7CSqWBQENk9FqBr4O11+5BdXZfoQPtttP/wtiDvDan4IMdK7Hltw36GPv5Zx5jiFT2189YrEBwk/tKi8XOElRk8Tll9/JpTJVvHkR603ZXwLesXSzEtBCx+LN/u0aFFLPPC1a4CEyypM1NoSwmXpkXi1eCSW/jwD8WqvGpCeRMGlG28ShdAC8GjW/31pi7xdiwnrJCfmcELKa6d4ExYlnY1kNQKQolym+100TwwJafXc04GxEWaHc5EwaD8kE3lCaPOX3XN1xe3tQDx8BmrvGDjMOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bthu2uD8UdZ/BA6NEJ3QTkYIrTeOWio/7iVscTGAlwk=;
 b=dHOW0iOebF8nSLkVEl1sgzotUF8ZdR2mfv360+WWPucuao6gunV1gjdal7JGD04LgqnT+T0i9ZB4O6JV9Qrj7BGaQJLzcm3MdpYny5Y0vNMrHKmrTGKfxZGBSMCYx7AkfV5ustsXoAADtzzNaaxCII1N+9plQGWu3h8ZN6JsXQzk1JlwJAFPRs/AmlInaPfFQzI4DlptGUyLfGj8CJg02RRG6A0ZqWxrlPJMOzsrzj5VlTF/WFE8e4YPPm6kPHEk1HaZf/DeX1LQ9VZSiNoWVcTmNdtWVookaMNMojBIJfZBQtnsPRrBz39m9ZocAWSaDI4E68J5ywDFGlHS3Vriig==
Received: from MN2PR01CA0042.prod.exchangelabs.com (2603:10b6:208:23f::11) by
 CH3PR12MB8186.namprd12.prod.outlook.com (2603:10b6:610:129::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 13:18:08 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::15) by MN2PR01CA0042.outlook.office365.com
 (2603:10b6:208:23f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20 via Frontend
 Transport; Fri, 18 Oct 2024 13:18:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 13:18:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 18 Oct
 2024 06:17:58 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 18 Oct 2024 06:17:56 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 1/3] device-parts: editorial: Replace duplicated part type
Date: Fri, 18 Oct 2024 16:17:39 +0300
Message-ID: <20241018131741.443635-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018131741.443635-1-parav@nvidia.com>
References: <20241018131741.443635-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|CH3PR12MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 1115a682-03fe-40c0-002e-08dcef774eca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LmtEth+8lXFbdI8rtpPbckoSNIinDajtDPe8U3chKYPqR3+c7mb0tddO5aHI?=
 =?us-ascii?Q?zy3Ic0FSNs7tNHq++kr69iGnDBh1ZDf4gJoZol9Ad0ln7ZfoxpUHiCN3OHm7?=
 =?us-ascii?Q?pt8t137JFkK/UgLPvnqdAN2OeL8L2ddIKJmvwo5u1wGfuWk9DCQa443+o5D/?=
 =?us-ascii?Q?nSvpVCCG0XxIFggSMIG8fLAuyibPAaD3FDvCjtqiTeL4S+47Qo3ca8/GOozt?=
 =?us-ascii?Q?gy8kRFyagCEnTUAkdZnc0CxynaDde4OYGZ3IcVpLp2OlX/nCIAgLxp/c9nHd?=
 =?us-ascii?Q?GsXPJiGEA/+s94ycjaaXfpWkaMutXTzqut9D+Blu5hhmkq7KMndsr2J4DfR6?=
 =?us-ascii?Q?afQyiFYj/up8aN4MSQyurBmi7RM41ZKwN/Pa+G0AhbNpgkKjSYfkrO4/sPpc?=
 =?us-ascii?Q?OmzLkl/gc//ErVzmieKSII0hxaKmJPrDh99bOxU1pZPJG6GDFwGd0/rqWW3J?=
 =?us-ascii?Q?BbRCya9jhmDwBSBRmsLNGQONPQF/vt9VU5D2boZk0SkAGDWRg2toFWBfWReu?=
 =?us-ascii?Q?qhXnyw607WGBA9rWZujEm0stRRbb9pRzSTJv7fU13JdG/+qo0rXI5+FUyVBP?=
 =?us-ascii?Q?ZDjxvSrJe45tU2RkZhmXewhBdaHTV3FAjKAYc94g/WlOPxXLq+1ONAJBq6qN?=
 =?us-ascii?Q?c9+AyeHrpRQ1w02NpT+qxvjN5wdTdN1P8b6HKeVATOdS6w2coSVJWJLFIzHV?=
 =?us-ascii?Q?6MTxxsHZrW8kySgm7SEGRdTDx8zkzOQUK9szg6jXsJzEUjCB3BgeJJs1DAKm?=
 =?us-ascii?Q?u6RtH9gsg7Eo78iFAyhBBl++v23pwVvvD5w41KBllTZPH2AytVcrYomAtKWD?=
 =?us-ascii?Q?SXa4MdM3SHfcl1TcQNAzmz7IaWKnsMnZLKuI9qhsj85VA3jjcUHaHTbZED55?=
 =?us-ascii?Q?WPZyNiQw9vuBoBuABUYBScbubnDY0B1D7v0xh2i9lPc1sJFtcE/iKCQ89Ekj?=
 =?us-ascii?Q?KT3prl0+adxb7dgq3lsRnA+LeoTkzfjP4lSZfsybchVcWIqPD2noVYkRlqDq?=
 =?us-ascii?Q?ne7gY4Kv/a/qVrTEtGoO62H7lEhlg8XTWhGUXujpeUZFMfarai4nQvm2BtBQ?=
 =?us-ascii?Q?yV/0ABPRcw5msKBCdHq+aZW+5ldCEaRbacLYiVL+JGzRNiz10wUDVuTauOgX?=
 =?us-ascii?Q?uBzegOyf3eImAZ0EMpC9xDqYvakiY8dD4/kaBasfRHmJlx7fKFC75zgxxoUs?=
 =?us-ascii?Q?40VkPwh4r20D3qZfzpE34A/VRFcI+307uWz/MGpnXls28P5NLd9SRviLs3gX?=
 =?us-ascii?Q?mHEvRC4FWS4Re+9KURubSqZ3ikpnr78aHptcC0daZvAHkv7it0NySANNFp1f?=
 =?us-ascii?Q?UbeE0KU4T/Ha7ZQBSIibp8nNyK8Qn2Ozk7WtkNihsjboMuXPZrvUNgZNkQ/k?=
 =?us-ascii?Q?OowlWOvZQVC4raNYCqaSOlEBI6LG9ODvXTTwlKCQEPrTZL7Hhw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 13:18:07.9744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1115a682-03fe-40c0-002e-08dcef774eca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8186

Device part type VIRTIO_DEV_PART_VQ_CFG was duplicated in
the description; it is supposed to be VIRTIO_DEV_PART_VQ_NOTIFY_CFG.
Fix it.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209
Fixes: 617aa2d62a88 ("Signed-off-by: Parav Pandit <parav@nvidia.com>")
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-parts.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device-parts.tex b/device-parts.tex
index 7197929..e59c0f9 100644
--- a/device-parts.tex
+++ b/device-parts.tex
@@ -75,7 +75,7 @@ \section{Device parts}\label{sec:Basic Facilities of a Virtio Device / Device pa
 
 \field{selector.vq_index.index} is the index of the virtqueue. It is valid
 only when the \field{part_type} is VIRTIO_DEV_PART_VQ_CFG or
-VIRTIO_DEV_PART_VQ_CFG.
+VIRTIO_DEV_PART_VQ_NOTIFY_CFG.
 
 \subsection{Common device parts}\label{sec:Basic Facilities of a Virtio Device / Device parts / Common device parts}
 
-- 
2.34.1

