Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32AD184
	for <virtio-comment@lists.linux.dev>; Fri,  4 Jul 2025 10:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624299; cv=fail; b=AsdYfPX08ecznC8cjhAx8S6P71EMKaUoLR+8KPv9cUKkV9kBVpEvKb1me6/0tlpZInShbg9h10EM4fr5twIa+6pZTk4/OiHbjPxEKJFIZXbF1tfr+TT8hC72Q4E6H174sCwC5cQLsLTslafdxS3O+zJc4RXDPDwLgCdadSFquzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624299; c=relaxed/simple;
	bh=Z4qO77SNaEm8KFvycWTl1NXVNfWg04GltbNzZqIuDIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EEBLhAOzqJEu3FNuTtrVdrOlaiXGf9Eh+ZCP/dXEC0mYPltOivqR9g+NqfgNaUHzlART5qSTbSqFopx+vUJ7JKJ/XwZeflhrWMGzB+EsSHRjZY41pdR/VyS4MGAFH1KPlskP+qn2HIgM8CeLbpNlqH4FHrQFT1ca1XLD2bOw4Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4fCpwwAU; arc=fail smtp.client-ip=40.107.237.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4fCpwwAU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iepEgvas1HtJ1TScvNGuIwMK0l6lKuE/f8+1Y1sOdWTGf6vlwVIn64v8z5cj5pvZ9EHFBwdk5+3DGsGHva2j7UdADhgKlZvnVF5smDvLIBpJMG2WS4SpILXzXYzT3KHWcFXTM48u5gJ9xPvA2d+205ckVyqYTKmRa3DbKeo9W+DvFk3BsFNPjAnYdFfTCrOGmK/wMy2hlsJMxW2IB3JaANpTt9eVghD1j1FEmiNqULbj44us8DB7yFO2o2yRc3nAz7NZgKDtdAJGGwfO9TB+85tmRnNGii7yB9T+94EFjl2irTmt0ebOFdsYprtoF/b5bigdC/m6ZYfzZqOjcD5ljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqDDxql/MwvlyoZFm3xUC8TmTtwC5WwpwUrzNixw8pI=;
 b=iaxlpeK15E9MZ4rElGxda5KqRZvoTTb4207sneR8ylEbJuF4ywlzvANU3yICmBGv3vAUPFxdjsengX/dRwaUSJwRUS0EShNlRAfkvclkAxMXzfc6mimyxz+3ofkKSoi+3QxJKTPmSMWkST9JeDgP79kJxKKJkY0ui54cEqr1qnppRDY5Ysc0qKLTT0EWhcsvWfmvGtPwaWUm5qpn/fFbRPs/9J/tKxt0OyR5/j3ZNnearirqh1VxzcGnzATEYtiwkf1a3nONMM7kezuEo1aLG89JAJ7MO38pj/cjXXGjyCMbUlamQrP/H7dkMTzf9o9DNDgTjYA20d29g6san+u2wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqDDxql/MwvlyoZFm3xUC8TmTtwC5WwpwUrzNixw8pI=;
 b=4fCpwwAUE5l9V80zuMim22noTilydwvXOKegWF2pjK6aYBHh2tfkkeTK3Gy+PiYQ8f8olKpZNqbHcg7AshODDlOYMQiBG4eiEPIL8zg0bgAcUgkamg+E+7RH1NR4slKZ0Guu4O4VBFsYbXWkaBg7K5UxxLu2LdnPxt0OpRGDolY=
Received: from CH0PR03CA0096.namprd03.prod.outlook.com (2603:10b6:610:cd::11)
 by DS0PR12MB9397.namprd12.prod.outlook.com (2603:10b6:8:1bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 10:18:13 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::c8) by CH0PR03CA0096.outlook.office365.com
 (2603:10b6:610:cd::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 10:18:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 10:18:12 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:18:10 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <Ray.Huang@amd.com>, Zhu Lingshan
	<lingshan.zhu@amd.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v5 2/3] virtio: document feature bit 42
