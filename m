Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73812E7E
	for <virtio-comment@lists.linux.dev>; Fri, 27 Jun 2025 04:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750998043; cv=fail; b=TQQaZtPtWMMu8G3gm1798NyrQ7gINzviCpaK9BFcpTY92dY3ukTB1iEbhrT5YWNh7DzTvTi6snoJ1azhXFMFPfSwmGfQfD9O6ekbIVGmL+NXJzgpf9lUKcZr/BO05vzWDRXfg/SmpbFOZU60HDFOvVOgGAXCm9cjLaDGg+5SUyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750998043; c=relaxed/simple;
	bh=W90DMb/uAR+UhT7HIYBy5obs4yJ+oAgw+D6uKbu1jw0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZkDZL3BCeqGcF1sVmvADb3OXvVrqkwkWx98THRseFhfdRgZ7EAeBZgYs68v3ZUMxuA/VgLRPc6Q6jik5F8o7mfsfVGpfhL8xBRa9oV4xTV66iKmezFl1jSglVE8dIsnb2LEUlVZ2YtSNYwTiRt9LgikZG4677891oRT06Y7HuI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VbRafsZd; arc=fail smtp.client-ip=40.107.237.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VbRafsZd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sx3ghwCP6cys+2Jj1yAi95v0hb7aqEveyapVzJv79e3gH+7LhKSedIFwP89xGT9kT72nJSxVeflaIwNtYfbBxzjshya3KfW2Zp1MHak4gjLtiAjgCNgj9GVYmNr8T64WAQgpQbPKulXuAKit/cH4ZWVG6Bkrh2KJAnqYhmYl24pfB79BXsZasuj8BUq0a72CDfLQddnvkZF8+xOafIwtLBiI3G0LyfmN3dexhfK2qQXbh+13Mnb4lBhrk06jLfVQgRlTHcMYgn55HcoUlfanhVty6zLNlF+FQ9I7tUPCiw5da+9qmcPrWuq0nvP/LpN22Csh5VfC7rjsNvxs6s+NLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGFTwdSuAz4M0quNwrnXrKBCA9NoQ8v4ckJBTKAtDT4=;
 b=zAuVGTAcL4x1D0wCAV83yUpenKRhKtDyxQbHMcoBaG/Vo7UofcxC1Bwm+0gw0fon5awIYNK0F5CSPXjGdwJx5XNQx9lJGKaebgGBXagyCTtdcixOosQQn5nUTSEL4Coju+A3bFke0H3mJsr87o4qKF5ZGwAs5w5ujeMzfKeWx4Pya/oTzJJ8cv9xPTf+/vU2nW7vcDggtxKPfYjgdrpaD6OoxHzeEm5iFVaO9GvVzt7uBR6mbHJlMBhNMo46rkwy1NZL0NBjuA6rDv/KuElsjSYJIItiogEHYbydKZKC0pxUyyfF2yHTSJ58oKswWERhUmN27BnFUea2/uQgJsaoGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGFTwdSuAz4M0quNwrnXrKBCA9NoQ8v4ckJBTKAtDT4=;
 b=VbRafsZdietBh9ciEyLH5CKgZA5Y3gquQRhUgr+UjZCRVtRcQRipv2NtttYEjKVEN4XJU/Q7AWYtAC28HDhKztcxfip+z+F8CSiL+ALhq6jBesqkHrqTimc8wmFyW7HzuWZ5o23Ds6z4kYEQ5u7yNpY8G/Xwn9+d1OcCk9EahgcY57iLF+aVP2CyofSalHz6qmWbI5JhaNi7QAxj2eMfOSx2EwPFO4WHRBfdiQDz6jj5f95GQrVtDjPuy8WiqrQTktcxS8uWTncMU1p0UUHVXC+rf1RtdeftNS0GJgiWO8bTcOmyFKLw2xOBD+kodONjCUgTYAJyahnlrEDokvFkuQ==
Received: from SJ0PR05CA0118.namprd05.prod.outlook.com (2603:10b6:a03:334::33)
 by DS4PR12MB9708.namprd12.prod.outlook.com (2603:10b6:8:278::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Fri, 27 Jun
 2025 04:20:37 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::f6) by SJ0PR05CA0118.outlook.office365.com
 (2603:10b6:a03:334::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.7 via Frontend Transport; Fri,
 27 Jun 2025 04:20:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 04:20:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 26 Jun
 2025 21:20:22 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 26 Jun 2025 21:20:18 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH] introduction: Clarify RFC 2119 key words usage
