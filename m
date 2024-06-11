Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F04254F8C
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 17:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128680; cv=fail; b=qFJ+LQhgfa+famPEbjkCHsZeKED0GHFs0fw1BHVU7rEh3BJNzqgKqXPvFhLheAHyhDeJ53lq0Pjg76xuS0zx1G9rO7MZbtYZufTntV1dHkSKrIMICLdZX7lLa1/aXeyt2Zy1hf8eMExZFjm7xeLUYFQ0pLl7cOoYXaE95jndaVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128680; c=relaxed/simple;
	bh=79MpBvlfwgPZHcA8BLIfuu9JK5HYBcXOGLOhKnParNc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fO80YRkGrkB3yeT2rhhc4RQJNmrnCQSsEyQRmkTdb6tBHsXAagkbKVJo6qSxZHGiUjQzaT4/L2E9txjWcOc99jCPkyBzrC5YJUTfTUMa+EDx+UX5aeqzhkzpUlnr+s2Qf9lxU/C3zuOEEOdiW8YFvHGGz7S8j26GVeDn2u9EboA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YuujMD3f; arc=fail smtp.client-ip=40.107.244.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YuujMD3f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dj0MtlCr5kdqgNJ8HnCmcDBO7GYFxmjKErrecnSgMLAtEMElMeJs9zyHz9m/9RV2QW0EP8kaUI/2zlxsgfdYsYD20UcQ63LWuMMbOlu+zFinB7BMl3T2J8NfQZz95RmygxgPh1UdyHKd24PDzxu+WrTAKUKpUJciKocPCQBeVBR/w4WvQoXTjoPd5FH5QbaLS+ayrF6if3Ic3DeOueOjEzcu5cJXUufl6XgPXmjQkrIiyOilyg4rzEMQqW3qploWL1NSIk6JlkktJBGfPLKsiv++s45185EQidzmzFKk6vA8+SD55vLvwRWW6J/4lljzruib2JA4QcKxqoWKLrsvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9y+O3HxTzi1rFNruoh1dODr5+Gy7/3yRY34xyTyt8Q=;
 b=O+8l5EgZAenvkuJnx+eAAyVKDBLFEpe8h5fpwMOJU8KxOaB5h9riABS1tUzAw1XFRzwTUTfsRlbE6txv/m9OmcjhloLzwMkF5urbrNMrP82m2TdNLGHZfiMmgymSkI551B3f2d0Nd7WqXEFq2i6TbU/m2V52OarY4fAXjbjv/PgLmD3vPBd+WpdxEqg63OwfqcX/zKCVeLu5cfweUt/a1JDc5lYWa/ltJcLLcfa/ornFPJg+kqd8J5ijn03ELd86M7pdKuz36jskpBvcf8SvEA1+xGtgI9WZJC9Il0uwjfoOoLzAhQOTFohfXs3DDOLc0E4Ddpd7sD2ctcU3q1vxeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9y+O3HxTzi1rFNruoh1dODr5+Gy7/3yRY34xyTyt8Q=;
 b=YuujMD3fcjQPualXQgPBCwQDOYFjOeBIvKcBwq/uj2FAdyI/TK8WwP70wv8skAiQu5hFemZt7pU+WLWbYNprGPA0GchTfdV49WKN3tXhzI17RPzOs8zRl53iUGUedaSVJr0e2xIETbttWFeGx0F1vBsHb3QjXNGb6OjXnWmqm5hd7glb1LNtkAbmOiUANjLUvpgQZt4gaziIlgv/GPNIbscl/khyJ2lB4IAwkY8SEWzN7pHsT+r1qtPqs2v6eBBde5XyzXlkA685saAx7jDHsmu/XThR5XF5LkHWJUuRO053p6XFMKK6eNpx5PHPrRN2/TXcMq7xiPbAGPp+Q0wVYQ==
