Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEFD22FDFF
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 08:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667821; cv=fail; b=Vsrf/UZoSLTmoSDpPAjPNZQlUxpm/kwQ9yrrBEC9n89HYxKSB6fx58HfABsFJNOyV4JKVwR/68J/NObksOO4HzmBiml+vNpxQVLjDDWC50UAnY3guDEzrz8oc9nPVaZCXCLI1u2PHY1t/0dRzchAmO/ByVZ2jjf/1DIrkvpcSvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667821; c=relaxed/simple;
	bh=aMErCfWHl17vGq5qFNrmodz1oCd8/3ub10VweURpto8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LbbnnHHwrU/VdLWvOJwP0XG7a4MlQexZoGr8S9RFZHatknV4cKaeScS9VwIb1oRCX/zXXrv1WgJWi9KLSlFPw80nACoJXhTDfwxWLKL8Q6VvldnmMBrBFWmYxCSXVIDwm6MIoG1ykAWXcQic2o8L+U1acuoQ86ENOLxsrtt+2Ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PlSaw33L; arc=fail smtp.client-ip=40.107.237.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PlSaw33L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQV6AknC6Kw+ZHEyPvE4Wx2EpL0uTpnMt/R95faDS7V7HYKWZwRQeyvgk0oSFRtG/Y7JVgBXT3hgDEGXJ75uX5kN1+SOsv7FyhaLiC4lwZbe4Osq1RhTtNht2htTtSEGzmWv3oDPCqZYSDw7LMK3nZf0xuhzbUN4u771l1coMG9dUgRI5Hwc9Uc6P0Q6liTzWZWYEdAyOchuoimFclyRNvWMShMhE/ExSyClpEd4SvD/+WaJ7AOJv13e5JZxwgAv1YJE1aMvarlLnZXrzA4sphjmtZOzUT9/Z+ea2CWNMMGVsGWAgIrBgI63LWReLekDrcFq3K/GHzxtKvg8c56Ltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIzxqI+px6A9/EdyqdGXacFnAC4opyw7LUhLNFxoZ94=;
 b=DP2HlKGvXUg9F6pmP4n47pdNHlaGrE+Gqi7QebVyt5BwqG8KhdxCSgURm9yO4AwjNj/EnbMQaO3GQ1VPgMlJImk5nC8Zm1avGF15ak8WthCWDlzAKFMEVtBBC5brjLKZAmg3iss/yRuOjg+Pn5OZ/MDnr3AvSbo6JMv52h8LqPZodkUu8c0bZ+4udVCDtBvONJJf/65IWnd8+JfS1+CxN8e4Tt2/cA6AHLVgIQV18cY7c7yKPp/051q2p7+V84SwXelRzJPa44AvNl16Ldny+9ljaz/JwZYVmEPMl7fdKKz4EVmckIbBAqsVrwaTZJpba9CZE8FlkEDSEiNaVaQvVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIzxqI+px6A9/EdyqdGXacFnAC4opyw7LUhLNFxoZ94=;
 b=PlSaw33LUsQgjKG4igPxTmDNRvJoFWPVz7RqvdoHQEI6sdBeZn0S940m2oVVBvYvZgOQGuKTjdscJj6ePXcTfg2+wcIfx40p26Buzpi91k/PMPbCSeq/6/zBfzUAe3MY4NUK2/qwAh8tCM/k3mThxMWCGP2ZV3okNRXy+5cH+qo=