Date: Fri, 27 Jun 2025 07:19:54 +0300
Message-ID: <20250627041954.400922-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|DS4PR12MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec0ff7b-26f2-4b66-d46c-08ddb531f7f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C0b+iwnW0hFV2ehQBLaZzw7gQUwgVEFBUKeJYnyapte4kHJ1sQO4499f4xXc?=
 =?us-ascii?Q?EiNLMQSez5oMfr3Oz3XUHGpK4YRvbWTH1Kon2kdHXJWbMwjPVjK0fHFk58Oo?=
 =?us-ascii?Q?06QYZgW1wGGiZu+U/6rioWvCeFkSVMScrABDaCo2qVKccfCiQKVfebeG99en?=
 =?us-ascii?Q?ao+fjMowuAQZd/Sc18ZXY/azU/7OOxXFqSuvFY+fQDJm8BVMbhR9ly1l8NZ6?=
 =?us-ascii?Q?RB3I8Hy3QjUeHpxZIA+rY1QeTyR+FSVEHqs4QwNOG6pbBRPJPj/6O3V9Jl3l?=
 =?us-ascii?Q?uNOMShAKaOUqQw0rXexiqvLKqCb7PZqTEexwT1A8Ng5zqWiugzC6cruvKrnc?=
 =?us-ascii?Q?Sw1hKHjLBNXUtZmgbALqVw/lcjblB5SUS8J9lH+NIQpCBSz0y1KttbMgq5/Z?=
 =?us-ascii?Q?Yzfgk9LeYTe5EYLI8hv7GWvRUIAlZ0cVN8X9wuEycADcyfzOjszphJhM/gxW?=
 =?us-ascii?Q?248UKighjZZ/ENLDwEHeQSQzykIENQ34xYDH3l8eZz6oGhlClZOwnXtRXd7i?=
 =?us-ascii?Q?kX8SRxxQ2ooygDVzXGwcB0lXGoIsaVnXG0dHhCj/MHOHmTRbtv4VSZICGuUO?=
 =?us-ascii?Q?HBW74ORwEjJdZ/UxE9aNYXSphXs3mvfLMBcDVSjOJp53jYxkN2Rp3CWSXJ/N?=
 =?us-ascii?Q?/w9xrpLPXlNxdbxuyooNdCLroaLQzIrM1BKixITptH0eKSG13kPc6KM3+grq?=
 =?us-ascii?Q?874e5pkccY2LS0l8T3+3PKtsABuTzOWv8tLE/rtEx4i0l6Qr83eGgTG06H/7?=
 =?us-ascii?Q?JZ/FWso8Wvg3Xq7QoUs8j3HT0W+OuBl+CaZ8/QCUhRdAYlzDrQN9YaofJtCL?=
 =?us-ascii?Q?0nbjuBm/mAnc3eQdaw3kzDyBC+nmH7rv3/g5Arl/KqkcPFF+OWVB5wFATlh4?=
 =?us-ascii?Q?aI6ES0DFq8Vm09k+iC4jT8igxzM2Sc/8M+lQry02/+YrReW4tgz4vOuXrEPV?=
 =?us-ascii?Q?c66fsqxt6M4+oDzAQggzqTH4ihBQD2npFE4f+iZAHNmG9s6wWpsAlxqcnX9a?=
 =?us-ascii?Q?VMWxaPSfXMbOzurukv6nwbDMFWRjfVKstTe/HwctK6iupOujG1XakGFB1PBd?=
 =?us-ascii?Q?gFyro4svpTmGJc0X+jHd3+NcX+8cI4ezBe2VgS/gmR+d7QllOheMzTBgtWrv?=
 =?us-ascii?Q?BVyt3VxNPIp8kqqlYbP8eBF8jEkIyTmJAzLcbJL8wEOOELB5j0BWxbq/rt4p?=
 =?us-ascii?Q?F1ELYzdSp3gUn+DUXp2js0Xtq491DasrRDdgNOWZuVdaeUPvmqX+9i4Xea7f?=
 =?us-ascii?Q?2VV1kieaosLZB5xihpEIQqQUuVeS2OxgsB6cO7bz40dedp7KWh09cIKTaa5Y?=
 =?us-ascii?Q?3uYPdeI5plfYub6YMzzmPZqurG+h6YA8JBeLh1j5PrLDYzoTX0YAO6JK21Li?=
 =?us-ascii?Q?mZuH34nFITWjsW9Xz7Qtt8do8jRx1j1l/fDEOvkh5mSePmmW1PDMXoDc9XG4?=
 =?us-ascii?Q?8VmEH4oCebou/tJZX9gQj2lYVvrSxUEWmt8UFGlt82xemRIxCEjsqTNo5rY+?=
 =?us-ascii?Q?qFBKjEu3NBzuyMm9RzQcbUCTgOsKfF3hpFVlHoyrjMMDZ5sWIleADEcsMQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 04:20:37.4239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec0ff7b-26f2-4b66-d46c-08ddb531f7f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9708

RFC 2119 key words should be used in Requirements and Conformance
sections; these key words to be avoided in rest of the sections.

The motivations for such clarity are:

1. To clarify the intent:
These key words carry precise semantic weight. When a spec says MUST,
it means compliance is not optional. Using such terms in general or
explanatory text risks misinterpreting guidance as a requirement.

2. Avoiding Ambiguity:
If normative language is used in non-normative (informative) sections,
it becomes unclear whether the reader is required to follow it or
if it's just background or suggestion.

3. Informative sections explain context, rationale, or examples.
Normative sections define rules. Mixing the two muddies the structure
and weakens the authority of the normative part.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/230
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 introduction.tex | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/introduction.tex b/introduction.tex
index 80aa67a..4e7ab59 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -196,7 +196,10 @@ \section{Terminology}\label{Terminology}
 ``SHOULD'', ``SHOULD NOT'', ``RECOMMENDED'', ``NOT RECOMMENDED'', ``MAY'', and
 ``OPTIONAL'' in this document are to be interpreted as described in
 \hyperref[intro:rfc2119]{[RFC2119]} and \hyperref[intro:rfc8174]{[RFC8174]} when,
-and only when, they appear in all capitals, as shown here.
+and only when, they appear in all capitals, as shown here. The use of these
+key words is recommended in the Requirements and Conformance sections and should
+be avoided in other sections.
+
 \subsection{Legacy Interface: Terminology}\label{intro:Legacy
 Interface: Terminology}
 
-- 
2.34.1