Received: from BN9P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::9)
 by IA1PR12MB6281.namprd12.prod.outlook.com (2603:10b6:208:3e7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 17:57:56 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:13e:cafe::a6) by BN9P220CA0004.outlook.office365.com
 (2603:10b6:408:13e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17 via Frontend
 Transport; Tue, 11 Jun 2024 17:57:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Tue, 11 Jun 2024 17:57:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Jun
 2024 10:57:36 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 11 Jun 2024 10:57:34 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: Parav Pandit <parav@nvidia.com>
Subject: [PATCH] content: Add link for the feature bits chapter
Date: Tue, 11 Jun 2024 20:57:21 +0300
Message-ID: <20240611175721.2550759-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|IA1PR12MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: 9610df85-8e54-42e1-35ff-08dc8a4005e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230032|1800799016|82310400018|376006|36860700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vWlg6J9uSdHfDx5Ri5Tr0x5X5ogsBzl8qybTcESoLZZ4YEKeCeVcUSZasWQX?=
 =?us-ascii?Q?BRDunJbwbYcbcOdJNsVVLaR8v5A92nhsEzINuZJmxetppwoCces0Xl2Dbdod?=
 =?us-ascii?Q?TyHocFtUOl2gbFV2ISDILo1InBoTRhfRFgWWbEPgjgTtqxpeR0FS5J5PhiWd?=
 =?us-ascii?Q?v7irCYsWqxPStxp53rycYo8/bZUJAJTeczpbH/iFtNeTWjAlVPGCkow+bZVA?=
 =?us-ascii?Q?QzrNH7NNgGgCmUsaLCUQJAGCGUK/7sLPpD9RoQ7zquDp+SVZl089Yi7gNa63?=
 =?us-ascii?Q?SW4gQtfhK9Wo9MYzUF5JYwYR9JzXjASLk7vZKTG7BRkuHaPm36BYanEKE7Uf?=
 =?us-ascii?Q?k2SeMVR/VdAMyD+fHkpCAS/C9fujrp73VDZp1z9anYf0bN8RZsxtaZbWdX8b?=
 =?us-ascii?Q?OtuGuo9I/V+saqhAKp+YBG+Wf4mQXElkx68WxF8H8/aOYX84k856W7Sigxm6?=
 =?us-ascii?Q?UFoTFen0at1XvLBuC54b2CjQ6/llsNKaRH7AQ/oyuJYXmcznYOFNF74e9kBd?=
 =?us-ascii?Q?OOVnY550Dj3zwdSlIYULtU9eaJ92oUOliZjHhF2+XqX8bTZMlQLOSnA5QYtN?=
 =?us-ascii?Q?qCn93J8CovFGFh+G2Q2aWu4igw1kcgOLwOKz6NHL44uZvQdCVWtluiIrD6MV?=
 =?us-ascii?Q?eJsXNxh1kc7eVeCHAGBgrhlAN04yn5tSj3SvM7hGd3kTyGy0aC9sMDpjsInq?=
 =?us-ascii?Q?MY/VFYXqola8j6iR3pjQdrngMDyMvGA3qHFg13XZY6KqM72TWxGWFnILUz8F?=
 =?us-ascii?Q?gDCOBckLrhk2ky57y1bP4RycTGPAXWu28dQwGbeyLdSFZ3a2JunhZkz7kFf2?=
 =?us-ascii?Q?ZNVGoryg5JgKghYj3kHSe5yEM9UtfuRbpDwnUunNCFzripltIn124cvuKGzq?=
 =?us-ascii?Q?ZyK+zzEveVdERCuQTpCVUPP0NYpOQBA+bBTBFFIXIeJBam9cf5GoVr8cmROC?=
 =?us-ascii?Q?uKsnD4KOpVduDBqlKsIPmXuMEa8A0HaCuMdtodYbneh0K9M1+lguXDfelEYY?=
 =?us-ascii?Q?rI5HLE2unndRgxDkPZTyU8y7o0ZUNJEfj+gy8u1140YqzVb4MKsscyuMzdNU?=
 =?us-ascii?Q?UP7tokJoLLde5DqC/1mwfCLNmRPhCB+0Z/fomv9JyQDC4nDFb/TGl6CTp285?=
 =?us-ascii?Q?PRyNOKXv63dfxw5eZCRkr9X95+Sf8FBW2D/9PGuKGr41YtDG7OOmXJK1DTIY?=
 =?us-ascii?Q?A7iA91it0gKdtEMVnj3GFmaMlI0Mr5oVJ15eGpzHRWq4Ldykgc36GnLA2o+9?=
 =?us-ascii?Q?lFahbnHI3cLTapDxlzMIVx48WAIjwjI2TnZxzF7f6bYU3rMLNkViDL3aA7fZ?=
 =?us-ascii?Q?/pj/PaPA30z2L9inB/eGvf0WRoADlmmTfvDYxzoEuGCl067xMvY5bgKbifoY?=
 =?us-ascii?Q?9AHc8MSC36qjkmlpafnwu8SVdfeQTOSg4r7gQteSjHpK3Me4VA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230032)(1800799016)(82310400018)(376006)(36860700005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 17:57:55.7984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9610df85-8e54-42e1-35ff-08dc8a4005e1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6281

Device common feature bits overview in the basic facilities and
their actual description are apart by 24 chapters.

Help reader to directly reach out to feature bits definitions from
the basic chapter.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 content.tex | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/content.tex b/content.tex
index 8849522..c3531e2 100644
--- a/content.tex
+++ b/content.tex
@@ -97,12 +97,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 Feature bits are allocated as follows:
 
 \begin{description}
-\item[0 to 23, and 50 to 127] Feature bits for the specific device type
-
-\item[24 to 41] Feature bits reserved for extensions to the queue and
-  feature negotiation mechanisms
-
-\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item\textbf{0 to 23, and 50 to 127} Feature bits for the specific device type
+\item\textbf{\hyperref[sec:Reserved Feature Bits]{24 to 41}} Feature bits reserved for extensions
+to the queue and feature negotiation mechanisms
+\item\textbf{42 to 49, and 128 and above} Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
-- 
2.34.1

