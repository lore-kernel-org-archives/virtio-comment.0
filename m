Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06982146A92
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507788; cv=fail; b=WY/tDD2TUOlDVtRWF4JKftThgqQewE97MZXCdu57AeIa/HwUi7tcCEztq+JLZzWUUC0fv80PTHzHP57eY3GlKq0CeLdWt88CmXiw9dKTLlDY/18+d7sZPl+RBRH+VkPt4drN7RAVg1/LFegQfw49bmBXuANarLqL5KLpmD65WDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507788; c=relaxed/simple;
	bh=8OZWmnSNdK0y+BqVTbIR58WHMpePaz6lk4dnrTfAZ8I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FVOyDD2yxHi7O9momFWbDh2Tsc7GjRJXlfitD5GA2rWe8qx4YnCEa6HCqD8JS+UFlqRo9qvaheNN8q+rfJ5O2B2ChLJPsE99TxrOTnZMeSACzMY37oxA4vcCGtyBQdFLERnZBW5Y6qH6t6gkU7EY7+rfZ7vTQ5fhHJMCyiBGBZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ryH3U9te; arc=fail smtp.client-ip=40.107.244.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ryH3U9te"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hj34MD6kdbApGSbX4HLnNhRWG/+shZBKcpxbcbl+ClLG2pRmeBEZqam7g0CV2vCDzV72XtZjW5lw/KbJB3WMUrp3wN/qyuXFZ6pU7wVPF/OY3W2lOMaEzcSEnxLEyoscJ7JvLmH5B6jFlEqeb9V67mW5AMGUfX/YFF8L9yddo5hGV9Tb1+dY9D8pqppaW88S7J+tJ+3xVSSpuShKxueG2xoJpDUM5rQ4awU5BZuG1Zz0VBQ698QfnFUw+fA9LCNyr0qMdUlA11Si32GkjYLsL1CBukEKPtb4pN5fWpt8ihUXnkzfVh6GjFgjOamgPm2BXwKS1dlHTw3Q7Ev/kKJapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuoxdxgXCdA9Fx1onJBmNMdogjKdmgcXm2NoGlPIVFQ=;
 b=jb0cAsTq1ReFn2iXWSZ5Ui4BjsWGpWY0tYrb8TDs8tCKGEf/RVW5rpokAk6i/Xzv0pjtDfkfHN0nN6CoBMXf3iRXn1HfrpWbJWMhYn528iG/9vt2PKsPR7YJk2Cgal2MWAJDwNABCM0GZHwUG6TVPOKypNryRbf4k/pEtShfzA3MG3QW8EcoJj5BnDTRG5rL7uaRzjTlYucIaAzpx9YDuOZ4hWGptONDmzslg6UfAIaMvr6VHbrKfPoLDVnD4Cp3KV1A2BfRSUfZJUeMeWKtLuShPMZ+MnxqyBOYvvqoSJpS3H17XCJcVQzGbV7Zpm1HXhzf6EPdmh24mfkG+eiNow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuoxdxgXCdA9Fx1onJBmNMdogjKdmgcXm2NoGlPIVFQ=;
 b=ryH3U9te6gU9lJLAoYt2z4kJmsu0uvgMgd/cjNQZAIK8eSYqHkko90tvOLzD67+fYJCxkENN2vLEvRRod+0f3yinQNL2tsM48/ADhtKt6Z3dDyOsutc9NgYJlAiVisAjlxgaG1rmaIZYJCoArZ5HSBhah9+0YIKU8yyfDnp6PJgAncLZUr75N73H7QsNXy2KgQU6nuniSLedX0/62slgsRFs11Yj7Z2/wcHj/Ooyp3ozzBUpxORA1CwrFWRPQ7vGpWcFJBoXPjIHjW1GkFbPbSCRDgrdho+Z6Q7JQZNXmdph9tKOLIsHeD3cyAU3pAvNnqUiVWb9ZyiMC19vir9Hvg==
Received: from MW4PR03CA0217.namprd03.prod.outlook.com (2603:10b6:303:b9::12)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 13:29:40 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::ca) by MW4PR03CA0217.outlook.office365.com
 (2603:10b6:303:b9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Tue, 4 Jun 2024 13:29:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 13:29:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 4 Jun 2024
 06:29:24 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Jun 2024 06:29:20 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v11 01/13] admin: Introduce self group
