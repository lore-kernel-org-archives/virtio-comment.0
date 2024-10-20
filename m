Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2D684E0A
	for <virtio-comment@lists.linux.dev>; Sun, 20 Oct 2024 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729424538; cv=fail; b=Ybq/3sIS+eqRxfX2xUiwzvoRlD4Rv/qdXaDY2M6nmnpuYGioziBTlnT4pGPQamg4DQK/bqWVx2LScZ4h7yNzmllzH+hL2IT5+cAOXKbBLSVGSmZB89uwyXWdeuG7Kf2TR82pkt9FhJZi3bFUXbu2U3A0krNxi/xfmRVLCGDCuu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729424538; c=relaxed/simple;
	bh=xvBZFcikxcpixgSqVl3D42w4ALsb5EMCDru+2igXe+4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j3XJTAVfD73+Vo9ZWAkkr4y+5vt3Mhof/SHmwhGKtBeGiIHl5DVI1a7jWPImEFcgeDXam4/KVfpiETSwyFfnZ3+8ET5SzKPxBHVUAG49CB++ZpTIw1Jl4mciOuBN0R4F8A2PbQW1My3nP+pvpJK/sIQYM/pF4acl7xL6W64XTOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lNQbxTMe; arc=fail smtp.client-ip=40.107.93.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lNQbxTMe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1q5S7wM1t6px/D0UB4mh1eBnwJRHqo77t/5g5fD8OpnvWYx/y6WJ+e3TNQaLrtETzXgPobyFnFh1KN6XJ+BIBGcW4/IKFIQLOkiV7mdvcei/EtGXLBPo1069PVTebDzVfJTrdrqWgpF3bbaDadUR19/6EJyVp4ggTHX34PJjKxTNyb61PhVNfk2+tBUTsvuo+80DKZhrjcKBxVVRdtYltoXIEE46GrQoZiCmar/Lhw7adlP8fnuE1ibGrls4BfPNAKhDKv2/jGlN89Q3uZ9IuXOjyPiLP881dw8qLsPfynDyYhnMow+/+6pmnZXsXFKaJLPfQcl8v9fgNo6MbweCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TTBWiLd4XU+HmEn1dfhGHUgN4z57+aURA11o0p1XzM=;
 b=Dhz73PY1IpE7Vsf0dRlBJ/S2RhR/+Hlyy+ZBLR10S2gy9KvclqOxPahyVjdYw9zouZXwLepnR193Wv4GgXqjOjHIXW6wyiZ7gpnHJUb+l4apnYgyr/BrGkIYBkOTDVEvEYwKtABJ9O6GfCLDAgINjF3eSoRiuQx8F5gfDmPQHRwr+T7WjkaapW6fbDlSZvv7sk+BnbaXjPjp4Yoy4HJ3VVmRT0l2+nSrvZBRCjTM8rEnvb9q+11NfUaan1f2zjUNsB31gWjqgomSzwqJIN2muFpoJJMz86RS1arrps4dAiEUUS57wA4ZW/OGcHrf3FipSXknpHi4rL8El9JBVevnXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TTBWiLd4XU+HmEn1dfhGHUgN4z57+aURA11o0p1XzM=;
 b=lNQbxTMe2TNIIzjnaBE1ufsjLTdlm6GZrnZF+jVZNGDFeN13Vk4txCYbOvP1zmTxmSJDDYFJU8bxFnzgY/LIVD2TGB2ZeEOoma2UFOG97Q9kTTX7pU48nSZ1cHhGK3AKyjH30GKsafCsWjA88NJXetf8Ud6vOmU3s3iiBxg3dS1vGzZhx8ty0LAzivsq+EK8O7NiWKe6tRC5ILMJP2wUMTq3OIdIchDr2tFAwwh4HGNJmbPhpU3Vdia1C6IFFLjexVZ9hng54m0xSvbHmuNCSh4B0VoSFRHcgBngjG1sD16O25l5ZKRAR5dpSOHAtsxX7DvK5Rdp2yCslj5InhOV0A==
Received: from MN2PR16CA0058.namprd16.prod.outlook.com (2603:10b6:208:234::27)
 by DS7PR12MB8250.namprd12.prod.outlook.com (2603:10b6:8:db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Sun, 20 Oct
 2024 11:42:11 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::7c) by MN2PR16CA0058.outlook.office365.com
 (2603:10b6:208:234::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23 via Frontend
 Transport; Sun, 20 Oct 2024 11:42:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Sun, 20 Oct 2024 11:42:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 20 Oct
 2024 04:41:59 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 20 Oct 2024 04:41:57 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v1 1/3] device-parts: editorial: Replace duplicated part type