Received: from PH7PR03CA0021.namprd03.prod.outlook.com (2603:10b6:510:339::28)
 by PH0PR12MB7959.namprd12.prod.outlook.com (2603:10b6:510:282::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 23 Jun
 2025 08:36:55 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:339:cafe::dd) by PH7PR03CA0021.outlook.office365.com
 (2603:10b6:510:339::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 08:36:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 08:36:54 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 03:36:52 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <Ray.Huang@amd.com>, Zhu Lingshan
	<lingshan.zhu@amd.com>
Subject: [PATCH v3 1/3] virtio: re-order device status bits
Date: Mon, 23 Jun 2025 16:36:35 +0800
Message-ID: <20250623083637.296041-2-lingshan.zhu@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|PH0PR12MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f38f30-293d-4de4-41f5-08ddb2311bfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EOvTYmhgPzCp6bjess0w0V6CLyP4F198dp5J8A5C/ptHjZkhyDRGuUSCZHE/?=
 =?us-ascii?Q?4YLz89C4x273LwRkC70U9nHOdROqZqCEZPwq9wddBB5s39GA6lZKEMtBHd4v?=
 =?us-ascii?Q?kVF8yRnvlhJ2deXqWraEFCMnvVhsriLmTK43dEqj5pAZVs6m9Oe9TJWxypnl?=
 =?us-ascii?Q?mbi1xGK4Owz8GVtLFy8LDWJ1d+pDXa20aeqHWmlf3Kv0g8uO7Dj4+/Qhrb8i?=
 =?us-ascii?Q?3goXv5kFxRDzk1pzYt/MhrNcFE/5d3HXOsugBQQT9LfYRdotVjqZzuZLA4WM?=
 =?us-ascii?Q?wuczc94zkwVcy3Ts7xHvXGlSYg0DKxRmTwlp4yNCVGFGfMXsZkDZXmMQOYJr?=
 =?us-ascii?Q?gDq/gT18GpC2mYONiX9QegfgpRbmKrbdftxiOrAl+sjlyyt1cRQnmNpAp5Yd?=
 =?us-ascii?Q?OGkUorx5FJPs3gMP/ihi4FzTXfhlx8dlk+zT5lAfpeATrKVTARA+nBNxHHNd?=
 =?us-ascii?Q?KouqHqN0H/DOHOjBmRnx+akXLo1mRBMAtFzdlzV71yfRceGvU3Lfz9Pm9uE5?=
 =?us-ascii?Q?DZNCzrOgoSSaO/bYtZj5LYC+2Rab1Wmb7hOi/fQXaGofW9qT2RMcUr1roMu2?=
 =?us-ascii?Q?LCGJAYyaI7p6vwiEIlQcaAVofaR2DUVWcQDXRfAkrav+3MYVYuh3Ug4pH01J?=
 =?us-ascii?Q?nd/twtjHNN98sUKoxUanxxIJexOthWcqNAvdtMVlpdwJQYvcBUk/tfUBuRAG?=
 =?us-ascii?Q?LEI+/D4gQc82kT+x1UCDLXkcaL80q53DGbK58zCIZOJnmJ3Fo0q0defjfcZS?=
 =?us-ascii?Q?giN6XusPxUEWVW+l80RjnmO7e8PLhWLE4r7aNARxcrsQEECfJnSv06UP5fKW?=
 =?us-ascii?Q?BRVvkgUsAH2oaxzzf5d/9Z1xmT5Bbe6h0gacRyZbW3RcY4m3e1QlKZmIMeEY?=
 =?us-ascii?Q?p083Uw6RGNM0upO/5e5vj1BatIYMjuZClq4Blnk7zB5+fznOUI/uOnqc0RRX?=
 =?us-ascii?Q?GDKY8wkZdpIsa/xzTocxZt9iRi8D74t1Jt7m/XZBNQVN12rlkHzSs6FmYpTg?=
 =?us-ascii?Q?lVeUTA0nLJaqgdeUW95ETWMoqhQoTPXNBsx5+IdzdaCDsyohfGAQ9UhmQ3rl?=
 =?us-ascii?Q?EwNM8YcHItGUsTHSrNMWY6ZnA3asZ/xyiha/SCThNOvRokha2jNrV+bzEz96?=
 =?us-ascii?Q?fqUP8IEAk2dtoRDLyzCof9eB1FicsA1ZVa316uZ1OqZ6WWKzwUMmF4hdKnV4?=
 =?us-ascii?Q?zOCPdvQab0R47KqV3K18I51lengN8w0l1aYMeh/PKibceH/Hn+rn6IgYRJ5D?=
 =?us-ascii?Q?vy4cUtb1xZkDKYHXoULrtB4BDHdjfCNSxpNiZOET/Y+9uNmE+V3/N7ta76xm?=
 =?us-ascii?Q?FLkKrqp1nR+ctNdsoMJee6FHZC2v8u9jgw7X32RGt0lP8hxqSN+CZo7NJJpf?=
 =?us-ascii?Q?4bTa2c+7QLH8tc+qI1GjZk/ozIrFZEl4O0lw7ZPp8GCMJTEYHt/dJUY6B/1D?=
 =?us-ascii?Q?ZWuf7q+R6Hwqr800yqJRwXizI07p312jdZOQHVcqv/h9Z8ZicK+uIlc6DGm7?=
 =?us-ascii?Q?o3aIUmmAr7axMAu3PRCy1DMG6/9vFKXkjlxI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 08:36:54.8185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f38f30-293d-4de4-41f5-08ddb2311bfb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7959

This commit re-orders the device status bits.

Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
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

