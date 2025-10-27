Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010000.outbound.protection.outlook.com [52.101.193.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF9F1F4CA9
	for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 17:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587393; cv=fail; b=neek5A6cR3NfhhPWyRxYzEYfSY+amX0x/M+PfgKv8Z3iZXVuzsfvMsu+1EZ6Zlbw58sl+zb4YYe6nQTF/EDwkKRUjOFCg2RhFeDXXFlKAdgB/1RnmX8haAxTfc4YbOohNy6mTmywN/c+gNHa7a4R/ti6iiDyJheyFKhvCop+ynE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587393; c=relaxed/simple;
	bh=a4hk0i+aWGorgZdBV7KGSFnbm3rEgpVgEnLE6eQ6f+c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t8Oqs786ufWaxiXsw2Y/wrdWIxerRx51auQpwhv15xSrLuLkpuOp1ZmpPKVLFSFtct2gojlwQFi5vjGKePqg1nBICMnLQF/Wy7bKYGZoLnHDfP7w/p2kQs7/eowINu6I+PtkL7FRsgMKjEgM+lxIiI1SZPDbCQn+XOCW2z6/LJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uUS5JvaI; arc=fail smtp.client-ip=52.101.193.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uUS5JvaI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyLU6WLQVD75ZS70M5BkR2p3ClPDsi5+Cd1v3qLycQwzSKfOedqZeAwQ0ZKRdpUCHAs40zuDxYO2ojcQoFJByWLA66X4VcRs8CA7sDTjGlUVTng8b8N4m4fSpKaFDdZ9oLXcXxRJKpWtnSA7u2on1QgzlxH9L4OU70vbJYde4yNMbLBOfIUzpCMLzDm/8r4OfZ98VSgCAFaDkHHdTrnMCpikbQKNeshdIvIyHQlACMqK9egpSOWXAyPDKV/0J9Mh84HzDr5WXpPquvbECV/fxJv30GNGYaRE4854iyC+mNtHpKfOLBcr4hSx2S/eNbOaf0Vx1LlZg7OfXyThWaMyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayEnPtH4Sb3TgBqduvx0Pk1UsePVt4RJPxPWz2WYwyM=;
 b=Lbx/CKZhCL8luyTuLfLArwvxWLW1iJmuv3H1ZOSgUmGjo9VdyrtbLxdDcwqpqvg4UzIvEL4s7I85wep1cl305WvyJkx4YyCSB/hDmDoFnO3xJeWwDvauqbcGCGENJJXomF3krItcwV6Lp610o5mkRMcIwaDgw2zdC20qKqkmnh8oZjQ7MFj4ppnk+6JdIcGjxiGO1BM5oOsBpr5gymfMTxheDt7x1kX2Yii87+p8ajeOHxjAqXk/iwEAMIWBuCaJCUzVcpgE7br9RhhBTqBaedPeosn/GC0huO5zT9PJ4OcJFAQUytd2xhIXPXiq0iSA8fKJmWSw4HcWbitWSwkb6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayEnPtH4Sb3TgBqduvx0Pk1UsePVt4RJPxPWz2WYwyM=;
 b=uUS5JvaIoRkub9wFhjEv2UsVXUtZhAiTjnWeAOU+yGCeD4wOjcPbM0bC5lrSdIe7hmq/nZEx5as2tHOBm7mGpqtRknkR8vWDr3v9MtHF830tkVsEtAZjj2CnzBOodKyaKqPz46lmup7CY6MwMsGWtWNGf2PWFcz0B1InNmvzNF04fb8nPWsJhnCenfbwOx0E0BheawdDXcj/Vb1F6vxLjTiwDj1bboKp3Q3VtELUO8sQgINpr/W8WJItpbHsQlE/fpXOsZkSX0vRh4NMqcoDgbQX/Iqx9mus07oyBrHViPvW20NEUZupeRZ60ejPK90Z6pzreASPAZ7q1Bbp7pqcbA==
Received: from CH2PR17CA0029.namprd17.prod.outlook.com (2603:10b6:610:53::39)
 by DM4PR12MB6184.namprd12.prod.outlook.com (2603:10b6:8:a6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Mon, 27 Oct 2025 17:49:48 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::bd) by CH2PR17CA0029.outlook.office365.com
 (2603:10b6:610:53::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 17:49:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 17:49:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 27 Oct
 2025 10:49:29 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 27 Oct 2025 10:49:27 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 3/4] edit: Remove annotation of special character
Date: Mon, 27 Oct 2025 19:47:55 +0200
Message-ID: <20251027174756.56284-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027174756.56284-1-parav@nvidia.com>
References: <20251027174756.56284-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|DM4PR12MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: abdd1b75-bedb-4694-9ab5-08de15813912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jnZ2s//udjsa2/corRGNozl3AKYh6dBMZ0r+eTcaPcHuN0wKNoFZUpIACQda?=
 =?us-ascii?Q?DkdAbtfgU3I3Cq+yTO6S1By/tBuG4fceCc5vYrKUY+6rofEGA0mQ0gdvIPcs?=
 =?us-ascii?Q?tV+AXVHzkhRp7dln3d4RcHhA2+3v6rpO3fnJb0eqN+OgjJoaiD7WOuaxnKn2?=
 =?us-ascii?Q?3/f12Sof0e2JFMIP7Y/jUkqwbXtF3H43QPAyhGg8wue7x4vK5BSNPcK3pTLx?=
 =?us-ascii?Q?8D3sT+4bucFQWlb9T/pmfPUzpRjihw+V+v+RF1OXg+oyDAsHwmgFveKMy3Jo?=
 =?us-ascii?Q?A3+EbHr6CgpFCU+hmj/advNJFPzgjAKayOcLx5DSxHTiHEQTq81CgjgdGXra?=
 =?us-ascii?Q?BhJp5krIiVAHWN2O2OKD00geSnqPhkqQi4HmUlYQjC7skDGL2rQo6lurkCXZ?=
 =?us-ascii?Q?KtKoK8s682FmfCbrIJCA0A3PRrZ6FBcqn3JpV3gzCSTj7v/rRU1mGRM7dYmc?=
 =?us-ascii?Q?HEkieiumNcLEheSviaiVPzbWVC4chkPKohCAUKi6kCtGoy77QXcWnThee/Wu?=
 =?us-ascii?Q?gv7tcX7Isxr/a2zz5lYGPnF4lbfr1kfjYFvauLRnYVrfUiuv2FHRCZDM6pER?=
 =?us-ascii?Q?fcnDVn4UEUSteZpH+vkddg5O1wTAdbW5ZhgC+RISMHn1X5TXqNQaFOpAwogo?=
 =?us-ascii?Q?6lURC1y/eQY2MfQ7gDfCREm/dEUkVrW6dn4T5YVvqFMmft4qvgiyGo7+oHSu?=
 =?us-ascii?Q?LZO7T8Z/1cKUrzpgrKQb8XmccPx9F+nu2xHWH8nOqEdATVREvRr53JSKWz3q?=
 =?us-ascii?Q?sDi0T5cKvAO+d/ENKTCyBxyJLvjpbTC3RsessD66L6DRyahzAolrMief4MnC?=
 =?us-ascii?Q?T5QqPBJ+YKPN/3oh3Eo7daBPoejDT5J0bXvJV9Rh16M83ss0NYOEkInbeZMb?=
 =?us-ascii?Q?FqGCNARU85c/3Zq91bVyxQWgOrULG4Do8tOcar19n5OsRBHM0IqN/802VcAL?=
 =?us-ascii?Q?LdGfG0A8STPfZ5wQ5gn84+miUZJreV4t4eks4PcRu8nbGJlyJkVkyV8Meaw/?=
 =?us-ascii?Q?cmd+7TeEhAK0F2uJOOzDXrqBqi5EMQoudLP9flz4DvL2geX/FqDqcr9lsgMx?=
 =?us-ascii?Q?I6UlUmadK0gl/6vrtnPxHceV/Pt1GV4CAvtOmPYAuoI5vDIr+CQrMUY6YGQ7?=
 =?us-ascii?Q?rlrZjRdtuUMU6pkOR/cv9sza7f6AQ7Z3wmu9Giu7uwd1GiYsaP9yP34RBbDx?=
 =?us-ascii?Q?r4UcAC7ty2XOCN+Sn7/Gc56xLq6mca24C6qihur3OMduLr8s0O03MqMHipw3?=
 =?us-ascii?Q?eztkG9IWHVgXEdiLJNbZPJnGKf59X6sb2CC26q9QUtweTLwQXGuuXKURIRJq?=
 =?us-ascii?Q?2/KoFWHeSB25YkdMugd9ld4c98s+i8ZZ+HFoLheW9/3Q7+Jav24E8LZnQde0?=
 =?us-ascii?Q?aT6+UisEemJmZmP5Ub1Ehm4GVMeq4fbxjDCt8NYgRe69/pKSD+Cqk4xCSBGS?=
 =?us-ascii?Q?C0vcRLKHTBn9ce+v7dpGajMpS/2dWiODf7sx6hsWAga/wpurwA1/lteBES78?=
 =?us-ascii?Q?9B6BjQGR+tt6roEFjgrQPcnv573ooZefujyzTP29Kzl1uRaHgnwykXY9jRl7?=
 =?us-ascii?Q?+bvCLAruTLau2cxNj4U=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:49:48.4134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abdd1b75-bedb-4694-9ab5-08de15813912
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6184

PDF generation parsing complains when special character
annotation is listed in it. Remove such annotation in changelog.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 cl-os.tex | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/cl-os.tex b/cl-os.tex
index c5100f7..388a0ed 100644
--- a/cl-os.tex
+++ b/cl-os.tex
@@ -923,13 +923,6 @@
 we started using implies that fixups are picked up
 instead of the commit.
 
-For now, just switch to using regexp (dropping -F)
-and add "^" in front to only look for the string at
-beginning of the line.
-
-We'll worry about more elaborate logic later, if it's ever
-needed.
-
 Message-Id: <1130700f4ae71a93d9887af35cf105731219f057.1721062136.git.mst@redhat.com>
 Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
 
-- 
2.34.1