Date: Sun, 20 Oct 2024 14:41:39 +0300
Message-ID: <20241020114141.451478-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241020114141.451478-1-parav@nvidia.com>
References: <20241020114141.451478-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|DS7PR12MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: d9cb92f6-079c-4921-b82d-08dcf0fc3bec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hhy2OA7PIJ2qfufCXsdkI0aOfr78jgS8L3ecek8VUsK+vDYha99wr43Wzt5Q?=
 =?us-ascii?Q?XHeb790ZJPANPRK8hBxmFkpPp8PCbJRcxgGSs+2B+woYHhGH4XxyYJc2WFMo?=
 =?us-ascii?Q?Gk1ycX/592NxHTLEEMyMeLkIQIe/gvBCLoSVH9ozRp6zK1+0lUvFPWlv6ZCQ?=
 =?us-ascii?Q?rsDUBWvMamxDWDDWfaEP4Epj0rBHl+OErePDPCl7NzcId83osNQ3S6+o9LAn?=
 =?us-ascii?Q?Q3LOrlY3JMTfNKTa7Mc2yYpZuk2ZzIYLdRtxnr08zXJdkwS/3XHm0V5DeT97?=
 =?us-ascii?Q?egKyu84IWHEGmomTxC2aoFEb5MhN2VIsXaOChRE0Pgt9A8JbvpuGEO8/+wWJ?=
 =?us-ascii?Q?lDV4jLN6XFRq7slFUmxaLmj74tXfyz+E5g4MkiyiiGr/m8zQSe/5SoEC1m/F?=
 =?us-ascii?Q?ywrTzd853DgIf7fgwOXQmmj/7E0BbllUjvciI7e+rAav/eGNJ8inOIyklp8x?=
 =?us-ascii?Q?2Cw3+J2fIfgSllZ+aFJUr1/HfNnxfaJ+0JVIAC+U4HAwnYJ90rBKu/KzuyEf?=
 =?us-ascii?Q?hCM1KwfML4eT41lnV2xE4hrcsyPoHr+WAQdp51CRUgO5CtOj2MAhZgeBhRAD?=
 =?us-ascii?Q?l2tLJdNBAXZCxKwm4pPEK3fvNlZfwbM5xzqTxiadAoydPljaDPrnjyac5jhL?=
 =?us-ascii?Q?rlBr2K9mYQa5J/6HnzYYVrlzXORbR70zGj/Lbh8gSKJ9XnV/WAzfdqTUKt1f?=
 =?us-ascii?Q?MydAMTfQmyw6iMX7HiTsqU1/L+04WCTEnCSly4FKRfTd7lx34JV+tZxP2g+m?=
 =?us-ascii?Q?/ypQyWtpYaUZbTiYJqxM2T8C5pQiHWfkwfHuUDDitRyqb15GiOPk8Z3v4vhB?=
 =?us-ascii?Q?aSYh4ZswFDKQas8w8McZEURLC+LQoOW6flVovN+2MKPmKTquWA0ctPI3m/BV?=
 =?us-ascii?Q?XKpWAB7SZSXxL/lKSBTB9t8gD60KLyVjg82D2LtVnKG7jwEzL7WINOc5QCIO?=
 =?us-ascii?Q?I/MVMnv/lJ2ytV461JFgRY1801GftKxEilVRScLbhh26WeDLkF3XB3kGqjaS?=
 =?us-ascii?Q?DlkR6wVXArcJ64vY4POY6lEu4lIRY+sPPTc+OYrmk1QntY2Dzh9gdpArxIkr?=
 =?us-ascii?Q?17zFe7JVbOAjl8xELfUtACIfZokAxUdR4hiHjM8//9WXtwUwb+RPxRth16ft?=
 =?us-ascii?Q?tMXgavULRdXNB1ZErLkmzmn7Pa6FMvqyczqyo2pjs5uDSNQ0bMeQHwPoaI/Y?=
 =?us-ascii?Q?jiElXBxOR2gTVy3Z5Bm+hvIymgV9ew8TJElrEXAmVIHH0TmGdhN8w9OElIfn?=
 =?us-ascii?Q?ZYhIsuwveNrSPeNbUVpBuH0iIAM2UiURralliGonPxPqZ/3N9P8jT3ozn9Wi?=
 =?us-ascii?Q?97qSw43EWyWsXzKhB68Bv/gcARHgNIVYU6pRe4o+wI4UNlzcgLzeScnDrXUn?=
 =?us-ascii?Q?ZP7aG4gl/ZuLHTyC0HqR2uevX2i9tyKTmcSX4+2Xq72vLaOKag=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 11:42:10.5530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cb92f6-079c-4921-b82d-08dcf0fc3bec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8250

Device part type VIRTIO_DEV_PART_VQ_CFG was duplicated in
the description; it is supposed to be VIRTIO_DEV_PART_VQ_NOTIFY_CFG.
Fix it.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209
Fixes: 617aa2d62a88 ("Signed-off-by: Parav Pandit <parav@nvidia.com>")
Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
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