Date: Tue, 4 Jun 2024 16:28:51 +0300
Message-ID: <20240604132903.2093195-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604132903.2093195-1-parav@nvidia.com>
References: <20240604132903.2093195-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|MN2PR12MB4109:EE_
X-MS-Office365-Filtering-Correlation-Id: beab55cd-fa3e-4df7-a854-08dc849a62c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Buw23wVometTmfSV+ow5I5LswJuRFyh0/XKgJDrR0LeDd3FB3/gtR5V1fNXj?=
 =?us-ascii?Q?zZAW/Cv59i7lcj4rKsbAZtz9pSBskwGck9M+CXGpx+cSxb3LvzQ8i/iJiXTa?=
 =?us-ascii?Q?wioVYnzG9TUKux4zzJ5FnCBo/bmSG9Wpnav7Q0+NZiP+ek1hWNy9xK2UkGUQ?=
 =?us-ascii?Q?b+FP/J2uYKigYs1ZEWWPcSKAawHYokW4Wyhz9jGq7jVhvRF5HN3zoOSe6+fO?=
 =?us-ascii?Q?6+CAkKqAsUf+0MuzZktSgEz1cSvndK1pn1b+adZRAuHgBk9B4rOk8BuKeNmW?=
 =?us-ascii?Q?QGRXUNL1Uatj9rJH2tNxSKQnn8AWzTdAGWRN/utcPxVDF8unhqfzqwROl5YQ?=
 =?us-ascii?Q?qzn7oCCUSTW0sB+KVZKTKiWMzELsc7hv4Qb3GoQsY3v1moFCRoHrQpd+KGrW?=
 =?us-ascii?Q?ckKHol6B7SeT1mvCSV2a8ZmfhIqGdq/DvIrEeujywwBYUsrdqQh6Oc24MUyA?=
 =?us-ascii?Q?qfUndfM3ks1H9wP/fThMgW+kcWl/ZfrIt4b2oQg4vyV3VESZ9eZ/ZviKTMf5?=
 =?us-ascii?Q?mHGGMlEEddjRm89diIrEcPCnMASPmYEYJoI3QuBSa9BsFyWznfUaLbnce3pF?=
 =?us-ascii?Q?tuaujIDSDf427pzFmpsSWo6Xu8m1HgiMDemF9bmVKUhN4scgvbdZ/GzKsgU0?=
 =?us-ascii?Q?WmRFYItCGiRJfFanShx0dZj0u7CO+jQXW4bERL1kofKj0xT30eE5tbHscXl/?=
 =?us-ascii?Q?7qqdqNMXN/FlNWXDlN/ykAzj3LfNXapy+s0l7W9sKuj0mCA7BclI76AHs8p2?=
 =?us-ascii?Q?vIOA0VTcgakee3mIJYzqhunmd5+X4ZgNU4hscJcYh88mX/YNfSvvPGSjERo3?=
 =?us-ascii?Q?0IpHyYSlXMu4ETiY2hivxk+PGoXKczGHzRFxllGr/v9aowR0OF1m5ywMa7Pm?=
 =?us-ascii?Q?D3Qc7TSttQtA5PwuUcnnxJfJGnZb0YuVRg9YjX7NSx7aSw9QYqbjIalvZ996?=
 =?us-ascii?Q?+1EjIL4NIDNOXUbzrjBTXPMxpK6omg8tfUI2B24rCR1/0DhNOGdyDqhEVLsq?=
 =?us-ascii?Q?/UFMxFOjneI9jneyo2FJ9aN+mXCsWFGfLKsfOKqma8cX41ukjvsmk7BGwjLS?=
 =?us-ascii?Q?78AAIkxU3DoGauT9mB7ddaQnvAlHOL1OXOvXqb5TrTH5boR0O2y/u0COGI4m?=
 =?us-ascii?Q?QDIHfm43O3zqAMzcO6yfnNdbMBglGMMX37uA4l2mmPCrI14xK2121l+IeUNG?=
 =?us-ascii?Q?j2kASHsWXjsABRa2HZvX/+hwtZn3lHQMBEJ9FP6dBuNem8Xn37wHqEW9YBaX?=
 =?us-ascii?Q?xdsHO84T0JHGMhUCOR7c6MGyrOu9tw2r0VaX5p4OuTjgwSosMx4vUhMriIls?=
 =?us-ascii?Q?nr2EqbFVQ8GKXe0TCIztdk08brHct/fXAFZYOj7D3da+OSG+7xnLXVI8W0W6?=
 =?us-ascii?Q?cOHa5bQgh8h5vQQoPU0LporKCn82?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 13:29:39.5508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beab55cd-fa3e-4df7-a854-08dc849a62c8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109

Define self group to control the self device itself.

Subsequent patches introduces the concept of device capabilities
and device resources which utilizes the self group to access
capabilities and uses device resources to refer to the device itself.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
changelog:
v9->v10:
- rephrase the self group description
- removed duplicate description sentence
---
 admin.tex | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/admin.tex b/admin.tex
index 0803c26..44e0f83 100644
--- a/admin.tex
+++ b/admin.tex
@@ -1,7 +1,10 @@
 \section{Device groups}\label{sec:Basic Facilities of a Virtio Device / Device groups}
 
 It is occasionally useful to have a device control a group of
-other devices. Terminology used in such cases:
+other devices (the group may occasionally include the device
+itself) within a group. The owner device itself is not a
+member of the group (except in the special case of the self group).
+Terminology used in such cases:
 
 \begin{description}
 \item[Device group]
@@ -10,7 +13,7 @@ \section{Device groups}\label{sec:Basic Facilities of a Virtio Device / Device g
         or owner, the device controlling the group.
 \item[Member device]
         a device within a group. The owner device itself is not
-	a member of the group.
+	a member of the group except for the \field{Self group type}.
 \item[Member identifier]
         each member has this identifier, unique within the group
 	and used to address it through the owner device.
@@ -37,6 +40,11 @@ \section{Device groups}\label{sec:Basic Facilities of a Virtio Device / Device g
 
 The following group types, and their identifiers, are currently specified:
 \begin{description}
+\item[Self group type (0x0)]
+This device group includes the owner device itself and no other devices.
+The group type identifier for this group is 0x0.
+The member identifier for this group has a value of 0x0.
+
 \item[SR-IOV group type (0x1)]
 This device group has a PCI Single Root I/O Virtualization
 (SR-IOV) physical function (PF) device as the owner and includes
@@ -78,6 +86,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
         /* Device-readable part */
         le16 opcode;
         /*
+         * 0       - Self
          * 1       - SR-IOV
          * 2-65535 - reserved
          */
-- 
2.34.1