Date: Fri, 4 Jul 2025 18:17:38 +0800
Message-ID: <20250704101739.354522-3-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704101739.354522-1-lingshan.zhu@amd.com>
References: <20250704101739.354522-1-lingshan.zhu@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|DS0PR12MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: abc85a80-cb44-4dfe-8938-08ddbae41563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gVnp3bCQdkK2kND5t6b45A3HwIwLTAOPhUwH+JqdNDDNxKpyHh5vJyYb1R7m?=
 =?us-ascii?Q?MXhfvKIOzrKflM0//sWPta69BQbvdpim7HYJCDzYyiawnuIPg90976oFmUGZ?=
 =?us-ascii?Q?EzbhOWJeLtvRCXdaJ10YN8DfyZ3dv+cwQflWVSJndfBSQjEI7sijnItDbIdX?=
 =?us-ascii?Q?WgSvFsmFnIxMUxieNFQ6bMuFaNwX/cN6tw0grMv5jrjTwtq8sLfJmLQPCy87?=
 =?us-ascii?Q?ynPAHwGrUSaTzAsqb2mwVhsVjaCy+AQ/6y4iraQ7AZ6C7r35334xcne45e/G?=
 =?us-ascii?Q?MUeadH+vAexlbty5KMGlhUkEP3KAy1UuHrYLAtc2ls70TJBvfeC6A7kZMCHf?=
 =?us-ascii?Q?O5xIYNTdoNTzvAlOTVi//YcVxlG4Jy/Bz4RQ7Rl7zrncbvb71aJjI1rCYvaV?=
 =?us-ascii?Q?3LdBnNMI6rHmW3K0nNKzfaP6RN/whoXyGXmMB2Z/YqH4TOJQY0KCGb2XRFX/?=
 =?us-ascii?Q?ExgpGZcCJqKiP0PnFilMgi8mP+bE5CUMA0M9xxrzBcqsjKdXGqo/ZUj1scXd?=
 =?us-ascii?Q?QhqjVsFJUbfvwDsGZQRSNybQXxGZH8jS05QGB8QtihLy9KXja7ASWkFtwybW?=
 =?us-ascii?Q?5r417ioomKx64Am/0W7AFug0gi6pgRbR3I6eUUPvm0XG3FWWRv4G8rGqZYwr?=
 =?us-ascii?Q?xxeoCltwohE7u/E9SgmhdDnapLBKJ1Ayp5TB6KItu0WsFPbnqYeYMyyBd9Ho?=
 =?us-ascii?Q?xoGTLWY1AL6Si0RFUMdik6nMs/3KVfS7OrdWZwrW73Yfgo2ELfJnq58rYrEY?=
 =?us-ascii?Q?XDHU1crz39IsiM4q6hzsPeTRpwn8t0EzGQewhAYu9HnuOvO3XZKtA7+NVkca?=
 =?us-ascii?Q?KDRX+Noj9DLb8Nz4GPYk1zehDSOX07CiIgfZ8aWgV5Yfc6mNWb25TNMyWt3v?=
 =?us-ascii?Q?K1+pjtf+pFPIKXWT8NJExSZAcWJnHwSaV2VAf0bPNQBfKxP38TvZoFcf75SY?=
 =?us-ascii?Q?umWrvNiPsKiGoKh96EJI6Svogr5FWA4N9Alay6bc7h9xb/qo07qBDx9Y18BY?=
 =?us-ascii?Q?bA+xXn+AEq8XWbazKxT0PUmu6fQoYSKR25ArpP/OOLy57UZBJwVzTQFHzbJy?=
 =?us-ascii?Q?kCqTx5sIxRXlFI5Py09ENRvNsNgckL3L7lBSmtFR8NcyaHrqoDqEWiDrgMdJ?=
 =?us-ascii?Q?S5WgylzreK+aLePwtmjgQeEVeY4EjiShAt7euyYz2RHoxW2hRkfAk23iKwdl?=
 =?us-ascii?Q?pxobBXPKLpFYQXfE0PDVcI7f5A/L/ft2xE77yE2JuG2KSgI3AayywqoPQV7j?=
 =?us-ascii?Q?LWOQFko3P0vunYBYJXHeBBUcitSzRCILTnKrdqyzl4pLibcBkYtSFhtixjdx?=
 =?us-ascii?Q?rfq6QlMojTBS0umd7Ah0Wxtu3tTsI7DGj+yFzNYJdD6ljHZXFO/IsykNfz1R?=
 =?us-ascii?Q?m7+nqb1cwh6BNxaXMW0LUgFh59DCwqaX6ZWAzd/R8EJmZlrAb+kQxuMg8U0N?=
 =?us-ascii?Q?kF9rwtoYI5DJDh12Wq1gjMQUMeI4mbOG/8pdSxL1DFOOdF1WFHFxH2KJ6KpI?=
 =?us-ascii?Q?z0uCknysyiKzfUHw0/eAHovQKqSNUpDbzGR9uVaDOUzMLHpHmpCcNW+EKQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:18:12.9849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abc85a80-cb44-4dfe-8938-08ddbae41563
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9397

This commit documents feture bit 42
VIRTIO_NET_F_GUEST_RSC6

Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
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

